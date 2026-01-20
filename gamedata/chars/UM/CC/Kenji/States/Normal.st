;===============================================================================
;===========================<NORMAL MOVES>======================================
;===============================================================================
;-------------------------------------------------------------------------------
; Standing Light Punch
[Statedef 200]
type = S
physics = S
movetype = A
anim = 200
ctrl = 0
juggle  = 0
velset = 0,0
sprpriority = 1
poweradd = 20
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1,6
channel = 1


[State 200, 1]
type = HitDef
trigger1 = AnimElem = 3
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 30,1                  ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = M                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 2, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
pausetime = 7, 8                 ;Time attacker pauses, time opponent shakes
sparkno = S8400+random%8                      ;Spark anim no (Def: set above)
sparkxy = -40, -73               ;X-offset for the "hit spark" rel. to p2,
guard.sparkno = S8140
hitsound = S2,8
guardSound = S3,0
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 10             ;Time that the opponent slides back
ground.hittime  = 16             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -3.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -2.6,-3.3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 22                 ;Time before opponent regains control in air
ground.cornerpush.veloff = -9
guard.cornerpush.veloff = -12.6
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 2


[State 200, Helper]
type = Helper
trigger1 = animelem = 2
helpertype = normal ;player
name = "Light Slash Flash"
ID = 201
stateno = 201
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0
pausemovetime = 999999
supermovetime = 999999

