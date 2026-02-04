; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;============================================================================================
;======================================<SUPER STATES>========================================
;============================================================================================

;======================<SOUL PHOENIX>=============================
[Statedef 3000]
type = S
physics = S
movetype = A
anim = 3000
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = 1

[State 3000, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3000, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-136 * const(size.xscale)), ceil(-126 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3000, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-136 * const(size.xscale)), ceil(-126 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3000, NHB]
type = nothitby
trigger1 = animelemtime(5) < 0
time = 1
value = SCA

[State 3000, FX]
type = explod
trigger1 = animelem = 3
anim = 3004
ID = 3004
sprpriority = 3
postype = p1
pos = 0,-50
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 3000, Dust]
type = explod
trigger1 = animelem = 5
vel = 0, 0
anim = 7106
ID = 7106
sprpriority = 3
postype = p1
pos = ceil(-30 * const(size.xscale)), 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 3000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value = SCA, AA, AT
time = 1

[State 3000, SoulFist]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3005
ID = 3005
name = "Soul Phoenix"
postype = p1
pos = ceil(24 * const(size.xscale)), -50
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 3000, Dome]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 3003
ID = 3003
name = "Dome"
postype = p1
pos = ceil(-60 * const(size.xscale)), 0
ownpal = 1
pausemovetime = 255
supermovetime = 255

