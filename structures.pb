
; 
; CheckDemoExam39 - Структуры
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 05.01.21-11:45)
;   + Добавлены структуры

Structure VMInterface
  Name.s
  Network.s
  IPAddress.s
  Mask.s
EndStructure

Structure VMTest
  TestBO2.s
EndStructure

Structure VM
  Name.s
  Domain.s
  Array Interfaces.VMInterface(3)
  Test.VMTest
EndStructure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 19
; EnableXP