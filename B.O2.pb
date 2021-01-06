
; 
; CheckDemoExam39 - Остров B. Проверка критерия O2
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 06.01.21-15:00)
;   + Добавлена проверка критерия O2

Procedure CheckO2(VMName$)
  
  TestTo.s
  InterfaceName.s
  
  Select VMName$
    Case "CLI1"
      TestTo = CLI1\Test\TestBO2
      InterfaceName = CLI1\Interfaces(0)\Name
    Case "CLI2"
      TestTo = CLI2\Test\TestBO2
      InterfaceName = CLI2\Interfaces(0)\Name
    Case "DC1"
      TestTo = DC1\Test\TestBO2
      InterfaceName = DC1\Interfaces(0)\Name
    Case "DC2"
      TestTo = DC2\Test\TestBO2
      InterfaceName = DC2\Interfaces(0)\Name
    Case "DCA"
      TestTo = DCA\Test\TestBO2
      InterfaceName = DCA\Interfaces(0)\Name
    Case "R1"
      TestTo = R1\Test\TestBO2
      InterfaceName = R1\Interfaces(0)\Name
    Case "R2"
      TestTo = R2\Test\TestBO2
      InterfaceName = R2\Interfaces(0)\Name
    Case "SRV1"
      TestTo = SRV1\Test\TestBO2
      InterfaceName = SRV1\Interfaces(0)\Name
    Case "SRV2"
      TestTo = SRV2\Test\TestBO2
      InterfaceName = SRV2\Interfaces(0)\Name
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
      
      If FindString(Output$, "PingSucceeded")
        
        If Right(Output$, Len("True")) = "True"
          
          Check(0) = #True
          
        EndIf
        
      EndIf
      
      If FindString(Output$, "NetworkCategory")
        
        If Right(Output$, Len("Private")) = "Private" Or Right(Output$, Len("Domain")) = "Domain"
          
          Check(1) = #True
          
        EndIf
        
      EndIf
      
    Else
      
      Select State
        Case 0
          WriteProgramStringN(Program, "Test-NetConnection -ComputerName " + TestTo) : State + 1
        Case 1
          WriteProgramStringN(Program, "Get-NetConnectionProfile -InterfaceAlias " + InterfaceName) : State + 1
        Case 2
          WriteProgramStringN(Program, "Exit") : State + 1
      EndSelect
      
    EndIf
    
  Wend
  
  ProcedureReturn #False
  
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 82
; FirstLine = 70
; Folding = -
; EnableXP