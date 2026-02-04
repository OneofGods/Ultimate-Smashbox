; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;==============================================================================================
;=======================================< COMMAND FILE >=======================================
;==============================================================================================

;===================< BUTTON REMAPPING >===================

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s


;===================< DEFAULT VALUES >===================

[Defaults]
command.time = 15
command.buffer.time = 1


;===================< SINGLE BUTTON >===================

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
name = "start"
command = s
time = 1

[Command]
name = "a+"
command = a
time = 1
buffer.time = 5
[Command]
name = "b+"
command = b
time = 1
buffer.time = 5
[Command]
name = "c+"
command = c
time = 1
buffer.time = 5
[Command]
name = "x+"
command = x
time = 1
buffer.time = 5
[Command]
name = "y+"
command = y
time = 1
buffer.time = 5
[Command]
name = "z+"
command = z
time = 1
buffer.time = 5


;===================< HOLD DIR >===================

[Command]
name = "holdfwd"
command = /$F
time = 1
[Command]
name = "holdback"
command = /$B
time = 1
[Command]
name = "holdup"
command = /$U
time = 1
[Command]
name = "holddown"
command = /$D
time = 1


;====================< RELEASE DIR >====================

[Command]
name = "rlsdir"
command = ~$F
time = 1
[Command]
name = "rlsdir"
command = ~$B
time = 1
[Command]
name = "rlsdir"
command = ~$U
time = 1
[Command]
name = "rlsdir"
command = ~$D
time = 1


;===================< HOLD BUTTON >===================

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


;===================< DIR >===================

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


;====================< RELEASE BUTTON >====================

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

[Command]
name = "rlsx+"
command = ~x
time = 1
buffer.time = 5
[Command]
name = "rlsy+"
command = ~y
time = 1
buffer.time = 5
[Command]
name = "rlsz+"
command = ~z
time = 1
buffer.time = 5
[Command]
name = "rlsa+"
command = ~a
time = 1
buffer.time = 5
[Command]
name = "rlsb+"
command = ~b
time = 1
buffer.time = 5
[Command]
name = "rlsc+"
command = ~c
time = 1
buffer.time = 5


;===================< SUPER MOTIONS >===================

[Command]
name = "236236p"
command = ~D, DF, F, D, F, x
time = 30
[Command]
name = "236236p"
command = ~D, DF, F, D, F, y
time = 30
[Command]
name = "236236p"
command = ~D, DF, F, D, F, z
time = 30
[Command]
name = "236236p"
command = ~D, DF, F, D, F, ~x
time = 30
[Command]
name = "236236p"
command = ~D, DF, F, D, F, ~y
time = 30
[Command]
name = "236236p"
command = ~D, DF, F, D, F, ~z
time = 30

[Command]
name = "236236p+"
command = ~D, DF, F, D, F, x
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, DF, F, D, F, y
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, DF, F, D, F, z
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, DF, F, D, F, ~x
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, DF, F, D, F, ~y
time = 30
buffer.time = 5
[Command]
name = "236236p+"
command = ~D, DF, F, D, F, ~z
time = 30
buffer.time = 5

[Command]
name = "236236pp"
command = ~D, DF, F, D, F, x+y
time = 30
[Command]
name = "236236pp"
command = ~D, DF, F, D, F, x+z
time = 30
[Command]
name = "236236pp"
command = ~D, DF, F, D, F, y+z
time = 30

[Command]
name = "236236pp+"
command = ~D, DF, F, D, F, x+y
time = 30
buffer.time = 5
[Command]
name = "236236pp+"
command = ~D, DF, F, D, F, x+z
time = 30
buffer.time = 5
[Command]
name = "236236pp+"
command = ~D, DF, F, D, F, y+z
time = 30
buffer.time = 5

[Command]
name = "236236k"
command = ~D, DF, F, D, F, a
time = 30
[Command]
name = "236236k"
command = ~D, DF, F, D, F, b
time = 30
[Command]
name = "236236k"
command = ~D, DF, F, D, F, c
time = 30
[Command]
name = "236236k"
command = ~D, DF, F, D, F, ~a
time = 30
[Command]
name = "236236k"
command = ~D, DF, F, D, F, ~b
time = 30
[Command]
name = "236236k"
command = ~D, DF, F, D, F, ~c
time = 30

[Command]
name = "236236k+"
command = ~D, DF, F, D, F, a
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, DF, F, D, F, b
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, DF, F, D, F, c
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, DF, F, D, F, ~a
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, DF, F, D, F, ~b
time = 30
buffer.time = 5
[Command]
name = "236236k+"
command = ~D, DF, F, D, F, ~c
time = 30
buffer.time = 5


[Command]
name = "214214k"
command = ~D, DB, B, D, B, a
time = 30
[Command]
name = "214214k"
command = ~D, DB, B, D, B, b
time = 30
[Command]
name = "214214k"
command = ~D, DB, B, D, B, c
time = 30
[Command]
name = "214214k"
command = ~D, DB, B, D, B, ~a
time = 30
[Command]
name = "214214k"
command = ~D, DB, B, D, B, ~b
time = 30
[Command]
name = "214214k"
command = ~D, DB, B, D, B, ~c
time = 30

