;==============================================================================================
;=======================================<COMMAND FILE>=========================================
;==============================================================================================

;====================<BUTTON REMAPPING>====================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;====================<DEFAULT VALUES>====================

[Defaults]
command.time = 15
command.buffer.time = 1

;====================<SINGLE BUTTON>====================

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;==================<HOLD DIRECTION>==================

[Command]
name = "holdfwd"
command=/$F
time=1

[Command]
name = "holdback"
command = /$B
time = 1

[Command]
name = "holdup"
command = /$U
time=1

[Command]
name = "holddown"
command = /$D
time = 1

;====================<HOLD BUTTON>====================

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;====================<DIRECTION>====================

[Command]
name = "fwd"
command = F
time = 1

[Command]
name = "back"
command = B
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "down"
command = D
time = 1

;====================<RELEASE DIR>====================

[Command]
name = "rlsfwd"
command = ~$F
time = 1

[Command]
name = "rlsback"
command = ~$B
time = 1

[Command]
name = "rlsup"
command = ~$U
time = 1

[Command]
name = "rlsdown"
command = ~$D
time = 1

;====================<RELEASE BUTTON>====================

[Command]
name = "rlsx"
command = ~x
time = 1

[Command]
name = "rlsy"
command = ~y
time = 1

[Command]
name = "rlsz"
command = ~z
time = 1

[Command]
name = "rlsa"
command = ~a
time = 1

[Command]
name = "rlsb"
command = ~b
time = 1

[Command]
name = "rlsc"
command = ~c
time = 1

;====================<SUPER MOTIONS>===================
;----------------
;----------------LVL 3 Super
[Command]
name = "LVL3SUPER"
command = ~D, DF, F, D, DF, F, a+b+c
time = 32
;----------------MAX Super 3
[Command]
name = "MAXSUPER3"
command = ~D, DF, F, D, DF, F, x+y
time = 32

[Command]
name = "MAXSUPER3"
command = ~D, DF, F, D, DF, F, y+z
time = 32

[Command]
name = "MAXSUPER3"
command = ~D, DF, F, D, DF, F, z+x
time = 32
;----------------MAX Super 2
[Command]
name = "MAXSUPER2"
command = ~D, DB, B, D, DB, B, x+y
time = 32
[Command]
name = "MAXSUPER2"
command = ~D, DB, B, D, DB, B, y+z
time = 32
[Command]
name = "MAXSUPER2"
command = ~D, DB, B, D, DB, B, x+z
time = 32
;----------------MAX Super 1
[Command]
name = "MAXSUPER1"
command = ~D, DB, B, D, DF, F, a+b
time = 32

[Command]
name = "MAXSUPER1"
command = ~D, DB, B, D, DF, F, b+c
time = 32

