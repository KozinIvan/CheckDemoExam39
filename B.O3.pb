
; 
; CheckDemoExam39 - Остров B. Проверка критерия O3
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 06.01.21-16:15)
;   + Добавлена проверка критерия O3

Procedure CheckO3(VMName$)
  
  Debug "Запуск CheckO3"
  
  DomainName.s
  
  Select VMName$
    Case "DC1"
      DomainName = DC1\Domain
    Default
      ProcedureReturn #False
  EndSelect
  
  Program = RunProgram("powershell", "", "", #PB_Program_Hide | #PB_Program_Open | #PB_Program_Read | #PB_Program_Write | #PB_Program_Error | #PB_Program_Ascii)
  
  Output$ = ""
  State = 0
  
  Dim Check.b(0)
  
  While ProgramRunning(Program)
    
    If Check(0)
      
      KillProgram(Program)
      
      ProcedureReturn #True
      
    EndIf
    
    If AvailableProgramOutput(Program)
      
      Output$ = ReadProgramString(Program)
      
      If FindString(Output$, "Domain")
        
        If LCase(Right(Output$, Len(DomainName))) = LCase(DomainName)
          
          Debug "  Check(0)/Domain:" + DomainName
          Check(0) = #True
          
        EndIf
        
      EndIf
      
    Else
      
      Select State
        Case 0
          WriteProgramStringN(Program, "Get-ADDomainController") : State + 1
        Case 1
          WriteProgramStringN(Program, "Exit") : State + 1
      EndSelect
      
    EndIf
    
  Wend
  
  ProcedureReturn #False
  
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 50
; FirstLine = 14
; Folding = -
; EnableXP