[State 3000, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 17
channel = 0
[State 3000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 13

[State 3000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<MID-AIR SOUL PHOENIX>=============================
[Statedef 3050]
type = A
physics = N
movetype = A
anim = 3050
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 1
facep2 = p2dist x <= -const(size.ground.back)

[State 3050, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3050, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 5
channel = 0

[State 3050, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-32 * const(size.xscale)), ceil(-180 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3050, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-26 * const(size.xscale)), ceil(-170 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3050, NHB]
type = nothitby
trigger1 = animelemtime(6) < 0
time = 1
value = SCA

[State 3050, Width]
type = width
trigger1 = (animelemtime(4) >= 0 && animelemtime(9) < 0)
value = ceil(32 * const(size.xscale)), 0

[State 3050, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1

[State 3050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value = SCA, AA, AT
time = 1

[State 3050, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 3055
ID = 3055
name = "Soul Phoenix"
postype = p1
pos = ceil(120 * const(size.xscale)), -48
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 3050, Accel]
type = veladd
trigger1 = animelemtime(6) >= 0
y = 0.5

[State 3050, Vel]
type = velset
trigger1 = animelem = 6
x = -2
y = -6

[State 3050, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
physics = N

[State 3050, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 17
channel = 0
[State 3050, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 13

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;========================<BURNED>=============================
[Statedef 7697]
type = A
physics = N
movetype = H
velset = 0, 0

[State 7697, End]
type = selfstate
trigger1 = !selfanimexist(7697)
value = 5020

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) != [3,5]
value = ifelse((gethitvar(airtype) = 1), 5000, 5010) + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = gethitvar(animtype) = [3,5]
value = 5030

[state 7697, Anim]
type = changeanim
trigger1 = !time
trigger1 = (gethitvar(animtype) = [4,5]) && (selfanimexist(5047 + gethitvar(animtype)))
value = 5047 + gethitvar(animtype)

[state 7697, Anim]
type = changeanim
trigger1 = !hitshakeover
value = anim

[State 7697, Anim]
type = changeanim
trigger1 = hitshakeover
trigger1 = anim != 7697
value = 7697

[State 7697, Accel]
type = veladd
trigger1 = hitshakeover
y = gethitvar(yaccel)

[State 7697, Vel]
type = hitvelset
trigger1 = hitshakeover
x = 1
y = 1
persistent = 0

[State 7697, End]
type = selfstate
trigger1 = hitshakeover
trigger1 = vel y > 0
trigger1 = !hitfall
value = 5040

[State 7697, Recover]
type = selfstate
triggerall = vel y > 0
triggerall = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
triggerall = alive
triggerall = canrecover
trigger1 = command = "recovery"
value = 5200

[State 7697, End]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundlevel)
value = 5100


;======================<CARDINAL BLADE>=============================
[Statedef 3100]
type = S
physics = S
movetype = A
anim = 3100
ctrl = 0
velset = 0, 0
poweradd = -1000
facep2 = 1
sprpriority = 1

[State 3100, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3100, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 0
channel = 0

[State 3100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-50 * const(size.xscale)), ceil(-70 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3100, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-50 * const(size.xscale)), ceil(-70 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3100, NHB]
type = nothitby
trigger1 = anim = 3100 && animelemtime(4) < 0
time = 1
value = SCA

[State 3100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 3100, Accel]
type = veladd
trigger1 = anim = 3100 && animelemtime(8) >= 1
trigger2 = anim = 1101
y = 0.67

[State 3100, Vel]
type = velset
trigger1 = anim = 3100 && animelemtime(8) = 1
x = 10.2
y = -11.76

[State 3100, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 8
value = 0, 41

[State 3100, Dust]
type = helper
trigger1 = anim = 3100 && animelem = 8
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 3100, Snd]
type = playsnd
trigger1 = anim = 3100 && animelem = 3
value = 4, 16
channel = 0
ignorehitpause = 1
persistent = 0

[State 3100, Hit]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 2 || animelem = 3
trigger1 = (var(15) < (3 + hitcount) || var(20))
attr = S, HA
damage = 60, 7
animtype = Back
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8024)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((animelem = 2), -35, -60)
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 0, -7.50
air.type = Low
air.velocity = 0, -7.50
down.hittime = 20
down.velocity = 0, 0
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
fall.animtype = Medium
forcestand = 1
yaccel = 0.4850

[State 3100, Hit 2]
type = hitdef
trigger1 = anim = 3100
trigger1 = animelem = 4 || animelem = 6 || animelem = 8 || animelem = 9 || animelem = 10 || animelem = 11
trigger1 = (var(15) < (3 + hitcount) || var(20))
attr = A, HA
damage = 30, 5
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((animelem = 11), 12, 4), ifelse((animelem = 11), 12, 4)
sparkno = -1 + 0 * (var(33) := 8024)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -100
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4 * !numhelper(775), -7.50
air.type = Low
air.velocity = -4 * !numhelper(775), -7.50
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
forcestand = 1
yaccel = 0.4850

[State 3100, Type]
type = statetypeset
trigger1 = anim = 3100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 3100, Anim]
type = changeanim
trigger1 = anim = 3100 && animelemtime(11) >= 2 && vel y > -1
value = 1101

[State 3100, posfix]
type = posadd
trigger1 = anim = 1101
x = ceil(48 * const(size.xscale))
y = -24
persistent = 0

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I


[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1109


;======================<FINISHING SHOWER>=============================
[Statedef 3300]
type = A
physics = N
movetype = A
anim = 3300
ctrl = 0
velset = 0, 0
poweradd = -2000
facep2 = 1
sprpriority = 1

[State 3300, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 3300, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 0
channel = 0

[State 3300, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-86 * const(size.xscale)), ceil(-136 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3300, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(-86 * const(size.xscale)), ceil(-136 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3300, NHB]
type = nothitby
trigger1 = animelemtime(5) <= 0
time = 1
value = SCA

[State 3300, Accel]
type = veladd
trigger1 = time >= 43
y = 0.004

[State 3300, Vel]
type = velset
trigger1 = time = 43
x = -0.3
y = -0.3

[State 3300, Snd]
type = playsnd
trigger1 = time = 43
value = 5, 10
channel = 5

[State 3300, Dust]
type = helper
trigger1 = time = 43
helpertype = normal
stateno = 3303
ID = 3303
name = "F.S. Dust"
postype = p1
pos = 0, -ceil(pos y)
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
persistent = 0
supermovetime = 9999

[State 3300, Snd]
type = playsnd
trigger1 = time = 60
value = 4, 3
channel = 0

[State 3300, Bullets]
type = helper
trigger1 =  !(time % 6)
trigger1 = time >= 48
helpertype = normal
stateno = 3305
ID = 3305
name = "Bullet"
postype = p1
ownpal = 0

[State 3305, Snd]
type = playsnd
trigger1 =  !(time % 11)
trigger1 = time >= 55
value = 5, 6
channel = 5

[State 3300, End]
type = changestate
trigger1 = time >= 200
value = 51

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3301


;---Land---
[Statedef 3301]
type = S
physics = S
movetype = I
anim = 3301
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3301, Pos]
type = posset
trigger1 = 1
y = 0

[State 3301, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 3301, Dust]
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

[State 3301, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<VALKYRIE TURN>=============================
[Statedef 3400]
type = A
physics = N
movetype = I
anim = 3400
ctrl = 0
velset = 0, 0
poweradd = -1000
sprpriority = 2
facep2 = 0

[State 3400, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
ignorehitpause = 1

[State 3400, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7500
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-78 * const(size.xscale)), ceil(-140 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 3400, Super Pause]
type = superpause
trigger1 = time = 3
time = 43
movetime = 43
anim = ifelse(fvar(31), -1, 100)
pos = ceil(-78 * const(size.xscale)), ceil(-140 * const(size.yscale))
sound = s0, 8500
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 3400, NHB]
type = nothitby
trigger1 = 1
time = 1
value = SCA

[State 3400, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3400, bound]
type = screenbound
triggerall = time > 43
trigger1 = facing = 1 && pos x > 0
trigger2 = facing = -1 && pos x < 0
value = 0
movecamera = 0, 1

[State 3400, Pos]
type = posset
trigger1 = pos y >= 0
y = 0

[State 3400, Vel]
type = veladd
trigger1 = time >= 43
x = 2
y = 0

[State 3400, Vel]
type = velset
trigger1 = time = 43
x = 0
y = 0

[State 3400, Snd]
type = playsnd
trigger1 = time = 43
value = 4, 14
channel = 0

[State 3400, Jet]
type = helper
trigger1 = time = 43 && !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
ownpal = 1
supermovetime = 10

[State 3400, Jet]
type = helper
trigger1 = time >= 43 && !numhelper(6028)
helpertype = normal
stateno = 6028
ID = 6028
name = "Jet Trail"
postype = p1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
supermovetime = 10

[State 3400, Particles]
type = explod
trigger1 = time >= 43 && numhelper(6020)
vel = -1 + (random / 1000.0), 0
accel = 0, 0.05
anim = 3407
sprpriority = 3
postype = p1
pos = ceil(-90 * const(size.xscale)), -70
random = 20, 20
scale = 0.5, 0.5
supermovetime = -1

[State 3400, End]
type = changestate
trigger1 = time > 43
trigger1 = frontedgedist <= -60
trigger2 = time >= 120
value = 3401


;--- RETURN ---
[Statedef 3401]
type = A
physics = N
movetype = A
anim = 3400
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3401, Turn]
type = turn
trigger1 = !time

[State 3401, NHB]
type = nothitby
trigger1 = backedgedist < 0
time = 1
value = SCA

[State 3401, Push]
type = playerpush
trigger1 = anim = 3400
value = 0

[State 3401, Bound]
type = screenbound
trigger1 = facing = 1 && pos x < 0
trigger2 = facing = -1 && pos x > 0
value = 0
movecamera = 0, 1

[State 3401, Pos]
type = posset
trigger1 = !time
y = 0

State 3401, Pos]
type = posset
trigger1 = time <= 10
x = (-((gamewidth / 2.0) + 40) -50 * sin(time / 3.33)) * facing

[State 3401, Vel]
type = velset
trigger1 = !time
trigger1 = !AIlevel
y = ifelse(command = "holdup", -10, ifelse(command = "holddown", -2, -6))

[State 3401, Vel]
type = velset
trigger1 = !time
trigger1 = AIlevel
y = ifelse(p2dist y <= -90, -10, ifelse(p2dist y <= -30, -6, -2))

[State 3401, Vel]
type = velset
trigger1 = time = 10
x = 6
y = -1.5

[State 3401, Accel]
type = veladd
trigger1 = time >= 10
y = 0.15

[State 3401, Anim]
type = changeanim
trigger1 = time >= 10 && anim != 3402 && anim != 49
trigger1 = command = "holdx" || command = "holdy" || command = "holdz" || command = "holda" || command = "holdb" || command = "holdc"
value = 3402

[State 3401, Drill FX]
type = helper
trigger1 = anim = 3402 && animelemtime(3) >= 0 && !numhelper(3405)
helpertype = normal
stateno = 3405
ID = 3405
name = "Drill FX"
postype = p1
pos = ceil(152 * const(size.xscale)), -43
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 3401, Hit]
type = hitdef
trigger1 = anim = 3402 && hitcount <= 13
trigger1 = !((movecontact + movereversed) % 3)
trigger1 = (var(15) < (3 + hitcount) || var(20))
attr = A, HA
damage = ifelse((movecontact || movereversed), 14, 120), 7
animtype = Hard
air.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 12
sparkno = -1 + 0 * (var(33) := 8024)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -43
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4 * !numhelper(775), 0
air.type = Low
air.velocity = -2 * !numhelper(775), -3
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.freq = 180
envshake.ampl = 2
yaccel = 0.4850
forcestand = 1
yaccel = 0.4850



[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 3403


;---Land---
[Statedef 3403]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 3403, Pos]
type = posset
trigger1 = 1
y = 0

[State 3403, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 3403, Dust]
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

[State 3403, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<DARKNESS ILLUSION>=============================
[Statedef 4000]
type = A
physics = N
movetype = A
anim = 4000
ctrl = 0
velset = 0, 0
poweradd = -3000
facep2 = 1
sprpriority = 1

[State 4000, Strength]
type = varset
trigger1 = var(10) != 7
var(10) = 7
ignorehitpause = 1

[State 4000, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 10
channel = 0

[State 4000, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(0 * const(size.xscale)), ceil(-120 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4000, Super Pause]
type = superpause
trigger1 = time = 3
time = 47
movetime = 47
anim = ifelse(fvar(31), -1, 102)
pos = ceil(40 * const(size.xscale)), ceil(-146 * const(size.yscale))
sound = s0, 8520
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4000, NHB]
type = nothitby
trigger1 = time < 50
time = 1
value = SCA
ignorehitpause = 1

[State 4000, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = 7.5

[State 4000, Jet]
type = helper
trigger1 = animelemtime(4) >= 0 && !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
ownpal = 1

[State 4000, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 20, 0

[State 4000, Unguardable]
type = assertspecial
triggerall = time <= 50 && numenemy
trigger1 = enemynear, stateno != [120, 155]
trigger2 = enemynear, stateno = 120 && (enemynear, anim != [120, 155])
flag = unguardable

[State 4000, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = var(15) < 1
attr = S, HA
damage = 0, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, 0
guard.velocity = -7.51
air.type = Low
air.velocity = -5 * !numhelper(775), -5
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 0
air.fall = 1
forcestand = 1
kill = 0
yaccel = 0.4850

[State 4000, P2 State]
type = targetstate
trigger1 = movehit && numtarget
trigger1 = (target, stateno = 5000) || (target, stateno = 5010) || (target, stateno = 5020)
value = 1114010

[State 4000, P1 State]
type = changestate
trigger1 = movehit || movereversed
value = 4010

[State 4000, Guarded]
type = changestate
trigger1 = animelemtime(4) >= 1 && moveguarded
value = 4002
ignorehitpause = 1

[State 4000, End]
type = changestate
trigger1 = time >= 83
value = 4001


;---Land---
[Statedef 4001]
type = S
physics = S
movetype = I
anim = 4001
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 4001, Pos]
type = posset
trigger1 = 1
y = 0

[State 4001, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 52

[State 4001, Dust]
type = explod
trigger1 = animelem = 2
anim = 7102
ID = 7100
sprpriority = -5
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 4001, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4010]
type = S
physics = N
movetype = A
anim = 4010
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4010, Super Pause Away]
type = superpause
trigger1 = !time
time = 0
anim = -1
p2defmul = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1114010

[State Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4010 Snd]
type = playsnd
trigger1 = !time
value = 5, 11

[State 4010, Double]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4015
ID = 4015
name = "Darkness Illusion"
postype = p1
persistent = 0

[State 4010, Push]
type = playerpush
trigger1 = anim = 4010
trigger2 = anim = 4011 && animelemtime(32) < 0
value = 0

[State 4010, NHB]
type = nothitby
trigger1 = 1
value = , AP
time = 1
ignorehitpause = 1

[State 4010, Bind]
type = targetbind
trigger1 = anim = 4010 && animelemtime(41) < 0
pos = ceil(160 * const(size.xscale)), 0

[State 4010, Bind]
type = targetbind
trigger1 = anim = 4011 && numtarget && animelemtime(25) < 0
pos = ceil(160 * const(size.xscale)), -55 -(target, const(size.mid.pos.y))
ID = 4011

[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && animelem = 47
value = 3, 0
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4011 && animelem = 30
value = 4, 6

[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && (animelem = 8 || animelem = 14)
trigger2 = anim = 4011 && animelem = 9
value = 1, 2
channel = 1
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && animelem = 18
value = 1, 3
channel = 1
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && animelem = 11
trigger2 = anim = 4011 && animelem = 4
value = 1, 5
channel = 1
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && (animelem = 27 || animelem = 36)
trigger2 = anim = 4011 && (animelem = 15 || animelem = 24)
channel = 1
value = 1, 6
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4011 && animelem = 20
channel = 1
value = 1, 8
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4011 && animelem = 20
value = 5, 5
channel = 1
[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && (animelem = 47)
trigger2 = anim = 4011 && (animelem = 31)
value = 1, 9
channel = 1

[State 4010, Hit High Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 8 || animelem = 14 || animelem = 19 || animelem = 36 || animelem = 37
attr = S, HA
damage = 50, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 8 || animelem = 14), 2, ifelse((animelem = 19), 3, 6)))
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -1.5
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
forcestand = 1
kill = ifelse((animelem = 8), 0, (numtarget != numenemy))
yaccel = 0.4850

[State 4010, Hit Low Ground]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 11 || animelem = 28 || animelem = 38 || animelem = 39
attr = S, HA
damage = 50, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 11), 5, 6))
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, ifelse((animelem = 39), -3, -1.5)
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
forcestand = 1
kill = (numtarget != numenemy)
yaccel = 0.4850

[State 4010, Hit Up Ground]
type = hitdef
trigger1 = anim = 4010 && animelem = 48
attr = S, HA
damage = 50, 3
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -13.5
air.type = Low
air.velocity = 0, -12
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
kill = (numtarget != numenemy)
forcestand = 1

[State 4010, Hit Midair]
type = hitdef
trigger1 = anim = 4011
trigger1 = animelem = 4 || animelem = 9 || animelem = 15 || animelem = 20 || animelem = 25
attr = A, HA
damage = 50, 3
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 4), 5, ifelse((animelem = 9 || animelem = 20), 3, 6)))
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -5
air.type = Low
air.velocity = 0, ifelse((animelem = 25), -4, -2.5)
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
kill = (numtarget != numenemy)
yaccel = 0.4850
forcestand = 1

[State 4010, Hit Final]
type = hitdef
trigger1 = anim = 4011 && animelem = 32
attr = A, HA
damage = 50, 3
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := -70) * (var(36) := 70), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Trip
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 4
air.type = Trip
air.velocity = 0, 9
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 4010, Vel]
type = velset
trigger1 = anim = 4010 && animelem = 56
y = -9
[State 4010, jet]
type = helper
trigger1 = anim = 4010 && animelemtime(56) >= 0 && !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
ownpal = 1

[State 4010, Snd]
type = playsnd
trigger1 = anim = 4010 && animelem = 56
value = 0, 41
[State 4010, Dust]
type = helper
trigger1 = anim = 4010 && animelem = 56
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4010, FX]
type = explod
trigger1 = anim = 4010 && animelem = 46
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-10 * const(size.xscale)), -60
scale = 0.75, 0.75
removeongethit = 1
ownpal = 1