[Command]
name = "MAXSUPER1"
command = ~D, DB, B, D, DF, F, a+c
time = 32
;----------------Super 3
[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, x
time = 32

[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, y
time = 32

[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, z
time = 32

[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, ~x
time = 32

[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, ~y
time = 32

[Command]
name = "SUPER3"
command = ~D, DF, F, D, DF, F, ~z
time = 32
;----------------Super 2
[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, x
time = 32

[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, y
time = 32

[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, z
time = 32

[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, ~x
time = 32

[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, ~y
time = 32

[Command]
name = "SUPER2"
command = ~D, DB, B, D, DB, B, ~z
time = 32
;----------------Super 1
[Command]
name = "SUPER1"
command = ~D, DB, B, D, DF, F, a
time = 32

[Command]
name = "SUPER1"
command = ~D, DB, B, D, DF, F, b
time = 32

[Command]
name = "SUPER1"
command =~D, DB, B, D, DF, F, c
time = 32

[Command]
name = "SUPER1"
command = ~D, DB, B, D, DF, F, ~a
time = 32

[Command]
name = "SUPER1"
command =~D, DB, B, D, DF, F, ~b
time = 32

[Command]
name = "SUPER1"
command = ~D, DB, B, D, DF, F, ~c
time = 32

;====================<SPECIAL MOTIONS>====================
;----------------Shop
[Command]
name = "SHOP"
command = ~D, D, x
time = 16

[Command]
name = "SHOP"
command = ~D, D, y
time = 16

[Command]
name = "SHOP"
command = ~D, D, z
time = 16

[Command]
name = "SHOP"
command = ~D, D, ~x
time = 16

[Command]
name = "SHOP"
command = ~D, D, ~y
time = 16

[Command]
name = "SHOP"
command = ~D, D, ~z
time = 16
;----------------
;----------------Special 1
[Command]
name = "SPECIAL1"
command = ~$B, $F, x
time = 16

[Command]
name = "SPECIAL1"
command = ~$B, $F, y
time = 16

[Command]
name = "SPECIAL1"
command = ~$B, $F, z
time = 16

[Command]
name = "SPECIAL1"
command = ~$B, $F, ~x
time = 16

[Command]
name = "SPECIAL1"
command = ~$B, $F, ~y
time = 16

[Command]
name = "SPECIAL1"
command = ~$B, $F, ~z
time = 16
;----------------
;----------------EX Special 1
[Command]
name = "EXSPECIAL1"
command = ~$B, $F, x+y
time = 16

[Command]
name = "EXSPECIAL1"
command = ~$B, $F, y+z
time = 16

[Command]
name = "EXSPECIAL1"
command = ~$B, $F, x+z
time = 16
;----------------
;----------------Special 2
[Command]
name = "SPECIAL2"
command = ~$B, $F, a
time = 16

[Command]
name = "SPECIAL2"
command = ~$B, $F, b
time = 16

[Command]
name = "SPECIAL2"
command = ~$B, $F, c
time = 16

[Command]
name = "SPECIAL2"
command = ~$B, $F, ~a
time = 16

[Command]
name = "SPECIAL2"
command = ~$B, $F, ~b
time = 16

[Command]
name = "SPECIAL2"
command = ~$B, $F, ~c
time = 16
;----------------
;----------------EX Special 1
[Command]
name = "EXSPECIAL2"
command = ~$B, $F, a+b
time = 16

[Command]
name = "EXSPECIAL2"
command = ~$B, $F, b+c
time = 16

[Command]
name = "EXSPECIAL2"
command = ~$B, $F, a+c
time = 16
;----------------
;----------------Special 3
[Command]
name = "SPECIAL3"
command = ~45$D, $U, a
time = 15
[Command]
name = "SPECIAL3"
command = ~45$D, $U, b
time = 15
[Command]
name = "SPECIAL3"
command = ~45$D, $U, c
time = 15

[Command]
name = "SPECIAL3"
command = ~$D, $U, a
time = 15
[Command]
name = "SPECIAL3"
command = ~$D, $U, b
time = 15
[Command]
name = "SPECIAL3"
command = ~$D, $U, c
time = 15
;----------------
;----------------EX Special 3
[Command]
name = "EXSPECIAL3(2)"
command = ~45$D, $U, a+b
time = 16
[Command]
name = "EXSPECIAL3(2)"
command = ~45$D, $U, b+c
time = 16
[Command]
name = "EXSPECIAL3(2)"
command = ~45$D, $U, a+c
time = 16

[Command]
name = "EXSPECIAL3"
command = $D, $U, a+b
time = 16
[Command]
name = "EXSPECIAL3"
command = $D, $U, b+c
time = 16
[Command]
name = "EXSPECIAL3"
command = $D, $U, a+c
time = 16

;----------------Special 3A
[Command]
name = "SPECIAL3A"
command = ~D, DB, B, a
time = 16

[Command]
name = "SPECIAL3A"
command = ~D, DB, B, b
time = 16

[Command]
name = "SPECIAL3A"
command = ~D, DB, B, c
time = 16

[Command]
name = "SPECIAL3A"
command = ~D, DB, B, ~a
time = 16

[Command]
name = "SPECIAL3A"
command = ~D, DB, B, ~b
time = 16

[Command]
name = "SPECIAL3A"
command = ~D, DB, B, ~c
time = 16
;----------------
;----------------EX Special 3A
[Command]
name = "EXSPECIAL3A"
command = ~D, DB, B, a+b
time = 16

[Command]
name = "EXSPECIAL3A"
command = ~D, DB, B, b+c
time = 16

[Command]
name = "EXSPECIAL3A"
command = ~D, DB, B, a+c
time = 16
;----------------
;----------------BMO
[Command]
name = "BMO"
command = ~F, D, DF, x
time = 16

[Command]
name = "BMO"
command = ~F, D, DF, y
time = 16

[Command]
name = "BMO"
command = ~F, D, DF, z
time = 16

[Command]
name = "BMO"
command = ~F, D, DF, ~x
time = 16

[Command]
name = "BMO"
command = ~F, D, DF, ~y
time = 16

[Command]
name = "BMO"
command = ~F, D, DF, ~z
time = 16
;----------------
;----------------Special 4
[Command]
name = "SPECIAL4"
command = ~D, DF, F, x
time = 16

[Command]
name = "SPECIAL4"
command = ~D, DF, F, y
time = 16

[Command]
name = "SPECIAL4"
command = ~D, DF, F, z
time = 16

[Command]
name = "SPECIAL4"
command = ~D, DF, F, ~x
time = 16

[Command]
name = "SPECIAL4"
command = ~D, DF, F, ~y
time = 16

[Command]
name = "SPECIAL4"
command = ~D, DF, F, ~z
time = 16
;----------------
;----------------ASSIST
[Command]
name = "ASSIST"
command = ~B, F, B, a
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, b
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, c
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~a
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~b
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~c
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, x
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, y
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, z
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~x
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~y
time = 16

[Command]
name = "ASSIST"
command = ~B, F, B, ~z
time = 16
;----------------
;----------------
[Command]
name = "412p"
command = ~B, DB, D, x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, z
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~x
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~y
time = 16

[Command]
name = "412p"
command = ~B, DB, D, ~z
time = 16

[Command]
name = "412k"
command = ~B, DB, D, a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, b
time = 16

[Command]
name=  "412k"
command = ~B, DB, D, c
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~a
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~b
time = 16

[Command]
name = "412k"
command = ~B, DB, D, ~c
time = 16

;====================<OTHER>====================

[Command]
name = "highjump"
command = $D, $U
time = 15

;====================<DOUBLE TAP>====================

[Command]
name = "FF"
command = F, F
time = 10

[Command]
name = "BB"
command = B, B
time = 10

;====================<2/3 BUTTON COMBINATION>====================

[Command]
name = "recovery"
command = x+y
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = a+x
time = 1

[Command]
name = "pp"
command = x+y
time = 1

[Command]
name = "pp"
command = x+z
time = 1

[Command]
name = "pp"
command = y+z
time = 1

[Command]
name = "kk"
command = a+b
time = 1

[Command]
name = "kk"
command = a+c
time = 1

[Command]
name = "kk"
command = b+c
time = 1

[Command]
name = "a+x"
command = a+x
time=1

[Command]
name = "b+y"
command = b+y
time = 1

[Command]
name = "c+z"
command = c+z
time = 1

;==============================================================================================
;========================================<-1 STATES>===========================================
;==============================================================================================
[StateDef -1]

[State -1, Tick Fix]
type = CtrlSet
triggerAll = !ctrl
trigger1 = (StateNo = 52 || StateNo = 101 || StateNo = 5120) && !AnimTime
trigger2 = (StateNo = [200,499]) && !AnimTime && Anim != 251 
trigger3 = ((StateNo = [760,762]) || (StateNo = [700,715]) || (StateNo = [900,905])) && !AnimTime
trigger4 = (StateNo = 5001 || StateNo = 5011 || StateNo = 151 || StateNo = 153) && HitOver
value = 1

[State -1, CtrlSet For Helpers]
type = CtrlSet
trigger1 = IsHelper
value = 0

[State -1, Hit Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -1, Juggle Count For Helpers]
type = ParentVarAdd
trigger1 = IsHelper
trigger1 = MoveHit = 1
trigger1 = !HitPauseTime
trigger1 = !(HitDefAttr = SCA, AT)
var(15) = 1

[State -1, Roll Forward]
type = ChangeState
value = 710
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdfwd"
trigger2 = var(20) && var(4)

[State -1, Roll Backward]
type = ChangeState
value = 715
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101])) && command = "holdback"

[State -1, Dodge]
type = ChangeState
value = 700
triggerAll = !AILevel
triggerAll = command = "a+x"
triggerAll = RoundState = 2 && StateType != A
trigger1 = (ctrl || (StateNo = [100,101]))

[State -1, LVL 3 Super]
type = ChangeState
value = 3500
triggerAll = !AILevel
triggerAll = command = "LVL3SUPER"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 3000 && !var(20)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Arithmetic Laser Beam]
type = ChangeState
value = 3250
triggerAll = !AILevel
triggerAll = command = "MAXSUPER3"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53) || var(20), 1000, 2000)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Giant Jake]
type = ChangeState
value = 3200
triggerAll = !AILevel
triggerAll = command = "SUPER3"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53), 0, 1000) && var(20) <= 60
triggerAll = numhelper(7000)
triggerAll = helper(7000),stateno != [7100, 7102]
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, MAX Sky-High Swordsman]
type = ChangeState
value = 3150
triggerAll = !AILevel
triggerAll = command = "MAXSUPER2"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53), 1000, 2000) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Sky-High Swordsman]
type = ChangeState
value = 3100
triggerAll = !AILevel
triggerAll = command = "SUPER2"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53), 0, 1000) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, MAX Bravest Warrior]
type = ChangeState
value = 3050
triggerAll = !AILevel
triggerAll = command = "MAXSUPER1"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53), 1000, 2000) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Bravest Warrior]
type = ChangeState
value = 3000
triggerAll = !AILevel
triggerAll = command = "SUPER1"
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= ifelse(var(53), 0, 1000) && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(7)

