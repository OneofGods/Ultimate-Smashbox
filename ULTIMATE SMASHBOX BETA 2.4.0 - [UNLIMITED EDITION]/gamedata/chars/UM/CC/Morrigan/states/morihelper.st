; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;==============================================================================================
;=======================================<HELPER STATES>========================================
;==============================================================================================

;========================<SOUL FIST>=============================
[Statedef 1005]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1005, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1005, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1000
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 1005, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1005, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 5.67, ifelse(var(10) = 2, 4.72, 3.77))
y = 0

[State 1005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 6), 256
ignorehitpause = 1

[State 1005, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 4
postype = p1
bindtime = -1
removetime = -1
scale = 0.5,0.5
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1005, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
random = 20, 20
removetime = -2
scale = 0.33, 0.33
ignorehitpause = 1

[State 1005, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 1005, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 1005, Hit]
type = hitdef
trigger1 = (root, var(15) < 1 || root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(60 * (root, fvar(11))), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -4
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 50 * !(root, var(20)), 25 * !(root, var(20))
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 1005, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1005, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1005, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1005, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(100 * root, fvar(11))
ignorehitpause = 1

[State 1005, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = var(1) >= ifelse(var(10) = 3, 80, ifelse(var(10) = 2, 65, 50))
trigger2 = frontedgedist < -80
trigger3 = backedgedist < -80
trigger3 = root, var(20) <= 0
value = 1007
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1


;--- Contact ---
[Statedef 1006]
type = A
physics = N
movetype = I
anim = 1006
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 1006, removebat]
type = removeexplod
trigger1 = numexplod(1008)
ID = 1008
ignorehitpause = 1

[State 1006, Bats]
type = helper
trigger1 = !numexplod(1008)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
persistent = 0
ownpal = 1

[State 1006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 1006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1006, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 1006, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 1006, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 1115200
ignorehitpause = 1

[State 1006, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;--- Fade ---
[Statedef 1007]
type = A
physics = N
movetype = I
anim = 1007
velset = 0.5 * vel x, 0.5 * vel y
ctrl = 0
sprpriority = 4

[State 1007, removebat]
type = removeexplod
trigger1 = numexplod(1008)
ID = 1008

[State 1007, Bats]
type = helper
trigger1 = !numexplod(1008)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
persistent = 0
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 1007, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) -time * (const(size.xscale) / 15), const(size.yscale) -time * (const(size.yscale) / 15)

[State 1007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 1007, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 1007, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 1007, End]
type = destroyself
trigger1 = !numexplod(1008)
trigger1 = time >= 15


;========================<AIR SOUL FIST>=============================
[Statedef 1055]
type = A
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1

[State 1055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1055, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1055, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1055, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1050
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = 1
x = ifelse(var(10) = 3, 4.6, ifelse(var(10) = 2, 3.83, 2.88))
y = 4.8

[State 1055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 6), 256
ignorehitpause = 1

[State 1055, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1058
ID = 1008
sprpriority = 4
postype = p1
bindtime = -1
removetime = -1
scale = 0.5,0.5
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1055, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), -0.5 + (random < 500)
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
random = 20, 20
removetime = -2
scale = 0.33, 0.33
ignorehitpause = 1

[State 1055, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 1055, Miss]
type = hitdef
trigger1 = 1
attr = A, SP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 1055, Hit]
type = hitdef
trigger1 = (root, var(15) < 1 || root, var(20))
priority = 4, Hit
attr = A, SP
damage = ceil(60 * (root, fvar(11))), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -3 * !numhelper(775), -6
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 50 * !(root, var(20)), 25 * !(root, var(20))
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 1055, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1055, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1055, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1055, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(100 * root, fvar(11))
ignorehitpause = 1

[State 1055, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = pos y >= -20
trigger2 = frontedgedist < -80
trigger3 = backedgedist < -80
trigger3 = root, var(20) <= 0
value = 1007
ignorehitpause = 1

[State 1055, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1


;========================<EX SOUL FIST>=============================
[Statedef 1015]
type = S
physics = N
movetype = A
anim = 1005
ctrl = 0
sprpriority = 4

[State 1015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1015, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1015, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1015, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1015, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1010
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 1015, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1015, Vel]
type = velset
trigger1 = time < 8
x = 6
y = 0

[State 1015, Vel]
type = velset
trigger1 = vel y > 0 && pos y >= -20
y = 0
[State 1015, Vel]
type = posset
trigger1 = vel y > 0 && pos y >= -20
y = -20

[State 1015, Bats]
type = removeexplod
trigger1 = vel x < 0
ID = 1008
persistent = 0

[State 1015, Turn]
type = turn
trigger1 = time >= 8
trigger1 = vel x < 0
persistent = 0

[State 1015, Accel]
type = veladd
trigger1 = vel x < 6 && p2dist x >= 0
x = 0.2
[State 1015, Accel]
type = veladd
trigger1 = vel x > -6 && p2dist x < 0
x = -0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = S || enemynear, statetype = A) && pos y < (enemynear, pos y + enemynear, const(size.mid.pos.y))
y = 0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = S || enemynear, statetype = A) && pos y > (enemynear, pos y + enemynear, const(size.mid.pos.y))
y = -0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = C) && pos y < (enemynear, pos y + (enemynear, const(size.mid.pos.y) / 2.0))
y = 0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = C) && pos y > (enemynear, pos y + (enemynear, const(size.mid.pos.y) / 2))
y = -0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = L) && pos y < -10
y = 0.2
[State 1015, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = L) && pos y > -10
y = -0.2

[State 1015, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 6), 256
ignorehitpause = 1

[State 1015, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 4
postype = p1
bindtime = -1
removetime = -1
scale = 0.5,0.5
removeongethit = 1
ignorehitpause = 1

[State 1015, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
random = 20, 20
removetime = -2
scale = 0.33, 0.33
ignorehitpause = 1

[State 1015, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 1015, Miss]
type = hitdef
trigger1 = 1
attr = S, SP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 1015, Hit]
type = hitdef
trigger1 = (root, var(15) < 1 || root, var(20))
priority = 4, Hit
attr = S, SP
damage = ceil(80 * (root, fvar(11))), 10
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -4
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 1015, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1015, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1015, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1015, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(100 * root, fvar(11))
ignorehitpause = 1

[State 1015, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = var(1) >= 90
trigger2 = root, movetype = H
value = 1007
ignorehitpause = 1

[State 1015, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1


;========================<EX AIR SOUL FIST>=============================
[Statedef 1065]
type = A
physics = N
movetype = A
anim = 1005
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1065, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 1006
ignorehitpause = 1
[State 1065, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1065, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 1060, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 1060, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 1060
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 1065, Time Var]
type = varadd
trigger1 = time
var(1) = 1

[State 1065, Vel]
type = velset
trigger1 = time < 8
x = 4.24
y = 4.24

[State 1065, Vel]
type = velset
trigger1 = vel y > 0 && pos y >= -20
y = 0
[State 1065, Vel]
type = posset
trigger1 = vel y > 0 && pos y >= -20
y = -20

[State 1065, Bats]
type = removeexplod
trigger1 = vel x < 0
ID = 1008
persistent = 0

[State 1065, Turn]
type = turn
trigger1 = time >= 8
trigger1 = vel x < 0
persistent = 0

[State 1065, Accel]
type = veladd
trigger1 = vel x < 6 && p2dist x >= 0
x = 0.2
[State 1065, Accel]
type = veladd
trigger1 = vel x > -6 && p2dist x < 0
x = -0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = S || enemynear, statetype = A) && pos y < (enemynear, pos y + enemynear, const(size.mid.pos.y))
y = 0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = S || enemynear, statetype = A) && pos y > (enemynear, pos y + enemynear, const(size.mid.pos.y))
y = -0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = C) && pos y < (enemynear, pos y + (enemynear, const(size.mid.pos.y) / 2.0))
y = 0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = C) && pos y > (enemynear, pos y + (enemynear, const(size.mid.pos.y) / 2.0))
y = -0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y < 6 && (enemynear, statetype = L) && pos y < -10
y = 0.2
[State 1065, Accel]
type = veladd
trigger1 = vel y > -6 && (enemynear, statetype = L) && pos y > -10
y = -0.2

[State 1065, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - 32 * (time % 6), 256
ignorehitpause = 1

[State 1065, Bats]
type = explod
trigger1 = !numexplod(1008)
anim = 1008
ID = 1008
sprpriority = 4
postype = p1
bindtime = -1
removetime = -1
scale = 0.5,0.5
removeongethit = 1
ignorehitpause = 1
scale = 1, 1

[State 1065, Particles]
type = explod
trigger1 = !(time % 2)
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 1009
sprpriority = 3
postype = p1
random = 20, 20
removetime = -2
scale = 0.33, 0.33
ignorehitpause = 1

[State 1065, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 1065, Miss]
type = hitdef
trigger1 = 1
attr = A, SP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 1065, Hit]
type = hitdef
trigger1 = (root, var(15) < 1 || root, var(20))
priority = 4, Hit
attr = A, SP
damage = ceil(80 * (root, fvar(11))), 10
guard.dist = const(size.proj.attack.dist)
animtype = Hard
hitflag = MAFD
guardflag = MA
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -4
down.velocity = 0, 0
down.hittime = 20
air.fall = 1
fall.recover = 1
fall.recovertime = 120
getpower = 0
givepower = 40, 40
envshake.time = 10
envshake.ampl = 1
envshake.freq = 180
sprpriority = 4
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 1065, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1065, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 2)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 1065, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 1065, Stun System - Add]
type = parentvaradd
trigger1 = movehit = 1
trigger1 = numtarget
trigger1 = target, gethitvar(damage) > 0
trigger1 = root, var(42) >= 0
trigger1 = root, var(20) <= 0
var(42) = ceil(100 * root, fvar(11))
ignorehitpause = 1

[State 1065, Stun System - Dizzy]
type = targetstate
trigger1 = movehit = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = roundstate = 2 && numtarget
trigger1 = target, gethitvar(damage) < target, life
trigger1 = root, var(42) >= (target, const(data.life))
value = 1115310
ignorehitpause = 1

[State 1065, End]
type = changestate
trigger1 = var(1) >= 90
trigger2 = root, movetype = H
value = 1007
ignorehitpause = 1

[State 1065, End]
type = changestate
trigger1 = movecontact
value = 1006
ignorehitpause = 1


;========================<SOUL PHOENIX>=============================
[Statedef 3005]
type = S
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3005, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 3005, 3006)
ignorehitpause = 1
[State 3005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3005, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3005, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3005, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3005, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3000
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 3005, Time Var]
type = varadd
trigger1 = time && var(1) < 60
var(1) = 1

[State 3005, Vel]
type = velset
trigger1 = 1
x = 6.7
y = 0

[State 3005, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3005, Skull]
type = explod
trigger1 = !numexplod(3008)
anim = 3008
ID = 3008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5,0.5
removeongethit = 1
ignorehitpause = 1

[State 3005, Particles]
type = explod
trigger1 = 1
anim = 8150
ID = 8150
sprpriority = 4
postype = p1
pos = -5, 0
random = 20, 20
vel = -2, -1 + (random / 500.0)
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3005, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 3005, Freeze]
type = posfreeze
trigger1 = time <= (prevstateno = 3005) * 6
value = 1

[State 3005, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 3005, Hit]
type = hitdef
trigger1 = (root, var(15) < (2 + var(2)) || root, var(20))
trigger1 = time >= (prevstateno = 3005) * 6
priority = 4, Hit
attr = S, HP
damage = ceil(80 * (root, fvar(11))), 10
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAF
guardflag = M
pausetime = 0, 12
sparkno = -1
sparkxy = 0, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4 * !numhelper(775), -6
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -6
guard.velocity = -12.97
fall = 1
fall.recover = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1
ID = 3005