[State 4010, FX]
type = explod
trigger1 = anim = 4011 && animelem = 31
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-10 * const(size.xscale)), -60
scale = -0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4010, Anim]
type = changeanim
triggerall = anim = 4010 && animelemtime(56) >= 0
trigger1 = numtarget
trigger1 = pos y <= -60 && (pos y -(target, pos y) = [-50, 50])
trigger2 = time > 180
value = 4011

[State 4010, Vel]
type = velmul
trigger1 = anim = 4011 && animelemtime(3) < 0
y = 0.75
[State 4010, Vel]
type = velset
trigger1 = anim = 4011 && animelemtime(3) >= 0 && animelemtime(36) < 0
y = ifelse(pos y <= -20, 0.1, 0)
[State 4010, Turn]
type = turn
trigger1 = anim = 4011 && animelem = 29
[State 4010, Vel]
type = velset
trigger1 = anim = 4011 && animelem = 29
x = 2

[State 4010, Type]
type = statetypeset
triggerall = anim = 4010
trigger1 = animelemtime(36) < 0
trigger1 = animelemtime(40) >= 0 && animelemtime(46) < 0
trigger2 = animelemtime(53) >= 0 && animelemtime(56) < 0
statetype = S
physics = S

[State 4010, Type]
type = statetypeset
triggerall = anim = 4010
trigger1 = animelemtime(36) >= 0 && animelemtime(40) < 0
trigger2 = animelemtime(46) >= 0 && animelemtime(53) < 0
trigger3 = animelemtime(56) >= 0
statetype = A
physics = N

