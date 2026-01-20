;===============================================================================
;========================<HYPER ELEMENTAL MOVES>================================
;===============================================================================
;Homura - Hyper
[Statedef 4000]
type = S
movetype = A
physics = S
anim = 4000
ctrl = 0
velset = 0,0
sprpriority = 1


[State 4000, Explod]
type = Explod
trigger1 = animelem = 2
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8090
name = "Dust"
scale = 1,1
pausemovetime = 999999
supermovetime = 999999


[State 4000, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 45
movetime = 45
pos = 25, -50
anim = S9100
sound = S9100,0
poweradd = -1000
Darken = 0

;----------------------

[State 4000, VarSet carga Bg]
type = VarSet
trigger1 = animelem = 2
v = 45   ;fv = 10
value = 1


[State 4000, Carga Bg]
type = helper
triggerall = numhelper(9210)=0
trigger1 = animelem = 2
helpertype = normal
stateno = 9210
ID = 9210
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 4000, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 1
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 4000, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 4000, Helper]
type = Helper
trigger1 = time = 50
stateno = 4010
id = 4010
name = "FireHit"
pos = 12*const(size.xscale),-50*const(size.yscale)
postype = P1
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1
size.yscale = 1


[State 4000, Helper]
type = Helper
trigger1 = time = 50
stateno = 4015
id = 4015
name = "FireExplod1"
pos = 12*const(size.xscale),-50*const(size.yscale)
postype = P1
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1
size.yscale = 1

[State 4000, Helper]
type = Helper
trigger1 = time = 59
stateno = 4015
id = 4016
name = "FireExplod2"
pos = 132*const(size.xscale),-50*const(size.yscale)
postype = P1
helpertype = normal
keyctrl = 0
ownpal = 1
size.xscale = 1.1
size.yscale = 1.3

[State 4000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0


[State 4000, ChangeState]
type = ChangeState
trigger1 = time = 172
value = 4001
ctrl = 1

;-------------------------------------------------------------------------------
;Homura End
[statedef 4001]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 4001
sprpriority = 0


[State 4001, ChangeState]
type = ChangeState
trigger1 = Animtime = 0
value = 300
ctrl = 1

;-------------------------------------------------------------------------------
;Homura Fire Hit
[Statedef 4010]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
sprpriority = 5


[State 4010, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 4010
value = 4010

[State 4010, BindToParent]
type = BindToParent
trigger1 = 1
pos = 12*const(size.xscale),-50*const(size.yscale)



[State 4010, 2]
type = BindToParent
trigger1 = 1
pos = 12*const(size.xscale),-50*const(size.yscale)

[State 4010, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 4010, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,NP,SP,HP
time = 1

[State 4010, HitOverride 1]
type = HitOverride
trigger1 = time>=0
attr = SCA,NP,SP,HP
slot = 1
stateno = 4010
time = 2


[State 4010, PLaysnd]
type = PLaysnd
trigger1 = Animelem = 2
trigger2 = Animelem = 5
value = 3000,2



[State 4010, HitDef Minimo e Max Damage]
type = HitDef
Triggerall = Movecontact!=[1,10]
Triggerall = Hitcount<11
trigger1 = parent,var(22) = 1
trigger1 = parent,var(22) = 2
attr = S, HP
animtype = Heavy
damage = ifelse(Hitcount<2,ifelse(parent,var(22)=1,30,20),ifelse(parent,var(22)=1,20,10)),ifelse(parent,var(22)=1,8,0)
guardflag = MA
pausetime = 1,ifelse(parent,var(22)=1,8,3)
sparkno = S8007
guard.sparkno = S8142
sparkxy = -20+random%20,-20+random%20
hitsound = S3000,1
guardsound = S3,0
ground.type = High
ground.slidetime = ifelse(parent,var(22)=0,14,5)
ground.hittime = ifelse(parent,var(22)=0,18,10)
guard.slidetime = ifelse(parent,var(22)=0,14,5)
guard.hittime  = ifelse(parent,var(22)=0,38,18)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = ifelse(parent,var(22)=0,38,18)
ground.velocity = -4,-3
guard.velocity = -3
airguard.velocity = -3
air.type = Low
air.velocity = -3,-2
yaccel = .38
fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
fall.recover = 0
air.recover = 0
envshake.time = 8
envshake.ampl = ifelse(parent,var(22)=0,5,3)
sprpriority = 5
palfx.time = ifelse(parent,var(22)=0,60,50)
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 4010, HitDef Normal Damage]
type = HitDef
triggerall = parent,var(22) = 0
Trigger1 = Movecontact!=[1,10]
Trigger1 = Hitcount<11
attr = S, HP
animtype = Heavy
damage = ifelse(Hitcount<2,25,15),5
guardflag = MA
pausetime = 1,5
sparkno = S8007
guard.sparkno = S8142
sparkxy = -20+random%20,-20+random%20
hitsound = S3000,1
guardsound = S3,0
ground.type = High
ground.slidetime = 10
ground.hittime = 14
guard.slidetime = 10
guard.hittime  = 30
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 30
ground.velocity = -4,-3
guard.velocity = -3
airguard.velocity = -3
air.type = Low
air.velocity = -3,-2
fall = 1
yaccel = .38
fall.recover = 0
air.recover = 0
forcestand = 1
fall.recover = 0
air.recover = 0
sprpriority = 5
envshake.time = 8
envshake.ampl = 4
palfx.time = 55
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1



[State 4010, HitDef Hit Extra]
type = HitDef
triggerall =parent,var(22) != 2
triggerall =parent,var(22) != 3
triggerall = Random < 500
triggerall = Time <= 55
trigger1 = ((parent, command = "x") || (parent, command = "y") || (parent, command = "z"))
attr = A, HP
getpower = 0
animtype  = Heavy
damage = 6,1
guardflag = MA
hitflag = MAFPDL
priority = 7, Hit
sprpriority = 4
pausetime = 1,5
guard.sparkno = -1
sparkno = -1
sparkxy = -1
hitsound  = -1
guardsound = -1
ground.type = Low
ground.slidetime = 10
ground.hittime  = 10
ground.velocity = -1,0
air.type = Low
air.velocity = -1,0
air.animtype = Back
fall.recover = 0

[State 4010, HitDef No Damage]
type = HitDef
triggerall = parent,var(22)= 3
Trigger1 = Movecontact!=[1,10]
Trigger1 = Hitcount<11
attr = S, HP
animtype = Light
damage = -5,-2
guardflag = MA
pausetime = 1,0
sparkno = S8007
guard.sparkno = S8142
sparkxy = -20+random%20,-20+random%20
hitsound = S3000,1
guardsound = S3,0
ground.type = High
ground.slidetime = 1
ground.hittime = 2
guard.slidetime = 1
guard.hittime  = 2
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 2
ground.velocity = -1,0
guard.velocity = -3
airguard.velocity = -1
air.type = Low
air.velocity = -1,0
palfx.time = 20
palfx.add = 100,100,100
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 256



;HELPER FIRE STRONG
[state 8100, Fire Sparks]
type = helper
triggerall =parent,var(22) != 3
trigger1 = !numhelper(8100)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype = H &&!target,time
trigger1 = var(48):=(target,ID)
name = "FireSparks"
id = 8100
stateno = 8100
helpertype = normal
postype = p2
pos = 0,0
ownpal = 1
keyctrl = 0
size.yscale = 1
size.xscale = 1
pausemovetime = 9999999
supermovetime = 9999999
ignorehitpause = 1
persistent = 0


[State 4010, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno != 4000
trigger2 = parent, movetype = H

;-------------------------------------------------------------------------------
;Homura - Fire Explod
[Statedef 4015]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
sprpriority = 5


[State 4015, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 4015
value = 4015


[State 4015, BindToParent]
type = BindToParent
trigger1 = Ishelper(4015)
pos = 12*const(size.xscale),-50*const(size.yscale)

[State 4015, BindToParent]
type = BindToParent
trigger1 = Ishelper(4016)
pos = 132*const(size.xscale),-40*const(size.yscale)


[State 4015, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 4015, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2


[State 4015, Helper]
type = Helper
trigger1 = animelem = 8
helpertype = normal ;player
name = "Homura Fire"
ID = 4016
stateno = 4016
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = -1
pausemovetime = -1

[State 4015, DestroySelf]
type = changestate
trigger1 = parent,stateno != 4000
trigger2 = parent, movetype = H
value = 4016

;---------------------------------------------------------------------------
;;Homura - Fire Explod End
[Statedef 4016]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 3+random%3,-2-random%2
anim = 4016
sprpriority = 4

[State 4016, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 4016, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 2

[State 3016, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
; Mystic Break Base
[Statedef 4050]
type = S
movetype = A
physics = S
ctrl = 0
anim = 4050
velset = 0,0
sprpriority = 0


;[State 4050, VarSet]
;type = null;VarSet
;trigger1 = time = 0 && !AILevel
;trigger1 = command = "MysticIce"
;trigger2 = !Time && AILevel
;var(8) = 2

;[State 4050, VarSet]
;type = null;VarSet
;trigger1 = time = 0&& !AILevel
;trigger1 = command = "MysticThunder"
;trigger2 = !Time && AILevel
;var(8) = 3

;[State 4050, VarSet]
;type = null;VarSet
;trigger1 = time = 0 && !AILevel
;trigger1 = command = "MysticWind"
;trigger2 = !Time && AILevel
;var(8) = 4

;[State 4050, VarSet]
;type = null;VarSet
;trigger1 = time = 0 && !AILevel
;trigger1 = command = "MysticEarth"
;trigger2 = !Time && AILevel
;var(8) = 5

;[State 4050, VarSet]
;type = null;VarSet
;trigger1 = time = 0 && !AILevel
;trigger1 = command = "MysticPoison"
;trigger2 = !Time && AILevel
;var(8) = 6

[State 1510, Button Detect]
type = VarSet
trigger1= !Time
var(8) = var(8)

[State 4050, Explod]
type = Explod
trigger1 = time = 0
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8090
name = "Dust"
scale = 1,1
pausemovetime = 999999
supermovetime = 999999


[State 4050, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 45
movetime = 45
pos = -25,-95
anim = S9100
sound = S9100,0
poweradd = -1000
Darken = 0

;----------------------

[State 4050, VarSet carga Bg]
type = VarSet
trigger1 = time = 0
v = 45   ;fv = 10
value = 1


[State 4050, Carga Bg Ice]
type = helper
triggerall = numhelper(9215)=0
trigger1 = var(8) = 2
trigger1 = time = 0
helpertype = normal
stateno = 9215
ID = 9215
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State 4050, Carga Bg Thunder]
type = helper
triggerall = numhelper(9220)=0
trigger1 = var(8) = 3
trigger1 = time = 0
helpertype = normal
stateno = 9220
ID = 9220
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State 4050, Carga Bg Wind]
type = helper
triggerall = numhelper(9225)=0
trigger1 = var(8) = 4
trigger1 = time = 0
helpertype = normal
stateno = 9225
ID = 9225
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State 4050, Carga Bg Earth]
type = helper
triggerall = numhelper(9230)=0
trigger1 = var(8) = 5
trigger1 = time = 0
helpertype = normal
stateno = 9230
ID = 9230
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State 4050, Carga Bg Poison]
type = helper
triggerall = numhelper(9235)=0
trigger1 = var(8) = 6
trigger1 = time = 0
helpertype = normal
stateno = 9235
ID = 9235
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State 4050, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 1
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 4050, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------


[State 4050, Helper]
type = Helper
triggerall = var(8) != 0
triggerall = var(8) = 2
trigger1 = time = 0
name = "Ice Spawner"
id = 4200
stateno = 4200
persistent = 0
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 4050, Helper]
type = Helper
triggerall = var(8) != 0
triggerall = var(8) = 3
trigger1 = time = 0
name = "Thunder Spawner"
id = 4300
stateno = 4300
persistent = 0
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 4050, Helper]
type = Helper
triggerall = var(8) != 0
triggerall = var(8) = 4
trigger1 = time = 0
name = "Wind Spawner"
id = 4400
stateno = 4400
persistent = 0
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 4050, Helper]
type = Helper
triggerall = var(8) != 0
triggerall = var(8) = 5
trigger1 = time = 0
name = "Earth Spawner"
id = 4500
stateno = 4500
persistent = 0
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 4050, Helper]
type = Helper
triggerall = var(8) != 0
triggerall = var(8) = 6
trigger1 = time = 0
name = "Poison Spawner"
id = 4600
stateno = 4600
persistent = 1
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 4000, ChangeAnim]
type = ChangeAnim
triggerall = anim = 4050
trigger1 = var(8) = 2;Ice
trigger1 = time = 160
trigger2 = var(8) = 3;Eletric
trigger2 = time = 160
trigger3 = var(8) = 4;Wind
trigger3 = time = 170
trigger4 = var(8) = 5;Earth
trigger4 = time = 166
trigger5 = var(8) = 6
trigger5 = time = 133;Poison
trigger6 = time >170
value = 4051