[State 3005, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3005)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(3005), stateno = 5000) || (target(3005), stateno = 5010) || (target(3005), stateno = 5020)
value = 7697
ID = 3005
ignorehitpause = 1

[State 3005, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3005, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3005, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3005, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = var(1) > 60
trigger2 = frontedgedist < -120
trigger3 = backedgedist < -120
trigger3 = root, var(20) <= 0
value = 3007
ignorehitpause = 1

[State 3005, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 3005, 3006)
ignorehitpause = 1

[Statedef 3006]
type = A
physics = N
movetype = I
anim = 3006
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 3006, Remove Skull]
type = removeexplod
trigger1 = numexplod(3008)
ID = 3008

[State 3006, Trade Sound]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = [5000, 5999]
value = 2, 0
channel = 2
lowpriority = 1
volumescale = 50

[State 3006, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3006, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 3006, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 3006, End]
type = destroyself
triggerall = !animtime
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


[Statedef 3007]
type = A
physics = N
movetype = I
anim = 3007
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 3007, Remove Skull]
type = removeexplod
trigger1 = numexplod(3008)
ID = 3008

[State 3007, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) -time * (const(size.xscale) / 15), const(size.yscale) -time * (const(size.yscale) / 15)

[State 3007, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3007, Vel]
type = velset
trigger1 = pos y >= -10
x = 0
y = 0

[State 3007, Vel]
type = posset
trigger1 = pos y >= -10
y = -10

[State 3007, End]
type = destroyself
trigger1 = time >= 15


;========================<MID-AIR SOUL PHOENIX>=============================
[Statedef 3055]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 3055, Hit Number]
type = varadd
trigger1 = 1
var(2) = 1
persistent = 0
ignorehitpause = 1

[State 3055, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = ifelse(var(2) < 3, 3055, 3006)
ignorehitpause = 1
[State 3055, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3055, Strength]
type = varset
trigger1 = var(10) != 5
var(10) = 5
[State 3055, Anim]
type = changeanim
trigger1 = !time && !prevstateno
value = 3005

[State 3055, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3055, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3050
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 3055, Vel]
type = velset
trigger1 = 1
x = 5.83
y = 2.33

[State 3055, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3055, Skull]
type = explod
trigger1 = !numexplod(3008)
anim = 3058
ID = 3008
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
removeongethit = 1
ignorehitpause = 1
scale = 0.5, 0.5

[State 3055, Particles]
type = explod
trigger1 = 1
anim = 8150
ID = 8150
sprpriority = 4
postype = p1
pos = -5, -5
random = 20, 20
vel = -2, -1 - (random / 500.0)
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1

[State 3055, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 3055, Freeze]
type = posfreeze
trigger1 = time <= (prevstateno = 3055) * 6
value = 1

[State 3055, Miss]
type = hitdef
trigger1 = 1
attr = A, HP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 3055, Hit]
type = hitdef
trigger1 = (root, var(15) < (2 + var(2)) || root, var(20))
trigger1 = time >= (prevstateno = 3055) * 6
priority = 4, Hit
attr = A, HP
damage = ceil(80 * (root, fvar(11))), 10
guard.dist = const(size.proj.attack.dist)
animtype = Back
hitflag = MAFD
guardflag = M
pausetime = 0, 12
sparkno = -1
sparkxy = 0, 0
guard.sparkno = -1 + 0 * (var(34) := 8001)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -4 * !numhelper(775), -6
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -6
down.velocity = 0, 0
down.hittime = 20
guard.velocity = -12.97
fall = 1
fall.recover = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
palfx.sinadd = 128, 128, 128, 4
palfx.mul = 128, 128, 128
palfx.time = 60
sprpriority = 4
yaccel = 0.4850
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1
ID = 3055

[State 3055, Burned]
type = targetstate
trigger1 = movehit
trigger1 = numtarget(3055)
trigger1 = target, selfanimexist(7697)
trigger1 = (target(3055), stateno = 5000) || (target(3055), stateno = 5010) || (target(3055), stateno = 5020)
value = 7697
ID = 3055
ignorehitpause = 1

[State 3055, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3055, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3055, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3055, Flame Particles]
type = helper
trigger1 = !numhelper(8150)
trigger1 = movehit = 1 && numtarget
trigger1 = !(target, hitshakeover)
trigger1 = var(40) := (target, ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "Flame Particles"
postype = p2
ownpal = 1
ignorehitpause = 1

[State 3055, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3055, End]
type = changestate
trigger1 = pos y >= -20
trigger2 = frontedgedist < -120
trigger3 = backedgedist < -120
trigger3 = root, var(20) <= 0
value = 3007
ignorehitpause = 1

[State 3055, End]
type = changestate
trigger1 = movecontact
value = ifelse(var(2) < 3, 3055, 3006)
ignorehitpause = 1


;========================<FINISHING SHOWER>=============================
[Statedef 3305]
type = S
physics = N
movetype = A
anim = 3305
ctrl = 0
velset = 0, 0
sprpriority = 3

[State 3305, Pos]
type = varset
trigger1 = !time
fvar(24) = -36 - (random / 100.0)
[State 3305, Pos]
type = varset
trigger1 = !time
fvar(25) = -30 - 70 * ((fvar(24) + 36) / -10.0)

[State 3305, Bind]
type = bindtoroot
trigger1 = time < 6
pos = ceil(fvar(24) * root,const(size.xscale)), ceil(fvar(25))
facing = 1
ignorehitpause = 1

[State 3305, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 3306
ignorehitpause = 1
[State 3305, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 3305, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 3305, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 3305, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 3300
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 3305, sprpriorityvar]
type = varset
trigger1 = !time
var(0) = ifelse(random < 667, 3, -1)
ignorehitpause = 1
[State 3305, sprpriority]
type = sprpriority
trigger1 = 1
value = var(0)

[State 3305, Vel]
type = velset
trigger1 = time < 6
x = 0
y = 0

[State 3305, Vel]
type = velset
trigger1 = time = 6
x = 15
y = ifelse(root, command = "holdup", -2, ifelse(root, command = "holddown", 2, 0))

[State 3305, Jet]
type = explod
trigger1 = time >= 6 && !numexplod(3306)
anim = 3306
ID = 3306
sprpriority = (var(0) + 1)
postype = p1
pos = -12, 0
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 3305, Shot]
type = explod
trigger1 = time = 5
anim = 3307
ID = 3307
sprpriority = (var(0) + 1)
postype = p1
pos = -15, 0
scale = 0.5, 0.5
ownpal = 1

[State 3305, Trail]
type = explod
trigger1 = time >= 7; && !(time % 2)
anim = 3308 + (vel y >= 2) + (vel y >= 4) + (vel y <= -2) + (vel y <= -4)
ID = 3308
sprpriority = (var(0) + 1)
postype = p1
pos = -15, 0
vfacing = ifelse(vel y <= 0, 1, -1)
scale = 0.75, 0.75
ownpal = 1

[State 3305, HitSound]
type = parentvarset
trigger1 = movecontact = 1
trigger1 = (parent, ID) = (root, ID)
var(52) = ifelse((movehit && numtarget), 2, 1)
persistent = 0
ignorehitpause = 1

[State 3305, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 3305, Hit]
type = hitdef
trigger1 = (root, var(15) < 30 || root, var(20))
trigger1 = !movecontact && !movereversed
trigger1 = time >= 8
priority = 4, Hit
attr = S, HP
damage = ceil(15 * (root, fvar(11))), 2
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
pausetime = 0, 12
guard.pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -6
down.velocity = -3 * !numhelper(775), -3
guard.velocity = -12.97 * !numhelper(775)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
sprpriority = var(0)
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 3305, Hit Low]
type = hitdef
trigger1 = (root, var(15) < 30 || root, var(20))
trigger1 = !movecontact && !movereversed
trigger1 = time >= 8 && random < 500
priority = 4, Hit
attr = S, HP
damage = ceil(15 * (root, fvar(11))), 2
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Diagup
hitflag = MAF
guardflag = MA
pausetime = 0, 12
guard.pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -12.97 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.velocity = -4 * !numhelper(775), -6
down.velocity = -3 * !numhelper(775), -3
guard.velocity = -12.97 * !numhelper(775)
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
sprpriority = var(0)
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
p2facing = ifelse((p2stateno != [5020, 5119]) && (root, var(20) <= 0), 1, 0)
forcestand = 1

[State 3305, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8024)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3305, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 0, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 3305, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 3305, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget = 1 && numenemy
trigger1 = target, time <= 0
trigger1 = target, ID = enemynear, ID
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State 3305, End]
type = changestate
trigger1 = frontedgedist < -80 || backedgedist < -120 || time > 120
trigger2 = time < 6
trigger2 = root, movetype = H
value = 3306
ignorehitpause = 1


;--- Disappear ---
[Statedef 3306]
type = A
physics = N
movetype = I
anim = 3305
ctrl = 0
sprpriority = 4

[State 3306, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA
ignorehitpause = 1

[State 3306, removejet]
type = removeexplod
trigger1 = numexplod(3306)
ID = 3306
ignorehitpause = 1

[State 3305, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17 * time), ceil(17 * time)
[State 3306, End]
type = changestate
trigger1 = time >= 15
value = 3307


;--- Wait ---
[Statedef 3307]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 3307, End]
type = destroyself
trigger1 = !numtarget
trigger2 = numtarget
trigger2 = target, time <= 1 && !(target, hitshakeover)


;===================<DARKNESS ILLUSION DOUBLE>===================
[Statedef 4015]
type = A
physics = N
movetype = A
anim = 4010
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4015, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4015, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4015
ignorehitpause = 1

[State 4015, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 4015, Assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 4015, Fade In]
type = trans
trigger1 = anim = 4010 && animelemtime(7) < 0
trans = addalpha
alpha = ceil(5.7 * animelemtime(1)), ceil(256 -5.7 * animelemtime(1))

[State 4015, Anim]
type = changeanim
triggerall = (root, stateno = 4010) && (root, anim = [4010, 4011])
trigger1 = anim != (root, anim)
trigger2 = animelemno(0) != (root, animelemno(0))
value = root, anim
elem = root, animelemno(0)

[State 4015, Bind]
type = bindtoroot
trigger1 = 1
pos = 2 * (root, p2dist x), 0
facing = -1
time = 1

[State 4015, Pos]
type = posset
trigger1 = 1
y = root, pos y

[State 4015, Bind]
type = bindtoroot
trigger1 = !(root, numtarget)
pos = ceil(160 * const(size.xscale)), 0
facing = -1
time = 1

[State 4015, Lv3 Super Afterimage]
type = afterimage
trigger1 = time = 30
time = 300
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

[State 4015, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 4015, hithighgr]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 8 || animelem = 14 || animelem = 19 || animelem = 36 || animelem = 37
attr = S, HA
damage = 0, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, ifelse((animelem = 8 || animelem = 14), -83, ifelse((animelem = 19), -62, ifelse((animelem = 36), -78, -58)))
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -1.5
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
forcestand = 1

[State 4015, hitlowgr]
type = hitdef
trigger1 = anim = 4010
trigger1 = animelem = 11 || animelem = 28 || animelem = 38 || animelem = 39
attr = S, HA
damage = 0, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, ifelse((animelem = 11), -29, ifelse((animelem = 28), -54, ifelse((animelem = 38), -30, -72)))
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, ifelse((animelem = 39), -3, -1.5)
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
forcestand = 1

[State 4015, hitupgr]
type = hitdef
trigger1 = anim = 4010 && animelem = 42
attr = S, HA
damage = 0, 0
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, -58
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -12
air.type = Low
air.velocity = 0, -12
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
guard.velocity = 0
fall = 1
fall.recover = 0
forcestand = 1