[State 4010, Type]
type = statetypeset
trigger1 = anim = 4011 && animelemtime(36) >= 0
statetype = A
physics = A

[State 4010, No Target]
type = changestate
trigger1 = anim = 4011
trigger1 = animelemtime(4) > 0 && animelemtime(32) < 0
trigger1 = (movecontact + movereversed) != [1, 24]
value = 4012


;--- DIZZY TARGET ---
[Statedef 1114010]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1114010, Anim]
type = changeanim
trigger1 = !time
value = 5300

[State 1114010, Pos]
type = posset
trigger1 = !time
y = 0

[State 1114010, fall]
type = hitfallset
trigger1 = 1
value = 0

[State Safety]
type = selfstate
trigger1 = time >= 60
value = 0
ctrl = 1


;--- Target dropped ---
[Statedef 4012]
type = A
physics = N
movetype = I
anim = 4012
ctrl = 0

[State 4012, Vel]
type = velmul
trigger1 = 1
x = 0.92

[State 4012, Accel]
type = veladd
trigger1 = time
y = 0.512

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 4003


;--- JUMP BACK ---
[Statedef 4002]
type = A
physics = N
movetype = I
anim = 43
ctrl = 0
velset = 0, 0

[State 4002, Dust]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 4002, Snd]
type = playsnd
trigger1 = !time
value = 0, 40