[Command]
name = "214214k+"
command = ~D, DB, B, D, B, a
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, DB, B, D, B, b
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, DB, B, D, B, c
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, DB, B, D, B, ~a
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, DB, B, D, B, ~b
time = 30
buffer.time = 5
[Command]
name = "214214k+"
command = ~D, DB, B, D, B, ~c
time = 30
buffer.time = 5

[Command]
name = "illusion"
command = x, x, F, a, z
time = 40
[Command]
name = "illusion"
command = x, x, F, a+z
time = 32
[Command]
name = "illusion"
command = x, x, F+a+z
time = 24

[Command]
name = "illusion+"
command = x, x, F, a, z
time = 40
buffer.time = 5
[Command]
name = "illusion+"
command = x, x, F, a+z
time = 32
buffer.time = 5
[Command]
name = "illusion+"
command = x, x, F+a+z
time = 24
buffer.time = 5

[Command]
name = "slumber"
command = x, b, B, y, c
time = 40
[Command]
name = "slumber"
command = x, b, B+y, c
time = 32
[Command]
name = "slumber"
command = x, b+B, y, c
time = 32

[Command]
name = "slumber+"
command = x, b, B, y, c
time = 40
buffer.time = 5
[Command]
name = "slumber+"
command = x, b, B+y, c
time = 32
buffer.time = 5
[Command]
name = "slumber+"
command = x, b+B, y, c
time = 32
buffer.time = 5


;===================< SPECIAL MOTIONS >===================

[Command]
name = "236p"
command = ~D, DF, F, x
time = 12
[Command]
name = "236p"
command = ~D, DF, F, y
time = 12
[Command]
name = "236p"
command = ~D, DF, F, z
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~x
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~y
time = 12
[Command]
name = "236p"
command = ~D, DF, F, ~z
time = 12

[Command]
name = "236p+"
command = ~D, DF, F, x
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, y
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, z
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~x
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~y
time = 12
buffer.time = 5
[Command]
name = "236p+"
command = ~D, DF, F, ~z
time = 12
buffer.time = 5

[Command]
name = "236pp"
command = ~D, DF, F, x+y
time = 12
[Command]
name = "236pp"
command = ~D, DF, F, x+z
time = 12
[Command]
name = "236pp"
command = ~D, DF, F, y+z
time = 12

[Command]
name = "236pp+"
command = ~D, DF, F, x+y
time = 12
buffer.time = 5
[Command]
name = "236pp+"
command = ~D, DF, F, x+z
time = 12
buffer.time = 5
[Command]
name = "236pp+"
command = ~D, DF, F, y+z
time = 12
buffer.time = 5

[Command]
name = "214k"
command = ~D, DB, B, a
time = 12
[Command]
name = "214k"
command = ~D, DB, B, b
time = 12
[Command]
name = "214k"
command = ~D, DB, B, c
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~a
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~b
time = 12
[Command]
name = "214k"
command = ~D, DB, B, ~c
time = 12

[Command]
name = "214k+"
command = ~D, DB, B, a
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, b
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, c
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~a
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~b
time = 12
buffer.time = 5
[Command]
name = "214k+"
command = ~D, DB, B, ~c
time = 12
buffer.time = 5

[Command]
name = "214kk"
command = ~D, DB, B, a+b
time = 12
[Command]
name = "214kk"
command = ~D, DB, B, a+c
time = 12
[Command]
name = "214kk"
command = ~D, DB, B, b+c
time = 12

[Command]
name = "214kk+"
command = ~D, DB, B, a+b
time = 12
buffer.time = 5
[Command]
name = "214kk+"
command = ~D, DB, B, a+c
time = 12
buffer.time = 5
[Command]
name = "214kk+"
command = ~D, DB, B, b+c
time = 12
buffer.time = 5

[Command]
name = "623p"
command = ~F, D, DF, x
time = 18
[Command]
name = "623p"
command = ~F, D, DF, y
time = 18
[Command]
name = "623p"
command = ~F, D, DF, z
time = 18
[Command]
name = "623p"
command = ~F, D, DF, ~x
time = 18
[Command]
name = "623p"
command = ~F, D, DF, ~y
time = 18
[Command]
name = "623p"
command = ~F, D, DF, ~z
time = 18

[Command]
name = "623p+"
command = ~F, D, DF, x
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, DF, y
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, DF, z
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, DF, ~x
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, DF, ~y
time = 18
buffer.time = 5
[Command]
name = "623p+"
command = ~F, D, DF, ~z
time = 18
buffer.time = 5

[Command]
name = "623pp"
command = ~F, D, DF, x+y
time = 18
[Command]
name = "623pp"
command = ~F, D, DF, x+z
time = 18
[Command]
name = "623pp"
command = ~F, D, DF, y+z
time = 18

[Command]
name = "623pp+"
command = ~F, D, DF, x+y
time = 18
buffer.time = 5
[Command]
name = "623pp+"
command = ~F, D, DF, x+z
time = 18
buffer.time = 5
[Command]
name = "623pp+"
command = ~F, D, DF, y+z
time = 18
buffer.time = 5