[State 4015, Hit Midair]
type = hitdef
trigger1 = anim = 4011
trigger1 = animelem = 4 || animelem = 9 || animelem = 15 || animelem = 20 || animelem = 25
attr = A, HA
damage = 0, 0
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, ifelse((animelem = 4), -42, ifelse((animelem = 9), -40, ifelse((animelem = 15), -45, ifelse((animelem = 20), -50, -54))))
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, -5
air.type = Low
air.velocity = 0, ifelse((animelem = 25), -4, -1.5)
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
guard.velocity = 0
fall = 1
fall.recover = 0
forcestand = 1

[State 4015, Hit Final]
type = hitdef
trigger1 = anim = 4011 && animelem = 32
attr = A, HA
damage = 0, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 2, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10, ifelse((animelem = 4), -42, ifelse((animelem = 9), -40, ifelse((animelem = 15), -45, ifelse((animelem = 20), -50, -54))))
hitsound = -1
guardsound = -1
ground.type = Trip
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 4
air.type = Trip
air.velocity = 0, 9
getpower = 0
givepower = 0
envshake.time = 12
envshake.ampl = 2
envshake.freq = 180
guard.velocity = 0
fall = 1
fall.recover = 0
forcestand = 1

[State 4015, FX]
type = explod
trigger1 = anim = 4010 && animelem = 46
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = 0.75, 0.75
removeongethit = 1
ownpal = 1

[State 4015, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8013)
ID = 8000
name = "Spark"
postype = p1
pos = ceil(p2dist x), - 30
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4015, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = ceil(p2dist x), - 30
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4015, FX]
type = explod
trigger1 = anim = 4011 && animelem = 31
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = -0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4015, End]
type = destroyself
trigger1 = !ishelper(4015) || root, stateno != 4010

[State 4015, End]
type = changestate
trigger1 = anim = 4011 && animelemtime(36) >= 0
value = 4016


;--- Fade out ---
[Statedef 4016]
type = A
physics = N
sprpriority = 1

[State 4016, Bind]
type = bindtoroot
trigger1 = 1
pos = 2 * (root, p2dist x), 0
facing = -1
time = 1

[State 4016, Pos]
type = posset
trigger1 = 1
y = root, pos y

[State 4016, Fade]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -12.8 * time), ceil(12.8 * time)

[State 4016, Bats]
type = helper
trigger1 = time && !(time % 6)
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
pos = 0, -55

[State 4016, Accel]
type = veladd
trigger1 = 1
y = 0.5

[State 4016, End]
type = destroyself
trigger1 = time >= 20 || pos y >= 0


;===================<AIR DARKNESS ILLUSION DOUBLE>===================
[Statedef 4065]
type = A
physics = N
movetype = A
anim = 4060
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4065, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4065, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4065
ignorehitpause = 1

[State 4065, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 4065, Assert]
type = assertspecial
trigger1 = !time
flag = invisible

[State 4065, Fade In]
type = trans
trigger1 = time < 32
trans = addalpha
alpha = (8 * time), 256 - (8 * time)

[State 4065, Anim]
type = changeanim
triggerall = (root, stateno = 4060) && (root, anim = 4060)
trigger1 = anim != (root, anim)
trigger2 = animelemno(0) != (root, animelemno(0))
value = 4060
elem = root, animelemno(0)

[State 4065, Bind]
type = bindtoroot
trigger1 = 1
pos = 2 * (root, p2dist x), 0
facing = -1
time = 1

[State 4065, Bind]
type = bindtoroot
trigger1 = !(root, numtarget)
pos = ceil(128 * const(size.xscale)), 0
facing = -1
time = 1

[State 4065, Lv3 Super Afterimage]
type = afterimage
trigger1 = time = 30
time = 300
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

[State 4065, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 4065, FX]
type = explod
trigger1 = anim = 4060 && animelem = 29
anim = 4095
sprpriority = 4
postype = p1
pos = -10, -60
scale = -0.75, -0.75
bindtime = -1
removeongethit = 1
ownpal = 1

[State 4065, Hit High]
type = hitdef
trigger1 = animelem = 7 || animelem = 13 || animelem = 20 || animelem = 22
ID = 4050
attr = S, HA
damage = 0, 0
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 8 || animelem = 14), 2, ifelse((animelem = 19), 3, 6)))
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
envshake.ampl = 2
envshake.freq = 180
forcestand = 1
fall = 1
fall.recover = 0
yaccel = 0.4850

[State 4065, Hit Low]
type = hitdef
trigger1 = animelem = 3 || animelem = 10 || animelem = 17 || animelem = 21 || animelem = 23
ID = 4050
attr = S, HA
damage = 0, 0
animtype = Hard
fall.animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8014)
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -60
hitsound = -1 + 0 * (var(31) := ifelse((animelem = 11), 5, 6))
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
envshake.ampl = 2
envshake.freq = 180
forcestand = 1
fall = 1
fall.recover = 0
yaccel = 0.4850

[State 4065, Hit Final]
type = hitdef
trigger1 = animelem = 30
attr = A, HA
damage = 0, 0
animtype = Hard
fall.animtype = Hard
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
envshake.ampl = 8
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1
fall.xvelocity = 0
fall.yvelocity = -4

[State 4065, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8012)
ID = 8000
name = "Spark"
postype = p1
pos = ceil(p2dist x), - 30
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4065, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = ceil(p2dist x), - 30
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4065, End]
type = destroyself
trigger1 = !ishelper(4065) || root, stateno != 4060

[State 4065, End]
type = changestate
trigger1 = anim = 4060 && animelemtime(36) >= 0
value = 4016


;========================<ETERNAL SLUMBER>=============================
;--- PROJECTILE ---
[Statedef 4105]
type = S
physics = N
movetype = A
anim = 4105
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 4105, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 4106
ignorehitpause = 1
[State 4105, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, AA, AP;NP, SP, HP
ignorehitpause = 1

[State 4105, Strength]
type = varset
trigger1 = !time
var(10) = root, var(10)

[State 4105, Vel]
type = velset
trigger1 = 1
x = 3.33
y = 2 * sin(time / 8.0)
;y = 2.5 * cos(time / 10.0)

[State 4105, pulse]
type = angledraw
trigger1 = 1
scale = ((0.75 + 0.25 * cos(time / 5.0)) * const(size.xscale)), ((0.75 + 0.25 * cos(time / 5.0)) * const(size.yscale))

[State 4105, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 4105, sprpriority]
type = sprpriority
trigger1 = 1
value = 4

[State 4105, Particles]
type = explod
trigger1 = 1
vel = -1 + (random < 500), 0
accel = 0, 0.05
anim = 4109
sprpriority = 4
postype = p1
random = 20, 20
removetime = -2
scale = 0.5, 0.5
ignorehitpause = 1

[State 4105, HitSound]
type = playsnd
trigger1 = movecontact = 1
value = 2, ifelse((movehit && numtarget), 10, 0)
channel = 2
ignorehitpause = 1

[State 4105, Miss]
type = hitdef
trigger1 = 1
attr = S, HP
hitflag =
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0

[State 4105, Hit]
type = hitdef
trigger1 = root, var(15) < (2 + var(2))
priority = 1, Hit
attr = S, HP
damage = ceil(20 * (root, fvar(11))), 7
guard.dist = const(size.proj.attack.dist)
animtype = Hard
fall.animtype = Hard
hitflag = MAF
pausetime = 0, 12
sparkno = -1
guard.sparkno = -1 + 0 * (var(34) := 8001)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := 0
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = -10, 0
ground.cornerpush.veloff = 0
air.velocity = -4, -4
guard.velocity = -12.97
fall = 1
fall.recover = 0
getpower = 0
givepower = 0
sprpriority = 4
kill = 0
yaccel = 0.4850
forcestand = 1

[State 4105, Spark]
type = helper
trigger1 = root, fvar(31)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = ifelse(moveguarded, 8001, 8014)
ID = 8000
name = "Spark"
postype = p1
pos = 10, 0
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4105, Spark]
type = explod
trigger1 = !(root, fvar(31))
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
anim = Fifelse(moveguarded, 40, 3)
ID = 8000
postype = p1
pos = 10, 0
supermovetime = -1
pausemovetime = -1
ontop = 1
ownpal = 1

[State 4105, Counter FX]
type = helper
trigger1 = root, var(9)
trigger1 = movecontact = 1 && numtarget
trigger1 = (target, movetype = H) && !(target, time)
helpertype = normal
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
pos = 10, 0
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 4105, ProjContact]
type = varset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
var(18) = 1
ignorehitpause = 1
[State 4105, ProjContact]
type = parentvarset
trigger1 = movecontact = 1 && numenemy
trigger1 = (enemynear, movetype = H) && !(enemynear, time)
trigger1 = root, stateno = 4100
trigger1 = (parent, ID) = (root, ID)
var(18) = 1
ignorehitpause = 1

[State 4105, Bindstate]
type = changestate
trigger1 = movecontact && numtarget
trigger1 = !(target, ishelper)
trigger1 = (target, stateno = 5000) || (target, stateno = 5010) || (target, stateno = 5020)
value = 4107
ignorehitpause = 1

[State 4105, End]
type = changestate
trigger1 = movecontact || movereversed
trigger2 = frontedgedist < -40 || backedgedist < -40
trigger3 = root, stateno != 4100
value = 4106
ignorehitpause = 1


[Statedef 4106]
type = A
physics = N
movetype = I
velset = 0, 0
ctrl = 0
sprpriority = 4

[State 4106, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1

[State 4106, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 4106, Shrink]
type = angledraw
trigger1 = 1
scale = const(size.xscale) -time * (const(size.xscale) / 20), const(size.yscale) -time * (const(size.yscale) / 20)

[State 4106, Trans]
type = trans
trigger1 = 1
trans = add1

[State 4106, End]
type = destroyself
trigger1 = time >= 20
trigger2 = frontedgedist < -40 || backedgedist < -200


;--- BINDING ---
[Statedef 4107]
type = S
movetype = A
physics = N
anim = 9999
sprpriority = 4
velset = 0, 0
ctrl = 0

[State 4107, Throw]
type = targetstate
trigger1 = numtarget && time >= 1
value = 1114101
ignorehitpause = 1
persistent = 0
[State 4107, Throw]
type = targetfacing
trigger1 = numtarget && time >= 1
value = -1
ignorehitpause = 1
persistent = 0

[State 4107, Turn]
type = turn
trigger1 = (facing != root, facing)
[State 4107, Throw]
type = targetfacing
trigger1 = numtarget && time >= 1
value = -1
ignorehitpause = 1
persistent = 0

[State 4107, Var]
type = varset
trigger1 = numtarget
var(11) = target, const(size.head.pos.x)
[State 4107, Var]
type = varset
trigger1 = numtarget
var(12) = target, const(size.head.pos.y)

[State 4107, Bind 2]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(2) >= 0 && root, animelemtime(4) < 0
pos = ceil(40 * root, const(size.xscale)), 0
[State 4107, Bind 3]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(4) >= 0 && root, animelemtime(6) < 0
pos = ceil(6 * root, const(size.xscale)), -72
[State 4107, Bind 4]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(6) >= 0 && root, animelemtime(8) < 0
pos = ceil(45 * root, const(size.xscale)), -70
[State 4107, Bind 5]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(8) >= 0 && root, animelemtime(10) < 0
pos = ceil(40 * root, const(size.xscale)), 0
[State 4107, Bind 6]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(10) >= 0 && root, animelemtime(12) < 0
pos = ceil(11 * root, const(size.xscale)), -44
[State 4107, Bind 7]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(12) >= 0 && root, animelemtime(14) < 0
pos = 0, 0
[State 4107, Bind 8]
type = bindtoroot
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(14) >= 0 && root, animelemtime(16) < 0
pos = ceil(6 * root, const(size.xscale)), -104

[State 4107, pos 9]
type = posset
trigger1 = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(16) >= 0
x = 80 * facing
y = 0
[State 4107, Bindtarget]
type = targetbind
trigger1 = numtarget
trigger1 = target, anim = 1114101 && target, animelemtime(2) >= 0 && target, animelemtime(18) < 0
pos = 0, -1

[State 4107, Damage]
type = targetlifeadd
triggerall = numtarget && root, stateno = 4101 && root, anim = 4101
trigger1 = (root, animelem = 3) || (root, animelem = 5) || (root, animelem = 7) || (root, animelem = 9)
trigger2 = (root, animelem = 11) || (root, animelem = 13) || (root, animelem = 15) || (root, animelem = 17)
value = -ceil(60 * (root, fvar(11)))
kill = (root, animelem = 17)

[State 4107, givepower]
type = targetpoweradd
triggerall = numtarget && root, stateno = 4101 && root, anim = 4101
trigger1 = (root, animelem = 3) || (root, animelem = 5) || (root, animelem = 7) || (root, animelem = 9)
trigger2 = (root, animelem = 11) || (root, animelem = 13) || (root, animelem = 15) || (root, animelem = 17)
value = 40;givepower

[State 4107, Hit add]
type = hitadd
triggerall = numtarget && root, stateno = 4101 && root, anim = 4101
trigger1 = (root, animelem = 3) || (root, animelem = 5) || (root, animelem = 7) || (root, animelem = 9)
trigger2 = (root, animelem = 11) || (root, animelem = 13) || (root, animelem = 15) || (root, animelem = 17)
value = 1

[State 4107, End]
type = targetstate
trigger1 = numtarget
trigger1 = target, anim = 1114101 && target, animelemtime(19) >= 60
trigger2 = (root, stateno != [4100, 4102])
value = 1114102

[State 4107, End]
type = destroyself
trigger1 = !numtarget


;--- TARGET ---
[Statedef 1114101]
type = S
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 1114101, ishelper]
type = selfstate
trigger1 = ishelper
value = prevstateno

