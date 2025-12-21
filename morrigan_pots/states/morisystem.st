; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; 
;==============================================================================================
;=======================================<COMMON STATES>========================================
;==============================================================================================

;====================<STANDING>====================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0
juggle = 0

[State 0, Gone]
type = destroyself
trigger1 = ishelper
removeexplods = 1

[State 0, Walk Transition Frame]
type = changeanim
trigger1 = !time
trigger1 = anim = 20 || anim = 21
value = 2

[State 0, Anim]
type = changeanim
trigger1 = anim != 0
trigger1 = anim != 2
trigger1 = anim != 5
trigger2 = anim = 2 && !animtime
trigger3 = anim = 5 && !animtime
value = 0

[State 0, Dead]
type = selfstate
trigger1 = !alive
value = 5050
ctrl = 0

[State 0, Not Myself]
type = selfstate
trigger1 = stateno != [0,199]
trigger1 = time > 0
value = 5040


;====================<CROUCHING>====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 12
value = 10
elem = 5 - animelemno(0)

[State 10, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 47
value = 10
elem = 2

[State 10, Anim]
type = changeanim
trigger1 = anim != 10
value = 10

[State 10, End]
type = selfstate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6
trigger1 = !animtime
value = 11


[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time
trigger1 = anim = 10
value = 12
elem = 5 - animelemno(0)

[State 12, Anim]
type = changeanim
trigger1 = anim != 12
value = 12

[State 12, End]
type = selfstate
trigger1 = !animtime
value = 0


;==========<WALK>==========
[Statedef 20]
type = S
physics = S
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = 1
x = ifelse(command = "holdfwd", const(velocity.walk.fwd.x), ifelse(command = "holdback", const(velocity.walk.back.x), vel x))

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 5 && anim != 12 && anim != 20
trigger2 = anim = 5
trigger2 = !animtime
trigger3 = anim = 12
trigger3 = !animtime
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 5 && anim != 12 && anim != 21
trigger2 = anim = 5
trigger2 = !animtime
trigger3 = anim = 12
trigger3 = !animtime
value = 21

[State 20, Walking FX]
type = helper
trigger1 = anim = [20, 21]
trigger1 = !numhelper(6010)
helpertype = normal
stateno = 6010
ID = 6010
name = "Walking FX"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1


;===================<JUMPING>================
;----- JUMP START -----
[Statedef 40]
type = S
physics = S
movetype = I
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 40, Keyboard Check]; currently obsolete in Ikemen
type = changestate
trigger1 = !time
trigger1 = prevstateno = 52
trigger1 = command = "holddown" && command = "holdup"
value = 10
ctrl = 1

[State 40, Direction]
type = varset
trigger1 = !time
sysvar(1) = 0

[State 40, Direction]
type = varset
trigger1 = time >= 1
trigger1 = command = "holdfwd" || command = "holdback"
sysvar(1) = (command = "holdfwd") - (command = "holdback")
persistent = 0

[State 40, Direction]
type = varset
trigger1 = 1
sysvar(1) = ifelse(p2bodydist x < 30, 0, ifelse((life - p2life) > 200 && p2movetype != H && random < 333, -1, 1))

[State 40, High Jump]
type = varset
trigger1 = !time
var(10) = 0

[State 40, High Jump]
type = varset
trigger1 = !time
var(11) = 3

[State 40, High Jump]
type = varset
trigger1 = !time
trigger1 = p2bodydist x > 80 && p2statetype != L
trigger1 = random < 333
var(12) = 3

[State 40, Jump Cancel]
type = varset
trigger1 = prevstateno = 425
var(13) = 3

[State 40, Jump Cancel]
type = varset
trigger1 = prevstateno = 425
var(14) = 0

[State 40, Sound]
type = playsnd
trigger1 = !animtime
value = 0, 40

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Jump Dust"
postype = p1
ownpal = 1

[State 40, Vel Normal]
type = velset
trigger1 = !animtime
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel Long]
type = velset
trigger1 = !animtime && var(12) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.runjump.fwd.x), const(velocity.runjump.back.x)))
y = ifelse(!sysvar(1), const(velocity.runjump.y), const(velocity.jump.y))

[State 40, End]
type = selfstate
trigger1 = !animtime
value = 50
ctrl = 1


;----- JUMP UP -----
[Statedef 50]
type = A
physics = N
movetype = I
sprpriority = 1

[State 50, Anim]
type = changeanim
trigger1 = !time
value = ifelse(!vel x, 41, ifelse((vel x) > 0, 42, 43))

[State 50, Grounded Frame]
type = posfreeze
trigger1 = time < 1 && prevstateno = 40
value = 1

[State 50, Accel]
type = gravity
trigger1 = time >= 1 || prevstateno != 40

[State 50, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP FALL -----
[Statedef 51]
type = A
physics = N
movetype = I
sprpriority = 1

[State 51, Accel]
type = gravity
trigger1 = 1

[State 51, Land]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- JUMP LAND -----
[Statedef 52]
type = S
physics = S
movetype = I
anim = 47
ctrl = 1; state -1 only sees this in the next frame
velset = 0, 0
sprpriority = 1

[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, Disable Trip Guard]; this is a bit different between Mugen and Ikemen
type = assertspecial
trigger1 = !time
trigger1 = prevstateno != [5000, 5999]
trigger1 = prevstateno != 50 && prevstateno != 51 && prevstateno != [120, 155]
trigger1 = prevstateno != 703; air parry
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 52, Trip Guard]; actually no longer necessary for human players
type = changestate
triggerall = !time
triggerall = ctrl
triggerall = inguarddist
triggerall = 1
trigger1 = command = "holdback"
trigger2 = random < 500
value = 120

[State 52, No Walk]
type = assertspecial
trigger1 = animtime
trigger1 = anim != 5
flag = nowalk

[State 52, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
sprpriority = -5
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 52, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<FLY FORWARD>===========================
[Statedef 100]
type = U
physics = N
anim = ifelse(statetype = A, 103, 102)
ctrl = 0
sprpriority = 1
velset = 0, 0

[State 100, Ground or Air]
type = varset
trigger1 = !time
var(0) = (statetype = A)

[State 100, Change]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [102, 103]
value = 100

[State 100, Type]
type = statetypeset
trigger1 = anim != [102, 103]
trigger2 = pos y < 0
statetype = A

[State 100, Assert]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 100, Ctrl]
type = ctrlset
trigger1 = time >= 8
trigger1 = anim != [102, 103]
value = 1

[State 100, Jet]
type = helper
trigger1 = !numhelper(6020)
trigger1 = anim = 100 || anim = 110 || anim = 115
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 100, Change]
type = changeanim
triggerall = anim = 100
trigger1 = command = "holdup"
trigger2 = p2dist y < -50
value = 110

[State 100, Change]
type = changeanim
triggerall = anim = 100
triggerall = time > 10 || var(0)
trigger1 = command = "holddown"
trigger2 = (p2dist x - 64) < p2dist y
value = 115

[State 100, Change]
type = changeanim
triggerall = anim = 110
trigger1 = command != "holdup"
trigger1 = command = "holdfwd"
trigger2 = p2dist y = [-50, 50]
value = 100

[State 100, Change]
type = changeanim
triggerall = anim = 115
trigger1 = command != "holddown"
trigger1 = command = "holdfwd"
trigger2 = p2dist y = [-50, 50]
value = 100

[State 100, Vel]
type = velset
trigger1 = anim = 100
x = const(velocity.run.fwd.x)
y = const(velocity.run.fwd.y)

[State 100, Vel]
type = velset
trigger1 = anim = 110
x = 0.5 * const(velocity.run.fwd.x)
y = -0.75 * const(velocity.run.fwd.x)

[State 100, Vel]
type = velset
trigger1 = anim = 115
x = const(velocity.run.fwd.x)
y = -const(velocity.run.fwd.y)

[State 100, Change]
type = changeanim
triggerall = time > 10
triggerall = anim != 101
trigger1 = time > ifelse(var(0), 23, 38)
trigger2 = command = "holdback"
trigger3 = anim = 100 && command != "holdfwd"
trigger4 = anim = 110 && command != "holdup"
trigger5 = anim = 115 && command != "holddown"
trigger6 = p2dist x < 60
value = 101

[State 100, Vel]
type = velmul
trigger1 = anim = 101
trigger1 = animelemtime(1) = 0
x = 0.5

[State 100, Accel]
type = veladd
trigger1 = anim = 101
trigger1 = animelemtime(1) > 0
x = ifelse(abs(vel x) < 0.079, -vel x, ifelse(vel x < 0, 0.079, -0.079)); 4096
y = const(movement.yaccel)

[State 100, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;======================<FLY BACKWARD>===========================
[Statedef 105]
type = U
physics = N
anim = ifelse(statetype = A, 103, 102)
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 105, Ground or Air]
type = varset
trigger1 = !time
var(0) = (statetype = A)

[State 105, Change]
type = changeanim
trigger1 = !animtime
trigger1 = anim = [102, 103]
value = 105