[Command]
name = "63214p"
command = ~F, D, B, x
time = 18
[Command]
name = "63214p"
command = ~F, D, B, y
time = 18
[Command]
name = "63214p"
command = ~F, D, B, z
time = 18
[Command]
name = "63214p"
command = ~F, D, B, ~x
time = 18
[Command]
name = "63214p"
command = ~F, D, B, ~y
time = 18
[Command]
name = "63214p"
command = ~F, D, B, ~z
time = 18

[Command]
name = "63214p+"
command = ~F, D, B, x
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, D, B, y
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, D, B, z
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, D, B, ~x
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, D, B, ~y
time = 18
buffer.time = 5
[Command]
name = "63214p+"
command = ~F, D, B, ~z
time = 18
buffer.time = 5

[Command]
name = "63214pp"
command = ~F, D, B, x+y
time = 18
[Command]
name = "63214pp"
command = ~F, D, B, x+z
time = 18
[Command]
name = "63214pp"
command = ~F, D, B, y+z
time = 18

[Command]
name = "63214pp+"
command = ~F, D, B, x+y
time = 18
buffer.time = 5
[Command]
name = "63214pp+"
command = ~F, D, B, x+z
time = 18
buffer.time = 5
[Command]
name = "63214pp+"
command = ~F, D, B, y+z
time = 18
buffer.time = 5


;===================< OTHER >===================

[Command]
name = "recovery"
command = x
time = 1
[Command]
name = "recovery"
command = y
time = 1
[Command]
name = "recovery"
command = z
time = 1
[Command]
name = "recovery"
command = a
time = 1
[Command]
name = "recovery"
command = b
time = 1
[Command]
name = "recovery"
command = c
time = 1

[Command]
name = "highjump"
command = $D, $U
time = 15

[Command]
name = "airdashF"
command = UF, ~F, F
time = 10
[Command]
name = "airdashF"
command = UF, ~UF, UF
time = 10

[Command]
name = "airdashF"
command = U, ~U, U
time = 10

[Command]
name = "airdashB"
command = UB, ~B, B
time = 10
[Command]
name = "airdashB"
command = UB, ~UB, UB
time = 10

[Command]
name = "counter_p"
command = F, x + y
time = 8
[Command]
name = "counter_p"
command = F, x + z
time = 8
[Command]
name = "counter_p"
command = F, y + z
time = 8

[Command]
name = "counter_k"
command = F, a + b
time = 8
[Command]
name = "counter_k"
command = F, a + c
time = 8
[Command]
name = "counter_k"
command = F, b + c
time = 8

[Command]
name = "retreat"
command = /F, x
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /F, y
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /F, z
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /F, a
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /F, b
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /F, c
time = 1
buffer.time = 8

[Command]
name = "retreat"
command = /B, x
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /B, y
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /B, z
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /B, a
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /B, b
time = 1
buffer.time = 8
[Command]
name = "retreat"
command = /B, c
time = 1
buffer.time = 8

[Command]
name = "movelist"
command = s, s
time = 15


;===================< DOUBLE TAP >===================

[Command]
name = "FF"
command = F, F
time = 10
[Command]
name = "BB"
command = B, B
time = 10


;===================< 2/3 BUTTON COMBINATION >===================

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
time = 1

[Command]
name = "c+z"
command = c+z
time = 1


;====================< DIRECTION + BUTTON >====================

[Command]
name = "6c"
command = /F, c
time = 1
[Command]
name = "6c+"
command = /F, c
time = 1
buffer.time = 5

[Command]
name = "3z"
command = /DF, z
time = 1
[Command]
name = "3z+"
command = /DF, z
time = 1
buffer.time = 5


;====================< INPUT CHECK >====================

[Command]
name = "6v"
command = F, a
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, b
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, c
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, x
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, y
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, z
time = 10
buffer.time = 5

[Command]
name = "6v"
command = F, ~a
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~b
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~c
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~x
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~y
time = 10
buffer.time = 5
[Command]
name = "6v"
command = F, ~z
time = 10
buffer.time = 5

[Command]
name = "4v"
command = B, a
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, b
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, c
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, x
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, y
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, z
time = 10
buffer.time = 5

[Command]
name = "4v"
command = B, ~a
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~b
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~c
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~x
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~y
time = 10
buffer.time = 5
[Command]
name = "4v"
command = B, ~z
time = 10
buffer.time = 5


;===========================================================================
;===============================< -1 STATES >=================================
;===========================================================================

[Statedef -1]

[State -1, Inputs]
type = changestate
trigger1 = ishelper(9999)
trigger1 = stateno != 9999
value = 9999

[State -1, Landing Buffer]
type = varset
trigger1 = time < 5
trigger1 = stateno = [600, 699]
trigger1 = vel y > 0 && (pos y > - vel y)
trigger1 = !movecontact && !movereversed && hitdefattr != SCA, AA, AP, AT
var(58) = 0
ignorehitpause = 0

[State -1, Buffer Timer]
type = varadd
trigger1 = var(58)
var(58) = ifelse(var(58) < 0, 1, -1)
ignorehitpause = 0

[State -1, Buffer Off]
type = varset
trigger1 = hitpausetime || movereversed = 1
var(58) = 5
ignorehitpause = 1

