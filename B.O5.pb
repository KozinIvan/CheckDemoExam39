
; 
; CheckDemoExam39 - Остров B. Проверка критерия O5
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 06.01.21-15:00)
;   + Добавлена проверка критерия O5

Procedure CheckO5(VMName$)
  
  DomainName.s
  
  Select VMName$
    Case "DC1"
      DomainName = DC1\Domain
    Case "SRV1"
      DomainName = SRV1\Domain
    Default
      ProcedureReturn #False
  EndSelect
  
  Program = RunProgram("powershell", "", "", #PB_Program_Hide | #PB_Program_Open | #PB_Program_Read | #PB_Program_Write | #PB_Program_Error | #PB_Program_Ascii)
  
  Output$ = ""
  State = 0
  
  Dim Check.b(4)
  
  While ProgramRunning(Program)
    
    Select VMName$
        
      Case "DC1"
        
        If Check(0) And Check(1) And Check(2) And Check(3) And Check(4)
          
          KillProgram(Program)
          
          ProcedureReturn #True
          
        EndIf
        
      Case "SRV1"
        
        If Check(0)
          
          KillProgram(Program)
          
          ProcedureReturn #True
          
        EndIf
        
    EndSelect
    
    If AvailableProgramOutput(Program)
      
      Output$ = ReadProgramString(Program)
      
      Select VMName$
          
        Case "DC1"
          
          If UCase(Left(Output$, Len("DC1"))) = LCase("DC1")
            
            Debug "  Check(0)/DC1 found"
            Check(0) = #True
            
          EndIf
          
          If UCase(Left(Output$, Len("DCA"))) = LCase("DCA")
            
            Debug "  Check(1)/DCA found"
            Check(1) = #True
            
          EndIf
          
          If UCase(Left(Output$, Len("SRV1"))) = UCase("SRV1")
            
            Debug "  Check(2)/SRV1 found"
            Check(2) = #True
            
          EndIf
          
          If UCase(Left(Output$, Len("CLI1"))) = UCase("CLI1")
            
            Debug "  Check(3)/CLI1 found"
            Check(3) = #True
            
          EndIf
          
          If UCase(Left(Output$, Len("R1"))) = UCase("R1")
            
            Debug "  Check(4)/R1 found"
            Check(4) = #True
            
          EndIf
          
        Case "SRV1"
          
          If LCase(Left(Output$, Len(DomainName))) = LCase(DomainName)
            
            If FindString(Output$, "Secondary")
              
              Debug "  Check(0)/SRV1 Secondary DNS server"
              Check(0) = #True
              
            EndIf
            
          EndIf
          
      EndSelect
      
    Else
      
      Select State
        Case 0
          WriteProgramStringN(Program, "Get-DnsServerResourceRecord -ZoneName " + DomainName + " | findstr " + Chr(34) + "A CNAME" + Chr(34) + "") : State + 1
        Case 1
          If VMName$ = "SRV1"
            WriteProgramStringN(Program, "Get-DNSServerZone | findstr Secondary") : State + 1
          Else
            WriteProgramStringN(Program, "Exit") : State + 1
          EndIf
        Case 2
          WriteProgramStringN(Program, "Exit") : State + 1
      EndSelect
      
    EndIf
    
  Wend
  
  ProcedureReturn #False
  
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 52
; FirstLine = 22
; Folding = -
; EnableXP