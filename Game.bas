
DIM SHARED A(10000)
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
    IF cpoint = 10000000 THEN CALL levelup1
    CLOSE #1
    CALL tutorial
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
    PRINT "H= "; h
    PRINT "S= "; s
    PRINT "W= "; w
NEXT i
nameagain:
INPUT "Name your Character: ", Name$
OPEN filename$ FOR OUTPUT AS #1
WRITE #1, Name$, h, s, w
CLOSE #1
CALL tutorial
END SUB
SUB tutorial
CLS
PRINT "Welcome to the tutorial"
SLEEP 1
PRINT "Today you will learn how to play"
SLEEP 1
PRINT "Commencing Battle Training..."
SLEEP 3
CLS
SCREEN 12
CALL drawsim
PRINT "Welcome to the Combat Simulator!"
SLEEP 2
CALL drawsim
PRINT "Here you will learn the basics of fighting enemies, in fact, your first one is  this training dummy!"
SLEEP 4
CLS
CALL drawsim
PRINT "Type 1-4 to use one of your attacks"
attack1 = 0
attack2 = 0
attack3 = 0
attack4 = 0
useattack:
LOCATE 29, 1
INPUT "Select Attack:", Attack$
IF Attack$ = "1" THEN
    CLS
    CIRCLE (65, 155), 30, 15
    PAINT (65, 155), 15
    GET (35, 125)-(95, 185), A()
    CLS
    FOR x = 65 TO 470 STEP 5
        PUT (x, 130), A(), XOR
        CALL drawpunch
        FOR d = 1 TO 999999
        NEXT d
        CLS
    NEXT x
    CALL drawsim
    attack1 = 1
ELSEIF Attack$ = "2" THEN
    CLS
    CIRCLE (65, 155), 30, 6
    PAINT (65, 155), 6
    GET (35, 125)-(95, 185), A()
    CLS
    FOR x = 65 TO 470 STEP 5
        PUT (x, 130), A(), XOR
        CALL drawpunch
        FOR d = 1 TO 999999
        NEXT d
        CLS
    NEXT x
    CALL drawsim
    attack2 = 1
ELSEIF Attack$ = "3" THEN
    CLS
    CIRCLE (65, 155), 30, 4
    PAINT (65, 155), 4
    GET (35, 125)-(95, 185), A()
    CLS
    FOR x = 65 TO 470 STEP 5
        PUT (x, 130), A(), XOR
        CALL drawpunch
        FOR d = 1 TO 999999
        NEXT d
        CLS
    NEXT x
    CALL drawsim
    attack3 = 1
ELSEIF Attack$ = "4" THEN
    CLS
    CIRCLE (65, 155), 30, 11
    PAINT (65, 155), 11
    GET (35, 125)-(95, 185), A()
    CLS
    FOR x = 65 TO 470 STEP 5
        PUT (x, 130), A(), XOR
        CALL drawpunch
        FOR d = 1 TO 999999
        NEXT d
        CLS
    NEXT x
    CALL drawsim
    attack4 = 1
ELSEIF Attack$ <> "1" AND Attack$ <> "2" AND Attack$ <> "3" AND Attack$ <> "4" THEN
    CLS
    CALL drawsim
    PRINT "Try again"
    GOTO useattack
END IF
CALL drawsim
WHILE attack1 = 0 OR attack2 = 0 OR attack3 = 0 OR attack4 = 0
    PRINT "Good, now try out your other move(s)"
    GOTO useattack
WEND
CALL drawsim
PRINT "Good, Now youve mastered you're moveset, get used to it, they're the only ones  you'll get"
CALL tutorial2
END SUB

SUB drawsim
CLS
LINE (0, 205)-(640, 205)
LINE (0, 260)-(640, 260)
CIRCLE (65, 160), 30, 15
PAINT (65, 155), 15
CIRCLE (555, 160), 25, 4
PAINT (555, 160), 4
LOCATE 20, 1
PRINT "1) Punch"
LOCATE 25, 1
PRINT "2) Kick"
LOCATE 20, 40
PRINT "3) Fire"
LOCATE 25, 40
PRINT "4) Ice"
LOCATE 14, 1
END SUB

SUB drawpunch
LINE (0, 205)-(640, 205)
LINE (0, 260)-(640, 260)
CIRCLE (555, 160), 25, 4
PAINT (555, 160), 4
LOCATE 20, 1
PRINT "1) Punch"
LOCATE 25, 1
PRINT "2) Kick"
LOCATE 20, 40
PRINT "3) Fire"
LOCATE 25, 40
PRINT "4) Ice"
LOCATE 14, 1
END SUB

SUB tutorial2
PRINT "Your Health stat allows you to take more damage."
SLEEP 3
CALL drawsim
PRINT "Your strength stat allows you to deal more damage with physical attacks."
SLEEP 3
CALL drawsim
PRINT "Your wisdom stat allows you to deal more damage with magic attacks"
SLEEP 3
CALL drawsim
PRINT "The effect gets multiplied by the amount of points invested in a stat."
SLEEP 3
CALL drawsim
PRINT "I will give you a level for your hard work today."
SLEEP 3
CALL drawsim
PRINT "STATUS CHANGE: LEVEL UP!"
OPEN filename$ FOR APPEND AS #1
cpoint = 10000000
WRITE #1, cpoint
CLOSE #1
CALL levelup1
END SUB
SUB levelup1
again:
CLS
PRINT "Choose stat to pump: H,S, or W"
INPUT "Stat: ", Stat$
OPEN filename$ FOR APPEND AS #1
IF Stat$ = "S" THEN
    s = s + 1
ELSEIF Stat$ = "H" THEN
    h = h + 1
ELSEIF Stat$ = "W" THEN
    w = w + 1
ELSE
    GOTO again
END IF
CLOSE #1
END SUB