[State 105, Type]
type = statetypeset
trigger1 = anim != [102, 103]
trigger2 = pos y < 0
statetype = A

[State 105, Assert]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 105, Ctrl]
type = ctrlset
trigger1 = time >= 8
trigger1 = anim != [102, 103]
value = 1

[State 105, Jet]
type = helper
trigger1 = !numhelper(6020)
trigger1 = anim = 105 || anim = 110 || anim = 115
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
size.xscale = 0.5 * const(size.xscale)
size.yscale = 0.5 * const(size.yscale)
ownpal = 1

[State 105, Change]
type = changeanim
triggerall = anim = 105
trigger1 = command = "holdup"
trigger2 = p2dist y > 50
value = 110

[State 105, Change]
type = changeanim
triggerall = anim = 110
trigger1 = command != "holdup"
trigger1 = command = "holdback"
trigger2 = p2dist y < -50
value = 105

[State 105, Vel]
type = velset
trigger1 = anim = 105
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, Vel]
type = velset
trigger1 = anim = 110
x = 0.933 * const(velocity.run.back.y)
y = 0.918 * const(velocity.run.back.x)

[State 105, Change]
type = changeanim
triggerall = anim != 101
triggerall = time > 10
trigger1 = time > ifelse(var(0), 23, 38)
trigger2 = command = "holdfwd"
trigger3 = anim = 105 && command != "holdback"
trigger4 = anim = 110 && command != "holdup"
trigger5 = p2dist x < 60
value = 101

[State 105, Vel]
type = velmul
trigger1 = anim = 101
trigger1 = animelemtime(1) = 0
x = 0.5

[State 105, Accel]
type = veladd
trigger1 = anim = 101
trigger1 = animelemtime(1) > 0
x = ifelse(abs(vel x) < 0.039, -vel x, ifelse(vel x < 0, 0.039, -0.039)); 2048
y = const(movement.yaccel)

[State 105, End]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;========================<GUARD>========================
;----- START -----
[Statedef 120]
type = U
physics = U