[State -1, Dark Force Reset]
type = varset
var(59) = 771
triggerall = statetype != A && ctrl
trigger1 = var(20) < 0
trigger2 = !AIlevel && !var(59) && !ishelper
trigger2 = command = "c+z"
trigger2 = roundstate = 2 && numhelper(775) && var(20) > 0

[State -1, Roll Forward]
type = varset
var(59) = 720
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && command = "holdfwd"

[State -1, Roll Backward]
type = varset
var(59) = 725
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101])) && command = "holdback"

[State -1, Dodge]
type = varset
var(59) = 710
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && command = "x"
triggerall = roundstate = 2 && statetype != A
trigger1 = (ctrl || (stateno = [100, 101]))

[State -1, Air Darkness Illusion]
type = varset
var(59) = 4050
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6v"
triggerall = command = "236236k"
triggerall = roundstate = 2 && statetype = A && power >= 2000 && !var(20)
trigger1 = ctrl
trigger2 = var(7) || (var(8) && (stateno != [4000, 4099]))

[State -1, Darkness Illusion]
type = varset
var(59) = 4000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "illusion+"
triggerall = helper(9999), command = "illusion" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 3000 && !var(20)
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && (stateno != [4000, 4099]))
trigger3 = (stateno = [200, 499])

[State -1, Eternal Slumber]
type = varset
var(59) = 4100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "slumber+"
triggerall = helper(9999), command = "slumber" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 3000 && !var(20)
triggerall = !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && stateno != 4100)
trigger3 = (stateno = [200, 499])

[State -1, Finishing Shower]
type = varset
var(59) = 3300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236pp+"
triggerall = helper(9999), command = "236236pp" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 2000 && !var(20)
triggerall = !var(39)
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && stateno != 3300)

[State -1, Valkyrie Turn]
type = varset
var(59) = 3400
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "4v"
triggerall = command = "214214k"
triggerall = roundstate = 2 && power >= 1000
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && stateno != 3401)

[State -1, Cardinal Blade]
type = varset
var(59) = 3100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236k+"
triggerall = helper(9999), command = "236236k" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && stateno != 3100)

[State -1, Air Soul Phoenix]
type = varset
var(59) = 3050
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236p"
triggerall = roundstate = 2 && statetype = A && power >= 1000
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl
trigger2 = var(7) || (var(8) && stateno != 3050)

[State -1, Soul Phoenix]
type = varset
var(59) = 3000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "6v"
triggerall = helper(9999), command = "236236p+"
triggerall = helper(9999), command = "236236p" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 1000
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(7) || (var(8) && stateno != 3000)

[State -1, EX Shadow Blade]
type = varset
var(59) = 1110
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623pp+"
triggerall = helper(9999), command = "623pp" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 500
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, EX Vector Drain]
type = varset
var(59) = 1320
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "63214pp+"
triggerall = helper(9999), command = "63214pp" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 500
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, EX Parasite Roll]
type = varset
var(59) = 1250
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214kk+"
triggerall = helper(9999), command = "214kk" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 500
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, EX Air Soul Fist]
type = varset
var(59) = 1060
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236pp"
triggerall = roundstate = 2 && statetype = A && power >= 500
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, EX Soul Fist]
type = varset
var(59) = 1010
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236pp+"
triggerall = helper(9999), command = "236pp" || !var(58)
triggerall = roundstate = 2 && statetype != A && power >= 500
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, Shadow Blade]
type = varset
var(59) = 1100
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "623p+"
triggerall = helper(9999), command = "623p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, Vector Drain]
type = varset
var(59) = 1300
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "63214p+"
triggerall = helper(9999), command = "63214p" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, Parasite Roll]
type = varset
var(59) = 1200
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "214k+"
triggerall = helper(9999), command = "214k" || !var(58)
triggerall = roundstate = 2 && statetype != A
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, Air Soul Fist]
type = varset
var(59) = 1050
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236p"
triggerall = roundstate = 2 && statetype = A
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl
trigger2 = var(6)

[State -1, Soul Fist]
type = varset
var(59) = 1000
ignorehitpause = 1
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = helper(9999), command = "236p+"
triggerall = helper(9999), command = "236p" || !var(58)
triggerall = roundstate = 2 && statetype != A
triggerall = !var(39) || var(20) > 0
trigger1 = ctrl || stateno = 40 || stateno = 52
trigger2 = var(6)

[State -1, Zero Counter]
type = changestate
value = 750
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "counter_p" || command = "counter_k"
triggerall = roundstate = 2 && power >= 1000 && statetype != A && !var(20)
trigger1 = stateno = 150 || stateno = 152
trigger2 = (stateno = 151 || stateno = 153) && time < 8

[State -1, Throw]
type = varset
var(59) = 800
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = (command = "pp" || command = "kk") && (command = "holdfwd" || command = "holdback")
trigger1 = roundstate = 2 && statetype = S && ctrl

[State -1, Dark Force]
type = varset
var(59) = 770
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "c+z"
trigger1 = roundstate = 2 && statetype != A && power >= 2000
trigger1 = !numhelper(775) && !var(20) && ctrl

[State -1, Power Charge]
type = varset
var(59) = 740
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "holdb" && command = "holdy"
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax && !var(20)
trigger1 = ctrl