[State 4002, Accel]
type = veladd
trigger1 = 1
y = 0.512

[State 4002, Vel]
type = velset
trigger1 = !time
x = -1.61
y = -8.45

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 4003


;---Land---
[Statedef 4003]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 4003, Pos]
type = posset
trigger1 = 1
y = 0

[State 4003, Snd]
type = playsnd
trigger1 = !time
value = 0, 52

[State 4003, Dust]
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

[State 4003, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR DARKNESS ILLUSION>=============================
[Statedef 4050]
type = A
physics = N
movetype = A
anim = 4050
ctrl = 0
velset = 0, 0
poweradd = -2000
facep2 = 0
sprpriority = 1

[State 4050, Strength]
type = varset
trigger1 = var(10) != 6
var(10) = 6
ignorehitpause = 1

[State 4050, Snd]
type = playsnd
trigger1 = time = 3
value = 4, 10
channel = 0

[State 4050, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7510
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-5 * const(size.xscale)), ceil(-120 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4050, Super Pause]
type = superpause
trigger1 = time = 3
time = 45
movetime = 45
anim = ifelse(fvar(31), -1, 101)
pos = ceil(40 * const(size.xscale)), ceil(-146 * const(size.yscale))
sound = s0, 8510
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4050, NHB]
type = nothitby
trigger1 = time < 46
time = 1
value = SCA
ignorehitpause = 1