[State 1114101, Anim]
type = changeanim2
trigger1 = !time
value = 1114101

[State 1114101, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 1114101, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 1114101, spr]
type = sprpriority
trigger1 = animelemtime(2) >= 0 && animelemtime(18) < 0
value = 5

[State 1114101, spr]
type = sprpriority
trigger1 = animelemtime(18) >= 0
value = 0

[State 1114101, Palfx]
type = palfx
trigger1 = animelemtime(2) >= 0 && animelemtime(18) < 0
time = 2
add = 9000, 9000, 9000
mul = 256, 0, 256

[State 1114101, Safety]
type = selfstate
trigger1 = time >= 300
value = 5040


[Statedef 1114102]
type = L
movetype = H
physics = C
velset = 0, 0
sprpriority = 0

[State 1114102, Pos]
type = posset
trigger1 = 1
y = 0

[State 1114102, End]
type = selfstate
trigger1 = 1
value = ifelse(alive, 5120, 5150)


;========================<CURTAIN>=============================
[Statedef 4110]
physics = N
anim = 4110
sprpriority = 5

[State 4110, posvar]
type = angledraw
trigger1 = 1
scale = gamewidth / 320.0, gamewidth / 320.0

[State 4110, posvar]
type = varset
trigger1 = !time
fvar(0) = -160

[State 4110, posvar]
type = varset
trigger1 = anim = 4110 && animelemtime(2) >= 0
trigger1 = anim = 4111 && animelemtime(2) < 0
fvar(0) = 0

[State 4110, posvar]
type = varadd
trigger1 = anim = 4110 && animelemtime(2) < 0
fvar(0) = 5.33

[State 4110, posvar]
type = varadd
trigger1 = anim = 4111 && animelemtime(2) >= 0
fvar(0) = -5.33

[State 4110, Bind]
type = posset
trigger1 = 1
x = fvar(0) * facing
y = ceil(pos y - screenpos y)

[State 4110, Anim]
type = changeanim
trigger1 = anim = 4110 && animelemtime(3) > 4 && (root, stateno != 4101)
value = 4111

[State 4110, Palfx]
type = bgpalfx
trigger1 = anim = 4110 && animelemtime(1) < 30
time = 2
mul = 256 -ceil(animelemtime(1) * 8.53), 256 -ceil(animelemtime(1) * 8.53), 256 -ceil(animelemtime(1) * 8.53)

[State 4110, Palfx]
type = bgpalfx
trigger1 = anim = 4111 && animelemtime(1) < 30
time = 2
mul = ceil(animelemtime(1) * 8.53), ceil(animelemtime(1) * 8.53), ceil(animelemtime(1) * 8.53)

[State 4110, Snd]
type = playsnd
trigger1 = anim = 4110
value = 5, 7
channel = 3
persistent = 0
[State 4110, Snd]
type = playsnd
trigger1 = anim = 4111
value = 5, 7
channel = 3
persistent = 0

[State 4110, Palfx]
type = bgpalfx
trigger1 = anim = 4110 && animelemtime(1) >= 30
time = 2
mul = 0, 0, 0

[State 4110, Palfx]
type = bgpalfx
triggerall = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(3) = [-1, 3]
trigger2 = root, animelemtime(5) = [-1, 3]
trigger3 = root, animelemtime(7) = [-1, 3]
trigger4 = root, animelemtime(9) = [-1, 3]
trigger5 = root, animelemtime(11) = [-1, 3]
trigger6 = root, animelemtime(13) = [-1, 3]
trigger7 = root, animelemtime(15) = [-1, 3]
trigger8 = root, animelemtime(17) = [-1, 3]
time = 1
add = 255, 255, 255

[State 4110, Palfx]
type = palfx
triggerall = root, stateno = 4101 && root, anim = 4101
trigger1 = root, animelemtime(3) = [-1, 3]
trigger2 = root, animelemtime(5) = [-1, 3]
trigger3 = root, animelemtime(7) = [-1, 3]
trigger4 = root, animelemtime(9) = [-1, 3]
trigger5 = root, animelemtime(11) = [-1, 3]
trigger6 = root, animelemtime(13) = [-1, 3]
trigger7 = root, animelemtime(15) = [-1, 3]
trigger8 = root, animelemtime(17) = [-1, 3]
time = 1
add = 255, 255, 255

[State 4110, Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 4110, End]
type = destroyself
trigger1 = anim = 4111 && (backedgedist < -25 || frontedgedist < -25)


;========================<THROW CLAW>=============================
[Statedef 825]
physics = N
velset = 0, 0
anim = 825
sprpriority = 2

[State 825, Bind]
type = bindtoroot
trigger1 = root, stateno = 820 && root, anim = 820 && root, animelemtime(9) < 0
pos = ceil(105 * root, const(size.xscale)), -65
[State 825, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 0, 0

[State 825, Pos]
type = posset
trigger1 = 1
y = -65
[State 825, Vel]
type = velset
trigger1 = 1
x = 12

[State 825, jet]
type = explod
trigger1 = !time
anim = 3306
ID = 3306
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 825, jet]
type = removeexplod
trigger1 = !(root, numtarget)
trigger2 = ifelse((root, stateno = 820 && root, anim = 820), root, animelemtime(9) >= 0, 1)
trigger2 = frontedgedist <= 0
ID = 3306
[State 825, End]
type = changestate
trigger1 = !(root, numtarget)
trigger2 = ifelse((root, stateno = 820 && root, anim = 820), root, animelemtime(9) >= 0, 1)
trigger2 = frontedgedist <= 0
value = 6110


;========================<SOUL PHOENIX DOME>=============================
[Statedef 3003]
physics = N
velset = 0, 0
anim = 9999

[State 3003, Fade]
type = palfx
trigger1 = !time
time = 20
sinadd = -255, -255, -255, 80

[State 3003, FX]
type = explod
trigger1 = !time
anim = 3003
ID = 3003
sprpriority = 3
postype = p1
facing = 1
removetime = 15
pausemovetime = -1
supermovetime = -1

[State 3003, FX]
type = explod
trigger1 = !time
anim = 3003
ID = 3003
sprpriority = 3
postype = p1
facing = -1
removetime = 15
pausemovetime = -1
supermovetime = -1

[State 3003, Shrink]
type = modifyexplod
trigger1 = 1
ID = 3003
scale = 0.4 + (0.013 * time), 0.4 + (0.013 * time)

[State 3003, End]
type = removeexplod
trigger1 = time >= 15

[State 3003, End]
type = destroyself
trigger1 = time >= 15


;========================<FINISHING SHOWER DUST>=============================
[Statedef 3303]
physics = N
anim = 6010
sprpriority = 2

[State 3303, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3303, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 3303, Bind]
type = posset
trigger1 = 1
x = ceil(root, pos x)
y = 0

[State 3303, End]
type = destroyself
trigger1 = root, stateno != 3300 || root, anim != 3300


;========================<DRILL>=============================
[Statedef 3405]
physics = N
velset = 0, 0
anim = 3405
sprpriority = 3

[State 3405, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 3405, Pos]
type = bindtoroot
trigger1 = 1
pos = ceil(76 * root, const(size.xscale)), -43

[State 3405, Turn]
type = turn
trigger1 = facing != root, facing

[State 3405, Snd]
type = playsnd
trigger1 = !time
value = 5, 12
channel = 0

[State 3405, Shadows]
type = afterimage
trigger1 = 0;!time
time = 999
timegap = 1
framegap = 1
length = 12
palcontrast = 128, 128, 256
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add

[State 3405, Snd]
type = stopsnd
trigger1 = (root, stateno != 3401) || (root, anim != 3402)
trigger2 = (root, anim = 3402) && (root, animelemtime(3) < 0)
channel = 0

[State 3405, End]
type = destroyself
trigger1 = (root, stateno != 3401) || (root, anim != 3402)
trigger2 = (root, anim = 3402) && (root, animelemtime(3) < 0)


;========================<HOLE>=============================
[Statedef 6005]
physics = N
velset = 0, 0
anim = 6005
sprpriority = -5

[State 6005, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 6005, Fade]
type = trans
trigger1 = root, animelemtime(13) >= 0
trans = addalpha
alpha = ceil(256 -10.2 * root, animelemtime(13)), ceil(10.2 * root, animelemtime(13))

[State 6005, End]
type = destroyself
trigger1 = root, stateno != 191
trigger2 = root, stateno = 191 && root, animelemtime(13) >= 25


;========================<WALK DUST>=============================
[Statedef 6010]
physics = N
velset = 0, 0
anim = 6010
sprpriority = 2

[State 6010, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6010, Pos]
type = bindtoroot
trigger1 = 1

[State 6010, Turn]
type = turn
trigger1 = facing != root, facing

[State 6010, Anim]
type = changeanim
trigger1 = anim != 6010 && root, anim = 20
value = 6010

[State 6010, Anim]
type = changeanim
trigger1 = anim != 6011 && root, anim = 21
value = 6011

[State 6010, End]
type = destroyself
trigger1 = root, stateno != 20


;========================<JETS>=============================
[Statedef 6020]
physics = N
velset = 0, 0
anim = 6020
sprpriority = 2

[State 6020, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6020, Pos]
type = bindtoroot
trigger1 = 1

[State 6020, Turn]
type = turn
trigger1 = facing != root, facing

[State 6020, Snd]
type = playsnd
trigger1 = !time
value = 0, 110
channel = 0
[State 6020, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State 6020, Anim]
type = changeanim
trigger1 = anim != 6020 && root, anim = 100
value = 6020
[State 6020, Anim]
type = changeanim
trigger1 = anim != 6021 && root, anim = 105
value = 6021
[State 6020, Anim]
type = changeanim
trigger1 = anim != 6022
trigger1 = root, anim = 110 || root, anim = 4010
value = 6022
[State 6020, Anim]
type = changeanim
trigger1 = anim != 6023 && root, anim = 115
value = 6023
[State 6020, Anim]
type = changeanim
trigger1 = anim != 6025 && (root, anim = 3400 || root, anim = 4000 || root, anim = 4050)
value = 6025