[State -1, Air Dash]
type = varset
var(59) = ifelse((command = "airdashF" || command = "FF"), 100, 105)
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "FF" || command = "BB" || command = "airdashF" || command = "airdashB"
trigger1 = roundstate = 2 && (stateno != [100, 105]) && statetype = A && ctrl

[State -1, Dash]
type = varset
var(59) = ifelse(command = "FF", 100, 105)
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "FF" || command = "BB"
trigger1 = roundstate = 2 && (stateno != [100, 105]) && statetype = S && ctrl

[State -1, Retreat]
type = selfstate
value = 5230
trigger1 = !AIlevel && !var(59) && !ishelper
trigger1 = command = "retreat"
trigger1 = (stateno = 5110 || stateno = 5115) && time >= 5
trigger1 = roundstate = 2 && alive

[State -1, SHK2]
type = varset
var(59) = 255
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "6c" || (!var(58) && command = "6c+")
triggerall = statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 220]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 420]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, CHP2]
type = varset
var(59) = 425
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "3z" || (!var(58) && command = "3z+")
triggerall = statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 210]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 410]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, CHK]
type = varset
var(59) = 450
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 220]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 420]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, CHP]
type = varset
var(59) = 420
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 210]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 410]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, SHK]
type = varset
var(59) = 250
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" || (!var(58) && command = "c+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 220]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 420]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, SHP]
type = varset
var(59) = 220
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" || (!var(58) && command = "z+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 210]) || (stateno = [230, 240])) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 410]) || (stateno = [430, 440])) && (movecontact = [1, 4])

[State -1, CMK]
type = varset
var(59) = 440
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 210]) || stateno = 230) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 410]) || stateno = 430) && (movecontact = [1, 4])

[State -1, CMP]
type = varset
var(59) = 410
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400 || stateno = 230 || stateno = 430) && (movecontact = [1, 4])

[State -1, SMK]
type = varset
var(59) = 240
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" || (!var(58) && command = "b+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = ((stateno = [200, 210]) || stateno = 230) && (movecontact = [1, 4])
trigger3 = ((stateno = [400, 410]) || stateno = 430) && (movecontact = [1, 4])

[State -1, SMP]
type = varset
var(59) = 210
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" || (!var(58) && command = "y+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230) && (movecontact = [1, 4])
trigger3 = (stateno = 400 || stateno = 430) && (movecontact = [1, 4])

[State -1, CLK]
type = varset
var(59) = 430
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400) && time >= 5
trigger3 = (stateno = 200 || stateno = 400) && (movecontact = [1, 4])

[State -1, CLP]
type = varset
var(59) = 400
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command = "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400) && time >= 5

[State -1, SLK]
type = varset
var(59) = 230
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" || (!var(58) && command = "a+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && (movecontact = [1, 4])
trigger3 = (stateno = 200 || stateno = 230 || stateno = 400) && time >= 5

[State -1, SLP]
type = varset
var(59) = 200
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" || (!var(58) && command = "x+")
triggerall = command != "holddown" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400) && time >= 5

[State -1, AHK]
type = varset
var(59) = 650
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "c" && statetype = A
trigger1 = ctrl
trigger2 = ((stateno = [600, 620]) || (stateno = [630, 640])) && (movecontact = [1, 4]) && (prevstateno != [100, 105])

[State -1, AHP]
type = varset
var(59) = 620
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "z" && statetype = A
trigger1 = ctrl
trigger2 = ((stateno = [600, 610]) || (stateno = [630, 640])) && (movecontact = [1, 4]) && (prevstateno != [100, 105])

[State -1, AMK]
type = varset
var(59) = 640
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "b" && statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600 || stateno = 610 || stateno = 630) && (movecontact = [1, 24]) && (prevstateno != [100, 105])

[State -1, AMP]
type = varset
var(59) = 610
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "y" && statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600 || stateno = 630) && (movecontact = [1, 4]) && (prevstateno != [100, 105])

[State -1, ALK]
type = varset
var(59) = 630
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "a" && statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 && (movecontact = [1, 24]) && (prevstateno != [100, 105])

[State -1, ALP]
type = varset
var(59) = 600
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "x" && statetype = A
trigger1 = ctrl

[State -1, Taunt]
type = varset
var(59) = 195
triggerall = !AIlevel && !var(59) && !ishelper
triggerall = command = "start" && statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200, 499]) && (movecontact = [1, 24])

[State -1, Punch Strength]
type = varset
triggerall = !AIlevel && var(59)
triggerall = var(59) = 1000 || var(59) = 1050 || var(59) = 1100 || var(59) = 1300
trigger1 = command = "x" || command = "y" || command = "z" || helper(9999), command = "x" || helper(9999), command = "y" || helper(9999), command = "z"
trigger1 = var(10) := ifelse(command = "z" || helper(9999), command = "z", 3, ifelse(command = "y" || helper(9999), command = "y", 2, 1))
trigger2 = command = "rlsx" || command = "rlsy" || command = "rlsz" || helper(9999), command = "rlsx" || helper(9999), command = "rlsy" || helper(9999), command = "rlsz"
trigger2 = var(10) := ifelse(command = "rlsz" || helper(9999), command = "rlsz", 3, ifelse(command = "rlsy" || helper(9999), command = "rlsy", 2, 1))
trigger3 = command = "x+" || command = "y+" || command = "z+" || helper(9999), command = "x+" || helper(9999), command = "y+" || helper(9999), command = "z+"
trigger3 = var(10) := ifelse(command = "z+" || helper(9999), command = "z+", 3, ifelse(command = "y+" || helper(9999), command = "y+", 2, 1))
trigger4 = command = "rlsx+" || command = "rlsy+" || command = "rlsz+" || helper(9999), command = "rlsx+" || helper(9999), command = "rlsy+" || helper(9999), command = "rlsz+"
trigger4 = var(10) := ifelse(command = "rlsz+" || helper(9999), command = "rlsz+", 3, ifelse(command = "rlsy+" || helper(9999), command = "rlsy+", 2, 1))
var(10) = var(10)
ignorehitpause = 0