[State -1, Assist Me!]
type = ChangeState
value = 1500
triggerAll = !AILevel
triggerAll = command = "ASSIST"
triggerAll = RoundState = 2 && StateType != A
triggerAll = numhelper(7000)
triggerAll = helper(7000),stateno != [7100, 7102]
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, BMO Chop!]
type = ChangeState
value = ifelse(var(41)=1 && power >= 500, 1600, 1320)
triggerAll = !AILevel
triggerAll = command = "BMO"
triggerAll = RoundState = 2 && StateType != A && (fvar(3) || var(41)=1)
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Sweet Deals!]
type = ChangeState
value = 1300
triggerAll = !AILevel
triggerAll = command = "SHOP"
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])

[State -1, Throwin' Stones!]
type = ChangeState
value = 1400
triggerAll = !AILevel
triggerAll = command = "SPECIAL4"
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)
trigger3 = (StateNo = [600,650]) && (StateNo != [620,623]) && Movecontact

[State -1, EX Skypacked Attack]
type = ChangeState
value = 1260
triggerAll = !AILevel
triggerAll = command = "EXSPECIAL3A"
triggerAll = RoundState = 2 && StateType = A
triggerAll = power >= 500 && (var(20) <= 60 || var(53))
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)
trigger3 = (StateNo = [600,650]) && (StateNo != [620,623]) && Movecontact

