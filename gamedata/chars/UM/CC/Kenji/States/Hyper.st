;===============================================================================
;===============================<HYPER MOVES>===================================
;===============================================================================
;Jumonji
[Statedef 3000]
type = S
movetype = A
physics = N
anim = 3000
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 3000, SuperPause]
type = Playsnd
trigger1 = Animelem = 1
value = 3000,0
;channel = 1

[State 3000, Explod]
type = Explod
trigger1 = time = 3
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


[State 3000, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 45
movetime = 45
pos = -25,-95
anim = S9100
sound = S9100, 0
poweradd = -1000


;----------------------

[State 3000, VarSet carga Bg]
type = VarSet
trigger1 = time = 3
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 3
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 3
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------


[State 3000, Explode]
type = Helper
trigger1 = time = 3
helpertype = normal ;player
name = "Level 1"
ID = 9205
stateno = 9205
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 3000, Helper]
type = Helper
triggerall = NumHelper(3010) =0
trigger1 = animelem = 8
helpertype = player
name = "Fanton Kenjin"
stateno = 3010
ID = 3010
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1



[State 3000, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0


[State 3000, ChangeState]
type = ChangeState
trigger1 = time = 50
value = 3001
ctrl = 1

;-------------------------------------------------------------------------------
;Jumonji end
[statedef 3001]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 3001

[State 3001, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;jumonji rows ready
[Statedef 3010]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3010
sprpriority = 4


[State 3010, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3017
name = "jumonjidiag"
pos = ceil(-25*const(size.xscale)),ceil(-133*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3013
name = "jumonjidiagrow2"
pos = ceil(-25*const(size.xscale)),ceil(-133-30*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3016
name = "jumonjidiag"
pos = ceil(-25+40*const(size.xscale)),ceil(-133-30*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3012
name = "jumonjidiagrow2"
pos = ceil(-25+40*const(size.xscale)),ceil(-133-60*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3015
name = "jumonjidiag"
pos = ceil(-25+80*const(size.xscale)),ceil(-133-60*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3011
name = "jumonjidiagrow2"
pos = ceil(-25+80*const(size.xscale)),ceil(-133-90*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3014
name = "jumonjidiagrow"
pos = ceil(-25+120*const(size.xscale)),ceil(-133-90*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3010, Helper]
type = Helper
trigger1 = time = 20
id = 3010
name = "jumonjidiagrow2"
pos = ceil(-25+120*const(size.xscale)),ceil(-133-120*const(size.yscale))
postype = P1
stateno = 3002
helpertype = normal
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 3010, AssertSpecial]
type = AssertSpecial
trigger1 = time>80
trigger1 = time%3 = 0
flag = invisible


[State 3010, DestroySelf]
type = DestroySelf
trigger1 = time >= 120

;-------------------------------------------------------------------------------
;jumonji rows ready
[Statedef 3002]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6025
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 900, 4]
type = ChangeState
triggerall = ishelper(3010)
trigger1 = time = 33
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3011)
trigger1 = time = 33+4
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3012)
trigger1 = time = 33+8
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3013)
trigger1 = time = 33+12
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3014)
trigger1 = time = 33+16
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3015)
trigger1 = time = 33+24
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3016)
trigger1 = time = 33+28
value = 3003

[State 900, 4]
type = ChangeState
triggerall = ishelper(3017)
trigger1 = time = 33+32
value = 3003

;-------------------------------------------------------------------------------
;Jumonji go
[Statedef 3003]
type    = A
movetype = A
physics = N
ctrl = 0
velset = 6,8
;anim = 6025
sprpriority = 4

[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1600,0

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 1000,Projectile]
type = hitdef
trigger1 = time = 0
attr = S, HP
damage = 35,5
animtype  = Medium
guardflag = MA
hitflag = MAF
pausetime = 2,4
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = 20, 0
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
airguard.velocity = -4
air.type = Low
air.velocity = -4,-6
yaccel = .5
air.fall = 1
fall.recover = 0
air.recover = 0
forcestand = 1
id = 30
ignorehitpause = 1
envShake.time = 8
envShake.ampl = 5

[State 1310]
type = varset
trigger1 = numtarget(30) && movehit
var(4) = target,id
ignorehitpause = 1

[State 1001, 3]
type = Changestate
trigger1 = Movehit = 1
value = 6035
IgnoreHitpause = 1

[State 1001, 3]
type = Changestate
trigger1 = Moveguarded = 1
value = 1007
IgnoreHitpause = 1

[State 1000, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6045

[State 4110, DestroySelf]
type = DestroySelf
triggerall = time > 2
trigger1 = FrontEdgeDist <= -40
;----------------------------------------------------------------------------
; Jumonji Level 2
[Statedef 3050]
type    = S
movetype = A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3000
sprpriority = 2

[State 3000, SuperPause]
type = Playsnd
trigger1 = Animelem = 1
value = 3000,0
;channel = 1

[State 1000, Explod]
type = Explod
trigger1 = time = 3
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


[State 2150, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 50
movetime = 50
pos = -23,-90
anim = S9101
sound = S9101,0
poweradd = -2000


;----------------------

[State 0, VarSet carga Bg]
type = VarSet
trigger1 = time = 3
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 3
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 3
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3050, Explode]
type = Helper
trigger1 = time = 1
helpertype = normal ;player
name = "Level 2"
ID = 9206
stateno = 9206
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 1100, Helper]
type = Helper
triggerall = NumHelper(3060) =0
trigger1 = animelem = 8
helpertype = player
name = "Fanton Kenjin"
stateno = 3060
ID = 3060
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1



[State 2100, 3]
type = ChangeState
trigger1 = Time = 60
value = 3001
ctrl = 0

;------------------------------------------------------------------------
; Jumonji - Movement
[Statedef 3060]
type    = S
physics = N
ctrl = 0
velset = 0,0
anim = 3010
sprpriority = 3

[State 3055, AssertSpecial]
type = AssertSpecial
trigger1 = time>180
trigger1 = time%3 = 0
flag = invisible

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1


[State 2151, Kunai Sounds]
type = PlaySnd
trigger1 = time = 0
trigger2 = time = 2
trigger3 = time = 4
trigger4 = time = 6
trigger5 = time = 8
trigger6 = time = 10
value = 1600,0

[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3061
Id = 3061
pos = 70,-70;110,-60
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3062
Id = 3062
pos = 65,-106;100,-100
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3063
Id = 3063
pos = 36,-144;85,-130
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3064
Id = 3064
pos = -7,-174;60,-150
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1


[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3065
Id = 3065
pos = -52,-181;35,-170
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3066
Id = 3066
pos = -102,-163;-40,-170
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = null;Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3067
Id = 3067
pos = -132,-144;-70,-150
postype = p1    ;p2,front,back,left,right
facing = -1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 2151, Helper]
type = null;Helper
trigger1 = time<100
trigger1 = time%80 = 0
helpertype = normal ;player
name = "kunai_5"
stateno = 3068
Id = 3068
pos = -155,-104;-100,-120
postype = p1    ;p2,front,back,left,right
facing = -1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Time = 225

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3061]
movetype = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3061
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 90
value = 3070

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3062]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3062
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 100
value = 3070
;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3063]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3063
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 110
value = 3070
;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3064]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3064
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 120
value = 3070
;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3065]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3065
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 130
value = 3070

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3066]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3066
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 140
value = 3070

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3067]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3074
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 150
value = 3070

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3068]
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3073
poweradd = 0
sprpriority = 3


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 2951, Blocked]
type = ChangeState
trigger1 = time = 160
value = 3070

;---------------------------------------------------------------------------
; Jumonji Medium Kunai
[Statedef 3070]
type = A
moveType = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3071
poweradd = 0
sprpriority = 3

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3061)
trigger1 = time = 0
value = 3071

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3071
trigger1 = !time && !prevstateno
x = 6
y = 0

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3062)
trigger1 = time = 0
value = 3072

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3072
trigger1 = !time && !prevstateno
x = 4
y = 2

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3063)
trigger1 = time = 0
value = 3073

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3073
trigger1 = !time && !prevstateno
x = 3
y = 3

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3064)
trigger1 = time = 0
value = 3074

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3074
trigger1 = !time && !prevstateno
x = 2
y = 4

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3065)
trigger1 = time = 0
value = 3075

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3075
trigger1 = !time && !prevstateno
x = 0
y = 5

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = Ishelper(3066)
trigger1 = time = 0
value = 3076

[State 3655, X vel forward]
type = velset
triggerall = time < 23
trigger1 = anim = 3076
trigger1 = !time && !prevstateno
x = -2
y = 4

[State 3655, Turn into 0]
type = ChangeAnim
triggerall = time >= 23
triggerall = vel x >= 0
trigger1 = vel y = 0
value = 3071

[State 3655, Turn into 0 - 2 up]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y < 0 && vel y >= -2
value = 3072


[State 3655, Turn into 2 - 4 up]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y < -2 && vel y >= -4
value = 3073

[State 3655, Turn into 4 up]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y = -4
value = 3074


[State 3655, Turn into 0 - 2 down]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y > 0 && vel y <= 2
value = 3077


[State 3655, Turn into 2 - 4 down]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y > 2 && vel y < 4
value = 3078


[State 3655, Turn into 4 down]
type = ChangeAnim
triggerall = time >= 23
trigger1 = vel y = 4
value = 3079



[State 1050, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SC, NP,AA, AT
time = -1

[State 1050, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA, AA, AP, AT
time = -1


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 0
value = 1600,0

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 2951, PosSet]
type = Posadd
trigger1 = time >= 23
x = 7


[State 2951, VelAdd]
type = posAdd
;Triggerall = enemynear, statetype = A
triggerall = time >= 23
trigger1 = enemynear, Pos Y > Pos Y && pos y > 0; && p2dist x <= -80 ;&& vel y < 6; Pos Y > Pos Y); && (Vel Y < 6)
y = 0.4

