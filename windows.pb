
; 
; CheckDemoExam39 - Остров B
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 04.01.21-22:10)
;   + Добавлен модуль

XIncludeFile "structures.pb"

;-CLI1

Global CLI1.VM
CLI1\Name = "CLI1"
CLI1\Domain = "kazan.wsr"
CLI1\Interfaces(0)\IPAddress = "172.16.19.68" ; DHCP ?
CLI1\Interfaces(0)\Mask = "255.255.255.192"
CLI1\Interfaces(0)\Name = "Ethernet0"
CLI1\Test\TestBO2 = "R1." + CLI1\Domain

;-CLI2

Global CLI2.VM
CLI2\Name = "CLI2"
CLI2\Domain = "spb.wse"
CLI2\Interfaces(0)\IPAddress = "172.168.20.99" ; DHCP ?
CLI2\Interfaces(0)\Mask = "255.255.255.224"
CLI2\Interfaces(0)\Name = "Ethernet0"
CLI2\Test\TestBO2 = "R2." + CLI2\Domain

;-DC1

Global DC1.VM
DC1\Name = "DC1"
DC1\Domain = "kazan.wsr"
DC1\Interfaces(0)\IPAddress = "172.16.19.65"
DC1\Interfaces(0)\Mask = "255.255.255.192"
DC1\Interfaces(0)\Name = "Ethernet0"
DC1\Test\TestBO2 = "R1." + DC1\Domain

;-DC2

Global DC2.VM
DC2\Name = "DC2"
DC2\Domain = "spb.wse"
DC2\Interfaces(0)\IPAddress = "172.16.20.97"
DC2\Interfaces(0)\Mask = "255.255.255.224"
DC2\Interfaces(0)\Name = "Ethernet0"
DC2\Test\TestBO2 = "R2." + DC2\Domain

;-DCA

Global DCA.VM
DCA\Name = "DCA"
DCA\Domain = "kazan.wsr"
DCA\Interfaces(0)\IPAddress = "172.16.19.67"
DCA\Interfaces(0)\Mask = "255.255.255.192"
DC2\Interfaces(0)\Name = "Ethernet0"
DC2\Test\TestBO2 = "R1." + DCA\Domain

;-R1

Global R1.VM
R1\Name = "R1"
R1\Domain = "kazan.wsr"
R1\Interfaces(0)\IPAddress = "172.16.19.126"
R1\Interfaces(0)\Mask = "255.255.255.192"
R1\Interfaces(0)\Name = "Ethernet0"
R1\Interfaces(1)\IPAddress = "200.100.100.2"
R1\Interfaces(1)\Mask = "255.255.255.252"
R1\Interfaces(1)\Name = "Ethernet1"
R1\Test\TestBO2 = "200.100.100.1"

;-R2

Global R2.VM
R2\Name = "R2"
R2\Domain = "spb.wse"
R2\Interfaces(0)\IPAddress = "172.16.20.126"
R2\Interfaces(0)\Mask = "255.255.255.224"
R2\Interfaces(0)\Name = "Ethernet0"
R2\Interfaces(1)\IPAddress = "200.100.100.1"
R2\Interfaces(1)\Mask = "255.255.255.252"
R2\Interfaces(1)\Name = "Ethernet1"
R2\Test\TestBO2 = "200.100.100.2"

;-SRV1

Global SRV1.VM
SRV1\Name = "SRV1"
SRV1\Domain = "kazan.wsr"
SRV1\Interfaces(0)\IPAddress = "172.16.19.66"
SRV1\Interfaces(0)\Mask = "255.255.255.192"
SRV1\Interfaces(0)\Name = "Ethernet0"
SRV1\Test\TestBO2 = "R1." + SRV1\Domain

;-SRV2

Global SRV2.VM
SRV2\Name = "SRV2"
SRV2\Domain = "spb.wse"
SRV2\Interfaces(0)\IPAddress = "172.16.20.98"
SRV2\Interfaces(0)\Mask = "255.255.255.224"
SRV2\Interfaces(0)\Name = "Ethernet0"
SRV2\Test\TestBO2 = "R2." + SRV2\Domain

IncludeFile "B.O1.pb"
IncludeFile "B.O2.pb"
IncludeFile "B.O3.pb"
IncludeFile "B.O4.pb"
IncludeFile "B.O5.pb"
; IncludeFile "B.O6.pb"
; IncludeFile "B.O7.pb"
; IncludeFile "B.O8.pb"
; IncludeFile "B.O9.pb"
; IncludeFile "B.O10.pb"
; IncludeFile "B.O11.pb"
; IncludeFile "B.O12.pb"
; IncludeFile "B.O13.pb"
; IncludeFile "B.O14.pb"
; IncludeFile "B.O15.pb"
; IncludeFile "B.O16.pb"
; IncludeFile "B.O17.pb"
; IncludeFile "B.O18.pb"
; IncludeFile "B.O19.pb"
; IncludeFile "B.O20.pb"
; IncludeFile "B.O21.pb"
; IncludeFile "B.O22.pb"
; IncludeFile "B.O23.pb"
; IncludeFile "B.O24.pb"
; IncludeFile "B.O25.pb"
; IncludeFile "B.O26.pb"
; IncludeFile "B.O27.pb"
; IncludeFile "B.O28.pb"
; IncludeFile "B.O29.pb"
; IncludeFile "B.O30.pb"
; IncludeFile "B.O31.pb"
; IncludeFile "B.O32.pb"
; IncludeFile "B.O33.pb"
; IncludeFile "B.O34.pb"
; IncludeFile "B.O35.pb"
; IncludeFile "B.O36.pb"

Print("Проверка O1: ") : If CheckO1(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
Print("Проверка O2: ") : If CheckO2(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
Print("Проверка O3: ") : If CheckO3(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
Print("Проверка O4: ") : If CheckO4(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
Print("Проверка O5: ") : If CheckO5(VMName$) : PrintN("Выполнено") : Else : PrintN("Не выполнено") : EndIf
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

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 151
; FirstLine = 101
; EnableXP