[State -1, Soarin' Backpack Attack!]
type = ChangeState
value = 1210
triggerAll = !AILevel
triggerAll = command = "SPECIAL3A"
triggerAll = RoundState = 2 && StateType = A
trigger1 = ctrl || StateNo = 40 || StateNo = 52
trigger2 = var(6)
trigger3 = (StateNo = [600,650]) && (StateNo != [620,623]) && Movecontact

[State -1, EX Packed Attack]
type = ChangeState
value = 1250
triggerAll = !AILevel
triggerAll = command = "EXSPECIAL3" && ifElse(var(20) > 0 || (StateNo = [1000, 4999])|| (StateNo = [200,440]), 1, var(50) > 16)
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && (var(20) <= 60 || var(53))
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Backpack Attack!]
type = ChangeState
value = 1200
triggerAll = !AILevel
triggerAll = command = "SPECIAL3" && ifElse(var(20) > 0 || (StateNo = [1000, 4999])|| (StateNo = [200,440]), 1, var(50) > 16)
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX SSSkronkening]
type = ChangeState
value = 1150
triggerAll = !AILevel
triggerAll = command = "EXSPECIAL2" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Get Skronked!]
type = ChangeState
value = 1100
triggerAll = !AILevel
triggerAll = command = "SPECIAL2" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]) || (StateNo = [200,440]), 1, var(48) > 16)
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, EX High 5]
type = ChangeState
value = 1050
triggerAll = !AILevel
triggerAll = command = "EXSPECIAL1" 
triggerAll = RoundState = 2 && StateType != A
triggerAll = power >= 500 && var(20) <= 60
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, High Five, Dude!]
type = ChangeState
value = 1000
triggerAll = !AILevel
triggerAll = command = "SPECIAL1" && ifElse(var(20) > 0 || (StateNo = [1000, 4999]) || (StateNo = [200,440]), 1, var(48) > 16)
triggerAll = RoundState = 2 && StateType != A
trigger1 = ctrl || StateNo = 40 || StateNo = 52 || (StateNo = [100,101])
trigger2 = var(6)

[State -1, Zero Counter]
type = ChangeState
value = 750
triggerAll = !AILevel
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = command = "412p" || command = "412k"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power >= 1000 && !var(20)

[State -1, Custom Combo]
type = ChangeState
value = ifElse(StateType = A, 905, 900)
triggerAll = !AILevel
triggerAll = command = "c+z"&&!var(54)
triggerAll = RoundState = 2
triggerAll = power >= 1000 && !var(20)
trigger1 = ctrl || StateNo = 52 || (StateNo = [100,101])
trigger1 = !var(41)
trigger2 = var(6) && (movecontact = [1, 8])

[State -1, MAX Mode]
type = ChangeState
value = 770
triggerall = command = "c+z"&&var(54)=1
triggerall = RoundState = 2 && StateType != A
triggerall = var(53) <= 0 && Power >= 1000
trigger1 = ctrl || (Stateno = [100,101])
trigger2 = var(6) && (movecontact = [1, 8])

[State -1, Focus Strike]
type = ChangeState
value = 901
triggerAll = !AILevel
triggerAll = var(40)=1
trigger1 = command = "b" && command = "y"
trigger1 = RoundState = 2 && StateType != A
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Power Charging]
type = ChangeState
value = 730
triggerAll = !AILevel
triggerAll = var(40) = 0
trigger1 = command = "holdb" && command = "holdy"
trigger1 = RoundState = 2 && StateType != A
trigger1 = power < const(data.power) && power < PowerMax && !var(20)
trigger1 = ctrl || (StateNo = [100,101])

[State -1, Dash Forward/Run]
type = ChangeState
value = 102
triggerAll = !AILevel
trigger1 = command = "FF"
trigger1 = roundstate = 2 && StateType = S
trigger1 = ctrl

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = !AILevel
trigger1 = command = "BB"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && command = "pp" 
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = !AILevel
trigger1 = (command = "holdfwd" || command = "holdback") && command = "kk"
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl

[State -1, Backward Heavy Punch]
type = ChangeState
value = 224
triggerAll = !AILevel
triggerAll = command != "holddown"  && command = "holdback" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Forward Heavy Punch]
type = ChangeState
value = 223
triggerAll = !AILevel
triggerAll = command != "holddown"  && command = "holdfwd" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, 3rd Heavy Slash]
type = ChangeState
value = 222
triggerall = (command = "z" && command != "holddown") ;|| var(52) = 200
triggerAll = StateType != A
trigger1 = stateno = 221
trigger1 = time > 15 || movecontact