[State -1, Kick Strength]
type = varset
triggerall = !AIlevel && var(59)
triggerall = var(59) = 1200
trigger1 = command = "a" || command = "b" || command = "c" || helper(9999), command = "a" || helper(9999), command = "b" || helper(9999), command = "c"
trigger1 = var(10) := ifelse(command = "c" || helper(9999), command = "c", 3, ifelse(command = "b" || helper(9999), command = "b", 2, 1))
trigger2 = command = "rlsa" || command = "rlsb" || command = "rlsc" || helper(9999), command = "rlsa" || helper(9999), command = "rlsb" || helper(9999), command = "rlsc"
trigger2 = var(10) := ifelse(command = "rlsc" || helper(9999), command = "rlsc", 3, ifelse(command = "rlsb" || helper(9999), command = "rlsb", 2, 1))
trigger3 = command = "a+" || command = "b+" || command = "c+" || helper(9999), command = "a+" || helper(9999), command = "b+" || helper(9999), command = "c+"
trigger3 = var(10) := ifelse(command = "c+" || helper(9999), command = "c+", 3, ifelse(command = "b+" || helper(9999), command = "b+", 2, 1))
trigger4 = command = "rlsa+" || command = "rlsb+" || command = "rlsc+" || helper(9999), command = "rlsa+" || helper(9999), command = "rlsb+" || helper(9999), command = "rlsc+"
trigger4 = var(10) := ifelse(command = "rlsc+" || helper(9999), command = "rlsc+", 3, ifelse(command = "rlsb+" || helper(9999), command = "rlsb+", 2, 1))
var(10) = var(10)
ignorehitpause = 0

[State -1, Do or do not]
type = hitoverride
trigger1 = ctrl
trigger1 = var(59) > 0
trigger1 = command = "holdback"
attr = SCA, AA, AP
stateno = ifelse(statetype = A, 5020, 5000)
slot = 0
time = 1

[State -1, Buffered State]
type = changestate
trigger1 = var(59) > 0
trigger1 = movetype != H || hitover
value = var(59) + 0 * (var(59) := 0) * (var(58) := 5)
ignorehitpause = 0

[State -1, Buffered State]
type = varset
trigger1 = 1
var(59) = 0
ignorehitpause = 0


;===========================================================================
;=================================< A.I. >====================================
;===========================================================================

[State -1, run]
type = changestate
value = 100
trigger1 = AIlevel && numenemy
trigger1 = statetype != C && roundstate = 2 && ctrl && (stateno != [100, 105])
trigger1 = enemynear, movetype != A && p2bodydist x > 120 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, dash]
type = changestate
value = 105
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = S && roundstate = 2 && ctrl
triggerall = (p2bodydist x = [0, 80]) && backedgebodydist > 80 && (stateno != [100, 105])
trigger1 = enemynear, movetype = A && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = enemynear, stateno = 5120 && enemynear, animtime = -3 && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Jump]
type = changestate
value = 40
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl
trigger1 = enemynear, movetype = A && p2bodydist x < 160 && enemynear, hitdefattr = SC, AT

[State -1, sidestep / dodge]
type = changestate
value = ifelse((backedgebodydist > 40 && random < 200), 725, ifelse(random < 600, 720, 710))
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A && ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger1 = enemynear, movetype = A && p2bodydist x < 80

[State -1, Roll Fireballs]
type = changestate
value = 710
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && statetype != A
trigger1 = ctrl || (stateno = [100, 101])
trigger1 = numenemy = 1
trigger1 = p2bodydist x >= 120
trigger1 = enemynear, time >= 10 || p2movetype != A
trigger1 = inguarddist && !(enemynear, hitdefattr = SCA, AA, AT)
trigger1 = ifelse(p2bodydist x < 180, (enemynear, animtime <= -30), 1)
trigger1 = random < (200 * (AIlevel ** 2 / 64.0))

[State -1, Guard]
type = changestate
value = 120
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && inguarddist
trigger1 = ctrl && (stateno != [120, 155]) && (stateno != [100, 105])
trigger1 = prevstateno != [720, 725]
trigger1 = !var(26) || p2bodydist x >= 40
trigger1 = !(enemynear, hitdefattr = SCA, AT) && (enemynear, time < 120)
trigger1 = statetype != A || p2statetype = A
trigger1 = ifelse(statetype = A, ((var(3) != [1, 2]) || stateno = 5210), 1)
trigger1 = random < (ifelse((p2stateno = [200, 699]), 100, ifelse((p2stateno = [1000, 2999]), 333, 1000)) * (AIlevel ** 2 / 64.0))