[State 4050, Vel]
type = velset
trigger1 = animelemtime(4) = 1
x = 6.75

[State 4050, Jet]
type = helper
trigger1 = animelemtime(4) >= 0 && !numhelper(6020)
helpertype = normal
stateno = 6020
ID = 6020
name = "Jets"
postype = p1
ownpal = 1

[State 4050, Width]
type = width
trigger1 = animelemtime(4) >= 0
edge = 20, 0

[State 4050, Hit]
type = hitdef
trigger1 = animelem = 3
trigger1 = !movecontact && !movereversed
trigger1 = var(15) < 1
ID = 4050
attr = A, HA
damage = 0, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10 * !numhelper(775), 0
air.type = Low
air.velocity = -5 * !numhelper(775), -5
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 0
air.fall = 1
forcestand = 1
kill = 0
yaccel = 0.4850

[State 4050, P2 State]
type = targetstate
trigger1 = movehit && numtarget
trigger1 = (target, stateno = 5000) || (target, stateno = 5010) || (target, stateno = 5020)
value = 1114010

[State 4050, P1 State]
type = changestate
trigger1 = movehit || movereversed
value = 4060

[State 4050, Guarded]
type = changestate
trigger1 = animelemtime(4) >= 1 && moveguarded
value = 4002
ignorehitpause = 1

[State 4050, End]
type = changestate
trigger1 = time >= 60
value = 4012


;--- PLAYER ---
[Statedef 4060]
type = A
physics = N
movetype = A
anim = 4060
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4060, Super Pause Away]
type = superpause
trigger1 = !time
time = 0
anim = -1
p2defmul = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1114060

[State Throw]
type = targetfacing
trigger1 = !time
value = -1

[State 4060 Snd]
type = playsnd
trigger1 = !time
value = 5, 11

[State 4060, Double]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4065
ID = 4065
name = "Darkness Illusion"
postype = p1

[State 4060, Push]
type = playerpush
trigger1 = 1
value = 0

