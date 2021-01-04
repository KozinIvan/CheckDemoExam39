
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


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 24
; EnableThread
; EnableXP
; CompileSourceDirectory
; EnableCompileCount = 0
; EnableBuildCount = 0