[State 4000, 2]
type = ChangeState
trigger1 = anim = 4051
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;--------------------------------------------------------------------------------------
; Mystic Break Ice Spawner, Warzard centre at -1, -92
[Statedef 4200]
type = A
movetype = A
physics = N
anim = 9999


[State 4200, VarSet]
type = VarSet
trigger1 = root, time > 43
trigger1 = time%5 = 0
fvar(3) = 0.5 + random*0.001

[State 4200, Explod]
type = Explod
trigger1 = root, time > 43
trigger1 = time%5 = 0
postype = left
id = 4230
anim = 4230 + (root, var(23) != 0)
bindtime = 1
sprpriority = -4
scale = fvar(3)*const(size.xscale), fvar(3)*const(size.yscale)
pos = 160, ifelse(root, screenpos y - 10*const(size.yscale) > 240, 120, floor((root, screenpos y - 10*const(size.yscale))*0.5))
random = 320, ifelse(root, screenpos y - 10*const(size.yscale) > 240, 240, floor(root, screenpos y - 10*const(size.yscale)))
pausemovetime = 999999
supermovetime = 999999

[State 4200, BindToParent]
type = BindToParent
trigger1 = 1
pos = floor(-1*const(size.xscale)), floor(-92*const(size.yscale))
;pos = floor(24*const(size.xscale)), floor(-92*const(size.yscale))

[State 4200, VarSet]
type = VarSet
trigger1 = root, time = 89
trigger1 = var(2) := 1
var(0) = 0

[State 4200, VarSet]
type = VarSet
trigger1 = enemynear, alive || enemynear, statetype != L
fvar(0) = const(size.xscale)*p2dist x

[State 4200, VarSet]
type = VarSet
trigger1 = enemynear, alive || enemynear, statetype != L
fvar(1) = const(size.yscale)*(p2dist y - rootdist y)

[State 4200, VarSet]
type = VarSet
trigger1 = fvar(1)
fvar(2) = atan(fvar(0)/fvar(1)) + ifelse(fvar(1) < 0, ifelse(fvar(0) < 0, -pi, pi), 0)

[State 4200, VarSet]
type = VarSet
trigger1 = fvar(1) = 0
fvar(2) = ifelse(fvar(0) < 0, -0.5*pi, 0.5*pi)

[State 4200, VarSet]
type = VarSet
trigger1 = fvar(0) = 0
trigger1 = fvar(1) < 0
fvar(2) = pi

[State 4200, VarSet]
type = VarSet
trigger1 = 1
fvar(2) = ifelse(floor(80*fvar(2)/pi)%10 < 4, floor(8*fvar(2)/pi), ceil(8*fvar(2)/pi))

[State 4200, VarSet]
type = VarSet
trigger1 = 1
var(1) = ifelse(fvar(2) > 8, 8, floor(fvar(2)))

[State 4200, PlaySnd]
type = PlaySnd
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 44
trigger3 = root, time = 89
trigger4 = root, time = 90
value = 4200, 0
;channel = 1

[State 4200, Helper]
type = Helper
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 89
name = "ice spike"
id = 4210 + 5*var(2)
stateno = 4210
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 4200, Helper]
type = Helper
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 89
name = "ice spike"
id = 4211 + 5*var(2)
stateno = 4210
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 4200, Helper]
type = Helper
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 89
name = "ice spike"
id = 4212 + 5*var(2)
stateno = 4210
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 4200, Helper]
type = Helper
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 89
name = "ice spike"
id = 4213 + 5*var(2)
stateno = 4210
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 4200, Helper]
type = Helper
;triggerall = !var(21)
trigger1 = root, time = 43
trigger2 = root, time = 89
name = "ice spike"
id = 4214 + 5*var(2)
stateno = 4210
pos = 0, 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 4200, FX Sound]
type = PlaySnd
trigger1 = var(10) = 1
value = S4200, 0
abspan = floor(fvar(11))
;channel = 2


[State 4200, VarSet]
type = VarSet
trigger1 = var(11)
var(13) = 1

[State 4200, VarSet]
type = VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1

[State 4200, VarAdd]
type = VarAdd
trigger1 = var(11)
var(12) = var(11)

[State 4200, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(11)
var(38) = var(11)

[State 4200, VarSet]
type = VarSet
trigger1 = 1
var(11) = 0

[State 4200, VarSet]
type = VarSet
trigger1 = 1
var(20) = 0

[State Delay Dampening]
type = ParentVarSet
trigger1 = time
var(33) = 1
ignorehitpause = 1

[State 4200, DestroySelf]
type = DestroySelf
trigger1 = root, stateno != 4050
trigger2 = root, Movetype = H

[State 4200, DestroySelf]
type = null;DestroySelf
trigger1 = var(21)
trigger1 = !var(20)
trigger1 = !numexplod(7503)
trigger2 = parent,stateno != 4050
trigger3 = parent,Movetype = H

; Mystic Break Ice Formation
;var(0) = id
;var(1) = target facing
;var(2) = facing shift
;var(3) = timer
;var(4) = 2nd wave
;-------------------------------------------------------------------------------
[Statedef 4210]
type = A
movetype = A
physics = N
sprpriority = 3

[State 4210, ChangeAnim]
type = ChangeAnim
trigger1 = !time && anim != 4200
value = 4200
pausemovetime = 999999
supermovetime = 999999

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4210, Trans]
type = Trans
trigger1 = root, var(23) != 0
trans = addalpha
alpha = 256, 64

[State 4210, HitBy]
type = HitBy
trigger1 = Time>=0
value = SCA, AA, AP
time = 1
ignorehitpause = 1

[State 4210, HitOverride]
type = HitOverride
trigger1 = Time>=0
attr = SCA, AA, AP
stateno = 4212
time = 1
ignorehitpause = 1