[State 2951, VelAdd]
type = posAdd
triggerall = time >= 23
trigger1 = enemynear, Pos Y < Pos Y && Pos y > 0 ;&& vel y > -6; Pos Y > Pos Y); && (Vel Y < 6)
y = -0.4


[State 2951, VelAdd]
type = posAdd
triggerall = time >= 23
trigger1 = pos y >= 15
y = 0

[State 2951, PosAdd]
type = PosAdd
triggerall = time >= 23
trigger1 = (P2Dist X < 60) ;&& (p2dist y < -40); Enemynear, statetype = A && (P2Dist X < 60) && (p2dist y < -80)
x = -0.5


[State 2951, VelAdd]
type = PosAdd
triggerall = time >= 23
trigger1 = (P2Dist X < 20) ;&& (p2dist y < -80);Enemynear, statetype = A && (P2Dist X < 60) && (p2dist y < -80)
x = -1


[State 3655, X vel forward]
type = velset
triggerall = time >= 23
trigger1 = !time && !prevstateno
x = 5
y = 0


[State 3655, homing y down for stand and air]
type = veladd
triggerall = time >= 23
trigger1 = vel y < 4 && (enemynear, statetype = S || enemynear, statetype = A) && pos y < (enemynear,pos y+enemynear, const(size.mid.pos.y))
y = .2

[State 3655, homing y up for stand and air]
type = veladd
triggerall = time >= 23
trigger1 = vel y > -4 && (enemynear, statetype = S || enemynear, statetype = A) && pos y > (enemynear,pos y+enemynear, const(size.mid.pos.y))
y = -.2

[State 3655, homing y down for crouch]
type = veladd
triggerall = time >= 23
trigger1 = vel y < 4 && (enemynear, statetype = C) && pos y < (enemynear,pos y+(enemynear, const(size.mid.pos.y)/2))
y = .2

[State 3655, homing y up for crouch]
type = veladd
triggerall = time >= 23
trigger1 = vel y > -4 && (enemynear, statetype = C) && pos y > (enemynear,pos y+(enemynear, const(size.mid.pos.y)/2))
y = -.2

[State 3655, homing y down for Lie]
type = veladd
triggerall = time >= 23
trigger1 = vel y < 4 && (enemynear, statetype = L) && pos y < -10
y = .2

[State 3655, homing y up for Lie]
type = veladd
triggerall = time >= 23
trigger1 = vel y > -4 && (enemynear, statetype = L) && pos y > -10
y = -.2



[State 3071, Hitdef]
type = hitdef
trigger1 = time = 0
attr = A, HP
damage = 25, 6
getpower  = 0
priority = 6,hit
animtype = hard
guardflag = MA
hitflag = MAFP
pausetime = 3,5
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = 20, 0
hitsound  = S1000,3
guardsound = S3,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
air.hittime = 25
ground.velocity = -2,-6
air.velocity = -2,-5
fall = 0
air.fall = 0
fall.recover = 0
p2facing = 1
forcestand = 1
envshake.time = 8
envshake.ampl = 5


[State 3070, explod 1]
type = explod
trigger1 = anim = 3071
trigger1 = Movehit
anim = 3081
id = 3081
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 2]
type = explod
trigger1 = anim = 3072
trigger1 = Movehit
anim = 3082
id = 3082
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 3]
type = explod
trigger1 = anim = 3073
trigger1 = Movehit
anim = 3083
id = 3083
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 4]
type = explod
trigger1 = anim = 3074
trigger1 = Movehit
anim = 3074
id = 3074
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 5]
type = explod
trigger1 = anim = 3075
trigger1 = Movehit
anim = 3085
id = 3085
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 6]
type = explod
trigger1 = anim = 3076
trigger1 = Movehit
anim = 3086
id = 3086
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 6]
type = explod
trigger1 = anim = 3077
trigger1 = Movehit
anim = 3087
id = 3087
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 6]
type = explod
trigger1 = anim = 3078
trigger1 = Movehit
anim = 3088
id = 3088
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 3070, explod 6]
type = explod
trigger1 = anim = 3079
trigger1 = Movehit
anim = 3089
id = 3089
pos = 15-(abs(const(size.mid.pos.x)))+random%10,-35-(abs(const(size.mid.pos.y)))+random%10
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 1001, 3]
type = Changestate
trigger1 = Moveguarded = 1
value = 1007
IgnoreHitpause = 1

[State 1000, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 6045

[State 4110, DestroySelf]
type = DestroySelf
triggerall = time > 2
trigger1 = FrontEdgeDist <= -40
trigger2 = Movehit = 1


;-------------------------------------------------------------------------------
; shuri hit
[Statedef 6035]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6035
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit ground
[Statedef 6045]
type    = A
movetype = I
physics = N
velset = 0,0
anim = 6035
ctrl = 0
sprpriority = 2

[State 1002, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = 200,2
;channel = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit
[Statedef 6036]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6036
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit ground
[Statedef 6046]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6036
ctrl = 0
sprpriority = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0

; shuri hit
[Statedef 6037]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6037
ctrl = 0
sprpriority = 2

[State 1310, 2]
type = posset
triggerall = facing = 1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1

[State 1310, 2]
type = posset
triggerall = facing = -1
trigger1 = playeridexist(var(4))
x = playerid(var(4)),pos x
ignorehitpause = 1


[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0
;---------------------------------------------------------------------------
; shuri hit ground
[Statedef 6047]
type    = A
movetype= I
physics = N
velset = 0,0
anim = 6037
ctrl = 0
sprpriority = 2

[State 1310, 4]
type = destroyself
trigger1 = Animtime = 0
;---------------------------------------------------------------------------
;Bakuryusho
[Statedef 3100]
type = S
moveType = A
physics = S
anim = 3100
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 11,0

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1600,1
;channel = 0

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 15
value = 1600,0
;channel = 1


[State 3100, Explod]
type = Explod
trigger1 = time = 3
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


[State 3100, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 45
movetime = 45
pos = 5,-73
anim = S9100
sound = S9100, 0
poweradd = -1000


;----------------------

[State 3100, VarSet carga Bg]
type = VarSet
trigger1 = time = 3
v = 45   ;fv = 10
value = 1


[State 3100, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 3
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 3100, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 3
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 3100, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3100, Explode]
type = Helper
trigger1 = time = 3
helpertype = normal ;player
name = "Level 1"
ID = 9205
stateno = 9205
pos = 0,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 3100, Helper]
type = Helper
trigger1 = animelem = 18
helpertype = normal
name = "BakuryushoGeyser"
ID = 3105
stateno = 3105
pos = p2dist X +30,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3100, Explod]
type = Explod
trigger1 = animelem = 16
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

[State 3150, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(17)>=0&&animelemtime(30)<10
value = 0
movecamera = 0,0

[State 1015, 1]
type = ChangeState
triggerall = animtime = 0
trigger1 = BackEdgeDist < 0
value = 3101

[State 3150, ChangeState]
type = ChangeState
triggerall = animtime = 0
trigger1 = BackEdgeDist >= 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;================================< RUN >========================================
[Statedef 3101]
type = S
movetype = I
physics = N
ctrl = 0
sprpriority = 1


[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 100
value = 100

[State 1016, 1]
type = ScreenBound
trigger1 = 1
value = 0

[State 1016, 2]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 7)
value = 100, ifElse((AnimElem = 3), 0, 1)


[State 2060, ChangeState]
type = ChangeState
triggerall = animtime = 0
trigger1 = BackEdgeDist >= 0
trigger2 = (p2bodydist x <180)
value = 101
ctrl = 1

;---------------------------------------------------------------------------
;Bakuryusho Geyser Local
[Statedef 3105]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3100, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "BakuryushoGeyser"
ID = 3110
stateno = 3110
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3100, Helper]
type = Helper
trigger1 = time = 20
helpertype = normal
name = "BakuryushoGeyser"
ID = 3110
stateno = 3110
pos = 65,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3100, Helper]
type = Helper
trigger1 = time = 40
helpertype = normal
name = "BakuryushoGeyser"
ID = 3110
stateno = 3110
pos = 140,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 3105, DestroySelf]
type = DestroySelf
trigger1 = time>45

;-------------------------------------------------------------------------------
;Bakuryusho Geyser Geyser
[Statedef 3110]
type  = S
movetype = A
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = 4

