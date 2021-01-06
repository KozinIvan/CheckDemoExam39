
; 
; CheckDemoExam39 - Остров B. Проверка критерия O1
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 05.01.21-20:16)
;   + Добавлена проверка критерия O1

Procedure CheckO1(VMName$)
  
  Debug "Запуск CheckO1"
  
  Dim NetworkIP.s(1)
  Dim NetworkMask.s(1)
  Dim InterfaceName.s(1)
  
  Select VMName$
    Case "CLI1"
      NetworkIP(0) = CLI1\Interfaces(0)\IPAddress
      NetworkMask(0) = CLI1\Interfaces(0)\Mask
      InterfaceName(0) = CLI1\Interfaces(0)\Name
    Case "CLI2"
      NetworkIP(0) = CLI2\Interfaces(0)\IPAddress
      NetworkMask(0) = CLI2\Interfaces(0)\Mask
      InterfaceName(0) = CLI2\Interfaces(0)\Name
    Case "DC1"
      NetworkIP(0) = DC1\Interfaces(0)\IPAddress
      NetworkMask(0) = DC1\Interfaces(0)\Mask
      InterfaceName(0) = DC1\Interfaces(0)\Name
    Case "DC2"
      NetworkIP(0) = DC2\Interfaces(0)\IPAddress
      NetworkMask(0) = DC2\Interfaces(0)\Mask
      InterfaceName(0) = DC2\Interfaces(0)\Name
    Case "DCA"
      NetworkIP(0) = DCA\Interfaces(0)\IPAddress
      NetworkMask(0) = DCA\Interfaces(0)\Mask
      InterfaceName(0) = DCA\Interfaces(0)\Name
    Case "R1"
      NetworkIP(0) = R1\Interfaces(0)\IPAddress
      NetworkMask(0) = R1\Interfaces(0)\Mask
      InterfaceName(0) = R1\Interfaces(0)\Name
      NetworkIP(1) = R1\Interfaces(1)\IPAddress
      NetworkMask(1) = R1\Interfaces(1)\Mask
      InterfaceName(1) = R1\Interfaces(1)\Name
    Case "R2"
      NetworkIP(0) = R2\Interfaces(0)\IPAddress
      NetworkMask(0) = R2\Interfaces(0)\Mask
      InterfaceName(0) = R2\Interfaces(0)\Name
      NetworkIP(1) = R2\Interfaces(1)\IPAddress
      NetworkMask(1) = R2\Interfaces(1)\Mask
      InterfaceName(1) = R2\Interfaces(1)\Name
    Case "SRV1"
      NetworkIP(0) = SRV1\Interfaces(0)\IPAddress
      NetworkMask(0) = SRV1\Interfaces(0)\Mask
      InterfaceName(0) = SRV1\Interfaces(0)\Name
    Case "SRV2"
      NetworkIP(0) = SRV2\Interfaces(0)\IPAddress
      NetworkMask(0) = SRV2\Interfaces(0)\Mask
      InterfaceName(0) = SRV2\Interfaces(0)\Name
    Default
      ProcedureReturn #False
  EndSelect
  
  Program = RunProgram("powershell", "", "", #PB_Program_Hide | #PB_Program_Open | #PB_Program_Read | #PB_Program_Write | #PB_Program_Error | #PB_Program_Ascii)
  
  Output$ = ""
  State = 0
  
  Dim Check.b(1)
  
  While ProgramRunning(Program)
    
    If Check(0)
      
      If (VMName$ = "R1" Or VMName$ = "R2") And Check(1)
        
        KillProgram(Program)
        
        ProcedureReturn #True
        
      Else
        
        KillProgram(Program)
        
        ProcedureReturn #True
        
      EndIf
      
    EndIf
    
    If AvailableProgramOutput(Program)
      
      Output$ = ReadProgramString(Program)
      
      If FindString(Output$, "IPv4Address")
        
        For i = 0 To 1
          
          If Right(Output$, Len(NetworkIP(i))) = NetworkIP(i)
            
            Debug "  Check(" + Str(i) + ")/" + Right(Output$, Len(NetworkIP(i)))
            
            Check(i) = #True
            
          EndIf
          
        Next i
        
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
; CursorPosition = 104
; FirstLine = 74
; Folding = -
; EnableXP