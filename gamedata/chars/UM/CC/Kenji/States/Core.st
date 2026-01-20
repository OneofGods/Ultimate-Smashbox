;===============================================================================
;============================<HYPER CORE MOVES>=================================
;===============================================================================
[Statedef 6000]
type = S
movetype = A
physics = S
juggle  = 6
ctrl = 0
velset = 0,0
anim = 6000
sprpriority = 3


[State 6000, Invincibility] ;Can't be hit right after getting up (short time)
type = NotHitBy
trigger1 = Animelem = 2
value = SCA,NA,SA,NP,SP,HP
time = 15


[State 6000, Super Pause]
type = SuperPause
trigger1 = animelem = 3
time = 25
movetime = 25
pos = 18, -45
anim = -1
sound = -1


[State 1000, Explod]
type = Explod
trigger1 = animelem = 13, = 0
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

[State 6000, Super Pause]
type = SuperPause
trigger1 = animelem = 13
time = 65
movetime = 65
pos = 19, -47
anim = S9104
sound = S9101,0
p2defmul = 0
poweradd= -3000

;----------------------

[State 0, VarSet carga Bg]
type = VarSet
trigger1 = animelem = 13
v = 45   ;fv = 10
value = 1


[State 0, Carga Bg]
type = helper
triggerall = numhelper(9200)=0
trigger1 = animelem = 13
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
trigger1 = time > 40
flag = NoBG
flag2 = NoFG
ignorehitpause = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 16
value = 1

[State 0, WinKO]
type = VarSet
trigger1 = WinKO
v = 18
value = 1
;----------------------

[State 9500]
type = Helper
triggerall = numhelper(9500)=0
trigger1 = AnimElem = 13
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

[State 760, 1]
type = PlaySnd
trigger1 = time = 1
value = S3000,0

[State 6000, 3]
type = ChangeState
trigger1 = animtime = 0
value = 6001
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Dash
[Statedef 6001]
type  = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6001
sprpriority = 3

[State 6001, Running]
type = PlaySnd
trigger1 = Animelem = 2
trigger2 = Animelem = 8
trigger3 = Animelem = 14
trigger4 = Animelem = 20
value = S100,0


[State 6001, Running]
type = PlaySnd
trigger1 = Animelem = 5
trigger2 = Animelem = 11
trigger3 = Animelem = 17
trigger4 = Animelem = 23
value = S100,1


[State 6001, Dust]
type = Explod
trigger1 = Animelem = 1
trigger2 = Animelem = 3
trigger3 = Animelem = 5
trigger4 = Animelem = 7
trigger5 = Animelem = 9
trigger6 = Animelem = 11
trigger7 = Animelem = 13
Trigger8 = Animelem = 15
Trigger9 = Animelem = 17
Trigger10 = Animelem =19
Trigger11 = Animelem =21
Trigger12 = Animelem =23
anim = 8552
pos = 0,10
postype = p1  ;p2,front,back,left,right
facing = 1
bindtime = 1
removetime = -2
scale = 1,1
sprpriority = 7
ontop = 1
ownpal = 1
removeongethit = 0
supermove = 99999999999999
pausemove = 99999999999999


[State 6001, VelSet]
type = VelSet
trigger1 = time > 0
x = 10

[State 6001, NotHitBy]
type = NotHitBy
trigger1 = time = 0
trigger2 = time = 10
value = SCA,NA,SA,NP,SP,NT,ST
time = 5


[State 6001, 3]
type = ChangeState
trigger1 = p2bodydist X <= 90
value = 6002
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6002]
type = S
movetype = A
physics = S
ctrl = 0
velset = 6,0
anim = 6002
sprpriority = 2


[State 6002, Burst]
type = Explod
trigger1 = Animelem = 1
anim = 8550
postype = p1
pos = 0, 10
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7
scale = 1, 1
supermove = 99999
pausemove = 99999


[State 6002, Width]
type = Width
trigger1 = AnimElemTime(3) >= 0 && AnimElemTime(6) < 0
value = 6,0


[State 6002, 1]
type = PlaySnd
trigger1 = animelem = 1
value = S4,6


[State 6002, Lunge]
type = Posadd
trigger1 = animelem = 3 && time < 15
x = 28

[State 6002, Pierce]
type = HitDef
triggerall = enemynear,life>=350
trigger1 = AnimElem = 3
attr = S, HA
animtype  = hard
damage = 45, 5
getpower = 0
priority = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 15,16
sparkno = S8004
guard.sparkno = S8142
sparkxy = -10,-60
hitsound  = S2,25
guardsound = S3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 30
ground.velocity = -12.8, -3.8
air.velocity = -12.8, -3.8
ignorehitpause = 0
p1stateno = 6005
p2stateno = 6030
p2facing = 1
Kill = 0
envshake.time = 10
envshake.ampl = 4

[State 6002, Pierce]
type = HitDef
triggerall = enemynear,life<350
trigger1 = AnimElem = 3
attr = S, HA
animtype  = hard
damage = 0, 15
getpower = 0
priority = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 15,16
sparkno = S8004
guard.sparkno = S8142
sparkxy = -10,-60
hitsound  = S2,25
guardsound = S3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 30
ground.velocity = -12.8, -3.8
air.velocity = -12.8, -3.8
ignorehitpause = 0
p1stateno = 6100
p2stateno = 6107
p2facing = 1
Kill = 0
envshake.time = 10
envshake.ampl = 4


[State 6002, ChangeState 2]
type = ChangeState
trigger1 = animtime = 0
value = 6004
ctrl = 0

;--------------------------------------------------------------------------
;Champions of Red Earth - Stop
[Statedef 6003]
type = S
movetype= A
physics = S
ctrl = 0
velset = 0,0
anim = 6003
sprpriority = 3


[State 6003, Slow 1]
type = VelSet
trigger1 = time > 0
x = 6
y = 0


[State 6003, 8]
type = VelAdd
triggerall = Vel X > 0
trigger1 = time > 10
x = -.4


[State 6003, Slow 2]
type = posadd
trigger1 = time > 10 && time < 20
x = 2.5
y = 0
yaccel = 1.8