[State 4210, ParentVarAdd]
type = ParentVarAdd
trigger1 = !var(3)
trigger1 = var(0) := parent, var(0) || 1
trigger1 = var(4) := parent, var(2) || 1
var(0) = 1
ignorehitpause = 1

[State 4210, VarSet]
type = VarSet
trigger1 = 1
var(1) = parent, var(1) + var(0) - 2
ignorehitpause = 1

[State 4210, VarSet]
type = VarSet
trigger1 = var(1) < -8
var(1) = 16 + var(1)
ignorehitpause = 1

[State 4210, VarSet]
type = VarSet
trigger1 = var(1) > 8
var(1) = var(1) - 16
ignorehitpause = 1

[State 4210, ChangeAnim]
type = ChangeAnim
trigger1 = animelem = 1 || animelemno(-1) != animelemno(0)
value = 4200 + ifelse(var(1) > -1, Var(1), -Var(1))
elem = animelemno(0)
ignorehitpause = 1

[State 4210, PosSet]
type = PosSet
trigger1 = 1
x = parent, pos x
y = parent, pos y
ignorehitpause = 1

[State 4210, Turn]
type = Turn
triggerall = animelem = 1 || animelemno(-1) != animelemno(0)
trigger1 = var(1) > -1
trigger1 = facing != parent, facing
trigger2 = var(1) < 0
trigger2 = facing = parent, facing
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4200
x = 0
y = 7.78*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4201
x = 3.83*const(size.xscale)*12
y = 7.19*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4202
x = 7.07*const(size.xscale)*12
y = 5.5*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4203
x = 9.24*const(size.xscale)*12
y = 2.98*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4204
x = 10*const(size.xscale)*12
y = 0
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4205
x = 9.24*const(size.xscale)*12
y = -2.98*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4206
x = 7.07*const(size.xscale)*12
y = -5.5*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4207
x = 3.83*const(size.xscale)*12
y = -7.19*const(size.yscale)*12
ignorehitpause = 1

[State 4210, PosAdd]
type = PosAdd
trigger1 = anim = 4208
x = 0
y = -7.78*const(size.yscale)*12
ignorehitpause = 1


[State 4210, VarAdd]
type = VarAdd
trigger1 = 1;root, var(56) = gametime
var(3) = 1