[State 4060, NHB]
type = nothitby
trigger1 = 1
value = , AP
time = 1
ignorehitpause = 1

[State 4060, Bind]
type = targetbind
trigger1 = animelemtime(30) < 0
pos = ceil(128 * const(size.xscale)), -75 -(target, const(size.mid.pos.y))
ID = 4050
ignorehitpause = 1
[State 4060, Bind]
type = targetvelset
trigger1 = animelemtime(30) < 0
ID = 4050
x = 0
y = 0
ignorehitpause = 1

[State 4060, Snd]
type = playsnd
trigger1 = animelem = 10
value = 4, 3
channel = 0

[State 4060, Snd]
type = playsnd
trigger1 = anim = 4060 && animelem = 47
value = 3, 0

[State 4060, Snd]
type = playsnd
trigger1 = animelem = 6 || animelem = 9 || animelem = 16
value = 1, 2
channel = 1

[State 4060, Snd]
type = playsnd
trigger1 = animelem = 3 || animelem = 12 || animelem = 20
value = 1, 5
channel = 1

[State 4060, Snd]
type = playsnd
trigger1 = animelem = 29
value = 3, 5
channel = 0

[State 4060, Snd]
type = playsnd
trigger1 = animelem = 29
value = 1, 9
channel = 1

[State 4060, Hit High]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 20 || animelem = 22
ID = 4050
attr = S, HA
damage = 40, 3
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 7), 3, 6))
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -1.5
air.type = High
air.velocity = 0, -1.5
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
forcestand = 1
kill = ifelse((animelem = 7), 0, (numtarget != numenemy))
fall = 1
fall.recover = 0
yaccel = 0.4850

[State 4060, Hit Low]
type = hitdef
trigger1 = animelem = 3 || animelem = 10 || animelem = 17 || animelem = 21 || animelem = 23
ID = 4050
attr = S, HA
damage = 40, 3
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 10 || animelem = 17), 3, 6))
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -1.5
air.type = Low
air.velocity = 0, -1.5
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
forcestand = 1
kill = (numtarget != numenemy)
fall = 1
fall.recover = 0
yaccel = 0.4850

[State 4060, Hit Final]
type = hitdef
trigger1 = animelem = 30
attr = A, HA
damage = 40, 3
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 10
air.type = Low
air.velocity = 0, 10
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1
fall.xvelocity = 0
fall.yvelocity = -4

[State 4060, Type]
type = veladd
trigger1 = animelemtime(33) >= 0
y = 0.5

[State 4060, Vel]
type = velset
trigger1 = animelem = 33
x = -2.0
y = -6

[State 4060, FX]
type = explod
trigger1 = animelem = 29
anim = 4095
sprpriority = 4
postype = p1
pos = ceil(-20 * const(size.xscale)), -60
scale = 0.75, -0.75
removeongethit = 1
ownpal = 1

[State 4060, End]
type = changestate
trigger1 = vel y > 0 && pos y > -vel y
value = 52


;--- Lock target ---
[Statedef 1114060]
type = S
physics = N
movetype = H
velset = 0, 0
ctrl = 0

[State 1114060, Anim]
type = changeanim
trigger1 = 1
value = 5012

[State 1114060, fall]
type = hitfallset
trigger1 = 1
value = 1

[State 1114060, Safety]
type = selfstate
trigger1 = time >= 40
value = 5030


;======================<ETERNAL SLUMBER>=============================
[Statedef 4100]
type = S
physics = S
movetype = A
anim = 4100
ctrl = 0
velset = 0, 0
poweradd = -3000
sprpriority = 1
facep2 = 1

[State 4100, Strength]
type = varset
trigger1 = 1
var(10) = 7

[State 4100, Super Pause FX]
type = helper
trigger1 = fvar(31)
trigger1 = time = 3
helpertype = normal
stateno = 7520
ID = 7500
name = "Superpause FX"
postype = p1
pos = ceil(-44 * const(size.xscale)), ceil(-164 * const(size.yscale))
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 4100, Super Pause]
type = superpause
trigger1 = time = 3
time = 47
movetime = 47
anim = ifelse(fvar(31), -1, 102)
pos = ceil(-44 * const(size.xscale)), ceil(-164 * const(size.yscale))
sound = s0, 8520
p2defmul = 1 + (0 * (fvar(5) := 0))
darken = ifelse(fvar(31), 0, 1)

[State 4100, NHB]
type = nothitby
trigger1 = animelemtime(5) <= -1
time = 1
value = SCA

