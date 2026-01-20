; ADD004 BASIC PIEs ReBuilded CNS (08/03/2023)
;==============================================
; This file is Made by PIE.
; there is a backup of this file in the same folder, named "<samename>.a4bk".
; to Restore, use assist tool, or delete this file, then remove ".a4bk" from the neme of backup.
;==============================================

;===============================================================================
;============================<SYSTEM STATES>====================================
;===============================================================================
;=============================< STANDING >======================================
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 0, Remove Explods]
type = RemoveExplod
trigger1 = IsHelper

[State 0, Destroy Helpers]
type = DestroySelf
trigger1 = IsHelper

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && !AnimTime
value = 0

[State 0, Dead]
type = ChangeState
trigger1 = !Alive
value = 5050


;==============================<CROUCHING>======================================
;Stand to Crouch
[StateDef 10]
type = C
physics = C
moveType = I
velSet = 0,0
sprPriority = 0

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 12
value = 10
elem = 3 - AnimElemNo(0)

[State 10, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 10
value = 10

[State 10, End]
type = ChangeState
trigger1 = !AnimTime
value = 11


;Crouching
[StateDef 11]
type = C
physics = C
moveType = I
anim = 11
velSet = 0,0
sprPriority = 0

[State 11, ChangeAnim]
type = ChangeAnim
trigger1 = Anim = 6 && !AnimTime
value = 11


;Crouch to Stand
[StateDef 12]
type = S
physics = S
moveType = I
velSet = 0,0
sprPriority = 0

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = !Time && Anim = 10
value = 12
elem = 3 - AnimElemNo(0)

[State 12, ChangeAnim]
type = ChangeAnim
trigger1 = Anim != 12
value = 12

[State 12, End]
type = ChangeState
trigger1 = command = "holddown" && command != "holdup"
value = 10

[State 12, End]
type = ChangeState
trigger1 = !AnimTime
value = 0



;====================< WALKING >====================
[Statedef 20]
type = S
physics = S
movetype = I
sprpriority = 0

[State 20, Vel]
type = velset
trigger1 = command = "holdfwd"
x = const(velocity.walk.fwd.x)

[State 20, Vel]
type = velset
trigger1 = command = "holdback"
x = const(velocity.walk.back.x)

[State 20, Anim]
type = changeanim
triggerall = vel x > 0
trigger1 = anim != 20 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 20

[State 20, Anim]
type = changeanim
triggerall = vel x < 0
trigger1 = anim != 21 && anim != 5
trigger2 = anim = 5 && animelemtime(1) >= 1
value = 21


;==============================< JUMPING >======================================
; Jump Start
[Statedef 40]
type    = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)


[State 40, 6] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -4
trigger1 = Time = 0


