
; 
; CheckDemoExam39 - Остров B. Проверка критерия O4
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 07.01.21-01:42)
;   + Добавлена проверка критерия O4

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
  
  Dim Check.b(1)
  
  While ProgramRunning(Program)
    
    If Check(0) And Check(1)
      
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
      
      If FindString(Output$, "IsReadOnly")
        
        If Right(Output$, Len("True")) = "True"
          
          Debug "  Check(1)/IsReadOnly:True"
          Check(1) = #True
          
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
; CursorPosition = 62
; FirstLine = 15
; Folding = -
; EnableXP