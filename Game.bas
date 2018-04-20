PRINT "MENU"
DIM SHARED XpPoint$(100)
DIM SHARED filename$
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
    INPUT "", filename$
    PRINT "Is "; filename$; " ok?(Y/N)"
    INPUT "", Filecheck$
    IF Filecheck$ = "Y" THEN
        LET filename$ = filename$ + ".TXT"
    ELSEIF Filecheck$ = "N" THEN
        GOTO Again
    END IF
    PRINT filename$
    SLEEP 5
    CALL intro
ELSEIF choice = 2 THEN
    again2:
    CLS
    INPUT "Name of file: ", filename$
    PRINT "Is "; filename$; " ok?(Y/N)"
    INPUT "", Filecheck$
    IF Filecheck$ = "Y" THEN
        LET filename$ = filename$ + ".TXT"
    ELSEIF Filecheck$ = "N" THEN
        GOTO again2
    END IF
    OPEN filename$ FOR INPUT AS #1
    INPUT #1, Name$, h, s, m
    PRINT "Name: "; Name$
    PRINT "Health: "; h
    PRINT "Strength   "; s
    PRINT "Magic "; m
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
OPEN filename$ FOR OUTPUT AS #1
WRITE #1, Name$, h, s, w
CLOSE #1
END SUB