[State -1, 2nd Heavy Slash]
type = ChangeState
value = 221
triggerall = (command = "z" && command != "holddown") ;|| var(52) = 200
triggerAll = StateType != A
trigger1 = stateno = 220
trigger1 = time > 20 || movecontact

[State -1, Standing Heavy Punch]
type = ChangeState
value = 220 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Punch]
type = ChangeState
value = 210
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Rising Second Kick]
type = ChangeState
value = 242
triggerall = (command = "c") ;|| var(52) = 200
triggerAll = StateType = A
trigger1 = stateno = 241
trigger1 = time > 14 || movecontact

[State -1, Rising First Kick]
type = ChangeState
value = 241
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "holdfwd" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Medium Kick]
type = ChangeState
value = 240 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 230 || StateNo = 400 || StateNo = 430) && Time >= 4
trigger3 = var(4)

[State -1, Standing Light Kick]
type = ChangeState
value = 230 
triggerAll = !AILevel
triggerAll = command != "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >= 4
trigger3 = var(4)

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "z"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "c"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = !AILevel
triggerAll = command  ="holddown" && command = "y"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "b"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(4)

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "x"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >= 4
trigger3 = var(4)

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = !AILevel
triggerAll = command = "holddown" && command = "a"
triggerAll = StateType != A
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = (StateNo = 200 || StateNo = 400 || StateNo = 430) && Time >= 4
trigger3 = var(4)

[State -1, 3rd Heavy Slash]
type = ChangeState
value = 623
triggerall = (command = "z") ;|| var(52) = 200
triggerAll = StateType = A
trigger1 = stateno = 622
trigger1 = time > 12 || movecontact

[State -1, 2nd Heavy Slash]
type = ChangeState
value = 622
triggerall = (command = "z") ;|| var(52) = 200
triggerAll = StateType = A
trigger1 = stateno = 621
trigger1 = time > 10 || movecontact

[State -1, Jumping Heavy Punch]
type = ChangeState
value = ifelse(vel x != 0, 621,620)
triggerAll = !AILevel
triggerAll = command = "z"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = !AILevel
triggerAll = command = "c"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = !AILevel
triggerAll = command = "y"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = !AILevel
triggerAll = command = "b"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = !AILevel
triggerAll = command = "x"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = !AILevel
triggerAll = command = "a"
triggerAll = StateType = A
trigger1 = ctrl
trigger2 = var(4)

[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
triggerall = !AILevel&&Roundstate=2&&StateType != A
triggerall = StateNo != [200,699]
trigger1 = ctrl || (StateNo = [100,101])
trigger2 = var(5)

;==============================================================================================
;===========================================< A.I >============================================
;==============================================================================================

[State -1, I SEE U MAKE MISTAKE]
type = ChangeState
triggerall = AILevel && numenemy
triggerall = random < 100+AILevel
triggerall = statetype != A
triggerall = ((enemynear, ctrl = 0) && p2movetype != A) || (p2movetype = A && (enemynear, facing = facing))
;triggerall = var(54) != 2
triggerall = p2stateno != [5100,5130]
triggerall = p2bodydist x >= 60
triggerall = random < 500
triggerall = (stateno != [10,12]) || random < 100
triggerall = stateno != 20 || random < 500 || var(54) = 1
triggerall = stateno != 22
triggerall = stateno != 40
triggerall = stateno != 100
trigger1 = ctrl
value = ifelse( random<500&&command="holdfwd", ifelse(random<500,40,100) , ifelse( random < 200, ifelse(random<100&&power>=500,1150,1100) , ifElse(Power >= 500 && Random < 100 && var(20) <= 60, 1050, 1000) ) )

[State -1, Consider backing off]
type = ChangeState
triggerall = AILevel
triggerall = var(52) = 0 || random < 80
triggerall = random < 200
triggerall = numenemy
triggerall = (p2stateno = [5110,5130]) || ((enemynear,time <= 10) && (enemynear,prevstateno = 5120))
triggerall = p2bodydist x <= 33
triggerall = backedgedist >= 33
triggerall = time >= 6-AILevel || random < 10
trigger1 = stateno != 40
trigger1 = ctrl
value = ifelse(random<750,105,40)

[State -1, Fall Recovery (Air)]
type = ChangeState
value = 5210
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && CanRecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Fall Recovery (Ground)]
type = ChangeState
value = 5200
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && Alive
trigger1 = StateNo = 5050 && GetHitVar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jump]
type = ChangeState
value = 40
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A && ctrl
trigger1 = EnemyNear, MoveType = A && P2BodyDist x < 160 && EnemyNear, HitDefAttr = SC, AT

[State -1, Roll Forward]
type = ChangeState
value = 710
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AILevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [92,122])

[State -1, Dodge]
type = ChangeState
value = 700
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = (ctrl || (StateNo = [100,101])) && var(20) <= 164 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && !(EnemyNear, HitDefAttr = SCA, AT) && (P2BodyDist x = [0,60])

