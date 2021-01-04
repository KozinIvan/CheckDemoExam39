
; 
; CheckDemoExam39 - Остров A
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 04.01.21-22:10)
;   + Добавлен модуль

Procedure Check01(VMName$)
  
  File = ReadFile(#PB_Any, "/etc/hostname")
  
  If File
    
    While Eof(File) = 0
      
      If FindString(ReadString(File), VMName$)
        
        ProcedureReturn #True
        
      EndIf
      
    Wend
    
    CloseFile(File)
    
  EndIf
  
  ProcedureReturn #False
  
EndProcedure

Print("Проверка O1: ") : If Check01(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf

; Select VMName$
;   Case "L-CLI-A"
;     
;     
;     
;   Case "L-CLI-B"
;     
;     Print("Проверка O1: ") : If Check01(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
;     
;   Default
;     End 0
; EndSelect

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 50
; Folding = -
; EnableXP