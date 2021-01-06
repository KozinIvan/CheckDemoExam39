
; 
; CheckDemoExam39 - Остров A
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 04.01.21-22:10)
;   + Добавлен модуль

XIncludeFile "structures.pb"

;-Настройки

;-L-CLI-A

LCLIA.VM
LCLIA()\Name = "L-CLI-A"
LCLIA()\Interfaces(0)\Name = "ens192"
LCLIA()\Interfaces(0)\IPAddress = "172.16.100.2"

;-Функции

Procedure CheckO1(VMName$)
  
  File = ReadFile(#PB_Any, "/etc/hostname")
  
  If File
    While Eof(File) = 0
      If FindString(ReadString(File), VMName$) : ProcedureReturn #True : EndIf
    Wend
    CloseFile(File)
  EndIf
  
  ProcedureReturn #False
  
EndProcedure
Procedure CheckO2(VMName$)
  
  
  
EndProcedure

Print("Проверка O1: ") : If CheckO1(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
Print("Проверка O2: ") : If CheckO2(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O3: ") : If CheckO3(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O4: ") : If CheckO4(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O5: ") : If CheckO5(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O6: ") : If CheckO6(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O7: ") : If CheckO7(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O8: ") : If CheckO8(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O9: ") : If CheckO9(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O10: ") : If CheckO10(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O11: ") : If CheckO11(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O12: ") : If CheckO12(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O13: ") : If CheckO13(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O14: ") : If CheckO14(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O15: ") : If CheckO15(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O16: ") : If CheckO16(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O17: ") : If CheckO17(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O18: ") : If CheckO18(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O19: ") : If CheckO19(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O20: ") : If CheckO20(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O21: ") : If CheckO21(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O22: ") : If CheckO22(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O23: ") : If CheckO23(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O24: ") : If CheckO24(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O25: ") : If CheckO25(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O26: ") : If CheckO26(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O27: ") : If CheckO27(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O28: ") : If CheckO28(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O29: ") : If CheckO29(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O30: ") : If CheckO30(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O31: ") : If CheckO31(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O32: ") : If CheckO32(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O33: ") : If CheckO33(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O34: ") : If CheckO34(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O35: ") : If CheckO35(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O36: ") : If CheckO36(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O37: ") : If CheckO37(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O38: ") : If CheckO38(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O39: ") : If CheckO39(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O40: ") : If CheckO40(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O41: ") : If CheckO41(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O42: ") : If CheckO42(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O43: ") : If CheckO43(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
; Print("Проверка O44: ") : If CheckO44(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf



; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 18
; Folding = -
; EnableXP