
; 
; CheckDemoExam39 - Остров B. Проверка критерия O2
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 06.01.21-15:00)
;   + Добавлена проверка критерия O2

Procedure CheckO2(VMName$)
  
  
  
  Select VMName$
    Case "CLI1"
      
    Case "CLI2"
      
    Case "DC1"
      
    Case "DC2"
      
    Case "DCA"
      
    Case "R1"
      
    Case "R2"
      
    Case "SRV1"
      
    Case "SRV2"
      
    Default
      ProcedureReturn #False
  EndSelect
  
  Program = RunProgram("powershell", "", "", #PB_Program_Hide | #PB_Program_Open | #PB_Program_Read | #PB_Program_Write | #PB_Program_Error | #PB_Program_Ascii)
  
  Output$ = ""
  State = 0
  
  Dim Check.b(1)
  
  While ProgramRunning(Program)
    
    If Check(0) = #True And Check(1) = #True
      
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
          If VMName$ = "R1" Or VMName$ = "R2"
            WriteProgramStringN(Program, "Get-NetIPConfiguration -InterfaceAlias " + InterfaceName(1)) : State + 1
          Else
            WriteProgramStringN(Program, "Exit") : State + 1
          EndIf
      EndSelect
      
    EndIf
    
  Wend
  
  ProcedureReturn #False
  
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 46
; FirstLine = 38
; Folding = -
; EnableXP