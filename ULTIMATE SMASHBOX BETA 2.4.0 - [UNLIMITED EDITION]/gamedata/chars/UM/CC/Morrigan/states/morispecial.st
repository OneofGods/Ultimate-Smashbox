; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;============================================================================================
;=====================================<SPECIAL STATES>=======================================
;============================================================================================

;======================<SOUL FIST>=============================
[Statedef 1000]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
facep2 = 1

[State 1000, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1000, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1000, FX]
type = explod
trigger1 = !time
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
pos = 5,-30
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1000, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 5
value = SCA, AA, AT
time = 1

[State 1000, Soul Fist]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 1005
ID = 1005
name = "Soul Fist"
postype = p1
pos = ceil(12 * const(size.xscale)), -50
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, 13
channel = 0

[State 1000, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 0

[State 1000, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<EX SOUL FIST>=============================
[Statedef 1010]
type = S
physics = S
movetype = A
anim = 1000
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1010, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1010, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(10 * const(size.xscale)), ceil(-51 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1010, FX]
type = explod
trigger1 = !time
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
pos = 5,-30
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1010, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value = SCA, AA, AT
time = 1

[State 1010, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1015
ID = 1015
name = "EX Soul Fist"
postype = p1
pos = ceil(12 * const(size.xscale)), -50
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1010, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4, 13
channel = 0
[State 1010, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State 1010, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<AIR SOUL FIST>=============================
[Statedef 1050]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
poweradd = 50 * !var(20)
sprpriority = 1
facep2 = p2dist x <= -const(size.ground.back)

[State 1050, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1050, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse((p2movetype = H || random < 500), 3, ifelse(random < 500, 2, 1))
ignorehitpause = 1

[State 1050, Width]
type = width
trigger1 = (animelemtime(4) >= 0 && animelemtime(9) < 0)
player = ceil(32 * const(size.xscale)), 0

[State 1050, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1050, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value = SCA, AA, AT
time = 1

[State 1050, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1055
ID = 1055
name = "Soul Fist"
postype = p1
pos = ceil(60 * const(size.xscale)), -48
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1050, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 1050, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.5

[State 1050, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = -1
y = -6

[State 1050, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 13
channel = 0
[State 1050, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;---Land---
[Statedef 1059]
type = S
physics = S
movetype = I
anim = 48
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1059, Pos]
type = posset
trigger1 = 1
y = 0

[State 1059, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1059, Dust]
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

[State 1059, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;======================<EX AIR SOUL FIST>=============================
[Statedef 1060]
type = A
physics = N
movetype = A
anim = 1050
ctrl = 0
velset = 0, 0
poweradd = -500
sprpriority = 1
facep2 = p2dist x <= -const(size.ground.back)

[State 1060, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1060, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(-12 * const(size.xscale)), ceil(-77 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1060, Width]
type = width
trigger1 = (animelemtime(4) >= 0 && animelemtime(9) < 0)
player = ceil(32 * const(size.xscale)), 0

[State 1060, FX]
type = explod
trigger1 = animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
scale = const(size.xscale), const(size.yscale)
bindtime = -1
removeongethit = 1
ownpal = 1

[State 1060, Correct Projectile Trade]
type = hitby
trigger1 = animelem = 6
value = SCA, AA, AT
time = 1

[State 1060, SoulFist]
type = helper
trigger1 = animelem = 6
helpertype = normal
stateno = 1065
ID = 1065
name = "EX Air Soul Fist"
postype = p1
pos = ceil(60 * const(size.xscale)), -48
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1060, Vel]
type = velset
trigger1 = animelemtime(6) < 0
x = 0
y = 0

[State 1060, Accel]
type = veladd
trigger1 = animelemtime(6) >= 1
y = 0.5

[State 1060, Vel]
type = velset
trigger1 = animelemtime(6) = 1
x = -1
y = -6

[State 1060, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 13
channel = 0
[State 1060, Snd]
type = playsnd
trigger1 = animelem = 6
value = 5, 0

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1059


;======================<SHADOW BLADE>=============================
[Statedef 1100]
type = S
physics = S
movetype = A
anim = 1100
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1100, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1100, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
ignorehitpause = 1

[State 1100, HB]
type = hitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 1
value = SC, AA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = hitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 2
value = C, AA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = nothitby
trigger1 = anim = 1100 && animelemtime(4) < 0
trigger1 = var(10) = 3
value = SCA
time = 1
ignorehitpause = 1

[State 1100, HB]
type = hitby
trigger1 = anim = 1100 && animelemtime(4) >= 0
value = SCA, AA, AT
time = 1
ignorehitpause = 1

[State 1100, Pos]
type = posadd
trigger1 = anim = 1100
trigger1 = animelem = 1 || animelem = 2
x = ifelse(var(10) = 3, 8, ifelse(var(10) = 2, 4, 0))

[State 1100, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 1100, Accel]
type = veladd
trigger1 = anim = 1100 && animelemtime(4) >= 1
trigger2 = anim = 1101
y = ifelse(var(10) = 3, 0.67, ifelse(var(10) = 2, 0.63, 0.50))

[State 1100, Vel]
type = velset
trigger1 = anim = 1100 && animelemtime(4) = 1
x = ifelse(var(10) = 3, 10.2, ifelse(var(10) = 2, 8.1, 4.9))
y = ifelse(var(10) = 3, -11.76, ifelse(var(10) = 2, -9.15, -5.50))

[State 1100, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 4
value = 0, 41
[State 1100, Dust]
type = helper
trigger1 = anim = 1100 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1100, Snd]
type = playsnd
trigger1 = anim = 1100 && animelem = 2
value = 4, 12
channel = 0
ignorehitpause = 1
persistent = 0

[State 1100, Hit]
type = hitdef
trigger1 = (animelem = 2 || animelem = 3) && anim = 1100
trigger1 = !movecontact && !movereversed
trigger1 = var(15) < 1
attr = S, SA
damage = 90 + (10 * var(10)), 12 + (1 * var(10))
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((animelem = 2), -35, -60)
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0 * !numhelper(775), ifelse(var(10) = 3, -10.5, ifelse(var(10) = 2, -9.0, -7.0))
air.type = Low
air.velocity = -4.0 * !numhelper(775), ifelse(var(10) = 3, -10.5, ifelse(var(10) = 2, -9.0, -7.0))
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 1100, Hit 2]
type = hitdef
trigger1 = animelem = 4 && anim = 1100
trigger1 = !movecontact && !movereversed
trigger1 = var(15) < 1
attr = A, SA
damage = 60, 7
animtype = Back
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 12
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -100
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0 * !numhelper(775), ifelse(var(10) = 3, -10.5, ifelse(var(10) = 2, -9.0, -7.0))
air.type = Low
air.velocity = -4.0 * !numhelper(775), ifelse(var(10) = 3, -10.5, ifelse(var(10) = 2, -9.0, -7.0))
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1100, Type]
type = statetypeset
trigger1 = anim = 1100 && animelemtime(4) >= 0
trigger2 = anim = 1101
statetype = A
physics = N

[State 1100, Anim]
type = changeanim
trigger1 = anim = 1100 && animelemtime(4) > 0 && vel y > -1
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1109


;---Land---
[Statedef 1109]
type = S
physics = S
movetype = I
anim = 1109
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 1109, Pos]
type = posset
trigger1 = 1
y = 0

[State 1109, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 1109, Dust]
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

[State 1109, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;======================<EX SHADOW BLADE>=============================
[Statedef 1110]
type = S
physics = S
movetype = A
anim = 1110
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1

[State 1110, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1110, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(36 * const(size.xscale)), ceil(-76 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1110, NHB]
type = nothitby
trigger1 = anim = 1110 && animelemtime(4) < 1
value = SCA
time = 1
ignorehitpause = 1

[State 1110, Pos]
type = posadd
trigger1 = anim = 1110
trigger1 = animelem = 1 || animelem = 2
x = 8

[State 1110, Vel]
type = velmul
trigger1 = vel y < 0
x = 0.95

[State 1110, Accel]
type = veladd
trigger1 = anim = 1110 && animelemtime(4) >= 1
trigger2 = anim = 1101
y = 0.67

[State 1110, Vel]
type = velset
trigger1 = anim = 1110 && animelemtime(4) = 1
x = 10.2
y = -11.76

[State 1110, Vel]
type = velset
trigger1 = anim = 1101
x = 0

[State 1110, Snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 4
value = 0, 41

[State 1110, Dust]
type = helper
trigger1 = anim = 1110 && animelem = 4
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 1110, Snd]
type = playsnd
trigger1 = anim = 1110 && animelem = 2
value = 4, 12
channel = 0
ignorehitpause = 1
persistent = 0

[State 1110, Hit]
type = hitdef
trigger1 = (animelem = 2 || animelem = 3) && anim = 1110
trigger1 = var(15) < (2 + hitcount)
attr = S, SA
damage = 40, 5
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((animelem = 2), -35, -60)
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -9.0
air.type = Low
air.velocity = 0, -9.0
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 1110, Hit 2]
type = hitdef
trigger1 = animelem = 4 && anim = 1110
trigger1 = var(15) < (2 + hitcount)
attr = A, SA
damage = 60, 7
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -100
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4.0 * !numhelper(775), -9.0
air.type = Low
air.velocity = -4.0 * !numhelper(775), -9.0
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1

[State 1110, Type]
type = statetypeset
trigger1 = anim = 1110 && animelemtime(4) >= 1
trigger2 = anim = 1101
statetype = A
physics = N

[State 1110, Anim]
type = changeanim
trigger1 = anim = 1110 && animelemtime(4) > 0 && vel y > -1
value = 1101

[State Idle]
type = statetypeset
trigger1 = anim = 1101
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 1109


;======================<PARASITE ROLL>=============================
;---Startup---
[Statedef 1200]
type = S
physics = S
movetype = A
anim = 1200
ctrl = 0
velset = 0, 0
poweradd = 100 * !var(20)
facep2 = 1
sprpriority = 1

[State 1200, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1200, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = ifelse(random < 500, 3, ifelse(random < 666, 2, 1))
ignorehitpause = 1

[State 1200, End]
type = changeanim
trigger1 = !time
value = ifelse(var(10) = 3, 1202, ifelse(var(10) = 2, 1201, 1200))

[State 1200, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 20
channel = 0

[State 1200, End]
type = changestate
trigger1 = !animtime
value = 1205


;---Active---
[Statedef 1205]
type = S
physics = N
movetype = A
anim = ifelse(var(10) = 3, 1207, ifelse(var(10) = 2, 1206, 1205))
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1205, Vel]
type = velmul
trigger1 = 1
x = 0.95

[State 1205, Vel]
type = velset
trigger1 = !time
x = ifelse(var(10) = 3, 9, ifelse(var(10) = 2, 8, 7))

[State 1205, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 7 || animelem = 13
value = 1, 9
channel = 1

[State 1205, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = ceil(-16 * const(size.xscale)), 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1205, Hit]
type = hitdef
trigger1 = animelem = 4 || animelem = 10 || animelem = 16
trigger1 = var(15) < 1
attr = S, SA
damage = ifelse(var(10) = 3, 34, ifelse(var(10) = 2, 40, 60)), 7;hitcount >= 1, ceil(60.0 / (hitcount + 1)), 60), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = -5.62, 0
air.type = Low
air.velocity = -3.5, -7
ground.cornerpush.veloff = 0
guard.velocity = -12.97
guard.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1205, Sparkles]
type = explod
trigger1 = !(gametime % 3) && numexplod(6000) < 32
anim = 6000 + (random % 3)
ID = 6000
sprpriority = ifelse(random < 333, -1, 3)
postype = p1
pos = ceil(-8 * const(size.xscale)), 0
random = 16, 16
vel = 0, -1
removetime = -2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 1205, End]
type = changestate
trigger1 = !animtime
value = 1210


;---Recovery---
[Statedef 1210]
type = S
physics = S
movetype = I
anim = ifelse(var(10) = 3, 1212, ifelse(var(10) = 3, 1211, 1210))
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1



;======================<EX PARASITE ROLL>=============================
;---Startup---
[Statedef 1250]
type = S
physics = S
movetype = A
anim = 1250
ctrl = 0
velset = 0, 0
poweradd = -500
facep2 = 1
sprpriority = 1

[State 1250, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1250, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(38 * const(size.xscale)), ceil(-102 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1250, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 20
channel = 0

[State 1250, End]
type = changestate
trigger1 = !animtime
value = 1251


;---Active---
[Statedef 1251]
type = S
physics = N
movetype = A
anim = 1251
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1251, Vel]
type = velmul
trigger1 = 1
x = 0.95

[State 1251, Vel]
type = velset
trigger1 = !time
x = 12

[State 1251, Snd]
type = playsnd
trigger1 = animelem = 1 || animelem = 7 || animelem = 13 || animelem = 19
value = 1, 9
channel = 1

[State 1251, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = ceil(-16 * const(size.xscale)), 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1251, Hit]
type = hitdef
trigger1 = !((movecontact + movereversed) % 8)
trigger1 = var(15) < 1
attr = S, SA
damage = 20, 4;ifelse(hitcount >= 1, ceil(56.0 / (hitcount + 1)), 56), 7
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8023)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = ifelse(animelemtime(21) > 0, -5.62, 0), 0
air.type = Low
air.velocity = -3.5, -7
ground.cornerpush.veloff = 0
guard.velocity = ifelse(animelemtime(21) > 0, -5.62, 0)
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
forcestand = 1
airguard.cornerpush.veloff = 0

[State 1251, Sparkles]
type = explod
trigger1 = !(gametime % 3) && numexplod(6000) < 32
anim = 6000 + (random % 3)
ID = 6000
sprpriority = ifelse(random < 333, -1, 3)
postype = p1
pos = ceil(-16 * const(size.xscale)), 0
random = 16, 16
vel = 0, -1
removetime = -2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 1251, End]
type = changestate
trigger1 = !animtime
value = 1252


;---Recovery---
[Statedef 1252]
type = S
physics = S
movetype = I
anim = 1252
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 1252, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;======================<VECTOR DRAIN>=============================
[Statedef 1300]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1300
sprpriority = 1
facep2 = 1

[State 1300, Strength]
type = varset
trigger1 = var(10) != [1, 3]
var(10) = 2
ignorehitpause = 1

[State 1300, Strength AI]
type = varset
trigger1 = time <= 0 && AIlevel
var(10) = 3
ignorehitpause = 1

[State 1300, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = ceil(ifelse((animelem = 3), 25, 15) * const(size.xscale))

[State 1300, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 1300, Hit]
type = hitdef
triggerall = animelem = 2
triggerall = !var(29)
trigger1 = p2dist x >= 0 && p2bodydist x <= (25 * const(size.xscale));CvS2; 29 MvC
attr = S, ST
hitflag = M
priority = 7, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = 1
p2facing = 1
p1stateno = 1301
fall = 1
fall.recover = 0
ID = 1300
yaccel = 0.4850
numhits = 0

[State 1300, misssnd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 1300, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1301]
type = A
physics = N
movetype = A
anim = 1301
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1306

[State 1301, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1301, Width]
type = width
trigger1 = 1
edge = ceil(60 * const(size.xscale)), 0

[State 1301, Vel]
type = velmul
trigger1 = vel x
x = 0.97

[State 1301, jet]
type = helper
trigger1 = (anim = [1302, 1303]) && !numhelper(6020)
helpertype = normal
stateno = 6026
ID = 6020
name = "Jets"
postype = p1
ownpal = 1

[State 1301, Dust]
type = explod
trigger1 = anim = 1302
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
pos = ceil(-108 * const(size.xscale)), -ceil(pos y)
scale = 0.33, 0.33
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 1301, Anim]
type = changeanim
trigger1 = anim = 1301 && !animtime
value = 1302
[State 1301, Throw]
type = targetstate
trigger1 = anim = 1302
value = 1307
persistent = 0

[State 1301, Vel]
type = velset
trigger1 = anim = 1302 && animelem = 1
x = 4
y = -6
[State 1301, Vel]
type = velmul
trigger1 = anim = 1302
y = 0.97

[State 1301, Anim]
type = changeanim
trigger1 = anim = 1302 && vel y >= -1
value = 1303
[State 1301, Throw]
type = targetstate
trigger1 = anim = 1303
value = 1308
persistent = 0
[State 1301, Snd]
type = playsnd
trigger1 = anim = 1303
value = 4, 11
channel = 0
persistent = 0
[State 1301, Snd]
type = playsnd
trigger1 = anim = 1303 && (animelem = 4 || animelem = 6 || animelem = 8)
value = 1, 6
channel = 1

[State 1301, Spiral]
type = explod
trigger1 = anim = 1303 && animelem = 5
anim = 1315
ID = 1315
sprpriority = 3
postype = p1
facing = -1
bindtime = -1
ownpal = 1

[State 1301, Vel]
type = velset
trigger1 = anim = 1303 && animelem = 1
x = -5
y = -10
[State 1301, Accel]
type = veladd
trigger1 = anim = 1303
y = 0.7

[State 1301, Bind 1]
type = targetbind
trigger1 = anim = 1301 && animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(118 * const(size.xscale)), -71

[State 1301, Bind 2]
type = targetbind
trigger1 = anim = 1301 && animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(128 * const(size.xscale)), -76

[State 1301, Bind 3]
type = targetbind
trigger1 = anim = 1301 && animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(120 * const(size.xscale)), -76

[State 1301, Bind 1302]
type = targetbind
trigger1 = anim = 1302
pos = ceil(84 * const(size.xscale)), -81

[State 1301, Bind 1]
type = targetbind
trigger1 = anim = 1303 && animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(84 * const(size.xscale)), -81

[State 1301, Bind 2]
type = targetbind
trigger1 = anim = 1303 && animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(50 * const(size.xscale)), -95

[State 1301, Bind 3]
type = targetbind
trigger1 = anim = 1303 && animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(4 * const(size.xscale)), -98

[State 1301, Bind 4]
type = targetbind
trigger1 = anim = 1303 && animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(-46 * const(size.xscale)), -90

[State 1301, Bind 5]
type = targetbind
trigger1 = anim = 1303 && animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(-74 * const(size.xscale)), -74

[State 1301, Bind 6]
type = targetbind
trigger1 = anim = 1303 && animelemtime(6) >= 0 && animelemtime(7) < 0
trigger2 = anim = 1303 && animelemtime(9) >= 4
pos = ceil(4 * const(size.xscale)), -38

[State 1301, Bind 7]
type = targetbind
trigger1 = anim = 1303 && animelemtime(7) >= 0 && animelemtime(8) < 0
pos = ceil(96 * const(size.xscale)), -41

[State 1301, Bind 8]
type = targetbind
trigger1 = anim = 1303 && animelemtime(8) >= 0 && animelemtime(9) < 0
pos = ceil(4 * const(size.xscale)), -44

[State 1301, Bind 9]
type = targetbind
trigger1 = anim = 1303 && animelemtime(9) >= 0 && animelemtime(9) < 4
pos = ceil(-92 * const(size.xscale)), -41

[State 1301, End]
type = changestate
trigger1 = anim = 1303 && vel y > 0 && vel y > 0 && (pos y > -vel y)
value = 1305


;--- HIT FLOOR ---
[Statedef 1305]
type = C
physics = C
movetype = A
anim = 1305
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1305, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0
[State 1305, Vel]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 1305, Assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1305, Throw]
type = targetstate
trigger1 = !time
value = 1310

[State 1305, Stun]
type = targetstate
trigger1 = numtarget(1300)
trigger1 = target(1300), stateno = 1310 && target(1300), time = 17
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 1305, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1305, Juggle]
type = varadd
trigger1 = !time
var(15) = 1

[State 1305, Damage]
type = targetlifeadd
trigger1 = !time
value = -ceil(140 * fvar(11))

[State 1305, Stun System - Add]
type = varadd
trigger1 = animelem = 1
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(150 * fvar(11))

[State 1305, Damage]
type = targetpoweradd
trigger1 = !time
value = 40;givepower

[State 1305, Damage]
type = poweradd
trigger1 = !time && !var(20)
value = 100;getpower

[State 1305, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(96 * const(size.xscale)), 0

[State 1305, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 120
ampl = 6
[State 1305, Snd]
type = playsnd
trigger1 = !time
value = 5, 2
[State 1305, Dust]
type = explod
trigger1 = !time
anim = 7120
ID = 7120
sprpriority = -5
postype = p2
ownpal = 1
scale = 0.5, 0.5

[State 1305, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -6
[State 1305, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = A


;--- TARGET ---
[Statedef 1306]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1306, Anim]
type = changeanim2
trigger1 = !time
value = 1306

[State 1306, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1306, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1307]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1307, Anim]
type = changeanim2
trigger1 = !time
value = 1307

[State 1307, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1307, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 1308]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1308, Anim]
type = changeanim2
trigger1 = !time
value = 1308

[State 1308, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 1308, spr]
type = sprpriority
trigger1 = (animelemtime(6) >= 0 && animelemtime(7) < 0) || animelemtime(8) >= 8
value = 2

[State 1308, spr]
type = sprpriority
trigger1 = (animelemtime(6) < 0 || animelemtime(7) >= 0) && animelemtime(8) < 8
value = 0

[State 1308, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


;--- TARGET HIT FLOOR ---
[Statedef 1310]
type = A
physics = N
movetype = H
ctrl = 0
sprpriority = 0

[State 1310, Anim]
type = changeanim2
trigger1 = !time
value = 1310

[State 1310, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -6

[State 1310, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.5

[State Safe Fall]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 1310, Turn]
type = turn
trigger1 = animelemtime(2) >= 0 && vel y > 0 && pos y >= -10
persistent = 0
[State 1310, End]
type = selfstate
trigger1 = animelemtime(2) >= 0 && vel y > 0 && pos y >= -10
value = 5100




;======================<EX VECTOR DRAIN>=============================
[Statedef 1320]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 1300
poweradd = -500
sprpriority = 1
facep2 = 1

[State 1320, Strength]
type = varset
trigger1 = var(10) != 4
var(10) = 4
ignorehitpause = 1

[State 1320, ExFX]
type = explod
trigger1 = !time
anim = 7210
sprpriority = 3
postype = p1
pos = ceil(66 * const(size.xscale)), ceil(-138 * const(size.yscale))
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 1320, Pos]
type = posadd
trigger1 = animelem = 3 || animelem = 4
x = ceil(ifelse((animelem = 3), 25, 15) * const(size.xscale))

[State 1320, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 1320, Hit]
type = hitdef
trigger1 = animelem = 2
trigger1 = !var(29)
trigger1 = p2dist x >= 0 && p2bodydist x <= (58 * const(size.xscale))
attr = S, ST
hitflag = M
priority = 7, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = 1
p2facing = 1
p1stateno = 1321
fall = 1
fall.recover = 0
ID = 1320
yaccel = 0.4850
numhits = 0

[State 1320, misssnd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 1320, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 1321]
type = A
physics = N
movetype = A
anim = 1301
ctrl = 0
velset = 0, 0
sprpriority = 1

[State Throw]
type = targetstate
trigger1 = !time
value = 1306

[State 1321, assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1321, Width]
type = width
trigger1 = 1
edge = ceil(60 * const(size.xscale)), 0

[State 1321, Vel]
type = velmul
trigger1 = vel x
x = 0.97

[State 1321, jet]
type = helper
trigger1 = (anim = [1302, 1303]) && !numhelper(6020)
helpertype = normal
stateno = 6026
ID = 6020
name = "Jets"
postype = p1
ownpal = 1

[State 1321, Dust]
type = explod
trigger1 = anim = 1302
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = ceil(-108 * const(size.xscale)), -ceil(pos y)
scale = 0.33, 0.33
ownpal = 1
persistent = 0
pausemovetime = -1
supermovetime = -1

[State 1321, Anim]
type = changeanim
trigger1 = anim = 1301 && !animtime
value = 1302
[State 1321, Throw]
type = targetstate
trigger1 = anim = 1302
value = 1307
persistent = 0

[State 1321, Vel]
type = velset
trigger1 = anim = 1302 && animelem = 1
x = 5.5
y = -8
[State 1321, Vel]
type = velmul
trigger1 = anim = 1302
y = 0.97
[State 1321, Snd]
type = playsnd
trigger1 = anim = 1302
value = 4, 3
channel = 0
persistent = 0

[State 1321, Anim]
type = changeanim
trigger1 = anim = 1302 && vel y >= -1
value = 1303
[State 1321, Throw]
type = targetstate
trigger1 = anim = 1303
value = 1308
persistent = 0
[State 1321, Snd]
type = playsnd
trigger1 = anim = 1303
value = 4, 11
channel = 0
persistent = 0
[State 1321, Snd]
type = playsnd
trigger1 = anim = 1303 && (animelem = 4 || animelem = 6 || animelem = 8)
value = 1, 6
channel = 1

[State 1321, Spiral]
type = explod
trigger1 = anim = 1303 && animelem = 5
anim = 1315
ID = 1315
sprpriority = 3
postype = p1
facing = -1
bindtime = -1
ownpal = 1

[State 1321, Vel]
type = velset
trigger1 = anim = 1303 && animelem = 1
x = -7
y = -14
[State 1321, Accel]
type = veladd
trigger1 = anim = 1303
y = 0.75

[State 1321, bind 1]
type = targetbind
trigger1 = anim = 1301 && animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(118 * const(size.xscale)), -71

[State 1321, bind 2]
type = targetbind
trigger1 = anim = 1301 && animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(128 * const(size.xscale)), -76

[State 1321, bind 3]
type = targetbind
trigger1 = anim = 1301 && animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(120 * const(size.xscale)), -76

[State 1321, bind 1322]
type = targetbind
trigger1 = anim = 1302
pos = ceil(84 * const(size.xscale)), -81

[State 1321, bind 1]
type = targetbind
trigger1 = anim = 1303 && animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(84 * const(size.xscale)), -81

[State 1321, bind 2]
type = targetbind
trigger1 = anim = 1303 && animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(50 * const(size.xscale)), -95

[State 1321, bind 3]
type = targetbind
trigger1 = anim = 1303 && animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(4 * const(size.xscale)), -98

[State 1321, bind 4]
type = targetbind
trigger1 = anim = 1303 && animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(-46 * const(size.xscale)), -90

[State 1321, bind 5]
type = targetbind
trigger1 = anim = 1303 && animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(-74 * const(size.xscale)), -74

[State 1321, bind 6]
type = targetbind
trigger1 = anim = 1303 && animelemtime(6) >= 0 && animelemtime(7) < 0
trigger2 = anim = 1303 && animelemtime(9) >= 4
pos = ceil(4 * const(size.xscale)), -38

[State 1321, bind 7]
type = targetbind
trigger1 = anim = 1303 && animelemtime(7) >= 0 && animelemtime(8) < 0
pos = ceil(96 * const(size.xscale)), -41

[State 1321, bind 8]
type = targetbind
trigger1 = anim = 1303 && animelemtime(8) >= 0 && animelemtime(9) < 0
pos = ceil(4 * const(size.xscale)), -44

[State 1321, bind 9]
type = targetbind
trigger1 = anim = 1303 && animelemtime(9) >= 0 && animelemtime(9) < 4
pos = ceil(-92 * const(size.xscale)), -41

[State 1321, End]
type = changestate
trigger1 = anim = 1303 && vel y > 0 && vel y > 0 && (pos y > -vel y)
value = 1325


;--- HIT FLOOR ---
[Statedef 1325]
type = A
physics = N
movetype = A
anim = 1305
ctrl = 0
velset = 0, 0
sprpriority = 1
[State 1325, Pos]
type = posset
trigger1 = animelemtime(2) < 0
y = 0
[State 1325, Vel]
type = velset
trigger1 = animelemtime(2) < 0
x = 0
y = 0

[State 1325, assert]
type = assertspecial
trigger1 = 1
flag = noautoturn

[State 1325, Throw]
type = targetstate
trigger1 = !time
value = 1310

[State 1325, Stun]
type = targetstate
trigger1 = numtarget(1320)
trigger1 = target(1320), stateno = 1310 && target(1320), time = 17
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 1325, Damage]
type = hitadd
trigger1 = !time
value = 1

[State 1325, Juggle]
type = varadd
trigger1 = !time
var(15) = 1

[State 1325, Damage]
type = targetlifeadd
trigger1 = !time
value = -ceil(160 * fvar(11))

[State 1325, Stun System - Add]
type = varadd
trigger1 = animelem = 1
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(200 * fvar(11))

[State 1325, bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(96 * const(size.xscale)), 0

[State 1325, Shake]
type = envshake
trigger1 = !time
time = 18
freq = 60
ampl = 6
[State 1325, Snd]
type = playsnd
trigger1 = !time
value = 5, 2

[State 1325, Dust]
type = explod
trigger1 = !time
anim = 7120
ID = 7120
sprpriority = -5
postype = p2
ownpal = 1
scale = 0.5, 0.5

[State 1325, Vel]
type = velset
trigger1 = animelem = 2
x = -4
y = -6
[State 1325, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
physics = A