[State -1, Zero Counter]
type = changestate
value = 750
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1)
trigger1 = (p2dist x = [-90, 90]) && stateno = 150 || stateno = 152
trigger1 = roundstate = 2 && power >= 2000 && !var(20) && life < 500 && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, powercharge]
type = changestate
value = 740
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1)
trigger1 = roundstate = 2 && statetype != A
trigger1 = power < const(data.power) && power < powermax
trigger1 = !var(20) && !numhelper(775) && ctrl
trigger1 = random < (50 * (AIlevel ** 2 / 64.0)) && !inguarddist && p2movetype != A && p2dist x >= 160

[State -1, Fall Recovery]
type = changestate
value = 5210
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && canrecover
trigger1 = vel y > 0 && pos y < -20
trigger1 = random < (25 * (AIlevel ** 2 / 64.0))

[State -1, Fall Recovery]
type = changestate
value = 5200
trigger1 = AIlevel && numenemy
trigger1 = roundstate = 2 && alive
trigger1 = stateno = 5050 && gethitvar(fall.recover)
trigger1 = vel y > 0 && pos y >= -20
trigger1 = random < (100 * (AIlevel ** 2 / 64.0))

[State -1, taunt]
type = changestate
value = 195
trigger1 = AIlevel && numenemy
trigger1 = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
trigger1 = roundstate = 2 && statetype != A && life >= (enemynear, life)
trigger1 = p2dist x > 200 && (enemynear, vel y > 0) && ctrl && random < (100 * (AIlevel ** 2 / 64.0))
trigger1 = !(enemynear, ctrl) && (enemynear, movetype = H)

[State -1, throw]
type = changestate
value = 800
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S && stateno != 100 && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (p2bodydist x = [0, 21]) && (p2bodydist y = [-25, 25]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno = [120, 155]) && (p2bodydist x = [0, 36]) && (p2bodydist y = [-25, 25]) && random < (500 * (AIlevel ** 2 / 64.0))

[State -1, SLP]
type = changestate
value = 200
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 25]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, SMP]
type = changestate
value = 210
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400 || stateno = 430) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SHP]
type = changestate
value = 220
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 75]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SLK]
type = changestate
value = 230
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 25]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 400) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SMK]
type = changestate
value = 240
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 230 || stateno = 410 || stateno = 430) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, SHK2]
type = changestate
value = 255
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 75]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (ifelse(p2statetype = C, 100, 20) * (AIlevel ** 2 / 64.0))

[State -1, SHK]
type = changestate
value = 250
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 75]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != C && !(enemynear, hitfall)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 220 || stateno = 240 || stateno = 410 || stateno = 420 || stateno = 440) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLP]
type = changestate
value = 400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 20]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 230) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CMP]
type = changestate
value = 410
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 40]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype != A && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 240 || stateno = 400 || stateno = 430) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CHP]
type = changestate
value = 420
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 60]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 440) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CLK]
type = changestate
value = 430
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 20]) && (p2bodydist y = [-50, 50]) && p2statetype != L && p2statetype = S && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 200 || stateno = 230 || stateno = 400) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CMK]
type = changestate
value = 440
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 40]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 240 || stateno = 410 || stateno = 430) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, CHK]
type = changestate
value = 450
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype != A && roundstate = 2
triggerall = (p2bodydist x = [0, 60]) && (p2bodydist y = [-50, 50]) && p2statetype = S && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 210 || stateno = 220 || stateno = 240 || stateno = 410 || stateno = 420 || stateno = 440) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALP]
type = changestate
value = 600
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 25]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, AMP]
type = changestate
value = 610
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 600 || stateno = 630) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, AHP]
type = changestate
value = 620
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 75]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 610 || stateno = 640) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, ALK]
type = changestate
value = 630
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 25]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 600 && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, AMK]
type = changestate
value = 640
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [-50, 50]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 610 || stateno = 630) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, AHK]
type = changestate
value = 650
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = statetype = A && roundstate = 2
triggerall = (p2bodydist x = [0, 75]) && (p2bodydist y = [-50, 50]) && p2statetype != L && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = 610 || stateno = 620 || stateno = 640) && ((movehit = [1, 16]) = [1, 4]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, shadowblade]
type = changestate
value = ifelse((power >= 500 && random < 133 && !var(20)), 1110, 1100)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = (p2stateno != [120, 155]) && p2statetype != L && !(enemynear, hitfall)
triggerall = (p2bodydist x = [0, 55]) && (p2bodydist y >= -180) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(6) && random < (150 * (AIlevel ** 2 / 64.0))

