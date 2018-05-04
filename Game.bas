DIM SHARED h
DIM SHARED hp
DIM SHARED enemyhealth
DIM SHARED karma
DIM SHARED Name$
DIM SHARED s
DIM SHARED w
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
    INPUT #1, Name$, h, s, m, cpoint
    PRINT "Name: "; Name$
    PRINT "Health: "; h
    PRINT "Strength   "; s
    PRINT "Magic "; m
    SLEEP 3
    IF cpoint = 0.0001 THEN
        CLOSE #1
        CALL start
    END IF
    IF cpoint = 0.0011 THEN
        CLOSE #1
        CALL night1
    END IF
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
cpoint = 0.0000
WRITE #1, Name$, h, s, w, cpoint
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
    CALL punch
    attack1 = 1
ELSEIF Attack$ = "2" THEN
    CALL kick
    attack2 = 1
ELSEIF Attack$ = "3" THEN
    CALL fire
    attack3 = 1
ELSEIF Attack$ = "4" THEN
    CALL ice
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
SLEEP 3
CALL tutorial2
END SUB

SUB drawsim
CLS
SCREEN 12
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

SUB punch
CLS
CIRCLE (65, 155), 30, 15
PAINT (65, 155), 15
GET (35, 125)-(95, 185), A()
CLS
FOR x = 65 TO 470 STEP 5
    PUT (x, 130), A(), XOR
    CALL drawpunch
    FOR d = 1 TO 777777
    NEXT d
    CLS
NEXT x
CALL drawsim
END SUB

SUB kick
CLS
CIRCLE (65, 155), 30, 6
PAINT (65, 155), 6
GET (35, 125)-(95, 185), A()
CLS
FOR x = 65 TO 470 STEP 5
    PUT (x, 130), A(), XOR
    CALL drawpunch
    FOR d = 1 TO 777777
    NEXT d
    CLS
NEXT x
CALL drawsim
END SUB

SUB fire
CLS
CIRCLE (65, 155), 30, 4
PAINT (65, 155), 4
GET (35, 125)-(95, 185), A()
CLS
FOR x = 65 TO 470 STEP 5
    PUT (x, 130), A(), XOR
    CALL drawpunch
    FOR d = 1 TO 777777
    NEXT d
    CLS
NEXT x
CALL drawsim
END SUB

SUB ice
CLS
CIRCLE (65, 155), 30, 11
PAINT (65, 155), 11
GET (35, 125)-(95, 185), A()
CLS
FOR x = 65 TO 470 STEP 5
    PUT (x, 130), A(), XOR
    CALL drawpunch
    FOR d = 1 TO 777777
    NEXT d
    CLS
NEXT x
CALL drawsim
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
CLS
CALL drawsim
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
CALL levelup1
END SUB

SUB levelup1
again:
CLS
PRINT "Choose stat to pump: H,S, or W"
INPUT "Stat: ", Stat$
OPEN filename$ FOR OUTPUT AS #1
IF Stat$ = "S" THEN
    s = s + 1
ELSEIF Stat$ = "H" THEN
    h = h + 1
ELSEIF Stat$ = "W" THEN
    w = w + 1
ELSE
    GOTO again
END IF
cpoint = 0.0001
WRITE #1, Name$, h, s, w, cpoint
CLOSE #1
CLS
SLEEP 1
CALL start
END SUB

SUB start
CLS
PRINT "Now it is time to go out in the real world, good luck!!!!"
SLEEP 3
PRINT "You leave the lab and walk down the forested path back home"
SLEEP 1
PRINT "You see something rustle behind a bush nearby"
SLEEP 1
again:
COLOR 14: INPUT "Check it out? (Y/N): ", X$
IF X$ = "Y" THEN
    SLEEP 1
    COLOR 7: PRINT "You walk over to the bushes and see a squirrel crawl over a sleeping man"
    karma = karma + 1
    SLEEP 1
    PRINT "The squirrel scurries off at your presence and wakes the man."
    SLEEP 1
    PRINT "The man seems homeless and asks you for food."
    SLEEP 1
    COLOR 14: INPUT "Give food? (Y/N): ", X$
    IF X$ = "Y" THEN
        SLEEP 1
        COLOR 7: PRINT "You give him your lunch, he thanks you, then you continue home."
        karma = karma + 1
    ELSEIF X$ = "N" THEN
        SLEEP 1
        COLOR 7: PRINT "You lie and say you don't have any food, then proceed on your way home."
        karma = karma - 1
    ELSE
    END IF
ELSEIF X$ = "N" THEN
    SLEEP 1
    COLOR 7: PRINT "You speed up and leave the rustling behind."
    karma = karma - 1
ELSE
    CLS
    GOTO again
END IF
cpoint = 0.0011
OPEN filename$ FOR OUTPUT AS #1
WRITE #1, Name$, h, s, w, cpoint
CLOSE #1
SLEEP 1
CALL night1
END SUB

SUB enemyturn
enemyattack = enemyhealth / 3
RANDOMIZE TIMER
enemydamage = INT(RND * enemyattack)
PRINT "Enemy attacks for"; enemydamage
hp = hp - enemydamage
END SUB

SUB night1
OPEN filename$ FOR INPUT AS #1
INPUT #1, Name$, h, s, w
CLS
SLEEP 1
PRINT "You returned home that night, your mom made you food and you went to bed."
SLEEP 4
CLS
CALL dotdot
CLS
PRINT "You hear something..."
SLEEP 1
COLOR 4: PRINT "STATUS UPDATE: Threat detected!"
SLEEP 3
COLOR 14: INPUT "Check it out? (Y/N)", x$
IF x$ = "Y" THEN
    enemyhealth = 500
    SLEEP 1
    hp = h
    WHILE hp > 0 AND enemyhealth > 0
        CLS
        CALL drawsim
        COLOR 4: PRINT "ENEMY INTRUDER: RECOMMENDED OPTION - KILL"
        COLOR 15: PRINT "Health ="; h * 5; "- Enemy Health ="; enemyhealth; "- Choose an attack:"
        INPUT "", x

        IF x = 1 THEN
            CALL punch
            enemyhealth = enemyhealth - 5 * s
        ELSEIF x = 2 THEN
            CALL kick
            enemyhealth = enemyhealth - 4 * s
        ELSEIF x = 3 THEN
            CALL fire
            enemyhealth = enemyhealth - 3 * w
            RANDOMIZE TIMER
            firechance = INT(RND * 2)
            IF firechance = 1 THEN
                PRINT "Enemy is set on fire!"
            END IF
        ELSEIF x = 4 THEN
            CALL ice
            RANDOMIZE TIMER
            icechance = INT(RND * 2)
            IF icechance = 1 THEN
                CALL drawsim
                PRINT "Enemy is frozen!"
            END IF
            enemyhealth = enemyhealth - 3 * w
        END IF
    WEND
ELSEIF x$ = "N" THEN
    COLOR 7: PRINT "You go back to bed."
    CALL dotdot
    PRINT "You awake again, now there is a knock at your door"
    COLOR 14: INPUT "Call out? (Y/N)", x$
    IF x$ = "Y" THEN
    ELSEIF x$ = "N" THEN
        COLOR 7: PRINT "You go back to sleep"
        CALL dotdot
        COLOR 15: PRINT "You never woke up"
    END IF

END IF
SLEEP 1
CLOSE #1
END SUB

SUB dotdot
CLS
FOR i = 1 TO 9
    PRINT ".";
    _DELAY 0.5
    IF i / 3 = 1 OR i / 3 = 2 THEN
        CLS
        _DELAY 0.5
    END IF
NEXT i
CLS
END SUB