[State 4100, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 8

[State 4100, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value = SCA, AA, AT
time = 1

[State 4100, heart]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 4105
ID = 4105
name = "Eternal Slumber"
postype = p1
pos = ceil(66 * const(size.xscale)), -74
size.xscale = 0.75
size.yscale = 0.75
ownpal = 1

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(40 * const(size.xscale)), -71
sprpriority = 0
scale = 0.5,0.5

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(56 * const(size.xscale)), -44
sprpriority = 0
scale = 0.5,0.5

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(-22 * const(size.xscale)), -18
sprpriority = 2
scale = 0.5,0.5

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = 1, -19
sprpriority = 2
scale = 0.5,0.5

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(22 * const(size.xscale)), -17
sprpriority = 2
scale = 0.5,0.5

[State 4100, batexplods]
type = explod
trigger1 = animelem = 2
anim = 6100
ID = 4100
postype = p1
pos = ceil(-52 * const(size.xscale)), -37
sprpriority = 2
scale = 0.5,0.5

[State 4100, batexplods]
type = modifyexplod
trigger1 = numexplod(4100)
ID = 4100
bindtime = -1
removetime = -1
removeongethit = 1
supermovetime = 60

[State 4100, batexplods]
type = removeexplod
trigger1 = animelemtime(9) >= 0 && numexplod(4100)
ID = 4100

[State 4100, Wait]
type = changeanim
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0 && numhelper(4105)
trigger1 = helper(4105), stateno = 4105
value = 4100
elem = 8

[State 4100, Success]
type = changestate
trigger1 = animelemtime(5) >= 0 && animelemtime(9) < 0 && numhelper(4105)
trigger1 = helper(4105), var(18) && helper(4105), stateno = 4107 && helper(4105), time >= 1
value = 4101
ignorehitpause = 1

[State 4100, Snd]
type = playsnd
trigger1 = animelem = 10
value = 4, 9
channel = 0
[State 4100, Type]
type = statetypeset
trigger1 = animelemtime(9) >= 0
movetype = I
[State 4100, imageoff]
type = afterimagetime
trigger1 = animelemtime(9) >= 0
time = 0

[State 4100, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 4101]
type = A
physics = N
movetype = A
anim = 4101
ctrl = 0
velset = 0, 0
sprpriority = 1

;[State 4101, zoom]
;type = zoom
;trigger1 = animelemtime(2) >= 0
;scale = gamewidth / 320.0
;pos = 0, 0
;ignorehitpause = 1

[State 4101, batexplods]
type = removeexplod
trigger1 = animelemtime(2) >= 0 && numexplod(4100)
ID = 4100

[State 4101, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4101, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4101, imageoff]
type = afterimagetime
trigger1 = animelemtime(2) >= 0
time = 0

[State 4101, spr]
type = sprpriority
trigger1 = 1
value = 1

[State 4101, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 4101, Camera]
type = screenbound
trigger1 = animelemtime(12) >= 0 && animelemtime(14) < 0
value = 1
movecamera = 1, 0

[State 4101, curtain]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4110
ID = 4110
name = "Curtain"
postype = p1
facing = 1
ownpal = 1
size.xscale = 1.0
size.yscale = 1.0

[State 4101, curtain]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4110
ID = 4110
name = "Curtain"
postype = p1
facing = -1
ownpal = 1
size.xscale = 1.0
size.yscale = 1.0

[State 4101, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 15
channel = 0

[State 4101, Snd]
type = playsnd
trigger1 = animelem = 2
value = 5, 9

[State 4101, Pos]
type = posset
trigger1 = animelemtime(2) >= 0
x = 0
y = 0

[State 4101, Pos]
type = posset
trigger1 = numhelper(4105) && animelemtime(12) >= 0 && animelemtime(14) < 0
x = helper(4105), var(11)
y = helper(4105), var(12)

[State 4101, spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0
value = 5

[State 4101, Palfx]
type = palfx
trigger1 = animelemtime(2) >= 0
time = 1
add = 9000, 9000, 9000
mul = 256, 0, 256

[State 4101, End]
type = changestate
trigger1 = !animtime
value = 4102
ctrl = 1


;--- END ---
[Statedef 4102]
type = S
physics = N
movetype = I
anim = 4102
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4102, Snd]
type = playsnd
trigger1 = !time
value = 4, 20
channel = 0

[State 4102, Pos]
type = posset
trigger1 = pos y
y = 0

[State 4102, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
