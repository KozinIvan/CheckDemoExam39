
; 
; CheckDemoExam39 - Остров B. Проверка критерия O3
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 06.01.21-16:15)
;   + Добавлена проверка критерия O3

Procedure CheckO3(VMName$)
  
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
    
    If Check(0) = #True
      
      KillProgram(Program)
      
      ProcedureReturn #True
      
    EndIf
    
    If AvailableProgramOutput(Program)
      
      Output$ = ReadProgramString(Program)
      
      If FindString(Output$, "IPv4Address")
        
        If Right(Output$, Len(NetworkIP(0))) = NetworkIP(0)
          
          Check(0) = #True
          
        EndIf
        
        If Right(Output$, Len(NetworkIP(1))) = NetworkIP(1)
          
          Check(1) = #True
          
        EndIf
        
      EndIf
      
    Else
      
      Select State
        Case 0
          WriteProgramStringN(Program, "Get-NetIPConfiguration -InterfaceAlias " + InterfaceName(0)) : State + 1
        Case 1
          WriteProgramStringN(Program, "Exit") : State + 1
      EndSelect
      
    EndIf
    
  Wend
  
  ProcedureReturn #False
  
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 66
; FirstLine = 18
; Folding = -
; EnableXP