[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 1110
value = 1110

[State 3110, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,5
;channel = 1

[State 3110, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3110, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
ampl = 10

[State 3110, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3110, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AP
time = -1
ignorehitpause = 1
persistent = 1

[State 3110, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,AP
stateno = 1111
time = -1
ignorehitpause = 1
persistent = 1


[State 3110, HitDef Normal Damage]
type = HitDef
triggerall = var(22) != 1
triggerall = var(22) != 2
triggerall = var(22) != 3
trigger1 = Time < 40
Trigger1 = !Movehit
Trigger1 = time%10 = 0
attr = S, HP
damage = ifelse(Ishelper(3110),60,95),8
animtype = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,5
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-20)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
guard.slidetime = 12
guard.hittime  = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 22
ground.velocity = -3,-12
guard.velocity = -3
airguard.velocity = -3,-4
air.type = High
air.velocity = -3,-11
yaccel = .28
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 12
envshake.ampl = 8
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 3110, HitDef Minimo e Max Damage]
type = HitDef
triggerall = root,var(22)!= 3
triggerall = Time < 40
Triggerall = !Movehit
Triggerall = time%10 = 0
trigger1 = root,var(22) = 1
trigger2 = root,var(22) = 2
attr = S, HP
damage = ifelse(Ishelper(3110),ifelse(root,var(22)=1,65,45),ifelse(root,var(22)=1,110,70)),ifelse(root,var(22)=1,15,0)
animtype = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,ifelse(root,var(22)=0,6,3)
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-20)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
cornerpush = 0
guard.slidetime = 12
guard.hittime  = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = ifelse(root,var(22)=0,28,18)
ground.velocity = -3,ifelse(root,var(22)=0,-13,-10)
guard.velocity = -3
airguard.velocity = -3,-4
air.type = High
air.velocity = -3,ifelse(root,var(22)=0,-13,-10)
yaccel = .28
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 12
envshake.ampl = ifelse(root,var(22)=0,10,6)
sprpriority = 5
palfx.time = ifelse(root,var(22)=0,60,50)
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1


[State 1110, HitDef No Damage]
type = HitDef
triggerall = var(22) != 1
triggerall = var(22) != 2
trigger1 = root,var(22)= 3
trigger1 = Time < 35
Trigger1 = Movecontact!=[1,1]
Trigger1 = hitcount<3
attr = S, HP
damage = 10+random%15,0
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
triggerall = root,var(22) != 3
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

[State 3110, Explod]
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
trigger1 = time >= 40
value = 1111

;---------------------------------------------------------------------------
;Bakuryusho Levl 2
[Statedef 3150]
type = S
moveType = A
physics = S
anim = 3150
ctrl = 0
velset = 0,0
sprpriority = 1
facep2 = 1

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 11,0

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 18
value = 1600,1
;channel = 0

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1600,0
;channel = 1


[State 3100, Explod]
type = Explod
trigger1 = time = 3
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


[State 3100, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 50
movetime = 50
pos = 5,-73
anim = S9101
sound = S9101, 0
poweradd = -2000


;----------------------

[State 3100, VarSet carga Bg]
type = VarSet
trigger1 = time = 3
v = 45   ;fv = 10
value = 1


[State 3100, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 3
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 3100, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 3
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 3100, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3150, Explode]
type = Helper
trigger1 = time = 3
helpertype = normal ;player
name = "Level 2"
ID = 9206
stateno = 9206
pos = 0,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 3150, Helper]
type = Helper
trigger1 = animelem = 23
helpertype = normal
name = "BakuryushoGeyser"
ID = 3165
stateno = 3165
pos = p2dist X ,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 1100, Explod]
type = Explod
trigger1 = animelem = 21
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

[State 3150, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(22)>=0&&animelemtime(34)<10
value = 0
movecamera = 0,0

[State 3150, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3151
ctrl = 0

;---------------------------------------------------------------------------
;Bakuryusho Coint
[Statedef 3151]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 3151
sprpriority = 2


[State 2060, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1015, 1]
type = ChangeState
trigger1 = BackEdgeDist < 0
value = 3152

[State 3151, ChangeAnim]
type = ChangeAnim
trigger1 = anim = 3151
trigger1 = time >= 220
value = 3152


[State 3151, ChangeState]
type = ChangeState
trigger1 = anim = 3152
trigger1 = animtime = 0 ;&& BackEdgeDist >= -10 ;This is true only if he is NOT offscreen
trigger2 = Helper(3160), stateno = 1111
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;================================< RUN >========================================
[Statedef 3152]
type = S
movetype = I
physics = N
ctrl = 0
sprpriority = 1


[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 100
value = 100

[State 1016, 1]
type = ScreenBound
trigger1 = 1
value = 0

[State 1016, 2]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 7)
value = 100, ifElse((AnimElem = 3), 0, 1)


[State 2060, ChangeState]
type = ChangeState
triggerall = animtime = 0
trigger1 = BackEdgeDist >= 0
value = 3151
ctrl = 0
;---------------------------------------------------------------------------
;Bakuryusho Geyser Local
[Statedef 3165]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 4

[State 3105, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3100, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal
name = "BakuryushoGeyser"
ID = 3160
stateno = 3160
pos = 0,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
size.xscale = 1.6
size.yscale = 1


[State 3100, Helper]
type = Helper
trigger1 = time = 10
helpertype = normal
name = "BakuryushoGeyser"
ID = 3161
stateno = 3161
pos = 80,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3100, Helper]
type = Helper
trigger1 = time = 10
helpertype = normal
name = "BakuryushoGeyser"
ID = 3161
stateno = 3161
pos = -80,0
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 3105, DestroySelf]
type = DestroySelf
trigger1 = time>15

;-------------------------------------------------------------------------------
;Bakuryusho Geyser Geyser
[Statedef 3160]
type  = S
movetype = A
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = 5

[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 3160
value = 3160

[State 3110, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,5
;channel = 1

[State 3110, PosSet]
type = PosSet
trigger1 = 1
y = 0

[State 3110, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
ampl = 10

[State 3110, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3110, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AP
time = -1
ignorehitpause = 1
persistent = 1

[State 3110, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,AP
stateno = 3160
time = -1
ignorehitpause = 1
persistent = 1


[State 3110, HitDef Minimo e Max Damage]
type = HitDef
triggerall = RoundState = 2
triggerall = root,var(22) != 3
trigger1 = root,var(22)<= 1
Trigger1 = time%10 = 0
attr = S, HP
damage = ifelse(Hitcount<1,ifelse(root,var(22)=0,105,78),ifelse(root,var(22)=0,18,9)),ifelse(root,var(22)=0,8,0)
animtype = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,ifelse(root,var(22)=0,9,7)
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-120)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
cornerpush = 0
guard.slidetime = 12
guard.hittime  = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = ifelse(root,var(22)=0,28,18)
ground.velocity = -1,ifelse(root,var(22)=0,-6,-3)
guard.velocity = -1
airguard.velocity = -3,-4
air.type = High
air.velocity = -3,ifelse(root,var(22)=0,-6,-3)
yaccel = .28
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 12
envshake.ampl = ifelse(root,var(22)=0,10,6)
sprpriority = 5
palfx.time = ifelse(root,var(22)=0,60,50)
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 3110, HitDef Normal Damage]
type = HitDef
triggerall = RoundState = 2
triggerall = !root,var(22)
Trigger1 = time%10 = 0
attr = S, HP
damage = ifelse(Hitcount<1,95,15),3
animtype = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,8
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 15
ground.hittime  = 15
cornerpush = 0
guard.slidetime = 12
guard.hittime  = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.hittime = 22
ground.velocity = -1,-6
guard.velocity = -3
airguard.velocity = -3,-4
air.type = High
air.velocity = -1,-5
yaccel = .28
air.fall = 1
fall = 1
fall.recover = 0
air.recover = 0
envshake.time = 12
envshake.ampl = 8
palfx.time = 50
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1


[State 1110, HitDef No Damage]
type = HitDef
triggerall = root,var(22)!= 1
triggerall = root,var(22)!= 2
trigger1 = root,var(22)= 3
Trigger1 = time%15 = 0
attr = S, HP
damage = ifelse(Hitcount<1,15,5),0
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
ground.velocity = -1,-4
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
triggerall = root,var(22) != 3
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


[State 3110, Explod]
type = Explod
trigger1 = time = 0
anim = 1115
ID = 1115
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = 1.6,1
sprpriority = -1


[State 3110, ChangeState]
type = ChangeState
trigger1 = time >= 180
trigger2 = root,movetype = H
value = 1111

;-------------------------------------------------------------------------------
;Enryusho Geyser
[Statedef 3161]
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
;channel = 1

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
stateno = 3161
time = -1
ignorehitpause = 1
persistent = 1


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
trigger1 = time = 180
trigger2 = root,movetype = H
value = 1111

;----------------------------------------------------------------------------
;Rasetsujin - Startup
[Statedef 3300]
type    = S
movetype= A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3300
Poweradd = 0;-1000;ifelse((var(22)=0),-1000,0)

[State 3300, 1]
type = PlaySnd
trigger1 = animelem = 3  ; fine
value = 3300, 0


[State 3300, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 3301
ctrl = 0
;----------------------------------------------------------------------------
;Rasetsujin - Intent
[Statedef 3301]
type    = S
movetype = I
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3301

;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
trigger1 = time>20
trigger1 = time%5 = 0
time = 10
add = 0,0,0
mul = 96,96,96
sinadd = -80,-80,-80,0
invertall = 0
color = 256

[State 3301, AssertSpecial]
type = AssertSpecial
trigger1 = time>30
trigger1 = time%3 = 0
flag = invisible

[State 3301, HitBy]
type = HitBy
trigger1 = anim = 3301
trigger1 = time>30
value = SCA,NT,ST,HT
time = 1

[State 1300, NotHitBy]
type = NotHitBy
trigger1 = animelemtime(0)>=0&&animelemtime(6)<0
value = SCA,NA,SA,HA,NP,SP,HP
time = 1

[State 3505, Sword Glow]
type = Helper
triggerall = NumHelper(3320) = 0
trigger1 = time = 101
trigger2 = time = 201
helpertype = normal ;player
name = "Glow"
ID = 3320
stateno = 3320
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3301, ChangeState]
type = ChangeState
triggerall = power >= 1000
triggerall = Time < 100
trigger1 = !AILevel
trigger1 = command != "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3302

[State 3301, ChangeState]
type = ChangeState
triggerall = power >= 2000
triggerall = Time >=100 && time <200
trigger1 = !AILevel
trigger1 = command != "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3303

[State 3301, ChangeState]
type = ChangeState
triggerall = power >= 3000
triggerall = Time >=200
trigger1 = !AILevel
trigger1 = command != "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3304

[State 3301, ChangeState]
type = ChangeState
triggerall = power < 2000
triggerall = Time >=100
trigger1 = !AILevel
trigger1 = command = "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3302

[State 3301, ChangeState]
type = ChangeState
triggerall = power >= 2000 && power < 3000
triggerall = Time >=200
trigger1 = !AILevel
trigger1 = command = "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3303

[State 3301, ChangeState]
type = ChangeState
triggerall = power >= 3000
triggerall = Time >=300
trigger1 = !AILevel
trigger1 = command = "hold_xy"
trigger2 = AILevel
trigger2 = Random < (200 * (AILevel ** 2 / 64.0))
value = 3304

;----------------------------------------------------------------------------
;Rasetsujin - Intent 2
[Statedef 3302]
type    = S
movetype = I
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3301


[State 3302, VarSet]
type = VarSet
trigger1 = Time = 0
var(21) = 0

[State 3302, NotHitBy]
type = NotHitBy
trigger1 = time = 5
value = SCA,NA,SA,NP,NT
time = 20


[State 3305, Super Pause]
type = SuperPause
trigger1 = time = 0
pos = -50,-45
anim = S9100
sound = S9100,0
darken = 0
time = 45
movetime = 45
poweradd = -1000


;----------------------
[State 0, VarSet carga Bg]
type = VarSet
trigger1 = time = 0
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 0
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 0
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3000, Explode]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Level 1"
ID = 9205
stateno = 9205
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999


[State 3000, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3305

;----------------------------------------------------------------------------
;Rasetsujin - Intent 2
[Statedef 3303]
type    = S
movetype = I
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3301


[State 3302, VarSet]
type = VarSet
trigger1 = Time = 0
var(21) = 1

[State 3302, NotHitBy]
type = NotHitBy
trigger1 = time = 5
value = SCA,NA,SA,NP,NT
time = 25

[State 3305, Super Pause]
type = SuperPause
trigger1 = time = 0
pos = -50,-45
anim = S9101
sound = S9101,0
darken = 0
time = 45
movetime = 45
poweradd = -2000


;----------------------
[State 0, VarSet carga Bg]
type = VarSet
trigger1 = time = 0
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 0
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 0
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3000, Explode]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Level 2"
ID = 9206
stateno = 9206
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 3000, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3305

;----------------------------------------------------------------------------
;Rasetsujin - Intent 3
[Statedef 3304]
type    = S
movetype = I
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3301


[State 3302, VarSet]
type = VarSet
trigger1 = Time = 0
var(21) = 2

[State 3302, NotHitBy]
type = NotHitBy
trigger1 = time = 5
value = SCA,NA,SA,NP,NT
time = 30

[State 3305, Super Pause]
type = SuperPause
trigger1 = time = 0
pos = -50,-45
anim = S9104
sound = S9101,0
darken = 0
time = 25
movetime = 25
poweradd= -3000


;----------------------
[State 0, VarSet carga Bg]
type = VarSet
trigger1 = time = 0
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 0
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 0
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 3000, Explode]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Level Max"
ID = 9207
stateno = 9207
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 3303, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3305

;---------------------------------------------------------------------------
;EX Special 4
[Statedef 3305]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
juggle  = 0
sprpriority = 1
facep2 = 1

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = var(21) != 2
trigger1 = time = 0
value = 3305

[State 3305, ChangeAnim]
type = ChangeAnim
trigger1 = var(21) = 2
trigger1 = time = 0
value = 3306


[State 3305, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 1
value = S3000, 5
;channel = 2

[State 1200, Snd]
type = playsnd
trigger1 = Animelem = 6
value = S1200,0

[State 230, 1]
type = PlaySnd
triggerall = anim != 3306
trigger1 = Animelem = 7
trigger2 = Animelem = 11
trigger3 = Animelem = 19
value = 2, 14

[State 3305, PlaySnd]
type = PlaySnd
trigger1 = anim = 3306
trigger1 = Animelem = 7
value = S1, 8

[State 3305, PlaySnd]
type = PlaySnd
triggerall = anim != 3306
trigger1 = Animelem = 32
value = 2, 15

[State 3305, PlaySnd]
type = PlaySnd
triggerall = anim = 3306
trigger1 = Animelem = 20
value = 2, 16
;channel = 2


[State 1510, 2nd Swing]
type = HitDef
triggerall = anim != 3306
trigger1 = Animelem = 8
attr = S, HA
animtype  = Heavy
damage  = 55, 4
priority  = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 8,17
sparkno = S8420+random%8
guard.sparkno = S8141
sparkxy = -15,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -3,0
air.velocity = -2.5, -1
fall = 0
air.fall = 0
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
snap = 80,0
;forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 5

[State 210, 2]
type = HitDef
triggerall = anim != 3306
trigger1 = Animelem = 12
attr = S, HA
animtype  = Heavy
damage = 75,5
guardflag = MA
pausetime = 8,17
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -4,0
air.velocity = -3.5, -1
fall = 0
air.fall = 0
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
snap = 90,0
;forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 5

[State 210, 2]
type = HitDef
triggerall = anim != 3306
trigger1 = Animelem = 20
attr = S, HA
animtype  = Heavy
damage = 65,5
guardflag = MA
pausetime = 12,ifelse(var(21) = 0,18,25)
guard.pausetime = 8,ifelse(var(21) = 0,8,20)
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = ifelse(var(21) = 0,-7,-3),ifelse(var(21) = 0,-5,0)
air.velocity = ifelse(var(21) = 0,-5,-2),ifelse(var(21) = 0,-3,0)
fall = ifelse(var(21) = 0,1,0)
air.fall = ifelse(var(21) = 0,1,0)
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
;forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 5

[State 3304, Helper]
type = Helper
triggerall = anim != 3306
trigger1 = var(21) = 0
trigger1 = animelem = 22
helpertype = normal ;player
name = "blade wave 2"
ID = 3316
stateno = 3316
pos = 60+const(size.xscale),5+const(size.yscale)
postype = p1    ;p2,front,back,left,right
facing = 1
supermovetime = 99999
pausemovetime = 99999

[State 3305, Helper]
type = Helper
triggerall = anim != 3306
trigger1 = var(21) = 1
trigger1 = animelem = 22
helpertype = normal ;player
name = "Fanton1"
ID = 3310
stateno = 3310
pos = 80,0
postype = p1    ;p2,front,back,left,right
facing = 1
supermovetime = 99999
pausemovetime = 99999


[State 4000, Hit]
type = hitdef
triggerall = anim = 3306
trigger1 = time
trigger1 = !var(38)
attr = S, HT
hitflag = MAF
guardflag = MA
priority = 6, Miss
hitsound = S2,9+random%2
guardsound = S3,0
sparkno = -1
guard.sparkno = S8142
sparkxy = -10,-50
numhits = 0
sparkno = -1
p1facing = 1
p1stateno = 3350
fall = 1
fall.recover = 0

[State 3305, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;----------------------------------------------------------------------------
;Rasetsujin Fanton 1
[Statedef 3310]
type    = S
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0,0
anim = 3310
sprpriority = 3

[State 3310, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3310, AssertSpecial]
type = AssertSpecial
trigger1 = time%10 = 0
flag = invisible

[State 3310, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP
time = -1

[State 3310, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 3312
time = -1

[State 3310, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1200, 0

[State 3310, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 35
value = 2, 15
;channel = 2

[State 3310, HitDef]
type = HitDef
trigger1 = Animelem = 10
attr = S, HA
animtype  = Heavy
damage = 65,5
guardflag = MA
pausetime = 8,17
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-70
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -4,0
air.velocity = -3.5, -1
fall = 0
air.fall = 0
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
snap = 100,0
;forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 5

[State 3305, Helper]
type = Helper
trigger1 = animelem = 16
helpertype = normal ;player
name = "Fanton1"
ID = 3311
stateno = 3311
pos = 50,0;p2dist X -50,0
postype = p1    ;p2,front,back,left,right
facing = 1
supermovetime = 99999
pausemovetime = 99999

[State 3300, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 3312
ctrl = 0
;----------------------------------------------------------------------------
;Rasetsujin Fanton 2
[Statedef 3311]
type    = S
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0,0
anim = 3311
sprpriority = 3

[State 3311, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3311, AssertSpecial]
type = AssertSpecial
trigger1 = time%10 = 0
flag = invisible

[State 3311, HitBy]
type = HitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP
time = -1

[State 3311, HitOverride]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP
stateno = 3312
time = -1

[State 3311, PlaySnd]
type = PlaySnd
trigger1 = animelem = 8
value = S1200, 0

[State 3311, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 38
value = 2, 15
;channel = 2

[State 3311, 2nd Swing]
type = HitDef
trigger1 = Animelem = 10
attr = S, HA
animtype  = Heavy
damage  = 65, 4
priority  = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 12,18
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = -5,0
air.velocity = -4.5, -1
fall = 0
air.fall = 0
fall.recover = 0
fall.animtype = hard
ignorehitpause = 0
persistent = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 5

[State 3311, Helper]
type = Helper
trigger1 = animelem = 12
helpertype = normal ;player
name = "Blade Wave 2"
ID = 3316
stateno = 3316
pos = const(size.xscale),const(size.yscale)
postype = p1    ;p2,front,back,left,right
facing = 1
supermovetime = 99999
pausemovetime = 99999


[State 3311, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 3312
ctrl = 0
;----------------------------------------------------------------------------
;Rasetsujin Fanton End
[Statedef 3312]
type    = S
movetype = A
physics = N
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3312
sprpriority = 3


[State 3312, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3312, AssertSpecial]
type = AssertSpecial
trigger1 = time >40
trigger1 = time%3 = 0
flag = invisible


[State 3312, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1


[State 3312, DestroySelf]
type = DestroySelf
trigger1 = time>60
;-------------------------------------------------------------------------------
;Blade Wave 1
[statedef 3315]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3315
sprpriority = 1

[State 3311, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 1, 10
;channel = 1

[State 6000]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 210, 2]
type = HitDef
trigger1 = animelem = 1
attr = S, HP
animtype  = Heavy
damage = 5,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-80
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 210, 2]
type = HitDef
trigger1 = animelem =2
attr = S, HP
animtype  = Heavy
damage  = 10, 3
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
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 210, 2]
type = HitDef
trigger1 = Animelem = 3
attr = S, HP
animtype  = Heavy
damage  = 15,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-50
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 210, 2]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 4
attr = S, HP
animtype  = Heavy
damage  = 20,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-30
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 210, 2]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 5
attr = S, SP
animtype  = Heavy
damage  = 15,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-20
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 0, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 0, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0
;-------------------------------------------------------------------------------
;Blade Wave 2
[statedef 3316]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3316
sprpriority = 1

[State 3316, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 1, 10
;channel = 1

[State 3316, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3316, HitDef]
type = HitDef
trigger1 = animelem = 9
attr = S, HP
animtype  = Heavy
damage = 5,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-80
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 3316, HitDef]
type = HitDef
trigger1 = animelem = 8
attr = S, HP
animtype  = Heavy
damage  = 10, 3
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
ground.velocity = -3
air.velocity = -3,-4
fall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 3316, HitDef]
type = HitDef
trigger1 = Animelem = 7
attr = S, HP
animtype  = Heavy
damage  = 15,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-50
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 3316, HitDef]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 6
attr = S, HP
animtype  = Heavy
damage  = 20,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-30
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 3316, HitDef]
type = HitDef
triggerall = movehit < 1
trigger1 = Animelem = 5
attr = S, SP
animtype  = Heavy
damage  = 15,3
guardflag = MA
pausetime = 5,12
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -15,-20
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -3
air.velocity = -3,-4
forcenofall = 1
sprpriority = 1
envshake.time = 8
envshake.ampl = 3

[State 3316, VelSet]
type = VelSet
trigger1 = time = 0
x = 4

[State 3316, DestroySelf]
type = DestroySelf
trigger1 = Animtime = 0
;--------------------------------------------------
; Rasetsujin - Sword Glow
[Statedef 3320]
type    = S
physics = N
ctrl = 0
anim = 9999
sprpriority = 7

[State 3520, Trans]
type = Trans
trigger1 = 1
trans = add1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S3000,5

[State 3520, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
sprpriority = 5

;[State 3520, PalFXWiz]
;type = PalFX
;trigger1 =time = 0
;time = 35
;add = -50,50,256
;mul = 256,256,256
;sinadd = 250,250,256,1;20
;invertall = 1
;color = 256

[State 9500, Explod]
type = Explod
trigger1 = numexplod(3320)= 0
trigger1 = time = 0
anim = 3320
postype = p1
ID = 3320
sprpriority = 3
pos = 0,0
scale = 1,1
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 0


[State 9500, Modifyexplod]
type = modifyexplod
trigger1 = numexplod(3320)
trigger1 = Time <= 45
ID = 3320
scale =(1+time*.010),(1+time*.010)

[State 9500, Safety]
type = removeexplod
trigger1 = time>45


[State 9500, BindToParent]
type = BindToParent
trigger1 = 1
pos = 0,0

[State 9500, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 3520, DestroySelf]
type = DestroySelf
;trigger1 = parent, movetype =  H || parent, stateno= 3506 || time = 10
trigger1 = time = 46;
ignorehitpause = 1
;-------------------------------------------------------------------------------
;--- PLAYER ---
[Statedef 3350]
type = S
physics = N
movetype = A
anim = 3350
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 3350, throw]
type = targetstate
trigger1 = !time
value = 3360

[State 3350, throw]
type = targetfacing
trigger1 = !time
value = -1

[State 3350, Snd]
type = playsnd
trigger1 = !time
value = 4, 10
;channel = 0

[State 3350, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800

[State 3350, Snd]
type = playsnd
trigger1 = !time
value = 5, 8

[State 3350, vsothers]
type = varset
trigger1 = !time
var(30) = 345

;NEED TO FINISH

[State 3350, Recover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 99]) && numtarget
triggerall = target, life >= 0.33 * (target, lifemax)
trigger1 = (target, command = "x") || (target, command = "y") || (target, command = "z")
trigger2 = (target, command = "a") || (target, command = "b") || (target, command = "c")
trigger3 = (target, command = "up") || (target, command = "down") || (target, command = "back") || (target, command = "fwd")
var(30) = -1

[State 3350, preventrecover]
type = varadd
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
triggerall = (var(30) = [1, 98]) && numtarget
trigger1 = command = "x" || command = "y" || command = "z"
trigger2 = command = "a" || command = "b" || command = "c"
trigger3 = command = "up" || command = "down" || command = "back" || command = "fwd"
var(30) = 1

[State 3350, Debug]
type = displaytoclipboard
trigger1 = var(30) < 100
text = " %d button presses to recover"
params = var(30)

[State 3350, Debug]
type = displaytoclipboard
trigger1 = var(30) = 245
text = "Normal Damage"

[State 3350, Debug]
type = displaytoclipboard
trigger1 = var(30) = 356
text = "Extra Damage"

[State 3350, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 2
movetime = 2

[State 3350, Push]
type = playerpush
trigger1 = 1
value = 0

[State 3350, nothitby]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1

[State 3350, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0

[State 3350, fadeout]
type = allpalfx
trigger1 = animelemtime(1) = 10
time = 30
sinadd = -255, -255, -255, 120

[State 3350, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 4
value = 0, 0, 0

[State 3350, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG

[State 3350, spr]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1

[State 3350, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 3350, hitadd]
type = hitadd
triggerall = var(30) > 0
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 1

[State 3350, hitdamage]
type = targetlifeadd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = -17 -(var(30) = 356) * 4 + (!var(30)) * 12
kill = animelem = 34
absolute = 1

[State 3350, givepower]
type = targetpoweradd
triggerall = numtarget
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 36

[State 3350, HitSound]
type = playsnd
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
value = 2, ifelse(!var(30), 0, ifelse((animelem = 34), 10, 8))
;channel = 2



[State 3350, Explod]
type = Explod
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
trigger3 = animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25
trigger4 = animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
anim = ifelse(random<333,8400,ifelse(random<500,8410,8420))+random%8
ID = 8420
pos = ifElse(P2Dist X < 0, 0, ifElse(P2Dist X < 0, ceil(P2Dist X), 0)), ceil(P2Dist Y - 50)
postype = p2
bindtime = 1
random = 60,60
removetime = -2
pausemovetime = 99999
supermovetime = 99999
scale = 1,1
sprpriority = 20
ontop = 1
ownpal = 1


[State 3350, Shake]
type = envshake
trigger1 = animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8 || animelem = 9 || animelem = 10
trigger2 = animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17
trigger3 = animelem = 18 || animelem = 19 || animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26
trigger4 = animelem = 27 || animelem = 28 || animelem = 29 || animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34
time = 6
freq = 120
ampl = -4


[State 3350, Snd]
type = playsnd
trigger1 = animelemtime(40) = 0
value = 2, 15
;channel = 0

[State 3350, throw]
type = targetstate
trigger1 = animelemtime(34) >= 0 && numtarget
value = 3361
persistent = 0

[State 3350, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
trigger1 = !var(30) && numtarget
trigger2 = target, stateno = 3362
value = 3351


[State 3350, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- PLAYER ---
[Statedef 3351]
type = S
physics = S
movetype = H
anim = 5910
velset = -5, 0
ctrl = 0

[State 3351, target]
type = targetstate
trigger1 = !time && numtarget
value = 3362

[State 3351, imageoff]
type = afterimagetime
trigger1 = 1
time = 0

[State 3351, Snd]
type = playsnd
trigger1 = !time
value = 5000, 4
;channel = 0

[State 3351, Anim]
type = changeanim
trigger1 = anim = 5910 && time = 45
value = 5911

[State 3351, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8

[State 3351, Snd]
type = playsnd
trigger1 = !time
value = 7, 1

[State 3351, lightning]
type = helper
trigger1 = !time
helpertype = normal
stateno = 4012
ID = 4012
postype = p1
pos = 0, -60
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 3351, End]
type = changestate
trigger1 = anim = 5911 && !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- TARGET ---
[Statedef 3360]
type = S
movetype = H
physics = N
velset = 0, 0
ctrl = 0

[State 3360, Anim]
type = changeanim2
trigger1 = !time
value = 3360

;-------------------------------------------------------------------------------
[Statedef 3361]
type = L
movetype = H
physics = C
velset = 0, 0
ctrl = 0

[State 3361, Anim]
type = changeanim2
trigger1 = !time
value = 3361

[State 3361, End]
type = selfstate
trigger1 = !alive
value = 5150

[State 3361, End]
type = selfstate
trigger1 = time >= 97 && alive
value = 5120

;-------------------------------------------------------------------------------
;--- PLAYER ---
[Statedef 3362]
type = S
movetype = H
physics = S
anim = 0
velset = -5, 0
ctrl = 0


[State 3362, Anim]
type = changeanim
trigger1 = !time && selfanimexist(150)
value = 150

[State 3362, Anim]
type = changeanim
trigger1 = anim = 150 && selfanimexist(140) && time >= 45
value = 140


[State 3362, Flash]
type = palfx
trigger1 = !time
add = 30, 30, 100
sinadd = 30, 30, 100, 8
time = 8


[State 3362, End]
type = selfstate
trigger1 = anim = 140 && !animtime
trigger2 = anim = 0 && time >= 54
value = 0
ctrl = 1

;----------------------------------------------------------------------------
; Jumonji (Heavy)
[Statedef 3500]
type    = S
movetype = A
physics = S
juggle  = 4
ctrl = 0
velset = 0,0
anim = 3000
sprpriority = 0


[State 3000, SuperPause]
type = Playsnd
trigger1 = Animelem = 1
value = 3000,0
;channel = 1

[State 3000, Explod]
type = Explod
trigger1 = time = 3
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



[State 2125, Super Pause]
type = SuperPause
trigger1 = time = 3
time = 60
movetime = 60
pos = -23,-90
anim = S9104
sound = S9101,0
poweradd = -3000

;----------------------

[State 0, VarSet carga Bg]
type = VarSet
trigger1 = time = 3
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = time = 3
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 3150, Explode]
type = Helper
trigger1 = time = 3
helpertype = normal ;player
name = "Level Max"
ID = 9207
stateno = 9207
pos = 0,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 3
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 9500]
type = Helper
triggerall = numhelper(9500)=0
trigger1 = time = 3
helpertype = normal
stateno = 9500
id = 9500
name ="Image"
postype = p1
pos = 0,0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State 3000, Explode]
type = null;Helper
trigger1 = time = 3
helpertype = normal ;player
name = "MAX Level"
ID = 9215
stateno = 9215
pos = -30,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999


[State 3500, Helper]
type = Helper
triggerall = NumHelper(3510) =0
trigger1 = animelem = 8
helpertype = player
name = "Fanton Kenjin"
stateno = 3510
ID = 3510
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
pausemovetime = 999999
supermovetime = 999999
ownpal = 1



[State 3500, Width]
type = Width
trigger1 = AnimElem = 6
value = 32,0


[State 3500, ChangeState]
type = ChangeState
trigger1 = time = 95
value = 3001
ctrl = 0

;------------------------------------------------------------------------
; Jumonji - Movement
[Statedef 3510]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 3010
sprpriority = 1

[State 3510, PlayerPush]
type = PlayerPush
trigger1 = time<50
value = 1


[State 3510, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1
ignorehitpause = 1


[State 3510, Kunai Sounds]
type = PlaySnd
trigger1 = time = 0
trigger2 = time = 2
trigger3 = time = 4
trigger4 = time = 6
trigger5 = time = 8
trigger6 = time = 10
trigger7 = time = 14
trigger8 = time = 20
trigger9 = time = 28
trigger10 = time = 40
trigger11 = time = 52
trigger12 = time = 70
value = 1600, 0

[State 3510, Helper]
type = Helper
trigger1 = time = 0
trigger2 = time = 55
helpertype = normal ;player
name = "kunai_1"
ID = 3511
stateno = 3511
pos = 0,-120
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 5
trigger2 = time = 60
helpertype = normal ;player
name = "kunai_2"
ID = 3512
stateno = 3512
pos = 0,-130
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 10
trigger2 = time = 65
helpertype = normal ;player
name = "kunai_3"
ID = 3513
stateno = 3513
pos = 0,-130
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 15
trigger2 = time = 70
helpertype = normal ;player
name = "kunai_4"
ID = 3514
stateno = 3514
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 20
trigger2 = time = 75
helpertype = normal ;player
name = "kunai_5"
ID = 3515
stateno = 3515
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 25
trigger2 = time = 80
helpertype = normal ;player
name = "kunai_6"
ID = 3516
stateno = 3516
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 30
trigger2 = time = 85
helpertype = normal ;player
name = "kunai_7"
ID = 3517
stateno = 3517
pos = 0,-130
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 40
trigger2 = time = 90
helpertype = normal ;player
name = "kunai_8"
ID = 3518
stateno = 3518
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, Helper]
type = Helper
trigger1 = time = 50
trigger2 = time = 95
helpertype = normal ;player
name = "kunai_9"
ID = 3519
stateno = 3519
pos = 0,-130
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 3510, AssertSpecial]
type = AssertSpecial
trigger1 = time>100
trigger1 = time%3 = 0
flag = invisible


[State 3510, DestroySelf]
type = DestroySelf
trigger1 = time >= 100

;---------------------------------------------------------------------------
; Jumonji Heavy Kunai #1
[Statedef 3511]
type    = A
movetype = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0
sprpriority = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999


[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;---------------------------------------------------------------------------
; Jumonji Heavy Kunai #2
[Statedef 3512]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999


[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = -3
y = -12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;---------------------------------------------------------------------------
; Jumonji Heavy Kunai #3
[Statedef 3513]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999
;ignorehitpause =
;persistent =



[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0
;--------------------------------------------------------------------------
; Jumonji Heavy Kunai #4
[Statedef 3514]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999

[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0


;--------------------------------------------------------------------------
; Jumonji Heavy Kunai #5
[Statedef 3515]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999


[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = -3
y = -12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;--------------------------------------------------------------------------
; Jumonji Kunai #6
[Statedef 3516]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999



[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;--------------------------------------------------------------------------
; Jumonji Kunai #7
[Statedef 3517]
type    = A
movetype= A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999

[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;--------------------------------------------------------------------------
; Jumonji Kunai #8
[Statedef 3518]
type    = A
movetype = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5


[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999

[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = 3
y = 12


[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0

;--------------------------------------------------------------------------
; Jumonji Kunai #9
[Statedef 3519]
type    = A
movetype = A
physics = N
juggle  = 1
velset = 0,0
ctrl = 0
anim = 3510
poweradd = 0

[State 0, SprPriority]
type = SprPriority
trigger1 = vel y <= 0
value = -3
[State 0, SprPriority]
type = SprPriority
trigger1 = vel y > 0
value = 5

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 99999

[State 1001, VelSet]
type = VelSet
trigger1 = time = 0
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 5
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 10
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 15
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 20
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 25
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 30
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 35
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 40
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 45
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 50
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 55
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 60
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 65
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 70
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 75
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 80
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 85
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 90
x = -3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 95
x = 3
y = -12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 100
x = 3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 105
x = -3
y = 12

[State 1001, VelSet]
type = VelSet
trigger1 = time = 110
x = -3
y = -12


[State 1001, Shoot]
type = ChangeState
triggerall = time > 0 && time < 110
trigger1 = Root,stateno = 3001
trigger2 = Root, movetype = H
trigger3 = Helper(3510),stateno != 3510
value = 3520
ctrl = 0

[State 1001, Shoot]
type = ChangeState
trigger1 = time >= 110
value = 3520
ctrl = 0


;---------------------------------------------------------------------------
; Jumonji Kunai Flight
[Statedef 3520]
type    = A
movetype = A
physics = N
juggle  = 0
velset = 0,0
ctrl = 0
anim = 3511
sprpriority = 5


[State 1000, HitBy]
type = HitBy
trigger1 = 1
value = SCA,AA,AP
time = -1


[State 1000, HitOverride]
type = HitOverride
trigger1 = 1
stateno = 1007
attr = SCA,AA,AP
time = -1

[State 3520, Hitdef]
type = hitdef
;triggerall = numhelper(993) < 1
trigger1 =  prevstateno = 3511 && time = 0
trigger2 =  prevstateno = 3512 && time = 0
trigger3 =  prevstateno = 3513 && time = 0
trigger4 =  prevstateno = 3514 && time = 0
trigger5 =  prevstateno = 3515 && time = 0
trigger6 =  prevstateno = 3516 && time = 0
trigger7 =  prevstateno = 3517 && time = 0
trigger8 =  prevstateno = 3518 && time = 0
trigger9 =  prevstateno = 3519 && time = 0
attr = A, HP
damage = 25,4
getpower  = 0
priority = 6, hit
animtype = heavy
guardflag = MA
hitflag = MAFP
pausetime = 1,5
sparkno = S8420+random%6
guard.sparkno = S8142
hitsound  = S1000,3
guardsound = S3,0
ground.type = high
ground.slidetime = 25
ground.hittime  = 25
air.hittime = 25
ground.velocity = -5
air.velocity = -3,-3.5
air.fall = 1
fall.recover = 0
p2facing = 1
forcestand = 1
envshake.time = 8
envshake.ampl = 5


[State 2125, Kunai Sounds]
type = PlaySnd
trigger1 = prevstateno = 3511 && time = 0
trigger2 = prevstateno = 3512 && time = 8
trigger3 = prevstateno = 3513 && time = 16
trigger4 = prevstateno = 3514 && time = 24
trigger5 = prevstateno = 3515 && time = 32
trigger6 = prevstateno = 3516 && time = 40
trigger7 = prevstateno = 3517 && time = 48
trigger8 = prevstateno = 3518 && time = 56
trigger9 = prevstateno = 3519 && time = 64
value = 1600, 0


[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3511
trigger1 = time > 0 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3512
trigger1 = time > 8 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3513
trigger1 = time > 16 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3514
trigger1 = time > 24 ;time > 0
x = 9


[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3515
trigger1 = time > 32 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3516
trigger1 = time > 40 ;time > 0
x = 9


[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3517
trigger1 = time > 48 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3518
trigger1 = time > 56 ;time > 0
x = 9

[State 0, VelSet]
type = VelSet
Triggerall = prevstateno = 3519
trigger1 = time > 64 ;time > 0
x = 9


[State 1005, 3]
type = Changestate
trigger1 = Movehit = 1
value = 1006
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded = 1
value = 1007
IgnoreHitpause = 1


[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40

;---------------------------------------------------------------------------
;Utsusemi
[Statedef 3600]
type = S
movetype = I
physics = S
anim = 1600
ctrl = 0
velset = 0,0
sprpriority = 1
powerAdd = 0
facep2 = 1

[State 1600, 1]
type = PlaySnd
trigger1 = Animelem = 8
value = 1600, 0
;channel = 3



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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

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
pausemovetime = 999999
supermovetime = 999999

[State 1100,Change]
type = ChangeState
trigger1 = animTime = 0
value = 3601

;-------------------------------------------------------------------------------
;Utsusemi
[Statedef 3601]
type = A
movetype = I
physics = N
velset = 0,0
anim = 3600

[State 230, 1]
type = PlaySnd
trigger1 = anim = 3600
trigger1 = Animelem = 1
value = 1600, 0
;channel = 3


[State 0, PalFX]
type = PalFX
trigger1 = anim = 3600
trigger1 = time = 0
time = 25
add = -256,-256,-256
sinadd = 256,256,256,50
invertall = 0
color = 256

[State 2200, Super Pause]
type = SuperPause
trigger1 = anim = 3600
trigger1 = AnimElem = 1
Time = 45
movetime = 45
pos = 20, -187
anim = S9100
sound = S9100,0
poweradd = -1000

;----------------------

[State 0, VarSet carga Bg]
type = VarSet
trigger1 = anim = 3600
trigger1 = animelem = 1
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = anim = 3600
trigger1 = animelem = 1
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = anim = 3600
trigger1 = time > 1
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------


[State 1000, Spark]
type = Explod
triggerall = anim = 3600
trigger1 = time = 0
trigger2 = time = 5
Anim = 1601
id = 1601
pos = 0, 0
postype = p1
ownpal = 1
sprpriority = 5
bindtime = 1
ignorehitpause=0
scale = const(size.xscale),const(size.yscale)
pausemovetime = 999999
supermovetime = 999999


[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 1600, Projectile]
type = Projectile
triggerall = anim = 3600
trigger1 = (time = [3,15])
trigger1 = time%4 = 0
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
pausemovetime = 999999
supermovetime = 999999

[State 2102, Turn]
type = Turn
triggerall = anim = 3600
trigger1 = p2dist x <= -4

[State 0, PosSet]
type = PosSet
triggerall = anim = 3600
trigger1 = time = 0
y = -120

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = anim = 3600
trigger1 = time = 25
value = 3601


[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 8; animelem = 2
trigger2 = time = 60; animelem = 15
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = 5,-5;-20
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 16;animelem = 4
trigger2 = time = 36;animelem = 9
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = 5,-155;-170
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 24; animelem = 6
trigger2 = time = 76; animelem = 19
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = 55,-115;-130
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 32;animelem = 8
trigger2 = time = 20;animelem = 5
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = -55,-115;-130
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 40 ;animelem = 10
trigger2 = time = 12 ;animelem = 3
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = 55,-35;-50
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 48;animelem = 12
trigger2 = time = 68;animelem = 17
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = -55,-35;-50
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 56;animelem = 14
trigger2 = time = 52;animelem = 13
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = 75,-75;-90
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 64; animelem = 16
trigger2 = time = 28; animelem = 7
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = -75,-75;-90
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[State 2220, Kunai]
type = Helper
triggerall = anim = 3601
trigger1 = time = 72 ;animelem = 18
trigger2 = time = 44;animelem = 11
helpertype = normal ;player
name = "Air Tracker2"
ID = 3610
stateno = 3610
pos = -20,15;0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
supermovetime =99999
pausemovetime =99999

[state 3601, ChangeState]
type = ChangeState
triggerall = anim = 3601
trigger1 = time = 150
value = 3602
ctrl = 0

;-------------------------------------------------------------------------------
;Utsusemi
[Statedef 3602]
type = A
movetype = I
physics = N
velset = 0,0
anim = 1610

[State 3602, ChangeAnim]
type = ChangeAnim
trigger1 = time = 3
value = 1610
elem = 2


[state 3602, Gravity]
type = Gravity
trigger1 = AnimElemTime(3)>=1

[state 3602, ChangeState]
type = ChangeState
trigger1 = Vel Y>0 && Pos Y>=-Vel Y
value = 52

;----------------------------------------------------
;Jumonji Helper 1
[Statedef 3610]
type = A
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0,0
anim = 3610
sprpriority = 4

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = time<25
trigger1 = time%3 = 0
flag = invisible

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = -1

[State 8500, time]
type = varset
trigger1 =!time
var(50)= 40

[State 8500, rotate]
type = angleset
trigger1 =!time
value = 0

[State 8500, rotate]
type = angleadd
trigger1 = 1
value = -12

[State 8500, scale]
type = angledraw
trigger1 = time<var(50)
scale = 1,1;1.2-1.2*((time*1.0)/var(50)),1.2-1.2*((time*1.0)/var(50))

[State 8500, scale]
type = angledraw
trigger1 = time>=var(50)
scale = 0,0

[State 3610, DestroySelf]
type = changestate
trigger1 = time >=15;MoveContact || frontedgedist = 0
value = 3611
;-------------------------------------------------------------------------
;Jumonji Helper 2
[Statedef 3611]
type = A
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0,0
anim = 3611
sprpriority = 4


[State 2212, 1]
type = PlaySnd
trigger1 = Time = 1
value = S3600,0

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = p2bodydist x < 30
trigger1 = p2bodydist y < 5
value = 3612
persistent = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = p2bodydist x < 30
trigger1 = p2bodydist y >=50
value = 3613
persistent = 0

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = p2bodydist y > 20
trigger1 = p2bodydist x = -5
value = 3614
persistent =0


[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = p2bodydist y <= 40
trigger1 = p2bodydist x = -5
value = 3615
persistent = 0

[State 2210 VelSet]
type = VelSet
trigger1 = 1
x = ifelse(anim = 3611,7,ifelse(anim=3614,0,7))
y = ifelse(anim = 3611,0,ifelse(anim=3612,-6,6))


[State 1000, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AA,AP
time = -1

[State 1000, HitOverride]
type = HitOverride
trigger1 = time>=0
stateno = 1007
attr = SCA,AA,AP
time = -1


[State 3610, Kunai Hit]
type = HitDef
trigger1 = time = 0
attr = A, HP
damage = 22, 3
getpower  = 0
priority = 7, hit
animtype  = Hard
hitflag = MAFPDL
guardflag = MA
pausetime = 3,5
sparkno = S8420+random%8
guard.sparkno = S8141
sparkxy = 0,0
hitsound  = S1000,3
guardsound = S3,0
ground.type = Low
ground.slidetime = 6
guard.slide = -5
ground.hittime  = 18
ground.velocity = -2, -6
guard.velocity = -25
air.velocity = -2,-6
airguard.velocity = -13, -6
air.hittime  = 18
forcestand = 1
air.fall = 1
fall = 1                   ;Make p2 fall down
fall.recover = 0      ;40 ticks before p2 can recover from fall
down.velocity = -3,-3
down.hit = 1
ignorehitpause = 0
envshake.time = 8
envshake.ampl = 4

[State 1005, 3]
type = Changestate
trigger1 = anim = 3611
trigger1 = Movehit = 1
value = 3615
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = anim = 3612
trigger1 = Movehit = 1
value = 3616
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = anim = 3612
trigger1 = Movehit = 1
value = 3617
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = anim = 3613
trigger1 = Movehit = 1
value = 3618
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = anim = 3614
trigger1 = Movehit = 1
value = 3619
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = anim = 3615
trigger1 = Movehit = 1
value = 3620
IgnoreHitpause = 1

[State 1005, 3]
type = Changestate
trigger1 = Moveguarded = 1
trigger2 = pos y > -5
value = 1007
IgnoreHitpause = 1


[State 4110, DestroySelf]
type = DestroySelf
trigger1 = FrontEdgeDist <= -40

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 3615]
type  = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2

[State 8100,fire]
type = explod
trigger1 = time = 0
anim = 3616
id = 3616
pos = (abs(const(size.mid.pos.x))),-55-(abs(const(size.mid.pos.y)))+random%30
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1



[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 3616]
type  = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2


[State 8100,fire]
type = explod
trigger1 = time = 0
anim = 3617
id = 3617
pos = (abs(const(size.mid.pos.x))),-55-(abs(const(size.mid.pos.y)))+random%30
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 3618]
type  = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2


[State 8100,fire]
type = explod
trigger1 = time = 0
anim = 3618
id = 3618
pos = (abs(const(size.mid.pos.x))),-55-(abs(const(size.mid.pos.y)))+random%30
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 3619]
type  = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2



[State 8100,fire]
type = explod
trigger1 = time = 0
anim = 3619
id = 3619
pos = (abs(const(size.mid.pos.x))),-55-(abs(const(size.mid.pos.y)))+random%30
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;-------------------------------------------------------------------------------
;Hit Pause
[StateDef 3620]
type  = A
movetype = I
physics = N
velset = 0,0
anim = 9999
ctrl = 0
sprpriority = 2


[State 8100,fire]
type = explod
trigger1 = time = 0
anim = 3620
id = 3620
pos = (abs(const(size.mid.pos.x))),-55-(abs(const(size.mid.pos.y)))+random%30
bindtime = -1
postype = p2
ownpal = 1
facing = -1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = 1,1


[State 1006, destroyself]
type = destroyself
trigger1 = Animtime = 5

;---------------------------------------------------------------------------
; Hyper Bakuryusho  (Prepare)
;Hyper Bakuryusho
[Statedef 3900]
type    = S
movetype = A
physics = S
juggle  = 0
ctrl = 0
velset = 0,0
anim = 3900
sprpriority = 2

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 1
value = 11,0

[State 3100, Voice]
type = PlaySnd
trigger1 = AnimElem = 23
value = 1600,1
;channel = 0

[State 3100, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 25
value = 1600,0
;channel = 1

[State 1000, Explod]
type = Explod
trigger1 = animelem = 2, = 0
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

[State 2058, Super Pause]
type = SuperPause
trigger1 = animelem = 2
time = 60
movetime = 60
pos = 5,-73
anim = S9104
sound = S9101,0
poweradd= -3000

;----------------------

[State 0, VarSet carga Bg]
type = VarSet
trigger1 = animelem = 2
v = 45   ;fv = 10
value = 1

[State 3150, Explode]
type = Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "Level Max"
ID = 9207
stateno = 9207
pos = 0,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = animelem = 2
helpertype = normal
stateno = 9200
ID = 9200
name ="hyperbg"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999
ignorehitpause = 1

[State 0, WinKO]
type = AssertSpecial
triggerall = !var(16)
trigger1 = time > 10
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1
;----------------------

[State 9500]
type = Helper
triggerall = numhelper(9500)=0
trigger1 = animelem = 2
helpertype = normal
stateno = 9500
id = 9500
name ="Image"
postype = p1
pos = 0,0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State 3000, Explode]
type = null;Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "Level 1"
ID = 9205
stateno = 9205
pos = 0,0
sprpriority = 5
facing = 1
pausemovetime = 999999
supermovetime = 999999

[State 2060, ScreenBound]
type = ScreenBound
trigger1 = animelemtime(28)>=0&&animelemtime(39)<10
value = 0
movecamera = 0,0

[State 2059, Helper]
type = Helper
trigger1 = animelem = 29
helpertype = normal ;player
name = "Geyser1"
ID = 3905
stateno = 3905
pos = p2dist X,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1

[State 1100, Explod]
type = Explod
trigger1 = animelem = 26
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

[State 2060, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 3901
ctrl = 0
;---------------------------------------------------------------------------
; Hyper Bakuryusho
[Statedef 3901]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 3901
sprpriority = 2


[State 2060, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0

[State 1015, 1]
type = ChangeState
trigger1 = BackEdgeDist <= -70
value = 3902


[State 2060, ChangeState]
type = ChangeState
trigger1 = time >= 327 ;&& BackEdgeDist >= -10 ;This is true only if he is NOT offscreen
trigger2 = Helper(3910), stateno = 1111
value = 0
ctrl = 1
;---------------------------------------------------------------------------
;================================< RUN >========================================
[Statedef 3902]
type = S
movetype = I
physics = N
ctrl = 0
sprpriority = 1


[State 3110, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 100
value = 100

[State 1016, 1]
type = ScreenBound
trigger1 = 1
value = 0

[State 1016, 2]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 7)
value = 100, ifElse((AnimElem = 3), 0, 1)


[State 2060, ChangeState]
type = ChangeState
trigger1 = animtime = 0;This is true only if he is NOT offscreen
value = 3901
ctrl = 0

;----------------------------------------------------------------------------
; Hyper Bakuryusho (Geyser 1)
[Statedef 3905]
type    = S
movetype= A
physics = S
juggle  = 2
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = 7
hitdefpersist = 1


[State 2059, Helper]
type = Helper
trigger1 = numhelper(3910) = 0
trigger1 = time = 0
helpertype = normal ;player
name = "Geyser1"
ID = 3910
stateno = 3910
pos = p2dist X,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999
ignorehitpause = 1


[State 2060, Helper]
type = Helper
trigger1 = numhelper(3911) = 0
trigger1 = time = 30
helpertype = normal ;player
name = "Geyser2"
ID = 3911
stateno = 3910
pos = p2dist X +100,-25;100,-5;p2dist X +100,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermove = 1

[State 2060, Helper]
type = Helper
trigger1 = numhelper(3912) = 0
trigger1 = time = 60
helpertype = normal ;player
name = "Geyser3"
ID = 3912
stateno = 3910
pos = p2dist X -100,-25;-100,-5;p2dist X -100,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermove = 1

[State 2060, Helper]
type = Helper
trigger1 = numhelper(3913) = 0
trigger1 = time = 90
helpertype = normal ;player
name = "Geyser4"
ID = 3913
stateno = 3910
pos = p2dist X +55,25;50,25;p2dist X +50,10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermove = 1


[State 2060, Helper]
type = Helper
trigger1 = numhelper(3914) = 0
trigger1 = time = 120
helpertype = normal ;player
name = "Geyser5"
ID = 3914
stateno = 3910
pos = p2dist X -55,25;-50,25;p2dist X -50,-10
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
supermove = 1


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 130
trigger2 = root,movetype = H
;-------------------------------------------------------------------------------
;Hyper Bakuryusho Geyser Geyser
[Statedef 3910]
type  = S
movetype = A
physics = N
ctrl = 0
juggle = 0
velset = 0,0
sprpriority = ifelse(pos y >=0,4,-3)
hitdefpersist = 1

[State 3910, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0 && anim != 1110
value = 1110

[State 3910, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = S3100,5
;channel = 1

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

[State 3910, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 10
ampl = 10

[State 3910, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 3910, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,AP
time = -1
ignorehitpause = 1
persistent = 1

[State 3910, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,AP
stateno = 1111
time = -1
ignorehitpause = 1
persistent = 1

[State 3910, Explod]
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


[state 3910]
type = velset
trigger1 = IsHelper(3910)
trigger1 = time >180
trigger2 = IsHelper(3911)
trigger2 = time >140
trigger3 = IsHelper(3912)
trigger3 = time >100
trigger4 = IsHelper(3913)
trigger4 = time >60
trigger5 = IsHelper(3914)
trigger5 = time >20
X = cos(time/8) * 1/4 * 20* pi
Y = -sin(time/8) * 1/4 * 2* pi



[state 3910, spr]
type = sprpriority
trigger1 = time =0
trigger1 = pos y >=0
value = 4

[state 3910, spr]
type = sprpriority
trigger1 = time =0
trigger1 = pos y <0
value = -3

[State 1510, Button Detect Damage]
type = VarSet
trigger1= !Time && !PrevStateNo
var(22) = Root,var(22)

[State 3910, HitDef]
type = HitDef
triggerall = var(22)!= 1
triggerall = var(22)!= 2
triggerall = var(22)!= 3
trigger1 = time%15 = 0
attr = S, HP
damage = ifelse(hitcount<1,20,10),2
getpower  = 0
priority = 6, hit
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,8
guard.pausetime = 1,10
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = ifelse(hitcount<1,8,6)
ground.hittime  = ifelse(hitcount<1,20,10)
ground.velocity = ifelse(hitcount<1,-1,-.2),ifelse(hitcount<1,-9,-3)
guard.velocity = -25
air.velocity = ifelse(hitcount<1,-1,-.4),ifelse(hitcount<1,-10,-3.3)
airguard.velocity = ifelse(hitcount<1,-2,-3),ifelse(hitcount<1,-6,-5)
p2facing = 1
forcestand = 1
yaccel = .6               ;p2 will accelerate down at .4 pixels/sec^2 when falling
air.fall = 1
fall = 1                   ;Make p2 fall down
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
sprpriority = ifelse(pos y >=0,4,-3)
fall.recover = 0
palfx.time = 100
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,25
Palfx.color = 256;0
palfx.invertall = 1
envshake.time = 8
envshake.ampl = 7

[State 3910, Hit]
type = HitDef
trigger1 = var(22) = 1
trigger1 = time%15 = 0
attr = S, HP
damage = ifelse(hitcount<1,25,12),3
getpower  = 0
priority = 6, hit
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,8
guard.pausetime = 1,10
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = ifelse(hitcount<1,8,6)
ground.hittime  = ifelse(hitcount<1,20,10)
ground.velocity = ifelse(hitcount<1,-1.5,-.4),ifelse(hitcount<1,-9.5,-3.5)
guard.velocity = -25
air.velocity = ifelse(hitcount<1,-1.5,-.8),ifelse(hitcount<1,-10.5,-3.8)
airguard.velocity = ifelse(hitcount<1,-6.5,-4.5),ifelse(hitcount<1,-6.5,-5.5)
p2facing = 1
forcestand = 1
yaccel = .4                ;p2 will accelerate down at .4 pixels/sec^2 when falling
air.fall = 1
fall = 1
fall.recover = 1                    ;Make p2 fall down
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
sprpriority = ifelse(pos y >=0,4,-3)
fall.recover = 0
palfx.time = 100
palfx.add = 240,50,0
palfx.mul = 250,224,120
palfx.sinadd = 110,55,85,25
Palfx.color = 256;0
palfx.invertall = 1
envshake.time = 15
envshake.ampl = 8

[State 3910, Hit]
type = HitDef
trigger1 = var(22) = 2
trigger1 = time%15 = 0
attr = S, HP
damage = ifelse(hitcount<1,15,4),0
getpower  = 0
priority = 6, hit
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,8
guard.pausetime = 1,10
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = ifelse(hitcount<1,8,6)
ground.hittime  = ifelse(hitcount<1,20,10)
ground.velocity = ifelse(hitcount<1,-1,-.5),ifelse(hitcount<1,-7,-2)
guard.velocity = -25
air.velocity = ifelse(hitcount<1,-1,-.5),ifelse(hitcount<1,-8,-2.3)
airguard.velocity = ifelse(hitcount<1,-6,-4),ifelse(hitcount<1,-6,-5)
p2facing = 1
forcestand = 1
yaccel = .6
air.fall = 1
fall = 1
fall.recover = 1                    ;Make p2 fall down
ground.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
sprpriority = ifelse(pos y >=0,4,-3)
palfx.time = 30
palfx.add = 100,100,100
palfx.sinadd = -80,-80,-80,10
envshake.time = 8
envshake.ampl = 5

[State 3910, Hit]
type = HitDef
trigger1 = var(22) = 3
trigger1 = time%20 = 0
attr = S, HP
damage = ifelse(hitcount<1,10,-6),-1
getpower  = 0
priority = 6, hit
animtype  = up
hitflag = MAFPDL
guardflag = MA
pausetime = 1,0
guard.pausetime = 1,0
sparkno = S8007
guard.sparkno = S8142
sparkxy = 0,(enemynear,const(size.head.pos.y)=-150)
hitsound = S2,22+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = 8
ground.hittime  = 8
ground.velocity = -2, -6
guard.velocity = -1
air.velocity = -2,-7
airguard.velocity = -1, 0
p2facing = 1
forcestand = 1
yaccel = .6               ;p2 will accelerate down at .4 pixels/sec^2 when falling
sprpriority = ifelse(pos y >=0,4,-3)
palfx.time = 30
palfx.add = 100,100,100
palfx.sinadd = -80,-80,-80,10
envshake.time = 8
envshake.ampl = 2

[state 3910,FireSparks]
type = helper
triggerall = parent,var(22) != 3
trigger1 = !numhelper(8100)
trigger1 = numtarget&&MoveHit = 1
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


[State 3910, EnvShake]
type = EnvShake
trigger1 = AnimElem = 1
time = 40
freq = 200
ampl = -5
phase = 125


[State 3910, 3]
type = changestate
trigger1 = IsHelper(3910)
trigger1 = time >340
trigger2 = IsHelper(3911)
trigger2 = time >300
trigger3 = IsHelper(3912)
trigger3 = time >260
trigger4 = IsHelper(3913)
trigger4 = time >220
trigger5 = IsHelper(3914)
trigger5 = time >180
trigger6 = root,movetype = H
value = 1111