[State -1, EXairsoulfist]
type = changestate
value = 1060
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && power >= 500 && statetype = A && vel y > -1 && !var(20)
triggerall = (p2stateno != [120, 155])
triggerall = !var(39)
trigger1 = ctrl && p2dist x < 0 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && p2dist y < -50 && (enemynear, vel y <= -4) && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, EXsoulfist]
type = changestate
value = 1010
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && power >= 500 && statetype != A && !var(20)
triggerall = (p2stateno != [120, 155]) && p2statetype != L && (enemynear, vel y <= -4)
triggerall = !var(39)
trigger1 = ctrl && p2dist x < 0 && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && p2dist y < -80 && (enemynear, vel y <= -4) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, airsoulfist]
type = changestate
value = 1050
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && vel y > -1
triggerall = !var(39)
triggerall = (enemynear, vel y > -1)
trigger1 = ctrl && p2dist x >= 0 && p2dist y >= -50 && random < (25 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [600, 699]) && var(6) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, soulfist]
type = changestate
value = 1000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A
triggerall = !var(39)
triggerall = p2statetype != L && (enemynear, vel y > -1)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && p2dist x > 160 && random < (25 * (AIlevel ** 2 / 64.0))

[State -1, vectordrain]
type = changestate
value = ifelse((power >= 500 && random < 133 && !var(20)), 1320, 1300)
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = S && stateno != 100 && ctrl
triggerall = p2statetype != A && p2statetype != L && p2movetype != H
trigger1 = (p2bodydist x = [0, 25]) && (p2bodydist y = [-25, 25]) && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (p2stateno = [120, 155]) && (p2bodydist x = [0, 40]) && (p2bodydist y = [-25, 25]) && random < (333 * (AIlevel ** 2 / 64.0))

[State -1, cardinalblade]
type = changestate
value = 3100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2bodydist x = [0, 60]) && (p2bodydist y >= -180) && (enemynear, vel y > -1) && (enemynear, vel x > -2)
trigger1 = ctrl && random < (ifelse((enemynear, hitfall), 200, 50) * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1100, 1110]) && (movehit = [1, 16]) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3401 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger5 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger5 = helper(stateno + 5), var(18) && random < (50 * (AIlevel ** 2 / 64.0))

[State -1, valkyrieturn]
type = changestate
value = 3400
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && power >= 1000
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L && p2statetype != C
triggerall = (enemynear, pos y <= -80) && (enemynear, vel y <= -5)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && (enemynear, movetype = A) && (enemynear, stateno = [1000, 4999]) && p2dist x < 160 && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = stateno = 3100 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1000, 4999]) && numhelper(stateno + 5) && var(10) <= 6
trigger3 = helper(stateno + 5), var(18) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, airsoulphoenix]
type = changestate
value = 3050
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype = A && power >= 1000
triggerall = !var(39)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2dist x = [0, 180]) && p2dist y >= -50 && (enemynear, vel y > -3)
trigger1 = ctrl && (p2dist x = [p2dist y * 0.8, p2dist y * 1.2]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [600, 699]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1100, 1110]) && (movehit = [1, 16]) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = (stateno = 3100 || (stateno = 3401 && hitcount >= 8)) && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, soulphoenix]
type = changestate
value = 3000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 1000
triggerall = !var(39)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2dist x = [0, 120]) && p2dist y > -180 && (enemynear, vel y > -2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && var(7) && random < (50 * (AIlevel ** 2 / 64.0))
trigger3 = (stateno = [1100, 1110]) && (movehit = [1, 16]) && random < (75 * (AIlevel ** 2 / 64.0))
trigger4 = stateno = 3401 && (movehit = [1, 16]) && random < (100 * (AIlevel ** 2 / 64.0))

[State -1, finishingshower]
type = changestate
value = 3300
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 2000 && !var(20)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = !var(39)
triggerall = p2bodydist x >= 10 && p2bodydist y >= -240 && (enemynear, vel y >= -6) && !(enemynear, hitfall)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 155]) && (enemynear, life <= 30) && random < (200 * (AIlevel ** 2 / 64.0))

[State -1, darknessillusion]
type = changestate
value = 4000
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 3000 && !var(20)
triggerall = !(enemynear, ctrl) && (p2stateno != [120, 155]) && p2statetype != L
triggerall = (p2bodydist x = [0, 90]) && (p2bodydist y >= -120) && (enemynear, vel y = [-2, 2]) && (enemynear, vel x > -3)
trigger1 = ctrl && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = (stateno = [200, 499]) && random < (ifelse((movehit = [1, 16]), 100, 50) * (AIlevel ** 2 / 64.0))

[State -1, eternalslumber]
type = changestate
value = 4100
triggerall = AIlevel && numenemy
triggerall = ifelse(p2statetype = A && p2movetype = H, (enemynear, hitfall), 1) && (enemynear, stateno != [1115301, 1115309])
triggerall = roundstate = 2 && statetype != A && power >= 3000 && !var(20)
triggerall = !var(39)
triggerall = !(enemynear, ctrl) && p2statetype != L && !(enemynear, hitfall)
triggerall = p2bodydist x >= 10 && p2bodydist y >= -180 && (enemynear, vel y >= 0) && (enemynear, vel x <= 2)
triggerall = (enemynear, const(size.head.pos.y) <= -40) || (enemynear, statetype = A)
trigger1 = ctrl && (p2bodydist x = [0, 90]) && (p2dist y = [-5, 5]) && random < (50 * (AIlevel ** 2 / 64.0))
trigger2 = ctrl && (p2stateno = [120, 155]) && p2statetype != A && random < (100 * (AIlevel ** 2 / 64.0))
