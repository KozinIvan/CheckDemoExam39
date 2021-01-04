
; 
; CheckDemoExam39 - Основной файл
; 
; Copyright (C) 2021 KI Corporation
; 

; Changelog

; v.1 (KozinIvan - KI Corporation - 04.01.21-19:23)
;   + Добавлен основной файл

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    ProgramName$ = "CheckDemoExam39 A Module"
  CompilerCase #PB_OS_Windows
    ProgramName$ = "CheckDemoExam39 B Module"
  CompilerDefault
    CompilerError "Ошибка идентификации ОС"
CompilerEndSelect

ProgramVersion$ = "1.0"
ProgramCopyright$ = "© KI Corporation"

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    XIncludeFile "linux.pb"
  CompilerCase #PB_OS_Windows
    XIncludeFile "windows.pb"
  CompilerDefault
    CompilerError "Ошибка идентификации ОС"
CompilerEndSelect

OpenConsole(ProgramName$)

SelectVM:
ClearConsole()
PrintN("===========================================")
PrintN("==                                       ==")
PrintN("==  Проверка демонстрационного экзамена  ==")
PrintN("==                                       ==")
PrintN("===========================================")
PrintN("")
Print("Выбран модуль ")

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    PrintN("A Linux")
  CompilerCase #PB_OS_Windows
    PrintN("B Windows")
  CompilerDefault
    CompilerError "Ошибка идентификации ОС"
CompilerEndSelect

PrintN("")
Print("Укажите машину (")

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    Print("L-CLI-A, L-CLI-B, L-FW, L-RTR-A, L-RTR-B, L-SRV, OUT-CLI, R-CLI, R-FW, R-RTR, R-SRV")
  CompilerCase #PB_OS_Windows
    Print("CLI1, CLI2, DC1, DC2, DCA, R1, R2, SRV1, SRV2")
  CompilerDefault
    CompilerError "Ошибка идентификации ОС"
CompilerEndSelect

Print("): ")
VMName$ = Input()

PrintN("")

If Trim(VMName$) = ""
  PrintN("Выход..")
  End 0
EndIf

PrintN("Проверка " + VMName$ + "..")
PrintN("")

CompilerSelect #PB_Compiler_OS
  CompilerCase #PB_OS_Linux
    XIncludeFile "linux.pb"
  CompilerCase #PB_OS_Windows
    XIncludeFile "windows.pb"
  CompilerDefault
    CompilerError "Ошибка идентификации ОС"
CompilerEndSelect

PrintN("")
PrintN("Запишите результаты!")
PrintN("")
Input()
CloseConsole()

End 0

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 89
; FirstLine = 37
; EnableThread
; EnableXP
; CompileSourceDirectory
; EnableCompileCount = 0
; EnableBuildCount = 0