[State -1, Dodge]
type = ChangeState
value = 700
triggerall = AIlevel && numenemy
triggerall = (facing=1 && (enemy,facing=-1)) || (facing=-1 && (enemy,facing=1))
triggerall = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (145 * (AILevel ** 2 / 64.0))
triggerall = roundstate=2  && statetype != A
trigger1 = enemynear,movetype=A && (p2bodydist x=[0,40])&&(p2bodydist y=[0,0])
trigger2 = ((enemynear,numproj) || (enemynear,numhelper)) && inguarddist && p2bodydist x>=25 
trigger3 = RoundState = 2 && InGuardDist
trigger3 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger3 = !var(26) || P2BodyDist x >= 40
trigger3 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger3 = StateType != A || P2StateType = A
trigger3 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger3 = Random <  (ifElse((P2StateNo = [200, 699]), 125, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Dash Backward]
type = ChangeState
value = 105
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = ctrl && (StateNo != [100,106]) && var(20) <= 150 && !var(26)
trigger1 = (EnemyNear, MoveType = A) && BackEdgeDist >= 80 && (P2BodyDist x = [80,120]) && (EnemyNear, vel x)
trigger1 = Random < (ifElse((EnemyNear, HitDefAttr = SC, AT), 150, 50) * (AILevel ** 2 / 64.0))
trigger2 = (P2BodyDist x = [0,80]) && BackEdgeBodyDist >= 80
trigger2 = EnemyNear, StateNo = 5120 && EnemyNear, AnimTime = -4 && Random < (750 * (AILevel ** 2 / 64.0))

[State -1, Guard]
type = ChangeState
value = 120
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && InGuardDist
trigger1 = ctrl && (StateNo != [120, 155]) && !var(20)
trigger1 = !var(26) || P2BodyDist x >= 40
trigger1 = !(EnemyNear, HitDefAttr = SCA, AT) && (EnemyNear, Time < 120)
trigger1 = StateType != A || P2StateType = A
trigger1 = ifElse(StateType = A, ((var(3) != [1, 2]) || StateNo = 5210), 1)
trigger1 = Random < (ifElse((P2StateNo = [200, 699]), 100, ifElse((P2StateNo = [1000,2999]), 333, 1000)) * (AILevel ** 2 / 64.0))

[State -1, Consider finishing you off]
type=ChangeState
value=3500
triggerAll =AILevel && numenemy && RoundState=2 && StateType != A &&var(20)<=0 && power >= 3000 && random < (500 * (AILevel ** 2 / 64.0))
triggerAll =(enemynear,statetype != A) && !(enemynear, hitfall)&&(enemynear,stateno!=[5100,5220])&&(enemynear,stateno!=[120,155])
triggerAll =(p2bodydist x =[-200,200])&&(p2bodydist y=[-40,5])&&(enemynear,ctrl=0)&&(enemynear, stateno != [700, 799])
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2 = var(7)&&movehit&&random<250

[State -1, Consider LAZOR]
type = changestate
value = 3250
triggerAll = AIlevel && numenemy
triggerAll = roundstate = 2 && statetype != A
triggerAll = Power >= 2000 || (var(53) && Power >= 1000)
triggerAll = !(enemynear, ctrl) && ((p2stateno != [120, 155]) || p2statetype = A)
triggerAll = (p2bodydist x = [0, 100]) && p2statetype != L
triggerAll = (p2dist y = [ -100, 0]) && (enemynear, vel y = [ -7, 1]) && (enemynear, vel x > -2)
triggerAll = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger1 = (p2bodydist x = [15, 125]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = var(7) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Consider MAX HELIKOPTER]
type=ChangeState
value=3150
triggerAll =AILevel && RoundState=2 && Numenemy && StateType != A && stateno!=3050 &&var(20) <= 60
triggerAll = Power >= 2000 || (var(53) && Power >= 1000)
triggerAll = (p2bodydist x=[15,100]) && (p2bodydist y = [ -55, 5]) && random < (125 * (AIlevel ** 2 / 64.0))
triggerAll = (enemynear,stateno!=[120,155]) && (enemynear,stateno!=[5100,5220]) && enemynear,statetype!=L && enemynear,statetype!=C
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2 = var(7)

[State -1, Consider HELIKOPTER]
type=ChangeState
value=3100
triggerAll=AILevel && RoundState=2 && Numenemy && StateType != A && stateno!=3000 &&var(20) <= 60
triggerAll = Power >= 1000 || (var(53))
triggerAll=(p2bodydist x=[15,70]) && (p2bodydist y = [ -55, 5]) && random < (100 * (AIlevel ** 2 / 64.0))
triggerAll=(enemynear,stateno!=[120,155]) && (enemynear,stateno!=[5100,5220]) && enemynear,statetype!=L && enemynear,statetype!=C
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2 = var(7)

[State -1, Consider siccing Jake at you]
type = ChangeState
value = 3200
triggerAll = AILevel && numenemy
triggerAll = RoundState=2 && StateType != A && var(20) <= 60
triggerAll = Power >= 1000 || var(53)
triggerAll = numhelper(7000)
triggerAll = helper(7000),stateno != [7100, 7102]
triggerAll = (enemynear,stateno!=[5120,5220])&&(enemynear,stateno!=[120,155]) && random < (100 * (AILevel** 2 / 64.0))
triggerAll = (p2bodydist x =[30,100])&&(p2bodydist y=[-100,5])&&(enemynear,ctrl=0)&&(enemynear, stateno != [700, 799])
trigger1 = ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2 = var(7) && movehit && random<250

[State -1, Consider GOTTO PURESSU]
type = ChangeState
value = Ifelse((power>=2000 || (var(53)&&power>=1000))&& random<=100,3050,3000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = Power >= 1000 || (var(53))
triggerAll = !var(16) && (var(15) < 7 || var(20) || (StateNo = [1000, 4999]))
triggerAll = P2StateType != L
trigger1 = (P2BodyDist x = [0, 30]) || ((EnemyNear, BackEdgeBodyDist < 15) && P2StateType = A)
trigger1 = var(7) && MoveHit && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = var(7) && (StateNo = 1016 || StateNo = 1020) && Random < (650 * (AILevel ** 2 / 64.0))

[State -1, Consider buying]
type = ChangeState
value = 1300
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = var(27) >= 100000
trigger1 = fvar(1) < 3 || fvar(2) < 3 || fvar(3) < 1
trigger1 = ctrl && !var(20) && PrevStateNo != 5120
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Consider the spare change in my pocket]
type = ChangeState
value = 1400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(39) ;Projectile
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = P2dist X >= 0 && P2Dist Y >= -30
trigger1 = ctrl && Random < (ifelse(var(27)>=30000, 100, 50) * (AILevel ** 2 / 64.0))
trigger2 = (var(6) || (StateNo = [600,650])) && (StateNo != [620,623]) && MoveHit && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Consider chopping you]
type=ChangeState
value=ifelse(var(41)=1,1600,1320)
triggerall=AILevel && numenemy && RoundState=2 && StateType != A && (enemynear,stateno!=[5120,5220]) && random < (250 * (AIlevel ** 2 / 64.0))
triggerall= (enemynear,stateno!=[120,155]) && (enemynear,statetype!=L) && (enemynear,Movetype = I) && (p2bodydist x = [0, 55])&&(p2bodydist y=[-80,5])
triggerall=fvar(3) || (var(41)=1 && power >= 500)
trigger1=ctrl || StateNo=40 || StateNo=52 || (StateNo=[100,101])
trigger2=var(6) && movehit