[State 6003, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;--------------------------------------------------------------------------
;Enmazuki - Stop
[Statedef 6004]
type = S
movetype= A
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 2450
sprpriority = 6


[State 6004, ScreenBound]
triggerall = prevstateno != 6002
type = ScreenBound
trigger1 = 1
value = 0
movecamera = 0,0


[State 6004, Dust]
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


[State 6004, Slow 1]
type = VelSet
trigger1 = time > 0 && time < 5
x = 3
y = 0


[State 6004, Slow 2]
type = posadd
trigger1 = time > 6 && time < 15
x = 2.5
y = 0


[State 6004, slow 2]
type = posadd
trigger1 = time > 16 && time < 20
x = 2.5
y = 0


[State 6004, 3]
type = changestate
trigger1 = animtime = 0 && backedgebodydist < 0
value = 101
ctrl = 1

[State 6004, ChangeState]
type = ChangeState
trigger1 = animtime = 0 && backedgebodydist >= 0 ;This is true only if he is NOT offscreen
value = 0
ctrl = 1

;---------------------------------------
;Champions of Red Earth - Initiate
[Statedef 6005]
type    = S
movetype = A
physics = S
ctrl = 0
anim = 6005
sprpriority = 2

[State 6005, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6005, Super Pause]
type = SuperPause
trigger1 = time = 0
time = 10
pos = 0, 0
anim = -1
sound = -1
darken = 0


[State 6005, VelSet]
type = VelSet
trigger1 = time > 0
X = -1.4


[State 6005, Helper]
type = Helper
trigger1 = NumHelper(6050) = 0
trigger1 = time = 0
helpertype = normal ;player
name = "Leo"
Id = 6050
stateno = 6050
pos = p2dist X -25,-250
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 6005, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 6010
ctrl = 0

;--------------------------------------------------------------------------
; C.O.R.E. - Rasetsujin
[Statedef 6010]
type = S
movetype = A
physics = S
juggle = 0
ctrl = 0
velset = 0,0
anim = 1320
sprpriority = 2

[State 6010, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6010, Snd]
type = playsnd
trigger1 = Animelem = 21
value = S1200,0
;channel = 0

[State 6010, 1]
type = PlaySnd
trigger1 = Animelem = 22
trigger2 = Animelem = 26
value = 2, 14
;channel = 4

[State 6010, Snd]
type = playsnd
trigger1 = Animelem = 24
value = 4,7

[State 6010, PlaySnd]
type = PlaySnd
trigger1 = animelem = 16
trigger2 = animelem = 29
value = 3000, 5

[State 6010, PlaySnd]
type = PlaySnd
trigger1 = Animelem = 45
value = 2, 15
;channel = 2


[State 1300, Explod]
type = Explod
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


[State 6010, Slide]
type = Posadd
trigger1 = animelem = 17 ;(animelem = 8) && (time > 0 && time < 30)
x = 40


[State 6010, Slide]
type = Posadd
trigger1 = animelem = 22
x = 20


[State 6010, 1st Swing]
type = HitDef
trigger1 = AnimElem = 18
attr = S, HA
animtype  = hard
damage = 40, 5
getpower  = 0
priority  = 7, hit
hitflag = MAF
guardflag = L
pausetime = 10,15
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -10,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = low
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = 0
air.velocity = 0, 0
ignorehitpause = 0
persistent = 1
;Air.Fall =1
kill = 0
envshake.time = 8
envshake.ampl = 4


[State 6010, 2nd Swing]
type = HitDef
trigger1 = AnimElem = 22
attr = S, SA
animtype  = hard
damage  = 50, 15
getpower  = 0
priority  = 7, hit
hitflag = MAF
guardflag = MA
pausetime = 10,15
sparkno = S8420+random%8
guard.sparkno = S8142;s5570
sparkxy = -10,-60
hitsound = S2,9+random%2
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 30
ground.velocity = 0, 0
air.velocity = 0, 0
persistent = 1
kill = 0
envshake.time = 8
envshake.ampl = 5

[State 6010, EnvShake]
type = EnvShake
trigger1 = animelem = 18
trigger2 = animelem = 22
time = 4
freq = 8

[State 6010, Burst]
type = Explod
trigger1 = Animelem = 17
trigger2 = animelem = 21
ID = 6010
anim = 8550
postype = p1
pos = 0, 10
bindtime = 1
removetime = -2
ownpal = 1
sprpriority = 7
scale = 1, 1

[State 6010, 3]
type = NotHitBy
trigger1 = 1
value = SCA
time = 50


[State 6010, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 6020
ctrl = 0

;---------------------------------------------------------------------------
;C.O.R.E - Kenji Waits
[Statedef 6020]
type    = S
movetype = I
physics = S
ctrl = 0
anim = 6010
sprpriority = 2


[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 1

[State 6020, Helper]
type = Helper
triggerall = NumHelper(6060) = 0
trigger1 = time = 17
helpertype = normal ;player
name = "Mai-Lin"
ID = 6060
stateno = 6060
pos = -200,0
postype = Back    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999

[State 6020, Helper]
type = Helper
triggerall = NumHelper(6070) = 0
trigger1 = time = 175
helpertype = normal
name = "Tessa"
ID = 6070
stateno = 6070
pos = -200,0
postype = Back    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
pausemovetime = 999999
supermovetime = 999999


[State 6020 ChangeState 1]
type = ChangeState
trigger1 = enemynear, stateno = 6033
trigger2 = Win
trigger2 = Helper(6070),stateno = 6073
value = 6021
ctrl = 0


[State 6020, ChangeState 2]
type = ChangeState
trigger1 = enemynear, movetype != H
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; Champions of Red Earth - Kenji Win
[Statedef 6021]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6020
sprpriority = 2


[State 6021, 3]
type = ChangeState
trigger1 = NumExplod(9410) = 1
trigger2 = Time>200
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;C.O.R.E. - Leo's Appearance
[Statedef 6050]
type    = A
movetype = A
physics = A
juggle = 0
anim = 6050
sprpriority = 2


[State 6050, Gravity]
type = Gravity
trigger1 = time = 0


[State 6050, PlaySnd]
type = PlaySnd
trigger1 = time = 2
value = S7000,0

[State 6050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S1,10
freqmul = 1.0

[State 6050, PlaySnd]
type = PlaySnd
trigger1 = animelem = 4
value = S6000,0
freqmul = 1.0


[State 6050, Giant Swing]
type = HitDef
trigger1 = AnimElem = 7
attr = A, HA
animtype = hard
damage = 40, 5
priority  = 7, hit
guardflag = HA
pausetime = 10,15
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -30,-40
hitsound = S2,9
guardsound = S3,0
ground.type = Low
ground.slidetime = 0
ground.hittime  = 100
ground.velocity = .5
air.velocity = 0,0
air.hittime = 100
fall.animtype = hard
ignorehitpause = 0
kill = 0
envshake.time = 8
envshake.ampl = 4


[State 6050, ChangeState]
type = ChangeState
trigger1 = Pos Y >= -14
value = 6051
ctrl = 0

;---------------------------------------------------------------------------
;C.O.R.E - Leo Land
[Statedef 6051]
type    = S
movetype = I
physics = N
velset = 0,0
ctrl = 0
anim = 6051
sprpriority = 2

[State 0, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0


[State 6051, Explod]
type = Explod
trigger1 = time = 2
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


[State 6051, SuperPause]
type = SuperPause
trigger1 = time = 2
time = 35
anim = S9100
sound = S9100,0
pos = 10,-20
movetime = 35


[State 6051, Landing FX]
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


[State 6051, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 8
freq = 20


[State 6051, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S52,0
freqmul = 1.0


[State 6051, ChangeState]
type = ChangeState
trigger1 = AnimTime = 0
value = 6052
ctrl = 0

[State 6051, ChangeState]
type = ChangeState
triggerall = parent,movetype = H
trigger1 = AnimTime = 0
value = 6055
ctrl = 0

;--------------------------------------------------------------------------
; C.O.R.E. - Leo Special
[Statedef 6052]
type = S
movetype = A
physics = N
juggle = 0
ctrl = 0
velset = 0,0
anim = 6052
sprpriority = 2


[State 6052, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = animelem = 28
value = 6000,1
freqmul = 1.0

[State 6052, PlaySnd]
type = PlaySnd
trigger1 = animelem = 14
trigger2 = animelem = 23
trigger3 = animelem = 34
value = 6000,3
freqmul = 1.0

[State 6052, PlaySnd]
type = PlaySnd
trigger1 = animelem = 40
value = 6000,2
freqmul = 1.0


[State 6052, High Swings]
type = HitDef
trigger1 = AnimElem = 7
trigger2 = AnimElem = 23
trigger3 = AnimElem = 35
attr = S, HA
animtype  = hard
getpower = 0
damage = 35, 15
priority  = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 10,15
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -30,-90
hitsound = S2,8
guardsound = S3,0
ground.type = High
ground.slidetime = 0
ground.hittime  = 100
ground.velocity = -.5
air.velocity = -6, -.1
ignorehitpause = 0
kill = 0
snap = 70,0
envshake.time = 8
envshake.ampl = 4

[State 6052, High Swings]
type = HitDef
trigger1 = AnimElem = 17
trigger2 = AnimElem = 29
trigger3 = AnimElem = 33
attr = S, HA
animtype  = hard
getpower = 0
damage = 30, 15
priority  = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 10,15
sparkno = S8420+random%8
guard.sparkno = S8142
sparkxy = -30,-90
hitsound = S2,8
guardsound = S3,0
ground.type = Low
ground.slidetime = 0
ground.hittime  = 100
ground.velocity = -.5
air.velocity = -6, -.1
ignorehitpause = 0
snap = 75,0
kill = 0
envshake.time = 8
envshake.ampl = 4

[State 6052, High Swings]
type = HitDef
trigger1 = AnimElem = 44
trigger2 = AnimElem = 45
attr = S, HA
animtype  = hard
getpower = 0
damage = 25, 5
priority = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 10,25
sparkno = S8430+random%6
guard.sparkno = S8142
sparkxy = -30,-90
hitsound = S2,8
guardsound = S3,0
ground.type = Low
ground.slidetime = 0
ground.hittime  = 100
ground.velocity = -.5
air.velocity = -6, -.1
ignorehitpause = 0
kill = 0
snap = 90,0
envshake.time = 12
envshake.ampl = 5

[State 6052, High Swings]
type = HitDef
trigger1 = AnimElem = 45
attr = S, HA
animtype  = Heavy
getpower = 0
damage = 45, 10
priority = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 15,25
sparkno = S8430+random%6
guard.sparkno = S8142
sparkxy = -30,-10
hitsound = S2,8
guardsound = S3,0
ground.type = Low
ground.slidetime = 0
ground.hittime  = 100
ground.velocity = -.5
air.velocity = -6, -.1
ignorehitpause = 0
kill = 0
snap = 110,0
envshake.time = 12
envshake.ampl = 5



[State 6052, ChangeState]
type = ChangeState
trigger1 = animtime = 0
value = 6053
ctrl = 0

[State 6052, ChangeState]
type = ChangeState
triggerall = parent,movetype = H
trigger1 = AnimTime = 0
value = 6055
ctrl = 0

;---------------------------------------------------------------------------
;C.O.R.E - Leo Wait
[Statedef 6053]
type    = S
movetype = I
physics = S
ctrl = 0
anim = 6053
sprpriority = 2


[State 6053, ChangeState]
type = ChangeState
trigger1 = enemynear, stateno = 6033
trigger2 = Win
trigger2 = Helper(6070),stateno = 6073
value = 6054
ctrl = 0

[State 6053, ChangeState]
type = ChangeState
trigger1 = enemynear, movetype != H
value = 6055
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Leo Win
[Statedef 6054]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6054
sprpriority = 2

[State 6054, PlaySnd]
type = PlaySnd
trigger1 = time%45 = 0
value = S6000,10
freqmul = 1.1

[State 6022, 3]
type = ChangeState
trigger1 = root,NumExplod(9410) = 1
trigger2 = Time>180;80
value = 6055
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Leo Leaves
[Statedef 6055]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6055
sprpriority = 2

[State 0, VelSet]
type = VelSet
trigger1 = 1
x = -5

[State 6055, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S101,0
;channel = -1

[State 6055, Explod]
type = Explod
trigger1 = time%20 = 0
anim = 8552
sprpriority = 5
postype = p1
pos = 15,15
vel = -2,0
facing = -1
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
pausemovetime = 999999
supermovetime = 999999

[State 6055, DestroySelf]
type = DestroySelf
trigger1 = backedgedist < -70

;---------------------------------------------------------------------------
; Champions of Red Earth - Mai-Ling's Appearance
[Statedef 6060]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6060
sprpriority = 3

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 6060, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S101,0
freqmul = 1.0

[State 6060, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = S100,0
freqmul = 1.0

[State 6060, PlaySnd]
type = PlaySnd
trigger1 = animelem = 13
value = S100,1
freqmul = 1.0

[State 6060, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = 6000,4
freqmul = 1.0


[State 6060, Explod]
type = Explod
trigger1 = p2bodydist X <= 20
anim = 8559
sprpriority = 6
postype = p1
pos = 20,10
bindtime = 1
ownpal = 1
id = 8559
name = "Dust"
pausemovetime = 999999
supermovetime = 999999


[State 6060, VelSet]
type = VelSet
trigger1 = time > 0
x = 8


[State 6060, ChangeState]
type = ChangeState
trigger1 = p2bodydist X <= 5
value = 6061

;---------------------------------------------------------------------------
; Champions of Red Earth - Mai-Ling Special
[Statedef 6061]
type  = S
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0.5,0
anim = 6061
sprpriority = 3

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 6061, SuperPause]
type = SuperPause
trigger1 = time = 1
time = 25
anim = S9100
sound = S9100,0
pos = -25,-60


[State 6061, StateTypeSet]
type = StateTypeSet
trigger1 = animelem = 6 && time > 1
statetype = S       ;S,A,C,L
movetype = A        ;I,A,H
physics = N         ;A,C,S,N


[State 6061, VelSet]
type = VelSet
trigger1 = time > 0
x = .2
y = -2

[State 6061, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = 6000,5
volume = 10
freqmul = 1.0


[State 6061, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
trigger2 = AnimElem = 12
trigger3 = AnimElem = 18
trigger4 = AnimElem = 24
trigger5 = AnimElem = 30
trigger6 = AnimElem = 36
trigger7 = AnimElem = 42
value = S3100, 3
volume = -2

[State 6061, Explod]
type = Explod
trigger1 = time = 0
anim = 6067
ID = 6067
pos = 0,50
postype = p1  ;p2,front,back,left,right
bindtime = -1
removetime = -1
pausemovetime = 0
scale = .5,.5
sprpriority = 4
ownpal = 1


[State 6061, Fire Kicks]
type = HitDef
triggerall = (enemy,name!="Gill")
triggerall = (enemy,name!="Ghost Rider")
triggerall = (enemy,name!="Pyron")
triggerall = (enemy,name !="Iceman")
triggerall = (enemy,name !="Ice Man")
triggerall = (enemy,name !="Sasquatch")
triggerall = (enemy,name !="Nool")
trigger1 = (time%4) = 0
attr = A, HA
animtype  = hard
damage = 14, 5
getpower  = 0
priority  = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 4,8
sparkno = S8007
guard.sparkno = S8142
sparkxy = -10,-110
hitsound = S3100,4
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 100
ground.velocity = 0, -8
air.velocity = -.2, -7
air.hittime = 100
persistent = 1
envshake.time = 8
envshake.ampl = 5
palfx.time = 40
palfx.add = 40,-70, -200
palfx.mul = 256,256,256
palfx.sinadd = 40,30,0
Palfx.color = 0
palfx.invertall = 1
fall = 1
fall.recover = 0
air.fall = 1
kill = 0
sprpriority = 3

[State 6012, Fire Kicks]
type = HitDef
triggerall = (time%4) = 0
trigger1 = (enemy,name="Gill")
trigger2 = (enemy,name="Ghost Rider")
trigger3 = (enemy,name="Pyron")
attr = A, HA
animtype  = hard
damage = 10, 2
getpower  = 0
priority  = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 4,8
sparkno = S8007
guard.sparkno = S8142
sparkxy = -10,-110
hitsound = S3100,4
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 100
ground.velocity = 0, -8
air.velocity = -.2, -7
air.hittime = 100
persistent = 1
envshake.time = 8
envshake.ampl = 5
palfx.time = 30
palfx.add = 100,100,100
palfx.sinadd = -80,-80,-80,10
fall = 1
fall.recover = 0
air.fall = 1
kill = 0
sprpriority = 3


[State 6012, Fire Kicks]
type = HitDef
triggerall = (time%4) = 0
trigger1 = (enemy,name = "Iceman")
trigger2 = (enemy,name = "Ice Man")
trigger3 = (enemy,name = "Sasquatch")
trigger4 = (enemy,name = "Nool")
attr = A, HA
animtype  = hard
damage  = 18, 5
getpower  = 0
priority  = 7, hit
hitflag = MAF
;guardflag = L
pausetime = 4,8
sparkno = S8007
guard.sparkno = S8142
sparkxy = -10,-110
hitsound = S3100,4
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 100
ground.velocity = 0, -8
air.velocity = -.2, -7
air.hittime = 100
persistent = 1
envshake.time = 8
envshake.ampl = 5
palfx.time = 20
palfx.add = 100,100,100
palfx.mul = 256,256,256
palfx.sinadd = -80,-80,-80,10
palfx.invertall = 0
palfx.color = 256
fall = 1
fall.recover = 0
air.fall = 1
kill = 0
sprpriority = 3


[state 0,FireSparks]
type = helper
trigger1 = !numhelper(8100)
trigger1 = numtarget&&MoveHit = 1
trigger1 = target,movetype=H&&!target,time
trigger1 = var(48):=(target,ID)
name = "FireSparks"
id = 8100
stateno = 8100
helpertype = normal
postype = p2
pos = 0,60
ownpal = 1
keyctrl = 0
size.yscale = 1
size.xscale = 1
pausemovetime = 9999999
supermovetime = 9999999
ignorehitpause = 1
persistent = 0


[State 6012, 3]
type = ChangeState
trigger1 = animtime = 0
value = 6062
ctrl = 0

[State 6061, ChangeState]
type = ChangeState
triggerall = parent,movetype = H
trigger1 = AnimTime = 0
value = 6066
ctrl = 0

;---------------------------------------------------------------------------
;Champions of Red Earth - Mai-Ling recover
[Statedef 6062]
type    = A
movetype = I
physics = N
anim = 6062
sprpriority = 3

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0

[State 6062, RemoveExplod]
type = RemoveExplod
trigger1 = 1
id = 6067

[State 6062, VelSet]
type = VelSet
trigger1 = time > 0
x = 0.2


[State 6062, Gravity]
type = Gravity
trigger1 = 1

[State 6062, PlaySnd]
type = PlaySnd
trigger1 = time = 12
value = S40,0
freqmul = 1.0


[State 6062, ChangeState]
type = ChangeState
trigger1 = Vel Y > 0 && Pos Y >= -14
value = 6063
ctrl = 0

;---------------------------------------------------------------------------
;Champions of Red Earth - Mai-Lin Landing
[Statedef 6063]
type    = S
movetype = I
physics = N
anim = 6063
sprpriority = 3
velset = 0,0


[State 6063, PosSet]
type = PosSet
trigger1 = Time = 0
y = 0


[State 6063, PlaySnd]
type = PlaySnd
trigger1 = Time = 1
value = S52,0


[State 6063, Explod]
type = Explod
trigger1 = time = 0
anim = 8500
sprpriority = -5
postype = p1
pos = 0,0
bindtime = 1
ownpal = 1
id = 8500
scale = .5,.5
name = "Dust"
pausemovetime = 999999
supermovetime = 999999


[State 6063, ChangeAnim]
type = ChangeAnim
trigger1 = time = 30
value = 6064

[State 6063, ChangeState]
type = ChangeState
trigger1 = enemynear, stateno = 6033
trigger2 = Win
trigger2 = Helper(6070),stateno = 6073
value = 6065
ctrl = 0


[State 6063, ChangeState]
type = ChangeState
trigger1 = enemynear, movetype != H
value = 6066
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Mai-Ling Win
[Statedef 6065]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6065
sprpriority = 3


[State 6065, playsnd]
type = playsnd
trigger1 = animelem = 6
value = 100,0
volume = 255

[State 6065, playsnd]
type = playsnd
trigger1 = time = 10
value = 6000,11


[State 6065, 3]
type = ChangeState
trigger1 = root,NumExplod(9410) = 1
trigger2 = Time>180;80
value = 6066
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Mai-Lin Leaves
[Statedef 6066]
type  = S
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 6066
sprpriority = 3

[State 6066, VelSet]
type = VelSet
trigger1 = time > 0
x = -6

[State 6066, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S101,0


[State 6066, DestroySelf]
type = DestroySelf
trigger1 = backedgedist < -70

;---------------------------------------------------------------------------
; Champions of Red Earth - Tessa's Appearance
[Statedef 6070]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6070
sprpriority = 4

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 5

[State 6070, VelSet]
type = VelSet
trigger1 = time > 0
x = 7


[State 6070, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S101,0

[State 6070, PlaySnd]
type = PlaySnd
trigger1 = time = 10
value = 6000,7
volume = 10
freqmul = 1.0

[State 6070, Explod]
type = Explod
trigger1 = time%20 = 0
anim = 8552
sprpriority = 5
postype = p1
pos = -10,15
vel = 2,0
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
pausemovetime = 999999
supermovetime = 999999

[State 6070, 3]
type = ChangeState
trigger1 = p2bodydist X <= 50
value = 6071
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Tessa Special
[Statedef 6071]
type  = S
movetype = A
physics = N
;juggle  = 6
ctrl = 0
velset = 0,0
anim = 6071
sprpriority = 4


[State 6071, SuperPause]
type = SuperPause
trigger1 = time = 1
time = 25
anim = S9100
sound = S9100,0
pos = -28,-56


[State 6071, PlaySnd]
type = PlaySnd
trigger1 = animelem = 9
value = 6000,6
volume = 10
freqmul = 1.0


[State 6071, Helper]
type = Helper
trigger1 = animelem = 1
helpertype = normal ;player
name = "Bottle"
ID = 6075
stateno = 6075
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 6071, ChangeState]
type = ChangeState
trigger1 = time>120
trigger1 = animtime = 0
value = 6072
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Tessa Waiting
[Statedef 6072]
type    = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6072
sprpriority = 4


[State 6072, explod]
type = Explod
triggerall = parent, stateno = 6020
trigger1 = animelem = 1
ID = 6018
anim = 6076
postype = p1
pos = 100,-110
ownpal = 1
sprpriority = 7
removeongethit = 0
bindtime = 1
removetime = 1
scale = 1.1,1.1



[State 6072, 3]
type = ChangeState
trigger1 = enemynear, stateno = 6033
trigger2 = Win
trigger2 = animtime = 0
value = 6073
ctrl = 0

[State 6072, ChangeState]
type = ChangeState
trigger1 = enemynear, movetype != H
value = 6074
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Tessa Win
[Statedef 6073]
type  = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6073
sprpriority = 3



[State 6073, 3]
type = ChangeState
trigger1 = root,NumExplod(9410) = 1
trigger2 = Time>180;80
value = 6074
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Tessa Leaves
[Statedef 6074]
type    = S
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 6074
sprpriority = 4


[State 6074, VelSet]
type = VelSet
trigger1 = time > 0
x = -5.8


[State 6074, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S6000,8
freqmul = 1.1

[State 6074, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S101,0
;channel = -1

[State 6074, Explod]
type = Explod
trigger1 = time%20 = 0
anim = 8552
sprpriority = 5
postype = p1
pos = 10,15
vel = -2,0
facing = -1
bindtime = 1
ownpal = 1
id = 8550
name = "Dust"
pausemovetime = 999999
supermovetime = 999999


[State 6074, DestroySelf]
type = DestroySelf
trigger1 = backedgedist < -70
;---------------------------------------------------------------------------
; C.O.R.E - Tessa Special Bottle - Tessa Leaves
[Statedef 6075]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6075
sprpriority = 5


[State 6075, SprPriority]
type = SprPriority
trigger1 = animelem = 5
value = 2

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(1)>=0 && helper(6070),animelemtime(2)<0
value = 6075
elem = 1

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(1)>=0 && animelemtime(2)<0
time = 1
pos = -33,-48

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(2)>=0 && helper(6070),animelemtime(3)<0
value = 6075
elem = 2

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(2)>=0 && animelemtime(3)<0
time = 1
pos = 52,-39

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(3)>=0 && helper(6070),animelemtime(4)<0
value = 6075
elem = 3

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(3)>=0 && animelemtime(4)<0
time = 1
pos = 64,-62

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(4)>=0 && helper(6070),animelemtime(5)<0
value = 6075
elem = 4

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(4)>=0 && animelemtime(5)<0
time = 1
pos = 68,-74

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(5)>=0 && helper(6070),animelemtime(6)<0
value = 6075
elem = 5

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(5)>=0 && animelemtime(6)<0
time = 1
pos = 70,-80

[State 0, ChangeAnim]
type = ChangeAnim
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(6)>=0 && helper(6070),animelemtime(7)<0
value = 6075
elem = 6

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(6)>=0 && animelemtime(7)<0
time = 1
pos = 82,-85



[State 6075, ChangeState]
type = ChangeState
triggerall = helper(6070),stateno = 6071
trigger1 = helper(6070),animelemtime(7)>=0
value = 6076
ctrl = 0

;---------------------------------------------------------------------------
;C.O.R.E - Ice Cristal - Tessa Leaves
[Statedef 6076]
type   = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6076
sprpriority = 5

[State 6075, BindToParent]
type = BindToParent
triggerall = helper(6070),stateno = 6071
trigger1 = animelemtime(0)>=0 && animelemtime(6)<0
time = 1
pos = 82,-90


[State 6076, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S4200,0


[State 6076, Gravity]
type = Gravity
trigger1 = animelemtime(6) = 0


[State 6076, HitDef]
type = HitDef
trigger1 = time = 0
attr = S, HP
damage = 15, 5
priority = 7, hit
animtype = Back
guardflag = MA
hitflag = MAF
pausetime = 1, 14
guard.pausetime = 0, 13
sparkno = S8004
guard.sparkno = S8142
sparkxy = -10,0
hitsound = S2,6
guardsound = S3,0
ground.type = High
ground.velocity = -.5,0
ground.hittime  = 16
ground.slidetime  = 16
ground.cornerpush.veloff = 0
guard.velocity = 12.5
guard.hittime = 15
airguard.ctrltime = 39
air.velocity = -.5, -1.43
airguard.velocity = -.5, 0
envshake.time = 7
envshake.ampl = 4


[State 6071, Helper]
type = Helper
trigger1 = animelemtime(5)= 0
helpertype = normal ;player
name = "Sphere"
ID = 6077
stateno = 6077
pos = 30,-25
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = .6
size.yscale = .6

[State 6071, Helper]
type = Helper
trigger1 = animelemtime(5)= 20
helpertype = normal ;player
name = "Sphere"
ID = 6078
stateno = 6077
pos = 30,-25
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999
size.xscale = .6
size.yscale = .6

[State 6076, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;C.O.R.E - Ice Sphere - Tessa Special
[Statedef 6077]
type  = S
movetype = A
physics = N
juggle  = 0
ctrl = 0
velset = 0,0
anim = 6077
sprpriority = 6


[State 6077, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1


[State 6077, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


;DAMAGE ICE
[State 6077, Ice Burst]
type = HitDef
triggerall = (enemy,name !="Ghost Rider")
triggerall = (enemy,name !="Pyron")
triggerall = (enemy,name !="Enja")
triggerall = (enemy,name !="Kasuki")
triggerall = (enemy,name !="Blackheart")
triggerall = (enemy,name !="Sasquatch")
triggerall = (enemy,name !="Nool")
triggerall = (enemy,name !="Iceman")
triggerall = (enemy,name !="Ice Man")
triggerall = (enemy,name !="Gill")
triggerall = (enemy,name !="Suija")
triggerall = (enemy,name !="Sogetsu")
triggerall = (enemy,name !="Kula")
trigger1 = (Time%10) = 0
attr = S, HP
animtype  = hard
damage = 15, 1
priority  = 7, hit
hitflag = MAFP
;guardflag = L
pausetime = 1,10
sparkno = S8022
guard.sparkno = S8142
sparkxy = 0,0
hitsound = S4200,0
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 100
ground.velocity = 0, -4
air.velocity = 0, -4
air.hittime = 100
persistent = 1
fall = 1
fall.recover = 0
air.fall = 1
;p2stateno = 6031
Kill = 1
envshake.time = 3
envshake.ampl = 5
sprpriority = 6

[State 6077, Ice Burst]
type = HitDef
triggerall = (Time%10) = 0
trigger1 = (enemy,name ="Ghost Rider")
trigger2 = (enemy,name ="Pyron")
trigger3 = (enemy,name ="Enja")
trigger4 = (enemy,name ="Kasuki")
attr = S, HP
animtype  = hard
damage  = 20, 5
priority  = 7, hit
hitflag = MAFP
;guardflag = L
pausetime = 1,10
sparkno = S8022
guard.sparkno = S8142;s5570
sparkxy = 0,0
hitsound = S4200,0
guardsound = S3,0
ground.type = high
ground.slidetime = 30
ground.hittime  = 100
ground.velocity = 0, -4
air.velocity = 0, -4
air.hittime = 100
persistent = 1
fall = 1
fall.recover = 0
air.fall = 1
;p2stateno = 6031
Kill = 1
envshake.time = 3
envshake.ampl = 5
sprpriority = 6

[State 6077, Ice Burst]
type = HitDef
triggerall = (Time%10) = 0
trigger1 = (enemy,name ="Blackheart")
trigger2 = (enemy,name ="Sasquatch")
trigger3 = (enemy,name ="Nool")
attr = S, HP
animtype  = hard
damage = 12, 0
getpower  = 0
priority  = 7, hit
hitflag = MAFP
;guardflag = L
pausetime = 1,10
sparkno = S8022
guard.sparkno = S8142;s5570
sparkxy = 0,0
hitsound = S4200,0
guardsound = S3,0
ground.type = high
ground.slidetime = 20
ground.hittime  = 50
ground.velocity = 0, -4
air.velocity = 0, -4
air.hittime = 50
persistent = 1
fall = 1
fall.recover = 0
air.fall = 1
;p2stateno = 6031
Kill = 1
envshake.time = 3
envshake.ampl = 5
sprpriority = 6

[State 6077, Ice Burst]
type = HitDef
triggerall = (Time%10) = 0
trigger1 = (enemy,name ="Iceman")
trigger2 = (enemy,name ="Ice Man")
trigger3 = (enemy,name ="Gill")
trigger4 = (enemy,name ="Suija")
trigger5 = (enemy,name ="Sogetsu")
trigger6 = (enemy,name ="Kula")
attr = S, HP
animtype  = hard
damage  = -3, -2
getpower  = 0
priority  = 7, hit
hitflag = MAFP
;guardflag = L
pausetime = 1,5
sparkno = S8022
guard.sparkno = S8142;s5570
sparkxy = 0,0
hitsound = S4200,0
guardsound = S3,0
ground.type = high
ground.slidetime = 10
ground.hittime  = 20
ground.velocity = 0, -4
air.velocity = 0, -4
air.hittime = 20
persistent = 1
fall = 1
fall.recover = 0
air.fall = 1
;p2stateno = 6031
Kill = 1
envshake.time = 3
envshake.ampl = 5
sprpriority = 6

[State 4213, Ice TargetState]
type = TargetState
trigger1 = root, var(14) != 10
trigger1 = movehit
value = 5706
ignorehitpause = 1
persistent = 1

[State 4213, Ice FX]
type = Helper
trigger1 = root, var(14) != 10
trigger1 = movehit
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

[State 6077, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
; C.O.R.E - Opponent Hit
[Statedef 6030]
type    = S
movetype = H
physics = N
velset = 0,0;-13, -4
sprpriority = 1

[State 0, PosSet]
type = PosSet
trigger1 = time = 0
y = 0


[State 290, 1]
type = Changeanim2
Trigger1 = time = 0
value = 6030

[State 290, 1]
type = Changeanim
Trigger1 = time = 17
value = 5300

[State 0, CtrlSet]
type = CtrlSet
trigger1 = time = 80
value = 1

;---------------------------------------------------------------------------
; C.O.R.E - Opponent Frozen
[Statedef 6031]
type    = S
movetype= H
physics = N
velset = 0,0;-13, -4

 ;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
trigger1 = Time = 0
time = 20
add = 0,50,240
mul = 120,224,150
sinadd = 85,55,110,10
invertall = 1
color = 0


[State 290, 1]
type = Changeanim2
Trigger1 = time = 0
value = 6030


[State 0, ChangeState]
type = ChangeState
trigger1 = time = 15
value = 6032
ctrl = 0

;---------------------------------------------------------------------------
; C.O.R.E - Frozen Fall
[Statedef 6032]
type    = S
movetype= H
physics = N
velset = -3, -5

[State 6032, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .4

;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
trigger1 = Time = 0
time = 30
add = 0,50,240
mul = 120,224,150
sinadd = 85,55,110,10
invertall = 1
color = 0


[State 6032, 1]
type = Changeanim2
Trigger1 = time = 0
value = 6030


[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y >= 0
value = 6034
ctrl = 0
;anim =
;ignorehitpause =
;persistent =
;---------------------------------------------------------------------------
;C.O.R.E. - Opponent Bounce
[Statedef 6034]
type    = A
movetype= H
physics = N
velset = 0, -3


[State 6034, 1] ;Gravity
type = VelAdd
Trigger1 = 1
y = .31


[State 6034, 1]
type = Changeanim
Trigger1 = time = 0
value = 5050


[State 0, ChangeState]
type = ChangeState
trigger1 = time > 5 && pos Y >= 0
value = 6033
ctrl = 0

;---------------------------------------------------------------------------
; C.O.R.E - Floor
[Statedef 6033]
type = S
movetype = H
physics = S
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 =  time = 0
y = 0

[State 6032, 1]
type = Changeanim
Trigger1 = time = 0
value = 5110


[State 0, CtrlSet]
type = selfState
trigger1 = time = 80
value = 5110
;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6100]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6100
sprpriority = 2


[State 6100, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S2,800


[State 6100, TargetBind]
type = TargetBind
trigger1 = anim = 6100
time = 1
pos = 60,-25

[State 6101, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S11,0

[State 6100, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = time = 0
helpertype = normal ;player
name = "Blood1"
ID = 6130
stateno = 6130
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999



[State 6100, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = time = 5
trigger2 = time = 59
helpertype = normal ;player
name = "Blood6"
ID = 6135
stateno = 6135
pos = 0,0
postype = p2    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6100, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = time = 10
helpertype = normal ;player
name = "Blood7"
ID = 6136
stateno = 6136
pos = 0,0
postype = p2    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6100, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = time = 30
helpertype = normal ;player
name = "Blood8"
ID = 6137
stateno = 6137
pos = 0,0
postype = p2    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6100, Helper]
type = Helper
triggerall = var(28) = 1
trigger1 = time = 5
trigger2 = time = 10
trigger3 = time = 30
trigger4 = time = 59
helpertype = normal ;player
name = "Blood8"
ID = 8305
stateno = 8305
pos = 0,0
postype = p2    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6100, ChangeState 2]
type = ChangeState
trigger1 = time = 60
value = 6101+random%2
ctrl = 0

;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6101]
type = S
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6101
sprpriority = 2

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

[State 6101, TargetState]
type = TargetState
trigger1 = time = 0
value = 6110

[State 0, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 10
ampl = 4

[State 6101, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S2,9

[State 6101, PlaySnd]
type = PlaySnd
trigger1 = animelem = 2
value = S101,0


[State 6101, VelSet]
type = VelSet
trigger1 = animelem = 1
x = -8

[State 0, VelAdd]
type = VelAdd
trigger1 = animelemtime(1)>=0 && animelemtime(6)<0
x = .2

[State 6101, VelSet]
type = VelSet
trigger1 = animelem = 6
x = 0
y = 0



[State 6101, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 2
helpertype = normal ;player
name = "Blood2"
ID = 6131
stateno = 6131
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 6101, ChangeState 2]
type = ChangeState
trigger1 = animtime = 0
value = 6104
ctrl = 0
;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6102]
type = A
movetype = A
physics = N
ctrl = 0
velset = 0,0
anim = 6102
sprpriority = 2

[State 6102, EnvShake]
type = EnvShake
trigger1 = animelem = 1
time = 10
ampl = 4

[State 6102, PlaySnd]
type = PlaySnd
trigger1 = animelem = 1
value = S2,9

[State 6101, TargetState]
type = TargetState
trigger1 = time = 0
value = 6110


[State 6102, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S40,0
;channel = 1

[State 6102, VelSet]
type = VelSet
trigger1 = animelem = 1
x = -4
y = -8

[State 6102, VelAdd]
type = VelAdd
trigger1 = 1
x = .05
y = .3

[State 6102, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 1
helpertype = normal ;player
name = "Blood3"
ID = 6132
stateno = 6132
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6102, ChangeState 2]
type = ChangeState
trigger1 = pos y > 0 && vel y > 0
value = 6103
ctrl = 0
;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6103]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6103
sprpriority = 2

[State 6103, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0

[State 6103, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S41,0


[State 6103, Landing FX]
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

[State 6102, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 1
helpertype = normal ;player
name = "Blood4"
ID = 6133
stateno = 6133
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6103, ChangeState 2]
type = ChangeState
trigger1 = animtime = 0
value = 6104
ctrl = 0
;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6104]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6104
sprpriority = 2

[State 6104, VelSet]
type = VelSet
trigger1 = 1
x = 0
y = 0


[State 6104, Helper]
type = Helper
trigger1 = animelem = 3
helpertype = normal ;player
name = "Flame Soul"
ID = 6120
stateno = 6120
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

;Kenji

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = time = 0
helpertype = normal ;player
name = "Blood5"
ID = 6134
stateno = 6134
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelemtime(6)>0
trigger1 = time%3 = 0
helpertype = normal ;player
name = "Blood12"
ID = 6140
stateno = 6140
pos = -50+random%50,5+random%10
postype = p1    ;p2,front,back,left,right
facing = ifelse(random<500,1,-1)
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelemtime(6)>0
trigger1 = time%5 = 0
helpertype = normal ;player
name = "Blood12"
ID = 6140
stateno = 6140
pos = -50+random%50,8+random%10
postype = p1    ;p2,front,back,left,right
facing = ifelse(random<500,1,-1)
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 9
helpertype = normal ;player
name = "Blood12"
ID = 6145
stateno = 6145
pos = -20+random%20,8+random%10
postype = p1    ;p2,front,back,left,right
facing = ifelse(random<500,1,-1)
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, ChangeState 2]
type = ChangeState
trigger1 = time = 150
value = 6105
ctrl = 0
;---------------------------------------------------------------------------
; Champions of Red Earth - Enmazuki
[Statedef 6105]
type = S
movetype = A
physics = S
ctrl = 0
velset = 0,0
anim = 6105
sprpriority = 2


[State 0, TargetState]
type = TargetState
trigger1 = animelem = 5
value = 6111
ID = -1

[State 6101, PlaySnd]
type = PlaySnd
trigger1 = animelem = 5
value = S2,5

[State 6002, PlaySnd]
type = PlaySnd
trigger1 = animelem = 7
value = S2,10

[State 6002, TargetLifeAdd]
type = TargetLifeAdd
trigger1 = animelem = 5
value = -378
kill = 1

[State 6002, EnvShake]
type = EnvShake
trigger1 = animelem = 5
time = 15
ampl = 4


[State 6002, Explod]
type = Explod
trigger1 = animelem = 5
anim = 8022
ID = 8022
pos = 0,enemynear, pos y + enemynear, const(size.mid.pos.y)
postype = p2  ;p2,front,back,left,right
bindtime = -1
removetime = -2
pausemovetime = 9999
scale = 1,1
sprpriority = 10
ontop = 1
shadow = 0,0,0
ownpal = 1

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 5
helpertype = normal ;player
name = "Blood6"
ID = 6135
stateno = 6135
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 6
helpertype = normal ;player
name = "Blood7"
ID = 6136
stateno = 6136
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 6
helpertype = normal ;player
name = "Blood8"
ID = 6137
stateno = 6137
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 7
helpertype = normal ;player
name = "Blood7"
ID = 6138
stateno = 6138
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999

[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 8
helpertype = normal ;player
name = "Blood9"
ID = 6139
stateno = 6139
pos = 0,0
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[State 6104, Helper]
type = Helper
triggerall = var(27) = 1
trigger1 = animelem = 5
helpertype = normal ;player
name = "Blood13"
ID = 6146
stateno = 6146
pos = -20+random%20,0
postype = p1    ;p2,front,back,left,right
facing = ifelse(random<500,1,-1)
ownpal = 1
supermovetime = 9999
pausemovetime = 9999


[state 8300,Eletric Sparks]
type = helper
triggerall = var(28) =1
trigger1 = !numhelper(8300)
trigger1 = animelem = 5
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

[State 6002, ChangeState 2]
type = ChangeState
trigger1 = enemynear, stateno = 5100
trigger2 = time = 250
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;C.O.R.E. - Opponent Bounce
[Statedef 6107]
type = A
movetype = H
physics = N
velset = 0,0



[State 6034, 1]
type = Changeanim
Trigger1 = time = 0
value = 5002

[State 5706, 0]
type = PalFX
triggerall = enemynear,var(28) = 1
trigger1 = time>20
trigger1 = gametime%30 < 15
time = 10
add = 100,100,180
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 0

;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
triggerall = enemynear,var(28) = 1
trigger1 = time>20
trigger1 = gametime%30 > 14
time = 10
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 0

;---------------------------------------------------------------------------
; C.O.R.E - Floor
[Statedef 6110]
type = S
movetype = H
physics = S
velset = 0,0

[State 6110, PosSet]
type = PosSet
trigger1 = time = 0
y = 0

[State 6032, 1]
type = Changeanim2
Trigger1 = time = 0
value = 6110

;---------------------------------------------------------------------------
; C.O.R.E - Floor
[Statedef 6111]
type = S
movetype = H
physics = S
velset = 0,0

[State 0, PosSet]
type = PosSet
trigger1 =  time = 0
y = 0

[State 6032, 1]
type = Changeanim2
Trigger1 = time = 0
value = 6111

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 1
x = -5
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 2
x = -4
y = 0

[State 0, VelSet]
type = VelSet
trigger1 = animelem = 3
x = -2
y = 0

[State 5706, 0]
type = PalFX
triggerall = enemynear,var(28) = 1
trigger1 = gametime%30 < 15
time = 10
add = 100,100,180
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 0


;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
triggerall = enemynear,var(28) = 1
trigger1 = gametime%30 > 14
time = 10
add = 100,100,100
mul = 256,256,256
sinadd = -80,-80,-80,5
invertall = 0
color = 0


[State 0, CtrlSet]
type = selfState
trigger1 = time = 90
value = 5100
;---------------------------------------------------------------------------
;Fatalities Soul
[Statedef 6120]
physics = N
ctrl = 0
velset = 0,0
anim = 6120
sprpriority = 4

[State 6120, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6103
trigger1 = parent,animelemtime(3)>=0 && animelemtime(4)<0
time = 1
pos = 43,-74

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(4)>=0 && animelemtime(5)<0
time = 1
pos = 36,-95

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(5)>=0 && animelemtime(6)<0
time = 1
pos = -5,-93

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(6)>=0 && animelemtime(7)<0
time = 1
pos = -5,-93

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(7)>=0 && animelemtime(8)<0
time = 1
pos = -5,-97

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(8)>=0 && animelemtime(9)<0
time = 1
pos = -5,-97

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(9)>=0 && animelemtime(10)<0
time = 1
pos = -5,-93

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(10)>=0 && animelemtime(11)<0
time = 1
pos = -5,-93

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(11)>=0 && animelemtime(12)<0
time = 1
pos = -5,-97

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6104
trigger1 = parent,animelemtime(12)=0
time = 1
pos = -5,-97

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(1)>=0 && animelemtime(2)<0
time = 1
pos = -3,-101

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(2)>=0 && animelemtime(3)<0
time = 1
pos = -1,-114

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(3)>=0 && animelemtime(4)<0
time = 1
pos = -5,-113

[State 6120, BindToParent]
type = BindToParent
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(4)>=0 && animelemtime(5)<0
time = 1
pos = 0,-113


[State 6120, SprPriority]
type = SprPriority
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(3)>=0 && animelemtime(5)<0
value = -4


[State 6002, ChangeState 2]
type = ChangeState
triggerall = parent,stateno = 6105
trigger1 = parent,animelemtime(5)>=0
value = 6121
;---------------------------------------------------------------------------
;Fatalities Soul End
[Statedef 6121]
physics = N
ctrl = 0
velset = 0,0
anim = 6121
sprpriority = 4

[State 6120, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6120, BindToParent]
type = BindToParent
trigger1 = time = 0
time = 1
pos = -7,-79


[State 0, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Fatalities Blod 1
[Statedef 6130]
physics = N
ctrl = 0
velset = 0,0
anim = 6130
sprpriority = 4


[State 6130, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow


[State 6130, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6130, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0


[State 6130, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)


[State 6130, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H
trigger2 = parent,stateno != 6100

;---------------------------------------------------------------------------
;Fatalities Blod 2
[Statedef 6131]
physics = N
ctrl = 0
velset = 0,0
anim = 6131
sprpriority = 4

[State 6131, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6131, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 6131, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6131, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H
trigger2 = parent,stateno != 6101
;---------------------------------------------------------------------------
;Fatalities Blod 3
[Statedef 6132]
physics = N
ctrl = 0
velset = 0,0
anim = 6132
sprpriority = 4

[State 6132, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6132, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(1)>=0 && parent,animelemtime(2)<0
value = 6132
elem = 1

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(2)>=0 && parent,animelemtime(3)<0
value = 6132
elem = 2

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(3)>=0 && parent,animelemtime(4)<0
value = 6132
elem = 3

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(4)>=0 && parent,animelemtime(5)<0
value = 6132
elem = 4

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(5)>=0 && parent,animelemtime(6)<0
value = 6132
elem = 5

[State 6132, ChangeAnim]
type = ChangeAnim
trigger1 = parent,stateno = 6102
trigger1 = parent,animelemtime(6)=0
value = 6132
elem = 6

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1

[State 6132, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H
trigger2 = parent,stateno != 6102

;---------------------------------------------------------------------------
;Fatalities Blod 4
[Statedef 6133]
physics = N
ctrl = 0
velset = 0,0
anim = 6133
sprpriority = 4

[State 6132, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6132, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6132, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H
trigger2 = parent,stateno != 6103

;---------------------------------------------------------------------------
;Fatalities Blod 5
[Statedef 6134]
physics = N
ctrl = 0
velset = 0,0
anim = 6134
sprpriority = 4

[State 6134, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

[State 6134, BindToParent]
type = BindToParent
trigger1 = 1
time = -1
facing = 1
pos = 0,0

[State 6134, ChangeAnim]
type = ChangeAnim
trigger1 = 1
value = anim
elem = parent, AnimElemNo(0)

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6134, DestroySelf]
type = DestroySelf
trigger1 = parent, movetype = H
trigger2 = parent,stateno != 6104
trigger3 = parent,stateno = 6104
trigger3 = parent,animelem >=4
;---------------------------------------------------------------------------
;Fatalities Blod 6
[Statedef 6135]
physics = N
ctrl = 0
velset = 0,0
anim = 6135
sprpriority = 6

[State 6135, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6135, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;---------------------------------------------------------------------------
;Fatalities Blod 7
[Statedef 6136]
physics = N
ctrl = 0
velset = 0,0
anim = 6136
sprpriority = 6

[State 6136, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6136, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Fatalities Blod 8
[Statedef 6137]
physics = N
ctrl = 0
velset = 0,0
anim = 6137
sprpriority = 5

[State 6137, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6137, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Fatalities Blod 9
[Statedef 6138]
physics = N
ctrl = 0
velset = 0,0
anim = 6138
sprpriority = 6

[State 6138, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6138, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Fatalities Blod 10
[Statedef 6139]
physics = N
ctrl = 0
velset = 0,0
anim = 6139
sprpriority = 6

[State 6139, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6139, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;---------------------------------------------------------------------------
;Fatalities Blod 11
[Statedef 6140]
physics = N
ctrl = 0
velset = 0,0
anim = 6140
sprpriority = -3

[State 6140, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6140, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;---------------------------------------------------------------------------
;Fatalities Blod 12
[Statedef 6145]
physics = N
ctrl = 0
velset = 0,0
anim = 6145
sprpriority = -3


[State 6134, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6134, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0

;---------------------------------------------------------------------------
;Fatalities Blod 13
[Statedef 6146]
physics = N
ctrl = 0
velset = 0,0
anim = 6146
sprpriority = -3


[State 6136, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6136, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
;---------------------------------------------------------------------------
;Fatalities Blod 14
[Statedef 6147]
physics = N
ctrl = 0
velset = 0,0
anim = 6147
sprpriority = 6


[State 6136, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noshadow

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Roxo
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Shuma Gorath")
trigger2 = (enemy,name = "Thanos")
time = -1
add = 0,-200,0
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Verde
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Amingo")
trigger2 = (enemy,name = "Hulk")
trigger3 = (enemy,name = "Nool")
time = -1
add = 0,200,50
mul = 20,120,24
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Preto
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Bishamon")
trigger2 = (enemy,name = "Zabel")
trigger3 = (enemy,name = "Blackheart")
trigger4 = (enemy,name = "Venom")
trigger5 = (enemy,name = "Nrvnqsr Chaos")
time = -1
add = 30,30,30
mul = 256,256,256
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz] ;Branco
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Silver Surfer")
trigger2 = (enemy,name = "Iceman")
trigger3 = (enemy,name = "Gill")
trigger4 = (enemy,name = "Silver Surf")
time = -1
add = 150,150,150
mul = 256,256,256
color = 0
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 8200, PalFXWiz];marrom
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Ochamaro")
trigger2 = (enemy,name = "Taros")
trigger3 = (enemy,name = "Neo Dio")
time = -1
add = -20,-20,-20
mul = 250,224,120
color = 0
ignorehitpause = 1

;Generated by Fighter Factory PalFX Editor
[State 8204, PalFXWiz]
type = PalFX
triggerall = time >=0
trigger1 = (enemy,name = "Majin Buu")
trigger2 = (enemy,name = "Buu")
time = -1
add = 70,236,120
mul = 252,2,252
color = 256
color = 0
ignorehitpause = 1


[State 6136, DestroySelf]
type = DestroySelf
trigger1 = animtime = 0
