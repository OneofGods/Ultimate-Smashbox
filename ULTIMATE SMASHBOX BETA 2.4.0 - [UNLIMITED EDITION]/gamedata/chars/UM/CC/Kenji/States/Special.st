;===============================================================================
;===============================<SPECIAL MOVES>=================================
;===============================================================================
;Projectile
[Statedef 1000]
type = S
movetype = A
physics = S
anim = 1000
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd = 72*!var(20)
facep2 = 1

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1000, ifElse(var(10) = 1, 1001, 1002))


[State VarSet]
type = VarSet
trigger1 = numtarget
trigger1 = time = 0
v = 5
value = target, ID
ignorehitpause = 1


[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1


[State 1000, Explod]
type = Explod
trigger1 = random<500
trigger1 = time = 3
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8550
scale = 1,1
pausemovetime = 999999
supermovetime = 999999


[State 1000, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-50*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1


[State 1000, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-50*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-45*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1



[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-50*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-66*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1


[State -3,Super]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-58*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(56*const(size.xscale)),ceil(-45*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1005
name = "ichimonji"
pos = ceil(66*const(size.xscale)),ceil(-60*const(size.yscale))
postype = P1
stateno = 1005
helpertype = normal
keyctrl = 0
ownpal = 1


[State 1000, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1005]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1005
sprpriority = 4

[State VarSet]
type = VarSet
trigger1 = numtarget
trigger1 = time = 0
v = 5
value = target, ID
ignorehitpause = 1


[State 1005, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = -1


[State 1005, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA,AA,AP
time = -1


[State 1005, VelSet]
type = posadd
triggerall = time = 0
trigger1 = random < 300
x = 10

[State 1005, VelSet]
type = posadd
triggerall = time = 0
trigger1 = random < 300
x = -15

[State 1005, VelSet]
type = posadd
triggerall = time =0
trigger1 = random < 300
x = 15

[State 1005, VelSet]
type = VelSet
triggerall = parent, var(10) = 0
trigger1 = time = 0
x = 4+random%2

[State 1005, VelSet]
type = VelSet
triggerall = parent, var(10) = 1
trigger1 = time = 0
x = 6+random%2

[State 1005, VelSet]
type = VelSet
triggerall = parent, var(10) = 2
trigger1 = time = 0
x = 8+random%2


[State 0, VelSet]
type = VelSet
triggerall = parent, anim = 1030
trigger1 = time = 0
x = 5


[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = S, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAF
pausetime = 1,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -3
guard.velocity = -3
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,-2
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand=1
id = 30
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1006
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1


[State 1005, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1006]
type    = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2

[State 1006,Projecil End]
type = explod
trigger1 = time = 0
anim = 1006
id = 1006
pos = 15-(abs(const(size.mid.pos.x)))+random%10,pos y
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[state 8100,varset]
type = varset
trigger1 = time = 0
var(4) = parent,var(4)
ignorehitpause = 1
persistent = 1

[State 8100,bind]
type = posset
trigger1 = playerIDexist(var(4))
x = floor(playerID(var(4)), pos X)
y = floor((playerID(var(4)), pos Y)+(playerID(var(4)), const(size.mid.pos.y)/4))-20

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1


[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;--------------------------------------------------------------------------
; Homura Tsumuji - Hyper (Attack)
; CNS difficulty: easy
[Statedef 1007]
type    = A
velset = 0,0
anim = 1007
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
x = IfElse(random<500,1+random%2,-1-random%2)
y = -2-random%3


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


[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1008
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1008]
type    = A
velset = 0,0
anim = 1010+random%4
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

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 5+random%5

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time = 30
;-----------------------------------------------------------------------------
;Ichimonji (Midair)
;CNS difficulty: easy
[Statedef 1050]
type    = A
movetype = A
physics = A
juggle  = 4
poweradd= 30
ctrl = 0
anim = 1050
sprpriority = 2

[State 1000, Button Detect]
type = VarSet
trigger1 = !Time && !AILevel
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (p2bodydist x = [-35,220])
var(10) = ifElse((P2MoveType = H || Random < 500), 2, ifElse(Random < 500, 1, 0))


[State 1000, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (p2bodydist x >220)
var(10) = 2

[State 1000, ChangeAnim]
type = ChangeAnim
trigger1 = !Time
value = ifElse(var(10) = 0, 1050, ifElse(var(10) = 1, 1051, 1052))

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
physics = N

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 12
movetype = I
physics = A

[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(5) = 0
trigger1 = vel Y > 0 && time <=30;anim >= 1
x = -1
y = -2


[State 0, VelSet]
type = VelSet
trigger1 = animelemtime(5) = 0
trigger1 = vel Y < 0 && time <=30;anim >= 1
x = -1
y = 1


[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1000,0

[State 1000, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 1000,1


[State 1000, Helper]
type = Helper
trigger1 = AnimElem = 5
id = 1060
name = "ichimonji"
pos = ceil(-54*const(size.xscale)),ceil(-77*const(size.yscale))
postype = P1
stateno = 1060
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = AnimElem = 5
id = 1060
name = "ichimonji"
pos = ceil(-39*const(size.xscale)),ceil(-75*const(size.yscale))
postype = P1
stateno = 1061
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1000, Helper]
type = Helper
trigger1 = AnimElem = 5
id = 1060
name = "ichimonji"
pos = ceil(-20*const(size.xscale)),ceil(-71*const(size.yscale))
postype = P1
stateno = 1062
helpertype = normal
keyctrl = 0
ownpal = 1


[State 1000, Helper]
type = Helper
triggerall = AnimElem = 5
trigger1 = var(10) = 1
trigger2 = var(10) = 2
id = 1060
name = "ichimonji"
pos = ceil(20*const(size.xscale)),ceil(-72*const(size.yscale))
postype = P1
stateno = 1063
helpertype = normal
keyctrl = 0
ownpal = 1


[State 1000, Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = AnimElem = 5
id = 1060
name = "ichimonji"
pos = ceil(51*const(size.xscale)),ceil(-80*const(size.yscale))
postype = P1
stateno = 1064
helpertype = normal
keyctrl = 0
ownpal = 1


[State 350]
type = ChangeState
trigger1 = AnimElem = 18,>1 && Vel Y>0 && Pos Y>=-Vel Y
trigger2 = pos y >=0 && vel Y >0
value = 52
;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1060]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 0,8
anim = 1060
sprpriority = 4


[State 1060, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1
ignorehitpause = 1

[State 1060, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = 1
ignorehitpause = 1


[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = A, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAFDL
pausetime = 2,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -2
guard.velocity = -2
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,8
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1065
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1070
IgnoreHitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40

;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1061]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 3,7
anim = 1061
sprpriority = 4


[State 1061, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1
ignorehitpause = 1

[State 1061, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = 1
ignorehitpause = 1



[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = A, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAFDL
pausetime = 2,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -2
guard.velocity = -2
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,8
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1066
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1071
IgnoreHitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1062]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 6,6
anim = 1062
sprpriority = 4


[State 1062, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1
ignorehitpause = 1

[State 1062, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = 1
ignorehitpause = 1


[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = A, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAFDL
pausetime = 2,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -2
guard.velocity = -2
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,8
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1067
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1072
IgnoreHitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1063]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 7,3
anim = 1063
sprpriority = 4


[State 1063, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1
ignorehitpause = 1

[State 1063, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = 1
ignorehitpause = 1



[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = A, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAFDL
pausetime = 2,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -2
guard.velocity = -2
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,8
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1068
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1073
IgnoreHitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
;-------------------------------------------------------------------------------
;Projectile X
[Statedef 1064]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 8,0
anim = 1064
sprpriority = 4


[State 1064, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1
ignorehitpause = 1

[State 1064, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = 1
ignorehitpause = 1


[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = A, SP
damage = 20,3
animtype = Medium
guardflag = MA
hitflag = MAFDL
pausetime = 2,4
sparkno = S8400+random%8
guard.sparkno = S8141
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 15
guard.slidetime = 15
ground.hittime  = 15
guard.hittime  = 15
air.hittime = 13
ground.velocity = -2
guard.velocity = -2
airguard.velocity = -1,-2
air.type = Low
air.velocity = -1,8
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 4


[State 1005, 3]
type = Changestate
trigger1 = Movehit
value = 1069
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded
value = 1007
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Pos Y >= 5+random%5 && Vel Y > 0
value = 1074
IgnoreHitpause = 1

[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40
;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1065]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1065
ctrl = 0
sprpriority = 2


[State 1065, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 3)
channel = 2
ignorehitPause = 1

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>10
trigger1 = time%3 = 0
flag = invisible


[State 1006, destroyself]
type = destroyself
trigger1 = time >= 30

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1066]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1066
ctrl = 0
sprpriority = 2


[State 1066, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 3)
channel = 2
ignorehitPause = 1

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>10
trigger1 = time%3 = 0
flag = invisible

[State 1006, destroyself]
type = destroyself
trigger1 = time >= 30
;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1067]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1067
ctrl = 0
sprpriority = 2


[State 1067, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 3)
channel = 2
ignorehitPause = 1

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>10
trigger1 = time%3 = 0
flag = invisible

[State 1006, destroyself]
type = destroyself
trigger1 = time >= 30
;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1068]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1068
ctrl = 0
sprpriority = 2


[State 1068, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 3)
channel = 2
ignorehitPause = 1

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>10
trigger1 = time%3 = 0
flag = invisible

[State 1006, destroyself]
type = destroyself
trigger1 = time >= 30
;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 1069]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1069
ctrl = 0
sprpriority = 2


[State 1069, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 1006, HitSound]
type = PlaySnd
trigger1 = MoveContact = 1 && NumTarget
trigger1 = !(Target, HitShakeOver)
value = ifElse(MoveGuarded, 3, 1000), ifElse(MoveGuarded, 0, 3)
channel = 2
ignorehitPause = 1

[State 1006, posset]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1006, posset]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1002, AssertSpecial]
type = AssertSpecial
triggerall = time>10
trigger1 = time%3 = 0
flag = invisible

[State 1006, destroyself]
type = destroyself
trigger1 = time >= 30
;-------------------------------------------------------------------------------
[Statedef 1070]
type    = A
velset = 0,0
anim = 1065
sprpriority = 2


[State 1070, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1070, AssertSpecial]
type = AssertSpecial
triggerall = time>20
trigger1 = time%3 = 0
flag = invisible


[State 1070, NotHitBy]
type = NotHitBy
trigger1 = time>=0
value = SCA
time = -1

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 1+random%5

[State 1070, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 1070, DestroySelf]
type = DestroySelf
trigger1 = time >= 30

;-------------------------------------------------------------------------------
[Statedef 1071]
type    = A
velset = 0,0
anim = 1066
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

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 1+random%5

[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time >= 30
;-------------------------------------------------------------------------------
[Statedef 1072]
type    = A
velset = 0,0
anim = 1067
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

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 1+random%5

[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time >= 30

;-------------------------------------------------------------------------------
[Statedef 1073]
type    = A
velset = 0,0
anim = 1068
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

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 1+random%5

[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time >= 30

;-------------------------------------------------------------------------------
[Statedef 1074]
type    = A
velset = 0,0
anim = 1069
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

[State 1005, VelSet]
type = posadd
trigger1 = time = 0
y = 1+random%5

[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
channel = 2

[State 1002, DestroySelf]
type = DestroySelf
trigger1 = time >= 30

;---------------------------------------------------------------------------
;Enryusho
[Statedef 1100]
type = S
moveType = A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 1
poweradd =72*!var(20)
facep2 = 1

[State 1100, Button]
type = varset
trigger1 = !time && !AILevel
var(10) = ifelse((command="c" || command="rlsc"), 2, ifelse((command="b" || command="rlsb"), 1, 0))

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (p2bodydist x = [95,110])
var(10) = 0

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (p2bodydist x = [180,190])
var(10) = 1

[State 1100, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (p2bodydist x = [255,275])
var(10) = 2


[State 1100, ChangeAnim]
type = ChangeAnim
trigger1 = !time
value = ifelse(var(10) =0,1100,ifelse(var(10) =1,1101,1102))


[State 1100, Explod]
type = Explod
trigger1 = random<500
trigger1 = time = 5
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
scale = 1,1
pausemovetime = 999999
supermovetime = 999999

[State 1100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 1600,1
channel = 0

[State 1100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 4
value = 1600,0
channel = 1

[State 1100, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = animelem = 7
helpertype = normal ;player
name = "Geyser"
ID = 1110
stateno = 1110
pos = 105,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1100, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = animelem = 7
helpertype = normal ;player
name = "Geyser"
ID = 1110
stateno = 1110
pos = 185,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1100, Helper]
type = Helper
trigger1 = var(10) = 2
trigger1 = animelem = 7
helpertype = normal ;player
name = "Geyser"
ID = 1110
stateno = 1110
pos = 265,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1

[State 1100, Explod]
type = Explod
trigger1 = animelem = 4
anim = 1105
ID = 1105
pos = 100,-40
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 2,1
removetime = -2
scale = .3,.3
angle = 20
sprpriority = 5
ownpal = 1


[State 1100, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Enryusho Geyser
[Statedef 1110]
type  = S
movetype = A
physics = N
ctrl = 0
juggle = 15
velset = 0,0
sprpriority = 4

[State 1110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 1110
value = 1110

[State 1110, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,1


[State 1110, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
ampl = 10

[State 1110, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1110, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 1110, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AP
time = -1
ignorehitpause = 1
persistent = 1

[State 1110, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,AP
stateno = 1111
time = -1
ignorehitpause = 1
persistent = 1

[State 1510, Button Detect Damage]
type = VarSet
trigger1= !Time && !PrevStateNo
var(22) = Root,var(22)


[State 1110, HitDef Normal Damage]
type = HitDef
triggerall = var(22) != 1
triggerall = var(22) != 2
triggerall = var(22) != 3
trigger1 = Time < 35
Trigger1 = !MoveHit
Trigger1 = time%7 = 0
Trigger1 = hitcount<3
attr = S, SP
damage = 70+random%15,3
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,6
sparkno = S8006
guard.sparkno = S8141
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime  = 10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 13
ground.velocity = -1,-10
guard.velocity = -3
airguard.velocity = -2,-3
air.type = Low
air.velocity = -1,-9
yaccel = .38
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 8
envshake.ampl = 7
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1


[State 1110, HitDef Minimo e Max Damage]
type = HitDef
triggerall = Time < 35
Triggerall = !MoveHit
Triggerall = time%7 = 0
Triggerall = hitcount<3
trigger1 = var(22) = 1
trigger2 = var(22) = 2
attr = S, SP
damage = ifelse(parent,var(22)=1,85+random%15,55+random%15)
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,ifelse(parent,var(22)=1,8,4)
sparkno = S8006
guard.sparkno = S8141
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = ifelse(parent,var(22)=1,18,5)
ground.hittime = ifelse(parent,var(22)=1,18,5)
guard.slidetime = ifelse(parent,var(22)=1,14,5)
guard.hittime  = ifelse(parent,var(22)=1,18,8)
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = ifelse(parent,var(22)=1,18,8)
ground.velocity = -1,-10
guard.velocity = -3
airguard.velocity = -2,-3
air.type = Low
air.velocity = -1,-9
yaccel = .38
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 8
envshake.ampl = ifelse(parent,var(22)=1,9,5)
sprpriority = 5
palfx.time = ifelse(parent,var(22)=1,60,50)
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1


[State 1110, HitDef No Damage]
type = HitDef
trigger1 = var(22)= 3
trigger1 = Time < 35
Trigger1 = !MoveHit
Trigger1 = time%7 = 0
Trigger1 = hitcount<3
attr = S, SP
damage = 20+random%15,0
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,6
sparkno = S8006
guard.sparkno = S8141
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime  = 10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 13
ground.velocity = -1,-6
guard.velocity = -3
airguard.velocity = -2,-3
air.type = Low
air.velocity = -1,-4
yaccel = .38
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 8
envshake.ampl = 2
palfx.time = 20
palfx.add = 100,100,100
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 256


;HELPER FIRE STRONG
[state 8100, Fire Sparks]
type = helper
triggerall = Var(22)!= 3
trigger1 = !numhelper(8100)
trigger1 = numtarget&&movehit
trigger1 = target,movetype=H&&!target,time
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
;Kenji

[State 1110, Explod]
type = Explod
trigger1 = time = 0
anim = 1115
ID = 1115
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = 1,1
sprpriority = -1


[State 1110, ChangeState]
type = ChangeState
trigger1 = time >= 35
value = 1111

;-------------------------------------------------------------------------------
; Enryusho Geyser End
[Statedef 1111]
type  = S
movetype = A
physics = N
ctrl = 0
anim = 1111
sprpriority = 4

[State 1111, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 1111, AngleDraw]
type = AngleDraw
trigger1 = Time >= 0
scale = 1-(0.05*(time-0)),1

[State 1111, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1111, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 1115

[State 3910, PosSet]
type = PosSet
trigger1 = IsHelper(3910)
y = 0

[State 3910, PosSet]
type = PosSet
trigger1 = IsHelper(3911)
y = 15

[State 3910, PosSet]
type = PosSet
trigger1 = IsHelper(3912)
y = 15

[State 3910, PosSet]
type = PosSet
trigger1 = IsHelper(3913)
y = -15

[State 3910, PosSet]
type = PosSet
trigger1 = IsHelper(3914)
y = -15

[State 1111, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 1111, NotHitBy]
type = NotHitBy
trigger1 = time>=0
value = SCA
time = 1
ignorehitpause = 1
persistent = 1

[State 1111, DestroySelf]
type = DestroySelf
trigger1 = time >= 20

;---------------------------------------------------------------------------
; Tsumuji Start
[Statedef 1200]
type = S
movetype = A
physics = S
anim = 1200
ctrl = 0
velset = 0,0
sprpriority = 1
powerAdd = 72 * !var(20)


[State 1200, Button]
type=varset
trigger1= !time
var(10) = ifElse((command = "x" || command = "rlsx"), 0, ifElse((command = "y" || command = "rlsy"), 1, 2))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 0, ifElse(P2Dist x > 150, 1, 2))

[State 1100, Anim]
type=changeanim
trigger1= !time
value= ifelse(var(10)=0, 1200, ifelse(var(10)=1, 1201, 1202))


[State 1200, Explod]
type = Explod
trigger1 = random<500
trigger1 = time = 5
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
scale = 1,1
pausemovetime = 999999
supermovetime = 999999


[State 1200, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,0
;channel = 1


[State 1200, Helper]
type = Helper
trigger1 = AnimElem = 8
id = 1210
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 1210
helpertype = normal
keyctrl = 0
ownpal = 1


[State 1200, ChangeState]
type = ChangeState
triggerall = animtime = 0
trigger1 = var (10) = 0
trigger1 = time >= 60
trigger2 = var (10) = 1
trigger2 = time >= 78
trigger3 = var (10) = 2
trigger3 = time >= 92
value = 1205

;---------------------------------------------------------------------------
; Tsumuji End
[Statedef 1205]
type = S
movetype = A
physics = S
anim = 1205
ctrl = 0
velset = 0,0
sprpriority = 1
facep2=1

[State 1201, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Wait
[StateDef 1210]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 1210
sprpriority = 4

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1210, BindToParent]
type = BindToParent
trigger1 = 1
pos = const(size.xscale),const(size.yscale)


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 1300,1
channel = 16

[State 1210, Explod]
type = Explod
trigger1 = time = 15
anim = 1215
ID = 1215
pos = 30,20
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = .5,.5
sprpriority = 5
ownpal = 1


[State 210, 2]
type = HitDef
trigger1 = time%10 = 0
attr = S, SP
animtype  = light
damage  = 5,2
guardflag = MA
pausetime = 0,0
hitsound = -1
guardsound = S3,0
sparkno = -1 + 0 * (var(33) := 8013)
guard.sparkno = S8141
sparkxy = -10 + 0 * (var(35) := 55), var(36) := -72
ground.type = High
ground.slidetime = 10
ground.hittime  = 10
cornerpush = 0
guard.slidetime = 10
guard.hittime  = 10
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 13
ground.velocity = -1
guard.velocity = -3
airguard.velocity = -3
air.type = Low
air.velocity = -5,-6
yaccel = .5
air.fall = 0
fall.recover = 0
air.recover = 0
forcestand = 1
sprpriority = 4


[State 0, Explod]
type = Explod
trigger1 = movehit = 1
anim = 8020
ID = 8020
pos = -10 + 0 * (var(35) := 55), var(36) := -82
random = 30,30
postype = p2  ;p2,front,back,left,right
facing = 1
removetime = -2
pauseMoveTime = -1
superMoveTime = -1
scale = .6,.6
sprpriority = 9
ontop = 1
ownpal = 1


[State 0, Helper]
type = Helper
trigger1 = animelem = 16
helpertype = normal ;player
stateno = 1212
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0

[State 0, Helper]
type = Helper
trigger1 = animelem = 18
helpertype = normal ;player
stateno = 1213
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0

[State 1210, targetstate]
type = targetstate
trigger1 = parent,var(10) = 0
trigger1 = movehit = 1
value = 1215
ignorehitpause=1
[State 1210, targetstate]
type = targetstate
trigger1 = parent,var(10) = 1
trigger1 = movehit = 1
value = 1216
ignorehitpause=1
[State 1210, targetstate]
type = targetstate
trigger1 = parent,var(10) = 2
trigger1 = movehit = 1
value = 1217
ignorehitpause=1


[State 0, Projectile]
type = Projectile
trigger1 = animelemtime(15)>=0
trigger1 = time%6 = 0
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = 1,1
velocity = 3+random%2,-2-random%4
remvelocity = 0,0
accel = -.05,IfElse(random<500,0.2,0.3)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 60+random%5,-50+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 0, ChangeState]
type = ChangeState
trigger1 = parent, movetype = H
trigger1 = animelemtime(15)>=0
trigger2 = parent, stateno != 1200
value = 1211
ctrl = 0

[State 0, ChangeState]
type = ChangeState
trigger1 = parent, movetype = H
trigger1 = animelemtime(15)<0
value = 1212
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 1211]
physics = N
anim = 1211
velset = 0,0
sprpriority = 3

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 16

[State 1211, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 1
y = .5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1211, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 1215

[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;-------------------------------------------------------------------------------
[Statedef 1212]
physics = N
anim = 1212
velset = 0,0
sprpriority = 5

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 16

[State 1211, VelSet]
type = VelSet
trigger1 = animelem = 2
x = 1+random%2
y = .4+random%2

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1212, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 1215


[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;-------------------------------------------------------------------------------
[Statedef 1213]
physics = N
anim = 1213
velset = 0,0
sprpriority = 5

[State 0, StopSnd]
type = StopSnd
trigger1 = time = 0
channel = 16

[State 1211, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 1+random%2
y = -3.5

[State 0, VelAdd]
type = VelAdd
trigger1 = 1
x = 0
y = .1

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;-------------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 1215]
type    = S
movetype = H
physics = S

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PosSet]
type = velSet
trigger1 = time = 0
y = 0


[State 25001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 3
;y= 0

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 0
value = 5001


[State 25001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 25001, 4]
type = VelSet
trigger1 = time = 100
x = 0

[State 25001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 25001, 2]
type = null;ChangeAnim2
trigger1 = Time = 0
value = 1240

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 20
value = ifelse((selfanimexist(5300)),5300,5002)

[State 2010, ChangeState]
type = ChangeState
triggerall = life <= 0
trigger1 = time = 85
value = 5050
ctrl = 0


[State 2010, 1]
type = Selfstate
triggerall = life > 0
trigger1 = time = 75
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 1216]
type    = S
movetype = H
physics = S

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PosSet]
type = velSet
trigger1 = time = 0
y = 0


[State 25001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 3
;y= 0

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 0
value = 5001


[State 25001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 25001, 4]
type = VelSet
trigger1 = time = 100
x = 0

[State 25001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 25001, 2]
type = null;ChangeAnim2
trigger1 = Time = 0
value = 1240

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 20
value = ifelse((selfanimexist(5300)),5300,5002)

[State 2010, ChangeState]
type = ChangeState
triggerall = life <= 0
trigger1 = time = 105
value = 5050
ctrl = 0


[State 2010, 1]
type = Selfstate
triggerall = life > 0
trigger1 = time = 105
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 1217]
type    = S
movetype= H
physics = S

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 0, PosSet]
type = velSet
trigger1 = time = 0
y = 0


[State 25001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 3
;y= 0

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 0
value = 5001


[State 25001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 25001, 4]
type = VelSet
trigger1 = time = 100
x = 0

[State 25001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 25001, 2]
type = null;ChangeAnim2
trigger1 = Time = 0
value = 1240

[State 2010, 1]
type = ChangeAnim
Trigger1 = time = 20
value = ifelse((selfanimexist(5300)),5300,5002)

[State 2010, ChangeState]
type = ChangeState
triggerall = life <= 0
trigger1 = time = 135
value = 5050
ctrl = 0


[State 2010, 1]
type = Selfstate
triggerall = life > 0
trigger1 = time = 135
value = 0
ctrl = 1


;---------------------------------------------------------------------------
;Rasetsujin
[Statedef 1300]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
sprpriority = 1
powerAdd = 72 * !var(20)
facep2 = 1


[State 1300, Button]
type = varset
trigger1 = !time && !AILevel
var(10) = ifElse(command = "Rasetsujin_X", 0, ifElse(command = "Rasetsujin_Y", 1, 2))

[State 1300, Button Detect (AI)]
type = VarSet
trigger1 = !time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 0, ifElse(P2Dist x > 150, 1, 2))



[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 0
trigger1 = animelemtime(5)>=0&&animelemtime(10)<0
value = SCA,SA,NA,NP,SP
time = 1

[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 0
trigger1 = animelemtime(10)>=0&&animelemtime(15)<0
value = SCA,NA,SA,HA,NP,SP,HP
time = 1


[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 1
trigger1 = animelemtime(5)>=0&&animelemtime(13)<0
value = SCA,SA,NA,NP,SP
time = 1

[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 1
trigger1 = animelemtime(13)>=0&&animelemtime(18)<0
value = SCA,NA,SA,HA,NP,SP,HP
time = 1


[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 2
trigger1 = animelemtime(5)>=0&&animelemtime(16)<0
value = SCA,NA,SA,NP,SP
time = 1

[State 1300, NotHitBy]
type = NotHitBy
triggerall = var(10) = 2
trigger1 = animelemtime(16)>=0&&animelemtime(21)<0
value = SCA,NA,SA,HA,NP,SP,HP
time = 1


[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 0
trigger1 = animelem = 16
x = 10

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 1
trigger1 = animelem = 19
x = 14

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 2
trigger1 = animelem = 22
x = 18

[State 0, PosAdd]
type = PosAdd
trigger1 = var(10) = 2
trigger1 = animelem = 26
x = 20

[State 1300, Anim]
type = changeanim
trigger1 = time = 0
value = ifelse(var(10)=0,1300,ifelse(var(10)=1,1310,1320))

[State 1300, Snd]
type = playsnd
trigger1 = var(10) = 0
trigger1 = Animelem = 15
trigger2 = var(10) = 1
trigger2 = Animelem = 19
trigger3 = var(10) = 2
trigger3 = Animelem = 21
value = S1200,0

[State 230, 1]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = Animelem = 16
trigger2 = var(10) = 1
trigger2 = Animelem = 19
trigger3 = var(10) = 2
trigger3 = Animelem = 22
trigger4 = var(10) = 2
trigger4 = Animelem = 26
value = 2, 14

[State 1200, Snd]
type = playsnd
trigger1 = var(10) = 2
trigger1 = Animelem = 24
value = 4,7

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = animelem = 10
trigger2 = var(10) = 1
trigger2 = animelem = 13
trigger3 = var(10) = 1
trigger3 = animelem = 22
trigger4 = var(10) = 2
trigger4 = animelem = 16
trigger5 = var(10) = 2
trigger5 = animelem = 29
value = 3000, 5

[State 1300, PlaySnd]
type = PlaySnd
trigger1 = var(10) = 0
trigger1 = Animelem = 29
trigger2 = var(10) = 1
trigger2 = Animelem = 38
trigger3 = var(10) = 2
trigger3 = Animelem = 45
value = 2, 15


[State 1300, Explod]
type = Explod
trigger1 = random<500
trigger1 = AnimElem = 3
anim = 8550
sprpriority = 3
postype = p1
pos = 10,10
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
scale = 1,1
pausemovetime = 999999
supermovetime = 999999


[State 1300, HitDef]
type = HitDef
trigger1 = var(10) = 0
trigger1 = AnimElem = 17
attr = S, SA
animtype  = hard
damage = 80, 10
getpower = 20
priority  = 7, hit
hitflag = MAFP
guardflag = MA
pausetime = 10,20
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -15,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -6, -3
air.velocity = -6, -3
fall = 1
air.fall = 1
fall.animtype = hard
fall.recover = 0
ignorehitpause = 0
persistent = 1
envshake.time = 8
envshake.ampl = 4

[State 1505, 2nd Swing]
type = HitDef
trigger1 = var(10) = 1
trigger1 = AnimElem = 20
attr = S, SA
animtype  = hard
damage  = 95, 15
priority  = 7, hit
getpower  = 22
hitflag = MAF
guardflag = MA
pausetime = 10,20
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -7, -3
air.velocity = -7, -3
fall = 1
air.fall = 1
fall.animtype = hard
fall.recover = 0
ignorehitpause = 0
persistent = 1
envshake.time = 8
envshake.ampl = 5


[State 1510, 1st Swing]
type = HitDef
trigger1 = var(10) = 2
trigger1 = AnimElem = 23
attr = S, SA
animtype  = hard
damage  = 50, 5
getpower  = 25
priority  = 7, hit
hitflag = MAF
guardflag = L
pausetime = 10,20
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -15,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = low
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -4
air.velocity = -6, -.1
ignorehitpause = 0
persistent = 1
Air.Fall =1
envshake.time = 8
envshake.ampl = 4

[State 1510, 2nd Swing]
type = HitDef
trigger1 = var(10) = 2
trigger1 = AnimElem = 27
attr = S, SA
animtype  = hard
damage  = 75, 15
getpower  = 25
priority  = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 10,20
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -8, -3
air.velocity = -8, -3
fall = 1
air.fall = 1
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
envshake.time = 8
envshake.ampl = 5

[State 1300, Helper]
type = Helper
trigger1 = var(10) = 0
trigger1 = AnimElem = 19
stateno = 1311
id = 1310
name = "Blade Wave"
pos = 60+const(size.xscale),5+const(size.yscale)
postype = p1
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1300, Helper]
type = Helper
trigger1 = var(10) = 1
trigger1 = AnimElem = 22
trigger2 = var(10) = 2
trigger2 = AnimElem = 29
stateno = 1310
id = 1310
name = "Blade Wave"
pos = 60+const(size.xscale),5+const(size.yscale)
postype = p1
helpertype = normal
keyctrl = 0
ownpal = 1

[State 1201, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;Blade Wave 1
[statedef 1310]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3315
sprpriority = 1

[State 1310, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 1, 10

[State 1310, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 1310, HitDef]
type = HitDef
trigger1 = animelem = 1
attr = S, SP
animtype = Hard
damage = 25,3
guardflag = MA
pausetime = 5,12
sparkno = S8410+random%8
guard.sparkno = S8142
sparkxy = -15,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -5
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3


[State 1310, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 1310, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0
;-------------------------------------------------------------------------------
;Blade Wave 2
[statedef 1311]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3316
sprpriority = 1

[State 1311, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 1, 10


[State 1311, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1311, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, SP
animtype = Hard
damage = 25,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -5
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3


[State 1311, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 1311, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0

;---------------------------------------------------------------------------
;Rasen Kyaku
[Statedef 1400]
type = A
movetype = A
physics = N
anim = 1400
ctrl = 0
juggle  = 0
velset = 0,0
sprpriority = 1
powerAdd = 72 * !var(20)
facep2 = 1

[State 1400, Button]
type = varset
trigger1 = !time && !AILevel
var(10) = ifElse(command = "Rasen_KyakuA", 0, ifElse(command = "Rasen_KyakuB", 1, 2))

[State 1400, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 0, ifElse(P2Dist x > 150, 1, 2))

[State 1400, Anim]
type = changeanim
trigger1 = !time
value = ifelse(var(10)=0, 1400, ifelse(var(10)=1, 1410, 1420))

[State 1400, Snd]
type = playsnd
trigger1 = Animelem = 2
value = 1100,0
;channel = 0

[State 1400, PlaySnd]
type = PlaySnd
triggerall = var(10) = 2
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
value = 1, 4


[State 1400, PlaySnd]
type = PlaySnd
triggerall = var(10) = 1
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
value = 1, 4
;channel = 2

[State 1400, PlaySnd]
type = PlaySnd
triggerall = var(10) = 0
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
trigger5 = Animelem = 21
trigger6 = Animelem = 25
value = 1, 4
;channel = 2


[State 1400, VelSet]
type = VelSet
trigger1 = Time = 0
x = 5.0
y = -4


[State 1400, VelSet]
type = VelSet
trigger1 = AnimElem=4 
y = 0

[State 1400, VelSet]
type = VelAdd
trigger1 = AnimElemTime(4)<0 
trigger2 = anim = 1400
trigger2 = AnimElemTime(11)>=0&&AnimElemTime(18)<0 
trigger3 = anim = 1410
trigger3 = AnimElemTime(19)>=0&&AnimElemTime(26)<0
trigger4 = anim = 1420
trigger4 = AnimElemTime(27)>=0&&AnimElemTime(35)<0
y = .38 ;.5*1.25 

[State 1400, VelSet]
type = VelSet
trigger1 = anim = 1400
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1400, VelSet]
type = VelSet
trigger1 = anim = 1410
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1400, VelSet]
type = VelSet
trigger1 = anim = 1420
Trigger1 = Vel Y>0 && Pos Y>=0 
x = 0 
y = 0 

[State 1400, VelSet]
type = PosSet
Trigger1 = Vel Y>0 && Pos Y>=0
y = 0 



[State 1400, HitDef]
type = HitDef
trigger1 = AnimElem = 5
trigger2 = Animelem = 9
trigger3 = Animelem = 13
trigger4 = Animelem = 17
trigger5 = Animelem = 21
trigger6 = Animelem = 25
ID = 1400
attr = A, SA
animtype  = Medium
damage = ceil(ifElse(fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)) < 7, 7, fvar(11) * ifElse(var(10) = 2, 27, ifElse(var(10), 25, 23)))), 7
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
hitflag = MA
guardflag = MA
pausetime = 12,15
hitsound = S2,5
guardsound = S3,0
sparkno = S8002
guard.sparkno = S8141
sparkxy = -10 + 0*(var(35):=92), var(36):=-70
ground.type = High
ground.slidetime = 14
ground.hittime  = 20
ground.velocity = -5.5
air.velocity = -2.5,-4
forcenofall = 1
envshake.time = 8
envshake.ampl = 5



[State 1400, ChangeState]
type = ChangeState
triggerall = !Win
triggerall = !AILevel
triggerall = movecontact
triggerall = (command = "a" || command = "b" || command = "c")
trigger1 = anim = 1400
trigger1 = AnimElemTime(10)>=0&&AnimElemTime(18)<0
trigger2 = anim = 1410
trigger2 = AnimElemTime(18)>=0&&AnimElemTime(26)<0
trigger3 = anim = 1420
trigger3 = AnimElemTime(26)>=0&&AnimElemTime(35)<0
value = 245
ctrl = 1

[State 1400, ChangeState]
type = ChangeState
triggerall = !Win
triggerall = AILevel
triggerall = movehit && random <600
trigger1 = anim = 1400
trigger1 = AnimElemTime(14)>=0&&AnimElemTime(16)<0
trigger2 = anim = 1410
trigger2 = AnimElemTime(23)>=0&&AnimElemTime(25)<0
trigger3 = anim = 1420
trigger3 = AnimElemTime(31)>=0&&AnimElemTime(35)<0
value = ifelse(statetype = S,645,245)
ctrl = 1

[State 1400, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 0


;-------------------------------------------------------------------------
;Kagero - Run
[Statedef 1500]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = I                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                        ;Set ctrl (Def: no change)
anim = 1500                       ;Change animation (Def: no change)
poweradd = 25                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)


[State 1500, Explod]
type = Explod
trigger1 = AnimElem = 2, = 0
anim = 8552
sprpriority = 5
postype = p1
vel = 0,2
pos = 25,12
bindtime = 1
ownpal = 1
id = 8552
name = "Dust"
pausemovetime = 999999
supermovetime = 999999


[State 1500, Running]
type = PlaySnd
trigger1 = Animelem = 1
trigger2 = Animelem = 3
trigger3 = Animelem = 5
value = 100, ifElse((AnimElem = 3), 0, 1)
volume = -3


[State 1500, Distance]
type = posadd
trigger1 = time > 3 && time < 40
x = 9


[State 1500, Air Roll 1]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Air Roll 1"
ID = 1500
stateno = 1502
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 1500, Air Roll 2]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Air Roll 2"
ID = 1500
stateno = 1503
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 1500, ScreenBound]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1


[State 1500, Slide by]
type = Changestate
triggerall = Time >= 8
trigger1 = !AILevel
Trigger1 = command = "a" || command = "b" || command = "c"
Trigger1 = command != "holddown"
trigger2 = AILevel
trigger2 = p2bodydist x <90
trigger2 = random<300
value = 1505
persistent = 0
ctrl = 1

[State 1500, Run Tackle]
type = Changestate
triggerall = Time >= 8
trigger1 = !AILevel
Trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AILevel
trigger2 = p2bodydist x <90
trigger2 = (random =[300,700])
value = 1510
persistent = 0
ctrl = 1

[State 1500, Sweep]
type = Changestate
triggerall = Time >= 8
trigger1 = !AILevel
Trigger1 = command = "a" || command = "b" || command = "c"
Trigger1 = command = "holddown"
trigger2 = AILevel
trigger2 = p2bodydist x <90
trigger2 = random >700
value = 1515
persistent = 0
ctrl = 1


[State 1500, 9]
type = ChangeState
trigger1 = time = 30
value = 101
ctrl = 0
;-------------------------------------------------------------------------
;Kagero Ghost Run
[Statedef 1501]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = I                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                        ;Set ctrl (Def: no change)
anim = 1501                       ;Change animation (Def: no change)
poweradd = 20                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)


[State 1501, Running]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 3
trigger3 = animelem = 5
value = 100, ifElse((AnimElem = 3), 0, 1)
volume = -3


[State 1501, Distance]
type = posadd
trigger1 = time > 3 && time < 40
x = 10

[State 1501, Burst]
type = Explod
trigger1 = Animelem = 1
ID = 1501
anim = 5560
postype = p1
pos = 0, 0
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7
scale = 0.5, 0.5

[State 1501, AssertSpecial]
type = AssertSpecial
trigger1 = time >= 28
trigger1 = time%3 = 0
flag = invisible

[State 1501, AssertSpecial]
type = AssertSpecial
trigger1 = time >= 28
flag = noshadow

[State 1501, DestroySelf]
type = DestroySelf
trigger1 = time >= 38
trigger2 = parent, movetype = H

[State 1501, ChangeState]
type = ChangeState
trigger1 = parent, movetype = H
value = 1540

;-------------------------------------------------------------------------
;Kagero Ghost Air 1
[Statedef 1502]
type = s
movetype= I
physics = s
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1502
sprpriority = 2


[State 1502, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 1 ;time = 12
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A        ;A,C,S,N

[State 1502, Rise]
type = velset
trigger1 = (animelem = 1) && (Time >= 0 && Time <= 25)
x = 7.3
y = -7.4
yaccel = -.70

[State 1501, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H

[State 1502, ChangeState]
type = ChangeState
trigger1 = parent,movetype = H
value = 1540

[State 1502, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1504
ctrl = 0
ignorehitpause = 1


;-------------------------------------------------------------------------
;Kagero Ghost Air 2
[Statedef 1503]
type = s
movetype= I
physics = s
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1503
sprpriority = 2


[State 1503, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 1 ;time = 12
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A        ;A,C,S,N

[State 1503, Rise]
type = velset
trigger1 = (animelem = 1) && (Time >= 0 && Time <= 44)
x = 6.3
y = -9.9
yaccel = -.50

[State 212, 1] ;Gravity
type = VelAdd
trigger1 = animelem = 4
x = .5
y = .5

[State 212, 1] ;Gravity
type = VelAdd
trigger1 = animelem = 10
x = .8
y = 2.5

[State 1501, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H

[State 0, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= 0
value = 1504
ctrl = 0
ignorehitpause = 1

[State 1501, ChangeState]
type = ChangeState
trigger1 = parent, movetype = H
value = 1540

;------------------------------------------------------------------------
;Kagero Ghost Air End
[Statedef 1504]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = I                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
ctrl = 0                        ;Set ctrl (Def: no change)
anim = 1504                       ;Change animation (Def: no change)
sprpriority = 2

[State 1504, AssertSpecial]
type = AssertSpecial
trigger1 = anim = 0
trigger1 = time%3
flag = invisible

[State 1504, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1504, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 1504
trigger1 = animtime = 0
value = 0

[State 1504, Landing FX]
type = Explod
trigger1 = animelem = 1
anim = 8500
ID = 8500
pos = 0,5
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .8,.8
sprpriority = -3
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
removeongethit = 1
ignorehitpause = 1

[State 1504, Landing]
type = PlaySnd
trigger1 = animelem = 1
value = 52,0

[State 1504, DestroySelf]
type = DestroySelf
trigger1 = anim = 0
trigger1 = time >= 30
trigger2 = parent, movetype = H

[State 1504, ChangeState]
type = ChangeState
trigger1 = parent, movetype = H
value = 1540

;------------------------------------------------------------------------
;Kagero - Yoko Aruki
[Statedef 1505]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= I                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                        ;Set ctrl (Def: no change)
anim = 1505                       ;Change animation (Def: no change)
poweradd = 50                    ;Power to add (Def: 0)
sprpriority = -3                  ;Set p1's sprite layering priority to 2 (in front)

[State 1510, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = 800, 1


[State 1505, Distance]
type = posadd
trigger1 = time > 3 && time < 30
x = 8.5

[State 1505, Helper]
type = Helper
trigger1 = animelem = 1
helpertype = player
name = "otori"
ID = 1505
stateno = 1506
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1


[State 1505, Explod]
type = Explod
trigger1 = Animelem = 3
trigger2 = Animelem = 5
trigger3 = Animelem = 7
trigger4 = Animelem = 9
trigger5 = Animelem = 11
anim = 8552
sprpriority = -2
postype = p1
vel = 0,2
pos = 25,12
bindtime = 1
ownpal = 1
id = 8552
name = "Dust"
pausemovetime = 999999
supermovetime = 999999

[State 1505, 9]
type = ChangeState
trigger1 = animtime = 0
value = 101
ctrl = 1

;------------------------------------------------------------------------
;Yoko Aruki - Otori
[Statedef 1506]
type    = S
movetype = I
physics = N
juggle  = 0
velset = 0,0
ctrl = 0
poweradd = 0
sprpriority = 4


[State 1005, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 1506
value = 1506

[State 1005, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = 1

[State 1005, HitOverride 1]
type = HitOverride
trigger1 = time>=0
attr = SCA,AA,AP
stateno = 1506
time = 2

[State 1506, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0
trigger2 = parent, movetype = H

;------------------------------------------------------------------------
; Kagero - Run Tackle
[StateDef 1510]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1510
poweradd = 40
sprpriority = 2

[State 1510, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 4, 5


[State 0, NotHitBy]
type = NotHitBy
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 4
value = SCA,NA,SA,NP,SP
time = 2


[State 1515, Advance]
type = VelSet
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
x = 8


[State 1515, Stop]
type = VelSet
trigger1 = animelem = 4
x = 0



[State 1515, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
damage = 40, 10
animtype = hard
guardflag = HA
hitflag = MAF
priority = 6, Hit
pausetime = 12, 15
sparkno = S8003
guard.sparkno = S8141
sparkxy = -5, -50
hitsound = s2, 22
guardsound = s3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 30
ground.velocity = -0.2,-12.5
guard.velocity = -7
air.velocity = -1,-11
airguard.velocity = -7, -4
p2facing = 1
forcestand = 1
yaccel = .5                ;p2 will accelerate down at .4 pixels/sec^2 when falling
air.hittime = 30
envshake.time = 6
envshake.ampl = 4


[State 1515, SC Utsus L]
type = ChangeState
triggerall = movecontact > 0
trigger1 = !AILevel
trigger1 = command = "Utsusemi"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1600

[State 1515, Chase Jump]
type = ChangeState
triggerall = movehit && (Time <= 20) && enemy, movetype = H
trigger1 = !AILevel
trigger1 = command = "holdup" && command = "holdfwd" || command = "holdup" && command = "holdback" || Command = "holdup"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 7000


[State 1515, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Kagero - Sweep
; CNS difficulty: easy
[StateDef 1515]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1515
poweradd = 30
sprpriority = 2

[State 1520, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,0

[State 1515, Vocal]
type = PlaySnd
trigger1 = animelem = 1
value =  200, 13

[State 1515, Distance]
type = posadd
trigger1 = time > 3 && time < 25
x = 6

[State 1515, HitDef]
type = HitDef
triggerall = enemy, statetype != L
trigger1 = AnimElem = 3
attr = S, SA
animtype  = hard
damage = 42, 4
hitflag = MAF
guardflag = L
priority = 6, Hit
pausetime = 12, 12
sparkno = S8002
guard.sparkno = S8141
sparkxy = -10, -76
hitsound  = s275,0
guardsound = s150,0
ground.type = trip
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = 0, -4
fall = 1
airguard.velocity = 7.9,-.8
air.type = High
air.velocity = -6.9,-3.5
air.hittime = 12
air.fall = 1
fall.recover = 0
down.hittime = 30
down.bounce = 1
down.bounce.velocity = -4, -10
envshake.time = 8
envshake.ampl = 4

[State 1515, HitDef]
type = HitDef
triggerall = enemy, statetype = L && enemy, stateno != 5120
trigger1 = AnimElem = 3
attr = S, SA
animtype  = hard
damage = 28, 4
hitflag = MAFD
guardflag = L
priority = 5, Hit
pausetime = 12, 12
sparkno = S8002
guard.sparkno = S8141
sparkxy = -10, -76
hitsound   = s275,0
guardsound = s150,0
ground.type = trip
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = 0, -4
airguard.velocity = 7.9,-.8
air.type = High
air.velocity = -6.9,-3.5
air.hittime = 12
p2facing = 1
envshake.time = 8
envshake.ampl = 4

[State 1515, Dust]
type = Explod
trigger1 = time = 3
trigger2 = time = 9
trigger3 = time = 15
trigger4 = time = 21
trigger5 = time = 27
anim = 8552
ID = 1520
pos = 0,2
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
scale = -1,-1
sprpriority = 7
ontop = 1
ownpal = 1
removeongethit = 0


[State 1515, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------
;Kagero - Jump 1
[Statedef 1520]
type = s
movetype= I
physics = s
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1520
poweradd = 0
sprpriority = 2


[State 1502, Wind]
type = PlaySnd
trigger1 = animelem = 1
value = 10,2


[State 1502, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 1 ;time = 12
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A        ;A,C,S,N


[State 1525, Ghost Run]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Ghost Run"
ID = 1525
stateno = 1501
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0


[State 1525, Air Roll 2]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Air Roll 2"
ID = 1525
stateno = 1503
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 1525, ScreenBound]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1525, SC Aichi 1]
type = ChangeState
triggerall = time >= 1
trigger1 = !AILevel
trigger1 = command = "Ichimonji"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1050


[State 1525, Jump Slice]
type = Changestate
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1525
persistent = 0
ctrl = 1


[State 1525, Dive Kick]
type = Changestate; ChangeAnim
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = command = "a" || command = "b" || command = "c"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1526
persistent = 0
ctrl = 1


[State 1502, Rise]
type = velset
trigger1 = (animelem = 1) && (Time >= 0 && Time <= 25)
x = 7.6
y = -7.4
yaccel = -.70


[State 1525, End]
type = changestate
trigger1 = (time = 40) && (Vel Y > 0 && Pos Y >= -10);pos y = 0 && vel y = 0 && time = 12
value =  50
ctrl = 0

;---------------------------------------------------------------------------
;Jump Slice
[Statedef 1525]
type    = A
movetype = A
physics = A
juggle  = 0
poweradd = 25
ctrl = 0
anim = 600
sprpriority = 2

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1,6
;channel = 1


[State 1525, 3]
type = HitDef
trigger1 = Time = 0
attr = A, SA
damage = 48, 8
guardflag = HA
priority = 4, hit
pausetime = 12,14
sparkno = S8410+random%8
guard.sparkno = S8141
hitsound = S2,9
guardsound = S3,0
sparkxy = -10, -60
animtype = Medium
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -8
air.velocity = -3,-5
fall = 1
air.fall = 1
envshake.time = 8
envshake.ampl = 2


;[State -1, SC Jumonji]
;type = ChangeState
;triggerall = movecontact > 0 && (power >= 1000)
;trigger1 = command = "Jumonji"
;value = 2200



[State 1530, End]
type = changestate
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 50
ctrl = 0

;---------------------------------------------------------------------------
;Dive Kick
; CNS difficulty: easy
[Statedef 1526]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd= 40
ctrl = 0
anim = 630
sprpriority = 2


[State 1535, PlaySnd]
type = PlaySnd
trigger1 = animelem =1
value = S4,5
volume = 0

[State 1535, 3]
type = HitDef
trigger1 = Animelem = 1
attr = A, SA
damage = 48, 8
guardflag = HA
priority = 5, hit
pausetime = 12,12
sparkno = S8001
guard.sparkno = S8141
hitsound = S2,4
guardsound = S3,0
sparkxy = -10, -56
animtype = Medium
ground.type = trip
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -6
air.velocity = -7, 8
fall = 1
Air.fall = 1
fall.recover = 0
down.velocity = -15, 30
down.hittime = 30
down.bounce = 1
down.bounce.velocity = -4, -20;-4, -32
envshake.time = 6
envshake.ampl = 3


[State 1535, End]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 50
ctrl = 0

;-------------------------------------------------------------------------
;Kagero - Jump 2
[Statedef 1530]
type = S
movetype = I
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 1530
poweradd = 0
sprpriority = 2


[State 1540, Wind]
type = PlaySnd
trigger1 = animelem = 1
value = 10,2


[State 1540, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 1 ; ;time = 12
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A        ;A,C,S,N

[State 1540, ScreenBound]
type = ScreenBound
triggerall = Pos y < -15
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1


[State 1540, Rise]
type = velset
trigger1 = (animelem = 1) && (Time >= 0 && Time <= 44)
x = 6.3
y = -9.9
yaccel = -.50

[State 212, 1] ;Gravity
type = VelAdd
trigger1 = animelem = 4
x = .5
y = .5

[State 212, 1] ;Gravity
type = VelAdd
trigger1 = animelem = 10
x = .8
y = 2

[State 1540, Ghost Run]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Ghost Run"
ID = 1540
stateno = 1501
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 1540, Air Roll 2]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Air Roll 1"
ID = 1540
stateno = 1502
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0


;[State -1502, Jumonji]
;type = ChangeState
;triggerall = time >= 5 && (power >= 1000)
;trigger1 = command = "Jumonji"
;value = 2200
;ctrl = 1



[State 1540, SC Aichi 1]
type = ChangeState
triggerall = time >= 1
trigger1 = !AILevel
trigger1 = command = "Ichimonji"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1050

[State 1525, Jump Slice]
type = Changestate
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 1535
persistent = 0
ctrl = 1

;[State 1540, Great Leap]
;type = Changestate; ChangeAnim
;triggerall = (command = "x") && (command = "holdfwd") || (command = "y") && (command = "holdfwd") ||  (command = "z") && (command = "holdfwd")
;trigger1 = Time >= 5 ;,39]
;value = 876
;persistent = 0
;ctrl = 1


[State 1540, Diag Air Gun]
type = Changestate
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = (command = "a") || (command = "b") || (command = "c")
trigger1 = (command != "holdfwd") && (command != "holddown")
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 650
persistent = 0
;ctrl = 1


[State 1540, S Air Gun]
type = Changestate
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = (command = "a") || (command = "b") || (command = "c")
Trigger1 = (command = "holdfwd") && (command != "holddown")
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 653
persistent = 0
;ctrl = 1


[State 1540, D Air Gun]
type = Changestate
triggerall = Time >= 4
trigger1 = !AILevel
trigger1 = (command = "a") || (command = "b") ||  (command = "c")
Trigger1 = (command != "holdfwd") && (command = "holddown")
trigger2 = AILevel
trigger2 = Random < (50 * (AILevel ** 2 / 64.0))
value = 655
persistent = 0
;ctrl = 1


[State 1540, End]
type = changestate
trigger1 = (time = 45) && (Vel Y > 0 && Pos Y >= -10);pos y = 0 && vel y = 0 && time = 12
value = 50
ctrl = 0

;---------------------------------------------------------------------------
;Jump Slice
; CNS difficulty: easy
[Statedef 1535]
type    = A
movetype = A
physics = N
juggle  = 4
poweradd = 25
ctrl = 0
anim = 610
sprpriority = 2

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 8
physics = A         ;A,C,S,N

[State 1525, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1000,2
;channel = 0

[State 1525, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1,7
;channel = 1

[State 1525, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,15
;channel = 2

[State 0, PosAdd]
type = PosAdd
trigger1 = time = 0
x = 0
y = 20


[State 1525, 3]
type = HitDef
trigger1 = Time = 0
attr = A, SA
damage = 68, 8
guardflag = HA
priority = 4, hit
pausetime = 12,14
sparkno = S8410+random%8
guard.sparkno = S8141
sparkno = S8410+random%8
guard.sparkno = S8140
hitsound = S2,9
guardsound = S3,0
sparkxy = -10 , -60
animtype = Medium
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -8
air.velocity = -3,-5
fall = 1
air.fall = 1
envshake.time = 8
envshake.ampl = 3


[State 1525, Spark]
type = Explod
triggerall = id <enemy,id
trigger1 = AnimElem=4
Anim = 611
id = 610
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,1
persistent = 1

[State 1525, Spark]
type = Explod
triggerall = id >enemy,id
trigger1 = AnimElem=4
Anim = 611
id = 610
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
scale = const(size.xscale),const(size.yscale)
ignorehitpause = 0
sprpriority = 2
;remappal = 0,2
persistent = 1



[State 1530, End]
type = changestate
trigger1 = animelemtime(8)>0
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 50
ctrl = 0

;-------------------------------------------------------------------------
;Kagero Ghost Run
[Statedef 1540]
type = U                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = I                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
ctrl = 0                        ;Set ctrl (Def: no change)
anim = anim                       ;Change animation (Def: no change)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)


[State 1540, AssertSpecial]
type = AssertSpecial
trigger1 = time >= 0
trigger1 = time%3 = 0
flag = invisible


[State 1540, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 1540, DestroySelf]
type = DestroySelf
trigger1 = time >= 20
trigger2 = parent, movetype = H

;---------------------------------------------------------------------------
; Utsusemi
[Statedef 1600]
type = S
movetype = I
physics = S
anim = 1600
ctrl = 0
velset = 0,0
sprpriority = 1
powerAdd = 72 * !var(20)
facep2 = 1

[State 1600, 1]
type = PlaySnd
trigger1 = Animelem = 8
value = 1600, 0
;channel = 3

[State 1200, Button]
type = varset
trigger1= !time
var(10) = ifElse((command = "a" || command = "rlsa"), 2, ifElse((command = "b" || command = "rlsb"), 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (frontedgebodydist = [1,120])
trigger1 = (random >= ifelse((life<300),700,ifelse((life<500),800,900)))||((p2movetype != H)&&(random >= ifelse((life<300),700,ifelse((life<500),800,900))))
trigger1 = !movecontact
trigger1 = enemynear, stateno !=[5070,5156]
var(10) = 2

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = !movecontact
trigger1 = ((p2bodydist x = [1,100])&&(random >= ifelse((life<300),700,ifelse((life<500),800,900))))||((enemynear, movetype = A)&&(p2bodydist x = [80,150])&&(random >= ifelse((life<300),700,ifelse((life<500),800,900))))
trigger1 = enemynear, stateno !=[5070,5156]
var(10) = 1

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
trigger1 = (backedgebodydist = [1,40])
trigger1 = (random >= ifelse((life<300),700,ifelse((life<500),800,900)))
trigger1 = !movecontact
trigger1 = (enemynear, stateno !=[5070,5150])
var(10) = 0


[State 1100, Anim]
type = changeanim
trigger1= !time
value= ifelse(var(10)=2, 1600, ifelse(var(10)=1, 1600, 1600))


[State 1200, StateType]
type = StateTypeSet
trigger1 = AnimElem = 5
StateType = A
physics = N

[State 1000, Spark]
type = Explod
trigger1 = AnimElem = 8
Anim = 1603
id = 1603
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause = 0
scale = const(size.xscale),const(size.yscale)


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 50-48+random%5, -80+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 60-48+random%5, -70+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 0-48+random%5, -80+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 10-48+random%5, -30+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 20-48+random%5, -40+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 20-48+random%5, -60+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 60-48+random%5, -20+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 15
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 50-48+random%5, -40+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6


[State 1100,Change]
type = ChangeState
trigger1 = animTime = 0
value = 1601

;-------------------------------------------------------------------------------
;Utsusemi
[Statedef 1601]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1610

[State 230, 1]
type = PlaySnd
trigger1 = Animelem = 1
value = 1600, 0
;channel = 3

[State 1200, Button Detect (AI)]
type = VarSet
trigger1 = !Time && AILevel
var(10) = ifElse((P2MoveType = H || P2Dist x > 200 || Random < 333), 2, ifElse(P2Dist x > 150, 1, 0))

[state 9000, VelSetFwd]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdfwd"
x = 3

[state 9000, VelSetBack]
type = VelSet
triggerall = AnimElemTime(3)>=1
trigger1 = command = "holdback"
x = -3

[State 0, PalFX]
type = PalFX
trigger1 = time = 0
time = 15
add = -256,-256,-256
sinadd = 256,256,256,50
invertall = 0
color = 256


[State 1000, Spark]
type = Explod
trigger1 = AnimElem=1
Anim = 1601
id = 1601
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 50-9+random%5, -80+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 60-11+random%5, -70+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 0, -80+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 10-20+random%5, -30+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 20-20+random%5, -40+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 20-20+random%5, -60+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 60-47-20+random%5, -20+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6

[State 1600, Projectile]
type = Projectile
trigger1 = AnimElem = 2
projanim = 1602
projremanim = 1605+random%5
projremove = 0
;projremovetime = 180
projscale = const(size.xscale),const(size.yscale)
velocity = ifelse(random<300,0,ifelse(random<500,.5+random%2,-.5-random%2)),1+random%2
remvelocity = 0,0
accel = 0,0
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -340,-2+random%5
offset = 50-3-20+random%5, -40+random%5
ownpal = 0
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
facing = ifelse(random<500,1,-1)
Vfacing = ifelse(random<500,1,-1)
sprpriority = -3+random%6



[State 0, CtrlSet]
type = CtrlSet
trigger1 = animelem = 2
value = 1
ignorehitpause = 1
persistent = 1

[state 1000,exit]
type = PosSet
triggerall = var(10) = 2 && facing = 1
trigger1 = Time = 0 ;&& var(1)>2
x = -120+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 2 && facing = -1
trigger1 = Time = 0 ;&& var(1)>2
x = 120+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 1
trigger1 = Time = 0 ;&& var(1)>2
x = enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 0 && facing = 1
trigger1 = Time = 0 ;&& var(1)>2
x = 100+enemynear,pos X
y = -120

[state 1000,exit]
type = PosSet
triggerall = var(10) = 0 && facing = -1
trigger1 = Time=0 ;&& var(1)>2
x = -100+enemynear,pos X
y = -120

[state 1000,exit]
type = turn
triggerall = var(10) = 0 ;&& facing = -1
trigger1 = Time = 0 ;&& var(1)>2

[state 1000,exit]
type = Gravity
trigger1 = AnimElemTime(3)>=1

[state 1000,exit]
type = ChangeState
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
value = 52

;----------------------------------------------------------------------
; Ultimate Guard (start)
[Statedef 1700]
type = S
physics = S
anim = 1700
ctrl = 0
poweradd = 50

[State 1700, HitOverride]
type = HitOverride
trigger1 = time > 0 && time <= 10;animelem = 1
trigger2 = time > 10 && time <= 20
trigger3 = time > 20 && time <= 30
trigger4 = time > 30 && time <= 40
attr = SCA,NA,SA;HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1701
time = 10
ignorehitpause = 0
persistent = 1


[State 1700, ReversalDef]
type = ReversalDef
trigger1 = time > 0
reversal.attr = SCA,NA,SA
sparkno = 2
hitsound = S760,0
p1stateno = 1701
ignorehitpause = 0
persistent = 1


[State 1700, Kiai]
type = PlaySnd
trigger1 = animelem = 1
value = S7,9


[State 1700, End]
Type = ChangeState
Trigger1 = time = 45
Value = 1702
ctrl = 0

;----------------------------------------------------------------------
; Ultimate Guard (Initiate)
[Statedef 1701]
type = S
physics = S
anim = 1701
ctrl = 0
;prevstateno != 1705 || prevstateno != 1740 || prevstateno != 17117

[State 1701, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 45
movetime = 45
pos = 25, -57
anim = 1701
sound = s50, 12

[State 1701, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 10


[State 1701, Turn] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -5
trigger1 = Time = 0


[State 1701, Anti Air]
Type = ChangeState
Triggerall = (animtime = 0)
trigger1 = !AILevel && (command = "holda")
Value = 1730
ctrl = 1

[State 1701, Long Range]
Type = ChangeState
Triggerall = (animtime = 0)
trigger1 = !AILevel && (command = "holdx")
Value = 1740
ctrl = 1

[State 1701, Anti Air]
Type = ChangeState
triggerall = AILevel
Trigger1 = (animtime = 0)
Trigger1 = enemynear,statetype != A
Value = ifelse(random<500,1705,1740)
ctrl = 1

[State 1701, Anti Air]
Type = ChangeState
triggerall = AILevel
Trigger1 = enemynear,statetype = A
Trigger1 = (animtime = 0)
Value = 1730
ctrl = 1

[State 1701, Close Range]
Type = ChangeState
Trigger1 = animtime = 0
Value = 1705
ctrl = 1

;----------------------------------------------------------------------
; Ultimate Guard (End)
[Statedef 1702]
type = S
physics = S
anim = 1702
ctrl = 0

[State 1702, End]
Type = ChangeState
Trigger1 = animtime = 0
Value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Suigetsu no Jin- Clone 1
; CNS difficulty: easy
[StateDef 1703]
type = S
movetype = A
physics = S
juggle  = 1
velset = 6,0
ctrl = 0
anim = 1703
sprpriority = 2


[State 1703, VelSet]
type = VelSet
trigger1 = (animelem = 1) && (time > 0 && time <= 29)
x = 2.5
y = 0


[State 1703, 1]
type = PlaySnd
trigger1 = animelem = 8
value = S2,15

[State 1703, VelSet]
type = VelSet
trigger1 = (animelem = 13) && (time > 0 && time <= 30)
x = 5.5
y = 0


[State 1703, 1]
type = PlaySnd
trigger1 = animelem = 23
value = S2,15


[State 1703, VelSet]
type = VelSet
trigger1 = (animelem = 27) && (time > 0 && time <= 12)
x = 2.3
y = 0

[State 1703, 2]
type = PlaySnd
trigger1 = animelem = 2
value = S4,4


[State 1703, 1]
type = PlaySnd
trigger1 = animelem = 8
value = S2,15


[State 1703, HitDef]
type = HitDef
trigger1 = AnimElem = 4
trigger2 = AnimElem = 18
trigger3 = AnimElem = 29
attr = S, NA
damage = 15,1
animtype = medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 2, 9
sparkno = S8400+random%8
sparkxy = -5, -67
guard.sparkno = S8140
hitsound = S2,9
guardSound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -2
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -6,-1.5
air.hittime = 16
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
envshake.time = 8
envshake.ampl = 3


[State 1703, Landing FX]
type = Explod
trigger1 = animelem = 23
anim = 8500
ID = 8500
pos = 0,5
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .8,.8
sprpriority = -3
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
removeongethit = 1
ignorehitpause = 1


[State 1703, Landing]
type = PlaySnd
trigger1 = animelem = 23
value = 52,0


[State 1703, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H

;---------------------------------------------------------------------------
; Suigetsu no Jin- Clone 2
; CNS difficulty: easy
[StateDef 1704]
type = S
movetype= A
physics = S
juggle  = 1
velset = 2 ,0 ;5,0
ctrl = 0
anim = 1704
sprpriority = 2


[State 1704, VelSet]
type = VelSet
trigger1 = (animelem = 1) && (time > 0 && time <= 30)
x = 5.5
y = 0

[State 1704, 1]
type = PlaySnd
trigger1 = animelem = 8
value = S2,15



[State 1704, VelSet]
type = VelSet
trigger1 = (animelem =  15 ) && (time > 0 && time <= 12)
x = 2.3
y = 0

[State 1704, VelSet]
type = VelSet
trigger1 = (animelem = 22) && (time > 0 && time <= 29)
x = 2.5
y = 0

[State 1704, 1]
type = PlaySnd
trigger1 = animelem = 30
value = S2,15


[State 1704, 1]
type = PlaySnd
trigger1 = animelem = 2
value = S4,5


[State 1704, 1]
type = PlaySnd
trigger1 = animelem = 1
value = S1,0


[State 1704, 1]
type = PlaySnd
trigger1 = animelem = 10
value = S2,15


[State 1704, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 6


[State 1704, HitDef]
type = HitDef
trigger1 = AnimElem = 6
trigger2 = AnimElem = 17
trigger3 = AnimElem = 25
attr = S, NA
damage = 15,1
animtype = medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 2, 9
sparkno = S8400+random%8
sparkxy = -5, -67
guard.sparkno = S8140
hitsound = S2,9
guardSound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -2
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -6,-1.5
air.hittime = 16
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
envshake.time = 8
envshake.ampl = 3


[State 1704, Landing FX]
type = Explod
trigger1 = animelem = 11
anim = 8500
ID = 8500
pos = 0,5
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .8,.8
sprpriority = -3
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
removeongethit = 1
ignorehitpause = 1


[State 1704, Landing]
type = PlaySnd
trigger1 = animelem = 11
value = 52,0


[State 1704, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H
;---------------------------------------------------------------------------
; UG: Suigetsu no Jin - 1st Part
; CNS difficulty: easy
[Statedef 1705]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype = A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
velset = 2.3,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 20                    ;Power to add (Def: 0)
sprpriority = -1                  ;Set p1's sprite layering priority to 2 (in front)

[State 1705, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S1,3


[State 1705, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S4,1

[State 1705, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA                     ;Attribute: Standing, Normal Attack
damage = 30                  ;Damage that move inflicts, guard damage
animtype = Medium                ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 2, Hit                ;Attack priority: 0 (least) to 17 (most), 4 default
pausetime = 10, 25                 ;Time attacker pauses, time opponent shakes
sparkno = S8410+random%8                      ;Spark anim no (Def: set above)
guard.sparkno = S8141
sparkxy = -40, -73               ;X-offset for the "hit spark" rel. to p2,
hitsound = s2,8                 ;Sound to play on hit
guardsound = s3,0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 28             ;Time that the opponent slides back
ground.hittime  = 30             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -3.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -4.6,-3.3           ;X-velocity at which opponent is pushed,
air.hittime = 22                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -9
guard.cornerpush.veloff = -12.6
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 5



[State 1705, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "Suigetsu Clone  1"
ID = 1705
stateno = 1703
pos = 50,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1

[State 1705, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Suigetsu Clone  2"
ID = 1705
stateno = 1704
pos = -50,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1


[State 1705, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 10

[State 1705, 17]
type = ChangeState
trigger1 = Animelem = 6
value = 1706
ctrl = 0

;---------------------------------------------------------------------------
; UG: Suigetsu no Jin- 2nd Part
; CNS difficulty: easy
[StateDef 1706]
type = S
movetype= A
physics = S
juggle  = 1
velset = 2.5,0
ctrl = 0
anim = 210
poweradd = 20
sprpriority = 2

[State 1706, 1]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
damage = 25,3
animtype = medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 10, 25
sparkno = S8410+random%8                      ;Spark anim no (Def: set above)
guard.sparkno = S8141
sparkxy = -5, -67
hitsound = s2,9
guardsound = s3,0
ground.type = High
ground.slidetime = 25
ground.hittime  = 35
ground.velocity = -3
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -6,-1.5
air.hittime = 25
ground.cornerpush.veloff = -3.5
guard.cornerpush.veloff = -4
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 3

[State 1706, 1]
type = PlaySnd
trigger1 = animelem = 3
value = S1,1


[State 1706, 2]
type = PlaySnd
trigger1 = animelem = 2
value = S4,4


[State 1706, 1]
type = PlaySnd
trigger1 = animelem = 8
value = S2,15

[State 1706, end]
type = ChangeState
trigger1 = Animelem = 6
value = 1707
ctrl = 0

;---------------------------------------------------------------------------
; UG: Suigetsu no Jin - Final Part
; CNS difficulty: easy
[StateDef 1707]
type = S
movetype= A
physics = S
juggle  = 1
velset = 5.5,0 ;5,0
ctrl = 0
anim = 215
poweradd = 20
sprpriority = 2


[State 707, 1]
type = PlaySnd
trigger1 = animelem = 2
value = S4,5

[State 707, 1]
type = PlaySnd
trigger1 = animelem = 4
value = S1,4

[State 707, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, SA
damage = 37
animtype = hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10, 12
sparkno = S8410+random%8                      ;Spark anim no (Def: set above)
guard.sparkno = S8141
sparkxy = 10, -55
hitsound = s2,9
guardsound = s3,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 17
ground.velocity = -15, -6
airguard.velocity = -3.9,-.8
air.type = High
air.velocity = -12,-5.5
yaccel = .5
Forcestand = 1
air.hittime = 12
p2facing = 1        ;Force to face p1
air.fall = 1
Fall = 1
ground.cornerpush.veloff = -6
guard.cornerpush.veloff = -.6
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 4


[State 707, 1]
type = PlaySnd
trigger1 = animelem = 10
value = S2,15


[State 707, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1



;---------------------------------------------------------------------------
; Suigetsu no Jin Ver 2 - Part 2
; CNS difficulty: easy
[StateDef 1708]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1708
poweradd = 0
sprpriority = 2

[State 1708, Advance]
type = VelSet
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
x = 6


[State 208, Stop]
type = VelSet
trigger1 = animelem = 4
x = 0


[State 1708, 1]
type = HitDef
trigger1 = AnimElem = 8
attr = S, SA
damage = 45,5
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
hitsound = S2,10
guardsound = S3,0
pausetime = 10, 25
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -10, -55
ground.type = High
ground.slidetime = 15
ground.hittime  = 32
ground.velocity = -6
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -4.9,-3.5
air.hittime = 35
ground.cornerpush.veloff = -4
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -7.6
envshake.time = 8
envshake.ampl = 5

[State 220, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 2
;channel = 0

[State 220, Snd]
type = playsnd
trigger1 = animelem = 2
value = 2,17
;channel = 2

[State 220, Snd]
type = playsnd
trigger1 = animelem = 7
value = 2,16
;channel = 2

[State 1708, 1]
type = PlaySnd
trigger1 = animelem = 5
value = S1000,0


[State 1708, end]
type = ChangeState
trigger1 = Animelem= 5
value = 1709
ctrl = 0

;------------------------------------------------------------------------
; Suigetsu no Jin Ver. 2  - Final 3
; CNS difficulty: easy
[StateDef 1709]
type = S
movetype = A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1709
poweradd = 40
sprpriority = 2

[State 1709, Advance]
type = VelSet
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
x = 7


[State 709, Stop]
type = VelSet
trigger1 = animelem = 4
x = 0

[State 220, Snd]
type = playsnd
trigger1 = animelem = 5
value = 2,16
;channel = 2

[State 1709, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, SA
damage = 30,3
animtype = hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 12, 14
sparkno = S8002
guard.sparkno = S8141
sparkxy = -5, -50
hitsound = s2,2
guardsound = s3,0
ground.type = High
ground.slidetime = 10
ground.hittime  = 12
ground.velocity = -10, -6.5
Fall = 1
airguard.velocity = -4.9,-.9
air.type = High
air.velocity = -10,-5.5
air.hittime = 12
air.fall = 1
fall.recover = 1
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -12.6
envshake.time = 6
envshake.ampl = 5


[State 1709, 1]
type = PlaySnd
trigger1 = animelem = 2
value = S4,2


[State 1709, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


;----------------------------------------------------------------------
; Ultimate Guard (start)
[Statedef 1710]
type = S
physics = S
anim = 1700
ctrl = 0
poweradd = 50

[State 710, HitOverride]
type = HitOverride
trigger1 = time > 0 && time <= 10;animelem = 1
trigger2 = time > 10 && time <= 20
trigger3 = time > 20 && time <= 30
trigger4 = time > 30 && time <= 40
attr = SCA,NA,SA;HA;NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1711
time = 10
ignorehitpause = 0
persistent = 1

[State 710, HitOverride]
type = HitOverride
trigger1 = time > 40 && time <= 45
attr = SCA,NA,SA;HA;NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1711
time = 5
ignorehitpause = 0
persistent = 1


[State 0, ReversalDef]
type = ReversalDef
trigger1 = time > 0
reversal.attr = SCA,NA,SA
sparkno = S8002
hitsound = S760,0
p1stateno = 1711
ignorehitpause = 0
persistent = 1


[State 710, Kiai]
type = PlaySnd
trigger1 = animelem = 1
value = S7,9

[State 710, Ki Quake1]
type = EnvShake
trigger1 = animelem =1
time = 3
freq = 40
ampl = -15
phase = 100


[State 710, End]
Type = ChangeState
Trigger1 = time = 42
Value = 1702
ctrl = 0


;----------------------------------------------------------------------
; Ultimate Guard (Initiate)
[Statedef 1711]
type = S
physics = S
anim = 1701
ctrl = 0
prevstateno != 1715 || prevstateno != 1716


[State 711, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 25
pos = 25, -57
anim = 1701
sound = s50, 12

[State 711, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 6

[State 711, Turn] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -5
trigger1 = Time = 0


[State 711, End]
Type = ChangeState
Trigger1 = time = 4
Value = 1715
ctrl = 0

;---------------------------------------------------------------------------
; UG: Musou Zan
; CNS difficulty: easy
[StateDef 1715]
type = S
movetype= A
physics = S
juggle  = 1
velset = 2,0
ctrl = 0
anim = 1535
poweradd = 35
sprpriority = 4


[State 715, Helper]
type = Helper
trigger1 = Animelem =1
helpertype = normal ;player
name = "Musou"
ID = 1715
stateno = 1716
pos = 200 ,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999

[State 715, 1]
type = PlaySnd
trigger1 = animelem = 1
value = S7,8

[State 715, 1]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 108
value = S2,15

[State 715, 1]
type = PlaySnd
trigger1 = animelem = 3
value = S1,4

[State 715, 1]
type = HitDef
trigger1 = AnimElem = 5
attr = S, SA
animtype  = hard
damage = 38, 7
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 12, 15
sparkno = S8410+random%8
guard.sparkno = S8141
sparkxy = -10, -76
hitsound = s50, 4
guardsound = s50, 19
ground.type = low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -2, -2
airguard.velocity = -7.9,-.8
air.type = High
air.velocity = -2,-2
air.hittime = 12
air.fall = 1
envshake.time = 6
envshake.ampl = 5


[State 715, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 10


[State 715, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Musou Zan - Clone
; CNS difficulty: easy
[StateDef 1716]
type = S
movetype = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1716
sprpriority = 1


[State 1716, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S4,2

[State 1716, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
value = S2,15

[State 1716, PosAdd]
type = PosAdd
trigger1 = animelem = 5
trigger2 = animelem = 6
x = 1

[State 1716, 1]
type = HitDef
trigger1 = AnimElem = 6
attr = S, SA
animtype  = hard
damage = 42, 7
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 12, 14
sparkno = S8420+random%8
guard.sparkno = S8141
sparkxy = -10, -76
hitsound = s50, 4
guardsound = s50, 19
ground.type = low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = 11, -12
airguard.velocity = 7.9,-3
air.type = High
air.velocity = 11,-11.5
air.hittime = 12
air.fall = 1
Fall = 1
envshake.time = 6
envshake.ampl = 3

[State 1716, AssertSpecial]
type = AssertSpecial
trigger1 = animelemtime(17)>=0
trigger1 = time%3 = 0
flag = invisible


[State 1716, end]
type = destroyself
trigger1 = AnimTime = 0 || parent, movetype = H

;----------------------------------------------------------------------
; Ultimate Guard (start)
[Statedef 1720]
type = S
physics = S
anim = 1700
ctrl = 0
poweradd = 50

[State 720, HitOverride]
type = HitOverride
trigger1 = time > 0 && time <= 10;animelem = 1
trigger2 = time > 10 && time <= 20
trigger3 = time > 20 && time <= 30
trigger4 = time > 30 && time <= 40
attr = SCA,NA,SA;HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 1721
time = 10
;forceair = 1
ignorehitpause = 0
persistent = 1

[State 0, ReversalDef]
type = ReversalDef
trigger1 = time > 0
reversal.attr = SCA,NA,SA
sparkno = S8002
hitsound = S760,0
p1stateno = 1721
ignorehitpause = 0
persistent = 1


[State 720, Kiai]
type = PlaySnd
trigger1 = animelem = 1
value = S7,9

[State 720, Ki Quake1]
type = EnvShake
trigger1 = animelem =1
time = 3
freq = 40
ampl = -15
phase = 100


[State 720, End]
Type = ChangeState
Trigger1 = Time = 38
Value = 1702
ctrl = 0

;----------------------------------------------------------------------
; Ultimate Guard (Initiate)
[Statedef 1721]
type = S
physics = S
anim = 1701
ctrl = 0
prevstateno != 1725

[State 721, Super Pause]
type = SuperPause
trigger1 = animelem = 1
time = 25
pos = 25, -57
anim = 701
sound = s50, 12

[State 721, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 6


[State 721, Turn] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -5
trigger1 = Time = 0


[State 721, End]
Type = ChangeState
Trigger1 = time = 4
Value = 1725
ctrl = 1

;--------------------------------------------------------------------------
;UG: Enmazuki
; CNS difficulty: easy
[Statedef 1725]
type = S
movetype= A
physics = S
juggle = 3
ctrl = 0
velset = 0,0
anim = 2425
sprpriority = -3
Poweradd = 0


[State 725, 1]
type = PlaySnd
trigger1 = animelem = 1
value = S4,6


[State 725, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(6) < 0
value = 6,0

[State 725, Lunge]
type = Posadd
trigger1 = animelem = 3 && time < 15
x = 28

[State 725, Pierce]
type = HitDef
trigger1 = AnimElem = 3
attr = S, SA
animtype  = hard
damage = 65, 15
getpower  = 0
priority = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 15,16
sparkno = S8004
guard.sparkno = S8141
sparkxy = -10,-60
hitsound   = s2,25
guardsound = s3,0
ground.type = trip
ground.slidetime = 20
ground.hittime  = 30
ground.velocity = -14, -3.8
air.velocity = -14, -3.8
ignorehitpause = 0
Fall = 1
Air.fall = 1
fall.recover = 0
persistent = 1
envshake.time = 8
envshake.ampl = 5


[State 725, EnvShake]
type = EnvShake
trigger1 = animelem =3
time = 5
freq = 60
ampl = -20
phase = 150


[State 705, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 6


[State 725, 2]
type = ChangeState
trigger1 = animtime = 0
value = 1726
ctrl = 1

;--------------------------------------------------------------------------
;Enmazuki - Stop
; CNS difficulty: easy
[Statedef 1726]
type = S
movetype= A
physics = S
juggle = 3
ctrl = 0
velset = 0,0
anim = 2450
sprpriority = 6

[State 726, ScreenBound]
triggerall = prevstateno != 6002
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0


[State 726, Dust]
type = Explod
trigger1 = Animelem = 2
trigger2 = Animelem = 4
trigger3 = Animelem = 6
anim = 8559
ID = 726
pos = 10,10
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
scale = 1,1
vel = -2,0
sprpriority = 7
ontop = 1
ownpal = 1
removeongethit = 0
pausemovetime = 999999
supermovetime = 999999

[State 726, Slow 1]
type = VelSet
trigger1 = time > 0 && time < 5
x = 3
y = 0


[State 726, Slow 2]
type = posadd
trigger1 = time > 6 && time < 15
x = 2.5
y = 0
;yaccel = 1.8


[State 726, slow 2]
type = posadd
trigger1 = time > 16 && time < 20
x = 2.5
y = 0
;yaccel = 1.8


[State 726, 3]
type = changestate
trigger1 = animtime = 0 && backedgebodydist < 0
value = 101 ;run back onscreen state
ctrl = 1

[State 726, ChangeState]
type = ChangeState
trigger1 = animtime = 0 && backedgebodydist >= 0 ;This is true only if he is NOT offscreen
value = 0 ;
ctrl = 1
;-------------------------------------------------------------------------------
;Suigetsu no JinVer 3 - Part 1
[Statedef 1730]
type    = A
movetype= A
physics = S
velset = 1.8 ,-3
anim = 245
ctrl = 0

[State 1730, 2]
type = PlaySnd
trigger1 = Time = 0
value = S1,10

[State 1730, Burst]
type = Explod
trigger1 = Animelem = 1
ID = 1705
anim = 8551
postype = p1
pos = 10, 10
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7
scale = 1, 1
pausemovetime = 999999
supermovetime = 999999

[State 717, 2]
type = HitDef
trigger1 = Time = 0
attr = A, SA
animtype = up
air.animtype = up
damage  = 30
priority  = 5
guardflag = MA
pausetime = 12,20
sparkxy = -10,-70
sparkno = S8001
guard.sparkno = S8141
hitsound   = s2,1
guardsound = s3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 25
ground.velocity = -0.1,-10 ; -3.5,-7
guard.velocity = -7
air.velocity = -0.1,-3
air.hittime  = 30
p2facing = 1
forcestand = 1
ground.cornerpush.veloff = -4
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -12.6
air.guard.velocity = -7, -4
envshake.time = 6
envshake.ampl = 4

[State 717, Helper]
type = Helper
trigger1 = time = 0 ;&& P2MoveType =
helpertype = normal ;player
name = "suigetsu 2 Clone 1"
ID = 1730
stateno = 1735
pos = 50,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1

[State 717, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "suigetsu 2 Clone 2"
ID = 1730
stateno = 1736
pos = -70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1


[State 717, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 10

[State 717, ChangeState]
type = ChangeState
trigger1 = animelem = 4
value = 1731
ctrl = 0


;---------------------------------------------------------------------------
;Suigetsu no JinVer 3 - Part 2
[Statedef 1731]
type    = A
movetype = A
physics = A
juggle  = 2
poweradd= 28
ctrl = 0
anim = 600
sprpriority = 2
velset = 2, -5

[State 718, 1]
type = PlaySnd
trigger1 = Time = 1
value = S4,1

[State 1731, hit]
type = HitDef
trigger1 = animelem = 4
attr = A, SA
damage = 25,3
guardflag = HA
animtype  = light
priority = 3
pausetime = 7,18
sparkno = S8000
guard.sparkno = S8141;s5570
sparkxy = -10,-58
hitsound = s2,9
guardsound = s3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 35
ground.velocity = -4
air.velocity = -.5, -5.5 ;-.5, -3 ;-1, -2; ((vel y)-.1)
envshake.time = 6
envshake.ampl = 3


[State 1731, ChangeState]
type = ChangeState
trigger1 = animelem = 6
value = 1732
ctrl = 0

;---------------------------------------------------------------------------
;Suigetsu no JinVer 3 - Final Part
; CNS difficulty: easy
[Statedef 1732]
type    = A
movetype = A
physics = A
juggle  = 5
ctrl = 0
anim = 1730
sprpriority = 2


[State 715, Yell]
type = PlaySnd
trigger1 = Animelem = 2
value = S4,6

[State 715, 2]
type = PlaySnd
trigger1 = Animelem = 2
value = S1,10


[State 719, 3]
type = HitDef
trigger1 = Time = 0
attr = A, SA
damage  = 32
guardflag = HMAF
priority = 4
pausetime = 12,12
sparkno = S8002
guard.sparkno = S8141
sparkxy = -10,-40
hitsound   = s2,1
guardsound = s3,0
animtype = hard
ground.type = High
ground.slidetime = 15
ground.hittime  = 35
ground.velocity = -5
air.velocity = -3,17
Fall = 1
fall.recover = 0
down.velocity = -4,20
down.hittime = 30
down.bounce = 1
down.bounce.velocity = -4, -40;-4, -32
envshake.time = 8
envshake.ampl = 6


[State 719, VelSet]
type = VelSet
trigger1 = animelem = 1
x = 1
y = -5
yaccel = .50


[State 719, 4]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -10
value = 50
ctrl = 0

;---------------------------------------------------------------------------
; Suigetsu no JinVer 3  - Clone 1
; CNS difficulty: easy
[StateDef 1735]
type = S
movetype= A
physics = S
juggle  = 1
velset = 9,0
ctrl = 0
anim = 1735
sprpriority = 2

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = parent, pos y



[State 1735, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H || Parent, stateno = 2200

;---------------------------------------------------------------------------
; Suigetsu no JinVer 3  - Clone 2
[StateDef 1736]
type = S
movetype = A
physics = S
juggle  = 1
velset = 7.5,0
ctrl = 0
anim = 1736
sprpriority = 2

[State 0, PosSet]
type = PosSet
trigger1 = 1
y = parent, pos y



[State 723, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H || Parent, stateno = 2200

;---------------------------------------------------------------------------
; Suigetsu no Jin- Version 2
; CNS difficulty: easy
[StateDef 1740]
type = S
movetype = A
physics = S
juggle  = 0
velset = 0 ,0
ctrl = 0
anim = 1740
poweradd = 20
sprpriority = 2

[State 1740, Burst]
type = Explod
trigger1 = Animelem = 1
ID = 1706
anim = 8550
postype = p1
pos = 10, 12
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7
scale = 1, 1
pausemovetime = 999999
supermovetime = 999999

[State 1740, Latch]
type = HitDef
trigger1 = AnimElem = 2
attr = S, SA
damage = 15,3
animtype = hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10, 20
sparkno = S8000                     ;Spark anim no (Def: set above)
guard.sparkno = S8141
sparkxy = -5, -65
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 32
ground.velocity = -1
airguard.velocity = -0.1,-0.1
air.type = High
air.velocity = -0.1,-0.1
Forcestand = 1
air.hittime = 22
p2facing = 1
envshake.time = 8
envshake.ampl = 4


[State 1740, 1]
type = PlaySnd
trigger1 = animelem = 2
trigger2 = animelem = 4
value = S2,16


[State 1740, Pull]
type = HitDef
trigger1 = AnimElem = 4
attr = S, SA
damage = 30,5
animtype = hard
guardflag = MA
hitflag = MAF
priority = 5, Hit
pausetime = 10, 28
sparkno = S8003                     ;Spark anim no (Def: set above)
guard.sparkno = S8141
sparkxy = -5, -65
hitsound = S2,2
guardsound = S3,0
ground.type = Low
ground.slidetime = 25
ground.hittime  = 37
ground.velocity = -2
airguard.velocity = 5,-0.8
air.type = High
air.velocity = 17,-0.3
Forcestand = 1
air.hittime = 32
p2facing = 1        ;Force to face p1
envshake.time = 8
envshake.ampl = 4


[State 1740, Helper]
type = Helper
trigger1 = time = 0 ;&& P2MoveType =
helpertype = normal ;player
name = "suigetsu 2 Clone 1"
ID = 1740
stateno = 1745
pos = 50,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1


[State 1740, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "suigetsu 2 Clone 2"
ID = 1740
stateno = 1746
pos = -50,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1
persistent = 1


[State 1740, 6] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 1
value = SCA, NA, SA
time = 10; 30

[State 1740, End]
Type = ChangeState
Trigger1 = animtime = 0
Value = 1708
ctrl = 0
;---------------------------------------------------------------------------
; Suigetsu no JinVer 2  - Clone 1
; CNS difficulty: easy
[StateDef 1745]
type = S
movetype= A
physics = S
juggle  = 1
velset = 0,0
ctrl = 0
anim = 1745
sprpriority = 2


[State 1745, VelSet]
type = VelSet
trigger1 = (animelem = 1) && (time > 0 && time <= 15)
x = 8
y = 0


[State 1745, 1]
type = PlaySnd
trigger1 = animelem = 14
trigger2 = animelem =  16
value = S2,16


[State 1745, VelSet]
type = VelSet
trigger1 = (animelem = 18) && (time > 0 && time <= 8)
x = 17
y = 0

[State 1745, hitdef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 19
animtype = Medium
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 2, 10
sparkno = S8003
guard.sparkno = S8140
sparkxy = -5, -50
hitsound = s2, 22
guardSound = S3,0; S3,0; s3,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -1, 0
airguard.velocity = -4.9,-.9
air.type = High
air.velocity = -2,-1
air.hittime = 20
air.fall = 1
fall.recover = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
envshake.time = 8
envshake.ampl = 3

[State 1745, hitdef]
type = hitdef
trigger1 = animelem = 14
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 0
guard.pausetime = 4, 5
hitsound = S2,2
guardSound = S3,0
sparkno = S8004
guard.sparkno = S8140
sparkxy = -10,-55
animtype = Heavy
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 12
guard.hittime = 12
air.hittime = 22
ground.velocity = -2.52, 0
guard.velocity = -2.86
air.velocity = -2.39, -2.65
envshake.time = 8
envshake.ampl = 3

[State 1745, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H

;---------------------------------------------------------------------------
; Suigetsu no JinVer 2 - Clone 2
; CNS difficulty: easy
[StateDef 1746]
type = S
movetype= A
physics = S
juggle  = 1
velset = 0 ,0 ;5,0
ctrl = 0
anim = 1746
sprpriority = 2


[State 1746, VelSet]
type = VelSet
trigger1 = (animelem = 1) && (time > 0 && time <= 8)
x = 6
y = 0

[State 1746, VelSet]
type = VelSet
trigger1 = (animelem =  7 ) && (time > 0 && time <= 9)
x = 7
y = 0


[State 1746, 1]
type = PlaySnd
trigger1 = animelem = 17
trigger2 = animelem = 19
value = S2,16

[State 225, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 19,2
animtype = Medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
hitsound = s2, 9
guardSound = S3,0
pausetime = 3, 5
sparkno = S8410+random%4
guard.sparkno = S8140
sparkxy = -10, -55
ground.type = High
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -7
airguard.velocity = -1.9,-.8
air.type = High
air.velocity = -1.9,-1.5
air.hittime = 20
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
envshake.time = 8
envshake.ampl = 3

[State 1745, hitdef]
type = HitDef
trigger1 = AnimElem = 9
attr = S, NA
damage = 19
animtype = Medium
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 2, 10
sparkno = S8003
guard.sparkno = S8140
sparkxy = -5, -50
hitsound = s2, 22
guardSound = S3,0; S3,0; s3,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 18
ground.velocity = -1, 0
airguard.velocity = -4.9,-.9
air.type = High
air.velocity = -2,-1
air.hittime = 20
air.fall = 1
fall.recover = 1
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
envshake.time = 8
envshake.ampl = 3

[State 1745, hitdef]
type = hitdef
trigger1 = animelem = 19
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 20, 0
guard.pausetime = 4, 5
hitsound = S2,2
guardSound = S3,0
sparkno = S8004
guard.sparkno = S8140
sparkxy = -10,-55
animtype = Heavy
ground.type = High
air.type = High
ground.hittime = 16
ground.slidetime = 12
guard.hittime = 12
air.hittime = 22
ground.velocity = -2.52, 0
guard.velocity = -2.86
air.velocity = -2.39, -2.65
envshake.time = 8
envshake.ampl = 3

[State 1746, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0 || parent, movetype = H


;========================< ZERO COUNTER >=============================
;PUNCH ZERO COUNTER
[Statedef 2900]
type = S
physics = N
movetype = A
anim = 2900
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2900, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2900, Snd]
type=playsnd
trigger1= !time
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 2900, Snd]
type=playsnd
trigger1= !time
value=1,2
channel=1

[State 2900, Hit]
type = hitdef
trigger1 = animelem = 3
attr = S, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 65, 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
sparkno = S8420
guard.sparkno = S8141
sparkxy = -10, -69
hitsound = S2,2
guardsound = S3,0
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 5


[State 2900, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 2900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;========================< ZERO COUNTER >=============================
;KICK ZERO COUNTER
[Statedef 2910]
type = S
physics = N
movetype = A
anim = 2910
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2910, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 2910, Snd]
type=playsnd
trigger1= animelem=2
value= 4, ifelse(random<500, 1, 2)
channel=0

[State 2910, Snd]
type=playsnd
trigger1= animelem=2
value=1,5
channel=1

[State 2910, Hit]
type = hitdef
trigger1 = !var(16) && var(15) < 1
trigger1 = animelem = 3
attr = C, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 65, 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -5.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, -5.25
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = S2,5
guardsound = S3,0
sparkno = S8420
guard.sparkno = S8141
sparkxy = -10, -10
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 5


[State 2910, Type]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 2910, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;========================< ZERO COUNTER >=============================
;AIR ZERO COUNTER
[Statedef 2920]
type = A
movetype = A
physics = N
anim = 2920
ctrl = 0
velset = 0, 0
sprpriority = 1
poweradd = 0

[State 2920, NHB]
type = nothitby
trigger1 = animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1


[State 2920, Snd]
type = playsnd
trigger1 = animelem = 2
value = 4, ifelse(random<500, 1, 2)
;channel = 0

[State 2920, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1,5
;channel = 1


[State 2920, Hit]
type = hitdef
trigger1 = animelem = 5
attr = A, SA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 65, 7
getpower = 0, 0
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 12, 12
animtype = Diagup
air.animtype = Diagup
fall.animtype = Diagup
ground.type = Low
air.type = Low
ground.hittime = 18
ground.slidetime = 18
guard.hittime = 18
air.hittime = 120
ground.velocity = -5.54, -3.25
ground.cornerpush.veloff = 0
guard.velocity = -10.52
guard.cornerpush.veloff = 0
air.velocity = -5.54, 10
air.cornerpush.veloff = 0
yaccel = 0.58
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 120;24
forcestand = 1
hitsound = S2,5
guardsound = S3,0
sparkno = S8420
guard.sparkno = S8141
sparkxy = -10, -10
palfx.time = 12 * var(9)
palfx.add = 255, 255, 255
palfx.sinadd = -255, -255, -255, 48
envshake.time = 14
envshake.ampl = 5


[State 2920, Type]
type = statetypeset
trigger1 = animelemtime(8) >= 0
movetype = I        ;I,A,H
physics = A         ;A,C,S,N



