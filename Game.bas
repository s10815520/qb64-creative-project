PRINT "MENU"
DIM SHARED XpPoint$(100)
PRINT
PRINT "1) Create New File"
PRINT
PRINT "2) Name an Old File"
PRINT
PRINT "Else = Exit"
PRINT
INPUT "Choice: ", choice
IF choice = 1 THEN
    Again:
    CLS
    PRINT "Name of Save:"
    INPUT "", Filename$
    PRINT "Is "; Filename$; " ok?(Y/N)"
    INPUT "", Filecheck$
    IF Filecheck$ = "Y" THEN
        LET Filename$ = Filename$ + ".TXT"
    ELSEIF Filecheck$ = "N" THEN
        GOTO Again
    END IF
    CALL intro
ELSEIF choice = 2 THEN
    again2:
    CLS
    INPUT "Name of file ", Filename$
    PRINT "Is "; Filename$; " ok?(Y/N)"
    INPUT "", Filecheck$
    IF Filecheck$ = "Y" THEN
        LET Filename$ = Filename$ + ".TXT"
    ELSEIF Filecheck$ = "N" THEN
        GOTO again2
    END IF
    OPEN Filename$ FOR INPUT AS #1
    PRINT #1, Name$, h, s, w
    CLOSE #1
END IF

SUB intro
AP = 20
h = 0
s = 0
w = 0
CLS
PRINT "Choose Ability Points:"
PRINT "You have"; AP; "points."
PRINT "You can put them into Health, Strength, or Magic."
FOR i = 1 TO 20
    xpagain:
    INPUT "H,S, or W: ", XpPoint$(i)
    XpPoint$(i) = UCASE$(XpPoint$(i))
    IF XpPoint$(i) = "H" THEN
        h = h + 1
    ELSEIF XpPoint$(i) = "S" THEN
        s = s + 1
    ELSEIF XpPoint$(i) = "W" THEN
        w = w + 1
    ELSE
        GOTO xpagain
    END IF
    CLS
NEXT i
nameagain:
INPUT "Name your Character: ", Name$
PRINT "Is "; Name$; " ok? (Y/N)", YN$
YN$ = UCASE$(YN$)
IF YN$ = "N" THEN GOTO nameagain
OPEN Filename$ FOR OUTPUT AS #1
WRITE #1, Name$, h, s, w
CLOSE #1

END SUB