[State 200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Light Slash Flash
[Statedef 201]
physics = N
velset = 0,0
anim = 201
ctrl = 0
sprpriority = 3

[State 200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 201, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 201, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

[State 201, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H || parent, anim != 200
trigger2 = animtime = 0



;---------------------------------------------------------------------------
; Standing Medium Punch
[Statedef 210]
type = S
physics = S
movetype = A
anim = 210
ctrl = 0
juggle  = 0
velset = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1


[State 210, playsnd]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0

[State 210, playsnd]
type = playsnd
trigger1 = animelem = 4
value = 1,7
channel = -1

[State 210, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,15
channel = 2


[State 210, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 40,1
animtype = medium
guardflag = MA
hitflag = MAF
priority = 3, Hit
pausetime = 9, 9
sparkno = S8410+random%8
sparkxy = -5, -67
guard.sparkno = S8140
hitsound = S2,9
guardSound = S3,0
ground.type = High
ground.slidetime = 16
ground.hittime  = 21
ground.velocity = -6
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -4,-3.5
air.hittime = 16
ground.cornerpush.veloff = -3.5
guard.cornerpush.veloff = -4
air.cornerpush.veloff = -8.6
envshake.time = 8
envshake.ampl = 3


[State 210, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "Stand Medium Puch Slash"
ID = 211
stateno = 211
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0
pausemovetime = 999999
supermovetime = 999999


[State 210, Spin Kick]
type = ChangeState
value = 215
triggerall = time >= 5 && time < 10  && movecontact > 0
trigger1 = command = "y"

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Stand Medium Puch Slash
[Statedef 211]
physics = N
velset = 0,0
anim = 211
ctrl = 0
sprpriority = 3

[State 200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 211, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 211, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

[State 211, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H || parent, anim != 210
trigger2 = animtime = 0
;---------------------------------------------------------------------------
; Standing Medium Punch Fwd
[Statedef 215]
type    = S
movetype = A
physics = N
anim = 215
ctrl = 0
juggle  = 0
velset = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 215, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A       ;S,A,C,L
physics = N         ;A,C,S,N

[State 215, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 11
statetype = A       ;S,A,C,L
physics = N         ;A,C,S,N

[State 350]
type = velSet
trigger1 = AnimElem = 2
x = 5

[State 0, VelAdd]
type = VelAdd
trigger1 = AnimElemtime(2)>0 && animelemtime(11)<0
x = -.1
y = 0

[State 210, Snd]
type=playsnd
trigger1= animelem=4
value= 4,1
channel = 0

[State 210, Snd]
type = playsnd
trigger1 = animelem=4
value = 1,7
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 2,15
channel = 2


[State 215, HitDef]
type = HitDef
trigger1 = AnimElem = 6
attr = S, NA
damage = 46,2
animtype = Medium
guardflag = MA
hitflag = MAFP
priority = 5, Hit
pausetime = 9, 9
sparkno = S8410+random%8
sparkxy = 10, -75
guard.sparkno = S8140
hitsound = S2,9
guardSound = S3,0
ground.type = High
ground.slidetime = 20
ground.hittime  = 25
ground.velocity = -10, 0
airguard.velocity = -3.9,-.8
air.type = Low
air.velocity = -8,-3
yaccel = .5
Forcestand = 1
air.hittime = 27
p2facing = 1        ;Force to face p1
air.fall = 1
ground.cornerpush.veloff = -6
guard.cornerpush.veloff = -.6
air.cornerpush.veloff = -10.6
envshake.time = 8
envshake.ampl = 3
;p2stateno = 290

[State 350]
type = velSet
trigger1 = AnimElem = 11
x = 0


[State 210, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "Stand Medium Puch Slash Fwd"
ID = 216
stateno = 216
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0
pausemovetime = 999999
supermovetime = 999999

[State 215, Landing FX]
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

[State 215, Landing]
type = PlaySnd
trigger1 = animelem = 11
value = 52,0

[State 210, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Stand Medium Puch Slash Fwd
[Statedef 216]
physics = N
velset = 0,0
anim = 216
ctrl = 0
sprpriority = 3

[State 200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 211, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 211, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

[State 211, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H || parent, anim != 215
trigger2 = animtime = 0
;---------------------------------------------------------------------------
; Standing Far Strong Punch
[Statedef 220]
type = S
physics = S
moveType = A
anim = 220
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 38 * !var(20)
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 6
value = 4, 2
channel = 0

[State 220, Snd]
type = playsnd
trigger1 = animelem = 2
value = 2,17
channel = 2

[State 220, Snd]
type = playsnd
trigger1 = animelem = 7
value = 2,16
channel = 2

[State 220, Hitdef]
type = hitdef
trigger1 = animelem = 8
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 68, 0
getpower = 20,20
givepower = 36, 36
hitsound = S2,10
guardSound = S3,0
sparkno = S8420+random%8
guard.sparkno = S8140
sparkxy = -10 ,-50
pausetime = 10, 14
guard.pausetime = 6,12
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 24
ground.slidetime = 22
guard.hittime = 20
air.hittime = 26
ground.velocity = -10, 0
guard.velocity = -4
air.velocity = -5.39, -2.65
air.cornerPush.velOff = 0
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 5

[State 220, Hitdef]
type = hitdef
trigger1 = movehit
trigger1 = animelem = 10
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 25, 3
getpower = 10,10
givepower = 16, 16
hitsound = S2,10
guardSound = S3,0
sparkno = S8420+random%8
guard.sparkno = S8140
sparkxy = -10 ,-50
pausetime = 12, 12
guard.pausetime = 6,10
animtype = hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 24
ground.slidetime = 22
guard.hittime = 20
air.hittime = 26
ground.velocity = 6, 0
guard.velocity = -4
air.velocity = -5.39, -2.65
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 3

[State 220, ChangeState]
type = ChangeState
triggerall = AnimElemTime(10)>0 && AnimElemTime(14)<0 ;&& movecontact
trigger1 = !AILevel
trigger1 = command = "z"
trigger2 = AILevel
trigger2 = movehit && random<500
value = 221


[State 220, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Strong Punch
[Statedef 221]
type = S
physics = S
moveType = A
anim = 221
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 38 * !var(20)
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 5
value = 2,16
channel = 2

[State 220, Hit]
type=hitdef
trigger1= animelem=6
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = ceil(ifelse(fvar(11)*58<7, 7, fvar(11)*58)), 0
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 12, 12
guard.pausetime = 10, 12
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
guard.hittime = 18
air.hittime = 22
ground.velocity = -8.52, 0
guard.velocity = -4.86
air.velocity = -5.39, -5.65
yAccel = 0.58
fall = 1
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 7



[State 220, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Standing Hard Punch - Close
[StateDef 225]
type = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 225
poweradd = 40
sprpriority = 2

[State 225, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 1,2

[State 225, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 4,7

[State 225, Slide]
type = Velset
trigger1 = (Time > 0) && (time <= 10) && (PrevStateNo = 100)
x = 5.5

[State 225, Dust]
type = Explod
trigger1 = Animelem = 1 && (PrevStateNo = 100)
trigger2 = Animelem = 3 && (PrevStateNo = 100)
trigger3 = Animelem = 5 && (PrevStateNo = 100)
trigger4 = Animelem = 7 && (PrevStateNo = 100)
anim = 5556
ID = 240
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


[State 225, Advance]
type = VelSet
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
x = 13


[State 225, Stop]
type = VelSet
trigger1 = animelem = 4
x = 0


[State 225, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 49,2
animtype = hard
guardflag = MA
hitflag = MAF
priority = 3, Hit
hitsound = s2, 9
guardSound = S3,0
pausetime = 12, 16
sparkno = S8410+random%4
guard.sparkno = S8140;s5570
sparkxy = -10, -55
ground.type = High
ground.slidetime = 12
ground.hittime  = 20
ground.velocity = -7
airguard.velocity = -2.9,-.8
air.type = High
air.velocity = -4.9,-3.5
air.hittime = 20
ground.cornerpush.veloff = -4
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -7.6
envshake.time = 8
envshake.ampl = 4



[State 225, ChangeState]
type = ChangeState
triggerall = animelemtime(6) >= 0 && animelemtime(14) < 0
trigger1 = !AILevel
trigger1 = command = "z" && movecontact > 0
trigger2 = AILevel
trigger2 = movehit && random<500
value = 226

[State 225, ChangeState]
type = ChangeState
triggerall = animelemtime(6) >= 0 && animelemtime(14) < 0
trigger1 = !AILevel
trigger1 = command = "c" && movecontact > 0
trigger2 = AILevel
trigger2 = movehit && random>800
value = 250

[State 225, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;------------------------------------------------------------------------
; Body Check
[StateDef 226]
type = S
movetype= A
physics = S
velset = 0,0
ctrl = 0
juggle  = 0
anim = 226
poweradd = 50
sprpriority = 2


[State 226, 1]
type = PlaySnd
trigger1 = animelem = 4
value = 4, 5

[State 226, Advance]
type = VelSet
trigger1 = animelem = 1
trigger2 = animelem = 2
trigger3 = animelem = 3
x = 10


[State 226, Stop]
type = VelSet
trigger1 = animelem = 4
x = 0



[State 226, HitDef]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
damage = 49
animtype = hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = S8003
guard.sparkno = S8140
sparkxy = -5, -50
hitsound = s2, 22
guardSound = S3,0; S3,0; s3,0
ground.type = low
ground.slidetime = 10
ground.hittime  = 20
ground.velocity = -14, -5
Fall = 1
airguard.velocity = -4.9,-.9
air.type = High
air.velocity = -14,-5
air.hittime = 20
air.fall = 1
fall.recover = 1
ground.cornerpush.veloff = -5
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 7




[State 241, end]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1
;---------------------------------------------------------------------------
; Standing Light Kick
[Statedef 230]
type    = S
physics = S
moveType = A
anim = 230
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20
facep2 = 1

[State 230, Snd]
type=playsnd
trigger1= animelem = 1
value=1,3
channel=1

[State 230, Hit]
type=hitdef
trigger1= animelem=2
attr = S,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 25, 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
animtype = Light
ground.type = Low
air.type = Low
pausetime = 8,8
hitsound = S2,20
guardSound = S3,0; S3,0; S3,0
sparkno = S8000
guard.sparkno = S8140
sparkxy = -10, -45
ground.hittime = 15
ground.slidetime = 12
guard.hittime = 12
air.hittime = 12
ground.velocity = -2.41, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.41
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 3

[State 230, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 240]
type    = S
moveType = A
physics = S
anim = 240
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 240, Snd]
type=playsnd
trigger1= animelem=2
value=1,4
channel=1


[State 240, 2]
type = HitDef
trigger1 = Time = 0
attr = S,NA
hitflag = MAF
guardflag = MA
priority = 4, Hit
animtype = Medium
air.animtype = Back
fall.animtype = Back
damage = 35
guardflag = MA
hitflag = MAF
pausetime = 10,10
sparkno = S8001
guard.sparkno = S8140;s5570
sparkxy = -5,-90
hitsound = S2,4
guardSound = S3,0
ground.type = high
ground.slidetime = 13
ground.hittime  = 18
ground.velocity = -4.5,0
air.velocity = -1,-11.9
air.slidetime = 13
air.hittime = 55
ground.cornerpush.veloff = -4
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -12.6
envshake.time = 8
envshake.ampl = 5


[State 240, Launch Explod]
type = Explod
trigger1 = NumExplod(8520) = 0
trigger1 = MoveHit = 1 && P2statetype = A
anim = 8520
id = 8520
pos = 0, enemyNear, Const(size.mid.pos.y) - 50
postype = p2
bindtime = 1
scale = Const(size.xscale), Const(size.yscale)
sprpriority = 2
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999


[State 240, ChangeState]
type = ChangeState
triggerall = !Win
triggerall = !AILevel
triggerall = movecontact && time <12
trigger1 = command = "b" ;&& !fvar(38)
value = 245

[State 240, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Standing Medium Kick
[Statedef 245]
type    = S
movetype = A
physics = S
anim = 245
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 10


[State 245, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 2
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N

[State 245, Snd]
type = playsnd
trigger1 = animelem = 1
value = 4,1
channel = 1

[State 245, PlaySnd]
type = PlaySnd
trigger1 = time = 4
value = 1,4
channel = -1


[State 245, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
animtype = up
air.animtype = up
damage = 40
priority  = 5
guardflag = MA
pausetime = 10,10
sparkxy = -5,-80
sparkno = S8002;s955
guard.sparkno = S8140;s5570
hitsound = S2,22
guardSound = S3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 45
ground.velocity = -0.2,-12.8
guard.velocity = -7
air.hittime = 37
air.velocity = -0.2,-11
p2facing = 1
forcestand = 1
;yaccel = .5            ;p2 will accelerate down at .4 pixels/sec^2 when falling
ground.cornerpush.veloff = -4
guard.cornerpush.veloff = -6.6
air.cornerpush.veloff = -12.6
airguard.velocity = -7, -4
envshake.time = 8
envshake.ampl = 4


[State 245, Launch Explod]
type = Explod
trigger1 = NumExplod(8520) = 0
trigger1 = MoveHit = 1
anim = 8520
id = 8520
pos = 0, enemyNear, Const(size.mid.pos.y) - 50
postype = p2
bindtime = 1
scale = Const(size.xscale), Const(size.yscale)
sprpriority = 2
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999


[State 245, 3]
type = PosAdd
trigger1 = AnimElem = 1
x = 20

[State 245,VarSet]
type = VelSet
trigger1 = Animelem = 2
x = 4
y = -4.5

[State 245,VarSet]
type = Veladd
trigger1 = time > 3
y = .54


[State 245,VarSet]
type = ChangeAnim
triggerall = time >10
trigger1 = Vel Y>=0 && Pos Y>=-Vel Y && Anim!=47
value = 47

[State 245,VarSet]
type = StatetypeSet
trigger1 = Anim = 47
statetype = S
physics = S

[State 245,VarSet]
type = PosSet
trigger1 = Anim = 47
y = 0

[State 245,VarSet]
type = VelSet
trigger1 = Anim = 47
x = 0
y = 0

[State 245,Exit]
type = CtrlSet
trigger1 = Anim = 47 && AnimElem = 2
value = 1

[State 245, Landing FX]
type = Explod
trigger1 = Anim = 47 && AnimElem = 2
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

[State 245, Landing]
type = PlaySnd
trigger1 = Anim = 47 && AnimElem = 2
value = 52,0

[State 245,Exit]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Standing Strong Kick
[Statedef 250]
type = S
moveType = A
physics = S
anim = 250
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 38 * !var(20)
faceP2 = 1

[State 250, Slide]
type = Velset
trigger1 = (Time > 0) && (time <= 10) && (PrevStateNo = 100)
x = 2.5

[State 250, VelSet]
type = VelSet
trigger1 = animelemtime(11)>0 && animelemtime(14)<0
x = -2.5
y = 0

[State 250, VelAdd]
type = VelAdd
trigger1 = animelemtime(11)>0 && animelemtime(14)<0
x = .5
y = 0

[State 250, PlaySnd 1]
type = PlaySnd
trigger1 = animelem = 1
value = S250,0

[State 250, PlaySnd 2]
type = PlaySnd
trigger1 = animelem = 6
value = S250,1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 15
value = 2,17
channel = 2

[State 250, Helper]
type = Helper
trigger1 = animelem = 11
helpertype = normal ;player
name = "Projectil"
ID = 251
stateno = 251
pos = 50,-54
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 250, Explod]
type = Explod
trigger1 = animelem = 11
Anim = 451
id = 451
pos = 45,-54
postype = p1
ownpal = 1
bindtime = 5
ignorehitpause = 1
persistent = 1
sprpriority = 4
scale = const(size.xscale),const(size.yscale)

[State 250, Helper]
type = Helper
trigger1 = animelem = 12
helpertype = normal ;player
name = "Smook"
ID = 290
stateno = 290
pos = 30,-75
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0

[State 250, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Projectil Standing
[Statedef 251]
type = S
moveType = A
physics = N
anim = 455
ctrl = 0
sprPriority = 1


[State 251, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,NP,SP,HP
time = 1

[State 251, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,NP,SP,HP
stateno = 452
time = 1


[State 0, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 12
freq = 60
ampl = -4
phase = 90

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = 5
y = 0


[State 250, Snd]
type = playsnd
trigger1 = time = 1
value = 3100,2
channel = 1


[State 251, hitdef]
type = hitdef
trigger1 = time = 0
attr = S,NP
hitflag = MAF
guardflag = MA
priority = 4, Hit
getpower = 10,10
givepower = 36, 36
damage = 72,5
pausetime = 1,10
sparkxy = -10,0
sparkno = S8008
guard.sparkno = S8140
hitsound = S2,6
guardSound = S3,0
animtype = back          ;light,medium,hard,back,up,diagup
air.animtype = back
ground.type = High
air.type = Low
ground.hittime = 17
ground.slidetime = 12
guard.hittime = 18
air.hittime = 22
ground.velocity = -12,-3
ground.cornerPush.velOff = 0
air.velocity = -5,-3
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
envshake.time = 7
envshake.ampl = 4
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 0, Projectile]
type = Projectile
trigger1 = animelemtime(1) = [0,3]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.6-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -240,-2+random%5
offset = -13+random%5,-8+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
afterimage.time = -1
afterimage.length = 10
afterimage.palbright = 20,-20,-100
afterimage.palcontrast = 256,256,256
afterimage.timegap = 1
afterimage.framegap = 1
afterimage.trans = add

[State 0, Projectile]
type = Projectile
trigger1 = animelemtime(1) = [0,2]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.6-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -240,-2+random%5
offset = -14+random%5,-10+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
afterimage.time = -1
afterimage.length = 10
afterimage.palbright = 20,-20,-100
afterimage.palcontrast = 256,256,256
afterimage.timegap = 1
afterimage.framegap = 1
afterimage.trans = add

[state 0,FireSparks]
type = helper
trigger1 = !numhelper(8120)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype=H&&!target,time
trigger1 = var(48):=(target,ID)
name = "FireSparks"
id = 8120
stateno = 8120
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


[State 0, DestroySelf]
type = DestroySelf
trigger1 = time >= 14
trigger2 = movecontact

;---------------------------------------------------------------------------
;Smook
[Statedef 290]
physics = N
anim = 9902
ctrl = 0
velSet = 0,0
sprPriority = 5

[State 0, Explod]
type = Explod
trigger1 = time = 10
anim = 9901
ID = 9901
pos = 0,-10
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-.6
removetime = -2
scale = 1,1
sprpriority = 5
ontop = 0
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 10
anim = 9901
ID = 9902
pos = 10,-5
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = .2,-.5
removetime = -2
scale = 1,1
sprpriority = 5
ontop = 0
ownpal = 1

[State 0, Explod]
type = Explod
trigger1 = time = 10
anim = 9901
ID = 9903
pos = -10,-5
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = -.2,-.5
removetime = -2
scale = 1,1
sprpriority = 5
ontop = 0
ownpal = 1

[State 290, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;------------------------------
;Stand atack recover
[Statedef 300]
type    = S
movetype= I
physics = S
poweradd= 0
ctrl = 1
velset = 0,0
anim = 1
sprpriority = 1

[State 210,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 1
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Light Punch
[Statedef 400]
type = C
physics = C
moveType = A
anim = 400
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20
faceP2 = 1

[State 400, Snd]
type=playsnd
trigger1= !time
value=1,0
channel=1

[State 400, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 22, 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 8, 8
animtype = Light
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
hitsound = S2,0
guardSound = S3,0
sparkno = S8000
guard.sparkno = S8140
sparkxy = -10, -45
ground.hittime = 13
ground.slidetime = 11 
guard.hittime = 12
air.hittime = 18
ground.velocity = -2, 0
ground.cornerPush.velOff = 0
guard.velocity = -3
guard.cornerPush.velOff = 0
air.velocity = -6.46, -1.25
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 3



[State 400, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Punch
[Statedef 410]
type = C
physics = C
moveType = A
anim = 410
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 410, Snd]
type = playsnd
trigger1 = animelem = 3
value = 4,1
channel = 0

[State 410, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1,7
channel = 3

[State 410, Snd]
type=playsnd
trigger1 = animelem = 4
value=1,7
channel=3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 10
value = 2,15
channel = 2

[State 410, Hit]
type = hitdef
trigger1 = animelem= 3
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 30, 3
getpower = ifelse(!var(13),104,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 7,9
guard.pausetime = 7,7
animtype = Medium
ground.type = Low
air.type = Low
hitsound = S2,9
guardSound = S3,0
sparkno = S8410+random%8
guard.sparkno = S8140
sparkxy = -10 ,-30
ground.hittime = 16
ground.slidetime = 14
guard.hittime = 15
air.hittime = 120
ground.velocity = -2.51, 0
ground.cornerPush.velOff = 0
guard.velocity =  -3.66
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
envshake.time = 10
envshake.ampl = 3

[State 410, Hit]
type = hitdef
trigger1 = animelem = 5
attr = C,NA
hitflag = MAF
guardflag = MA
priority = 5, Hit
damage = 35, 3
getpower = ifelse(!var(13),104,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 9, 9
guard.pausetime = 9, 9
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
hitsound = S2,9
guardSound = S3,0
sparkno = S8410+random%8
guard.sparkno = S8140
sparkxy = -10,-56
ground.hittime = 16
ground.slidetime = 15
guard.hittime = 15
air.hittime = 22
ground.velocity = -5.51, 0
guard.velocity =  -3.66
air.velocity = -4.46, -5.25
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 10
envshake.ampl = 3

[State 210, Helper]
type = Helper
trigger1 = AnimElem = 3
helpertype = normal ;player
name = "Stand Medium Puch Slash"
ID = 411
stateno = 411
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0
pausemovetime = 999999
supermovetime = 999999


[State 410, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouch Medium Puch Slash
[Statedef 411]
physics = N
velset = 0,0
anim = 411
ctrl = 0
sprpriority = 3

[State 411, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 411, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 411, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

[State 411, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H || parent, anim != 410
trigger2 = animtime = 0
;---------------------------------------------------------------------------
; Crouching Strong Punch
[Statedef 420]
type = C
physics = C
moveType = A
anim = 420
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 420, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 2
channel = 0

[State 420, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = 2,16
channel = 2

[State 420, Hit]
type=hitdef
trigger1= animelem=6
attr = C,NA
hitflag = MAF
guardflag = M
priority = 4, Hit
damage = 64, 3
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = ifelse(var(20), 2, 10), ifelse(var(20), 2, 10)
guard.pausetime = ifelse(var(20), 6, 12), ifelse(var(20), 6, 12)
animtype = Heavy
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 20 + 4*var(9)
ground.slidetime = 18 + 4*var(9)
guard.hittime = 18
air.hittime = 12
ground.velocity = ifElse(var(20), -4.86, -10.52), 0
ground.cornerPush.velOff = 0
guard.velocity = ifElse(var(20), -4.86, -10.52)
guard.cornerPush.velOff = 0
air.velocity = -3.23, -7.73
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
hitsound = S2,10
guardSound = S3,0
sparkno = S8420+random%8
guard.sparkno = S8140
sparkxy = -10 + 0*(var(35):=195), var(36):=-25
palfx.time = 12*var(9)
palfx.add = 255,255,255
palfx.sinadd= -255,-255,-255,48
forceStand = 1


[State 420, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 460
ctrl = 1


;---------------------------------------------------------------------------
; Crouching Light Kick
[Statedef 430]
type = C
physics = C
moveType = A
anim = 430
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 20
faceP2 = 1

[State 430, Snd]
type=playsnd
trigger1= !time
value=1,3
channel=1

[State 430, Hit]
type = hitdef
trigger1 = animelem = 2
attr = C,NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 25, 0
getpower = 72*!var(20), 36*!var(20)
givepower = 36, 36
animtype = Light
pausetime = 8, 8
hitsound = S2,20
guardSound = S3,0; S3,0; S3,0
sparkno = S8000
guard.sparkno = S8140
sparkxy = -10,-5
ground.type = Low
air.type = Low
ground.hittime = 15
ground.slidetime = 12
guard.hittime = 15
air.hittime = 12
ground.velocity = -2.41, 0
ground.cornerPush.velOff = 0
guard.velocity = -2.41
guard.cornerPush.velOff = 0
air.cornerPush.velOff = 0
yAccel = 0.58
fall = 0
fall.recover = 1
fall.recovertime = 120
envshake.time = 8
envshake.ampl = 3

[State 430, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 440]
type = C
moveType = A
physics = C
anim = 440
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 440, playsnd]
type = playsnd
trigger1 = animelem = 4
value = 4, 0
channel = 0

[State 440, playsnd]
type = playsnd
trigger1 = animelem = 4
value = 1,4
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = animelem = 5
attr = C,NA
hitflag = MAF
guardflag = L
priority = 4, Hit
damage = 35, 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 10,11
animtype = Medium
air.animtype = Back
fall.animtype = Back
hitsound = S2,4
guardSound = S3,0
sparkno = S8001
guard.sparkno = S8140
sparkxy = -10,-5
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 16
guard.hittime = 15
air.hittime = 15
ground.velocity = -4.66,0
guard.velocity = -3.66
envshake.time = 8
envshake.ampl = 4



[State 440, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Crouching Medium Kick
[Statedef 445]
type = C
physics = C
moveType = A
anim = 445
ctrl = 0
juggle  = 0
velSet = 0,0
sprPriority = 1
powerAdd = 28 * !var(20)
faceP2 = 1

[State 440, Snd]
type=playsnd
trigger1= animelem=4 
value= 4, 0
channel=0

[State 440, Snd]
type=playsnd
trigger1= animelem=4
value=1,4
channel=1


[State 440, Hit]
type = hitdef
trigger1 = animelem=4
attr = S, NA
animtype  = Medium
hitflag = MAF
guardflag = MA
priority = 4, Hit
damage = 40, 0
getpower = ifelse(!var(13),144,72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 10, 10
animtype = Medium
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 47
ground.slidetime = 18
guard.hittime = 15
air.hittime = 50
ground.velocity = -1,-12
ground.cornerPush.velOff = 0
guard.cornerPush.velOff = 0
air.velocity = -1, -12
air.cornerPush.velOff = 0
fall = 0
air.fall = 1
yaccel = .38
fall.recover = 0
fall.recovertime = 120
hitsound = S2,22
guardSound = S3,0
sparkno = S8000
guard.sparkno = S8140
sparkxy = -10,-55
envshake.time = 8
envshake.ampl = 4



[State 445, Launch Explod]
type = Explod
trigger1 = NumExplod(8520) = 0
trigger1 = MoveHit = 1
anim = 8520
id = 8520
pos = 0, enemyNear, Const(size.mid.pos.y) - 50
postype = p2
bindtime = 1
scale = Const(size.xscale), Const(size.yscale)
sprpriority = 2
ontop = 1
ownpal = 1
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

[State 440, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 460
ctrl = 1


;---------------------------------------------------------------------------
; Crouch Strong Kick
[Statedef 450]
type = C
moveType = A
physics = C
anim = 450
ctrl = 0
velSet = 0,0
sprPriority = 1
powerAdd = 18 * !var(20)
faceP2 = 1

[State 250, Slide]
type = Velset
trigger1 = (Time > 0) && (time <= 10) && (PrevStateNo = 100)
x = 2.5

[State 250, VelSet]
type = VelSet
trigger1 = animelemtime(11)>0 && animelemtime(14)<0
x = -2.5
y = 0

[State 250, VelAdd]
type = VelAdd
trigger1 = animelemtime(11)>0 && animelemtime(14)<0
x = .5
y = 0

[State 650, PlaySnd 1]
type = PlaySnd
trigger1 = animelem = 1
value = S250,0

[State 650, PlaySnd 2]
type = PlaySnd
trigger1 = animelem = 5
value = S250,1

[State 650, Snd]
type = playsnd
trigger1 = animelem = 15
value = 2,17
channel = 2

[State 650, Helper]
type = Helper
trigger1 = animelem = 11
helpertype = normal ;player
name = "Projectil"
ID = 451
stateno = 451
pos = 60,-28
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 100, Explod]
type = Explod
trigger1 = AnimElem = 11
Anim = 451
pos = 64, -28
postype = p1
ownpal = 1
bindtime = 5
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 450, Helper]
type = Helper
trigger1 = animelem = 12
helpertype = normal ;player
name = "Smook"
ID = 290
stateno = 290
pos = 54,-55
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 11
anim = 8563
ID = 8563
pos = 65,5
postype = p1  ;p2,front,back,left,right
facing = -1
bindtime = 1
removetime = -2
pausemovetime = 0
scale = .6,.5
sprpriority = 5
ownpal = 1


[State 450, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
; Projectil Crouching
[Statedef 451]
type = C
moveType = A
physics = N
anim = 455
ctrl = 0
sprPriority = 1


[State 451, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,NP,SP,HP
time = -1
ignorehitpause = 1

[State 451, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,NP,SP,HP
stateno = 452
time = -1
ignorehitpause = 1


[State 451, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 12
freq = 60
ampl = -4
phase = 90

[State 451, VelSet]
type = VelSet
trigger1 = 1
x = 7
y = 0


[State 451, Snd]
type = playsnd
trigger1 = time = 1
value = 3100,2
channel = 1


[State 451, hitdef]
type = hitdef
trigger1 = time = 0
attr = C,NP
hitflag = MAF
guardflag = MA
priority = 4, Hit
getpower = 10,10
givepower = 36, 36
pausetime = 3,12
damage = 68,5
pausetime = 1,10
sparkxy = -10,0
sparkno = S8008
guard.sparkno = S8140
hitsound = S2,6
guardSound = S3,0
animtype = Hard
ground.type = trip
air.type = Low
ground.hittime = 17
ground.slidetime = 12
guard.hittime = 18
air.hittime = 22
ground.velocity = -6,-1
ground.cornerPush.velOff = 0
air.velocity = -5,-3
air.cornerPush.velOff = 0
yaccel = 0.58
fall = 1
envshake.time = 7
envshake.ampl = 4
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 0, Projectile]
type = Projectile
trigger1 = animelemtime(1) = [0,3]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.8-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -240,-2+random%5
offset = -3+random%5,-8+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
afterimage.time = -1
afterimage.length = 10
afterimage.palbright = 20,-20,-100
afterimage.palcontrast = 256,256,256
afterimage.timegap = 1
afterimage.framegap = 1
afterimage.trans = add


[State 0, Projectile]
type = Projectile
trigger1 = animelemtime(1) = [0,2]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.8-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -240,-2+random%5
offset = -4+random%5,-10+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0
afterimage.time = -1
afterimage.length = 10
afterimage.palbright = 20,-20,-100
afterimage.palcontrast = 256,256,256
afterimage.timegap = 1
afterimage.framegap = 1
afterimage.trans = add

[state 0,FireSparks]
type = helper
trigger1 = !numhelper(8120)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype=H&&!target,time
trigger1 = var(48):=(target,ID)
name = "FireSparks"
id = 8120
stateno = 8120
helpertype = normal
postype = p2
pos = 0,40
ownpal = 1
keyctrl = 0
size.yscale = 1
size.xscale = 1
pausemovetime = 9999999
supermovetime = 9999999
ignorehitpause = 1
persistent = 0


[State 451, DestroySelf]
type = DestroySelf
trigger1 = time >= 13
trigger2 = movecontact

;---------------------------------------------------------------------------
;Over
[Statedef 452]
physics = N
velset = 0,0
anim = 999

[State 452, DestroySelf]
type = DestroySelf
trigger1 = !time
;---------------------------------------------------------------------------
; Tripped get-hit (shaking)
[Statedef 455]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim2
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 456

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140


; Tripped get-hit (knocked away)
[Statedef 456]
type    = A
movetype= H
physics = N

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = time > 0
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= Const(movement.air.gethit.trip.groundlevel)
type = SelfState
value = 5110

;---------------------------------------
;crouch atack recover
[Statedef 460]
type    = C
movetype= I
physics = C
poweradd= 00
ctrl = 1
velset = 0,0
anim = 13
sprpriority = 1

[State 210,Exit]
type = ChangeState
trigger1 = AnimTime=0
value = 1
ctrl = 1
;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 600]
type  = A
movetype = A
physics = A
juggle  = 0
anim = 600
ctrl = 0
sprpriority = 1
poweradd = 20
facep2 = 1


[State 600, playsnd]
type = playsnd
trigger1 = animelem = 2
value = 1,6
channel = 1


[State 600, HitDef]
type = HitDef
trigger1 = animelem = 2
attr = A, NA
damage = 23,1
attr = A, NA
guardflag = HA
priority = 4, Hit
animtype = light
pausetime = 7,7
sparkno = S8400+random%8
guard.sparkno = S8140
hitsound = S2,8
guardSound = S3,0
sparkxy = -10,-40
ground.type = High
ground.slidetime = 6
ground.hittime  = 12
ground.velocity = -4
air.type = Low
air.velocity = -1,((vel y)-.1)
air.hittime = 26
envshake.time = 10
envshake.ampl = 2


[State 600, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------------------------------------------
; Jump Light Punch
[Statedef 605]
type  = A
movetype = A
physics = A
juggle = 0
anim = 605
ctrl = 0
sprPriority = 1
poweradd = 20

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 4,0
channel = 0

[State 600, Snd]
type=playsnd
trigger1= animelem=2
value=1,6
channel=1

[State 600, Hit]
type = HitDef
trigger1 = animelem = 4
attr = A, NA
damage = 20
guardflag = HA
priority = 4, Hit
animtype  = light
priority = 3
pausetime = 8,8
sparkno = S8000
guard.sparkno = S8140
hitsound = S2,0
guardSound = S3,0
sparkno = -1 + 0*(var(33):=8015)
guard.sparkno = -1 + 0*(var(34):=8000)
sparkxy = -10 + 0*(var(35):=45), var(36):=-150
ground.type = High
ground.slidetime = 6
ground.hittime  = 12
ground.velocity = -4
air.velocity = -1,((vel y)-.1)
air.hittime = 28
envshake.time = 8
envshake.ampl = 3


[State 600, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------------------------------------------
; Jump Medium Punch
[Statedef 610]
type  = A
movetype = A
physics = A
juggle = 0
anim = 610
ctrl = 0
sprpriority = 1
poweradd = 30


[State 610, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1000,2
channel = 0

[State 610, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1,7
channel = 1

[State 610, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 2,15
channel = 2


[State 610, hitdef]
type = hitdef
trigger1 = animelem = 5
attr = A, NA
guardflag = HMA
priority = 4, Hit
damage = 43, 3
getpower = 30,30
givepower = 36, 36
pausetime = 9, 10
animtype = Medium
ground.type = High
air.type = High
sparkno = S8410+random%8
guard.sparkno = S8140
hitsound = S2,9
guardSound = S3,0
sparkxy = -10 , -60
ground.hittime = 14
ground.slidetime = 18
guard.hittime = 15
air.slidetime = 28
air.hittime = 28
airguard.ctrltime = 18
ground.velocity = -6.49, 0
guard.velocity = -3.66
air.velocity = -3,((vel y)-.1)
airguard.velocity = -5, -4
envshake.time = 10
envshake.ampl = 4



[State 1000, Spark]
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
pausemovetime = 999999
supermovetime = 999999

[State 1000, Spark]
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
pausemovetime = 999999
supermovetime = 999999

[State 610, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------------------------------------------
; Jump Strong Punch
[Statedef 620]
type  = A
movetype = A
physics = A
juggle  = 0
anim = 620
ctrl = 0
sprpriority = 1
poweradd = 40

[State 620, Snd]
type=playsnd
trigger1= animelem=5 
value= 4, 2
channel=0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 2,16
channel = 2

[State 620, Hit]
type = hitdef
trigger1 = animelem = 6
attr = A,NA
guardflag = HA
priority = 4, Hit
damage = 55, 4
getpower = ifelse(!var(13), 216, 72)*!var(20), 36*!var(20)
givepower = 36, 36
pausetime = 12, 12
hitsound = S2,10
guardSound = S3,0
sparkno = S8410+random%8
guard.sparkno = S8140
sparkxy = -10, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 18
ground.slidetime = 22
guard.hittime = 18
air.hittime = 26
airguard.ctrltime = 16
ground.velocity = -8, 0
guard.velocity =  -10.52
air.velocity = -6.46, 8
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
yAccel = 0.58
air.fall = 1
fall.recover = 1
fall.recoverTime = 120
envshake.time = 10
envshake.ampl = 5

[State 620, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------------------------------------------
; Jump Light Kick
[Statedef 630]
type = A
moveType = A
physics = A
anim = 630
juggle  = 0
ctrl = 0
sprPriority = 1
powerAdd = 20
facep2 = 1

[State 630, playsnd]
type = playsnd
trigger1 = animelem = 2
value = 1,3
channel = 1

[State 630, HitDef]
type = HitDef
trigger1 = animelem = 6
attr = A, NA
damage = 20
guardflag = HMA
priority = 3, hit
animtype = light
pausetime = 8,8
sparkno = S8000
guard.sparkno = S8140
hitsound = S2,20
guardSound = S3,0; S3,0; -1 + 0*(var(32):=0)
sparkxy = -10, var(36):=-30
ground.type = low
ground.slidetime = 10
ground.hittime  = 16
ground.velocity = -4
air.velocity = -2,((vel y)-.1)
air.hittime = 28
envshake.time = 8
envshake.ampl = 3


[State 630, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------------------------------------------
; Jump Medium Kick
[Statedef 640]
type = A
moveType = A
physics = A
anim = 640
juggle  = 0
ctrl = 0
sprPriority = 1
powerAdd = 30

[State 640, Snd]
type = playsnd
trigger1 = animelem = 4
value = 4, 0
channel = 0

[State 640, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1,4
channel = 1

[State 640, HitDef]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 33
guardflag = HMAF
priority = 4
pausetime = 10,13
sparkno = S8002
guard.sparkno = S8140
sparkxy = -5,-75
hitsound = S2,4
guardSound = S3,0
sparkno = S8001
guard.sparkno = S8140
sparkxy = -10 + 0*(var(35):=84), var(36):=-5
animtype = medium
ground.type = low
ground.slidetime = 18
ground.hittime  = 16
ground.velocity = -5
air.velocity = -2,1
air.hittime  = 35
fall.recover = 0
down.velocity = -4,5
down.hittime = 30
down.bounce = 1
down.bounce.velocity = -4, -40
envshake.time = 8
envshake.ampl = 4

[State 640, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;---------------------------------------
[Statedef 645]
type = A
moveType = A
physics = A
anim = 645
juggle  = 0
ctrl = 0
sprPriority = 1
powerAdd = 30

[State 640, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1,4
channel = 1

[State 640, 2]
type = HitDef
trigger1 = animelem = 3
attr = A, NA
damage = 32
animtype = medium
guardflag = HA
priority = 3
pausetime = 10,10
sparkno = S8001
guard.sparkno = S8140
hitsound = S2,22
guardSound = S3,0
sparkno = S8001
guard.sparkno = S8140
sparkxy = -10 + 0*(var(35):=84), var(36):=-56
ground.type = High
ground.slidetime = 14
ground.hittime  = 16
ground.velocity = -4
air.velocity=  -2, ((vel y)-.05)
air.hittime = 28
envshake.time = 8
envshake.ampl = 4


[State 645, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1
;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 650]
type = A
physics = A
moveType = A
anim = 650
ctrl = 0
sprPriority = 1
powerAdd = 38 * !var(20)


[State 250, PlaySnd 1]
type = PlaySnd
trigger1 = animelem = 1
value = S250,0

[State 250, PlaySnd 2]
type = PlaySnd
trigger1 = animelem = 7
value = S250,1


[State 650, Explod]
type = Explod
trigger1 = AnimElem = 9
Anim = 652
id = 652
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)


[State 650, Helper]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal ;player
name = "Projectil"
ID = 651
stateno = 651
pos = 41,-37
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 650, Helper]
type = Helper
trigger1 = animelem = 10
helpertype = normal ;player
name = "Smook"
ID = 290
stateno = 290
pos = 35,-45
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0

[State 650, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(9) > 0 && animelemtime(11) < 0
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N

[State 650, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(11) >= 0
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A         ;A,C,S,N

[State 650, Gravity]
type = Gravity
trigger1 = AnimElem = 9,>1


[State 650, VelSet]
type = VelSet
trigger1 = animelem = 9
x = -5
y = -4
yaccel = -20


[State 350]
type = VelSet
trigger1 = Animelem = 10
x = -4
y = -4.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = -2
y = -3.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = -1
y = -2.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -1.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25



[State 350]
type = ChangeState
trigger1 = AnimElem = 9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52


;---------------------------------------------------------------------------
; Projectil Air
[Statedef 651]
type = A
moveType = A
physics = N
anim = 455
ctrl = 0
sprPriority = 1


[State 651, HitBy]
type = HitBy
trigger1 = time>=0
value = SCA,NP,SP,HP
time = 1

[State 651, HitOverride]
type = HitOverride
trigger1 = time>=0
attr = SCA,NP,SP,HP
stateno = 452
time = 1


[State 651, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 12
freq = 60
ampl = -4
phase = 90

[State 651, VelSet]
type = VelSet
trigger1 = parent,stateno = 650
x = 3
y = 3

[State 651, VelSet]
type = VelSet
trigger1 = parent,stateno = 652
x = 0
y = 4

[State 651, VelSet]
type = VelSet
trigger1 = parent,stateno = 653
x = 5
y = 0

[State 651, Snd]
type = playsnd
trigger1 = time = 1
value = 3100,2
channel = 1

[State 651, PlaySnd]
type = PlaySnd
trigger1 = Movehit = 1
value = 3100,3


[State 651, hitdef]
type = hitdef
trigger1 = parent,stateno = 650
trigger1 = time = 0
attr = A,NP
hitflag = MAF
guardflag = HA
priority = 4, Hit
getpower = 10,10
givepower = 36, 36
pausetime = 3,12
damage = 55,5
pausetime = 1,10
sparkxy = 15,0
sparkno = S8008
guard.sparkno = S8140
hitsound = S2,6
guardSound = S3,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 22
ground.slidetime = 12
guard.hittime = 18
air.hittime = 22
airguard.ctrltime = 16
ground.velocity = -10, 0
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -6.46, 10
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 7
envshake.ampl = 4
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 651, hitdef]
type = hitdef
trigger1 = parent,stateno = 652
trigger1 = time = 0
attr = A,NP
hitflag = MAF
guardflag = HA
priority = 4, Hit
getpower = 10,10
givepower = 36, 36
damage = 55,5
pausetime = 1,10
sparkxy = 15,0
sparkno = S8008
guard.sparkno = S8140
hitsound = S2,6
guardSound = S3,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 22
ground.slidetime = 12
guard.hittime = 18
air.hittime = 22
airguard.ctrltime = 16
ground.velocity = -4, 0
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -.46, 15
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 7
envshake.ampl = 4
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 651, hitdef]
type = hitdef
trigger1 = parent,stateno = 653
trigger1 = time = 0
attr = A,NP
hitflag = MAF
guardflag = HA
priority = 4, Hit
getpower = 10,10
givepower = 36, 36
pausetime = 3,12
damage = 55,5
pausetime = 1,10
sparkxy = 15,0
sparkno = S8008
guard.sparkno = S8140
hitsound = S2,6
guardSound = S3,0
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = High
ground.hittime = 22
ground.slidetime = 12
guard.hittime = 18
air.hittime = 22
airguard.ctrltime = 16
ground.velocity = -10, 0
ground.cornerPush.velOff = 0
guard.velocity = -6
guard.cornerPush.velOff = 0
air.velocity = -8.46, 5
air.cornerPush.velOff = 0
airguard.velocity = -5, 0
airguard.cornerPush.velOff = 0
fall = 1
air.fall = 1
fall.recover = 1
envshake.time = 7
envshake.ampl = 4
palfx.time = 40
palfx.add = 30,-40,-140
palfx.sinadd = 60,60,50,10
palfx.color = 0
palfx.invertall = 1

[State 0, Projectile]
type = Projectile
trigger1 = parent,stateno != 652
trigger1 = animelemtime(1) = [0,3]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.6-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -640,-2+random%5
offset = -3+random%5,-8+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0

[State 651, Projectile]
type = Projectile
trigger1 = parent,stateno != 652
trigger1 = animelemtime(1) = [0,2]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = -0.4+random%4,-0.6-random%4
remvelocity = 0,0
accel = 0.02,IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -640,-2+random%5
offset = -4+random%5,-10+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0

[State 0, Projectile]
type = Projectile
trigger1 = parent,stateno = 652
trigger1 = animelemtime(1) = [0,3]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = IfElse(random<500,0.06,-0.06),0.3-random%4
remvelocity = 0,0
accel = IfElse(random<500,0.05,-0.05),IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -640,-2+random%5
offset = -13+random%5,-8+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0

[State 651, Projectile]
type = Projectile
trigger1 = parent,stateno = 652
trigger1 = animelemtime(1) = [0,2]
projanim = 456
projremanim = 452 + random%3
projremove = 0
projscale = 1,1
velocity = IfElse(random<500,0.06,-0.06),0.3-random%4
remvelocity = 0,0
accel = IfElse(random<500,0.05,-0.05),IfElse(random<500,0.2,0.4)
projsprpriority = 3
projedgebound = 40
projstagebound = 40
projheightbound = -640,-2+random%5
offset = -14+random%5,-10+random%5
ownpal = 1
persistent = 1
postype = p1
bindtime = 1
guard.dist = 0

[state 0,FireSparks]
type = helper
trigger1 = !numhelper(8120)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype=H&&!target,time
trigger1 = var(48):=(target,ID)
name = "FireSparks"
id = 8120
stateno = 8120
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


[State 651, DestroySelf]
type = DestroySelf
trigger1 = parent,stateno != 653
trigger1 = time >= 10
trigger2 = parent,stateno = 653
trigger2 = time >= 12
trigger3 = movecontact
trigger4 = time>13

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 652]
type = A
physics = A
moveType = A
anim = 653
ctrl = 0
sprPriority = 1
powerAdd = 38 * !var(20)

[State 650, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(9) > 0 && animelemtime(11) < 0
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N

[State 650, StateTypeSet]
type = StateTypeSet
trigger1 = animelemtime(11) >= 0
statetype = A       ;S,A,C,L
movetype = A        ;I,A,H
physics = A         ;A,C,S,N


[State 650, PlaySnd 1]
type = PlaySnd
trigger1 = animelem = 1
value = S250,0

[State 650, PlaySnd 2]
type = PlaySnd
trigger1 = animelem = 5
value = S250,1

[State 650, Snd]
type = playsnd
trigger1 = animelem = 15
value = 2,17
channel = 2

[State 100, Explod]
type = Explod
trigger1 = AnimElem = 9
Anim = 654
id = 654
pos = 0, 0
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 652, Helper]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal ;player
name = "Projectil"
ID = 651
stateno = 651
pos = -37,-8
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 652, Helper]
type = Helper
trigger1 = animelem = 10
helpertype = normal ;player
name = "Smook"
ID = 290
stateno = 290
pos = -36,-11
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0



[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = 0
y = -8.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = 0
y = -7.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = 0
y = -5.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = 0
y = -6.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = 0
y = -1.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3


[State 350]
type = ChangeState
trigger1 = AnimElem = 9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52

;---------------------------------------------------------------------------
; Jump Strong Kick
[Statedef 653]
type = A
physics = A
moveType = A
anim = 655
ctrl = 0
sprPriority = 1
powerAdd = 38 * !var(20)

[State 650, PlaySnd 1]
type = PlaySnd
trigger1 = animelem = 1
value = S250,0

[State 650, PlaySnd 2]
type = PlaySnd
trigger1 = animelem = 5
value = S250,1

[State 650, Snd]
type = playsnd
trigger1 = animelem = 15
value = 2,17
channel = 2

[State 100, Explod]
type = Explod
trigger1 = AnimElem = 9
Anim = 451
id = 451
pos = 62, -85
postype = p1
ownpal = 1
bindtime = -1
pausemovetime = -1
supermovetime = -1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)

[State 653, Helper]
type = Helper
trigger1 = AnimElem = 9
helpertype = normal ;player
name = "Projectil"
ID = 651
stateno = 651
pos = 62, -85
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 653, Helper]
type = Helper
trigger1 = animelem = 10
helpertype = normal ;player
name = "Smook"
ID = 290
stateno = 290
pos = 61,-85
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 0


[State 650, Gravity]
type = Gravity
trigger1 = AnimElem=9,>1

[State 350]
type = VelSet
trigger1 = Animelem = 9
x = -5
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 10
x = -4
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 11
x = -3
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 12
x = -2
y = -1.5

[State 350]
type = VelSet
trigger1 = Animelem = 13
x = -1
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 14
x = 0
y = -.25

[State 350]
type = VelSet
trigger1 = Animelem = 15
x = 0
y = -.25

[State 350]
type = posadd
trigger1 = Animelem = 10
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 11
x = -3

[State 350]
type = posadd
trigger1 = Animelem = 12
x = -3


[State 350]
type = ChangeState
trigger1 = AnimElem = 9,>1 && Vel Y>0 && Pos Y>=-Vel Y
value = 52
;-------------------------------------------------------------------------------
;=============================< EVADE >=========================================
[Statedef 700]
type = S
movetype = I
physics = S
anim = 700
ctrl = 0
velset = 0, 0
sprpriority = -2

[State 700, Snd]
type = playsnd
trigger1 = !time
value = S4,0


[State 400, Voice]
type = PlaySnd
trigger1 = AnimElem = 2
value = s1600,0

[State 700, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 700, AssertSpecial]
type = AssertSpecial
trigger1 = animelemtime(3)>0&&animelemtime(9)<0
trigger1 = time%3 = 0
flag = invisible


[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 1, = 0
anim = 1601
sprpriority = 4
postype = p1
pos = -20,5
random = 20,20
vel = -2,-.5
bindtime = 1
ownpal = 1
id = 1601
name = "Dust"
pausemovetime = 999999
supermovetime = 999999

[State 700, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 210, 250)

[State 700, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && numenemy
trigger1 = (enemynear, movetype != A) && (p2bodydist x = [ -60, 60]) && (p2dist y >= -60)
value = ifelse(random < 666, 210, 250)

[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;================================< ROLL >=======================================
;--- Forward ---
[Statedef 710]
type = S
physics = N
movetype = I
anim = 710
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 710, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 710, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = 4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- Backward ---
[Statedef 715]
type = S
physics = N
movetype = I
anim = 715
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 715, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 715, HB]
type = hitby
trigger1 = animelemtime(6) < 0
value = SCA, AT
time = 1

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 715, Snd]
type = playsnd
trigger1 = !time
value = 110,0
channel = 1

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 2
x = -4.5

[State 810, Velocity]
type = VelSet
trigger1 = AnimElem = 10
x = 0

[State 715, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;============================< POWER CHARGE >===================================
;POWER CHARGE
[Statedef 730]
type = S
physics = S
movetype = I
anim = 730
velset = 0, 0
ctrl = 0


[State 730, Power]
type = poweradd
triggerall = power < const(data.power) && power < powermax
trigger1 = !AIlevel && (command = "holdb" && command = "holdy")
trigger2 = AIlevel
value = 2 + ifelse(time < 60, 0, (time -60) / 12)

[State 730, Snd]
type = playsnd
trigger1 = !time
value = 730,1
channel = 0

[State 730, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0

[State 730, FX]
type = helper
trigger1 = !numhelper(8330)
;helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pos = 0,0
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, FX]
type = helper
trigger1 = !numhelper(8331)
;helpertype = normal
stateno = 8331
ID = 8331
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 730, End]
type = changestate
trigger1 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger2 = !AIlevel && (command != "holdb" || command != "holdy")
trigger3 = AIlevel && (inguarddist || p2bodydist x <= 120)
value = 731
ctrl = 1

;-------------------------------------------------------------------------------
;--- END ---
[Statedef 731]
type = S
physics = S
movetype = I
anim = 731
velset = 0, 0
ctrl = 1


[State 731, Snd]
type = playsnd
trigger1 = !time
value = 4,5
channel = 1

[State 730, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;============================< ZERO COUNTER >===================================
[Statedef 750]
type = S
physics = S
movetype = I
anim = 750
velset = 0, 0
ctrl = 0
sprpriority = 2
facep2 = 1


[State 750, Button]
type = varset
trigger1 = !time && !AIlevel
var(10) = (command = "412k")
ignorehitpause = 1

[State 750, Button AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 0, ifelse((p2statetype = C), 1, ifelse(random < 500, 0, 1)))
ignorehitpause = 1

[State 750, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 750, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 750, SuperPause FX]
type = helper
trigger1 = !time
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = 35, -83
supermovetime = 255
ownpal = 1


[State -2, Counter FX]
type = helper
trigger1 = time = 1
stateno = 8290
ID = 8290
name = "Counter"
postype = p2
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -2, Counter FX]
type = helper
trigger1 = time = 10
stateno = 8291
ID = 8291
name = "Counter FX"
postype = p2
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 25
movetime = 25
p2defmul = 1
anim = -1
sound = S750,0
darken = 0
poweradd = -500

[State 750, End]
type = changestate
trigger1 = time >= 15
value = ifelse(var(10) = 1, 2910, 2900)

;==========================< AIR ZERO COUNTER >=================================
[Statedef 751]
type = A
movetype = I
physics = N
anim = 751
velset = 0, 0
ctrl = 0
sprpriority = 2
facep2 = 1


[State 751, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 751, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State -2, Counter FX]
type = helper
trigger1 = time = 1
stateno = 8290
ID = 8290
name = "Counter"
postype = p2
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State -2, Counter FX]
type = helper
trigger1 = time = 10
stateno = 8291
ID = 8291
name = "Counter FX"
postype = p2
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1

[State 751, SuperPause FX]
type = helper
trigger1 = !time
stateno = 8350
ID = 8350
name = "Zero Counter"
postype = p1
pos = 35, -83
supermovetime = 255
ownpal = 1

[State 751, Super Pause]
type = superpause
trigger1 = !time
time = 25
movetime = 25
p2defmul = 1
anim = -1
sound = s750,0
darken = 0
poweradd = -500

[State 751, End]
type = changestate
trigger1 = time >= 15
value = 2920
;-------------------------------------------------------------------------------
;================================< PARRY >======================================
;--- STANDING ---
[Statedef 760]
type = S
physics = S
movetype = I
anim = 760
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 760, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 760, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 760, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 760, No walking]
type = varset
trigger1 = 1
var(31) = 7

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 760, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 760, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 35, -83
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 760, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 760, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- CROUCHING ---
[Statedef 761]
type = C
physics = C
movetype = I
anim = 761
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 761, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 761, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 761, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 761, No walking]
type = varset
trigger1 = 1
var(31) = 7

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 4,0
channel = 0

[State 761, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 761, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 761, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 16,-57
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 761, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 761, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1

;-------------------------------------------------------------------------------
;--- JUMPING ---
[Statedef 762]
type = A
physics = N
movetype = I
anim = 762
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 762, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1

[State 762, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0

[State 762, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 4, 0
channel = 0

[State 762, Snd]
type = playsnd
trigger1 = !time
value = 760,0
channel = 1

[State 762, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 762, FX]
type = explod
trigger1 = !time
anim = 8360
sprpriority = 5
postype = p1
pos = 11,-93
pausemovetime = -1
supermovetime = -1
scale = 0.5, 0.5
ownpal = 1

[State 762, Shake]
type = envshake
trigger1 = !time
time = 0
ampl = 0

[State 762, End]
type = changestate
trigger1 = !animtime
value = 763
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 763]
type = A
physics = N
movetype = I
anim = 763
ctrl = 1

[State 763, Vel]
type = velset
trigger1 = !time
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)

[State 763, Accel]
type = gravity
trigger1 = 1

[State 763, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52

;-------------------------------------------------------------------------------
;--- HELPER ---
[Statedef 765]
type = A
physics = N
movetype = I
anim = ifelse(root, statetype = C, 766, ifelse(root, statetype = A, 767, 765))
velset = 0, 0
ctrl = 0

[State 765, NHB]
type = nothitby
trigger1 = 1
value = SCA

[State 765, Bind]
type = bindtoroot
trigger1 = 1
time = -1

[State 765, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel) && root, command = "down"
trigger2 = root, AIlevel && (root, statetype != A) && p2statetype = C
value = 766

[State 765, Anim]
type = changeanim
triggerall = !time
trigger1 = !(root, AIlevel) && root, command = "fwd"
trigger2 = root, AIlevel && anim != 766
value = ifelse((root, statetype = A), 767, 765)

[State 765, Anim]
type = changeanim
trigger1 = anim = 765 || anim = 767
value = ifelse((root, statetype = A), 767, 765)

[State 765, Disable]
type = varset
trigger1 = time >= ifelse((root, statetype = A), 7, 8)
trigger2 = facing != (root, facing)
trigger3 = !(root, ctrl)
trigger3 = (root, stateno != [760, 762]) && (root, stateno != 5120)
var(0) = 1

[State 765, Disable]
type = varset
triggerall = !(root, AIlevel)
trigger1 = (root, command = "holdback")
trigger2 = time < 4 && (root, command = "holdfwd" + root, command = "holddown") > 1
trigger3 = time >= 4 && (root, command = "holdfwd" || root, command = "holddown")
trigger4 = time >= 1 && (((anim = 765 || anim = 767) && root, command = "fwd") || (anim = 766 && root, command = "down"))
var(0) = 1

[State 765, Disable]
type = changeanim
trigger1 = var(0) = 1
value = 9741

[State 765, Standing /air]
type = reversaldef
trigger1 = !var(0) && (anim = 765 || anim = 767)
trigger1 = (root, stateno != 5120) || !(root, animtime)
reversal.attr = SCA, AA
p1stateno = 766
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, Crouching]
type = reversaldef
trigger1 = !var(0) && anim = 766
reversal.attr = SC, AA
p1stateno = 766
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, Disable]
type = reversaldef
trigger1 = var(0) = 1
reversal.attr =
pausetime = 0, 0
sparkno = -1
numhits = 0

[State 765, End]
type = destroyself
trigger1 = time >= 18
trigger2 = (root, movetype != I)
trigger3 = !(root, ctrl) && (root, stateno != [760, 762]) && (root, stateno != 5120)
trigger4 = (root, stateno = [760, 762]) && (root, time <= 1)

;-------------------------------------------------------------------------------
;--- Success ---
[Statedef 766]
movetype = I
ctrl = 0

[State 766, Disable]
type = varset
trigger1 = 1
var(0) = 1

[State 766, End]
type = destroyself
trigger1 = root, stateno = [760, 762]
trigger2 = time >= 2



;------------------------------------------------------------------------------;
[Statedef 800]
type    = S
movetype = A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2


[State 800, HitDef]
type = HitDef
trigger1 = Animelem = 1
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = M-          ;Affect only ground people who are not being hit
priority = 3, Miss    ;Throw has low priority, must be miss or dodge type.
sparkno = -1          ;No spark
hitsound = S2,800
p1sprpriority = 1     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1          ;Force p2 to face KFM
p1stateno = 801       ;On success, KFM changes to state 810
p2stateno = 802       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
numhits = 0



[State 800, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S4,0
ignorehitpause = 1
persistent = 1

[State 800, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 800, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;
[Statedef 801]
type    = S
movetype = A
physics = N
velset = 0,0

[State 860, Grab]
type = PlaySnd
trigger1 = time = 0
value = S800, 10

[State Throw Escape]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" ;&& Target, command != "holddown"
trigger1 = (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value = 890

[State Throw Escape]
type = varadd
trigger1 = var(19)>0
var(19) =-1

[State 801, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 11
value = S4, 1
ignorehitpause = 1
persistent = 1


[State 801, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0

[State 901, Throw]
type = TargetState
trigger1 = Time = 0
value = 802

[State 801, TargetState]
type = TargetState
trigger1 = AnimElem = 12
value = 803

[State 801, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 802
persistent = 0

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 5
x = 37

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 6
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 7
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 8
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 11
x = 28


[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = 42,0
;postype = P1
time = -1

[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 11
pos = 42,0
;postype = P1
time = -1

[State 801, TargetBind]
type = targetBind
trigger1 = animelem = 12
pos = 38, 0
;postype = P1
time = 1

[State 801, HitAdd]
type = HitAdd
trigger1 = AnimElem = 12
value = 1


[State 802, Explod]
type = Explod
trigger1 = AnimElem = 12
anim = 8003
ID = 8003
pos= 50,-50
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
pausemovetime = 0
scale = 1,1
sprpriority = 99
ontop = 1
ownpal = 1


[State 810, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 11
value = 1, 8
channel = 1

[State 810, Hitsound]
type = PlaySnd
trigger1 = AnimElem=12
value = s2,5
channel = 2

[State 810, EnvShake]
type = EnvShake
trigger1 = animelem = 12
time = 12
ampl = 5


[State 801, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 12
value = -72


[State 801, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 300
ctrl = 1

;-------------------------------------------------------------------------------
;
[Statedef 802]
type    = A
movetype = H
physics = N
velset = 0,0
sprpriority = -1

[State Throw Escape]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" ;&& Target, command != "holddown"
trigger1 = (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value = 890

[State Throw Escape]
type = varadd
trigger1 = var(19)>0
var(19) = -1

[State 802, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 802, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1

[State 802, ChangeAnim2]
type = ChangeAnim2
trigger1 = Time = 0
value = 803
;-------------------------------------------------------------------------------
[Statedef 803]
type = A
movetype = H
physics = N
ctrl = 0
velset = -5,-6.5
sprpriority = -1

[State 803, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.55

[State 803, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 5061

[State 803, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 803, SelfState]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;-------------------------------------------------------------------------------
[Statedef 804]
type = A
movetype = H
physics = N
ctrl = 0
velset = -7,-8.5
sprpriority=-1

[State 803, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.55

[State 803, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 5061

[State 803, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 803, SelfState]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;------------------------------------------------------------------------------;
[Statedef 810]
type    = S
movetype = A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2


[State 810, Button Detect]
type = VarSet
trigger1 = Time = 0 && !AILevel
var(10) = ifElse(command = "c", 2, 1)

[State 810, Button Detect (AI)]
type = VarSet
trigger1 = Time = 0 && AILevel
var(10) = ifelse(random<500,2,1)


[State 800, HitDef]
type = HitDef
trigger1 = Animelem = 1
attr = S, NT
hitflag = M-
priority = 3, Miss
sparkno = -1
p1facing = ifelse(command = "holdfwd", 1, -1)
p2facing = 1
p1stateno = 811
p2stateno = 815
down.bounce = 1
guard.dist = 0
numhits = 0
hitsound = S2,800
fall.damage = ifelse(var(10) = 2,30,0)

[State 800, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 3
value = S4,0
ignorehitpause = 1
persistent = 1

[State 800, Swing Snd]
type = PlaySnd
trigger1 = AnimElem = 3
value = 1,0
channel = 1

[State 800, ChangeState]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
[Statedef 811]
type    = S
movetype = A
physics = S
velset = 0,0

[State 860, Grab]
type = PlaySnd
trigger1 = time = 0
value = S800, 10

[State Throw Escape]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" ;&& Target, command != "holddown"
trigger1 = (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value = 890

[State Throw Escape]
type = varadd
trigger1 = var(19)>0
var(19)= -1

[State 804, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = 811

[State 811, Grab]
type = PlaySnd
trigger1 = time = 0
value = S800, 10

[State 811, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = S820, 1
ignorehitpause = 1
persistent = 1
channel= 4

[State 811, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 18
value = S4,2
ignorehitpause = 1
persistent = 1

[State 811, PlayerPush]
type = PlayerPush
trigger1 = 1
value = 0


[State 811, TargetState]
type = TargetState
trigger1 = var(10)= 1
trigger1 = AnimElem = 19
value = 816

[State 811, TargetState]
type = TargetState
trigger1 = var(10)= 2
trigger1 = AnimElem = 19
value = 817


[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 5
x = 37

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 6
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 7
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 8
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 14
x = 20

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 15
x = 17

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 16
x = 16

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 17
x = 18

[State 0, PosAdd]
type = PosAdd
;triggerall = frontedgebodydist < 70
trigger1 = Animelem = 18
x = 27

[State 801, TargetBind]
type = TargetBind
trigger1 = animelem = 1
pos = 32,0
;postype = P1
time = -1

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(13)>=0 && AnimElemTime(14)<0
pos = ceil(-8*const(size.xscale)),ceil(-75*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(14)>=0 && AnimElemTime(15)<0
pos = ceil(-20*const(size.xscale)),ceil(-97*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(15)>=0 && AnimElemTime(16)<0
pos = ceil(-25*const(size.xscale)),ceil(-105*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(16)>=0 && AnimElemTime(17)<0
pos = ceil(-35*const(size.xscale)),ceil(-105*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(17)>=0 && AnimElemTime(18)<0
pos = ceil(50*const(size.xscale)),ceil(-100*const(size.yscale))

[State 1000,PlaySnd]
type = targetbind
trigger1 = AnimElemTime(18)>=0 && AnimElemTime(19)<0
pos = ceil(55*const(size.xscale)),ceil(-20*const(size.yscale))


[State 811, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 18
value = ifelse(var(10) = 2,-92,-72)

[State 801, EnvShake]
type = EnvShake
trigger1 = AnimElem = 18
time = 10
freq = 50
ampl = 5
phase = 270

[State 52, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 52
ctrl = 0

;-------------------------------------------------------------------------------
[Statedef 815]
type    = A
movetype = H
physics = N
velset = 0,0
ctrl = 0

[State 805, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 815

[State 805, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 805, SelfState]
type = SelfState
Trigger1 = enemynear, stateno != 811
value = 5110
;-------------------------------------------------------------------------------
[Statedef 816]
type = A
movetype = H
physics = N
ctrl = 0
velset = -2,-2.5
sprpriority = -1

[State 803, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.55

[State 803, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 5061

[State 803, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 803, SelfState]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100

;-------------------------------------------------------------------------------
[Statedef 817]
type = A
movetype = H
physics = N
ctrl = 0
velset = -7,-8.5
sprpriority=-1

[State 803, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA

[State 803, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.55

[State 803, ChangeAnim]
type = ChangeAnim2
trigger1 = Time = 0
value = 5061

[State 803, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
time = 20

[State 803, SelfState]
type = SelfState
trigger1 = time > 1
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100
;-------------------------------------------------------
;Blind Blow
[Statedef 820]
type = S
movetype= A
physics = S
juggle = 0
velset = 0,0
ctrl = 0
anim = 800


[State 850, 1]
type = HitDef
Trigger1 = Animelem = 1
attr = S, NT
hitflag = M-
priority = 1, Miss
sparkno = -1
sprpriority = 1
p1facing = 1 ;ifelse (command = "holdfwd", -1, 1)
p2facing = 1
p1stateno = 825
p2stateno = 830
guard.dist = 0
fall = 1
fall.damage = 20

[State 850, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1
;----------------------------------------------------------------------
;Blind Blow - Hold & Hit
[Statedef 825]
type = S
movetype = A
physics = N
anim = 825
poweradd = 60


[State 825, Grab]
type = PlaySnd
trigger1 = time = 0
value = S800, 10

[State Throw Escape]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (Target, command = "holdfwd" || Target, command = "holdback") && Target, command != "holdup" ;&& Target, command != "holddown"
trigger1 = (target,command="b" || target,command="c" || target,command="y" || target,command="z")
value = 890

[State Throw Escape]
type = varadd
trigger1 = var(19)>0
var(19)= -1

[State 810, Running]
type = PlaySnd
trigger1 = Animelem = 2
trigger2 = Animelem = 6
trigger3 = Animelem = 10
value = 100,0

[State 810, Running]
type = PlaySnd
trigger1 = Animelem = 5
trigger2 = Animelem = 8
value = 100,0


[State 810, 1]
type = PlaySnd
trigger1 = animelem = 13
value = 4, 5

[State 810, 1]
type = PlaySnd
trigger1 = animelem = 15
value = 2,22

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem =1 ;2
value = -1 ;2

[State 810, SprPriority]
type = SprPriority
trigger1 = AnimElem = 13
value = 7

[State 810, Bind 1]
type = TargetBind
trigger1 = Time = 120
pos = 0, 0

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 5
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 6
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 7
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 8
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 9
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 10
x = 15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 11
x = 5


[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 13
x = -15

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 14
x = -20

[State 0, PosAdd]
type = PosAdd
trigger1 = animelem = 15
x = -15

[State 801, HitAdd]
type = HitAdd
trigger1 = AnimElem = 15
value = 1


[State 802, Explod]
type = Explod
trigger1 = AnimElem = 15
anim = 8003
ID = 8003
pos = 10,-50
postype = p2  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
pausemovetime = 0
scale = 1,1
sprpriority = 99
ontop = 1
ownpal = 1


[State 810, Woosh Sound]
type = PlaySnd
trigger1 = AnimElem = 13
value = 1, 8
channel = 1

[State 810, Hitsound]
type = PlaySnd
trigger1 = AnimElem = 15
value = s2,5
channel = 2

[State 810, EnvShake]
type = EnvShake
trigger1 = animelem = 15
time = 12
ampl = 6


[State 860, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 15
value = -80

[State 860, Knock away]
type = TargetState
trigger1 = AnimElem = 15
value = 831


[State 860, Helper]
type = Helper
trigger1 = Time = 0
helpertype = normal ;player
name = "Clone Assistant"
ID = 826
stateno = 826
pos = -70,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
ignorehitpause = 1




[State 0, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 4
trigger2 = animelem = 6
trigger3 = animelem = 8
trigger4 = animelem = 10
trigger5 = animelem = 12
value = -5
kill = 0

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------------------------------------------
;Blind Blow - Clone Helper
[Statedef 826]
type = S
movetype= A
physics = N
anim = 826
ctrl = 0
sprpriority = 7

[State 826, Helper]
type = Helper
trigger1 = AnimElem = 2
id = 827
name = "tsumuji"
pos = const(size.xscale),const(size.yscale)
postype = P1
stateno = 827
helpertype = normal
keyctrl = 0
ownpal = 1

[State 826, AssertSpecial]
type = AssertSpecial
trigger1 = animelemtime(28)>0
trigger1 = time%3=0
flag = invisible


[State 826, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
trigger2 = parent, movetype = H
trigger3 = parent, stateno != 825

;---------------------------------------------------------------------------
;Wait
[StateDef 827]
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


[State 0, Explod]
type = Explod
trigger1 = animelem = 2
anim = 8020
ID = 8020
pos = -10, -82
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
trigger2 = Helper(826), animelem = 15
value = 1211
ctrl = 0

;----------------------------------------------------------------------
;Blind Blow - Opponent Caught
[Statedef 830]
type = S
physics = N
movetype = H
velset = 0,0
ctrl = 0

[State 861, 1]
type = ChangeAnim2
Trigger1 = time = 0
value = 830

[State 861, 1]
type = ChangeAnim
Trigger1 = time = 45
value = 5300

[State 821, 4]
type = SelfState
Trigger1 = enemynear, stateno != 825
value = 5110

;----------------------------------------------------------------------
;Blind Blow - Opponent Knocked away
[Statedef 831]
type = A
movetype = H
physics = N
velset = 10,-6
poweradd = 40
anim = 5050

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = -3


[State 871, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .5

[State 871, 2] ; Recover near ground (use ChangeState)
type = ChangeState
trigger1 = Pos Y >= 0
value = 832 ;HITFALL_RECOVER

;---------------------------------------------------------------------------
; Blind Blow - Opponent Bounce
[Statedef 832]
type    = A
movetype= H
physics = N
velset = 0,0


[State 0, EnvShake]
type = EnvShake
trigger1 = time = 0
time = 10
ampl = 7


[State 255, 1]
type = Changeanim
Trigger1 = time = 0
value = 5100

[State 255, 5]
type = ChangeState
trigger1 = time = 5
value = 833
ctrl = 0
;----------------------------------------------------------------------
;Blind Blow - Opponent in air (Can Recover)
[Statedef 833]
type = A
movetype = H
physics = N
velset = 5,-7


[State 873, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .4

[State 0, ChangeAnim]
type = ChangeAnim2
trigger1 = time = 0
value = 5051


[State 0, ChangeAnim]
type = ChangeAnim2
trigger1 = time = 10
value = 5061


[State 871, 2]
type = ChangeState
triggerall = alive = 1
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 821, 4]
type = SelfState
Trigger1 = Vel Y > 0 && Pos Y >= 0
value = 5110

[State 0, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 20
;-------------------------------------------------------------------------------
;Great Leap
[Statedef 850]
type = A
movetype = A
physics = A
juggle = 0
ctrl = 0
anim = 850
sprPriority = 1

[State 850, 1]
type = HitDef
Trigger1 = Animelem = 2
attr = A, NT
hitflag = AF;A-
priority = 4, Miss
sparkno = -1
sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 860
p2stateno = 870
guard.dist = 0
fall.damage = 30
fall = 1

[State 875, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 50
ctrl = 1

[State 850, CtrlSet]
type = CtrlSet
trigger1 = AnimTime = 0
value = 1
;----------------------------------------------------------------------
;Great Leap - Activate
[Statedef 860]
type = A
movetype= A
physics = A
anim = 860
poweradd = 40
velset = 0,0
sprPriority = 1

[State 860, Grab]
type = PlaySnd
trigger1 = time = 0
value = S800, 10

[State 810, 2]
type = PlaySnd
trigger1 = animelem = 6
value = 2, 22


[State 880, SprPriority]
type = SprPriority
trigger1 = animelem = 5
value = 3


[State 880, Bind 1]
type = TargetBind
trigger1 = Time = 0
pos = 0, 0

[State 860, PosAdd]
type = PosAdd
trigger1 = animelem = 1
x = 5
y = -27

[State 860, PosAdd]
type = PosAdd
trigger1 = animelem = 2
x = 5
y = -27

[State 860, PosAdd]
type = PosAdd
trigger1 = animelem = 3
x = 5
y = -27

[State 860, PosAdd]
type = PosAdd
trigger1 = animelem = 4
x = 5
y = -27

[State 860, PosAdd]
type = PosAdd
trigger1 = animelem = 5
x = 5
y = -27

[State 810, Hurt]
type = TargetLifeAdd
trigger1 = AnimElem = 6
value = -70


[State 810, Throw]
type = TargetState
trigger1 = AnimElem = 6
value = 875

[State 0, Explod]
type = Explod
trigger1 = AnimElem = 6
anim = 8002
ID = 8002
pos = 10,0
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
pausemovetime = -1
scale = 1,1
sprpriority = 5
ontop = 1
ownpal = 1


[State 810, EnvShake]
type = EnvShake
trigger1 = animelem = 6
time = 10
ampl = 5


[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 865
ctrl = 0

;----------------------------------------------------------------------
;Great Leap - Finish
[Statedef 865]
type    = A
physics = A
velset = 4,-6
anim = 42
ctrl = 0

[State 0, CtrlSet]
type = CtrlSet
trigger1 = animtime = 0
value = 1

;----------------------------------------------------------------------
;Great Leap - Opponent Caught
[Statedef 870]
type = A
physics = N
movetype = H
velset = 0,0
ctrl = 0


[State 811, 1]
type = ChangeAnim2
Trigger1 = time = 0
value = 870;5002

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = enemynear, movetype = H
value = 5100 ;Hit ground


;----------------------------------------------------------------------
;Great Leap - Slammed
[Statedef 875]
type = A
movetype = H
physics = N
velset = 0,11
poweradd = 0
anim = 5061
ctrl = 0

[State 895, EnvShake]
type = EnvShake
trigger1 = Vel Y > 0 && Pos Y >= 0
time = 15
freq = 30
ampl = 4
phase = 10

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;-------------------------------------------------------------------------------
;==========================< Target Escaped >===================================
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 1


[State 890, ChangeAnim]
type = ChangeAnim
trigger1 = command = "holddown"
trigger1 = !time && numtarget
value = 5946


[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0

[State 890, p2state]
type = targetstate
trigger1 = !time && numtarget
value = 895

[State 890, Throw]
type = targetfacing
trigger1 = !time && numtarget
value = -1

[State 890, Pos]
type = posadd
trigger1 = !time
x = 24

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 890, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 890, SprPriority 1]
type = SprPriority
trigger1 = AnimElemTime(6) >= 0
value = 1

[State 890, SprPriority -1]
type = SprPriority
trigger1 = AnimElemTime(2) <= 0
value = -1

[State 890, Pos]
type = posset
trigger1 = !time
y = 0

[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 900, Zero Counter FX Helper]
type = Helper
trigger1 = !time
helperType = Normal
stateNo = 8350
ID = 8350
name = "Zero Counter"
posType = P1
pos = 20, -66
superMovetime = 255
ownPal = 1

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- TARGET ---
[Statedef 895]
type = S
physics = N
movetype = I
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 895, Anim]
type = changeanim
trigger1 = !time
value = ifelse(selfanimexist(5945), 5945, 130)

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && !SelfAnimExist(5945) && SelfAnimExist(5940)
value = 5940

[State 895, ChangeAnim]
type = ChangeAnim
trigger1= !Time && !SelfAnimExist(5945) && !SelfAnimExist(5940) && SelfAnimExist(5910)
value = 5910

[State 895, ChangeAnim]
type = ChangeAnim
trigger1 = Time >= 20 && Anim = 130
value = 140

[State 895, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 895, Push]
type = playerpush
trigger1 = 1
value = 0
ignoreHitPause = 1

[State 895, Pos]
type = posset
trigger1 = !time
y = 0

[State 895, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 895, End]
type = selfstate
trigger1 = time >= 27
value = 0
ctrl = 1
;-------------------------------------------------------------------------------
;============================< CUSTOM COMBO >===================================
;--- GROUND ---
[Statedef 900]
type = S
physics = S
movetype = A
anim = 900
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 900, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 900, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 900, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 900, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 900, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 900, Snd]
type =playsnd
trigger1 = time = 4
value = 4,1
channel = 0

[State 900, SuperPause FX]
type = helper
trigger1 = time = 4
;helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = 9,-90
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 900, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s900,0
p2defmul = 1
darken = 0

[State 900, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 900, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;-------------------------------------------------------------------------------
;--- AIR ---
[Statedef 905]
type = A
physics = N
movetype = A
anim = 905
ctrl = 0
sprpriority = 2
poweradd = -1000

[State 905, Corner Push]
type = varset
trigger1 = time = 4
fvar(5) = 0

[State 905, Unguardable]
type = varset
trigger1 = time = 4 && numenemy
trigger1 = (enemynear, stateno != [120, 155])
var(17) = 30

[State 905, NHB]
type = nothitby
trigger1 = !time
value = SCA
time = 38

[State 905, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 905, Var]
type = varset
trigger1 = time >= 4
var(20) = 180

[State 905, Snd]
type = playsnd
trigger1 = time = 4
value = 4,1
channel = 0

[State 905, SuperPause FX]
type = helper
trigger1 = time = 4
;helpertype = normal
stateno = 8400
ID = 8400
name = "Custom Combo Startup"
postype = p1
pos = -10,-110
supermovetime = 255
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 905, Super Pause]
type = superpause
trigger1 = time = 4
time = 30
movetime = 30
anim = -1
sound = s900,0
p2defmul = 1
darken = 0

[State 905, AfterImage]
type = afterimage
trigger1 = !animtime
time = 2
timegap = 1
framegap = 4
length = 13
palbright = 0, 0, 0
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State 905, End]
type = changestate
trigger1 = !animtime
value = 906
ctrl = 1

;-------------------------------------------------------------------------------
[Statedef 906]
type = A
physics = N
movetype = I
anim = 906
ctrl = 1

[State 906, Accel]
type = gravity
trigger1 = 1

[State 906, Land]
type = changestate
trigger1 = pos y > -vel y
value = 52