[State 120, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard

[State 120, AI Tranquilizer]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 120, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = A

[State 120, Vel]
type = velset
trigger1 = !time
trigger1 = statetype != A
x = 0
y = 0

[State 120, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 120, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2

[State 120, End]
type = changestate
trigger1 = !animtime
value = 130 + (statetype = C) + (statetype = A) * 2

[State 120, Stop Guarding]
type = changestate
triggerall = statetype != A
trigger1 = !inguarddist
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = animelem = 5
value = 140

[State 120, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- STAND GUARD (Guarding) -----
[Statedef 130]
type = S
physics = S
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 130, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 130, AI Tranquilizer]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130

[State 130, AI fix]
type = changestate
trigger1 = numenemy
trigger1 = time >= 60
trigger1 = random < 17
value = 40

[State 130, Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 0, 52

[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 130, High to Low]
type = changestate
trigger1 = command = "holddown"
trigger2 = random < 500
value = 131

[State 130, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = animelem = 5
value = 140

[State 130, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk


;----- CROUCH GUARD (Guarding) -----
[Statedef 131]
type = C
physics = C
velset = ifelse(prevstateno = 132 && abs(vel x) < 5, 0, vel x), 0

[State 131, Do or do not]
type = assertspecial
trigger1 = 1
flag = nostandguard
flag2 = nocrouchguard

[State 131, AI Tranquilizer]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131

[State 131, Low to High]
type = changestate
trigger1 = command != "holddown"
trigger2 = random > 500
value = 130

[State 131, AI fix]
type = changestate
trigger1 = numenemy
trigger1 = time >= 60
trigger1 = random < 17
value = 40

[State 131, Stop Guarding]
type = changestate
trigger1 = !inguarddist
trigger2 = p2dist x >= 0
trigger2 = command != "holdback" || command = "holdfwd"
trigger3 = p2dist x < 0
trigger3 = command != "holdfwd" || command = "holdback"
trigger4 = animelem = 5
value = 140


;----- AIR GUARD (Guarding) -----
[Statedef 132]
type = A
physics = N

[State 132, Do or do not]
type = assertspecial
trigger1 = 1
flag = noairguard

[State 132, AI Tranquilizer]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 132, Anim]
type = changeanim
trigger1 = anim != 132
value = 132

[State 132, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 132, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 132, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
value = 130

[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52

;[State 132, Stop guarding was here]


;----- GUARD (End) -----
[Statedef 140]
type = U
physics = U
ctrl = 1

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = S
physics = S

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = C
physics = C

[State 140, Type]
type = statetypeset
trigger1 = !time
trigger1 = statetype = A
physics = A

[State 140, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 140, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2

[State 140, No Walking]
type = assertspecial
triggerall = ctrl
trigger1 = p2dist x >= 0
trigger1 = command != "holdfwd"
trigger2 = p2dist x < 0
trigger2 = command != "holdback"
flag = nowalk

[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51


;----- STAND GUARD HIT (Shaking) -----
[Statedef 150]
type = S
physics = N
movetype = H
velset = 0, 0

[State 150, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150

[State 150, End]
type = changestate
trigger1 = hitshakeover
value = ifelse(command = "holddown", 153, 151)

[State 150, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 150, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 150, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- STAND GUARD HIT 2 (Knocked back) -----
[Statedef 151]
type = S
physics = S
movetype = H
anim = 130

[State 151, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 151, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 151, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 151, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 151, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;----- CROUCH GUARD HIT (Shaking) -----
[Statedef 152]
type = C
physics = N
movetype = H
velset = 0, 0

[State 152, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151

[State 152, End]
type = changestate
trigger1 = hitshakeover
value = ifelse(command = "holddown", 153, 151)

[State 152, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 152, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 152, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- CROUCH GUARD HIT 2 (Knocked back) -----
[Statedef 153]
type = C
physics = C
movetype = H
anim = 131

[State 153, Vel]
type = hitvelset
trigger1 = !time
x = 1

[State 153, Vel]
type = velset
trigger1 = time = gethitvar(slidetime)
trigger2 = hitover
x = 0

[State 153, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 153, High to Low]
type = statetypeset
triggerall = statetype = S
trigger1 = command = "holddown"
trigger2 = random < 500
statetype = C
physics = C

[State 153, Low to High]
type = statetypeset
triggerall = statetype = C
trigger1 = command != "holddown"
trigger2 = random > 500
statetype = S
physics = S

[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;----- AIR GUARD HIT (Shaking) -----
[Statedef 154]
type = A
physics = N
movetype = H
velset = 0, 0

[State 154, Stop Snd]
type = stopsnd
trigger1 = !time
channel = 0

[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152

[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155

[State 154, Rumble]
type = forcefeedback
trigger1 = !time
waveform = square
time = max(4, gethitvar(hitshaketime) / 2)


;----- AIR GUARD HIT 2 (Knocked away) -----
[Statedef 155]
type = A
physics = N
movetype = H
anim = 132

[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 155, Accel]
type = veladd
trigger1 = 1
y = const(movement.yaccel)

[State 155, Ctrl]
type = ctrlset
trigger1 = time = gethitvar(ctrltime)
value = 1

[State 155, Var]
type = varset
trigger1 = 1
sysvar(0) = vel y > 0 && (pos y > -vel y)

[State 155, Vel]
type = velset
trigger1 = sysvar(0)
y = 0

[State 155, Pos]
type = posset
trigger1 = sysvar(0)
y = 0

[State 155, End]
type = changestate
triggerall = sysvar(0) && inguarddist
trigger1 = ifelse(p2dist x < 0, command = "holdfwd", command = "holdback")
value = 130

[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52


;====================<PARRY>====================
;----- STANDING -----
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1

[State Freeze Parried Helper]
redirectID = 1
type = posadd
trigger1 = playerIDexist(1)
trigger1 = playerID(1), movetype = A
x = -1 * playerID(1), vel x
y = -1 * playerID(1), vel y

[State 700, Consecutive Parries]
type = posadd
trigger1 = !time
trigger1 = 1
x = -8

[State 700, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 700, No walking]
type = varset
trigger1 = 1
var(20) = 4

[State 700, Sound]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 700, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 700, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = ceil(15 * const(size.xscale)), -71
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 700, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- CROUCHING -----
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1

[State Freeze Parried Helper]
redirectID = 1
type = posadd
trigger1 = playerIDexist(1)
trigger1 = playerID(1), movetype = A
x = -1 * playerID(1), vel x
y = -1 * playerID(1), vel y

[State 701, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 701, No walking]
type = varset
trigger1 = 1
var(21) = 4

[State 701, Sound]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 701, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 701, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = ceil(30 * const(size.xscale)), -21
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 701, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;----- JUMPING -----
[Statedef 702]
type = A
physics = N
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 0
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State Check Parried Helper]
type = null
trigger1 = !time
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1

[State Freeze Parried Helper]
redirectID = 1
type = posadd
trigger1 = playerIDexist(1)
trigger1 = playerID(1), movetype = A
x = -1 * playerID(1), vel x
y = -1 * playerID(1), vel y

[State 702, Freeze]
type = posfreeze
trigger1 = 1
value = 1

[State 702, Sound]
type = playsnd
trigger1 = !time
value = 3, 2
channel = 0

[State 702, Sound]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, FX]
type = explod
trigger1 = !time
anim = 7200
sprpriority = 5
postype = p1
pos = ceil(33 * const(size.xscale)), -48
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 702, Shake]
type = envshake
trigger1 = !time
time = 1
ampl = 0

[State 702, End]
type = changestate
trigger1 = !animtime
value = 703
ctrl = 1


[Statedef 703]
type = A
physics = N
movetype = I
anim = 703
ctrl = 1

[State 703, Vel]
type = velset
trigger1 = !time
x = vel x
y = ifelse(vel y < -2.5, vel y, -2.5)

[State 703, Accel]
type = gravity
trigger1 = time > 0

[State 703, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;----- HELPER -----
[Statedef 705]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 706, ifelse(root, statetype = A, 707, 705))
velset = 0, 0
ctrl = 0

[State 705, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 705, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = root, command = "D"
trigger2 = (root, statetype != A) && p2statetype = C
value = 706

[State 705, Anim]
type = changeanim
triggerall = !time
trigger1 = root, command = "F"
trigger2 = anim != 706
value = ifelse((root, statetype = A), 707, 705)

[State 705, Anim]
type = changeanim
trigger1 = anim = 705 || anim = 707
value = ifelse((root, statetype = A), 707, 705)

[State 705, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 8, 10)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = root, stateno != [700, 702]
trigger3 = root, stateno != 5120
trigger4 = root, stateno = [120, 155]
trigger4 = root, stateno != 140
var(0) = 1

[State 705, Disable]
type = varset
triggerall = !var(0)
trigger1 = root, p2dist x >= 0
trigger1 = root, command = "holdback"
trigger2 = root, p2dist x < 0
trigger2 = root, command = "holdfwd"
trigger3 = time < 5
trigger3 = root, p2dist x >= 0
trigger3 = (root, command = "holdfwd" + root, command = "holddown") > 1
trigger4 = time < 5
trigger4 = root, p2dist x < 0
trigger4 = (root, command = "holdback" + root, command = "holddown") > 1
trigger5 = time >= 5
trigger5 = root, p2dist x >= 0
trigger5 = root, command = "holdfwd" || root, command = "holddown"
trigger6 = time >= 5
trigger6 = root, p2dist x < 0
trigger6 = root, command = "holdback" || root, command = "holddown"
trigger7 = time >= 1
trigger7 = anim = 705 || anim = 707
trigger7 = root, command = "D"
trigger8 = time >= 1
trigger8 = anim = 706
trigger8 = ifelse(root, p2dist x < 0, root, command = "B", root, command = "F")
var(0) = 1

[State 705, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9999

[State 705, Standing / Air]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 705 || anim = 707
trigger1 = 1
reversal.attr = SCA, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Crouching]
type = reversaldef
trigger1 = !var(0)
trigger1 = anim = 706
trigger1 = 1; no air
reversal.attr = SC, AA
p1stateno = 706
pausetime = 0, 15
sparkno = -1
numhits = 0

[State 705, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr =
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 705, End]
type = destroyself
trigger1 = time >= 23
trigger2 = root, movetype != I
trigger3 = root, ctrl = 0
trigger3 = root, stateno != [700, 702] && root, stateno != 5120
trigger4 = root, stateno = [700, 702]
trigger4 = root, time <= 1


;----- Success -----
[Statedef 706]
movetype = I
ctrl = 0

[State 706, Disable]
type = varset
trigger1 = 1
var(0) = 1

[State 706, End]
type = destroyself
trigger1 = root, stateno = [700, 702]
trigger2 = time >= 2


;==========<DODGE>==========
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1

[State Erase Inputs]
type = varset
var(23) = 1
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 710, Sound]
type = playsnd
trigger1 = !time
value = 4, 0
channel = 0

[State 710, Sound]
type = playsnd
trigger1 = animelem = 1
value = 1, 4
;channel = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0

[State 710, HB]
type = hitby
trigger1 = animtime != 0
value = SCA, AT
time = 1

[State 710, Attack]
type = changestate
trigger1 = time = [15, 25]
trigger1 = command = "a" || command = "b" || command = "c" || command = "x" || command = "y" || command = "z"
value = ifelse((command = "a" || command = "b" || command = "c"), 240, 221)

[State 710, Attack]
type = changestate
trigger1 = time = [15, 25]
trigger1 = !inguarddist
trigger1 = p2dist y >= -60
trigger1 = abs(p2bodydist x) < 80
value = ifelse(abs(p2bodydist x) < 30, 221, 240)

[State 710, AI Guard]
type = null
trigger1 = animtime = [-10, -1]
trigger1 = facing = 1
flag = L

[State 710, AI Guard]
type = null
trigger1 = animtime = [-10, -1]
trigger1 = facing = -1
flag = R

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<ROLL>==========
;----- FORWARD -----
[Statedef 720]
type = S
physics = N
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = varset
var(23) = 1
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 720, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 4

[State 720, Vel]
type = velset
trigger1 = animelem = 2
x = 5.5

[State 720, Vel]
type = velset
trigger1 = animelem = 7
x = 0

[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1

[State 720, Push]
type = playerpush
trigger1 = animelemtime(8) < 0
value = 0

[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;----- BACKWARD -----
[Statedef 725]
type = S
physics = N
movetype = I
anim = 725
velset = 0, 0
ctrl = 0
sprpriority = 1

[State Erase Inputs]
type = varset
var(23) = 1
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 725, Sound]
type = playsnd
trigger1 = animelem = 1
value = 5, 4

[State 725, Vel]
type = velset
trigger1 = animelem = 2
x = -4.125

[State 725, Vel]
type = velset
trigger1 = animelem = 7
x = 0

[State 725, HB]
type = hitby
trigger1 = animelemtime(7) < 0
value = SCA, AT
time = 1

[State 725, Push]
type = playerpush
trigger1 = animelemtime(7) < 0
value = 0

[State 725, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<POWER CHARGE>==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State Erase Inputs]
type = varset
var(23) = 1
trigger1 = time <= 0
value = 1
ignorehitpause = 1
persistent = 0

[State 740, Power]
type = poweradd
trigger1 = 1
value = 4 + ifelse(time < 60, 0, (time - 60) / 15)

[State 740, Sound]
type = playsnd
trigger1 = time = 8
value = 4, 3
channel = 0

[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 740, FX]
type = helper
trigger1 = !numhelper(7240)
helpertype = normal
stateno = 7240
ID = 7240
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, FX]
type = helper
trigger1 = !numhelper(7241)
helpertype = normal
stateno = 7241
ID = 7241
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Bats]
type = helper
trigger1 = anim = 740
trigger1 = !numhelper(6108)
helpertype = normal
stateno = 6108
ID = 6108
name = "Power Charge Bats"
postype = p1

[State 740, End]
type = changestate
triggerall = time >= 24
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = command != "/b" || command != "/y"
trigger3 = inguarddist || p2bodydist x <= 120
trigger4 = p2movetype = A
trigger4 = animelem = 10
value = 741


;----- END -----
[Statedef 741]
type = S
physics = S
movetype = I
anim = 741
velset = 0, 0
ctrl = 0

[State 741, Sound]
type = stopsnd
trigger1 = !time
channel = 0

[State 741, Sound]
type = playsnd
trigger1 = !time
trigger1 = power >= const(data.power)
value = 4, 5
channel = 0

[State 741, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<GUARD CANCEL>==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 1

[State 750, Strength]
type = varset
trigger1 = !time
var(24) = 1
ignorehitpause = 1

[State 750, Strength AI]
type = varset
trigger1 = !time
var(25) = 1
ignorehitpause = 1

[State 750, Sound]
type = playsnd
trigger1 = !time
value = 3, 1
channel = 0

[State 750, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
time = 5

[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = ceil(28 * const(size.xscale)), -52
ownpal = 1
persistent = 0
supermovetime = 999

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 10
movetime = 10
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0

[State 750, Guard Points]
type = varset
trigger1 = !time
var(26) = 300

[State 750, End]
type = changestate
trigger1 = time >= 15
value = 2900


;===================<DARK FORCE>===================
[Statedef 770]
type = S
physics = S
movetype = I
anim = 770
ctrl = 0
velset = 0, 0
poweradd = -2000

[State 770, NHB]
type = nothitby
trigger1 = 1
time = 2
value = SCA

[State 770, Sound]
type = playsnd
trigger1 = !time
value = 4, 5
channel = 0

[State 770, Sound]
type = playsnd
trigger1 = !time
value = 7, 2

[State 770, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7270
ID = 7270
name = "Dark Force"
postype = p1
pos = 0, -64
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 9999
supermovetime = 9999

[State 770, Var]
type = varset
trigger1 = 1
var(27) = 300

[State 770, illusion]
type = helper
trigger1 = animelemtime(12) = 4
helpertype = normal
stateno = 774
ID = 775
name = "Astral Vision"
postype = p1
facing = -1

[State 770, End]
type = changestate
triggerall = !animtime
trigger1 = !numhelper(775)
trigger2 = numhelper(775)
trigger2 = helper(775), stateno = 775
value = 0
ctrl = 1


;----- RESET -----
[Statedef 771]
type = S
physics = S
movetype = I
anim = 771
ctrl = 0
velset = 0, 0

[State 771, Var]
type = varset
trigger1 = var(27) > 0
var(27) = 0

[State 771, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;====================<CHEAP K.O.>====================
[Statedef 5950]
type = S
movetype = H
physics = S
anim = 5950
velset = 0, 0

[State 5950, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 5950, Pos]
type = posset
trigger1 = 1
y = 0

[State 5950, Assert]
type = assertspecial
trigger1 = 1
flag = nokosnd
flag2 = NoFG
flag3 = noFG

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time
trigger1 = !alive
channel = 0

[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2
trigger1 = !alive
value = 11, 1

[State 5950, Pos]
type = posadd
trigger1 = animelem = 11
x = -12 * const(size.xscale)

[State 5950, Sound]
type = playsnd
trigger1 = animelem = 11
value = F 7, 0

[State 5950, FX]
type = explod
trigger1 = animelem = 11
anim = F 60
postype = p1
pos = 0, 0
ownpal = 1
sprpriority = -10

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==========<TAUNT>==========
[Statedef 195]
type = S
physics = S
movetype = I
anim = 195
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 195, Give power]
type = poweradd
trigger1 = time = 1
trigger1 = numenemy
value = 334

[State 195, Sound]
type = playsnd
trigger1 = anim = 195 && animelem = 3
value = 4, 8
channel = 0

[State 195, Sound]
type = playsnd
trigger1 = anim = 195 && animelem = 2
value = 6, 2

[State 195, Vel]
type = velset
trigger1 = anim = 195 && animelem = 3
y = -2

[State 195, Vel]
type = velmul
trigger1 = anim = 195 && animelemtime(3) >= 0 && animelemtime(5) < 0
y = 0.9

[State 195, Vel]
type = velset
trigger1 = anim = 195 && animelemtime(5) >= 0
y = -0.25 * cos((time -18) / 20.0)

[State 195, Bat Explods]
type = explod
trigger1 = anim = 195 && animelem = 2
anim = 6100
ID = 195
postype = p1
pos = ceil(-35 * const(size.xscale)), -37
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 195, Bat Explods]
type = explod
trigger1 = anim = 195 && animelem = 2
anim = 6100
ID = 195
postype = p1
pos = 2, -40
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 195, Bat Explods]
type = explod
trigger1 = anim = 195 && animelem = 2
anim = 6100
ID = 195
postype = p1
pos = ceil(-21 * const(size.xscale)), -31
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 195, Bat Explods]
type = explod
trigger1 = anim = 195 && animelem = 2
anim = 6100
ID = 195
postype = p1
pos = ceil(-34 * const(size.xscale)), -30
scale = const(size.xscale), const(size.yscale)
sprpriority = 2

[State 195, Bat Explods]
type = explod
trigger1 = anim = 195 && animelem = 2
anim = 6100
ID = 195
postype = p1
pos = ceil(-10 * const(size.xscale)), -36
scale = const(size.xscale), const(size.yscale)
sprpriority = 2

[State 195, Bat Explods]
type = modifyexplod
trigger1 = numexplod(195)
ID = 195
bindtime = -1
removetime = -1
removeongethit = 1
removeonchangestate = 1

[State 195, End]
type = changeanim
trigger1 = anim = 195 && animelemtime(13) >= 0
trigger1 = command != "/s" || roundstate != 2
value = 196

[State 195, Type]
type = statetypeset
trigger1 = anim = 195
trigger1 = animelemtime(3) >= 0
trigger2 = anim = 196
statetype = A
physics = N

[State 195, Type]
type = veladd
trigger1 = anim = 196
y = 0.5

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 196


;---Land---
[Statedef 196]
type = S
physics = S
movetype = I
anim = 47
ctrl = 0
velset = 0, 0
sprpriority = 2

[State 196, Pos]
type = posset
trigger1 = 1
y = 0

[State 196, Sound]
type = playsnd
trigger1 = !time
value = 0, 52

[State 196, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 196, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========<LOSE (Time over)>==========
[Statedef 170]
type = S
ctrl = 0
anim = ifelse(random < 500, 170, 175)
velset = 0, 0

[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 170, Bats]
type = helper
trigger1 = anim = 170
trigger1 = numhelper(6100) < 2
helpertype = normal
stateno = 6104
ID = 6100
name = "Bat"
postype = p1
pos = ifelse(numhelper(6100) = 1, 10, 26), ifelse(numhelper(6100) = 1, -74, -72)


;==========<DRAWGAME (Time over)>==========
[Statedef 175]
type = S
ctrl = 0
velset = 0, 0

[State 175, End]
type = changestate
trigger1 = 1
value = 170


;==========<PREINTRO>==========
[Statedef 190]
type = S
ctrl = 0
velset = 0, 0

[State 190, intro]
type = changestate
trigger1 = 1
value = ifelse((random < 500), 191, 192)


;==========<INTRO 1 - GROUND PORTAL>==========
[Statedef 191]
type = S
physics = N
anim = 191

[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 191, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = noshadow

[State 191, hole]
type = helper
trigger1 = !time
helpertype = normal
stateno = 6005
ID = 6005
name = "Hole"
postype = p1

[State 191, Bats]
type = helper
trigger1 = animelemtime(2) < 0 && numhelper(6100) < 6
helpertype = normal
stateno = 6106
ID = 6100
name = "Bat"
postype = p1

[State 191, Sound]
type = playsnd
trigger1 = animelem = 9
value = 4, ifelse(random < 500, 2, 4)

[State 191, Sound]
type = playsnd
trigger1 = animelem = 13
value = 6, 2

[State 191, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO 2 - TELEPORT>==========
[Statedef 192]
type = A
physics = N
anim = 192

[State 192, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 192, Wait]
type = assertspecial
trigger1 = roundstate = 0
flag = noshadow

[State 192, Sound]
type = playsnd
trigger1 = animelem = 2
value = 5, 11

;[State 192, Scale]
;type = angledraw
;trigger1 = animelemtime(2) >= 0 && animelemtime(2) <= 10
;scale = (animelemtime(2) / 10.0), (10 -(0.9 * animelemtime(2)))

[State 192, Pos]
type = posset
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
y = -56

[State 192, Bound]
type = screenbound
trigger1 = animelemtime(3) < 0
value = 1
movecamera = 1, 0

[State 192, Pos]
type = posset
trigger1 = pos y
trigger1 = animelemtime(2) < 0 || animelemtime(3) >= 0
y = 0

[State 192, Scale]
type = angledraw
trigger1 = animelemtime(2) >= 0 && animelemtime(2) < 5
scale = (5 -0.4 * animelemtime(2)), (0.05 * animelemtime(2))

[State 192, Scale]
type = angledraw
trigger1 = animelemtime(2) >= 5 && animelemtime(2) < 10
scale = (5 -0.4 * animelemtime(2)), (0.25 + 0.15 * (animelemtime(2) -5))

[State 192, pal]
type = palfx
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0 && !(time % 2)
time = 1
add = 255, 255, 255

[State 192, pal]
type = palfx
trigger1 = time % 2
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
time = 1
invertall = 1
color = -256

[State 192, pal]
type = palfx
trigger1 = animelem = 3
time = 10
add = 255, 255, 255
sinadd = -255, -255, -255, 40

[State 192, Dust]
type = explod
trigger1 = animelemtime(2) = -1
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.33, 0.33
ownpal = 1

[State 192, End]
type = changestate
trigger1 = !animtime
value = 0


;==========<INTRO vs VIUDA NEGRA>==========
[Statedef 360]
type = S
physics = N
anim = 360

[State 360, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 360, Bats]
type = helper
trigger1 = numhelper(6100) < 5
helpertype = normal
stateno = 6111
ID = 6100
name = "Bat"
postype = p2

[State 360, Anim]
type = changeanim
trigger1 = anim = 360 && time >= 120
value = 361

[State 360, Sound]
type = playsnd
trigger1 = anim = 361 && animelem = 4
value = 4, 20
channel = 0

[State 360, End]
type = changestate
trigger1 = !animtime
trigger1 = anim = 361
value = 0


;====================<WIN POSE DECIDER>====================
[Statedef 180]
type = S
ctrl = 0
velset = 0, 0

;[State 180, Quote]
;type = victoryquote
;trigger1 = 1
;value = randomrange(1, 10)

[State 180, Win]
type = changestate
trigger1 = command = "/b" || command = "/c" || command = "/y" || command = "/z"
value = ifelse((command = "/c" || command = "/z"), 189, 181)

[State 180, Win]
type = changestate
trigger1 = command = "/x" || command = "/a"
value = ifelse((command = "/x"), 182, 183)

[State 180, Win]
type = changestate
trigger1 = 1
value = ifelse(random < 250, 181, ifelse(random < 333, 182, ifelse(random < 500, 183, 189)))


;==========<WIN 1>==========
[Statedef 181]
type = S
anim = 181
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 181, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 181, Pos]
type = posset
trigger1 = pos y
y = 0

[State 181, Sound]
type = playsnd
trigger1 = !time
value = 6, 2

[State 181, Bats]
type = helper
trigger1 = animelemtime(2) < 0 && numhelper(6100) < 8
helpertype = normal
stateno = 6107
ID = 6100
name = "Bat"
postype = p1
pos = ceil(-4 * const(size.xscale)), -60
facing = ifelse(!(numhelper(6100) % 2), -1, 1)

[State 181, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, 3
channel = 0
persistent = 0

[State 181, Sound]
type = playsnd
trigger1 = animelem = 4 || animelem = 11
value = 0, 40
;channel = 1


;==========<WIN 2>==========
[Statedef 182]
type = S
anim = 182
ctrl = 0
velset = 0, 0

[State 182, Sound]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(random < 500, 6, 20)
persistent = 0

[State 182, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 182, Pos]
type = posset
trigger1 = pos y
y = 0


;==========<WIN FLOAT>==========
[Statedef 183]
type = S
movetype = I
physics = S
anim = 183
velset = 0, 0
sprpriority = 1
ctrl = 0

[State 183, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 183, Sound]
type = playsnd
trigger1 = animelem = 4
value = 4, 7
channel = 0

[State 183, Sound]
type = playsnd
trigger1 = time = 5
value = 6, 2

[State 183, Vel]
type = velset
trigger1 = animelem = 3
y = -3

[State 183, Vel]
type = velmul
trigger1 = animelemtime(3) >= 0 && animelemtime(3) < 12
y = 0.9

[State 183, Vel]
type = velset
trigger1 = animelemtime(3) >= 12
y = -0.25 * cos((animelemtime(3) -12) / 20.0)

[State 183, FX]
type = explod
trigger1 = animelem = 1
anim = 6040
ID = 6040
sprpriority = 2
postype = p1
ownpal = 1
scale = const(size.xscale), const(size.yscale)

[State 183, Bat Explods]
type = explod
trigger1 = time = 5
anim = 6100
ID = 183
postype = p1
pos = ceil(-35 * const(size.xscale)), -37
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 183, Bat Explods]
type = explod
trigger1 = time = 10
anim = 6100
ID = 183
postype = p1
pos = 2, -40
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 183, Bat Explods]
type = explod
trigger1 = time = 15
anim = 6100
ID = 183
postype = p1
pos = ceil(-21 * const(size.xscale)), -31
scale = const(size.xscale), const(size.yscale)
sprpriority = 0

[State 183, Bat Explods]
type = explod
trigger1 = time = 20
anim = 6100
ID = 183
postype = p1
pos = ceil(-34 * const(size.xscale)), -30
scale = const(size.xscale), const(size.yscale)
sprpriority = 2

[State 183, Bat Explods]
type = explod
trigger1 = time = 25
anim = 6100
ID = 183
postype = p1
pos = ceil(-10 * const(size.xscale)), -36
scale = const(size.xscale), const(size.yscale)
sprpriority = 2

[State 183, Bat Explods]
type = modifyexplod
trigger1 = numexplod(183)
ID = 183
bindtime = -1
removetime = -1
removeongethit = 1

[State 183, Type]
type = statetypeset
trigger1 = animelem = 3
statetype = A
physics = N


;==========<WIN COSTUME>==========
[Statedef 189]
type = S
anim = 189
velset = 0, 0
ctrl = 0

[State 189, Wait]
type = assertspecial
trigger1 = time < 300
flag = roundnotover

[State 189, Type]
type = varset
trigger1 = !time
var(0) = 0

[State 189, Type]
type = varset
trigger1 = command = "/c"
trigger2 = random < 500
var(0) = 1

[State 189, Pos]
type = posset
trigger1 = pos y
y = 0

[State 189, FX]
type = explod
trigger1 = anim = 189 && animelem = 11
anim = 6040
ID = 6040
sprpriority = 3
postype = p1
ownpal = 2
scale = const(size.xscale), const(size.yscale)

[State 189, Sound]
type = playsnd
trigger1 = anim = 189 && animelem = 11
value = 6, 2
persistent = 0

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6101
name = "Bat"
postype = p1
pos = ceil(-23 * const(size.xscale)), -49

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6102
name = "Bat"
postype = p1
pos = ceil(-31 * const(size.xscale)), -38
facing = 1

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6103
name = "Bat"
postype = p1
pos = ceil(-35 * const(size.xscale)), -24

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6104
name = "Bat"
postype = p1
pos = ceil(-38 * const(size.xscale)), -11

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6101
name = "Bat"
postype = p1
pos = ceil(-4 * const(size.xscale)), -43
facing = -1

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6102
name = "Bat"
postype = p1
pos = 1, -36
facing = -1

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6103
name = "Bat"
postype = p1
pos = ceil(4 * const(size.xscale)), -29
facing = -1

[State 189, Bats]
type = helper
trigger1 = anim = 189 && animelem = 11
helpertype = normal
stateno = 6109
ID = 6104
name = "Bat"
postype = p1
pos = ceil(7 * const(size.xscale)), -22
facing = -1

[State 189, Anim Random]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 189
trigger1 = !var(0)
value = ifelse(random < 200, 351, ifelse(random < 250, 352, ifelse(random < 333, 353, ifelse(random < 500, 354, 357))))

[State 189, Anim Random]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 189
trigger1 = var(0)
value = ifelse(random < 143, 350, ifelse(random < 167, 355, ifelse(random < 200, 356, ifelse(random < 250, 360, ifelse(random < 333, 367, ifelse(random < 500, 368, 369))))))

[State 189, Sound]
type = playsnd
trigger1 = anim != 189 && anim != 367 && anim != 368 && anim != 369
value = 4, ifelse(random < 333, 1, ifelse(random < 333, 2, 9))
channel = 0
persistent = 0

[State 189, Gomen]
type = playsnd
trigger1 = anim = 367 && animelem = 6
value = 4, 21
channel = 0

[State 189, Sound]
type = playsnd
trigger1 = anim = 368 && animelem = 2
trigger2 = anim = 369 && animelem = 4
value = 4, 20
channel = 0

[State 189, Sound]
type = playsnd
trigger1 = anim = 367 && animelem = 6
trigger2 = anim = 369 && animelem = 4
value = 1, 1
;channel = 1


;==========<CONTINUE?>==========
[Statedef 5500]
type = S
ctrl = 0
velset = 0, 0

[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500


;==========<INITIALIZE>==========
;----- Before Config -----
[Statedef 5900]
type = S
anim = 9999

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
value = 0

[State 5900, Var Reset]
type = varrangeset
trigger1 = !roundsexisted
fvalue = 0

[State 5900, Palette]
type = remappal
trigger1 = 1
source = 1, 1
dest = 1, palno

[State 5900, Set PalFX 1 Colors]
type = null
;Purple
trigger1 = palno = 2 || palno = 3 || palno = 5 || palno = 9
trigger1 = 1
;Magenta
trigger2 = palno = 4
trigger2 = 1
;Red
trigger3 = palno = 6
trigger3 = 1
;Yellow
trigger4 = palno = 8
trigger4 = 1
;Blue
trigger5 = palno = 10
trigger5 = 1
;Green (Default)
trigger6 = 1
trigger6 = 1

[State 5900, End]
type = changestate
trigger1 = time > 0; Wait for enemy to be loaded
value = 5901; Config


;----- After Config -----
[Statedef 5902]
type = S

[State 190, Intro vs Viuda Negra]
type = changestate
trigger1 = roundno = 1
trigger1 = numenemy = 1 && !numpartner
trigger1 = enemy, authorname = "Andrs Borghi" || enemy, authorname = "Andres Borghi"
trigger1 = enemy, name = "Viuda Negra" || enemy, name = "Ananzi"
value = 360

[State 5902, End]
type = changestate
trigger1 = !time
value = ifelse(!roundsexisted, 190, 0)


;==========<FALL RECOVERY>==========
[Statedef 5200]
type = A
physics = N
movetype = H

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035
trigger1 = !animtime
value = 5050

[State 5200, Accel]
type = veladd
trigger1 = time > 0
y = 0.35

[State 5200, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.groundlevel)
value = 5201


[Statedef 5201]
type = S
physics = N
movetype = I
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0

[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0

[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5201, Sound]
type = playsnd
trigger1 = animelem = 1
value = 3, 3
channel = 0

[State 5201, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5201, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-16 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5201, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 5201, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 5210]
type = A
physics = N
movetype = I
anim = 5210
ctrl = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 3, 3
channel = 0

[State 5210, Sound]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 20
time = 5

[State 5210, FX]
type = explod
trigger1 = !time
ID = 8200
anim = 8200
postype = p1
pos = 0, ceil(-74 * const(size.yscale))
pausemovetime = -1
supermovetime = -1
ownpal = 1
ontop = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = const(movement.air.gethit.airrecover.yaccel)

[state 5210, Vel]
type = velmul
trigger1 = !time
x = const(velocity.air.gethit.airrecover.mul.x)
y = const(velocity.air.gethit.airrecover.mul.y)

[state 5210, Vel]
type = veladd
trigger1 = !time
x = const(velocity.air.gethit.airrecover.add.x)
y = const(velocity.air.gethit.airrecover.add.y)

[state 5210, Up]
type = veladd
trigger1 = !time
trigger1 = command = "holdup"
y = const(velocity.air.gethit.airrecover.up)

[state 5210, Down]
type = veladd
trigger1 = !time
trigger1 = command = "holddown"
y = const(velocity.air.gethit.airrecover.down)

[state 5210, Forward]
type = veladd
trigger1 = !time
trigger1 = command = "holdfwd"
x = const(velocity.air.gethit.airrecover.fwd)

[state 5210, Back]
type = veladd
trigger1 = !time
trigger1 = command = "holdback"
x = const(velocity.air.gethit.airrecover.back)

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;========================<RETREAT>==========================
[Statedef 5230]
type = L
physics = N
movetype = I
anim = 5230
ctrl = 0
velset = 0, 0
sprpriority = 0

[State 5230, Vel Backward]
type = velset
trigger1 = !time
x = -6.39

[State 5230, Vel Forward]
type = velset
triggerall = !time
trigger1 = command = "holdfwd"
trigger2 = random < 500
x = 6.39

[State 5230, Vel]
type = velset
trigger1 = animelem = 2
x = 0

[State 5230, Push]
type = playerpush
trigger1 = animelemtime(6) < 0
value = 0

[State 5230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================<TARGET OTG OVERRIDE>========================
[Statedef 1115080]
type = L
physics = N
movetype = H
velset = 0, 0

[State 1115080, Pos]
type = posset
trigger1 = 1
y = 0

[State 1115080, Anim]
type = changeanim
trigger1 = 1
value = 5080

[State 1115080, End]
type = changestate
trigger1 = hitshakeover
value = 1115081


[Statedef 1115081]
type = L
physics = C
movetype = H
velset = 0, 0

[State 1115081, Var]
type = varset
trigger1 = !time
sysvar(0) = 1

[State 1115081, End]
type = selfstate
trigger1 = time >= 18
value = 5110


;==================================================================================================
;===========================================<STATE -2>=============================================
;==================================================================================================
[Statedef -2]

[State -2, Reset Combo Limits]
type = null
trigger1 = numenemy
trigger1 = time > 0
trigger1 = 1
trigger1 = 1
trigger1 = 1
trigger1 = 1
ignorehitpause = 1

[State -2, Dark Force]
type = varadd
trigger1 = var(27) > 0
var(27) = -1
ignorehitpause = 1

[State -2, Dark Force End]
type = varset
triggerall = var(27) > 0
trigger1 = standby
trigger2 = roundstate != 2
var(27) = 0
ignorehitpause = 1

[State -2, Dark Force Disables Tagging Out]
type = varset
triggerall = var(28) < 6
trigger1 = var(27) > 0
trigger2 = stateno = [770, 771]
var(28) = 6
ignorehitpause = 1

[State -2, Dark Force BG]
type = bgpalfx
trigger1 = stateno = 770 || var(27) > 0
time = 1
;color = 0
;mul = 192 + ceil(cos(gametime / 20.0) * 64), 64 + ceil(cos(gametime / 20.0) * 16), 0
color = -256
hue = 64 * cos(gametime / 120.0 * pi)
mul = 192 + 64 * cos(gametime / 60.0 * pi), 192 + 64 * cos(gametime / 60.0 * pi), 192 + 64 * cos(gametime / 60.0 * pi)
ignorehitpause = 1

[State -2, Dark Force Warning]
type = palfx
triggerall = !(gametime % 2)
trigger1 = var(27) = [1, 60]
trigger2 = var(27) = -1 && stateno != 771
time = 1
add = 96, 96, 96
ignorehitpause = 1

[State -2, Throw in Front]
type = null
trigger1 = 1 || var(29) = 0
trigger1 = p2dist x < 0
trigger1 = p2dist x < 40
trigger1 = var(29) = 1
ignorehitpause = 1

[State -2, Unthrowable Flag]
type = varadd
trigger1 = var(30) > 0
trigger1 = numenemy
trigger1 = p2stateno != 52
var(30) = -1
ignorehitpause = 1

[State -2, Unthrowable Flag - Jump Start]
type = varset
trigger1 = numenemy
trigger1 = p2stateno = 40
trigger1 = p2movetype = I
trigger1 = 1
var(30) = 1
ignorehitpause = 1

[State -2, Unthrowable Flag - Hurt]
type = varset
triggerall = 1
triggerall = 1
triggerall = p2stateno != 5900
trigger1 = p2stateno = [150, 155]
trigger2 = p2stateno = 5120; Just in case
trigger3 = p2stateno = 5201
trigger4 = p2movetype = H
trigger4 = p2statetype != A
trigger5 = p2movetype = H
trigger5 = p2statetype = A
var(30) = 3
ignorehitpause = 1

[State -2, Damage Scaling - Reset]
type = null
trigger1 = p2movetype != H
trigger1 = p2stateno != 5900
trigger1 = 1 || var(31) = 0
trigger1 = 1 || var(32) = 0
ignorehitpause = 1

[State -2, Damage Scaling - Attack Connected Flag]
type = varset
trigger1 = movecontact = 1
trigger1 = hitcount <= 1
var(32) = 1
ignorehitpause = 1

[State -2, Damage Scaling - Base Formula]
type = varset
trigger1 = 1
var(33) = ifelse(var(31) <= 0, 1, ifelse(var(31) >= 9, 0.1, 1 - 0.1 * var(31)))
ignorehitpause = 1

[State -2, Damage Scaling - Chain Combos]
type = varset
trigger1 = numtarget
trigger1 = p2movetype = H
trigger1 = stateno = [200, 699]
trigger1 = prevstateno = [200, 699]
trigger1 = ifelse((stateno = 200 || stateno = 201 || stateno = 400), (prevstateno != 200 && prevstateno != 201 && prevstateno != 230 && prevstateno != 400), 1)
trigger1 = ifelse((stateno = 230 || stateno = 430), prevstateno != 230, 1)
var(33) = 0.75 * var(33)
ignorehitpause = 1

[State -2, Damage Scaling - Dark Force]
type = varset
trigger1 = var(27)
var(33) = 0.75 * ifelse(var(31) * 2 <= 0, 1, ifelse(var(31) * 2 >= 9, 0.1, 1 - 0.1 * var(31) * 2))
ignorehitpause = 1

[State -2, Damage Scaling - Minimum Super Damage]
type = null
triggerall = stateno = [3000, 4999]
;Level 3
trigger1 = var(34) = 3
trigger1 = var(33) < 0.5
trigger1 = 1 || var(33) = 0.5
;Level 2
trigger2 = var(34) = 2
trigger2 = var(33) < 0.4
trigger2 = 1 || var(33) = 0.4
;Other
trigger3 = stateno = [3000, 4999]
trigger3 = var(33) < 0.3
trigger3 = 1 || var(33) = 0.3
ignorehitpause = 1

[State -2, Meter Scaling]
type = null
trigger1 = var(27) > 0
trigger1 = 1 || var(35) = 0
trigger2 = var(27) <= 0
trigger2 = 1 || var(35) = var(33)
ignorehitpause = 1

[State -2, Damage Scaling - Override Fall Defense Bonus]
type = assertspecial
trigger1 = numenemy
trigger1 = p2movetype = H
flag = noshadow
ignorehitpause = 1

[State -2, Damage Scaling - Long Combo Guts]
type = varset
trigger1 = numenemy
var(33) = var(33) * 0.90
ignorehitpause = 1

[State -2, Damage Scaling - Root Multiplier]
type = attackmulset
trigger1 = 1
value = var(33); * ifelse(var(36), 1.2, 1)
ignorehitpause = 1

[State -2, Drop Target]
type = targetdrop
triggerall = numtarget = 1
triggerall = target, time > 0
trigger1 = target, stateno = 5040
trigger2 = target, stateno = 5201
trigger3 = target, movetype != H
trigger3 = target, movereversed = 0
ignorehitpause = 1

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time <= 1
triggerall = movetype = H
triggerall = stateno != [120, 155]
triggerall = gethitvar(damage) = (0, life)
trigger1 = gethitvar(animtype) = 0 && random < 250
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) >= 2 && random < 500
trigger4 = gethitvar(damage) >= 100
trigger5 = gethitvar(fall)
value = 5000, (random % 3)
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
trigger1 = stateno = 5100
trigger1 = gethitvar(fall.damage) > 0 || sysvar(1) > 14
trigger2 = stateno = 5050 || stateno = 5100
trigger2 = prevstateno != [5000, 5120]
value = 5000, (random % 3)
lowpriority = 1
channel = 0

[State -2, Get Hit Voice]
type = playsnd
triggerall = alive
triggerall = time = 1
triggerall = movetype = H
triggerall = stateno >= 1000
trigger1 = anim = [5000, 5002]
trigger2 = anim = [5010, 5012]
trigger3 = anim = [5020, 5022]
trigger4 = anim = 5030
trigger5 = anim = 5070
trigger6 = anim = 5080
trigger7 = anim = [5100, 5101]
trigger8 = anim = 5170
trigger9 = anim = 5950
trigger10 = anim = 170
value = 5000, (random % 3)
lowpriority = 1
channel = 0

[State -2, Dizzy Voice]
type = playsnd
trigger1 = time = 1
trigger1 = anim = 5300
value = 5000, 2
channel = 0

[State -2, Guard Break Voice]
type = playsnd
trigger1 = time = 1
value = 5000, (random % 3)
lowpriority = 1
channel = 0

[State -2, Midnight Bliss Voice]
type = varadd
trigger1 = anim = 9020
trigger1 = animelemtime(6) >= 0
value = 1

[State -2, Midnight Bliss Voice]
type = playsnd
trigger1 = var(37) = 1
value = 5000, 2
channel = 0
freqmul = 1.50

[State -2, Midnight Bliss Voice]
type = varset
trigger1 = anim != 9020
var(37) = 0

[State -2, Midnight Bliss Scale Fix]
type = angledraw
trigger1 = anim = 9020
scale = 1.20, 1

;[State -2, Voice Pos];happens automatically in Ikemen GO 0.99
;type = sndpan
;trigger1 = 1
;channel = 0
;pan = 0
;ignorehitpause = 1


;==================================================================================================
;===========================================<STATE -3>=============================================
;==================================================================================================
[Statedef -3]

[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2
triggerall = !numhelper(705)
triggerall = !var(27)
triggerall = (movetype = I && ctrl) || stateno = [700, 702] || stateno = 5120
trigger1 = command != "rlsdir"
trigger1 = statetype = S || statetype = C || stateno = 5120
trigger1 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B") || command = "D"
trigger2 = command != "rlsdir"
trigger2 = statetype = A
trigger2 = (p2dist x >= 0 && command = "F") || (p2dist x < 0 && command = "B")
trigger3 = inguarddist
trigger3 = stateno != [700, 702]
trigger3 = p2bodydist x < var(38)
trigger3 = random < (ifelse(life < 100, 100, 50) )
trigger4 = inguarddist
trigger4 = stateno != [700, 702]
trigger4 = var(39) = [1, 8]
trigger4 = random < 200 
trigger5 = stateno = [700, 702]
helpertype = normal
stateno = 705
ID = 705
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = helper(705), stateno = 706
value = ifelse((helper(705), anim = 707), 702, ifelse((helper(705), anim = 706), 701, 700))
ctrl = 0

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 705)
attr = SA, AP
stateno = 700
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 706)
attr = C, AP
stateno = 701
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = numhelper(705)
trigger1 = stateno != [700, 702]
trigger1 = !(helper(705), var(0)) && (helper(705), anim = 707)
attr = SCA, AP
stateno = 702
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = 1
trigger1 = 1 || var(40) = (var(40) - 1)
flag = nowalk

[State -3, ProjContact Reset]
type = varset
triggerall = var(41)
trigger1 = stateno != 1000 && stateno != 1010 && stateno != 1050 && stateno != 1060
trigger1 = stateno != 3000 && stateno != 3050 && stateno != 3300 && stateno != 4100
trigger2 = stateno = 1000 && animelemtime(4) < 0
trigger3 = stateno = 1010 && animelemtime(4) < 0
trigger4 = stateno = 1050 && animelemtime(4) < 0
trigger5 = stateno = 1060 && animelemtime(4) < 0
trigger6 = stateno = 3000 && animelemtime(4) < 0
trigger7 = stateno = 3050 && animelemtime(4) < 0
trigger8 = stateno = 3300 && time <= 8
trigger9 = stateno = 4100 && time <= 8
var(41) = 0

[State -3, ProjContact Timer]
type = varadd
trigger1 = var(41)
var(41) = 1

[State -3, Projectile Flag]
type = varset
trigger1 = 1
var(42) = 0
ignorehitpause = 1

[State -3, Projectile Flag]
type = varset
triggerall = var(27) <= 0
triggerall = var(42) != 1
trigger1 = stateno != 1000 && numhelper(1005)
trigger1 = helper(1005), stateno = 1005
trigger2 = stateno != 1010 && numhelper(1015)
trigger2 = helper(1015), stateno = 1015
trigger3 = stateno != 1050 && numhelper(1055)
trigger3 = helper(1055), stateno = 1055
trigger4 = stateno != 1060 && numhelper(1065)
trigger4 = helper(1065), stateno = 1065
trigger5 = stateno != 3000 && numhelper(3005)
trigger5 = helper(3005), stateno = 3005
trigger6 = stateno != 3050 && numhelper(3055)
trigger6 = helper(3055), stateno = 3055
trigger7 = stateno != 3300 && numhelper(3305)
trigger7 = helper(3305), stateno = 3305
trigger8 = stateno != 4100 && numhelper(4105)
trigger8 = helper(4105), stateno = 4105
var(42) = 1
ignorehitpause = 1

[State -3, Special Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
var(43) = 0
ignorehitpause = 1

[State -3, Special Cancel Check]
type = varset
triggerall = stateno = [200, 699]
trigger1 = time <= 2
trigger1 = stateno = [200, 699]
trigger1 = prevstateno != [200, 4999]
trigger2 = stateno = 200 || stateno = 201
trigger3 = stateno = 210
trigger3 = (movecontact || movereversed) && animelemtime(5) < 0 && prevstateno != [200, 699]
trigger4 = stateno = 211
trigger4 = (movecontact || movereversed) && animelemtime(7) < 0 && prevstateno != [200, 699]
trigger5 = stateno = 221
trigger5 = (movecontact || movereversed) && animelemtime(5) < 0 && prevstateno != [200, 699]
trigger6 = stateno = 230
trigger7 = stateno = 400
trigger8 = stateno = 410
trigger8 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger9 = stateno = 430
trigger9 = (movecontact || movereversed) && animelemtime(5) < 0 && prevstateno != [200, 699]
trigger10 = stateno = 440
trigger10 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger11 = stateno = 445
trigger11 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger12 = stateno = 600
trigger12 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger13 = stateno = 610
trigger13 = (movecontact || movereversed) && animelemtime(5) < 0 && prevstateno != [200, 699]
trigger14 = stateno = 630
trigger14 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger15 = stateno = 631
trigger15 = (movecontact || movereversed) && animelemtime(4) < 0 && prevstateno != [200, 699]
trigger16 = stateno = 640
trigger16 = (movecontact || movereversed) && animelemtime(5) < 0 && prevstateno != [200, 699]
var(43) = 1
ignorehitpause = 1

[State -3, Super Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
value = 0
ignorehitpause = 1

[State -3, Super Cancel Check]
type = varset
triggerall = stateno = [200, 2999]
trigger1 = var(54)
trigger2 = stateno = 220
trigger2 = (movecontact || movereversed) && animelemtime(7) < 0 && prevstateno != [200, 699]
trigger3 = stateno = 1000
trigger3 = animelemtime(5) = [1, 12] && var(52) = [1, 12]
trigger4 = stateno = 1010
trigger4 = animelemtime(5) = [1, 12] && var(52) = [1, 12]
trigger5 = stateno = 1050
trigger5 = animelemtime(6) = [1, 12] && var(52) = [1, 12]
trigger6 = stateno = 1060
trigger6 = animelemtime(6) = [1, 12] && var(52) = [1, 12]
trigger7 = stateno = 1100
trigger7 = anim = 1100 && animelemtime(4) < 0
trigger7 = (movecontact + movereversed) = [1, 12]
trigger8 = stateno = 1110
trigger8 = (movecontact + movereversed) = [1, 24]
trigger9 = stateno = 1205
trigger9 = (movecontact + movereversed) = [1, 12]
trigger10 = stateno = 1251
trigger10 = (movecontact + movereversed) = [1, 12]
value = 1
ignorehitpause = 1

[State -3, Hyper Cancel Reset]
type = varset
trigger1 = movetype = H
trigger2 = movereversed != [1, 2]
value = 0
ignorehitpause = 1

[State -3, Hyper Cancel Check]
type = varset
triggerall = stateno = [3000, 4999]
trigger1 = stateno = 3000
trigger1 = animelemtime(5) = [1, 24] && var(52) = [1, 12]
trigger2 = stateno = 3050
trigger2 = animelemtime(6) = [1, 24] && var(52) = [1, 12]
trigger3 = stateno = 3100
trigger3 = (movecontact + movereversed) = [1, 12]
trigger4 = stateno = 3300
trigger4 = var(52) = [1, 12]
trigger5 = stateno = 3401
trigger5 = (movecontact + movereversed) = [1, 12]
value = 1
ignorehitpause = 1

[State -3, Throw Cancel Fix]; Because first frame of a throw has movehit and Custom Combo has so much freedom
type = null
trigger1 = numtarget
trigger1 = hitdefattr != SCA, AA
trigger1 = time <= 0 && target, time <= 0
trigger1 = var(53) = 0 || var(54) = 0 || var(55) = 0 || var(56) = 0
ignorehitpause = 1

[State -3, Super Cancel Flag Reset]
type = varset
trigger1 = var(57)
trigger1 = (stateno != [3000, 4999]) || movetype = H
value = 0
ignorehitpause = 1

[State -3, Hyper Cancel Flag Reset]
type = varset
trigger1 = var(58)
trigger1 = (stateno != [3000, 4999]) || movetype = H
value = 0
ignorehitpause = 1

[State -3, Sparkle Timer]
type = varadd
trigger1 = 1
value = 1.0 + (random / 1000.0)

[State -3, Sparkles Back]
type = explod
trigger1 = random < 15
trigger1 = movetype != H
trigger1 = statetype != A || stateno = 183 || stateno = 195
trigger1 = stateno != [5900, 5902] && stateno != [190, 192]
trigger1 = numexplod(6000) < 6
anim = 6000
ID = 6000
sprpriority = -1
postype = p1
pos = 0, -pos y - 2
random = 40, 4
vel = 0, (-0.80 - (random / 5000.0)) * ifelse(statetype = C, 0.66, 1.00)
scale = 0.50 * const(size.xscale), 0.50 * const(size.yscale)
palfx.time = -1
palfx.hue = -256 + 4 * (ceil(var(66)) % 128); randomRange(-256, 256)
ownpal = 1

[State -3, Sparkles Front]
type = explod
trigger1 = random < 30
trigger1 = movetype != H
trigger1 = statetype != A || stateno = 183 || stateno = 195
trigger1 = stateno != [5900, 5902] && stateno != [190, 192]
trigger1 = numexplod(6000) < 6
anim = 6000
ID = 6000
sprpriority = 3
postype = p1
pos = 0, -pos y + 2
random = 52, 4
vel = 0, (-1.00 - (random / 4000.0)) * ifelse(statetype = C, 0.66, 1.00)
scale = 0.50 * const(size.xscale), 0.50 * const(size.yscale)
palfx.time = -1
palfx.hue = -256 + 4 * (ceil(var(66)) % 128); randomRange(-256, 256)
ownpal = 1

[State -3, Sparkles Parasite Roll]
type = explod
trigger1 = movetype != H
trigger1 = !(gametime % 4)
trigger1 = stateno = 1205 || stateno = 1251
trigger1 = numexplod(6000) < 16
anim = 6001
ID = 6000
sprpriority = ifelse(random < 333, -1, 3)
postype = p1
pos = -8 * const(size.xscale), 0
random = 16, 8
vel = -1.50 - (random / 3000.0), -1.50 - (random / 3000.0)
friction = 0.95, 1
scale = 0.50 * const(size.xscale), 0.50 * const(size.yscale)
angle = 45
interpolation.time = 30
interpolation.angle = 0
palfx.time = -1
palfx.hue = -256 + 4 * (ceil(var(66)) % 128); randomRange(-256, 256)
ownpal = 1
ignorehitpause = 1

[State -3, Lie Down Bats]
type = helper
trigger1 = stateno = 5110 || stateno = 5115 || stateno = 5150 || stateno = 5230
trigger1 = numhelper(6100) < 4
helpertype = normal
stateno = 6105
ID = 6100
name = "Bat"
postype = p1
facing = -1

[State -3, Movement Afterimage]
type = afterimage
triggerall = time = 1
trigger1 = stateno = 50 && var(51) = 3
trigger2 = stateno = [710, 725]
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
trans = add1

[State -3, Lv1 Super Afterimage]
type = afterimage
trigger1 = stateno = 3000 && time = 3
trigger2 = stateno = 3050 && time = 3
trigger3 = stateno = 3100 && time = 3
trigger4 = stateno = 3400 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 0, 64, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3300 && time = 3
trigger2 = stateno = 4050 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 128, 0, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 4000 && time = 3
trigger2 = stateno = 4100 && time = 3
time = 2
timegap = 1
framegap = 10
length = 21
palcolor = 0
palbright = 0, 0, 0
palcontrast = 192, 0, 0
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || stateno = [600, 699]
trigger1 = var(51) = 3 && vel y < -1
trigger2 = stateno = [710, 725]
trigger3 = stateno = [3000, 4999]
time = 2
ignorehitpause = 1

[State -3, Scary Supers]
type = attackdist
trigger1 = stateno = [3000, 4999]
value = 320

[State -3, Jump Reset]
type = varset
trigger1 = var(51)
trigger1 = stateno != 40
trigger1 = statetype != A || movetype = H
value = 0

[State -3, Reset Super Finish Var]
type = varset
trigger1 = var(59)
trigger1 = roundstate = [0, 2]
value = 0

[State -3, Dark Force Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3
triggerall = var(50) && !numhelper(8600)
trigger1 = movecontact = [1, 4]
trigger2 = numhelper(1005)
trigger2 = helper(1005), var(52)
trigger3 = numhelper(1015)
trigger3 = helper(1015), var(52)
trigger4 = numhelper(1055)
trigger4 = helper(1055), var(52)
trigger5 = numhelper(1065)
trigger5 = helper(1065), var(52)
trigger6 = stateno = 810
trigger6 = animelemtime(6) = [0, 1]
trigger7 = stateno = 820
trigger7 = animelemtime(8) >= 0
trigger8 = stateno = 1311 || stateno = 1341
trigger8 = time <= 1
helpertype = normal
stateno = 8600
ID = 8600 + 0 * (var(59) = 900)
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Super Finish]
type = helper
triggerall = roundstate = 3
triggerall = !numhelper(8600)
trigger1 = movecontact = [1, 4]
trigger1 = stateno = [3000, 4999]
trigger1 = var(59) = stateno
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(52)
trigger2 = var(59) = 3000
trigger3 = numhelper(3055)
trigger3 = helper(3055), var(52)
trigger3 = var(59) = 3050
trigger4 = stateno = 3300 && var(52)
trigger4 = var(59) = 3300
trigger5 = numhelper(3305)
trigger5 = helper(3305), var(52)
trigger5 = var(59) = 3300
trigger6 = stateno = 4110
trigger6 = var(59) = 4100
helpertype = normal
stateno = 8600
ID = 8600
name = "Super Finish"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

[State -3, Victory Camera]
type = varset
trigger1 = roundstate != 4
value = 0

[State -3, Victory Camera]
type = varset
trigger1 = var(63)
trigger1 = var(64)
trigger1 = alive && !standby
trigger1 = winKO
trigger1 = stateno > 180
trigger1 = roundstate = 4
trigger1 = camerazoom <= 1
trigger1 = screenpos y = [0, gameheight]
trigger1 = numenemy
value = 1

[State -3, Victory Camera]
type = zoom
trigger1 = var(60)
scale = 1.0 / camerazoom
lag = 0.92
stagebound = 1
camerabound = 0
pos = pos x * camerazoom, 0

[State -3, Victory BGM]
type = varset
trigger1 = var(61) != 0
value = 0

[State -3, Victory BGM]
type = varadd
trigger1 = var(62)
trigger1 = matchover
trigger1 = alive
trigger1 = win
value = 1

[State -3, Victory BGM];Assertspecial nomusic does not work here
type = null
trigger1 = var(62)
trigger1 = var(61) = [1, 5]
bgm = ""

[State -3, Victory BGM]
type = null
trigger1 = var(62)
trigger1 = var(61) = 6
bgm = "moriwin.mp3"
loop = 0
volume = 100

[State -3, Antifreeze]
type = changestate
triggerall = !ctrl
triggerall = time >= 300
triggerall = roundstate = 2
trigger1 = pos y > 0 && screenpos y > gameheight
trigger2 = !selfanimexist(anim)
value = 5040

[State -3, Antifreeze]
type = selfstate
trigger1 = numenemy
trigger1 = movetype != A
trigger1 = 1
value = 5040


;==================================================================================================
;===========================================<STATE -4>=============================================
;==================================================================================================
[Statedef -4]

[State -4, Helper Damage Scaling - Update Root]
type = null
trigger1 = ishelper
trigger1 = !var(65)
trigger1 = movecontact && numtarget
trigger1 = root, var(65) = 1
trigger1 = var(65) = 1
ignorehitpause = 1

[State -4, Damage Scaling - Helper Multiplier]
type = attackmulset
trigger1 = ishelper
value = root, var(67)
ignorehitpause = 1