[State 40, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; AirJump Start
[Statedef 45]
type    = A
physics = N
ctrl = 0
velset = 0,0

[State 45, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(44)
value = 44

[State 45, 2]
type = ChangeAnim
trigger1 = !SelfAnimExist(44)
value = 41

[State 45, 3]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, 6]
type = VelSet
trigger1 = Time = 2
x = ifelse(sysvar(1)=0, const(velocity.airjump.neu.x), ifelse(sysvar(1)=1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)



[State 45, 7] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -4
trigger1 = Time = 0


[State 45, 8]
type = ChangeState
trigger1 = Time = 2
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Up
[Statedef 50]
type    = A
physics = A

;Jump Sound
[State 50, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = 40,0
volume = 0
channel = -1

[State 50, Landing FX]
type = Explod
trigger1 = pos Y >=0
trigger1 = time = 0
anim = 8560
ID = 8560
pos = 0,25
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .6,.6
sprpriority = -3
ownpal = 1
removeongethit = 1
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999


[State 50, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 50, 2]
type = ChangeAnim
trigger1 = Time = 0
value = ifelse((vel x)=0, 41, ifelse((vel x)>0, 42, 43))

[State 50, 3]
type = ChangeAnim
trigger1 = Vel y > -2
trigger1 = SelfAnimExist(anim + 3)
persistent = 0
value = Anim + 3


[State 50, 4] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -4
trigger1 = Time = 0



;---------------------------------------------------------------------------
; Jump Down (empty state for compatibility)
[Statedef 51]
type    = A
physics = A

[State 51, 1]
type = Null
trigger1 = 1
;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
ctrl = 0
anim = 47

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 3
value = 1

[State 52, Landing FX]
type = Explod
trigger1 = time = 1
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

[State 52, Landing]
type = PlaySnd
trigger1 = time = 1
value = 52,0


[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;================================< RUN >========================================
[Statedef 100]
type = S
physics = N
movetype = I
anim = 100
ctrl = 0
sprpriority = 1

[State 100, Vel]
type = velset
trigger1 = 1
x = const(velocity.run.fwd.x)

[State 100, Step Sound]
type = PlaySnd
trigger1 = (AnimElem = 3 || AnimElem = 7)
value = 100, ifElse((AnimElem = 3), 0, 1)

[State 100, Jump]
type = changestate
trigger1 = !AIlevel
trigger1 = command = "holdfwd" && command = "holdup"
value = 40

[State 100, Jump]
type = changestate
trigger1 = AIlevel && random < 25
value = 40

[State 100, End]
type = ChangeState
trigger1 = !AILevel && command != "holdfwd"
trigger2 = AILevel && P2BodyDist x < 30
trigger3 = AILevel && enemynear, movetype = A && random<200
value = 101


;--- STOP ---
[Statedef 101]
type = S
physics = S
movetype = I
anim = 101
ctrl = 0
sprpriority = 1

[State 101, Snd]
type = playsnd
trigger1 = !time
value = 101,0

[State 101, Dust]
type = explod
trigger1 = !time
anim = 8104
sprpriority = 3
postype = p1
pos = 0, 0
vel = 0, 0
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 101, Jump]
type = changestate
trigger1 = !AIlevel && command = "holdup"
value = 40

[State 101, End]
type = changestate
trigger1 = !animtime
value = ifelse(command = "holddown", 10, 0)
ctrl = 1


[Statedef 102]
type = S
physics = N
movetype = I
anim = 102
ctrl = 0
sprpriority = 1

[State 102, Snd]
type = playsnd
trigger1 = !time
value = 110,0


[State 102, Run]
type = varset
trigger1 = !time
sysvar(1) = 1

[State 102, Run]
type = varset
triggerall = AnimElemTime(2) <= 0
trigger1 = !AIlevel && command != "holdfwd"
sysvar(1) = 0

[State 102, Run]
type = changestate
trigger1 = AnimElemTime(2) = 0 && sysvar(1)
value = 100

[State 102, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 2
x = 6.75
y = -4

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = VelAdd
trigger1 = AnimElemTime(2) > 0
y = 0.65

[State 102, End]
type = changestate
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 103

;--- LAND ---
[Statedef 103]
type = S
physics = S
ctrl = 1
anim = 103
velset = 0, 0

[State 103, Pos]
type = posset
trigger1 = 1
y = 0

[State 103, Snd]
type = playsnd
trigger1 = !time
value = 100,0

[State 103, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 103, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


[Statedef 105]
type = A
physics = N
movetype = I
velset = 0, 0
anim = 105
ctrl = 0
sprpriority = 1

[State 105, Snd]
type = playsnd
trigger1 = animelem = 2
value = 105,0

[State 105, Vel]
type = velset
trigger1 = animelem = 2
x = const(velocity.run.back.x)
;y = const(velocity.run.back.y)

[State 105, 1]
type = VelMul
trigger1 = AnimElemTime(2) > 0
x = .98

[State 105, 1]
type = null
trigger1 = AnimElemTime(2) > 0
y = 0.75

[State 110, Type]
type = null
trigger1 = AnimElemTime(2) >= 0
stateType = A
physics = N

[State 105, Land]
type = null
trigger1 = animelemtime(2) >= 0
trigger1 = pos y > -vel y
value = 106

[State 200, ChangeState]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


;--- LAND ---
[Statedef 106]
type = S
physics = S
ctrl = 0
anim = 106
velset = 0, 0

[State 106, Pos]
type = posset
trigger1 = 1
y = 0

[State 106, Snd]
type = playsnd
trigger1 = !time
value = 100,1

[State 106, Dust]
type = explod
trigger1 = !time
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 106, Ctrl]
type = ctrlset
trigger1 = time >= 2
value = 1

[State 106, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1
;===========================================================================
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Guard Push (Stand)
[Statedef 160]
type    = S
movetype= I
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
anim = 160
sprpriority = 2

[State 160, a1]
type = VelMul
trigger1 = 1
x = 0.75

[State 160, a2]
type = VelSet
trigger1 = Time = 10
x = 0

[State 160, a3]
type = Width
trigger1 = 1
value = 10,0

[State 160, a4]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 30

[State 160, a5]
type = Helper
trigger1 = animelem = 2;Time = 0
helpertype = Normal
name = "GuardPush"
postype = P1
pos = -50,0
stateno = 163
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 160, a6]
type = Explod
trigger1 = animelem = 3
anim = 8145
postype = p1
pos = 55,-50
ownpal = 1
vel = 0,0
scale = 1,1
ignorehitpause = 1
sprpriority = 7

[State 160, a7]
type = PlaySnd
trigger1 = Time = 9
value = 101,0
channel = 1


[State 160, a9]
type = ChangeState
trigger1 = AnimTime = 0
value = 130
ctrl = 1

[Statedef 161];--------------crouch
type    = C
movetype= I
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
anim = 161
sprpriority = 2

[State 161, a1]
type = VelMul
trigger1 = 1
x = 0.75

[State 161, a2]
type = VelSet
trigger1 = Time = 10
x = 0

[State 161, a3]
type = Width
trigger1 = 1
value = 10,0

[State 161, a4]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 27

[State 161, a5]
type = Helper
trigger1 = animelem = 2;Time = 0
helpertype = Normal
name = "GuardPush"
postype = P1
pos = -50,0
stateno = 163
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 161, a6]
type = Explod
trigger1 = animelem = 2
anim = 8145
postype = p1
pos = 55,-30
ownpal = 1
vel = 0,0
scale = 1,1
ignorehitpause = 1
sprpriority = 7


[State 161, a9]
type = ChangeState
trigger1 = AnimTime = 0
value = 131
ctrl = 1


[Statedef 162];------------air
type    = A
movetype= I
physics = N
poweradd= 0
velset = 0,0
ctrl = 0
anim = 162
sprpriority = 2

[State 162, a1]
type = VelMul
trigger1 = 1
x = 0.75

[State 162, a2]
type = VelSet
trigger1 = Time = 10
x = 0

[State 162, a3]
type = Width
trigger1 = 1
value = 10,0

[State 162, a4]
type = NotHitBy
trigger1 = Time = 0
value = SCA
time = 23

[State 162, a5]
type = Helper
trigger1 = animelem = 2;Time = 0
helpertype = Normal
name = "GuardPush"
postype = P1
pos = -50,0
stateno = 163
ownpal = 1
size.height = 200
size.ground.back = 30
size.ground.front = 30

[State 162, a6]
type = Explod
trigger1 = animelem = 2
anim = 8145
postype = p1
pos = 43,-63
ownpal = 1
scale = 1,1
vel = 0,0
ignorehitpause = 1
sprpriority = 7



[State 162, a9]
type = ChangeState
trigger1 = AnimTime = 0
value = 132
ctrl = 1


;----------------------------------------------------------------
;guard push helper
[Statedef 163]
type    = S
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 163
sprpriority = -4

[State 162, a8]
type = PlaySnd
trigger1 = Time = 1
value = 160,0
channel = 0

[State 6350, a1]
type = PlayerPush
trigger1 = Time >= 0
value = 1

[State 6350, a2]
type = VelSet
trigger1 = Time = [0,10]
x = 30

[State 6350, a3]
type = VelSet
trigger1 = Time = [11,13]
x = 20

[State 6350, a4]
type = VelSet
trigger1 = Time >= 14
x = 10

[State 6350, a5]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 6350, a6]
type = DestroySelf
trigger1 = Time >= 18


;-------------------------------------------------------------------------------
;===================< GUARD >================
;--- START ---
[Statedef 120]
type = U
physics = U
anim = 120 + (statetype = C) + (statetype = A) * 2
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 120, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
[State 120, High to Low]
type = statetypeset
trigger1 = !AILevel && StateType = S && command = "holddown"
trigger2 = AILevel && StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AILevel && StateType = C && command != "holddown"
trigger2 = AILevel && StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 120, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 120, End]
type = changestate
trigger1 = !animtime || AIlevel
value = 130 + (statetype = C) + (statetype = A) * 2
[State 120, Stop]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140

;-------------------------------------------------------------------------------
;--- STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S
[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130
[State 130, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
value = 131
[State 130, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140
[State 130, Snd]
type = playsnd
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
value = 52,0
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 8102
sprpriority = -3
postype = p1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

;--- CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C
[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
value = 130
[State 131, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Stop Guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- AIR GUARD (guarding) ---
[Statedef 132]
type = A
physics = N
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
sysvar(0) = (pos y >= 0 && vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State 132, AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 132, End]
type = changestate
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 132, End]
type = changestate
trigger1 = sysvar(0)
value = 52
[State 132, stop guarding]
type = changestate
trigger1 = (!AIlevel && command != "holdback")
trigger2 = !inguarddist
trigger3 = AIlevel && numenemy
trigger3 = enemynear, hitdefattr = SCA, AT
value = 140


;--- GUARD (end) ---
[Statedef 140]
type = U
physics = U
ctrl = 1
[State 140, Anim]
type = changeanim
trigger1 = !time
value = 140 + (statetype = C) + (statetype = A) * 2
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = S
physics = S
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = C
physics = C
[State 140, Type]
type = statetypeset
trigger1 = !time && statetype = A
physics = A
[State 140, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 140, End]
type = changestate
trigger1 = !animtime
value = (statetype = C) * 11 + (statetype = A) * 51

;--- SGUARDHIT (shaking) ---
[Statedef 150]
type = S
movetype = H
physics = N
velset = 0, 0
[State 150, Anim]
type = changeanim
trigger1 = 1
value = 150
[State 150, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 150, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
;--- SGUARDHIT2 (knocked back) ---
[Statedef 151]
type = S
movetype = H
physics = S
anim = 150
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
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S

[State 151, End]
type = changestate
trigger1 = hitover
value = 130
ctrl = 1


;--- CGUARDHIT (shaking) ---
[Statedef 152]
type = C
movetype = H
physics = N
velset = 0, 0
[State 152, Anim]
type = changeanim
trigger1 = 1
value = 151
[State 152, End]
type = changestate
trigger1 = hitshakeover
value = 151 + 2 * ((!AIlevel && command = "holddown") || (AIlevel && (enemynear, movetype = A) && (enemynear, statetype = C)))
[State 152, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S


;--- CGUARDHIT2 (knocked back) ---
[Statedef 153]
type = C
movetype = H
physics = C
anim = 151
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
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AILevel && Random < (250 * (AILevel ** 2 / 64.0))
trigger2 = StateType = S && (EnemyNear, MoveType = A) && (EnemyNear, StateType = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AILevel && Random < (125 * (AILevel ** 2 / 64.0))
trigger2 = StateType = C && (EnemyNear, MoveType = A) && (EnemyNear, StateType != C)
statetype = S
physics = S
[State 153, End]
type = changestate
trigger1 = hitover
value = 131
ctrl = 1


;--- AGUARDHIT (shaking) ---
[Statedef 154]
type = A
movetype = H
physics = N
velset = 0, 0
[State 154, Anim]
type = changeanim
trigger1 = 1
value = 152
[State 154, End]
type = changestate
trigger1 = hitshakeover
value = 155


;--- AGUARDHIT2 (knocked away) ---
[Statedef 155]
type = A
movetype = H
physics = N
anim = 152
[State 155, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1
[State 155, Vel]
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
sysvar(0) = (pos y >= 0 && vel y > 0)
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
trigger1 = sysvar(0) && inguarddist
trigger1 = (!AIlevel && command = "holdback") || AIlevel
value = 130
[State 155, End]
type = changestate
trigger1 = sysvar(0)
value = 52

; Lose by Time Over
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 10960, sound]
type = PlaySnd
trigger1 = animelem = 5
volumescale = 255
value = s80,169

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;---------------------------------------------------------------------------
; DRAWGAME
[Statedef 175]
type = S
ctrl = 0
velset = 0,0

[State 175, 1] ; If no anim, use go to lose state.
type = ChangeState
trigger1 = Time = 0
trigger1 = !SelfAnimExist(175)
value = 170

[State 175, 2]
type = ChangeAnim
trigger1 = Time = 0
value = 175

[State 0, Explod]
type = Explod
trigger1= animelem = 2
anim = 6188
pos = 30,-120
scale = .4,.4
postype = p1
bindtime = -1
removetime = 200
sprpriority = 5
removeongethit = -1
pausemovetime = 9999
supermovetime= 9999

[State 10960, sound]
type = PlaySnd
trigger1 = animelem = 2
volumescale = 255
value = s80,85

[State 175, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
[Statedef 180]
type = S
ctrl = 0
anim = 181
velset = 0,0


[State 180]
type = AssertSpecial
trigger1 = Time = [0,280]
flag = RoundNotOver


[State 180,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 1
name = "helper1"
id = 7100
pos = 0,0
postype = p1
stateno = 7100
;helpertype=normal
ownpal = 1
keyctrl = 1


[State 180, Spark]
type = Explod
trigger1 = AnimElem = 19
Anim = 182
id = 182
pos = 100, 0
postype = p2
ownpal = 1
bindtime = 1
removetime=-1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)


[State 180]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1000,1

[State 180, PlaySnd]
type = PlaySnd
trigger1 = animelem = 31
value = s181,1
channel = 2

[State 180, 1]
type = ChangeState
trigger1 = MatchOver
trigger1 = time = 0
value = ifelse(random<500,181,185)


[State 180, 1]
type = ChangeState
trigger1 = !MatchOver
trigger1 = time = 0
trigger1 = random<600
value = 182+(random%2)

;-------------------------------------------------------------------------------
;WIN POSE
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0
sprpriority = 1


[State 181, AssertSpecial]
type = AssertSpecial
trigger1 = Time = [0,240]
flag = RoundNotOver

[state 181, assertspecial]
type = assertspecial
trigger1 = Time >= 0
flag = NoBarDisplay


[State 180,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 7101
pos = 0,0
postype = p1
stateno = 7101
;helpertype=normal
ownpal = 1
keyctrl = 1

[State 181, Explod]
type = Explod
trigger1 = AnimElem = 19
Anim = 182
pos = 200, 0
postype = p2
ownpal = 1
bindtime = 1
removetime=-1
pausemovetime = -1
supermove = 1
ignorehitpause = 1
sprpriority = 5
scale = const(size.xscale),const(size.yscale)


[State 181, PlaySnd]
type = PlaySnd
trigger1 = AnimElem = 16
value = 1000,1

[State 182, PlaySnd]
type = PlaySnd
trigger1 = animelem = 31
value = s181,1
channel = 2

[State 182, PlaySnd]
type = PlaySnd
trigger1 = animelem = 23
trigger2 = animelem = 25
trigger3 = animelem = 27
value = S181,1


[State 182, Explod]
type = Explod
trigger1 = NumExplod(180) = 0
trigger1 = animelem = 31
anim = 188
ID = 180
pos = 60,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = -5
ontop = 0

[State 182, Explod]
type = Explod
trigger1 = NumExplod(181) = 0
trigger1 = animelem = 33
anim = 188
ID = 181
pos = 90,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = -4
ontop = 0

[State 182, Explod]
type = Explod
trigger1 = NumExplod(182) = 0
trigger1 = animelem = 35
anim = 188
ID = 182
pos = 120,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = -3
ontop = 0

[State 182, Explod]
type = Explod
trigger1 = NumExplod(183) = 0
trigger1 = animelem = 37
anim = 188
ID = 183
pos = 150,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = -2
ontop = 0

[State 182, Explod]
type = Explod
trigger1 = NumExplod(184) = 0
trigger1 = animelem = 39
anim = 188
ID = 184
pos = 180,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = -1
ontop = 0

[State 182, Explod]
type = Explod
trigger1 = NumExplod(185) = 0
trigger1 = animelem = 41
anim = 188
ID = 185
pos = 210,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
sprpriority = 0
ontop = 0

[State 184, Helper]
type = Helper
trigger1 = animelem = 14
helpertype = normal ;player
name = "Female Helper"
ID = 189
stateno = 189
pos = -5,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 184, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;-------------------------------------------------------------------------------
;WIN POSE 2
[Statedef 182]
type = S
ctrl = 0
anim = 180
velset = 0,0


[State 182, AssertSpecial]
type = AssertSpecial
trigger1 = Time = [0,240]
flag = RoundNotOver


[State 182,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time=0
name = "helper1"
id = 7100
pos = 0,0
postype = p1
stateno = 7100
;helpertype=normal
ownpal = 1
keyctrl = 1


[State 182, PlaySnd]
type = PlaySnd
trigger1 = animelem = 33
value = s181,0
channel = 2

[State 182, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;-------------------------------------------------------------------------------
;WIN POSE 3
[Statedef 183]
type = S
sprpriority = -4
anim = 183

[State 183, AssertSpecial]
type = AssertSpecial
trigger1 = Time = [0,240]
flag = RoundNotOver

[State 183, Safety]
type = removeexplod
trigger1 = 1
ID = 6013

[State 183, win]
type = changestate
trigger1 = time >= 120 && roundstate = 3
value = ifelse(roundstate = 3, 180, 0)
ctrl = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 20
value = s190,0
channel = 2

[State 184, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win pose 1
[Statedef 184]
type = S
ctrl = 0
anim = 184
velset = 0,0

[State 183, AssertSpecial]
type = AssertSpecial
trigger1 = Time = [0,240]
flag = RoundNotOver

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 7100
pos = 0,0
postype = p1
stateno = 7100
helpertype = normal
ownpal = 1
keyctrl = 1


[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; Win pose 5
; CNS difficulty: basic
[Statedef 185]
type = S
ctrl = 0
anim = 185
velset = 0,0

[State 185, AssertSpecial]
type = AssertSpecial
trigger1 = Time = [0,240]
flag = RoundNotOver


[state 185, assertspecial]
type = assertspecial
trigger1 = Time >= 0
flag = NoBarDisplay


[State 185, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 4,9

[State 181,CAMERA]
type = helper
trigger1 = pos X != 0
trigger1 = Time = 0
name = "helper1"
id = 7100
pos = 0,0
postype = p1
stateno = 7100
;helpertype=normal
ownpal = 1
keyctrl = 1

[State 185, Ghost Run 1]
type = Helper
trigger1 = time = 9
helpertype = normal ;player
name = "Ghost Run 1"
ID = 184
stateno = 187
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
facing = -1

[State 185, Ghost Run 1]
type = Helper
trigger1 = time = 14
helpertype = normal ;player
name = "Ghost Run 1"
ID = 184
stateno = 187
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
facing = -1

[State 185, Ghost Run 1]
type = Helper
trigger1 = time = 19
helpertype = normal ;player
name = "Ghost Run 1"
ID = 184
stateno = 187
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0


[State 185, Ghost Run 2]
type = Helper
trigger1 = time = 9
helpertype = normal ;player
name = "Ghost Run 2"
ID = 184
stateno = 186
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 0

[State 185, Ghost Run 2]
type = Helper
trigger1 = time = 14
helpertype = normal ;player
name = "Ghost Run 2"
ID = 184
stateno = 186
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 0


[State 185, Ghost Run 2]
type = Helper
trigger1 = time = 19
helpertype = normal ;player
name = "Ghost Run 2"
ID = 184
stateno = 186
pos = 0,0
postype =p1    ;p2,front,back,left,right
facing = -1
keyctrl = 0
ownpal = 0



[State 185, Ghost Jump]
type = Helper
trigger1 = time = 9
helpertype = normal ;player
name = "Ghost Jump"
ID = 184
stateno = 188
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0

[State 185, Ghost Jump]
type = Helper
trigger1 = time = 14
helpertype = normal ;player
name = "Ghost Jump"
ID = 184
stateno = 188
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0


[State 185, Ghost Jump]
type = Helper
trigger1 = time = 19
helpertype = normal ;player
name = "Ghost Jump"
ID = 184
stateno = 188
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0



[State 185, EnvShake]
type = EnvShake
trigger1 = animelem = 3
time = 15
freq = 30
ampl = -2
phase = 10


[State 185, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1
;---------------------------------------------------------------------------
; Ghost Run 2
; CNS difficulty: easy
[Statedef 186]
type = S
ctrl = 0
anim = 186
velset = 14,0

[State 186, Dash]
type = PlaySnd
trigger1 = animelem = 1
value = 100,0

[State 186, Dash]
type = PlaySnd
trigger1 = animelem = 5
value = 100,1

[State 186, DestroySelf]
type = Destroyself
trigger1 = time = 22

;---------------------------------------------------------------------------
; Ghost Run 1
; CNS difficulty: easy
[Statedef 187]
type = S
ctrl = 0
anim = 186
velset = 14,0

[State 186, Dash]
type = PlaySnd
trigger1 = animelem = 1
value = 100,0

[State 186, Dash]
type = PlaySnd
trigger1 = animelem = 5
value = 100,1

[State 186, DestroySelf]
type = Destroyself
trigger1 = time = 22

;---------------------------------------------------------------------------
; Ghost Jump
; CNS difficulty: easy
[Statedef 188]
type = S
ctrl = 0
anim = 186
velset = 0,-16

[State 186, Dash]
type = PlaySnd
trigger1 = animelem = 1
value = 7000,0

[State 188, DestroySelf]
type = Destroyself
trigger1 = time = 22

;---------------------------------------------------------------------------
; Female Helper
; CNS difficulty: easy
[Statedef 189]
type = S
ctrl = 0
anim = 189
velset = 0,0

[State 192, wind]
type = PlaySnd
trigger1 = animelem = 1
trigger2 = animelem = 15
value = 1000,1

[State 192, DestroySelf]
type = Destroyself
trigger1 = time = 678

;---------------------------------------------------------------------------
; INTRO
[Statedef 190]
type = S
ctrl = 0
anim = 190
velset = 0,0


[State 191, voice]
type = PlaySnd
Triggerall = enemy,name = "Nool"
trigger1 = animelem = 2
value = S191,1

[State 191, voice]
type = PlaySnd
Triggerall = enemy,name != "Nool"
trigger1 = animelem = 5
value = S195,0


[State 191, HatSnd]
type = PlaySnd
trigger1 = animelem = 18
value = 1,0

[State 190, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = 2,15
channel = 0
persistent = 1

[State 190, PlaySnd]
type = PlaySnd
trigger1 = animelem = 18
value = 1,5
channel = 2

[State 190, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = 190

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; INTRO
[Statedef 191]
type = S
ctrl = 0
anim = 191
velset = 0,0

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 11
value = S190,0
channel = 3

[State 190, 1]
type = ChangeAnim
trigger1 = RoundState = 0
value = 191

[State 190, 2]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
;---------------------------------------------------------------------------
; Introduction 2
[Statedef 192]
type = S
ctrl = 0
anim = 192
velset = 0,0

[State 192, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 192

[State 192, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro


[State 192, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Female Helper"
ID = 192
stateno = 193
pos = -60,0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 0
size.xscale = 1
size.yscale = 1



[State 192, 3] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Female Helper
[Statedef 193]
type = S
ctrl = 0
anim = 193
velset = 0,0

[State 192, wind]
type = PlaySnd
trigger1 = animelem = 2
value = 1000,1

[State 192, DestroySelf]
type = Destroyself
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Introduction 5
[Statedef 194]
type = S
ctrl = 0
anim = 194
velset = 0,0

[State 194, SprPriority]
type = SprPriority
trigger1 = animelem = 1
value = 1

[State 194, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0
value = 194

[State 194, SprPriority]
type = SprPriority
trigger1 = animelemtime(20)>= 0 && animelemtime(34)<0
value = -6

[State 194, SprPriority]
type = SprPriority
trigger1 = animelem = 34
value = 1

[State 194, 2] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro


[State 194, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = 11,0

[State 194, PlaySnd]
type = PlaySnd
trigger1 = animelem = 36
value = 194, 1

[State 194, PlaySnd]
type = PlaySnd
trigger1 = animelem = 66
value = 190, 0


[State 194, Helper Geyser 1]
type = Helper
trigger1 = time = 40
helpertype = normal
name = "Geyser1"
ID = 198
stateno = 198
pos = 10,10
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 194, Helper Geyser 2]
type = Helper
trigger1 = time = 70
helpertype = normal
name = "Geyser2"
ID = 198
stateno = 198
pos = 70,10
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 194, Helper Geyser 3]
type = Helper
trigger1 = time = 70
helpertype = normal
name = "Geyser3"
ID = 198
stateno = 198
pos = -50,10
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 194, ChangeStat] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 199

;-------------------------------------------------------------------------------
;Enryusho Geyser Intro
[Statedef 198]
type  = S
movetype = A
physics = N
ctrl = 0
anim = 1110
juggle = 15
velset = 0,0
sprpriority = 3


[State 198, PlaySnd]
type = PlaySnd
trigger1 = animelem = 3
value = 3100,1
channel = 1

[State 198, EnvShake]
type = EnvShake
trigger1 = AnimElem = 4
time = 30
ampl = 10

[State 198, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 198, PosSet]
type = PosSet
trigger1 = 1
y = 0


[State 198, Explod]
type = Explod
trigger1 = time = 0
anim = 1115
ID = 1115
pos = 0,0
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
scale = 1,1
sprpriority = 1


[State 198, ChangeState]
type = ChangeState
trigger1 = time >= 65
value = 1111

;-----------------------------------------------
[Statedef 199]; Move around before match
type = S
physics =S
sprpriority = 0

[State 0]
type = varset
trigger1 = time = 1
var(50) = 0

[State 0]
type = posset
trigger1 = 1
y = 0

[State 0]
type = VelSet
trigger1 = Time = 0
y = 0

[State 20, 1]
type = VelSet
trigger1 = command = "holdfwd"
x = 2.4

[State 20, 2]
type = VelSet
trigger1 = command = "holdback"
x = -2.0

[State 2]
type = ChangeAnim
trigger1 = command = "holdfwd"
trigger1 = Anim != 20
value = 20

[State 2]
type = ChangeAnim
trigger1 = command = "holdback"
trigger1 = Anim != 21
value = 21

[State 2]
type = ChangeAnim
trigger1 = command != "holdback"
trigger1 = command != "holdfwd"
trigger1 = Anim != 0
value = 0

[State 20, 2]
type = VelSet
trigger1 = command != "holdback"
trigger1 = command != "holdfwd"
x = 0

[State var]
type = VarSet
trigger1 = roundstate != 2
var(9) = floor(pos x)

[State F]
type = posset
trigger1 = roundstate = 2
trigger1 = var(9) != 0
x = var(9)

[State F]
type = varset
trigger1 = roundstate = 2
var(9) = 0

[State F]
type = changestate
trigger1 = ctrl
value = ifelse((command = "holdfwd") || (command ="holdback"),20,0)

;---------------------------------------------------------------------------
; Taunt
; CNS difficulty: easy
[Statedef 195]
type = S
movetype = I
physics = S
ctrl = 0
anim = 195
velset = 0,0
poweradd = 80
sprpriority = 2


[State 195, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S80,151

[State 195, PlaySnd]
type = PlaySnd
trigger1 = animelem = 12
value = S80,11


[State 195, 2]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITG_SHAKE
[Statedef 5000]
type    = S
movetype= H
physics = N
velset = 0,0

[State 5000, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5000, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5000, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5000, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5000, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
trigger1 = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5000, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5001 ;HITG_SLIDE

[State 5000, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5000, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5000, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5000, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITG_SLIDE
[Statedef 5001]
type    = S
movetype= H
physics = S

[State 0, PlaySnd]
type = PlaySnd
Triggerall = random >500
trigger1 = Time = 0 && Life >= 1
value = 700,0


[State 5001, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5001, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5005 + GetHitVar(animtype) + (GetHitVar(groundtype)=2)*10

[State 5001, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5001, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5001, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5001, 6]
type = ChangeState
trigger1 = HitOver
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HITC_SHAKE
[Statedef 5010]
type    = C
movetype= H
physics = N
velset = 0,0

[State 5010, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = 5020 + GetHitVar(animtype)

[State 5010, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5010, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5010, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5010, 5] ;State type gets set to aerial if getting hit up
type = StateTypeSet
triggerall = Time = 0
trigger1 = GetHitVar(yvel) != 0 || GetHitVar(fall)
trigger2 = Pos Y != 0
statetype = a

[State 5010, 6]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0 && !GetHitVar(fall)
value = 5011 ;HITC_SLIDE

[State 5010, 7]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5010, FFB Light]
type = ForceFeedback
trigger1 = anim = 5020
persistent = 0
time = 6
waveform = square

[State 5010, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5021
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5010, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5022
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITC_SLIDE
[Statedef 5011]
type    = C
movetype= H
physics = C

[State 0, PlaySnd]
type = PlaySnd
Triggerall = random >500
trigger1 = Time = 0 && Life >= 1
value = 700,0


[State 5011, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5011, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
value = 5025 + GetHitVar(animtype)

[State 5011, 3] ;Stop sliding back
type = VelMul
trigger1 = Time >= GetHitVar(slidetime)
x = .6

[State 5011, 4]
type = VelSet
trigger1 = HitOver
x = 0

[State 5011, 5]
type = DefenceMulSet
trigger1 = HitOver
value = 1

[State 5011, 6]
type = ChangeState
trigger1 = HitOver
value = 11
ctrl = 1


;---------------------------------------------------------------------------
; HITA_SHAKE
[Statedef 5020]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5020, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(airtype) = 1),5000,5010) + GetHitVar(animtype)

[State 5020, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = Time = 0
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030

[State 5020, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type

[State 5020, 4] ;Freeze anim
type = ChangeAnim
trigger1 = Time > 0
value = anim

[State 5020, 5]
type = ChangeState
trigger1 = HitShakeOver
value = 5030

[State 5020, FFB Light]
type = ForceFeedback
trigger1 = anim = 5000
trigger2 = anim = 5010
persistent = 0
time = 6
waveform = square

[State 5020, FFB Medium]
type = ForceFeedback
trigger1 = anim = 5001
trigger2 = anim = 5011
persistent = 0
time = 8
waveform = sinesquare
ampl = 110,-1,-.3

[State 5020, FFB Hard]
type = ForceFeedback
trigger1 = anim = 5012
trigger2 = anim = 5002
trigger3 = anim = 5030
trigger4 = anim = [5051,5059]
persistent = 0
time = 15
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HITA_UP (initial going up)
[Statedef 5030]
type    = A
movetype= H
physics = N
ctrl = 0

[State 0, PlaySnd]
type = PlaySnd
Triggerall = random >500
trigger1 = Time = 0 && alive = 0
value = 700,10

[State 5030, GMA]
type = Explod
triggerall = vel x != 0
triggerall = backedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = -20,-75
postype = p1
bindtime = 1
ownpal = 1
scale = 0.5,0.5

[State 5030, GMA]
type = Explod
triggerall = vel x != 0
triggerall = frontedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = 20,-75
sprpriority = 2
facing = -1
bindtime = 1
ownpal = 1
scale = 0.5,0.5


[State 5030, 1]
type = VelAdd;Gravity
trigger1 = 1
y = GetHitVar(yaccel)

[State 5030, 2]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5030, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5040 ;HITA_RECOV

[State 5030, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver
trigger2 = Vel Y > 0    ;Hit ground
trigger2 = Pos Y >= 10  ;.
value = 5050 ;HITA_FALL

[State 5030, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 5035 ;HITA_UP (transition)

;---------------------------------------------------------------------------
; HITA_UP_T (transition)
[Statedef 5035]
type    = A
movetype= H
physics = N

[State 0, PlaySnd]
type = PlaySnd
Triggerall = random >500
trigger1 = Time = 0 && Life >= 1
value = 700,0

[State 5035, GMA]
type = Explod
triggerall = vel x != 0
triggerall = backedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = -20,-75
postype = p1
bindtime = 1
ownpal = 1
scale = 0.5,0.5

[State 5035, GMA]
type = Explod
triggerall = vel x != 0
triggerall = frontedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = 20,-75
sprpriority = 2
facing = -1
bindtime = 1
ownpal = 1
scale = 0.5,0.5

[State 5035, 1]
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5035)
trigger1 = Anim != [5051,5059] ;Not if in hit up anim
trigger1 = Anim != 5090 ;Not if hit off ground anim
value = 5035

[State 5035, 2]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5035, 3]
type = ChangeState
triggerall = !HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Animation over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5040 ;HITA_RECOV

[State 5035, 4]
type = ChangeState
triggerall = HitFall
trigger1 = HitOver  ;Hit is over
trigger2 = AnimTime = 0 ;Anim is over
trigger3 = Vel Y > 0    ;Hit ground
trigger3 = Pos Y >= 10  ;.
trigger4 = Time = 0     ;No transition anim
trigger4 = Anim != 5035 ;.
value = 5050 ;HITA_FALL

;---------------------------------------------------------------------------
; HITA_RECOV (recovering in air, not falling)
[Statedef 5040]
type    = A
movetype= H
physics = N

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 5,0


[State 5040, 1]
type = ChangeState
trigger1 = !Alive
value = 5050

[State 5040, 2]
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim != 5040
trigger2 = Time = 0
trigger2 = Anim != 5035
value = 5040

[State 5040, 3]
type = CtrlSet
trigger1 = HitOver
value = 1

[State 5040, 4]
type = StateTypeSet
trigger1 = HitOver
movetype = I

[State 5040, 5]
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5040, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 52 ;JUMPLAND

;---------------------------------------------------------------------------
; HITA_FALL (knocked up, falling)
[Statedef 5050]
type    = A
movetype= H
physics = N

[State 5050, 1] ;Change anim when done with transition
type = ChangeAnim
trigger1 = AnimTime = 0
trigger1 = Anim = 5035
trigger2 = Time = 0     ;If no transition anim
trigger2 = Anim != 5035
trigger2 = (Anim != [5051, 5059]) && (Anim != [5061, 5069])
trigger2 = Anim != 5090 ;Not if hit off ground anim
value = 5050

[State 5050, 2] ;Coming down anim
type = ChangeAnim
trigger1 = anim = [5050,5059]
trigger1 = Vel Y >= ifelse(anim = 5050, 1, -2)
trigger1 = SelfAnimExist(anim+10)
value = anim+10
persistent = 0

[State 5050, GMA]
type = Explod
triggerall = vel x != 0
triggerall = backedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = -20,-75
postype = p1
bindtime = 1
ownpal = 1
scale = 0.5,0.5

[State 5050, GMA]
type = Explod
triggerall = vel x != 0
triggerall = frontedgebodydist <= 5
trigger1 = numexplod(72) <= 0
persistent = 0
ignorehitpause = 1
id = 72
anim = 6777
pos = 20,-75
sprpriority = 2
facing = -1
bindtime = 1
ownpal = 1
scale = 0.5,0.5

[State 5050, 3] ;Gravity
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5050, 4] ;Recover near ground
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 5050, 5]; Recover in mid air
type = ChangeState
triggerall = Vel Y > -1
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIRRECOVER

[State 5050, 6]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= ifelse((anim = [5051,5059]) || (anim = [5061,5069]), 0, 25)
value = 5100 ;HIT_BOUNCE

;---------------------------------------------------------------------------
; HIT_TRIP (shaking)
[Statedef 5070]
type    = A
movetype= H
physics = N
velset = 0,0

[State 5070, 1]
type = ChangeAnim
trigger1 = 1
value = 5070

[State 5070, 2]
type = ChangeState
trigger1 = HitShakeOver
value = 5071

[State 5070, 3]
type = ForceFeedback
trigger1 = time = 0
time = 12
waveform = sinesquare
ampl = 140

;---------------------------------------------------------------------------
; HIT_TRIP2 (fall through air)
[Statedef 5071]
type    = A
movetype= H
physics = N


[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 5 && alive = 0
value = 700,10

[State 5071, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1
y = 1

[State 5071, 2] ;Acceleration
type = VelAdd
trigger1 = 1
y = GetHitVar(yaccel)

[State 5071, 3] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 15
type = ChangeState
value = 5110

;---------------------------------------------------------------------------
; HITL_SHAKE
[Statedef 5080]
type    = L
movetype= H
physics = N
velset = 0,0

[State 5080, 1] ;Set default anim
type = VarSet
trigger1 = time = 0
sysvar(2) = ifelse (GetHitVar(yvel) = 0, 5080, 5090)

[State 5080, 2]
type = VarAdd
trigger1 = time = 0
trigger1 = (anim = [5081,5089]) || (anim = [5111,5119])
trigger1 = SelfAnimExist(sysvar(2) + (anim % 10))
sysvar(2) = anim % 10

[State 5080, 3] ;If 5090 doesn't exist, default to 5030
type = VarSet
trigger1 = time = 0
trigger1 = sysvar(2) = 5090
trigger1 = !SelfAnimExist(5090)
sysvar(2) = 5030

[State 5080, 3] ;Freeze
type = ChangeAnim
trigger1 = 1
value = sysvar(2)

[State 5080, 4]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) = 0
value = 5081 ;HITL_SLIDE

[State 5080, 5]
type = ChangeState
trigger1 = HitShakeOver
trigger1 = GetHitVar(yvel) != 0
value = 5030 ;HITA_UP

;---------------------------------------------------------------------------
; HITL_SLIDE
[Statedef 5081]
type    = L
movetype= H
physics = C

[State 5110, 1]
type = PlaySnd
trigger1 = Time = 5
value = 700, 2


[State 5081, 1]
type = HitVelSet
trigger1 = Time = 0
x = 1

[State 5081, 2]
type = VelSet
trigger1 = HitOver
x = 0

[State 5081, 3] ;Don't show hit ground frame
type = VarSet
trigger1 = Time = 0
sysvar(0) = 1

[State 5081, 4]
type = ChangeState
trigger1 = HitOver
value = 5110 ;HIT_LIEDOWN

;---------------------------------------------------------------------------
; HIT_BOUNCE (hit ground)
[Statedef 5100]
type    = L
movetype= H
physics = N

[State 5100, 1]
type = VelSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
trigger1 = vel x > 1
x = 1


[State 5100, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5100, Var] ;Save fall velocity
type = VarSet
trigger1 = Time = 0
sysvar(1) = floor(vel y)

[State 5100, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = (anim != [5051,5059]) && (anim != [5061,5069])
trigger2 = !SelfAnimExist(5100 + (anim % 10))
value = 5100

[State 5100, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
trigger1 = time = 0
trigger1 = (anim = [5051,5059]) || (anim = [5061,5069])
trigger1 = SelfAnimExist(5100 + (anim % 10))
value = 5100 + (anim % 10)

[State 5100, 4]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5100, 5]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5100, 6] ;Reduce speed
type = VelMul
trigger1 = Time = 0
x = 0.75

[State 5100, 7]
type = ChangeState
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) = 0
value = 5110 ;HIT_LIEDOWN

[State 5100, 8]
type = GameMakeAnim
trigger1 = Time = 1
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5100, 9]
type = HitFallDamage
trigger1 = Time = 3

[State 5100, 10]
type = PlaySnd
trigger1 = Time = 1
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5100, 11]
type = PosFreeze
trigger1 = 1

[State 5100, 12]
type = ChangeState
trigger1 = AnimTime = 0
value = 5101

[State 5100, 13]
type = ForceFeedback
trigger1 = Time = 0
waveform = sinesquare
ampl = 128,-3,-.2,.005
time = 20

;---------------------------------------------------------------------------
; HIT_BOUNCE (bounce into air)
[Statedef 5101]
type    = L
movetype= H
physics = N




[State 5101, 1] ;Coming hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5101,5109]
trigger2 = !SelfAnimExist(5160 + (anim % 10))
value = 5160

[State 5101, 2] ;Coming hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5101,5109]
trigger1 = SelfAnimExist(5160 + (anim % 10))
value = 5160 + (anim % 10)

[State 5101, 3]
type = HitFallVel
trigger1 = Time = 0

[State 5101, 4]
type = PosSet
trigger1 = Time = 0
y = 20

[State 5101, 5] ;Acceleration
type = VelAdd
trigger1 = 1
y = .4

[State 5101, 6] ;Hit ground
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 12
type = ChangeState
value = 5110

;---------------------------------------------------------------------------
; HIT_LIEDOWN
[Statedef 5110]
type    = L
movetype= H
physics = N

[State 5110, 1]
type = PlaySnd
trigger1 = Time = 5
value = 700, 2


[State 5110, EnvShake]
type = FallEnvShake
trigger1 = Time = 0

[State 5110, 1] ;For hit up/up-diag type (from state 5081)
type = ChangeAnim
persistent = 0
trigger1 = SelfAnimExist(5110 + (anim % 10))
trigger1 = anim = [5081,5089]
value = 5110 + (anim % 10)

[State 5110, 2] ;Hit ground anim (normal)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim != [5161,5169]
trigger2 = !SelfAnimExist(5170 + (anim % 10))
value = 5170

[State 5110, 3] ;Hit ground anim (for hit up)
type = ChangeAnim
triggerall = time = 0
triggerall = anim != [5110,5119] ;Not already changed anim
trigger1 = anim = [5161,5169]
trigger1 = SelfAnimExist(5170 + (anim % 10))
value = 5170 + (anim % 10)

[State 5110, 4]
type = HitFallDamage
trigger1 = Time = 0

[State 5110, 5]
type = PosSet
trigger1 = Time = 0
y = 0

[State 5110, Var] ;Get fall velocity
type = VarSet
trigger1 = Time = 0
trigger1 = GetHitVar(fall.yvel) != 0
sysvar(1) = floor(vel y)

[State 5110, 6]
type = PlaySnd
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = F7, (sysvar(1) > 5) + (sysvar(1) > 14)

[State 5110, 7]
type = GameMakeAnim
trigger1 = Time = 0
trigger1 = !SysVar(0)
value = 60 + (sysvar(1) > 5) + (sysvar(1) > 14)
pos = 0, 0
under = sysvar(1) <= 14

[State 5110, 8]
type = VelSet
trigger1 = Time = 0
y = 0

[State 5110, 9] ;For hit up type
type = ChangeAnim
persistent = 0
triggerall = anim = [5171,5179]
triggerall = SelfAnimExist(5110 + (anim % 10))
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground anim
value = 5110 + (anim % 10)

[State 5110, 10] ;For normal
type = ChangeAnim
persistent = 0
triggerall = Anim != [5111,5119]
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
value = 5110

[State 5110, 11] ;If just died
type = ChangeState
triggerall = !alive
trigger1 = AnimTime = 0
trigger2 = SysVar(0) ;SysVar(0) = 1 avoids hit ground frame
trigger3 = Anim = [5110,5119]
value = 5150

[State 5110, 12]
type = VarSet
trigger1 = SysVar(0)
trigger1 = Time = 0
sysvar(0) = 0

[State 5110, 13] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5110, 14]
type = ForceFeedback
trigger1 = alive
trigger1 = Time = 0
time = 8
ampl = 240
waveform = sine

[State 5110, 15]
type = ForceFeedback
trigger1 = !alive
trigger1 = Time = 0
ampl = 200, 7, -.467
time = 30
waveform = sine

;---------------------------------------------------------------------------
; HIT_GETUP
[Statedef 5120]
type    = L
movetype= I
physics = N
ctrl = 0

[State 5120, 1a] ;Get up anim (normal)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim != [5111,5119]
trigger2 = !SelfAnimExist(5120 + (anim % 10))
value = 5120

[State 5120, 1b] ;Get up anim (for hit up/diag-up)
type = ChangeAnim
triggerall = time = 0
trigger1 = anim = [5111,5119]
trigger1 = SelfAnimExist(5120 + (anim % 10))
value = 5120 + (anim % 10)

[State 5120, 2]
type = VelSet
trigger1 = Time = 2
x = 0

[State 5120, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 5120, 4]
type = HitFallSet
trigger1 = AnimTime = 0
value = 1

[State 5120, 5] ;Can't be thrown right after getting up
type = NotHitBy
trigger1 = AnimTime = 0
value = SCA, NT,ST,HT
time = 2

;[State 5120, 6] ;Can't be hit right after getting up (short time)
;type = NotHitBy
;trigger1 = AnimTime = 0
;value2 = SCA
;time = 4

[State 5120, 4] ;Turn & face opponent
type = Turn
trigger1 = p2dist X < -4
trigger1 = Time = 0


[State 5120, 7]
type = ChangeState
trigger1 = Animtime = 0;Vel Y > 0 && Pos Y >= -1;AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; HIT_LIEDEAD
[Statedef 5150]
type    = L
movetype= H
physics = N
sprpriority = -3

[State 0, PlaySnd]
type = PlaySnd
trigger1 = Time = 5 && Life >= 1
value = 700,2


[State 5150, 1] ;Normal anim
type = ChangeAnim
triggerall = Time = 0
triggerall = SelfAnimExist(5140)
trigger1 = (anim != [5111,5119]) && (anim != [5171,5179])
trigger2 = !SelfAnimExist(5140 + (anim % 10))
value = 5140

[State 5150, 3] ;Hit up type anim
type = ChangeAnim
trigger1 = Time = 0
trigger1 = (anim = [5111,5119]) || (anim = [5171,5179])
trigger1 = SelfAnimExist(5140 + (anim % 10))
value = 5140 + (anim % 10)

[State 5150, 4] ;Match over anim
type = ChangeAnim
persistent = 0
;trigger1 = Time = 0
trigger1 = MatchOver = 1
trigger1 = Anim = [5140,5149]
trigger1 = SelfAnimExist(anim+10)
value = anim+10

[State 5150, 5] ;Switch to 5110 if liedead anim does not exist
type = ChangeAnim
trigger1 = Time = 0
trigger1 = Anim != [5140,5159]
trigger1 = Anim != [5110,5119]
value = 5110

[State 5150, 6] ;Friction
type = VelMul
trigger1 = 1
x = 0.85

[State 5150, 7] ;Friction
type = VelSet
trigger1 = Vel x < .05
persistent = 0
x = 0

[State 5150, 8]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

;---------------------------------------------------------------------------
; HIT_FALLRECOVER (on the ground)
[Statedef 5200]
type = A
movetype = H
physics = N

[State 5200, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050

[State 5200, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5200, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 10
value = 5201

;---------------------------------------------------------------------------
[Statedef 5201]
type = S
movetype = I
physics = N
anim = 5200
ctrl = 0
facep2 = 1

[State 5201, Pos]
type = posset
trigger1 = 1
y = 0

[State 5201, VelSet]
type = VelSet
trigger1 = Time = 0
x = -6

[State 5201, VelMul]
type = VelMul
trigger1 = 1
x = 0.9

[State 5201, VelSet]
type = VelSet
trigger1 = vel X > -0.1
x = 0

[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 4,4
channel = 0

[State 5201, Snd]
type = playsnd
trigger1 = !time
value = 5200,0
channel = 1

[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5201, FX]
type = helper
trigger1 = !time
;helpertype = normal
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

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

;---------------------------------------------------------------------------
; HIT_FALLRECOVER (on the ground)
;--- AIR ---
[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0
facep2 = 1

[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 820,0
channel = 0

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 5200,0
channel = 1

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, FX]
type = helper
trigger1 = !time
stateno = 8200
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-66 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1

[State 5210, NHB]
type = nothitby
trigger1 = AnimElemTime(5) < 0
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = AnimElemTime(5) < 0
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52


;---------------------------------------------------------------------------
;==========< TARGET SAFE FALL >==========
[Statedef 5205]
type = A
physics = N
movetype = H

[State 5205, Anim]
type = changeanim
trigger1 = !animtime
trigger1 = anim = 5035
value = 5050

[State 5205, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5205, Ground]
type = selfstate
trigger1 = vel y > 0
trigger1 = pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 5205, Air]
type = selfstate
trigger1 = time >= 60
value = 5210
;---------------------------------------------------------------------------
; Continue?
[Statedef 5500]
type = S
ctrl = 0
anim = 5300
velset = 0,0

[State 5500, ChangeAnim] ;Use continue animation if available
type = ChangeAnim
trigger1 = time = 0
trigger1 = SelfAnimExist(5500)
value = 5500

;---------------------------------------------------------------------------
; Frozen (Standing)
[Statedef 5706]
type  = U
movetype = H
physics = U
ctrl = 0
sprpriority = 0

[State AntiHelper]
type = DestroySelf
trigger1 = ishelper


[State Safety]
type = SelfState
trigger1 = gethitvar(guarded)
value = ifelse((prevstateno = [5706, 5707]), 150 + 2*(statetype = C) + 4*(statetype = A), prevstateno)

[State 5706, ChangeState]
type = ChangeState
triggerall = !gethitvar(guarded)
trigger1 = statetype = A
trigger2 = pos y < 0
trigger3 = !alive
trigger4 = gethitvar(fall)
value = 5707


[State 5706, StateTypeSet]
type = StateTypeSet
trigger1 = !time
statetype = S
movetype = H
physics = S

[State 5706, PosFreeze]
type = PosFreeze
trigger1 = 1
ignorehitpause = 1

[State 5706, 6]
type = SelfState
trigger1 = hitshakeover
value = 5001
ctrl = 0
ignorehitpause = 1

[State 5706, 1] ;Anim for HIT_LIGHT to HIT_HARD
type = ChangeAnim
trigger1 = GetHitVar(animtype) != [3,5]
value = ifelse((GetHitVar(groundtype) = 1),5000,5010) + GetHitVar(animtype)
elem = ifelse( time && animelemno(0) > 1 && animelem = 1, < 3 && ((anim = [5000, 5002]) || (anim = [5010, 5012])), 2, 1)
ignorehitpause = 1

[State 5706, 2] ;Anim for HIT_BACK
type = ChangeAnim
trigger1 = GetHitVar(animtype) = [3,5]
value = 5030
ignorehitpause = 1

[State 5706, 3] ;Anim for HIT_UP/HIT_DIAGUP (only if it exists)
type = ChangeAnim
trigger1 = (GetHitVar(animtype) = [4,5]) && (SelfAnimExist(5047 + GetHitVar(animtype)))
value = 5047 + GetHitVar(animtype) ;5051 - 4 + type
ignorehitpause = 1


[State 5706, 0]
type = PalFX
trigger1 = gametime%30 < 15
color = 0
invertall = 1
mul = 64 + (gametime%30)*2, 96 + (gametime%30)*2, 128 + (gametime%30)*4
add = 384, 384, 384
time = 1
ignorehitpause = 1

[State 5706, 0]
type = PalFX
trigger1 = gametime%30 > 14
color = 0
invertall = 1
mul = 64 + (30 - (gametime%30))*2, 96 + (30 - (gametime%30))*2, 128 + (30 - (gametime%30))*4
add = 384, 384, 384
time = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
; Frozen

[Statedef 5707]
type    = A
movetype= H
physics = N
ctrl = 0
sprpriority = 0

[State AntiHelper]
type = DestroySelf
trigger1 = ishelper

[State Safety]
type = SelfState
trigger1 = gethitvar(guarded)
value = ifelse((prevstateno = [5706, 5707]), 150 + 2*(statetype = C) + 4*(statetype = A), prevstateno)

[State 5707, 0]
type = PosFreeze
trigger1 = !hitshakeover
ignorehitpause = 1

[State 5707, 1]
type = VelAdd;Gravity
trigger1 = hitshakeover
y = GetHitVar(yaccel)
ignorehitpause = 1

[State 5707, 2]
type = HitVelSet
trigger1 = !time
x = 1
y = 1
ignorehitpause = 1


[State 5707, 3]
type = SelfState
triggerall = hitshakeover
triggerall = !HitFall
trigger1 = Vel Y > 0    ;Hit ground
trigger1 = Pos Y >= 10  ;.
value = 5040 ;HITA_RECOV
ignorehitpause = 1

[State 5707, 4]
type = SelfState
triggerall = hitshakeover
triggerall = HitFall
trigger1 = Vel Y > 0    ;Hit ground
trigger1 = Pos Y >= 10  ;.
value = 5050 ;HITA_FALL
ignorehitpause = 1

[State 5707, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = 5012
ignorehitpause = 1

[State 0, LifeAdd]
type = LifeAdd
triggerall = (name !="Ghost Rider")
triggerall = (name !="Pyron")
triggerall = (name !="Enja")
triggerall = (name !="Kasuki")
triggerall = (name !="Blackheart")
triggerall = (name !="Sasquatch")
triggerall = (name !="Nool")
triggerall = (name !="Iceman")
triggerall = (name !="Ice Man")
triggerall = (name !="Gill")
triggerall = (name !="Suija")
triggerall = (name !="Sogetsu")
triggerall = (name !="Kula")
trigger1 = gametime%10 < 1
value = -4
kill = 1
absolute = 1

[State 0, LifeAdd]
type = LifeAdd
triggerall = gametime%10 < 1
trigger1 = (name ="Ghost Rider")
trigger2 = (name ="Pyron")
trigger3 = (name ="Enja")
trigger4 = (name ="Kasuki")
value = -6
kill = 1

[State 0, LifeAdd]
type = LifeAdd
triggerall = gametime%10 < 1
trigger1 = (name ="Blackheart")
trigger2 = (name ="Sasquatch")
trigger3 = (name ="Nool")
value = -2
kill = 1

[State 5707, 0]
type = PalFX
trigger1 = gametime%10 < 15
color = 0
invertall = 1
mul = 64 + (gametime%30)*3, 96 + (gametime%30)*2, 128 + (gametime%30)*4
add = 384, 384, 384
time = 1
ignorehitpause = 1

[State 5707, 0]
type = PalFX
trigger1 = gametime%30 > 14
color = 0
invertall = 1
mul = 64 + (30 - (gametime%30))*3, 96 + (30 - (gametime%30))*2, 128 + (30 - (gametime%30))*4
add = 384, 384, 384
time = 1
ignorehitpause = 1

;---------------------------------------------------------------------------
[StateDef 5901]
type = S

[State 5900, VarRandom]
type = VarRandom
trigger1 = time = 0
v = 37
range = 1,6

[State 5900, 3] ;Change palette
type = NULL;RemapPal
trigger1 = 1
source = 1,1
dest = 1,palno

[State 5900, Intro VS]
type = changestate
trigger1 = numenemy
trigger1 = roundno = 1 || (!(enemy, roundsexisted) && !(teammode = simul) && !(enemy, teammode = simul))
trigger1 = enemy, name = "whoever" || enemy, name = "cvswhoever"
value = 192

[State 5900, Turns Intro]
type = ChangeState
trigger1 = TeamMode = Turns
trigger1 = !RoundsExisted && RoundNo >= 2
value = 6900

[State 5900, Intro Decider]
type = ChangeState
trigger1 = RoundNo = 1
value = ifelse(random<800,190+random%3,194)


[state 5900, x]
type = changestate
trigger1 = roundno != 1
value = 0

[State 5900, 3]
type = ChangeState
trigger1 = roundno = 1
value = 190

;====================< CHEAP K.O. >====================
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

[State 5950, KO Snd]
type = assertspecial
trigger1 = 1
flag = nokosnd

[State 5950, KO Snd]
type = stopsnd
trigger1 = !time && !alive
channel = 0

[State 5950, KO Snd]
type = playsnd
trigger1 = animelem = 2 && !alive
value = 5950,0

[State 5981, Snd]
type = playsnd
trigger1 = animelem = 10
value = f7, 0

[State 5981, FX]
type = explod
trigger1 = animelem = 10
anim = f60
postype = p1
pos = 0, 0
sprpriority = -3

[State 5950, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)
;---------------------------------------------------------------------------------------------
;Beginning of the super jump
[Statedef 7000]
type = S
physics = S
anim = 40
ctrl = 0
sprpriority = 1


[State 7000, VarSet]
type = VarSet
trigger1 = Time = 0
v = 11
value = 0

[State 7000, VarSet]
type = VarSet
trigger1 = !AILevel
trigger1 = command = "holdfwd"
trigger2 = AILevel
trigger2 = enemy,vel y < 0 
trigger2 = p2bodydist x = [0,150]
trigger2 = random <= 500 && p2movetype != A
trigger3 = AILevel
trigger3 = p2bodydist x = [0,150]
trigger3 = random <= 100
v = 11
value = 1

[State 7000, VarSet]
type = VarSet
trigger1 = !AILevel
trigger1 = command = "holdback"
trigger2 = AILevel
trigger2 = random <= 50
v = 11
value = -1


[State 7000, Landing FX 1]
type = Explod
trigger1 = time = 1
anim = 8560
ID = 8560
pos = 0,5
postype = p1  ;p2,front,back,left,right
removetime = -2
scale = .7,.7
sprpriority = -3
ownpal = 1
removeongethit = 1
ignorehitpause = 1
pausemovetime = 999999
supermovetime = 999999

[State 7000, Landing FX 2]
type = Explod
trigger1 = time = 1
anim = 8553
ID = 8553
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

[State 7000, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 7001
ctrl = 1

;---------------------------------------------------------------------------------------------
;Super Jump
[Statedef 7001]
type = A
physics = A
ctrl = 1
anim = 48
velset = 0,-15.2

[State 0, Yell]
type = PlaySnd
trigger1 = time = 3
value = 4, 3

[State 0, Jump]
type = PlaySnd
trigger1 = time = 1
value = 7000, 0


[State 7001, VelAdd]
type = VelAdd
triggerall = Vel X >= -2.5
trigger1 = !AILevel
trigger1 = command = "holdback"
trigger1 = Anim != 43
trigger2 = AILevel
trigger2 = Anim != 42
trigger2 = Random < (ifelse((enemynear,Movetype = A),200,100) * (AILevel ** 2 / 64.0))
x = -0.4

[State 7001, VelAdd]
type = VelAdd
triggerall = Vel X <= 3
trigger1 = !AILevel
trigger1 = command = "holdfwd"
trigger1 = Anim != 42
trigger2 = AILevel;--------------AI
trigger2 = Anim != 42
trigger2 = enemy,vel y < 0 
trigger2 = p2bodydist x = [0,150]
trigger2 = random <= 500 && p2movetype != A
trigger3 = AILevel
trigger3 = Anim != 42
trigger3 = p2statetype = A
trigger3 = enemy,vel y < -1 
trigger3 = p2bodydist x = [0,150]
trigger3 = random <= 300
x = 0.5

;[State 7001, VelSet]
;type = VelSet
;trigger1 = Anim = 42
;trigger1 = Time = [0,5]
;x = 4

;[State 7001, VelSet]
;type = VelSet
;trigger1 = Anim = 43
;trigger1 = Time = [0,5]
;x = -3.5

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 0
trigger1 = Time = [0,4]
value = 41  ;41

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 1
trigger1 = Time = [0,4]
value = 41 ; 41

[State 7001, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = -1
trigger1 = Time = [0,4]
value = 41 ; 41

[State 7001, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 9999,5

[State 7001, VelAdd]
type = VelAdd
trigger1 = Vel Y > 0
y= - 0.10  ;0.18

[State 7001, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 23
length = 20 ;45
;palcolor = 256
;palinvertall = 1
palbright = 0,0,0
palcontrast = 256,256,256
timegap = 1
framegap = 5
trans = add1

;---------------------------------------------------------------------------------------------
;Super Jump for Aerial Rave
[Statedef 7002]
type = A
physics = A
ctrl = 1
anim = 48
velset = 0,-14.5


[State 0, Yell]
type = PlaySnd
trigger1 = animelem = 1
value =  5, 0

[State 0, Jump]
type = PlaySnd
trigger1 = animelem = 1
value =  10, 1


[State 7002, VelAdd]
type = VelAdd
triggerall = Vel X >= -2.5
trigger1 = command = "holdback"
trigger1 = Anim != 43
x = -0.3

[State 7002, VelAdd]
type = VelAdd
triggerall = Vel X <= 3
trigger1 = command = "holdfwd"
trigger1 = Anim != 42
;trigger2 = AILevel;--------------AI
;trigger2 = Anim != 42
;trigger2 = p2bodydist x = [0,150]
;trigger2 = enemynear,vel y < 0
x = 0.4


;[State 7001, VelSet]
;type = VelSet
;trigger1 = Anim = 42
;trigger1 = Time = [0,5]
;x = 4

;[State 7001, VelSet]
;type = VelSet
;trigger1 = Anim = 43
;trigger1 = Time = [0,5]
;x = -3.5

[State 7002, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 0
trigger1 = Time = [0,4]
value = 41  ;41

[State 7002, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = 1
trigger1 = Time = [0,4]
value = 41 ; 41

[State 7002, ChangeAnim]
type = ChangeAnim
trigger1 = Var(11) = -1
trigger1 = Time = [0,4]
value = 41 ; 41

[State 7002, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = 9999,5
volume = 255

[State 7002, VelAdd]
type = VelAdd
trigger1 = Vel Y > 0
y= - 0.10  ;0.18

[State 7001, AfterImage]
type = AfterImage
trigger1 = time = 0
time = 23
length = 20 ;45
;palcolor = 256
;palinvertall = 1
palbright = 0,0,0
palcontrast = 256,256,256
timegap = 1
framegap = 5
trans = add1


;============<OFF SCREEN STAND BY>=========
;Stand by
[Statedef 7827]
type=S
movetype=I
physics=N
velset=0,0
ctrl=0
facep2=1

[State 0, ScreenBound]
type=ScreenBound
trigger1 =1
value =0
ignorehitpause =1
[State 7827]
type=PosSet
trigger1=!time
y=0
ignorehitpause=1
[State 7827]
type=ChangeState
trigger1=NumEnemy=[1,2]
trigger1=Enemy(0),statetype=L || Enemy(0),movetype != H
value=7828
[State 7827]
type=ChangeState
trigger1=NumEnemy=2
trigger1=Enemy(1),statetype=L || Enemy(1),movetype != H
value=7828
;============<OFF SCREEN RUN IN>=========
;Off Screen Run In
[Statedef 7828]
type   =S
physics=S
anim=100
ctrl=0
facep2=1

[State 7828, SND]
type=playsnd
trigger1=(animelem=3 || animelem=6)
value=100,0

[State 7828]
type=PosSet
trigger1=!Time
y=0
ignorehitpause=1
[State 7828]
type=VelSet
trigger1=AnimElem=1
x=7
ignorehitpause=1
[State 7828]
type=VelSet
trigger1=AnimElemNo(0)=[1,2]
x=9
ignorehitpause=1
[State 7828]
type=AssertSpecial
trigger1=1
flag=NoWalk
ignorehitpause=1
[State 7828]
type=AssertSpecial
trigger1=1
flag=NoAutoTurn
ignorehitpause=1

[State 7828]
type=ChangeState
trigger1= time>=20
value=7829
ctrl=0
;============<OFF SCREEN RUN STOP>=========
;Off Screen Run Stop
[Statedef 7829]
type   =S
physics=S
anim=101
ctrl=0

[State 7829,VelMul]
type=VelMul
trigger1 =time=2
x=.5
[State 7829,Dust]
type=MakeDust
trigger1=time%6
pos=30, 0

[State 7829, SND]
type=playsnd
trigger1 =!time
value=0, 101
persistent=0
[State 7829,END]
type=ChangeState
trigger1=!animtime
value=0
ctrl=1

;===========================================================================
;===============================< -2 STATES >=================================
;===========================================================================
[Statedef -2]

;#ADD004BASIC PIEs#
;##[a4b_-2_start.v20200523]##
;//==========================
;// add004-sctrls-start
;//==========================
;sys::-2::partners_standby ; ???????
[state 0]
	type=selfstate
	value=190190
	ctrl=0
	;;---
	triggerall=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	triggerall=(stateno!=[190190,190199]) && playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(22)=4
	;;---// switch / change ;(??)
	trigger1=sysfvar(4)<1 && ( ctrl || (time<2 && stateno<600) ) && playerid(floor(sysfvar(0))),var(48)=11
	trigger1=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// assist ;(??)
	trigger2=sysfvar(4)=1 && ( ctrl || (stateno-playerid(floor(sysfvar(0))),var(53+id-playerid(floor(sysfvar(0))),sysvar(0))!=[0,999]) )
	trigger2=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// switch-canceling ;(??????)
	trigger3=sysfvar(4)=2 && ( ctrl || stateno<160 )
	trigger3=(pos y>=0) && movetype!=h && gethitvar(isbound)=0 && (stateno!=5120) && (stateno!=[5200,5210])
	;;---// player-priority ;(??)
	trigger4=sysfvar(4)<1 && playerid(floor(sysfvar(0))),var(15)!=id
	;;---
	ignorehitpause=1

;sys::-2::partners_change_interrupted ; ??????
[state 0]
	type=varset
	trigger1=!ishelper && numpartner && roundstate=2 && alive && sysfvar(0)>0 && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(48)=21 && sysfvar(4)<1
	sysfvar(4)=2 ;; (0:main / 1:assist / 2:switch-canceling)

;sys::-2::helper::bar004 ; ?????
[state 0]
	type=helper
	triggerall=!ishelper && !numhelper(90900)
	trigger1=numpartner
	trigger1=id<(partner,id) && partner,numhelper(90900)=0
	trigger2=!numpartner
	id=90900
	stateno=90900
	helpertype=normal
	ownpal=1
;op;	size.ground.front=###
;op;	size.ground.back=###
	size.air.front=2108130 ;; <<-version
;op;	size.air.back=###
	size.height=0 ;; 1;; <<-powerbar off mode
	ignorehitpause=1
	supermovetime=88888
	pausemovetime=88888
	;---
;op;	size.xscale=0
;op;	size.yscale=0
	;---
	pos=0,88888

;sys::-2::get_helper::bar004_id ; ID??
[state 0]
	type=varset
	trigger1=!ishelper && numhelper(90900)
	trigger1=(helper(90900),var(0)=90900) && (sysfvar(0)!=helper(90900),id)
	sysfvar(0)=(helper(90900),id)

;sys::-2::get_players_id2
[state 0]
	type=varset
	trigger1=!ishelper && numpartner
	trigger1=!numhelper(90900) && (partner,numhelper(90900)) && (sysfvar(0)!=(partner,sysfvar(0)))
	sysfvar(0)=(partner,sysfvar(0))

;sys::-2::bk/jd_system ; ?????/????D
[state 0]
	type=hitoverride
	triggerall=!ishelper && roundstate=2 && alive && (ctrl || stateno=52)
	trigger1=numprojid(195502)||numprojid(195503)
	trigger2=numpartner
	trigger2=partner,numprojid(195502)||partner,numprojid(195503)
	attr=sca,na,sa,ha,np,sp,hp
	stateno=195500
	time=1
	ignorehitpause=1


;//==========================
;//==========================
;;>>@Config.Face>>
;sys::-2::face_d_mod
[state 0]
	type=removeexplod
	trigger1=roundstate!=2 || (stateno=5150 && time=5 && !alive)
	trigger2=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger2=(playerid(floor(sysfvar(0))),var(0)=90900)
	trigger2=!(playerid(floor(sysfvar(0))),var(9)&4) || (playerid(floor(sysfvar(0))),var(9)&262144)
	id=490600
	ignorehitpause=1

;sys::-2::face_d_main ; portrait (?)
[state 0]
	type=explod
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909002)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490600)
	trigger1=id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909002
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(20))), floor(const240p(playerid(floor(sysfvar(0))),fvar(22)))
	scale=playerid(floor(sysfvar(0))),fvar(24), playerid(floor(sysfvar(0))),fvar(26)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(28))/1000, floor(playerid(floor(sysfvar(0))),fvar(28))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::face_d_partner_#+option
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=!ishelper && alive && !numexplod(490600) && selfanimexist(909001)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0))) && roundstate=2
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909001
	space=screen
	postype=left
	facing=ifelse(teamside=1,1,-1)
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(21) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(23) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(25) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(27) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(29))/1000, floor(playerid(floor(sysfvar(0))),fvar(29))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;#Options_Char_Name
;sys::-2::name_d_main_left&right
[state 0]
	type=explod
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && id=playerid(floor(sysfvar(0))),var(15)
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(10))), floor(const240p(playerid(floor(sysfvar(0))),fvar(12)))
	scale=playerid(floor(sysfvar(0))),fvar(14), playerid(floor(sysfvar(0))),fvar(16)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(32))+2
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(18))/1000, floor(playerid(floor(sysfvar(0))),fvar(18))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;;sys::-2::name_d_partner_#left&right
[state 0]
	type=explod
	trigger1=numpartner
	trigger1=numexplod(490600)=1 && selfanimexist(909010+teamside)
	trigger1=(sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),numexplod(490601+(gametime%numpartner))
	trigger1=(id+numpartner+1-playerid(floor(sysfvar(0))),var(15))%(numpartner+1)=(gametime%numpartner)+1
	trigger1=movetype!=h || (stateno=[120,159]) || (stateno=[5000,5199]) || (stateno=[190190,190196])
	id=490600
	anim=909010+teamside
	space=screen
	postype=left
	facing=1
	ownpal=1
	bindtime=-1
	removetime=-1
	pos=floor(const240p(playerid(floor(sysfvar(0))),fvar(11) +playerid(floor(sysfvar(0))),fvar(34)*(gametime%numpartner) )), floor(const240p(playerid(floor(sysfvar(0))),fvar(13) +playerid(floor(sysfvar(0))),fvar(35)*(gametime%numpartner) ))
	scale=playerid(floor(sysfvar(0))),fvar(15) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner), playerid(floor(sysfvar(0))),fvar(17) +playerid(floor(sysfvar(0))),fvar(36)*(gametime%numpartner)
	sprpriority=floor(playerid(floor(sysfvar(0))),fvar(33))+(gametime%numpartner)*10+3
	trans=addalpha
	alpha=floor(playerid(floor(sysfvar(0))),fvar(19))/1000, floor(playerid(floor(sysfvar(0))),fvar(19))%1000
	ignorehitpause=1
	supermovetime=-1
	pausemovetime=-1

;//==========================
;;>>@Config.Camera>>
;sys::-2::camera_nc ; ????
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	movecamera=0,0
	ignorehitpause=1
;sys::-2::camera_np
[state 0]
	type=playerpush
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && numpartner && (sysfvar(4)>0 || stateno=5150)
	value=0
	ignorehitpause=1
;sys::-2::camera_nc2
[state 0]
	type=screenbound
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && (playerid(floor(sysfvar(0))),var(7)&65536) ;; system_switch
	value= ((numpartner && sysfvar(4)<1) || !numpartner) ;; [def=0]
	movecamera=0,0 ;; [x,y]
	ignorehitpause=1

;//==========================
;sys::-2::add.option2-noko
[state 0] ;; opt-noko
	type=assertspecial
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && (playerid(floor(sysfvar(0))),var(9)&65536) ;; opt-noko
	flag=noko
	ignorehitpause=1
;sys::-2::add.option3-life-mod
[state 0] ;; opt-life-mod
	type=lifeadd
	trigger1=!ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900
	trigger1=id=playerid(floor(sysfvar(0))),var(15) && playerid(floor(sysfvar(0))),var(23)!=0 ;; opt-mod-life
	value=playerid(floor(sysfvar(0))),var(23)
	kill=0
	ignorehitpause=1

;//==========================
;// optional settings
;sys::-2::guard_crush_fx ; ????????
[state 0]
	type=palfx
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (gametime%5=0) && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=800
	time=2
	add=200,0,0
;sys::-2::guard_crush_cs
[state 0]
	type=changestate
	trigger1=(stateno=150 || stateno=152) && alive && !ishelper && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(36)>=1000
	value=190010
	ignorehitpause=1
;;--- dizzy
;sys::-2::goto-dizzy_s/c
[state 0] ;[.03-2d1]
	type=selfstate
	trigger1=(stateno=5001 || stateno=5011) && hitover      && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195201;; (goto-dizzy:190116)
;sys::-2::goto-dizzy_a/l
[state 0] ;[.03-2d2]
	type=selfstate
	trigger1=(stateno=5030 || stateno=5071) && hitshakeover && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195050
;sys::-2::goto-dizzy_fd
[state 0] ;[.03-2e1]
	type=selfstate
	trigger1=(stateno=[5110,5111]) && alive && !ishelper && roundstate=2 && (sysfvar(0)>0) && playeridexist(floor(sysfvar(0)))
	trigger1=playerid(floor(sysfvar(0))),var(0)=90900 && playerid(floor(sysfvar(0))),var(50)>=1000
	value=195110
;;--- fadeout when KOed ; KO????
;sys::-2::st5150-1
[state 0]
	type=varset
	trigger1=stateno=5150 && time=1 && alive=0 && !ishelper && numpartner
	sysvar(1)=(roundstate<=2)
;sys::-2::st5150-2
[state 0]
	type=assertspecial
	trigger1=stateno=5150 && alive=0 && !ishelper && numpartner && sysvar(1) && (((time=[80,150]) && time%10<5) || time>150)
	flag=invisible
	flag2=noshadow
;;--- intro-pos-reset
;;--- <<IKEMEN????>>
;sys::-2::st5900-f
[state 0]
	type=turn
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && facing=ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp3
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>1 && playeridexist(id-2)
	trigger1=playerid(id-2),ishelper=0 && playerid(id-2),teamside=teamside
	x=const240p(120)*ifelse(teamside=1,-1,1)
;sys::-2::st5900-pp4
[state 0]
	type=posset
	trigger1=stateno=5900 && time=0
	trigger1=!ishelper && numpartner>2 && playeridexist(id-3)
	trigger1=playerid(id-3),ishelper=0 && playerid(id-3),teamside=teamside
	x=const240p(145)*ifelse(teamside=1,-1,1)
;//==========================
;// add004-sctrls-end
;//==========================
;##[a4b_-2_end]##



[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 1
v = 8    ;fv = 10
value = 1

[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 2
v = 8    ;fv = 10
value = 2

[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 3
v = 8    ;fv = 10
value = 3

[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 4
v = 8    ;fv = 10
value = 4

[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 5
v = 8    ;fv = 10
value = 5

[State -2, VarSet]
type = VarSet
trigger1 = var(37) = 6
v = 8    ;fv = 10
value = 6

[state -2, explod_1]
type = explod
trigger1 = var(37) = 1
trigger1 = numexplod(30100) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30100
removetime = -1
id = 30100
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_1]
type = explod
trigger1 = var(37) = 1
trigger1 = numexplod(30101) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30100
removetime = -1
id = 30101
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 2
trigger5 = var(37) = 3
trigger6 = var(37) = 4
trigger7 = var(37) = 5
trigger8 = var(37) = 6
id = ifelse( teamside = 1, 30100, 30101)


[state -2, explod_2]
type = explod
trigger1 = var(37) = 2
trigger1 = numexplod(30110) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30110
removetime = -1
id = 30110
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_2]
type = explod
trigger1 = var(37) = 2
trigger1 = numexplod(30111) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30110
removetime = -1
id = 30111
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 1
trigger5 = var(37) = 3
trigger6 = var(37) = 4
trigger7 = var(37) = 5
trigger8 = var(37) = 6
id = ifelse( teamside = 1, 30110, 30111)


[state -2, explod_3]
type = explod
trigger1 = var(37) = 3
trigger1 = numexplod(30120) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30120
removetime = -1
id = 30120
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_3]
type = explod
trigger1 = var(37) = 3
trigger1 = numexplod(30121) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30120
removetime = -1
id = 30121
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 1
trigger5 = var(37) = 2
trigger6 = var(37) = 4
trigger7 = var(37) = 5
trigger8 = var(37) = 6
id = ifelse( teamside = 1, 30120, 30121)


[state -2, explod_4]
type = explod
trigger1 = var(37) = 4
trigger1 = numexplod(30130) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30130
removetime = -1
id = 30130
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_4]
type = explod
trigger1 = var(37) = 4
trigger1 = numexplod(30131) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30130
removetime = -1
id = 30131
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 1
trigger5 = var(37) = 2
trigger6 = var(37) = 3
trigger7 = var(37) = 5
trigger8 = var(37) = 6
id = ifelse( teamside = 1, 30130, 30131)


[state -2, explod_5]
type = explod
trigger1 = var(37) = 5
trigger1 = numexplod(30140) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30140
removetime = -1
id = 30140
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_5]
type = explod
trigger1 = var(37) = 5
trigger1 = numexplod(30141) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30140
removetime = -1
id = 30141
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 1
trigger5 = var(37) = 2
trigger6 = var(37) = 3
trigger7 = var(37) = 4
trigger8 = var(37) = 6
id = ifelse( teamside = 1, 30140, 30141)


[state -2, explod_6]
type = explod
trigger1 = var(37) = 6
trigger1 = numexplod(30150) = 0
trigger1 = teamside = 1
postype =  left
pos =  30, 220
bindtime = -1
anim = 30150
removetime = -1
id = 30150
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, explod_6]
type = explod
trigger1 = var(37) = 6
trigger1 = numexplod(30151) = 0
trigger1 = teamside = 2
postype = right
pos =  -110, 220
bindtime = -1
anim = 30150
removetime = -1
id = 30151
ownpal = 1
sprpriority = 5
ontop = 1

[state -2, Remove Explod]
type = removeexplod
trigger1 = win
trigger2 = DrawGame
trigger3 = Lose
trigger4 = var(37) = 1
trigger5 = var(37) = 2
trigger6 = var(37) = 3
trigger7 = var(37) = 4
trigger8 = var(37) = 5
id = ifelse( teamside = 1, 30150, 30151)

[State -2, Finish]
type = ScreenBound
triggerall = (Life <= 0) || (!Alive) || (Lose)
trigger1 = (StateNo = 5150) && (RoundState = 4)
value = 0
MoveCamera = 0,0
IgnoreHitPause = 1

[State -2,screen]
type=ScreenBound
trigger1=p2stateno=4020&&p2movetype=H
value=p2bodydist x < 30 && BackEdgeDist < 30



[state -2, No Clones]
type = remappal
triggerall = numenemy && (var(40)=[1,22])
trigger1 = var(41)&&!numhelper(256)&& roundno=1;&&matchno=1
trigger1 = enemy,authorname="DL"&&enemy,name="Kenji"&&enemy,var(40)=var(40)
source = 1, 1
dest = 1, Ifelse(teamside!=1 && enemynear,Numhelper(256)=0,enemy,var(40)+teamside,var(40))
ignorehitpause = 1

[state -2, Palette]
type = varset
trigger1 = numhelper(256)
trigger1=helper(256),var(40)=[1,22]
var(40)= helper(256),var(40)
ignorehitpause = 1


[state -2, Palette Selection]
type = remappal
trigger1 = numhelper(256)
trigger1 = helper(256),var(40)=[1,22]
source = 1, 1
dest = 1, var(40)
ignorehitpause = 1


[state -2, Continue Palette]
type = remappal
trigger1=var(41)&&matchno>1
source = 1, 1
dest = 1, var(40)
ignorehitpause = 1



[State -2, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1


[State -2, Counter FX]
type = helper
triggerall = movehit = 1 && var(30) = hitpausetime
triggerall = numenemy && var(9)
trigger1 = !(hitdefattr = SCA, AT) && (enemynear, movereversed != 1)
trigger2 = (EnemyNear, MoveReversed != 1) && StateNo = [1100,1299]
trigger3 = StateNo = [2900,2999]
stateno = 8290
ID = 8290
name = "Counter FX"
postype = p1
facing = -1
ownpal = 1
pausemovetime = 255
supermovetime = 255
ignorehitpause = 1


[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(9) = (enemynear, movetype = A)
ignorehitpause = 1


[State -2, P2 Safe Fall]
type = targetstate
trigger1 = numtarget = 1
trigger1 = target, command = "recovery"
trigger1 = target, pos y >= -48 && target, vel y > 0
trigger1 = target, alive && target, hitfall && target, gethitvar(fall.recover)
trigger1 = target, stateno = 5030 || target, stateno = 5035 || target, stateno = 5050 || target, stateno = 5071
value = 5205
ignorehitpause = 1


[State -2, Dampener]
type = varset
trigger1 = 1
fvar(10) = ifElse(var(13) < 6, 24, ifElse(var(13) >= 23, 1, 29 - var(13))) / 24.0
ignorehitpause = 1

[State -2, Dampener - Custom Combo]
type = varset
trigger1 = var(20)
fvar(10) = 0.72 * (10 - ifElse(var(13) >= 10, 10, var(13))) / 10.0
ignorehitpause = 1

[State -2, Dampener - Custom Combo Limiter]
type = varset
trigger1 = var(20)
trigger1 = StateNo = 250
fvar(10) = ifElse(var(13), 0, 0.72)
ignorehitpause = 1

[State -2, Dampener - Supers]
type = varset
trigger1 = (stateno = [3000, 4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21), 0.8, 1.0))
ignorehitpause = 1

[State -2, Dampener Limit]
type = varset
trigger1 = fvar(10) < 0
fvar(10) = 0
ignorehitpause = 1

[State -2, Root Dampener]
type = varset
trigger1 = 1
fvar(11) = fvar(10) * ifelse(var(9), 1.2, 1)
ignorehitpause = 1


[State -2, Debug]
type = DisplayToClipboard
trigger1 = 1
text = "AI = %d Attack = %f Hits = %d Super Jump = %d"
params = AILevel, fvar(11), var(13), var(0)
ignoreHitPause = 1

[State -2, Debug]
type = AppendToClipboard
trigger1 = 1
text = "\np2bodydist x = %f p2dist y = %f x = %f"
params = p2bodydist x, p2dist y, EnemyNear, const(size.head.pos.y)
text = "\nBy Memo"
ignoreHitPause = 1


[State -2, Pause Detector]
type = VarSet
trigger1 = 1
var(56) = gametime

;-------------------------------
;DAMAGES - 14

;Fire = 1,2,3
;Eletric = 4,5,6,7
;Ice = 8,9,10
;Poison = 11,12,13

;-------------------------------
;DAMAGE FIRE
[State -2, Fraqueza a Fogo]
type = VarSet
trigger1 = (enemy,name ="Iceman")
trigger2 = (enemy,name ="Ice Man")
trigger3 = (enemy,name ="Sasquatch")
trigger4 = (enemy,name ="Nool")
trigger5 = (enemy,name ="Rikuo")
trigger6 = (enemy,name ="Suija")
trigger7 = (enemy,name ="Sogetsu")
trigger8 = (enemy,name ="Kula")
v = 22
value = 1
ignorehitpause = 1

[State -2, Reistencia a Fogo]
type = VarSet
trigger1 = (enemy,name ="Enja")
trigger2 = (enemy,name ="Kasuki")
trigger3 = (enemy,name ="Fuuma")
trigger4 = (enemy,name ="Mai Shiranui")
trigger5 = (enemy,name ="Blackheart")
trigger6 = (enemy,name ="Kongou")
trigger7 = (enemy,name ="Dhalsim")
;trigger8 = (enemy,name ="Kenji")
v = 22
value = 2
ignorehitpause = 1

[State -2, Imunidade a Fogo]
type = VarSet
trigger1 = (enemy,name ="Ghost Rider")
trigger2 = (enemy,name ="Pyron")
trigger3 = (enemy,name ="Gill")
v = 22
value = 3
ignorehitpause = 1

;---------------------------------------------
;DAMAGE ELECTRY
[State -2, Fraqueza Eletrica]
type = VarSet
trigger1 = (enemy,name ="Iron Man")
trigger2 = (enemy,name ="Lex Luthor")
trigger3 = (enemy,name ="War Machine")
trigger4 = (enemy,name ="Cyber Akuma")
trigger5 = (enemy,name ="Cyborg Superman")
trigger6 = (enemy,name ="K.Athur")
trigger7 = (enemy,name ="Silver Samurai")
trigger8 = (enemy,name ="Tron Bonne")
trigger9 = (enemy,name ="Maxima")
v = 23   ;fv = 11
value = 1
ignorehitpause = 1

[State -2, Grande Fraqueza Eletrica]
type = VarSet
trigger1 = (enemy,name ="Bass")
trigger2 = (enemy,name ="Cutman")
trigger3 = (enemy,name ="IcemanM")
trigger4 = (enemy,name ="Letal Weapon Mb-02")
trigger5 = (enemy,name ="Megaman")
trigger6 = (enemy,name ="Perfect Weapon MB-02")
trigger7 = (enemy,name ="Protoman")
trigger8 = (enemy,name ="Roll")
trigger9 = (enemy,name ="Rock Volnutt")
trigger10 = (enemy,name ="Sentinel")
trigger11 = (enemy,name ="Servbot Kum-Bum")
trigger12 = (enemy,name ="Z-Akuma")
trigger13 = (enemy,name ="Mech-Hisui")
v = 23   ;fv = 11
value = 2
ignorehitpause = 1

[State -2, Resistencia Eletrica]
type = VarSet
trigger1 = (enemy,name ="Blackheart")
trigger2 = (enemy,name ="Gi Gi")
trigger3 = (enemy,name ="Sandman")
trigger4 = (enemy,name ="Storn")
trigger5 = (enemy,name ="Thor")
trigger6 = (enemy,name ="Galford")
trigger7 = (enemy,name ="Ochamaro")
trigger8 = (enemy,name ="Benimaru")
trigger9 = (enemy,name ="Neo Dio")
trigger10 = (enemy,name ="Anakaris")
v = 23  ;fv = 11
value = 3
ignorehitpause = 1

[State -2, Imunidade Eletrica]
type = VarSet
trigger1 = (enemy,name ="Blanka")
trigger2 = (enemy,name ="Dr.Doom")
trigger3 = (enemy,name ="Elecman")
trigger4 = (enemy,name ="Victor")
trigger5 = (enemy,name ="Zabel")
trigger6 = (enemy,name ="Nool")
trigger7 = (enemy,name ="Electro")
trigger8 = (enemy,name ="Roa")
v = 23  ;fv = 11
value = 4
ignorehitpause = 1

;---------------------------------------------
;DAMAGE ICE
[State -2, Fraqueza a Gelo]
type = VarSet
trigger1 = (enemy,name ="Ghost Rider")
trigger2 = (enemy,name ="Pyron")
trigger3 = (enemy,name ="Enja")
trigger4 = (enemy,name ="Kasuki")
v = 24
value = 1
ignorehitpause = 1

[State -2, Resistencia a Gelo]
type = VarSet
trigger1 = (enemy,name ="Blackheart")
trigger2 = (enemy,name ="Sasquatch")
trigger3 = (enemy,name ="Nool")
v = 24
value = 2
ignorehitpause = 1

[State -2, Imunidade a Gelo]
type = VarSet
trigger1 = (enemy,name ="Iceman")
trigger2 = (enemy,name ="Ice Man")
trigger3 = (enemy,name ="Gill")
trigger4 = (enemy,name ="Suija")
trigger5 = (enemy,name ="Sogetsu")
trigger6 = (enemy,name ="Kula")
v = 24
value = 3
ignorehitpause = 1
;---------------------------------------------
;DAMAGE POISON
[State -2, Fraqueza Gás]
type = VarSet
trigger1 = (enemy,name ="bb")
v = 25
value = 1
ignorehitpause = 1


[State -2, Resistencia Gas]
type = VarSet
trigger1 = (enemy,name ="Blackheart")
trigger2 = (enemy,name ="Gi Gi")
trigger3 = (enemy,name ="Zabel")
trigger4 = (enemy,name ="Neo Dio")
trigger5 = (enemy,name ="Anakaris")
trigger6 = (enemy,name ="Nool")
trigger7 = (enemy,name ="Letal Weapon Mb-02")
trigger8 = (enemy,name ="Perfect Weapon MB-02")
trigger9 = (enemy,name ="Amigo")
trigger10 = (enemy,name ="Venom")
v = 25
value = 2
ignorehitpause = 1

[State -2, Imunidade Gas]
type = VarSet
trigger1 = (enemy,name ="Iron Man")
trigger2 = (enemy,name ="War Machine")
trigger3 = (enemy,name ="Sandman")
trigger4 = (enemy,name ="Bass")
trigger5 = (enemy,name ="Cutman")
trigger6 = (enemy,name ="IcemanM")
trigger7 = (enemy,name ="Megaman")
trigger8 = (enemy,name ="Protoman")
trigger9 = (enemy,name ="Roll")
trigger10 = (enemy,name ="Rock Volnutt")
trigger11 = (enemy,name ="Sentinel")
trigger12 = (enemy,name ="Servbot Kum-Bum")
trigger13 = (enemy,name ="Z-Akuma")
trigger14 = (enemy,name ="Mech-Hisui")
trigger15 = (enemy,name ="Taros")
trigger16 = (enemy,name ="Ochamaro")
v = 25
value = 3
ignorehitpause = 1

;---------------------------------------------
;DAMAGE AIR
[State -2, Fraqueza Ar]
type = VarSet
trigger1 = (enemy,name ="Sandman")
trigger2 = (enemy,name ="The Thing")
trigger3 = (enemy,name ="Gi Gi")
trigger4 = (enemy,name ="Anakaris")
v = 26
value = 1
ignorehitpause = 1


;---------------------------------------------
;BLOOD SPARKS : BLOOD
[State -2, Bloodsparks]
type = VarSet
triggerall = (enemy,name!="Anakaris")
triggerall = (enemy,name!="Apocalypse")
triggerall = (enemy,name!="Bass")
triggerall = (enemy,name!="Bishamon")
triggerall = (enemy,name!="Bizarro")
triggerall = (enemy,name!="Blade")
triggerall = (enemy,name!="Blues")
triggerall = (enemy,name!="Colossus")
triggerall = (enemy,name!="Cutman")
triggerall = (enemy,name!="Dr.Doom")
triggerall = (enemy,name!="ElecmanM")
triggerall = (enemy,name!="Gi Gi")
triggerall = (enemy,name!="Ghost Rider")
triggerall = (enemy,name!="IcemanM")
triggerall = (enemy,name!="Ironman")
triggerall = (enemy,name!="Juggernaut")
triggerall = (enemy,name!="K. Athur")
triggerall = (enemy,name!="Lex Luthor")
triggerall = (enemy,name!="Megamam")
triggerall = (enemy,name!="Metalman")
triggerall = (enemy,name!="Mech Zangief")
triggerall = (enemy,name!="Phobos Huitzil")
triggerall = (enemy,name!="Protoman")
triggerall = (enemy,name!="Pyron")
triggerall = (enemy,name!="Ravange")
triggerall = (enemy,name!="Rock Volnutt")
triggerall = (enemy,name!="Roll")
triggerall = (enemy,name!="Sandman")
triggerall = (enemy,name!="Sentinel")
triggerall = (enemy,name!="Servbot Kobun")
triggerall = (enemy,name!="Silver Samurai")
triggerall = (enemy,name!="Superman")
triggerall = (enemy,name!="The Thing")
triggerall = (enemy,name!="War Machine")
triggerall = (enemy,name!="Z-Akuma")
trigger1 = 1
v = 27
value = 1
ignorehitpause = 1

;---------------------------------------------
;BLOOD SPARKS : BLOOD
[State -2, Bloodsparks]
type = VarSet
trigger1 = (enemy,name="Bass")
trigger2 = (enemy,name="Blade")
trigger3 = (enemy,name="Blues")
trigger4 = (enemy,name="Cutman")
trigger5 = (enemy,name="Dr.Doom")
trigger6 = (enemy,name="ElecmanM")
trigger7 = (enemy,name="Ghost Rider")
trigger8 = (enemy,name="IcemanM")
trigger9 = (enemy,name="Ironman")
trigger10 = (enemy,name="Lex Luthor")
trigger11 = (enemy,name="Megamam")
trigger12 = (enemy,name="Metalman")
trigger13 = (enemy,name="Phobos Huitzil")
trigger14 = (enemy,name="Protoman")
trigger15 = (enemy,name="Pyron")
trigger16 = (enemy,name="Rock Volnutt")
trigger17 = (enemy,name="Roll")
trigger18 = (enemy,name="Sentinel")
trigger19 = (enemy,name="Servbot Kobun")
trigger20 = (enemy,name="War Machine")
trigger21 = (enemy,name="Z-Akuma")
v = 28
value = 1
ignorehitpause = 1

;-----------------------------------------------------------
[State -2, counterFX]
type = helper
trigger1 = movehit && numtarget && hitdefattr=SCA,AA
trigger1 = !numhelper(8280) && var(32)
trigger1 = (target,movetype=H) && !(target,time)
trigger2 = movehit = 1 && var(32)= hitpausetime
trigger2 = numenemy && var(32)
trigger2 = !(hitdefattr = SCA,AT) && (enemynear,movereversed!=1)
helpertype = normal
stateno = 8280
ID = 8280
name = "Counter"
postype = left
ownpal = 1
pausemovetime = 9999
supermovetime = 9999
ignorehitpause = 1

[State -2, countervar]
type = varset
trigger1 = 1
var(32) = ifelse((p2movetype=A),1,0)



;===============================================================================
;===============================< -3 STATES >===================================
;===============================================================================
[Statedef -3]

[State -3, GameTimeVar]
type = VarSet
trigger1 = 1
var(57) = GameTime
IgnoreHitPause = 1

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1


[State -3, Super Cancel Reset]
type = varset
trigger1 = 1
var(7) = 0
ignorehitpause = 1

[State -3, Super Cancel Flag Reset]
type = VarSet
trigger1 = var(21)
trigger1 = (StateNo != [3000,4999]) || MoveType = H
var(21) = 0
ignoreHitPause = 1

[State -3, Super Cancel Check]
type = varset
trigger1 = var(20) && (StateNo = [200,699])
trigger2 = var(20) && (StateNo = [1000,2999]) && (MoveContact || var(18))
trigger3 = (StateNo = [200,699]) && Time <= 1.5
trigger4 = StateNo = [200,201]
trigger5 = StateNo = 210 && (AnimElemTime(3) < 0 || (movecontact = [1, 8]))
trigger6 = StateNo = 220 && (AnimElemTime(4) < 0 || (movecontact = [1, 8]))
trigger7 = StateNo = 221 && (AnimElemTime(4) < 0 || (movecontact = [1, 8]))
trigger8 = StateNo = [230,231]
trigger9 = StateNo = 251 && (AnimElemTime(4) < 0 || (movecontact = [1, 8]))
trigger10 = StateNo = 400
trigger11 = StateNo = 410 && (AnimElemTime(3) < 0 || (movecontact = [1, 8]))
trigger12 = StateNo = 420 && (AnimElemTime(3) < 0 || (movecontact = [1, 8]))
trigger13 = StateNo = 430
trigger14 = StateNo = 440 && (AnimElemTime(3) < 0 || (movecontact = [1, 8]))
trigger15 = StateNo = 450 && (AnimElemTime(4) < 0 || (movecontact = [1, 8]))
trigger16 = (StateNo = [1000,1030]) && (AnimElemTime(7) = [1,8])
trigger17 = Stateno = 1101
trigger18 = Stateno = 1400
trigger19 = Stateno = 1401
trigger20 = Stateno = 1101
trigger21 = Stateno = 1201
trigger22 = Stateno = 1301
trigger23 = Stateno = 1501
trigger24 = Stateno = 1430
trigger25 = StateNo = 421 && MoveContact && AnimElemTime(4) < 0
var(7) = 1
ignorehitpause = 1


[State -3, Parry Detection]
type = helper
triggerall = roundstate = 2 && !numhelper(765) && !var(20)
triggerall = (movetype = I && ctrl) || (stateno = [760, 762]) || stateno = 5120
triggerall = (command != "rlsfwd" && command != "rlsback" && command != "rlsup" && command != "rlsdown") || AIlevel
trigger1 = !AIlevel && (statetype = S || statetype = C || stateno = 5120) && (command = "fwd" || command = "down")
trigger2 = !AIlevel && statetype = A && (var(3) != 1 && var(3) != 2) && command = "fwd"
trigger3 = AIlevel && (stateno != [760, 762]) && inguarddist && random < 50
trigger4 = AIlevel && (stateno = [760, 762]) && time = 14 && random < 667
;helpertype = normal
stateno = 765
ID = 765
name = "Parry Detection"
postype = p1
pausemovetime = 65535
supermovetime = 65535

[State -3, Parry Attacks]
type = changestate
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = helper(765), stateno = 766
value = ifelse((helper(765), anim = 767), 762, ifelse((helper(765), anim = 766), 761, 760))
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 765)
attr = SA, AP
stateno = 760
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 766)
attr = C, AP
stateno = 761
slot = 0
time = 1
ignorehitpause = 1

[State -3, Parry Projectiles]
type = hitoverride
trigger1 = (stateno != [760, 762]) && numhelper(765)
trigger1 = !(helper(765), var(0)) && (helper(765), anim = 767)
attr = SCA, AP
stateno = 762
slot = 0
time = 1
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = var(31) > 0
trigger1 = var(31) := (var(31) -1)
flag = nowalk
ignoreHitPause = 1


[State -3, Movement Afterimage]
type = null;afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && (var(3) = 2 || var(3) = 3)
trigger2 = (stateno = [700, 715])
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
trigger1 = stateno = 3000 && time = 43
trigger2 = stateno = 3100 && time = 43
trigger3 = stateno = 3200 && time = 43
trigger4 = stateno = 3201 && time = 43
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 128, 128, 128
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv2 Super Afterimage]
type = afterimage
trigger1 = stateno = 3050 && time = 43
trigger2 = stateno = 3150 && time = 43
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 32, 32, 160
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Lv3 Super Afterimage]
type = afterimage
trigger1 = stateno = 3500 && time = 43
trigger2 = stateno = 3900 && time = 43
time = 2
timegap = 1
framegap = 10
length = 21
palbright = 0, 0, 0
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
trans = add1

[State -3, Afterimage Persist]
type = afterimagetime
trigger1 = stateno = 50 || (stateno = [600, 699])
trigger1 = (var(3) = 2 || var(3) = 3) && vel y < -1
trigger2 = var(20)
trigger3 = stateno = [700, 715]
trigger4 = (StateNo = [3000,4999])
time = 2


[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1 && random<300
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < (250 * (AIlevel ** 2 / 64.0))
value = 5000, (random % 3)
;channel = 0
;ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1 && random<300
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, (random % 3)
;channel = 0
;ignorehitpause = 1

[State -3, Cheap KO]
type = changestate
trigger1 = !alive && (stateno = [5000, 5010])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5950
ignorehitpause = 1


;-------------------------------------------------------------------------------
; Super/Hyper Combo Finish - Background Effect
[State -3, Hyper Combo Finish!!]
type = Helper
triggerall = NumHelper(9300) <= 0
triggerall = (stateno = [3000,4999])||(stateno = [6000,6999]); || (Numhelper (6100)); || (stateno = [3900,3949])
triggerall = roundstate = 3
trigger1 = Winko
helpertype = normal
name = "HyperFinish"
ID = 9300
stateno = 9300
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1

[State -3, Hyper Combo Finish!!]
type = Helper
triggerall = NumHelper(9300) <= 0
triggerall = roundstate = 3
triggerall = Winko
trigger1 = Numhelper(4010) = 1
trigger2 = Numhelper(4210) = 1
trigger3 = Numhelper(4211) = 1
trigger4 = Numhelper(4212) = 1
trigger5 = Numhelper(4213) = 1
trigger6 = Numhelper(4310) = 1
trigger7 = Numhelper(4311) = 1
trigger8 = Numhelper(4410) = 1
trigger9 = Numhelper(4411) = 1
trigger10 = Numhelper(4412) = 1
trigger11 = Numhelper(4413) = 1
trigger12 = Numhelper(4414) = 1
trigger13 = Numhelper(4500) = 1
trigger14 = Numhelper(4510) = 1
trigger15 = Numhelper(4600) = 1
trigger16 = Numhelper(3010) = 1
trigger17 = Numhelper(3011) = 1
trigger18 = Numhelper(3012) = 1
trigger19 = Numhelper(3013) = 1
trigger20 = Numhelper(3014) = 1
trigger21 = Numhelper(3015) = 1
trigger22 = Numhelper(3016) = 1
trigger23 = Numhelper(3060) = 1
trigger24 = Numhelper(3061) = 1
trigger25 = Numhelper(3062) = 1
trigger26 = Numhelper(3063) = 1
trigger27 = Numhelper(3064) = 1
trigger28 = Numhelper(3065) = 1
trigger29 = Numhelper(3067) = 1
trigger30 = Numhelper(3068) = 1
trigger31 = Numhelper(4420) = 1
helpertype = normal
name = "HyperFinish"
ID = 9300
stateno = 9300
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
ignorehitpause = 1


[State -3, Fffffinish!!]
type = Helper
triggerall = NumHelper(9315) = 0
triggerall = !NumHelper(9300)
triggerall = WinKO
triggerall = roundstate = 3
trigger1 = (stateno = [200,2999]) ;|| (stateno = [3700,3799]) || (stateno = [3900,3949])
trigger2 = Numhelper(1005) = 1
trigger3 = Numhelper(1060) = 1
trigger4 = Numhelper(1110) = 1
trigger5 = Numhelper(1310) = 1
id = 9315
pos = 0, 0
postype = p1
facing = 0
stateno = 9315
keyctrl = 0
ownpal = 1
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1

;-------------------------------------------------------------------------------

[State -3, VarSet]
type = VarSet
trigger1 = (stateno != [3000,6999])
;trigger2 = (stateno != [6000,6999])
v = 45
value = 0