[State 4211, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0;root, var(56) != gametime
value = anim
elem = animelemno(-1)
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999


[State Interupted]
type = ChangeState
trigger1 = Pos Y >0
trigger2 = root, movetype = H
value = 4212
ignorehitpause = 1

[State 4210, ChangeState]
type = ChangeState
trigger1 = var(0) = 2
trigger1 = var(3) = 25
trigger1 = var(3) := 0 || 1
trigger2 = var(0) = 1 || var(0) = 3
trigger2 = var(3) = 35
trigger2 = var(3) := 0 || 1
trigger3 = var(0) = 0 || var(0) = 4
trigger3 = var(3) = 45
trigger3 = var(3) := 0 || 1
value = 4211
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Mystic Break Ice Attack
[Statedef 4211]
type = A
movetype = A
physics = N
movehitpersist = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow


[State 4211, VarAdd]
type = VarAdd
trigger1 = 1
var(3) = 1
ignorehitpause = 1


[State 4211, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0;root, var(56) != gametime
value = anim
elem = animelemno(-1)
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

[State 4211, ParentVarset]
type = ParentVarSet
trigger1 = 1
var(20) = 1

[State 4211, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA, AA, AP
time = 1
ignorehitpause = 1

[State 4211, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA, AA, AP
stateno = 4212
time = 1
ignorehitpause = 1

[State 4211, Turn]
type = Turn
triggerall = animelemno(-1) != animelemno(0)
triggerall = anim = 4200 || anim = 4208
trigger1 = facing = 1
trigger1 = p2dist x < 0
trigger2 = facing = -1
trigger2 = p2dist x <= 0
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = enemynear, alive || enemynear, statetype != L
trigger1 = animelemno(-1) != animelemno(0)
fvar(0) = const(size.xscale)*p2dist x
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = enemynear, alive || enemynear, statetype != L
trigger1 = animelemno(-1) != animelemno(0)
fvar(1) = const(size.yscale)*(p2dist y + ifelse(p2statetype = C, 0.5*enemynear, const(size.mid.pos.y), 0.7*enemynear, const(size.head.pos.y)))
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = fvar(1)
fvar(2) = atan(fvar(0)/fvar(1)) + ifelse(fvar(1) < 0, ifelse(fvar(0) < 0, -pi, pi), 0)
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = fvar(1) = 0
fvar(2) = ifelse(fvar(0) < 0, -0.5*pi, 0.5*pi)
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = fvar(0) = 0
trigger1 = fvar(1) < 0
fvar(2) = pi
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
fvar(2) = ifelse(floor(80*fvar(2)/pi)%10 < 4, floor(8*fvar(2)/pi), ceil(8*fvar(2)/pi))
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
var(1) = ifelse(fvar(2) > 8, 8, floor(fvar(2)))
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = var(1) > -1
var(2) = ifelse(abs(anim - 4200 - var(1)) < 1 + (var(2) = 0), 0, ifelse(anim < 4200 + var(1), 1, -1))
ignorehitpause = 1

[State 4211, VarSet]
type = VarSet
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = var(1) < 0
trigger1 = var(2) = 0
var(2) = ifelse(var(1) > -5, -1, 1)
ignorehitpause = 1


[State 4211, ChangeAnim]
type = ChangeAnim
trigger1 = animelemno(-1) != animelemno(0)
trigger1 = var(3) < 17
value = anim + var(2)
elem = animelemno(0)
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999


[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4200
x = 0
y = 7.78*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4201
x = 3.83*const(size.xscale)
y = 7.19*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4202
x = 7.07*const(size.xscale)
y = 5.5*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4203
x = 9.24*const(size.xscale)
y = 2.98*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4204
x = 10*const(size.xscale)
y = 0
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4205
x = 9.24*const(size.xscale)
y = -2.98*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4206
x = 7.07*const(size.xscale)
y = -5.5*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4207
x = 3.83*const(size.xscale)
y = -7.19*const(size.yscale)
ignorehitpause = 1

[State 4211, VelSet]
type = VelSet
trigger1 = anim = 4208
x = 0
y = -7.78*const(size.yscale)
ignorehitpause = 1

[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1

[State 4211, 1]
type = HitDef
trigger1 = 1
id = 4200
attr = A, HP
damage = 24, 8
getpower = 0
numhits = 1
priority = 7, hit
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 14
guard.pausetime = 0, 13
sparkno = S8004
guard.sparkno = S8142
hitsound = S2,6
guardsound = S3,0
ground.type = High
ground.velocity = ifelse(rootdist x > 0, 1, -1)*5, -7.5
ground.hittime  = 16
ground.slidetime  = 16
ground.cornerpush.veloff = 0
guard.velocity = ifelse(rootdist x > 0, 1, -1)*12.5
guard.hittime = 15
;air.hittime = 999
airguard.ctrltime = 39
air.velocity = ifelse(rootdist x > 0, 1, -1)*5, -6.43
airguard.velocity = ifelse(rootdist x > 0, 1, -1)*5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
envshake.time = 10
envshake.ampl = 5
palfx.add = 256, 256, 256
palfx.time = 1
ignorehitpause = 1



[State 4211, ChangeState]
type = ChangeState
trigger1 = movehit
value = 4213
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

[State Interupted]
type = ChangeState
trigger1 = moveguarded
trigger2 = Pos Y >0 && Vel X > 0
value = 4212
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

[State 4211, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <=-60

;-------------------------------------------------------------------------------
; Mystic Break Disappear
[Statedef 4212]
type = A
physics = N
movetype = I
anim = anim + 10
ignorehitpause = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4212, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 10
ampl = 5

[State 8060, Explod]
type = Explod
trigger1 = animtime = 0
anim = 8064 + random%3
id = 8064
vel = 3, 4
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = animtime = 0
anim = 8064 + random%3
id = 8064
bindtime = 1
vel = 4, -3
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = animtime = 0
anim = 8067 + random%3
id = 8064
vel = -3, 4
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = animtime = 0
anim = 8067 + random%3
id = 8064
bindtime = 1
vel = -4, -3
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 4212, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
ignorehitpause = 1


;-------------------------------------------------------------------------------
; Mystic Break Hit
[Statedef 4213]
type = A
physics = N
movetype = I
anim = 9999
movehitpersist = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4212, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 10
ampl = 5

[State 4213, Ice TargetState]
type = TargetState
triggerall = root, var(22) != 3
trigger1 = numtarget
trigger1 = numtarget > 1 || !target, gethitvar(guarded)
value = 5706
ignorehitpause = 1
persistent = 0

[State 4213, Ice FX]
type = Helper
triggerall = root, var(22) != 3
trigger1 = numtarget
trigger1 = target, stateno = [5706, 5708]
trigger1 = target, time = 0
trigger1 = !target, gethitvar(guarded)
trigger1 = var(10) := 1
name = "ice"
id = 8060
stateno = 8060
postype = left
pos = floor(target, pos x - target, facing*10), floor(target, pos y + target, const(size.mid.pos.y))
facing = target, facing
ownpal = 1
random = floor((target, const(size.ground.front)+target, const(size.ground.back))*0.2), floor((target, const(size.mid.pos.y)-target, const(size.head.pos.y))*(movehit != 0)*0.2)
ignorehitpause = 1
persistent = 0


[State 4213, ParentVarset]
type = ParentVarSet
trigger1 = parent, var(10) < 1
var(10) = ifelse(var(10), 1, -1)
ignorehitpause = 1
persistent = 0

[State 4213, ParentVarAdd]
type = ParentVarAdd
triggerall = movehit = 1
trigger1 = numtarget
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
var(11) = 1
ignorehitpause = 1
persistent = 0

[State 4213, ParentVarset]
type = ParentVarSet
trigger1 = var(10)
trigger1 = numtarget
fvar(10) = target, pos x
ignorehitpause = 1
persistent = 0

[State 4213, ParentVarset]
type = ParentVarSet
trigger1 = var(10)
trigger1 = !numtarget
fvar(10) = enemynear, pos x
ignorehitpause = 1
persistent = 0

[State 4213, DestroySelf]
type = DestroySelf
trigger1 = 1
ignorehitpause = 1

;======================================================================================
;--------------------------------------------------------------------------------------
; Mystic Break Thunder Spawner
[Statedef 4300]
type = A
physics = N
movetype = A
anim = 9999

[State 4300, BindToParent]
type = BindToParent
trigger1 = 1

[State 4300, Explod]
type = null;Explod
trigger1 = root, time > 43
trigger1 = time%5 = 0
postype = left
id = 4310
anim = 4310 + (root, var(23) != 0)
bindtime = 1
sprpriority = random%9 - 4
scale = const(size.xscale), const(size.yscale)
pos = 160, floor(screenpos y - 20*const(size.yscale))
random = 320, floor(60/const(size.yscale))
supermovetime = 99999

[State 4300, VarSet]
type = VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1


[State 4300, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
var(2) = ifelse(root, time = 46, floor(p2dist x), ceil(p2dist x + enemynear, facing*facing*enemynear, vel x*2 - 80 + random*0.16))

[State 4300, VarSet]
type = VarSet
trigger1 = var(2) > frontedgedist + 32
var(2) = ceil(p2dist x + random*0.001*(frontedgedist + 32 - p2dist x))

[State 4300, PlaySnd]
type = PlaySnd
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
value = 4300, 0
;channel = 1

[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1


[State 4300, Helper]
type = Helper
;triggerall = !root, var(22)
trigger1 = root, time = 46 + var(1)*12 + var(3)
helpertype = normal ;player
name = "Thunder 1"
ID = 4310
stateno = 4310
pos = var(2), floor((1 - random*0.002)*30.0/const(size.yscale) - 20*const(size.yscale))
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 4300, Helper]
type = Helper
;triggerall = !root, var(22)
trigger1 = root, time = 46 + var(1)*12 + var(3)
helpertype = normal ;player
name = "Thunder 2"
ID = 4311
stateno = 4311
pos = -160+random%320, floor((1 - random*0.002)*30.0/const(size.yscale) - 20*const(size.yscale))
postype = p1   ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
;random = 320, floor(60/const(size.yscale))

[State 4300, Helper]
type = Helper
trigger1 = Random < 400
trigger1 = (root, time > 45) && Time <= 130
trigger1 = ((root, command = "x") || (root, command = "y") || (root, command = "z"))
helpertype = normal ;player
name = "Thunder 2"
ID = 4311
stateno = 4311
pos = -20+random%20, floor((1 - random*0.002)*30.0/const(size.yscale) - 20*const(size.yscale))
postype = p2   ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 4300, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
trigger1 = var(1) := var(1) + 1
var(3) = random%12 - 6


[State 4300, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno != 4050
trigger2 = root, movetype = H
trigger3 = parent,stateno = 4050
trigger3 = parent,time > 140

;-------------------------------------------------------------------------------
; Mystic Break Thunder 1
[Statedef 4310]
type = A
movetype = A
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = random%9 - 4


[State 4310, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 4300 + (root, var(23) != 0)
value = 4300 + (root, var(23) != 0)


[State 4310, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AP
time = 1
ignorehitpause = 1

[State 0, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,AP
stateno = 4310
time = 1
ignorehitpause = 1

[State 4310, VarSet]
type = null;VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1

[State 4300, VarAdd]
type = null;VarAdd
triggerall = parent, projhittime(4300) = 1
trigger1 = parent, numtarget
trigger1 = var(13) := 1
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
trigger2 = var(13) := 1
var(12) = 1
ignorehitpause = 1

[State 4310, ParentVarAdd]
type = null;ParentVarAdd
triggerall = parent, projhittime(4300) = 1
trigger1 = parent, numtarget
trigger1 = var(13) := 1
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
trigger2 = var(13) := 1
var(38) = 1
ignorehitpause = 1

[State 4310, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
var(2) = ifelse(root, time = 46, floor(p2dist x), ceil(p2dist x + enemynear, facing*facing*enemynear, vel x*2 - 80 + random*0.16))

[State 4310, VarSet]
type = VarSet
trigger1 = var(2) > frontedgedist + 32
var(2) = ceil(p2dist x + random*0.001*(frontedgedist + 32 - p2dist x))

[State 4310, PlaySnd]
type = PlaySnd
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
value = 4300, 0
;channel = 1

[State Damage Bonus]
type = null;AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1


[State 4310, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
trigger1 = var(1) := var(1) + 1
var(3) = random%12 - 6

[State 4310, PlaySnd]
type = PlaySnd
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
value = 4300, 0
;channel = 1

[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1



[State 4310, HitDef]
type = HitDef
triggerall = root, var(23) != 1
triggerall = root, var(23) != 2
triggerall = root, var(23) != 3
triggerall = root, var(23) != 4
trigger1 = time%5 = 0
attr = A, HP
damage = 12, 2
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 16
ground.slidetime  = 16
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 15
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4310, HitDef]
type = HitDef
triggerall = root, var(23) != 2
triggerall = root, var(23) != 3
triggerall = root, var(23) != 4
trigger1 = root, var(23) = 1
trigger1 = time%5 = 0
attr = A, HP
damage = 16, 3
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 18
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4310, HitDef]
type = HitDef
triggerall = root, var(23) != 1
triggerall = root, var(23) != 3
triggerall = root, var(23) != 4
trigger1 = root, var(23) = 2
trigger1 = time%5 = 0
attr = A, HP
damage = 20, 4
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 20
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4310, HitDef]
type = HitDef
triggerall = root, var(23) != 1
triggerall = root, var(23) != 2
triggerall = root, var(23) != 4
trigger1 = root, var(23) = 3
trigger1 = time%5 = 0
attr = A, HP
damage = 8, 0
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 8
guard.pausetime = 0, 5
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 10
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 19
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 0
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4310, HitDef]
type = HitDef
triggerall = root, var(23) != 1
triggerall = root, var(23) != 2
triggerall = root, var(23) != 3
trigger1 = root, var(14) = 4
trigger1 = time%5 = 0
attr = A, HP
damage = -3, -1
getpower = 0
animtype = Light
guardflag = MA
hitflag = MAF
pausetime = 1, 1
guard.pausetime = 0,1
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -1.67, -1.23
ground.hittime  = 1
ground.slidetime  = 1
ground.cornerpush.veloff = 0
guard.velocity = -2.5
guard.hittime = 1
airguard.ctrltime = 1
air.velocity = -1, -1.43
airguard.velocity = -5, -6.43
fall = 0
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 1
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1


[state 8300,Eletric Sparks]
type = helper
triggerall = root,var(23) !=4
trigger1 = !numhelper(8300)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype = H &&!target,time
trigger1 = var(48):=(target,ID)
name = "EletricSparks"
id = 8300
stateno = 8300
helpertype = normal
postype = p2
pos = 0,0
ownpal = 1
keyctrl = 0
size.yscale = 1
size.xscale = 1
pausemovetime = 9999999
supermovetime = 9999999
ignorehitpause = 1
persistent = 0


[State 4310, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;-------------------------------------------------------------------------------
; Mystic Break Thunder 2
[Statedef 4311]
type = A
movetype = A
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = random%9 - 4

[State 4311, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 4300 + (root, var(23) != 0)
value = 4310 + (root, var(23) != 0)

[State 4311, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AP
time = -1


[State 4310, VarSet]
type = null;VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1


[State 4310, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
var(2) = ifelse(root, time = 46, floor(p2dist x), ceil(p2dist x + enemynear, facing*facing*enemynear, vel x*2 - 80 + random*0.16))

[State 4310, VarSet]
type = VarSet
trigger1 = var(2) > frontedgedist + 32
var(2) = ceil(p2dist x + random*0.001*(frontedgedist + 32 - p2dist x))

[State 4310, PlaySnd]
type = PlaySnd
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
value = 4300, 0
;channel = 1



[State 4310, VarSet]
type = VarSet
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
trigger1 = var(1) := var(1) + 1
var(3) = random%12 - 6

[State 4310, PlaySnd]
type = PlaySnd
trigger1 = root, time > 45
trigger1 = root, time = 46 + var(1)*12 + var(3)
value = 4300, 0
;channel = 1

[State Damage Bonus]
type = null;AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1


[State 4311, HitDef]
type = HitDef
triggerall = root, var(14) != 4
triggerall = root, var(14) != 5
triggerall = root, var(14) != 6
triggerall = root, var(14) != 7
trigger1 = time%5 = 0
attr = A, HP
damage = 8, 2
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 16
ground.slidetime  = 16
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 15
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4311, HitDef]
type = HitDef
triggerall = root, var(14) != 5
triggerall = root, var(14) != 6
triggerall = root, var(14) != 7
trigger1 = root, var(14) = 4
trigger1 = time%5 = 0
attr = A, HP
damage = 12, 3
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 18
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4311, HitDef]
type = HitDef
triggerall = root, var(14) != 4
triggerall = root, var(14) != 6
triggerall = root, var(14) != 7
trigger1 = root, var(14) = 5
trigger1 = time%5 = 0
attr = A, HP
damage = 10, 4
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 9
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 20
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 29
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 1
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4311, HitDef]
type = HitDef
triggerall = root, var(14) != 4
triggerall = root, var(14) != 5
triggerall = root, var(14) != 7
trigger1 = root, var(14) = 6
trigger1 = time%5 = 0
attr = A, HP
damage = 5, 0
getpower = 0
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 8
guard.pausetime = 0, 5
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -6.67, -4.23
ground.hittime  = 18
ground.slidetime  = 10
ground.cornerpush.veloff = 0
guard.velocity = -7.5
guard.hittime = 17
airguard.ctrltime = 19
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
fall = 0
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 3
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1

[State 4311, HitDef]
type = HitDef
triggerall = root, var(14) != 4
triggerall = root, var(14) != 5
triggerall = root, var(14) != 6
trigger1 = root, var(14) = 7
trigger1 = time%5 = 0
attr = A, HP
damage = -2, -1
getpower = 0
animtype = Light
guardflag = MA
hitflag = MAF
pausetime = 1, 1
guard.pausetime = 0,1
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0, floor(-50*const(size.yscale) + p2dist y*0.8)
hitsound  = -1
guardsound = s3,0
ground.type = Low
ground.velocity = -1.67, -1.23
ground.hittime  = 1
ground.slidetime  = 1
ground.cornerpush.veloff = 0
guard.velocity = -2.5
guard.hittime = 1
airguard.ctrltime = 1
air.velocity = -1, -1.43
airguard.velocity = -5, -6.43
fall = 0
fall.recover = 0
yaccel = .536
id = 4310
envshake.time = 8
envshake.ampl = 1
palfx.invertall = 1
palfx.time = 50
palfx.color = 0
palfx.add = -64, -96, -160
palfx.sinadd = 64, 96, 128, 10
ignorehitpause = 1


[state 8300,Eletric Sparks]
type = helper
triggerall = root,var(14) !=7
trigger1 = !numhelper(8300)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype = H &&!target,time
trigger1 = var(48):=(target,ID)
name = "EletricSparks"
id = 8300
stateno = 8300
helpertype = normal
postype = p2
pos = 0,0
ownpal = 1
keyctrl = 0
size.yscale = 1
size.xscale = 1
pausemovetime = 9999999
supermovetime = 9999999
ignorehitpause = 1
persistent = 0

[State 4310, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;======================================================================================
;--------------------------------------------------------------------------------------
; Mystic Break Wind Spawner
[Statedef 4400]
type = A
physics = N
movetype = A
anim = 9999


[State 4400, VarSet]
type = VarSet
trigger1 = root, time > 43
trigger1 = (time-4)%8 = 0
fvar(4) = random*0.006 - 3

[State 4400, VarSet]
type = VarSet
trigger1 = root, time > 43
trigger1 = (time-4)%8 = 0
fvar(3) = 0.5 + random*0.0005 - fvar(4)*0.05


[State 4400, PlaySnd]
type = PlaySnd
trigger1 = root, time = 44
value = 4400, 0
;channel = 1
persistent = 0

[State 4400, Helper]
type = Helper
trigger1 = root, time = 44
name = "tornado"
id = 4410
stateno = 4410
pos = 0, floor(-160*const(size.yscale))
ownpal = 1
supermovetime = 99999

[State 4400, Helper]
type = Helper
trigger1 = root, time = 45
name = "tornado"
id = 4411
stateno = 4410
pos = 0, floor(-96*const(size.yscale))
ownpal = 1
supermovetime = 99999

[State 4400, Helper]
type = Helper
trigger1 = root, time = 46
name = "tornado"
id = 4412
stateno = 4410
pos = 0, floor(-32*const(size.yscale))
ownpal = 1
supermovetime = 99999

[State 4400, Helper]
type = Helper
trigger1 = root, time = 95
name = "tornado"
id = 4413
stateno = 4410
pos = 0, floor(-144*const(size.yscale))
ownpal = 1
supermovetime = 99999

[State 4400, Helper]
type = Helper
trigger1 = root, time = 96
name = "tornado"
id = 4414
stateno = 4410
pos = 0, floor(-48*const(size.yscale))
ownpal = 1
supermovetime = 99999


[State 4400, Helper]
type = Helper
trigger1 = root, time = 96
name = "tornado"
id = 4414
stateno = 4410
pos = 0, floor(-48*const(size.yscale))
ownpal = 1
supermovetime = 99999

[State 4400, Helper]
type = Helper
trigger1 = root, time > 43
trigger1 = (time-4)%8 = 0
trigger2 = Random < 300
trigger2 = (root, time > 50) && Time <= 130
trigger2 = ((root, command = "x") || (root, command = "y") || (root, command = "z"))
helpertype = normal ;player
postype = back
id = 4420
stateno = 4420 ;+ 10*(random%2) + (root, var(23) != 0)
bindtime = 1
sprpriority = random%8 - 4
pos = -48, floor(screenpos y*0.5) - 360+random%150
ownpal = 1
random = 0, 150
supermovetime = 9999
pausemovetime = 9999
size.xscale = fvar(3)*const(size.xscale)
size.yscale = fvar(3)*const(size.yscale)


[State 4400, BindToParent]
type = BindToParent
trigger1 = 1


[State 4400, VarSet]
type = VarSet
trigger1 = var(11)
var(13) = 1

[State 4400, VarSet]
type = VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1

[State 4400, VarAdd]
type = VarAdd
trigger1 = var(11)
var(12) = var(11)

[State 4400, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(11)
var(38) = var(11)

[State 4400, VarSet]
type = VarSet
trigger1 = 1
var(11) = 0

[State 4400, VarSet]
type = VarSet
trigger1 = 1
var(20) = 0

[State Delay Dampening]
type = ParentVarSet
trigger1 = time
var(33) = 1
ignorehitpause = 1



[State 4400, DestroySelf]
type = DestroySelf
trigger1 = parent, anim != 4050
trigger2 = parent, stateno != 4050
trigger3 = root, movetype = H

;--------------------------------------------------------------------------------------
; Mystic Break Wind Attack
[Statedef 4410]
type = A
movetype = A
physics = N
movehitpersist = 1
sprpriority = 3


[State 4410, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0;!var(3)
value = 4400
ignorehitpause = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4410, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA, AP
time = 1
ignorehitpause = 1

[State 4410, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA, AP
stateno = 4411
time = 1


[State 4410, ParentVarAdd]
type = ParentVarAdd
trigger1 = !var(3)
trigger1 = var(0) := parent, var(0) || 1
var(0) = 1
ignorehitpause = 1

[State 4410, ParentVarset]
type = ParentVarSet
trigger1 = 1
var(20) = 1


[State 4410, VelSet]
type = VelSet
trigger1 = !var(3)
x = 3.67
y = 1.25
ignorehitpause = 1

[State 4410, VelAdd]
type = VelAdd
trigger1 = time
x = 0.05
y = -0.05
ignorehitpause = 1


[State 4410, VarSet]
type = VarSet
triggerall = movecontact = 1
triggerall = time || prevstateno != 4412
triggerall = numtarget || p2movetype = H
trigger1 = numtarget != 1
trigger2 = numtarget = 1
trigger2 = !target, ishelper
var(2) = 6
ignorehitpause = 1

[State 4410, VarSet]
type = VarSet
trigger1 = movereversed = 1
var(2) = 6
ignorehitpause = 1

[State 4410, VarAdd]
type = VarAdd
triggerall = time || prevstateno != 4412
trigger1 = var(2) = 6
var(1) = 1
ignorehitpause = 1


[State 4410, VarAdd]
type = VarAdd
trigger1 = var(2) > 0
var(2) = -1
ignorehitpause = 1

[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1

[State 4410, 1]
type = HitDef
trigger1 = time = 0
id = 4400
attr = A, HP
damage = ifelse(root,Var(26) = 1,18,12),ifelse(root,Var(26) = 1,6,3)
getpower = 0
numhits = 1
priority = 7, hit
animtype = Up
guardflag = M
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 8
sparkno = -1
guard.sparkno = -1
hitsound   = -1
guardsound = -1
ground.type = Low
ground.velocity = ifelse(var(0) > 2, 1, -1)*0.83, ifelse(var(0) > 2, -10, -8.5)
ground.hittime  = 24
ground.slidetime  = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = ifelse(var(0) > 2, 1, -1)*0.83, ifelse(var(0) > 2, -10, -8.5)
airguard.velocity = ifelse(var(0) > 2, 1, -1)*3, -6.43
fall = 1
fall.recover = 0
yaccel = .536
ignorehitpause = 1


[State 4410, Explod]
type = Explod
trigger1 = movecontact = 1
postype = p1
anim = 8020
bindtime = 1
pos = floor(vel x), floor(vel y)
scale = .4,.4
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1
ignorehitpause = 1


[State 4410, VarAdd]
type = VarAdd
trigger1 = 1
var(3) = 1
ignorehitpause = 1

[State 4410, ChangeState Interupted]
type = ChangeState
trigger1 = Movecontact
value = 4411
ctrl = 0

[State 4410, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Mystic Break Disappear
[Statedef 4411]
type = A
physics = N
movetype = I
anim = 4401
ignorehitpause = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4411, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 4401
ignorehitpause = 1

[State 4411, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Mystic Break Hit
[Statedef 4412]
type = A
physics = N
movetype = I
movehitpersist = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4412, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = parent, var(10) < 1
var(10) = ifelse(var(10), 1, -1)
ignorehitpause = 1
persistent = 0

[State 4412, ParentVarAdd]
type = ParentVarAdd
triggerall = !time
triggerall = movehit = 1
trigger1 = numtarget
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
var(11) = 1
ignorehitpause = 1
persistent = 0

[State 4412, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = numtarget
fvar(10) = target, pos x
ignorehitpause = 1
persistent = 0

[State 4412, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = !numtarget
fvar(10) = enemynear, pos x
ignorehitpause = 1
persistent = 0

[State 4412, ChangeState]
type = ChangeState
trigger1 = var(1) < 3
value = 4410
ignorehitpause = 1

[State 4412, ChangeAnim]
type = ChangeAnim
trigger1 = anim != 4401
value = 4401
ignorehitpause = 1

[State 4412, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 4401
ignorehitpause = 1

[State 4412, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
ignorehitpause = 1
;--------------------------------------------------------------------------------------
; Mystic Break Wind Attack
[Statedef 4420]
type = A
movetype = A
physics = N
movehitpersist = 1
sprpriority = 3

[State 4410, ChangeAnim]
type = ChangeAnim
trigger1 = !time && !anim
value = 4410 + 10*(random%2); + (root, var(23) != 0)
ignorehitpause = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow


[State 0, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,NP,SP,HP
time = 1


[State 4410, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,HP
stateno = 4421
slot = 1
time = 2
forceair = 0
ignorehitpause = 1
persistent = 1

[State 4410, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,NP,SP
stateno = 4420
slot = 2
time = 2
forceair = 0
ignorehitpause = 1
persistent = 1



[State 4410, VelSet]
type = VelSet
trigger1 = time = 0
x = 2.5 + random*0.0025
y = 2.5 + random*0.0025
ignorehitpause = 1

[State 4410, VelAdd]
type = VelAdd
trigger1 = time
x = 0.1
y = -0.1
ignorehitpause = 1


[State 4410, 1]
type = HitDef
trigger1 = time = 0
id = 4400
attr = A, HP
damage = ifelse(root,Var(26) = 1,26,20),ifelse(root,Var(26) = 1,8,4)
priority = 7, hit
animtype = Up
guardflag = M
hitflag = MAF
pausetime = 1, 9
guard.pausetime = 0, 8
sparkno = -1
guard.sparkno = -1
hitsound   = -1
guardsound = -1
ground.type = Low
ground.velocity = ifelse(var(0) > 2, 1, -1)*0.83, ifelse(var(0) > 2, -10, -8.5)
ground.hittime  = 14
ground.slidetime  = 14
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 13
airguard.ctrltime = 29
air.velocity = ifelse(var(0) > 2, 1, -1)*0.83, ifelse(var(0) > 2, -10, -8.5)
airguard.velocity = ifelse(var(0) > 2, 1, -1)*3, -6.43
fall = 1
fall.recover = 0
yaccel = .536
ignorehitpause = 1


[State 4410, Explod]
type = Explod
trigger1 = movecontact = 1
postype = p1
anim = 8020
bindtime = 1
pos = floor(vel x), floor(vel y)
scale = .8,.8
sprpriority = 5
pausemovetime = 99999
supermovetime = 99999
ownpal = 1
ignorehitpause = 1


[State 4410, ChangeState Interupted]
type = ChangeState
trigger1 = MoveHit
value = 4421
ctrl = 0

[State 4410, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Mystic Break Disappear
[Statedef 4421]
type = U
movetype = I
physics = N
ignorehitpause = 1

[State 4421, ChangeAnim]
type = null;ChangeAnim
trigger1 = time = 0;!var(3)
value = 4420 + 10*(random%2) + (root, var(23) != 0)
ignorehitpause = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow


[State 4421, NotHitBy]
type = NotHitBy
trigger1 = time>=0
value = SCA
time = 1
ignorehitpause = 1

[State 4421, VelSet]
type = VelSet
trigger1 = time = 0
x = 1
y = ifelse(random<500,-1,1)
ignorehitpause = 1


[State 4421, VarSet]
type = VarSet
trigger1 = time = 0
v = 1
value = 255

[State 4421, VarAdd]
type = VarAdd
trigger1 = 1
v = 1
value = -8

[State 4421, Trans]
type = Trans
trigger1 = time>5
trans = addalpha
alpha = var(1),255

[State 4411, DestroySelf]
type = DestroySelf
trigger1 = var(1) <= 0
trigger2 = time >= 60
trigger3 = FrontEdgeDist <= -40
ignorehitpause = 1
;===============================================================================
;-------------------------------------------------------------------------------
; Mystic Break Earth Spawner
[Statedef 4500]
type = A
physics = N
movetype = A
anim = 9999


[State 4500, DestroySelf]
type = DestroySelf
trigger1 = var(21)
trigger1 = !numexplod(7503)


[State 4500, VarSet]
type = VarSet
triggerall = !var(21)
trigger1 = parent, anim != 4050
trigger2 = parent, stateno != 4050
var(21) = 1

[State 4500, VarSet]
type = VarSet
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = enemynear, alive || enemynear, statetype != L
fvar(0) = enemynear, pos x - helper(9998), fvar(0)

[State 4500, VarSet]
type = VarSet
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = enemynear, alive || enemynear, statetype != L
fvar(1) = enemynear, pos y + enemynear, const(size.mid.pos.y)

[State 4500, PlaySnd]
type = PlaySnd
trigger1 = root, time = [50, 136]
trigger1 = root, time = 52 + var(1)*6 + var(3)
value = 4500, 0
;channel = 1

[State 4500, VarSet]
type = VarSet
trigger1 = root, time = [50, 136]
trigger1 = root, time = 52 + var(1)*6 + var(3)
trigger1 = var(1) := var(1) + 1
var(3) = random%6 - 3

[State 4500, Helper]
type = Helper
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = (root, time-4)%8 = 0
name = "meteor"
id = 4500
stateno = 4510
postype = back
;pos = floor(-256*const(size.xscale)), floor(-224*const(size.yscale))
pos = 0, floor((-screenpos y - 96)*const(size.yscale))
ownpal = 1
size.xscale = const(size.xscale)*0.25
size.yscale = const(size.yscale)*0.25
supermovetime = 99999

[State 4500, VarSet]
type = VarSet
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = (time-3)%8 = 0
fvar(3) = 0.5 + random*0.0005

[State 4500, Explod]
type = Explod
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = (time-3)%8 = 0
trigger2 = Random < 200
trigger2 = (root, time > 50) && Time <= 130
trigger2 = ((root, command = "x") || (root, command = "y") || (root, command = "z"))
postype = back
id = 4510
anim = 4550 + 5*(root, var(23) != 0)
bindtime = 1
sprpriority = random%8 - 4
scale = fvar(3)*const(size.xscale), fvar(3)*const(size.yscale)
pos = floor(-256*const(size.xscale)), floor(-224*const(size.yscale))
random = floor(256*const(size.xscale)), floor(192*const(size.yscale))
vel = floor(8*const(size.xscale)), floor(6*const(size.yscale))
supermovetime = 99999

[State 4500, VarSet]
type = VarSet
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = (time-2)%6 = 0
fvar(3) = 0.2 + random*0.0001

[State 4500, Explod]
type = Explod
triggerall = !var(21)
trigger1 = root, time = [44, 100]
trigger1 = (time-2)%6 = 0
trigger2 = Random < 300
trigger2 = (root, time > 50) && Time <= 120
trigger2 = ((root, command = "x") || (root, command = "y") || (root, command = "z"))
postype = back
id = 4510
anim = 4551 + random%2
bindtime = 1
sprpriority = -1 - random%4
scale = fvar(3)*const(size.xscale), fvar(3)*const(size.yscale)
pos = floor(-256*const(size.xscale)), floor(-224*const(size.yscale))
random = floor(256*const(size.xscale)), floor(192*const(size.yscale))
vel = floor(8*const(size.xscale)), floor(6*const(size.yscale))
supermovetime = 99999

[State 4500, BindToParent]
type = BindToParent
trigger1 = 1


[State 4500, VarSet]
type = VarSet
trigger1 = var(11)
var(13) = 1

[State 4500, VarSet]
type = VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1

[State 4500, VarAdd]
type = VarAdd
trigger1 = var(11)
var(12) = var(11)

[State 4500, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(11)
var(38) = var(11)

[State 4500, VarSet]
type = VarSet
trigger1 = 1
var(11) = 0

[State 4500, VarSet]
type = VarSet
trigger1 = 1
var(20) = 0

[State Delay Dampening]
type = ParentVarSet
trigger1 = time
var(33) = 1
ignorehitpause = 1

;--------------------------------------------------------------------------------------
; Mystic Break Earth Attack
[Statedef 4510]
type = A
movetype = A
physics = N
movehitpersist = 1
;anim = 4500 + 10*(random%2)
sprpriority = 3

[State 4510, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 4500 + 10*(random%2)
value = 4500 + 10*(random%2)


[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow


[State 4510, HitBy]
type = HitBy
trigger1 = 1
value = SCA, AP
time = -1
ignorehitpause = 1

[State 4510, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, NP, SP
stateno = 4510
time = -1

[State 4510, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA, HP
stateno = 4511
time = -1


[State 4510, ParentVarset]
type = ParentVarSet
trigger1 = 1
var(20) = 1


[State 4510, VarSet]
type = VarSet
trigger1 = !prevstateno
trigger1 = time = 0
trigger1 = parent, fvar(1) - pos y != 0
fvar(0) = atan((parent, fvar(0) - pos x + helper(9998), fvar(0))/(parent, fvar(1) - pos y))

[State 4510, VarSet]
type = VarSet
trigger1 = !prevstateno
trigger1 = time = 0
trigger1 = parent, fvar(1) - pos y = 0
fvar(0) = pi*0.5

[State 4510, VarAdd]
type = VarAdd
trigger1 = !prevstateno
trigger1 = time = 0
fvar(0) = (random - 500)*0.0003

[State 4510, VelSet]
type = VelSet
trigger1 = !prevstateno
trigger1 = time = 0
x = 10*sin(fvar(0))*facing
y = 10*cos(fvar(0))

[State 4510, PosAdd]
type = PosAdd
trigger1 = !prevstateno
trigger1 = time = 0
x = (random*0.064 - 128)*const(size.xscale)
y = (random*0.048 - 96)*const(size.yscale)


[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1

[State 4510, 1]
type = HitDef
trigger1 = time = 0
attr = A, HP
damage = ifelse(anim = 4510,floor(50/(1 + parent, var(12)*1.7)),floor(30/(1 + parent, var(12)*1.7))), ifelse(anim = 4510,15,5)
getpower = 0
numhits = 1
priority = 7, hit
animtype = Back
guardflag = HA
hitflag = MAF
pausetime = 1, 11
sparkno =  S ifelse(anim = 4510,8007,8005)
guard.sparkno = S8142
sparkxy = 0, 0
hitsound  = S2,ifelse(anim = 4510,6,5)
guardsound = S3,0
ground.type = Low
ground.velocity = -5, -7.5
ground.hittime  = 24
ground.slidetime  = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
;air.hittime = 999
airguard.ctrltime = 999
air.velocity = -5, -6.43
airguard.velocity = -5, -6.43
air.type = Low
fall = 1
fall.recover = 0
yaccel = .536
id = 4500
envshake.time = 8
envshake.ampl = ifelse(anim = 4510,8,6)
palfx.time = 50
palfx.color = 0
palfx.mul = 256, 64, 0
palfx.sinadd = -64, -64, 0, 20
ignorehitpause = 1



[State 4510, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0;root, var(56) != gametime
value = anim
elem = animelemno(-1)
ignorehitpause = 1

[State 4510, VarAdd]
type = VarAdd
trigger1 = 1
var(3) = 1
ignorehitpause = 1


[State Interupted]
type = ChangeState
triggerall = anim = 4500
trigger1 = Movecontact = 1
trigger2 = pos y > 0 && vel Y >0
value = 4511
ignorehitpause = 1

[State Interupted]
type = ChangeState
triggerall = anim = 4510
trigger1 = pos y > 0 && vel Y >0
value = 4511
ignorehitpause = 1


[State 4510, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist < -100
;trigger2 = pos y > 50

;-------------------------------------------------------------------------------
; Mystic Break Disappear
[Statedef 4511]
type = A
physics = N
movetype = I
anim = 9999
ignorehitpause = 1

[State 4511, PlaySnd]
type = PlaySnd
trigger1 = NumExplod(8005) = 1
trigger1 = time = 1
value = S3,1
persistent = 1

[State 4510, Explod]
type = Explod
trigger1 = NumExplod(8005) = 0
trigger1 = pos y > 0
anim = 8005
sprpriority = -4
pos = 0,5
bindtime = 1
ownpal = 1
id = 8005
name = "Dust"
scale = .5,.5
pausemovetime = 999999
supermovetime = 999999
persistent = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4511, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = 3, 4
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4511, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = 4, -3
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4511, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = -3, 4
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4511, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = -4, -3
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4511, Helper]
type = Helper
trigger1 = time%3 = 0
helpertype = normal ;player
name = "Dedris1"
ID = 4512
stateno = 4512
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime = 99999
pausemovetime = 99999
size.xscale = const(size.xscale)
size.yscale = const(size.yscale)


[State 4511, DestroySelf]
type = DestroySelf
trigger1 = time >3
ignorehitpause = 1

;--------------------------------------------------------------------------
; Homura Tsumuji - Hyper (Attack)
; CNS difficulty: easy
[Statedef 4512]
type    = A
velset = 0,0
anim = 4520 + 10*(random%3)
sprpriority = 2

[State 1002, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 0, Turn]
type = Turn
trigger1 = random>700
trigger1 = time <= 0

[State 1002, NotHitBy]
type = NotHitBy
trigger1 = time>=0
value = SCA
time = -1

[State 6210]
type = VelSet
trigger1 = Time = 0
x = IfElse(random<500,2+random%4,-2-random%4)
y = -4-random%4


[State 6210]
type = VelAdd
trigger1 = 1
y = 0.3


[State 6210]
type = VelSet
trigger1 = Pos Y >= 0 && Vel Y > 0
x =  IfElse(random<500,1+random%2,-1-random%2)
y = -2-random%3
persistent = 0


[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 4513
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 4513]
type   = U
velset = 0,0
sprpriority = 2

[State 1002, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>20
trigger1 = time%3 = 0
flag = invisible


[State 1002, NotHitBy]
type = NotHitBy
trigger1 = time>=0
value = SCA
time = -1

[State 6210]
type = VelSet
trigger1 = Time = 0
x = IfElse(random<500,1+random%2,-1-random%2)
y = 5


[State 6210]
type = VelAdd
trigger1 = 1
y = 0.3

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time >= 30
;-------------------------------------------------------------------------------
; Mystic Break Hit
[Statedef 4512]
type = A
physics = N
movetype = I
anim = 9999
movehitpersist = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4512, Fire FX]
type = Explod
trigger1 = !time
trigger1 = !(parent, var(12)%2)
trigger1 = numtarget
trigger1 = !target, gethitvar(guarded)
id = 7050
anim = 7050 + random%3
sprpriority = 2
postype = p2
bindtime = 45
pos = 0, floor(target, const(size.mid.pos.y))
random = floor((target, const(size.ground.front)+target, const(size.ground.back))*(parent, var(12) != 0)*0.4), floor((target, const(size.mid.pos.y)-target, const(size.head.pos.y))*(parent, var(12) != 0)*0.8)
ignorehitpause = 1
ownpal = 1
persistent = 0

[State 4512, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = parent, var(10) < 1
var(10) = ifelse(movehit = 1, 1, -1)
ignorehitpause = 1
persistent = 0

[State 4512, ParentVarAdd]
type = ParentVarAdd
triggerall = !time
triggerall = movehit = 1
trigger1 = numtarget
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
var(11) = 1
ignorehitpause = 1
persistent = 0

[State 4512, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = numtarget
fvar(10) = target, pos x
ignorehitpause = 1
persistent = 0

[State 4512, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = !numtarget
fvar(10) = enemynear, pos x
ignorehitpause = 1
persistent = 0

[State 4512, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = 3, 4
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4512, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = 4, -3
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4512, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = -3, 4
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4512, Explod]
type = Explod
trigger1 = !time
anim = 4520 + 10*(random%3)
id = 4510
bindtime = 1
accel = 0, 0.4
vel = -4, -3
sprpriority = 2
scale = const(size.xscale), const(size.yscale)

[State 4512, DestroySelf]
type = DestroySelf
trigger1 = time
ignorehitpause = 1

;-------------------------------------------------------------------------------
;===============================================================================
;-------------------------------------------------------------------------------
; Mystic Break Poison Spawner
[Statedef 4600]
type = S
movetype = A
physics = N
anim = 9999



[State 4600, VarSet]
type = VarSet
trigger1 = root, time > 43
trigger1 = time%5 = 0
fvar(3) = 0.5 + random*0.001

[State 4600, Explod]
type = Explod
trigger1 = root, time > 43
trigger1 = time%5 = 0
postype = left
id = 4610
anim = 4640 + (root, var(23) != 0)
bindtime = 1
sprpriority = -4
scale = fvar(3)*const(size.xscale), fvar(3)*const(size.yscale)
pos = 160, floor(root, screenpos y - 120)
random = 320, 240
supermovetime = 99999

[State 4600, VarSet]
type = VarSet
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
var(0) = 64 + 64*((root, time-44)/9)

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := 0 || 1
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.125
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.875
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.25
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.75
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.375
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.625
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.5
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.5
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = 3
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.625
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.375
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.75
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.25
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*0.875
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [62, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi*1.125
postype = p1
id = 4610
anim = ifelse(root, time = 71, 4620, 4610) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, Explod]
type = Explod
trigger1 = root, time = [44, 71]
trigger1 = (root, time+10)%9 = 0
trigger1 = fvar(3) := pi
postype = p1
id = 4610
anim = ifelse(root, time = 44, 4600, ifelse(root, time = 71, 4620, 4610)) + (root, var(23) != 0)
bindtime = 1
sprpriority = -2
pos = floor(var(0)*sin(fvar(3))*const(size.xscale)), floor(0.1*var(0)*cos(fvar(3))*const(size.yscale))
supermovetime = 99999
scale = 1.33, 1.33

[State 4600, PlaySnd]
type = PlaySnd
trigger1 = root, time = 44
value = 4600, 0
;channel = 1
persistent = 0

[State 4600, Helper]
type = Helper
trigger1 = root, time = 44
name = "clouds"
id = 4600
stateno = 4610
ownpal = 1
supermovetime = 99999

[State 4600, Helper]
type = Helper
trigger1 = root, time = [53, 71]
trigger1 = (root, time+10)%9 = 0
name = "clouds"
id = 4600
stateno = 4610
ownpal = 1
pos = 0, -6 -3*((root, time-44)/9)
supermovetime = 99999

[State 4600, Helper]
type = Helper
trigger1 = root, time = [53, 71]
trigger1 = (root, time+10)%9 = 0
name = "clouds"
id = 4600
stateno = 4610
ownpal = 1
pos = 0, 4 + 2*((root, time-44)/9)
supermovetime = 99999

[State 4600, BindToParent]
type = BindToParent
trigger1 = 1
pos = floor(8*const(size.xscale)), 0


[State 4600, VarSet]
type = VarSet
trigger1 = var(11)
var(13) = 1

[State 4600, VarSet]
type = VarSet
trigger1 = !time
trigger1 = root, var(38) > (root, movehit > 0)
var(12) = 1

[State 4600, VarAdd]
type = VarAdd
trigger1 = var(11)
var(12) = var(11)

[State 4600, ParentVarAdd]
type = ParentVarAdd
trigger1 = var(11)
var(38) = var(11)

[State 4600, VarSet]
type = VarSet
trigger1 = 1
var(11) = 0

[State 4600, VarSet]
type = VarSet
trigger1 = 1
var(20) = 0


[State 4601, DestroySelf]
type = DestroySelf
trigger1 = parent, anim != 4050
trigger2 = parent, stateno != 4050
trigger3 = parent, Movetype = H

;--------------------------------------------------------------------------------------
; Mystic Break Poison Attack
[Statedef 4610]
type = S
movetype = A
physics = N
movehitpersist = 1
sprpriority = 3


[State 4610, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 4602 + ((root, time-44)/9)

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4610, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 4610, ParentVarset]
type = ParentVarSet
trigger1 = 1
var(20) = 1



[State Damage Bonus]
type = AttackMulSet
trigger1 = 1
value = (0.7 + 0.3*root, fvar(13))*ifelse(root, var(20), 1 + (root, var(20) - 1)*root, fvar(15), 1)
ignorehitpause = 1

[State 4610, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, HP
damage = 24, 6
getpower = 0
givepower = -floor(44/(1 + parent, var(12)*0.2)), floor(0.3*(56/(1 + parent, var(12)*0.2)))
numhits = 1
priority = 7, hit
animtype = Back
guardflag = LA
hitflag = MAF
pausetime = 1, 19
guard.pausetime = 0, 9
sparkno = S4640
guard.sparkno = S4640
sparkxy = floor((ifelse(pos y < 0, 16, -16) - (anim%100)*16)*const(size.xscale)), floor(-8*const(size.xscale))
hitsound   = -1
guardsound = -1
ground.type = Low
ground.velocity = -5, -7.5
ground.hittime  = 24
ground.slidetime  = 24
ground.cornerpush.veloff = 0
guard.velocity = -12.5
guard.hittime = 23
airguard.ctrltime = 999
air.velocity = -5, -7.5
airguard.velocity = -3, -6.43
air.type = Low
fall = 1
fall.recover = 0
fall.animtype = Heavy
yaccel = .536
id = 4600
palfx.time = 50
palfx.color = 128
palfx.mul = 128, 64, 160
palfx.add = 160, 0, 128
palfx.sinadd = 64, 64, 64, 20
ignorehitpause = 1

[State 8150, Smoock Hit]
type = helper
trigger1 = !numhelper(8150);!numhelper(8301);!numhelper(8302)
trigger1 = numtarget&&MoveHit
trigger1 = target,movetype = H &&!target,time
trigger1 = var(48):=(target,ID)
helpertype = normal
stateno = 8150
ID = 8150
name = "PoisonHit1"
postype = p2
pos = 0,25
bindtime = -1
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 1

[State 8150, Smoock Hit]
type = helper
trigger1 = !numhelper(8151);!numhelper(8301);!numhelper(8302)
trigger1 = numtarget&&MoveHit
trigger1 = target,movetype = H &&!target,time
trigger1 = var(48):=(target,ID)
helpertype = normal
stateno = 8151
ID = 8151
name = "PoisonHit2"
postype = p2
pos = 0,25
bindtime = -1
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 1

[State 1210, targetstate]
type = targetstate
trigger1 = root, var(25) !=3
trigger1 = movehit = 1
value = 4615
ignorehitpause=1

[State 4610, ChangeState]
type = ChangeState
triggerall = movecontact = 1
triggerall = time || prevstateno != 4612
triggerall = numtarget || p2movetype = H
trigger1 = numtarget != 1
trigger2 = numtarget = 1
trigger2 = !target, ishelper
value = 4612
ignorehitpause = 1

[State 4610, ChangeState]
type = ChangeState
trigger1 = movereversed = 1
value = 4612
ignorehitpause = 1


[State 4610, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = root, movetype = H
ignorehitpause = 1

;-------------------------------------------------------------------------------
; Mystic Break Hit
[Statedef 4612]
type = A
physics = N
movetype = I
anim = 9999
movehitpersist = 1

[State NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow

[State 4612, Poison FX]
type = Explod
trigger1 = !time
trigger1 = pos y < 1
trigger1 = numtarget
trigger1 = !target, gethitvar(guarded)
id = 7080
anim = 7080 + random%3
sprpriority = 2
postype = p2
bindtime = 53
pos = 0, target, const(size.head.pos.y)/2
random = floor((target, const(size.ground.front)+target, const(size.ground.back))*(parent, var(12) != 0)*0.4), floor(-target, const(size.head.pos.y)*(parent, var(12) != 0)*0.7)
ignorehitpause = 1
ownpal = 1
persistent = 0

[State 4612, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = parent, var(10) < 1
var(10) = ifelse(movehit = 1, 1, -1)
ignorehitpause = 1
persistent = 0

[State 4612, ParentVarAdd]
type = ParentVarAdd
triggerall = !time
triggerall = movehit = 1
trigger1 = numtarget
trigger2 = p2movetype = H
trigger2 = enemynear, time < 1
var(11) = 1
ignorehitpause = 1
persistent = 0

[State 4612, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = numtarget
fvar(10) = target, pos x
ignorehitpause = 1
persistent = 0

[State 4612, ParentVarset]
type = ParentVarSet
triggerall = !time
trigger1 = var(10)
trigger1 = !numtarget
fvar(10) = enemynear, pos x
ignorehitpause = 1
persistent = 0

[State 4612, DestroySelf]
type = DestroySelf
trigger1 = time
ignorehitpause = 1

;-------------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 4615]
type    = S
movetype = H
physics = S

[State 4615, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 4615, PosSet]
type = velSet
trigger1 = time = 0
y = 0


[State 4615, 1]
type = HitVelSet
trigger1 = Time = 0
x = 3
;y= 0

[State 4615, ChangeAnim]
type = ChangeAnim
Trigger1 = time = 0
value = 5011


[State 4615, VelMul] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 4615, VelSet]
type = VelSet
trigger1 = time = 100
x = 0

[State 4615, DefenceMulSet]
type = DefenceMulSet
trigger1 = HitOver
value = 1


;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
trigger1 = gametime%30<20
time = 1
add = 100,0,100
mul = 120,20,124
sinadd = 85,110,55,5
invertall = 0
color = 0


;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
trigger1 = gametime%30>20
time = 1
add = 0,100,50
mul = 20,120,24
sinadd = 85,110,55,5
invertall = 0
color = 0

[State 4615, ChangeAnim]
type = ChangeAnim
Trigger1 = time = 20
value = ifelse((selfanimexist(5300)),5300,5002)


[State 4615, LifeAdd Normal Damage]
type = LifeAdd
trigger1 = enemynear,var(25) = 0
trigger1 = time%5 = 0
value = -2

[State 4615, LifeAdd Fraqueza]
type = LifeAdd
trigger1 = enemynear,var(25) = 1
trigger1 = time%5 = 0
value = -3

[State 4615, LifeAdd Resistencia]
type = LifeAdd
trigger1 = enemynear,var(25) = 2
trigger1 = time%5 = 0
value = -1

[State 4615, LifeAdd Imunidade]
type = LifeAdd
trigger1 = enemynear,var(25) = 3
trigger1 = time%5 = 0
value = 1


[State 4615, ChangeState]
type = ChangeState
triggerall = life <= 0
trigger1 = time = 85
value = 5050
ctrl = 0


[State 4615, 1]
type = Selfstate
triggerall = life > 0
trigger1 = time = 185
value = 5100
ctrl = 1