[State -1, Consider up special]
type = ChangeState
value = 1200
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [-8,60]) && P2StateType != A && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 15 && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (100 * (AILevel ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (200 * (AILevel ** 2 / 64.0))
trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Consider meter burning the up special]
type = ChangeState
value = 1250
triggerAll = AILevel && NumEnemy && var(20) <= 60 && Power >= 500
triggerAll = RoundState = 2 && StateType != A
triggerAll = (EnemyNear, MoveType != A) || (EnemyNear, StateNo = [200, 499])
triggerAll = (P2BodyDist x = [0,55]) && (P2StateType != L || P2StateNo = 5120)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger1 = P2BodyDist x >= 15 && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (ctrl || StateNo = 52 || (StateNo = [100,101]))
trigger2 = (EnemyNear, StateNo = 5120 || EnemyNear, StateNo = 5201) && (EnemyNear, AnimTime = -18) && Random < (50 * (AILevel ** 2 / 64.0))
trigger3 = var(6) && MoveHit && Random < (250 * (AILevel ** 2 / 64.0))
;trigger3 = EnemyNear, GetHitVar(HitTime) >= 6

[State -1, Consider up special in midair]
type = ChangeState
value = ifElse(Power >= 500 && (P2BodyDist x = [-48,48]) && var(20) <= 60 && Random < 150, 1260, 1210)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
trigger1 = ctrl && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = ctrl && P2StateType = A && (P2BodyDist X = [-48,48]) && Random < (25 * (AILevel ** 2 / 64.0))
trigger3 = (var(6) || (StateNo = [600,650])) && (StateNo != [620,623]) && MoveHit && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Consider shoulder-charging you]
type=ChangeState
value=Ifelse(power>=500 && enemynear,Movetype = A && random<75,1150,1100)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,115]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || StateNo = 52 || (StateNo = [100,101])) && Random < (37 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && movehit && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Consider slap my hand]
type=ChangeState
value=Ifelse(power>=500 && random<=100,1050,1000)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 15 || var(20))
triggerAll = (P2BodyDist x = [0,100]) && (P2Dist y = [-75,5]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (50 * (AILevel ** 2 / 64.0))
trigger2 = var(6) && Random < (200 * (AILevel ** 2 / 64.0))

[State -1, Zero Counter]
type = ChangeState
value = 750
trigger1 = AILevel && NumEnemy
trigger1 = StateNo = 150 || StateNo = 152
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power >= 1000 && var(20) <= 60
trigger1 = Random < (25 * (AILevel ** 2 / 64.0))
trigger1 = (P2BodyDist x = [0,50]) && (Life < 0.5 * LifeMax)

[State -1, Power Charge]
type = ChangeState
value = 730
triggerAll = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType != A
trigger1 = Power < const(data.power) && !var(20)
trigger1 = ctrl && Power < const(data.power) && Power < PowerMax && !var(20) && PrevStateNo != 5120
trigger1 = !InGuardDist && P2BodyDist x >= 160 && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Throw]
type = ChangeState
value = 800
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = S
triggerAll = P2StateType != A && P2StateType != L && P2MoveType != H
triggerAll = (P2BodyDist x = [-20,40]) && P2BodyDist y = 0
trigger1 = ctrl && Random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (P2StateNo = [120,140]) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Run]
type = ChangeState
value = 100
trigger1 = AILevel && NumEnemy
trigger1 = RoundState = 2 && StateType = S
trigger1 = ctrl && (StateNo != [100,106])
trigger1 = (EnemyNear, MoveType != A) && P2BodyDist x >= 160 && Random < (25 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Slash]
type = ChangeState
value = 220 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,190]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Heavy Kick]
type = ChangeState
value = 250 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,64]) && (P2Dist y = [-70,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Punch]
type = ChangeState
value = 420
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && Statetype != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,145]) && (P2Dist y = [-154,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 4) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Heavy Kick]
type = ChangeState
value = 450
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,10]) && (P2Dist y = [-79,0]) && P2StateType != A && P2StateType != L
triggerAll = (P2StateType = S || (P2StateType = C && P2MoveType = H))
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 6) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Heavy Punch]
type = ChangeState
value =  ifelse(vel x != 0, 621,620)
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,51]) && (P2Dist y = [-101,76]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (100 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Neutral Jumping Heavy Kick]
type = ChangeState
value = 650
triggerAll = AILevel && NumEnemy && !vel x
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,63]) && (P2Dist y = [-97,85]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = var(4) && Random < (50 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Punch]
type = ChangeState
value = 210
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,48]) && (P2Dist y = [-60,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Forward Medium Kick]
type = ChangeState
value = 241
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && (P2Dist y = [-120,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (70 * (AILevel ** 2 / 64.0))

[State -1, Standing Far/Close Medium Kick]
type = ChangeState
value = 240
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,70]) && (P2Dist y = [-101,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,34]) && (P2Dist y = [-50,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,44]) && (P2Dist y = [-30,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Punch]
type = ChangeState
value = 610
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-80,72]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Jumping Medium Kick]
type = ChangeState
value = 640
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [-60,44]) && (P2Dist y = [-60,68]) && P2StateType = A
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Punch]
type = ChangeState
value = 200 
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,32]) && (P2Dist y = [-68,0]) && P2StateType != C && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (85 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Standing Light Kick]
type = ChangeState
value = 230
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,27]) && (P2Dist y = [-40,0]) && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,15]) && (P2Dist y = [-44,0]) && P2StateType != A && P2StateType != L
triggerAll = (EnemyNear, const(size.head.pos.y) <= -40) || (EnemyNear, StateType = A)
trigger1 = (ctrl || (StateNo = [100,101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200,499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 2) && Random < (250 * (AILevel ** 2 / 64.0))

[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType != A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,22]) && (P2Dist y = [-25,0]) && P2StateType != A && P2StateType != L
trigger1 = (ctrl || (StateNo = [100, 101])) && Random < (25 * (AILevel ** 2 / 64.0))
trigger2 = (StateNo = [200, 499]) && !AnimTime && ctrl
trigger2 = MoveHit && (EnemyNear, GetHitVar(HitTime) >= 3) && Random < (250 * (AILevel ** 2 / 64.0))
trigger3 = ((stateno = 400) && movehit && !animtime)
trigger3 = (enemy, statetype = S && (enemy, movetype = A || !enemy, ctrl) && random < (125 * (AIlevel ** 2 / 64.0)))

[State -1, Jumping Light Punch]
type = ChangeState
value = 600
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,40]) && (P2Dist y = [-51,60]) && P2StateType = S
trigger1 = ctrl
trigger1 = vel y > 0 && Random < (100 * (AIlevel ** 2 / 64.0))

[State -1, Jumping Light Kick]
type = ChangeState
value = 630
triggerAll = AILevel && NumEnemy
triggerAll = RoundState = 2 && StateType = A
triggerAll = !var(16) && (var(15) < 1 || var(20))
triggerAll = (P2BodyDist x = [0,59]) && (P2Dist y = [-80,57]) && P2StateType != L
trigger1 = ctrl
trigger1 = vel y <= 0 && Random < (ifElse(P2Dist x < 0, 250, 50) * (AILevel ** 2 / 64.0))