[State 6020, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 12
palcontrast = 128, 256, 128
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add

[State 6020, Snd]
type = stopsnd
trigger1 = (root, stateno != [100, 105]) && (root, stateno != [3400, 3401]) && (root, stateno != [4000, 4010]) && (root, stateno != [4050, 4051])
trigger2 = root, anim != 100 && root, anim != 105 && root, anim != 110 && root, anim != 115 && root, anim != 3400 && (root, anim != [4000, 4010]) && (root, anim != [4050, 4051])
trigger3 = root, anim = 4010 && root, animelemtime(56) < 0
channel = 0

[State 6020, End]
type = destroyself
trigger1 = (root, stateno != [100, 105]) && (root, stateno != [3400, 3401]) && (root, stateno != [4000, 4010]) && (root, stateno != [4050, 4051])
trigger2 = root, anim != 100 && root, anim != 105 && root, anim != 110 && root, anim != 115 && root, anim != 3400 && (root, anim != [4000, 4010]) && (root, anim != [4050, 4051])
trigger3 = root, anim = 4010 && root, animelemtime(56) < 0


;--- VECTOR DRAIN ---
[Statedef 6026]
physics = N
velset = 0, 0
anim = 6026
sprpriority = 2

[State 6026, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6026, Pos]
type = bindtoroot
trigger1 = 1

[State 6026, Snd]
type = playsnd
trigger1 = !time
value = 0, 110
channel = 0
[State 6026, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
[State 6026, Anim]
type = changeanim
trigger1 = anim != 6026 && root, anim = 1302
value = 6026
[State 6026, Anim]
type = changeanim
trigger1 = anim != 6027 && root, anim = 1303
value = 6027
[State 6026, Shadows]
type = afterimage
trigger1 = !time
time = 999
timegap = 1
framegap = 1
length = 12
palcontrast = 128, 256, 128
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add
[State 6026, Snd]
type = stopsnd
trigger1 = (root, stateno != 1301 && root, stateno != 1321) || (root, anim != [1302, 1303])
channel = 0
[State 6026, End]
type = destroyself
trigger1 = (root, stateno != 1301 && root, stateno != 1321) || (root, anim != [1302, 1303])


;--- VALKYRIE TURN ---
[Statedef 6028]
physics = N
velset = 0, 0
anim = 6028
sprpriority = 2

[State 6028, Pos]
type = bindtoroot
trigger1 = !time
trigger2 = root, stateno = 3400
pos = ceil(-40 * root, const(size.xscale)), -70

[State 6028, Anim]
type = changeanim
trigger1 = root, stateno = 3400
value = 6028
elem = 1

[State 6028, Snd]
type = playsnd
trigger1 = !time
value = 5, 14
channel = 0

[State 6028, sndpos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0

[State 6028, Scale]
type = angledraw
trigger1 = 1
scale = (backedgedist + 160) / 32.0, 1

[State 6028, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 6028, End]
type = destroyself
trigger1 = !animtime


;========================<BATS>=============================
;--- WALK ---
[Statedef 6100]
physics = N
anim = 6100
velset = 0, 0
ctrl = 0

[State 6100, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6100, Vel];to trigger sprpriority only
type = velset
trigger1 = 1
x = ifelse((sin(time / 5.0) < 0), -0.001, 0.001)

[State 6100, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ceil((-5 + 25 * cos(time / 5.0)) * root,const(size.xscale)), -50 + 35 * cos(time / 17.5)

[State 6100, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = ceil((-5 - 25 * cos(time / 5.0)) * root,const(size.xscale)), -50 -35 * cos(time / 17.5)

[State 6100, spr]
type = sprpriority
trigger1 = var(0) = 1
value = ifelse(vel x >= 0, 2, -1)

[State 6100, spr]
type = sprpriority
trigger1 = var(0) = 2
value = ifelse(vel x <= 0, 2, -2)

[State 6100, End]
type = destroyself
trigger1 = root, stateno != 20 || root, movetype = H


;--- LOSE by TIME ---
[Statedef 6104]
physics = N
anim = 6100
sprpriority = 2
ctrl = 0

[State 6104, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6104, Vel]
type = velset
trigger1 = 1
x = ifelse(var(0) = 1, -0.25, 0.25)
y = -0.5

[State 6104, End]
type = destroyself
trigger1 = root, stateno != 170


;--- LIE DOWN ---
[Statedef 6105]
physics = N
anim = 6101
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 6105, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6105, Turn]
type = turn
triggerall = var(0) = 2
triggerall = facing != root, facing
trigger1 = root, stateno = [5110, 5120]

[State 6105, Turn]
type = turn
triggerall = root, stateno = 5230 && root, animelemtime(2) < 0
trigger1 = root, vel x < 0
trigger1 = facing = root, facing
trigger2 = root, vel x > 0
trigger2 = facing != root, facing

[State 6105, Wake Up Binding]
type = null
triggerall = root, stateno = 5120
trigger1 = var(0) = 1
trigger1 = (fvar(1) := (fvar(1) - 1.47)) + (fvar(2) := (fvar(2) - 1.16))
trigger2 = var(0) = 2
trigger2 = (fvar(1) := (fvar(1) + 5)) + (fvar(2) := (fvar(2) - 6.33))
trigger3 = var(0) = 3
trigger3 = (fvar(1) := (fvar(1) + 0.4)) + (fvar(2) := (fvar(2) - 0.5))
trigger4 = var(0) = 4
trigger4 = (fvar(1) := (fvar(1) - 0.6)) + (fvar(2) := (fvar(2) - 0.73))

[State 6105, Retreat Binding]
type = null
triggerall = root, stateno = 5230
trigger1 = var(0) = 1
trigger1 = (fvar(1) := (fvar(1) + 1.0)) + (fvar(2) := (fvar(2) - 1.5))
trigger2 = var(0) = 2
trigger2 = (fvar(1) := (fvar(1) + 0.5)) + (fvar(2) := (fvar(2) - 5.5))
trigger3 = var(0) = 3
trigger3 = (fvar(1) := (fvar(1) - 1.0)) + (fvar(2) := (fvar(2) - 2.2))
trigger4 = var(0) = 4
trigger4 = (fvar(1) := (fvar(1) - 2.5)) + (fvar(2) := (fvar(2) - 2.0))

[State 6105, Var X]
type = varset
trigger1 = root, stateno != 5120 && root, stateno != 5230
trigger2 = root, stateno = 5230 && root, animelemtime(2) < 0
fvar(1) = 0
[State 6105, Var Y]
type = varset
trigger1 = root, stateno != 5120 && root, stateno != 5230
trigger2 = root, stateno = 5230 && root, animelemtime(2) < 0
fvar(2) = 0

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ceil((2 + fvar(1)) * root,const(size.xscale)), -16 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = ceil(-64 + fvar(1) * root,const(size.xscale)), -18 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 3
pos = ceil(-24 + fvar(1) * root,const(size.xscale)), -36 + fvar(2)

[State 6105, Bind]
type = bindtoroot
trigger1 = var(0) = 4
pos = ceil(-7 + fvar(1) * root,const(size.xscale)), -43 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 1
pos = ceil((-48 + fvar(1)) * root,const(size.xscale)), -2 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 2
pos = ceil((-20 + fvar(1)) * root,const(size.xscale)), -14 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 3
pos = ceil((-14 + fvar(1)) * root,const(size.xscale)), -2 + fvar(2)

[State 6105, Retreat Binding]
type = bindtoroot
trigger1 = root, stateno = 5230
trigger1 = var(0) = 4
pos = ceil((16 + fvar(1)) * root,const(size.xscale)), -14 + fvar(2)

[State 6105, Hide]
type = assertspecial
triggerall = var(0) = 2
trigger1 = root, stateno = 5120 && root, animelemtime(5) >= 0
trigger2 = root, stateno = 5230 && root, animelemtime(6) >= 0
flag = invisible

[State 6105, End]
type = destroyself
trigger1 = root, stateno != 5110 && root, stateno != 5115 && root, stateno != 5150
trigger1 = root, stateno != 5120 && root, stateno != 5230


;--- INTRO 1 ---
[Statedef 6106]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 2
ctrl = 0

[State 6106, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6100, varx]
type = varset
trigger1 = root, animelemtime(13) < 0
fvar(1) = 0
[State 6100, vary]
type = varset
trigger1 = root, animelemtime(13) < 0
fvar(2) = 0

[State 6106, varx]
type = varadd
trigger1 = var(0) = 1 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.16
[State 6106, vary]
type = varadd
trigger1 = var(0) = 1 && (root, animelemtime(13) = [0, 25])
fvar(2) = -2.04

[State 6106, varx]
type = varadd
trigger1 = var(0) = 2 && (root, animelemtime(13) = [0, 25])
fvar(1) = -1.08
[State 6106, vary]
type = varadd
trigger1 = var(0) = 2 && (root, animelemtime(13) = [0, 25])
fvar(2) = -1.4

[State 6106, varx]
type = varadd
trigger1 = var(0) = 3 && (root, animelemtime(13) = [0, 25])
fvar(1) = -1.32
[State 6106, vary]
type = varadd
trigger1 = var(0) = 3 && (root, animelemtime(13) = [0, 25])
fvar(2) = -3.7

[State 6106, varx]
type = varadd
trigger1 = var(0) = 4 && (root, animelemtime(13) = [0, 25])
fvar(1) = 0.84
[State 6106, vary]
type = varadd
trigger1 = var(0) = 4 && (root, animelemtime(13) = [0, 25])
fvar(2) = -1.72

[State 6106, varx]
type = varadd
trigger1 = var(0) = 5 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.04
[State 6106, vary]
type = varadd
trigger1 = var(0) = 5 && (root, animelemtime(13) = [0, 25])
fvar(2) = -0.8

[State 6106, varx]
type = varadd
trigger1 = var(0) = 6 && (root, animelemtime(13) = [0, 25])
fvar(1) = -0.56
[State 6106, vary]
type = varadd
trigger1 = var(0) = 6 && (root, animelemtime(13) = [0, 25])
fvar(2) = -3.4

[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ceil((-23 + fvar(1)) * root, const(size.xscale)), 1 + fvar(2)
[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = ceil((0 + fvar(1)) * root, const(size.xscale)), 4 + fvar(2)
[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 3
pos = ceil((23 + fvar(1)) * root, const(size.xscale)), 1 + fvar(2)
[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 4
pos = ceil((-19 + fvar(1)) * root, const(size.xscale)), -7 + fvar(2)
[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 5
pos = ceil((0 + fvar(1)) * root, const(size.xscale)), -10 + fvar(2)
[State 6106, Bind]
type = bindtoroot
trigger1 = var(0) = 6
pos = ceil((19 + fvar(1)) * root, const(size.xscale)), -7 + fvar(2)

[State 6106, spr]
type = sprpriority
trigger1 = 1
value = ifelse(var(0) >= 4, -1, 1)
pos = 2 + fvar(1), -16 + fvar(2)

[State 6106, End]
type = destroyself
trigger1 = root, stateno != 191 || root, movetype = H
trigger2 = root, stateno = 191 && root, animelemtime(14) >= 0


;--- WIN 1 ---
[Statedef 6107]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 6107, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6107, Vel]
type = velset
trigger1 = !time && (var(0) % 2) = 1
x = ifelse(var(0) = 1, -0.75, ifelse(var(0) = 3, -1.25, ifelse(var(0) = 5, -1.25, -0.5)))
y = ifelse(var(0) = 1, -0.75, ifelse(var(0) = 3, -1, ifelse(var(0) = 5, -1.25, -1.5)))
[State 6107, Vel]
type = velset
trigger1 = !time && !(var(0) % 2)
x = ifelse(var(0) = 2, -0.75, ifelse(var(0) = 4, -1.25, ifelse(var(0) = 6, -1.25, -0.5)))
y = ifelse(var(0) = 2, 0.75, ifelse(var(0) = 4, 1, ifelse(var(0) = 6, 1.25, 1.5)))

[State 6107, Accel]
type = veladd
trigger1 = root, animelemtime(2) < 0 && (var(0) % 2) = 1 && vel y < 1.5
y = 0.033
[State 6107, Accel]
type = veladd
trigger1 = root, animelemtime(2) < 0 && !(var(0) % 2) && vel y > -1.5
y = -0.033

[State 6107, Vel]
type = velset
trigger1 = root, animelemtime(2) >= 0
trigger1 = (var(0) = 1 || var(0) = 2 || var(0) = 5 || var(0) = 6)
x = cos(time / 20.0)
y = -cos((time + 10) / 20.0)
[State 6107, Vel]
type = velset
trigger1 = root, animelemtime(2) >= 0
trigger1 = (var(0) = 3 || var(0) = 4 || var(0) = 7 || var(0) = 8)
x = -cos(time / 20.0)
y = cos((time + 10) / 20.0)

[State 6107, Vel]
type = velmul
trigger1 = vel y > 0 && pos y > -10
y = 0.8
[State 6107, End]
type = destroyself
trigger1 = root, stateno != 181 || root, movetype = H


;--- POWER CHARGE ---
[Statedef 6108]
physics = N
anim = 6100
velset = 0, 0
ctrl = 0

[State 6108, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6108, Vel];to trigger sprpriority only
type = velset
trigger1 = 1
x = ifelse((sin(time / 5.0) < 0), -0.001, 0.001)

[State 6108, Bind]
type = bindtoroot
trigger1 = var(0) = 1
pos = ceil((-5 + 25 * cos(time / 5.0)) * root,const(size.xscale)), -50 + 35 * cos(time / 17.5)
[State 6108, Bind]
type = bindtoroot
trigger1 = var(0) = 2
pos = ceil((-5 -25 * cos(time / 5.0)) * root,const(size.xscale)), -50 -35 * cos(time / 17.5)
[State 6108, Bind]
type = bindtoroot
trigger1 = var(0) = 3
pos = ceil((-5 + 25 * cos(time / 5.0)) * root,const(size.xscale)), -50 -35 * cos(time / 17.5)
[State 6108, Bind]
type = bindtoroot
trigger1 = var(0) = 4
pos = ceil((-5 -25 * cos(time / 5.0)) * root,const(size.xscale)), -50 + 35 * cos(time / 17.5)

[State 6108, spr]
type = sprpriority
trigger1 = var(0) = 1 || var(0) = 3
value = ifelse(vel x >= 0, 2, -1)
[State 6108, spr]
type = sprpriority
trigger1 = var(0) = 2 || var(0) = 4
value = ifelse(vel x <= 0, 2, -2)
[State 6108, End]
type = destroyself
trigger1 = root, stateno != 740 || root, anim != 740 || root, movetype = H


;--- WIN COSTUME ---
[Statedef 6109]
physics = N
anim = 6100
velset = 0, 0
sprpriority = 0
ctrl = 0

[State 6109, ID]
type = varset
trigger1 = !time && (ishelper(6101) || ishelper(6102) || ishelper(6103) || ishelper(6104))
var(0) = ifelse(ishelper(6101), 1, ifelse(ishelper(6102), 2, ifelse(ishelper(6103), 3, 4)))

[State 6109, Vel]
type = velset
trigger1 = !time
x = ifelse(var(0) = 1, -0.33, ifelse(var(0) = 2, -0.66, ifelse(var(0) = 3, -1, -0.5)))
y = ifelse(var(0) = 1, -0.4, ifelse(var(0) = 2, -0.1, ifelse(var(0) = 3, 0.2, 0.5)))

[State 6109, Accel]
type = veladd
trigger1 = time < 60 && vel y > -1
y = -0.025
[State 6109, Vel]
type = velset
trigger1 = time >= 60 && (var(0) = 1 || var(0) = 3)
x = cos(time / 20.0)
y = -cos((time + 10) / 20.0)
[State 6109, Vel]
type = velset
trigger1 = time >= 60 && (var(0) = 2 || var(0) = 4)
x = -cos(time / 20.0)
y = cos((time + 10) / 20.0)

[State 6109, Vel]
type = velmul
trigger1 = vel y > 0 && pos y > -10
y = 0.8
[State 6109, End]
type = destroyself
trigger1 = root, stateno != 189 || root, movetype = H


;--- RETURN TO MORRIGAN ---
[Statedef 6110]
physics = N
anim = 6100
velset = -7.5 + (random / 66.7), -7.5 + (random / 66.7)
sprpriority = 1
ctrl = 0

[State 6110, Snd]
type = playsnd
trigger1 = time = 5
value = 6, (random < 500)

[State 6110, Vel]
type = velset
trigger1 = !time && prevstateno = 825
x = -1
y = -5
[State 6110, Vel]
type = velset
trigger1 = !time
trigger1 = playerIDexist(parent, ID)
trigger1 = (parent, stateno = [1005, 1055])
x = 3 + (random / 500.0)
y = -3 + (random / 167.0)
[State 6110, Vel]
type = velset
trigger1 = !time
trigger1 = playerIDexist(parent, ID)
trigger1 = (parent, stateno = [3005, 3007])
x = 5 + (random / 333.0)
y = -5 + (random / 100.0)

[State 6110, Accel]
type = veladd
trigger1 = time > 10 && vel x < ifelse(rootdist x < 25, 2.5, 5) && rootdist x >= 0
x = ifelse((rootdist y = [0, 160]), 0.5, 0.25)
[State 6110, Accel]
type = veladd
trigger1 = time > 10 && vel x > ifelse(rootdist x > -25, -2.5, -5) && rootdist x < 0
x = ifelse((rootdist y = [0, 160]), -0.5, -0.25)
[State 6110, Accel]
type = veladd
trigger1 = time > 10 && root, statetype != C && vel y < ifelse((rootdist y < 80 && rootdist y > 40), 2.5, 5) && rootdist y >= 65
trigger2 = time > 10 && root, statetype = C && vel y < ifelse((rootdist y < 50 && rootdist y > 0), 2.5, 5) && rootdist y >= 25
y = ifelse((rootdist x = [-80, 80]), 0.5, 0.25)
[State 6110, Accel]
type = veladd
trigger1 = time > 10 && root, statetype != C && vel y > ifelse((rootdist y < 80 && rootdist y > 40), -2.5, -5) && rootdist y < 65
trigger2 = time > 10 && root, statetype = C && vel y > ifelse((rootdist y < 50 && rootdist y > 0), -2.5, -5) && rootdist y < 25
y = ifelse((rootdist x = [-80, 80]), -0.5, -0.25)


[State 6110, Vel]
type = velset
trigger1 = vel y > 0 && pos y > -5
y = 0

[State 6110, Turn]
type = turn
trigger1 = vel x < 0

[State 6110, End]
type = destroyself
trigger1 = root, statetype != C && (rootdist x = [-10, 10]) && (rootdist y = [55, 75])
trigger2 = root, statetype = C && (rootdist x = [-10, 10]) && (rootdist y = [15, 35])


;--- VIUDA NEGRA ---
[Statedef 6111]
physics = N
anim = 6100
velset = 0, 0
ctrl = 0

[State 6111, ID]
type = varset
trigger1 = !time
var(0) = numhelper(6100)

[State 6111, Bind]
type = posset
trigger1 = var(0) = 1
x = (enemynear, pos x) -31 * facing
y = (enemynear, pos y) -85
[State 6111, Bind]
type = posset
trigger1 = var(0) = 2
x = (enemynear, pos x) -32 * facing
y = (enemynear, pos y) -40
[State 6111, Bind]
type = posset
trigger1 = var(0) = 3
x = (enemynear, pos x) -18 * facing
y = (enemynear, pos y) -42
[State 6111, Bind]
type = posset
trigger1 = var(0) = 4
x = (enemynear, pos x) -5 * facing
y = (enemynear, pos y) -43
[State 6111, Bind]
type = posset
trigger1 = var(0) = 5
x = (enemynear, pos x) + 1 * facing
y = (enemynear, pos y) -45

[State 6111, spr]
type = sprpriority
trigger1 = 1
value = ifelse(var(0) = 4, -1, 2)

[State 6111, End]
type = changestate
trigger1 = !numenemy || roundstate >= 2
trigger2 = numenemy
trigger2 = enemy, stateno = 1942 && enemy, anim != 1942
value = 6110


;========================<BLOOD>=============================
;--- Small ---
[Statedef 7050]
type = A
anim = 9999
velset = 0, 0

[State 7050, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -3 + (random / 166.7), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7050, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -3 + (random / 166.7), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7050, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -3 + (random / 166.7), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7050, End]
type = destroyself
trigger1 = 1


;--- Medium ---
[Statedef 7051]
type = A
anim = 9999
velset = 0, 0

[State 7051, Medium]
type = explod
trigger1 = !time
anim = 7051
ID = 7050
postype = p1
vel = -10 + (random / 50.0), -5 -(random / 200.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7051, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -4 + (random / 125.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7051, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -4 + (random / 125.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7051, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -4 + (random / 125.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7051, End]
type = destroyself
trigger1 = 1


;--- Large ---
[Statedef 7052]
type = A
anim = 9999
velset = 0, 0

[State 7052, Large]
type = explod
trigger1 = !time
anim = 7052
ID = 7050
postype = p1
vel = -(random / 333.3), -2.5 -(random / 400.0)
accel = 0, 0.25
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7052, Medium]
type = explod
trigger1 = !time
anim = 7051
ID = 7050
postype = p1
vel = -10 + (random / 50.0), -5 -(random / 200.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7052, Medium]
type = explod
trigger1 = !time
anim = 7051
ID = 7050
postype = p1
vel = -10 + (random / 50.0), -5 -(random / 200.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7052, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -5 + (random / 100.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7052, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -5 + (random / 100.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1
[State 7052, Small]
type = explod
trigger1 = !time
anim = 7050
ID = 7050
postype = p1
vel = -5 + (random / 100.0), -7.5 -(random / 400.0)
accel = 0, 0.5
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
trans = addalpha
alpha = 256, 128
sprpriority = 5
scale = 0.5, 0.5
ownpal = 1

[State 7052, End]
type = destroyself
trigger1 = 1


;========================<JUMP DUST>=============================
[Statedef 7100]
physics = N
velset = 0, 0
anim = 9999

[State 7100, Bind]
type = bindtoroot
trigger1 = time

[State 7100, Dust]
type = explod
trigger1 = !time
anim = 7100
ID = 7100
sprpriority = 3
postype = p1
pos = 0, ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, Dust]
type = explod
trigger1 = !time || time = 2 || time = 6
anim = 7101
ID = 7100
sprpriority = 3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1

[State 7100, Assert]
type = assertspecial
trigger1 = 1
flag = invisible

[State 7100, End]
type = destroyself
trigger1 = !numexplod
trigger2 = time >= 60


;--- Dash ---
[Statedef 7104]
type = A
anim = 9999
velset = 0, 0
sprpriority = 5

[State 7104, Pos]
type = posset
trigger1 = !time = 0
y = 0

[State 7104, Dust]
type = explod
trigger1 = time = 0 || time = 3 || time = 6
anim = 7104
ID = ifelse((time = 6), 3, ifelse((time = 3), 2, 1))
postype = p1
pos = 0, -4
random = 8, 8
vel = -3 -(random / 1000.0), -2 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
sprpriority = 3
pausemovetime = -1
supermovetime = -1

[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.025 * time), 0.1 + (0.025 * time)
trans = addalpha
alpha = 256 -(16 * time), 256
[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.1 + (0.025 * (time -3)), 0.1 + (0.025 * (time -3))
trans = addalpha
alpha = 256 -(16 * (time -3)), 256
[State 7104, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.1 + (0.025 * (time -6)), 0.1 + (0.025 * (time -6))
trans = addalpha
alpha = 256 -(16 * (time -6)), 256

[State 7104, End]
type = removeexplod
trigger1 = time >= 22
[State 7104, End]
type = destroyself
trigger1 = !numexplod


;========================<SPARKS>=============================
;--- Guard Normal ---
[Statedef 8000]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8000, Main]
type = explod
trigger1 = !time
anim = 8000
ID = 1
postype = p1
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.1 + (0.0375 * time), 0.1 + (0.0375 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 - 64 * (time - 4)), 256

[State 8000, End]
type = removeexplod
trigger1 = time >= 8
trigger2 = time >= 4
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8000, End]
type = destroyself
trigger1 = !numexplod


;--- Guard Special ---
[Statedef 8001]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8001, Main]
type = explod
trigger1 = !time
anim = 8001
ID = 1
postype = p1
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8001, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.2 + (0.025 * time), 0.2 + (0.025 * time)
trans = addalpha
alpha = ifelse(time < 4, 256, 256 - 64 * (time - 4)), 256

[State 8001, End]
type = removeexplod
trigger1 = time >= 8
trigger2 = time >= 4
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8001, End]
type = destroyself
trigger1 = !numexplod


;--- Weak ---
[Statedef 8010]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8010, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.3 - (time * 0.03), 0.3 - (time * 0.03)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8010, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.15 + (0.009375 * time), 0.15 + (0.009375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8010, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8010, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.3 -(0.0375 * time), 0.3 -(0.0375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8010, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8010, End]
type = destroyself
trigger1 = !numexplod


;--- Medium ---
[Statedef 8011]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8011, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.35 - (time * 0.035), 0.35 - (time * 0.035)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8011, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.175 + (0.0109375 * time), 0.175 + (0.0109375 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8011, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8011, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.35 -(0.04375 * time), 0.35 -(0.04375 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8011, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8011, End]
type = destroyself
trigger1 = !numexplod


;--- Strong ---
[Statedef 8012]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8012, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.4 - (time * 0.04), 0.4 - (time * 0.04)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8012, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.2 + (0.0125 * time), 0.2 + (0.0125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8012, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8012, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.4 -(0.05 * time), 0.4 -(0.05 * time)
trans = addalpha
alpha = 128 -(16 * time), 256

[State 8012, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8012, End]
type = destroyself
trigger1 = !numexplod


;--- Special ---
[Statedef 8013]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8013, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.45 - (time * 0.045), 0.45 - (time * 0.045)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8013, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8013, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8013, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8013, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8013, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.45 -(0.05625 * time), 0.45 -(0.05625 * time)
trans = addalpha
alpha = 192 -(24 * time), 256

[State 8013, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8013, End]
type = destroyself
trigger1 = !numexplod


;--- Super ---
[Statedef 8014]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 99

[State 8014, Main]
type = explod
trigger1 = !time
anim = 8010
ID = 0
postype = p1
ontop = 1
removetime = 10
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(0)
ID = 0
scale = 0.5 - (time * 0.05), 0.5 - (time * 0.05)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)

[State 8014, Center]
type = explod
trigger1 = !time
anim = 8011
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.25 + (0.015625 * time), 0.25 + (0.015625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8014, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8014, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.30 + (0.0375 * time), 0.30 + (0.0375 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, Impact]
type = explod
trigger1 = !time
anim = 8014
ID = 4
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 8
pausemovetime = -1
supermovetime = -1
[State 8014, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 0.5 -(0.0625 * time), 0.5 -(0.0625 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8014, End]
type = removeexplod
trigger1 = time >= 16
trigger2 = time >= 8
trigger2 = numhelper > (56 / (1 + numenemy + numpartner))

[State 8014, End]
type = destroyself
trigger1 = !numexplod


;--- Light Cut ---
[Statedef 8020]
type = A
anim = 8020
velset = 0, 0
sprpriority = 99
[State 8020, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8020, Angle]
type = angleset
trigger1 = !time
value = 15 * (random % 24)

[State 8020, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.16 + (time * 0.048), 0.32 - (time * 0.032)

[State 8020, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0

[State 8020, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8020, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8020, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.125 + (0.0078 * time), 0.125 + (0.0078 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8020, End]
type = removeexplod
trigger1 = time >= 16

[State 8020, End]
type = destroyself
trigger1 = time >= 16


;--- Medium Cut ---
[Statedef 8021]
type = A
anim = 8020
velset = 0, 0
sprpriority = 99
[State 8021, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8021, Angle]
type = angleset
trigger1 = !time
value = 15 * (random % 24)

[State 8021, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.19 + (time * 0.056), 0.37 - (time * 0.037)

[State 8021, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0

[State 8021, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8021, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8021, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.145 + (0.0091 * time), 0.145 + (0.0091 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8021, End]
type = removeexplod
trigger1 = time >= 16

[State 8021, End]
type = destroyself
trigger1 = time >= 16


;--- Hard Cut ---
[Statedef 8022]
type = A
anim = 8020
velset = 0, 0
sprpriority = 99
[State 8022, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8022, Angle]
type = angleset
trigger1 = !time
value = 15 * (random % 24)

[State 8022, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.22 + (time * 0.065), 0.43 - (time * 0.043)

[State 8022, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0

[State 8022, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8022, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8022, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.169 + (0.0106 * time), 0.169 + (0.0106 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8022, End]
type = removeexplod
trigger1 = time >= 16

[State 8022, End]
type = destroyself
trigger1 = time >= 16


;--- Special Cut ---
[Statedef 8023]
type = A
anim = 8020
velset = 0, 0
sprpriority = 99
[State 8023, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8023, Angle]
type = angleset
trigger1 = !time
value = 15 * (random % 24)

[State 8023, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.22 + (time * 0.065), 0.43 - (time * 0.043)

[State 8023, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0

[State 8023, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8023, Center]
type = explod
trigger1 = !time
anim = 8021
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8023, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.18 + (0.01125 * time), 0.18 + (0.01125 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8023, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8023, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.169 + (0.0106 * time), 0.169 + (0.0106 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8023, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8023, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8023, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.25 + (0.03125 * time), 0.25 + (0.03125 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8023, End]
type = removeexplod
trigger1 = time >= 16

[State 8023, End]
type = destroyself
trigger1 = time >= 16


;--- Super Cut ---
[Statedef 8024]
type = A
anim = 8020
velset = 0, 0
sprpriority = 99
[State 8024, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8024, Angle]
type = angleset
trigger1 = !time
value = 15 * (random % 24)

[State 8024, Scale]
type = angledraw
trigger1 = time < 10
scale = 0.257 + (time * 0.076), 0.50 - (time * 0.050)

[State 8024, Scale]
type = angledraw
trigger1 = time >= 10
scale = 0, 0

[State 8024, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 8024, Center]
type = explod
trigger1 = !time
anim = 8021
ID = 1
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8024, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 0.225 + (0.0140625 * time), 0.225 + (0.0140625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8024, Streaks]
type = explod
trigger1 = !time
anim = 8012
ID = 2
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
ontop = 1
removetime = 16
pausemovetime = -1
supermovetime = -1
[State 8024, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 0.197 + (0.0124 * time), 0.197 + (0.0124 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8024, P2 Back]
type = explod
trigger1 = !time
anim = 8013
ID = 3
postype = p1
vfacing = ifelse(random < 500, -1, 1)
sprpriority = -3
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8024, Position]
type = modifyexplod
triggerall = numexplod(3)
trigger1 = numenemy = 1
trigger2 = numenemy >= 2 && !time
ID = 3
postype = p1
pos = ceil(p2dist x + enemynear, const(size.ground.back)), ceil(p2dist y + ifelse(p2statetype = L, 0, ifelse(p2statetype = C, 0.5, 0.75) * enemynear, const(size.head.pos.y)))

[State 8024, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 0.30 + (0.0375 * time), 0.30 + (0.0375 * time)
trans = addalpha
alpha = 256 -(32 * time), 256

[State 8024, End]
type = removeexplod
trigger1 = time >= 16

[State 8024, End]
type = destroyself
trigger1 = time >= 16


;========================<RECOVER FX>=============================
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8200, End]
type = destroyself
trigger1 = time >= 16


;========================<COUNTER FX>=============================
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9999

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 5
postype = p1
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8290, Scale]
type = modifyexplod
trigger1 = numexplod(8290)
ID = 8290
scale = 0.2 + (0.05 * time), 0.2 + (0.05 * time)
trans = addalpha
alpha = ceil(256 -(16 * time)), 256

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16

[State 8290, End]
type = destroyself
trigger1 = !numexplod


;========================<FLAME PARTICLES>=============================
[Statedef 8150]
type = A
velset = 0, 0
anim = 9999

[State 8150, Player]
type = varset
trigger1 = !time
var(0) = parent, var(40)

[State 8150, Time]
type = varadd
trigger1 = 1
var(1) = -1

[State 8150, Time]
type = varset
trigger1 = !time
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(18) && helper(3005), time <= 1
trigger3 = numhelper(3055)
trigger3 = helper(3055), var(18) && helper(3055), time <= 1
var(1) = 60

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) + (playerID(var(0)), const(size.mid.pos.y))

[State 8150, Pos]
type = posset
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), statetype = L
x = ceil(playerID(var(0)), pos x)
y = ceil(playerID(var(0)), pos y) - 20

[State 8150, Turn]
type = turn
trigger1 = playerIDexist(var(0))
trigger1 = facing != (playerID(var(0)), facing)

[State 8150, Snd]
type = playsnd
trigger1 = playerIDexist(var(0))
trigger1 = playerID(var(0)), hitshakeover
value = 5, 1
persistent = 0

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = 3
postype = p1
random = 40, 40
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, Flames]
type = explod
trigger1 = playerIDexist(var(0))
anim = 8150
sprpriority = -1
postype = p1
random = 60, 60
vel = (random / 2000.0), -0.5 -(random / 2000.0)
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
scale = 0.5, 0.5
ownpal = 1

[State 8150, End]
type = destroyself
trigger1 = !playerIDexist(var(0))
trigger2 = var(1) <= 0


;====================<POWER CHARGE>====================
;--- MAIN FX ---
[Statedef 7240]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7240, Bind]
type = bindtoroot
trigger1 = root, stateno = 740 && root, anim = 740
pos = -4, 0

[State 7240, Snd]
type = playsnd
trigger1 = !time
value = 7, 4
channel = 0

[State 7240, Aura]
type = explod
trigger1 = !numexplod(7240)
ID = 7240
anim = 7240
sprpriority = 3
postype = p1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1
[State 7240, Dust]
type = explod
trigger1 = !(time % 6)
anim = 7105
sprpriority = -3
postype = p1
pos = 0, -ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240) && root, power < 3000
ID = 7240
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)
[State 7240, FX]
type = modifyexplod
trigger1 = numexplod(7240) && root, power >= 3000
ID = 7240
scale = 0.5, 0.5

[State 7240, End]
type = stopsnd
trigger1 = root, stateno != 740
channel = 0
[State 7240, End]
type = removeexplod
trigger1 = root, stateno != 740
[State 7240, End]
type = destroyself
trigger1 = root, stateno != 740


;--- Particles ---
[Statedef 7241]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7241, Bind]
type = bindtoroot
trigger1 = !(time % 8)
pos = ceil(-160 + (random / 3.125)), ceil(160 - (random / 3.125))

[State 7241, Particle]
type = explod
trigger1 = (time % 8) = 1
anim = 7241
sprpriority = ifelse(random < 750, 5, -1)
postype = p1
vel = ((rootdist x - 2) / 32.0), ((rootdist y - 72) / 32.0)
scale = ifelse(random < 500, 0.5, -0.5), ifelse(random < 500, 0.5, -0.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 7241, End]
type = removeexplod
trigger1 = root, stateno != 740
[State 7241, End]
type = destroyself
trigger1 = root, stateno != 740


;====================<ZERO COUNTER PAUSE>====================
[Statedef 7250]
type = A
physics = N
movetype = I
anim = 9999
ctrl = 0
velset = 0, 0

[State 7250, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 7250, Circle]
type = explod
trigger1 = !time
anim = 7250
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 7250, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 7250, Lightning]
type = explod
trigger1 = !time
anim = 7251
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 7250, End]
type = destroyself
trigger1 = time >= 16


;========================<DARK FORCE PAUSE=============================
[Statedef 7270]
type = A
physics = N
movetype = I
anim = 7270
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 7270, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7270, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7270, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7270, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
[State 7270, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
[State 7270, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
[State 7270, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7270, Lines]
type = explod
trigger1 = !time
anim = 7271
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 7270, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 7270, Circle]
type = explod
trigger1 = time = 16
anim = 7272
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 7270, Bats]
type = explod
trigger1 = !time
anim = 7273
ID = 3
sprpriority = -5
postype = left
pos = 160, 120
bindtime = -1
ownpal = 1

[State 7270, Bats]
type = modifyexplod
trigger1 = time < 10
ID = 3
scale = 5 -(0.4 * time), 5 -(0.4 * time)

[State 7270, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 7270, Safety]
type = removeexplod
trigger1 = time >= 26
[State 7270, End]
type = destroyself
trigger1 = time >= 26


;========================<SUPERPAUSE FX>=============================
;----- Level 1 -----
[Statedef 7500]
type = A
velset = 0, 0
anim = 7500
sprpriority = 5

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7500, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7500, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7500, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 7500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7500, Circle]
type = explod
trigger1 = time = 24
anim = 7502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7500, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7500, End]
type = destroyself
trigger1 = time >= 40


;----- Level 2 -----
[Statedef 7510]
type = A
velset = 0, 0
anim = 7510
sprpriority = 5

[State 7510, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7510, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7510, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7510, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 7510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7510, Circle]
type = explod
trigger1 = time = 24
anim = 7512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7510, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7510, End]
type = destroyself
trigger1 = time >= 40


;----- Level 3 -----
[Statedef 7520]
type = A
velset = 0, 0
anim = 7520
sprpriority = 5

[State 7520, Bind]
type = varset
trigger1 = !time
fvar(24) = -rootdist x

[State 7520, Bind]
type = varset
trigger1 = !time
fvar(25) = -rootdist y

[State 7520, Bind]
type = bindtoroot
trigger1 = 1
pos = fvar(24), fvar(25)

[State 7520, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow

[State 7520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 7520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)
[State 7520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 7520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
[State 7520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
[State 7520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256

[State 7520, Portrait]
type = explod
trigger1 = !time
anim = 7525
ID = 20
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1
[State 7520, Portrait]
type = explod
trigger1 = !time
anim = 7525
ID = 21
sprpriority = -16
postype = back
bindtime = -1
removetime = 40
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256
[State 7520, Scale]
type = removeexplod
trigger1 = numexplod(21) && time >= 16
ID = 21

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time >= 32
ID = 20
postype = back
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5
trans = addalpha
alpha = 128 - 16 * (time -32), 256

[State 7520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 7521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 16
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256
[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7520, Circle]
type = explod
trigger1 = time = 24
anim = 7522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
bindtime = -1
removetime = 32
supermovetime = -1

[State 7520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 7520, Safety]
type = removeexplod
trigger1 = time >= 40
[State 7520, End]
type = destroyself
trigger1 = time >= 40


;========================<SUPER FINISH>=============================
[Statedef 7600]
type = A
velset = 0, 0
anim = 9999

[State 7600, Sound]
type = playsnd
trigger1 = !time
value = 7, 7
channel = 1

[State 7600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 7600, Snd]
type = assertspecial
trigger1 = time <= 80
flag = nomusic

[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
trigger1 = !(time % 2)
time = 1
color = 0
add = 128, 128, 128

[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
trigger1 = (time % 2)
time = 1
color = 0
mul = 128, 32, 0

[State 7600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24]
time = 1
color = 32 * (time -16)
mul = 128 + 8 * (time - 16), 32 + 14 * (time - 16), 32 * (time - 16)

[State 7600, MvC]
type = explod
trigger1 = !time
anim = 7600
ID = 7600
ontop = 1
postype = left
pos = 160, ifelse((gamewidth / gameheight) > 1.55, 80, 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 7600, Fade]
type = modifyexplod
trigger1 = numexplod(7600)
ID = 7600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 7600, Stop Shake]
type = envshake
trigger1 = time <= 24
time = 1
ampl = 0

[State 7600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG
[State 7600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 7600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3
[State 7600, End]
type = destroyself
trigger1 = roundstate < 3


;========================<CAMERA CONTROL>=============================
[Statedef 7650]
physics = N
velset = 0, 0
anim = 9999
[State 7650, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
[State 7650, End]
type = destroyself
trigger1 = roundstate = 2


;========================<DIZZY STARS>=============================
[Statedef 8970]
type = A
physics = N
movetype = I
anim = 9999
velset = 0, 0
sprpriority = 0

[State 8970, Bullet time]
type = bgpalfx
trigger1 = !time
time = 5
sinadd = 128, 128, 128, 10
ignorehitpause = 1
persistent = 0

[State 8970, Bullet time]
type = varadd
trigger1= numenemy
trigger1 = enemynear, hitshakeover
trigger2 = var(0)
var(0) = 1

[State 8970, Bullet time]
type = pause
triggerall = numenemy
triggerall = enemynear, hitshakeover
trigger1 = var(0) = [1, 16]
trigger2 = var(0) = [17, 32]
trigger2 = !(var(0) % 2)
time = 1

[State 8970, Pos]
type = posset
trigger1 = numenemy
x = enemynear, pos x
y = (enemynear, pos y) + (enemynear, const(size.head.pos.y)) - 16

[State 8970, Pos]
type = posset
trigger1 = numenemy = 1
trigger1 = (enemynear, pos y) > 0
y = (enemynear, const(size.head.pos.y)) - 16

[State 8970, Star]
type = explod
trigger1 = !numexplod(1)
anim = 8970
ID = 1
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(2)
anim = 8970
ID = 2
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(3)
anim = 8970
ID = 3
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Star]
type = explod
trigger1 = !numexplod(4)
anim = 8970
ID = 4
postype = p1
pos = 0, 0
sprpriority = 5
bindtime = -1
removetime = -1
scale = 0.5, 0.5

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
postype = p1
pos = ceil(32 * cos((gametime + 0) / 32.0 * pi)), ceil(8 * sin((gametime + 0) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 0) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 0) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 0) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
postype = p1
pos = ceil(32 * cos((gametime + 32) / 32.0 * pi)), ceil(8 * sin((gametime + 32) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 32) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 32) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 32) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
postype = p1
pos = ceil(32 * cos((gametime + 16) / 32.0 * pi)), ceil(8 * sin((gametime + 16) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 16) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 16) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 16) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = ceil(32 * cos((gametime + 48) / 32.0 * pi)), ceil(8 * sin((gametime + 48) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi)
sprpriority = ifelse(sin((gametime + 48) / 32.0 * pi) >= 0, 5, -5)

[State 8970, Circle around]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
postype = p1
pos = ceil(32 * cos((gametime + 48) / 32.0 * pi)), ceil(8 * sin((gametime + 48) / 32.0 * pi))
scale = 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi), 0.375 + 0.125 * sin((gametime + 48) / 32.0 * pi)

[State 8970, Snd]
type = playsnd
trigger1 = 1
value = 0, 5300
lowpriority = 1
volumescale = 50
channel = 0

[State 8970, End]
type = stopsnd
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]
channel = 0

[State 8970, End]
type = removeexplod
trigger1 = !numenemy
trigger2 = numenemy
trigger2 = enemynear, stateno != [1115300, 1115319]

[State 8970, End]
type = destroyself
trigger1 = !numexplod


;========================<MOVELIST>=============================
[Statedef 8980]
type = A
physics = N
movetype = I
anim = 9999

[State 8980, Root]
type = varset
trigger1 = !time
sysvar(0) = root, ID

[State 8980, Turn]
type = turn
trigger1 = !time
trigger1 = facing = -1

[State 8980, Pos]
type = posset
trigger1 = 1
x = 0
y = pos y - screenpos y

[State 8980, Assert]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 8980, Explod]
type = explod
trigger1 = !numexplod(8989)
anim = 8989
ID = 8989
postype = left
pos = 160, 120
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
pausemovetime = -1
scale = 8, 8
ontop = 1
ownpal = 0

[State 8980, Snd]
type = playsnd
trigger1 = !time
value = 0, 8980
channel = 0

[State 8980, Pos Y]
type = varadd
trigger1 = root, command = "holdup"
var(1) = 4
[State 8980, Pos Y]
type = varadd
trigger1 = root, command = "holddown"
var(1) = -4

[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "back"
trigger2 = root, facing = -1 && root, command = "fwd"
var(1) = 240
[State 8980, Pos Y]
type = varadd
trigger1 = root, facing = 1 && root, command = "fwd"
trigger2 = root, facing = -1 && root, command = "back"
var(1) = -240

[State 8980, Pos Y];-Half of image height
type = varset
trigger1 = var(1) < (-375 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
var(1) = ceil(-375 + ifelse((gamewidth / gameheight) > 1.67, 142, 204))
[State 8980, Pos Y]
type = varset
trigger1 = var(1) > 0
var(1) = 0

[State 8980, Explod]
type = explod
trigger1 = !numexplod(8980)
anim = 8980
ID = 8980
postype = left
pausemovetime = -1

[State 8980, Explod]
type = modifyexplod
trigger1 = numexplod(8980)
anim = 8980
ID = 8980
postype = left
pos = 160, 18 + var(1)
facing = 1
vfacing = 1
bindtime = -1
removetime = -1
scale = 0.5, 0.5
ontop = 1
ownpal = 0

[State 8980, Pause]
type = pause
trigger1 = 1
time = 2
movetime = 2

[State 8980, End]
type = changestate
trigger1 = !playerIDexist(sysvar(0))
trigger2 = root, AIlevel
trigger3 = time
trigger3 = root, command = "start"
value = 8981


;--- Remove ---
[Statedef 8981]
type = A
physics = N
movetype = I
anim = 9999

[State 8981, Snd]
type = playsnd
trigger1 = !time
value = 0, 8981
channel = 0

[State 8981, End]
type = removeexplod
trigger1 = !time

[State 8981, End]
type = destroyself
trigger1 = time >= 30


;========================<DIRECTIONAL INPUT CONTROLLER>=============================
[Statedef 9999]
type = A
physics = N
movetype = I
anim = 9999

[State 9999, Root]
type = varset
trigger1 = !time
sysvar(0) = root, ID

[State 9999, End]
type = destroyself
trigger1 = !playerIDexist(sysvar(0))
trigger2 = root, AIlevel

[State -1, Catarl]
type = ctrlset
trigger1 = ctrl
value = 0

[State 9999, Bind]
type = bindtoroot
trigger1 = 1
pos = 0, ifelse((root, numtarget), 6, 3)

[State 9999, All for this]
type = turn
triggerall = p2dist x < 0
trigger1 = (root, backedgebodydist) <= 0
trigger2 = (root, p2dist x) < -(root, const(size.ground.back))
trigger3 = (root, p2dist x) > (root, const(size.ground.front))

[State 9999, Debug]
type = displaytoclipboard
trigger1 = 1
text = "Facing = %d"
params = facing * (root, facing)
