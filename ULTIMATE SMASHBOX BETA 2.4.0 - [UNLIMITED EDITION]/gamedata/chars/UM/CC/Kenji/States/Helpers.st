;===============================================================================
;=============================< HELPER STATES >=================================
;===============================================================================
;Pal Select
[Statedef 256]
physics = N
anim = 9700
velset = 0,0
sprpriority=99999
 
[State 256, PosSet]
type = PosSet
trigger1 =!time 
x = root,facing*-90
y = 10
ignorehitpause = 1

[State 256, AS]
type=assertspecial
trigger1=1
flag=intro
flag2=noshadow

[State 256, Reset]
type=varset
trigger1=!time
var(29)=200

[State 256, Pal]
type = varset
trigger1 = !time
var(40) = root,palno

[State 256, Varset]
type = varset
trigger1 = var(40)<1||var(40)>22
var(40) = 1+(var(40)<1)*5

[State 256, PlaySnd]
type = PlaySnd
trigger1 =var(10)=2 
value = S256,0
channel = 20

[State 256, PlaySnd]
type = PlaySnd
triggerall = ishelper(256)
trigger1 = root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2 = var(29)<=5
value = S256,1
channel = 20
persistent =0 

[State 256, Explod]
type = Explod
trigger1 = !time
anim = 9710
ID = 9710
pos = 0,-14
postype = p1  ;p2,front,back,left,right
bindtime = 1
removetime = -1
scale = .25,.25
sprpriority = 9999
ontop = 1
ownpal = 1

[State 256, Explod]
type = Explod
trigger1 = !time
anim = 9711
ID = 9711
pos = 0,14
postype = p1  ;p2,front,back,left,right
bindtime = 1
removetime = -1
scale = .25,.25
sprpriority = 9999
ontop = 1
ownpal = 1

[State 256, Countdown]
type = VarAdd
trigger1 =1 
var(29)=-1

[State 256, Countdown]
type = VarAdd
trigger1=!var(10)&&var(29)<150
trigger1=root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(29)=25

[State 256, Varadd]
type = varadd
trigger1 = !var(10)
trigger1 = root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd"
var(40) = 1-(root,command="holddown"||root,command="holdback"&&facing=1||root,command="holdfwd"&&facing=-1)*2

[State 256, Varadd]
type = varadd
trigger1 =(root,command="holdup"||root,command="holddown"||root,command="holdback"||root,command="holdfwd")&&!var(10)||var(10)
var(10) = 1

[State 256, Varset]
type = varset
trigger1 = !time||var(10)>=17
var(10) = 0


[State 256, RemoveExplod]
type = RemoveExplod
triggerall = ishelper(256)
trigger1 = root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2 = var(29)<=0
trigger3 = root,AILevel

[State 256, End]
type = destroyself
triggerall = ishelper(256)
trigger1 = root,command="a"||root,command="b"||root,command="c"||root,command="x"||root,command="y"||root,command="z"||root,command="s"||roundstate=2
trigger2 = var(29)<=0
trigger3 = root,AILevel


;---------------------------------------------------------------------------
;Empty
[Statedef 258]
physics = N
velset = 0,0
ctrl = 0
anim = 9999

[State 258, End]
type=destroyself
trigger1=Roundstate>=2


;-------------------------------------------------------------------------------
[Statedef 5319]
type=A
movetype=H
physics=N
velset=0,0
anim=5012;5012
[State 5319, grav]
type=veladd
trigger1=anim!=5030
y=gethitvar(yaccel)
[State 5319, screen]
type=screenbound
trigger1=1
value=1
movecamera=0,1
[State 5319, push]
type=playerpush
trigger1=1
value=0
[State 5319, vel]
type=hitvelset
trigger1=anim!=5030
x=1
y=1
persistent=0
[State 5319, anim]
type=changeanim
trigger1=vel y<=5
value=5012
[State 5319, anim]
type=changeanim
trigger1=vel y>5&&selfanimexist(5035)
trigger2=anim=5035&&!animtime
value=ifelse((anim=5012),5035,5050)
[State 5319, end]
type=changestate
trigger1=vel y<=5&&(backedgebodydist<=0||frontedgebodydist<=0)
value=5320
[State 5319, end]
type=selfstate
trigger1=vel y>0&&pos y>=0
value=5100

;----------2
[Statedef 5320]
type=A
movetype=H
physics=N
ctrl=0

[State -2, PlaySnd]
type =PlaySnd
trigger1 = time = 0
trigger2 = p2MoveType != H
value = 100,15

[State 5320, screen]
type=screenbound
trigger1=1
value=1
movecamera=0,1
[State 5320, push]
type=playerpush
trigger1=1
value=0
[State 5320, pos]
type=posadd;posset
trigger1=1
x=ifelse((frontedgebodydist>backedgebodydist),backedgebodydist,frontedgebodydist);-160*facing
[State 5320, freeze]
type=posfreeze
trigger1=1
value=1
[State 5320, grav]
type=veladd
trigger1=1
y=gethitvar(yaccel)
[State 5320, fx]
type=playsnd
trigger1=!time
value=f7,0
[State 5320, shake]
type=envshake
trigger1=!time
time=12
freq=90
ampl=6
[State 5320, end]
type=changestate
trigger1=!time
value=5321

;-----------3
[Statedef 5321]
type=A
movetype=H
physics=N
velset=0,0
anim=5030

[State 5321, screen]
type=screenbound
trigger1=pos x!=[-80,80]
value=1
movecamera=0,1
[State 5321, push]
type=playerpush
trigger1=1
value=0
[State 15321, anim]
type=changeanim
trigger1=anim!=5052&&selfanimexist(5052)
value=5052
[State 5321, anim]
type=changeanim
trigger1=anim=5030&&!animtime&&selfanimexist(5035)
trigger2=anim=5035&&!animtime
value=ifelse((anim=5030),5035,5050)
[State 5321, turn]
type=turn
trigger1=!time
[State 5321, grav]
type=veladd
trigger1=1
y=.35
[State 5321, vel]
type=velset
trigger1=!time
x=-3
y=-6
persistent=0
[State 5321, end]
type=selfstate
trigger1=vel y>0&&pos y>=0
value=5100
;------------------------------------------------------------------------------
;Intro TURNS
[StateDef 6900]
type = A
anim = 42
velSet = 0,0
ctrl = 0

[State 6900, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6900, ScreenBound]
type = ScreenBound
trigger1 = 1
value = 0
moveCamera = 0,0
ignoreHitPause = 1

[State 6900, Camera Helper]
type = Helper
trigger1 = !NumHelper(8999)
helpertype = Normal
stateNo = 8999
ID = 8999
name = "Camera"
posType = P1

[State 6900, PosSet]
type = PosSet
trigger1 = !Time
x = (-320 + abs(pos x)) * Facing

[State 6900, VelSet]
type = VelSet
trigger1 = !Time
x = (Helper(8999), RootDist x) / -40.0
y = -10.25

[State 6900, VelAdd]
type = VelAdd
trigger1 = 1
y = 0.5

[State 6900, End]
type = ChangeState
trigger1 = Time
trigger1 = pos y >=0 -vel y
value = 6901

;------------------------------------------------------------------------------
;Intro Landing
[StateDef 6901]
type = S
physics = S
anim = 6901
velSet = 0,0

[State 6901, Assert: Intro]
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 6901, PosSet]
type = PosSet
trigger1 = !Time && NumHelper(8999)
x = ceil(Helper(8999), pos x)



[State 6901, End]
type = ChangeState
trigger1 = !AnimTime
value = 0

;---------------------------------------------------------------------------
;CAMERA FOCUS
[Statedef 7100]
type=S
physics =S
anim=0
ctrl=0

[state 6001,TURN]
type=turn
trigger1=ishelper(7100)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type=VelSet
trigger1=parent,pos X > 0
x=Ifelse(facing=1,4,-4)

[State 6001,vel]
type=VelSet
trigger1=parent,pos X < 0
x=Ifelse(facing=1,-4,4)

[State 6001,vel]
type=VelSet
trigger1=parent,pos X=[-5,5]
x=0

[State 6001, WIDTH]
type=Width
trigger1=1
value=1,1

[State 6001, NHB]
type=NotHitBy
trigger1=1
value=SCA
time=1

[State 6001,AS]
type=AssertSpecial
Trigger1=1
flag=invisible
flag2=noshadow

[State 6001,Bound]
type=ScreenBound
trigger1 =1
value =1
movecamera=320,0

[State 6001,push]
type=PlayerPush
trigger1 =1
value=0

[State 6001, Destroyself]
type=destroyself
trigger1=Time=50
trigger1=enemy, Life >= 1
trigger2=numhelper(7100)>=2

;---------------------------------------------------------------------------
;CAMERA FOCUS 2
[Statedef 7101]
type=S
physics =S
anim=9999
ctrl=0

[state 6001,TURN]
type=turn
trigger1=ishelper(7101)
trigger1=facing!=root,facing
ignorehitpause=1

[State 6001,vel]
type=VelSet
trigger1=P2BodyDist X > 0
x=Ifelse(facing=1,-4,4)

[State 6001,vel]
type=VelSet
trigger1=P2BodyDist X < 0
x=Ifelse(facing=1,4,-4)

[State 6001,vel]
type=VelSet
trigger1=P2BodyDist X = [-5,5]
x=0

[State 6001, WIDTH]
type=Width
trigger1=1
value=1,1

[State 6001, NHB]
type=NotHitBy
trigger1=1
value=SCA
time=1

[State 6001,AS]
type=AssertSpecial
Trigger1=1
flag=invisible
flag2=noshadow

[State 6001,Bound]
type=ScreenBound
trigger1 =1
value =1
movecamera=320,0

[State 6001,push]
type=PlayerPush
trigger1 =1
value=0

[State 6001, Destroyself]
type=destroyself
trigger1=Time=50
trigger1=enemy, Life >= 1
trigger2=numhelper(7101)>=2

;======================== BURN FX =============================
[Statedef 7180]
physics=N
velset=0,0
anim=9741
sprpriority=4

[State 7180, assert]
type=assertspecial
trigger1= 1
flag=noshadow
ignorehitpause=1

[State 7180, flames]
type=explod
trigger1= 1
anim=7180
ID=7180
sprpriority=3
postype=p2
vel=-.2,-.75
pos=(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))+(ifelse((enemynear,statetype != A),-5,10))
random=40,40;40,40;50,40
removetime=-2
scale=(.3-(.001*time)),(.3-(.001*time))
ownpal=0

[State 0, ModifyExplod]
type = ModifyExplod
trigger1 = 1;numexplod(7180)
ID = 7180
trans=addalpha
alpha=220,256

[State 7180, pos]
type=posadd
trigger1= 1
x=ceil(p2dist x)
y=ceil(p2dist y)

[State 7180, end]
type=destroyself
trigger1= time>=(ifelse(enemynear,statetype != A ,30,120))
trigger2= enemynear,ctrl || (enemynear,movetype!=H) || (enemynear,statetype=L)
trigger3 = (root,stateno = [200,999]) && (root,movecontact)
;trigger4 = (root,stateno = [2000,2999]) && (root,movecontact)
;trigger4 = (root,stateno = [3000,3999]) && (root,movecontact)




;======================================================================================
;--------------------------------------------------------------------------------------
;Ice Helper
;Vars 0 and 1 = x/y offset
;Var(2) = destroyself

[Statedef 8060]
type = S
physics = N
sprpriority = 1

[State 8060, VarSet]
type = VarSet
trigger1 = time = 0
var(0) = random%11 - 5

[State 8060, VarSet]
type = VarSet
trigger1 = time = 0
var(1) = random%15 - 7

[State 8060, ChangeAnim]
type = ChangeAnim
trigger1 = time = 0
value = 8060 + random%4

[State 8060, Bind]
type = PosAdd
trigger1 = 1
x = p2dist x + var(0) - ifelse((enemynear, anim = [5000, 5002]), 0, 10) + enemynear, const(size.mid.pos.x)
y = p2dist y + var(1) + enemynear, const(size.mid.pos.y)

[State 8060, VarSet]
type = VarSet
trigger1 = 1
var(2) = 0

[State 8060, VarSet]
type = VarSet
trigger1 = root, numhelper(8060) > 2
trigger1 = time > 2
var(2) = 1

[State 8060, VarSet]
type = VarSet
trigger1 = p2movetype != H
trigger2 = enemynear, stateno != [5706, 5707]
trigger3 = enemynear, stateno = 5706
trigger3 = p2statetype != S
trigger4 = enemynear, stateno = 5707
trigger4 = p2statetype != A
var(2) = 2

[State 8060, VarAdd]
type = VarSet
trigger1 = !var(2)
var(3) = 0

[State 8060, VarAdd]
type = VarAdd
trigger1 = var(2)
var(3) = 1

[State 8060, PlaySnd]
type = PlaySnd
trigger1 = var(3) = 2
value = 8060, 0

[State 8060, Explod]
type = Explod
trigger1 = var(3) = 2
anim = 8064 + random%3
id = 8064
vel = 3, 4
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = var(3) = 2
anim = 8064 + random%3
id = 8064
bindtime = 1
vel = 4, -3
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = var(3) = 2
anim = 8067 + random%3
id = 8064
vel = -3, 4
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, Explod]
type = Explod
trigger1 = var(3) = 2
anim = 8067 + random%3
id = 8064
bindtime = 1
vel = -4, -3
sprpriority = 2
pausemovetime = 999999
supermovetime = 999999

[State 8060, DestroySelf]
type = DestroySelf
trigger1 = var(3) > 1

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;========================<FIRE SPARKS LARGE ATACK>==============================
;-------------------------------------------------------------------------------
;FIRE SPARKS STRONG
[Statedef 8100]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1


[State 8100,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[state 8100,varset]
type = varset
trigger1 = time = 0
var(48)= parent,var(48)
ignorehitpause = 1
persistent = 1

[State 8100,VarSet]
type = VarSet
trigger1 = time = 0
var(9) = parent,var(9)
ignorehitpause = 1


[State 8100,face]
type = turn
trigger1 = playerIDexist(var(48))
trigger1 = facing!=(playerID(var(48)),facing)


[State 8100,PlaySnd Squirt]
type = PlaySnd
trigger1 = gametime%20 = 0
value = S8100,0
volume = 250
;channel = 2
ignorehitpause = 1
persistent = 1


[State 8100,bind]
type = posset
trigger1 = playerIDexist(var(48))
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)+(playerID(var(48)),const(size.mid.pos.y))

[State 8100,bind]
type = posset
trigger1 = playerIDexist(var(48))
trigger1 = playerID(var(48)),statetype=L
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y) ;- 20


[State 8100,fire]
type = explod
trigger1 = playeridexist(var(48))
trigger1 = gametime%1=0
anim = 8100
id = 8100
pos = -30-(abs(const(size.mid.pos.x)))+random%50,20-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)

[State 8105,fire]
type = explod
trigger1 = playeridexist(var(48))
trigger1 = gametime%2=0
anim = 8100
id = 8100
pos = -10-(abs(const(size.mid.pos.x)))+random%50,-5-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = .6,.6

[State 8100,fire]
type = explod
triggerall = var(9)>0
trigger1 = enemynear,movetype=H
trigger1 = gametime%1=0
Anim = 8100
id = 8100
pos = -30-(abs(const(size.mid.pos.x)))+random%50,35-abs(const(size.mid.pos.y))
bindtime = 1
postype = p1
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)

[State 1510, Button Detect Damage]
type = VarSet
trigger1= !Time && !PrevStateNo
var(22) = Root,var(22)

[State 8100, Flames]
type = helper
;triggerall = (enemy,name!="Gill")
;triggerall = (enemy,name!="Ghost Rider")
;triggerall = (enemy,name!="Pyron")
;triggerall = (enemy,name!="Enja")
;triggerall = (enemy,name!="Kasuki")
triggerall = var(22) != 3
trigger1 = Time = 0
helpertype = normal
stateno = 8110
ID = 8110
name = "Flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0


[State 8100,removeprojectile]
type = destroyself
trigger1 = time>600
trigger2 = !playerIDexist(var(48))


[State 8100,remove]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])

;-------------------------------------------------------------------------------
;========================<FIRE SPARKS MINIMUM ATACK>============================
;-------------------------------------------------------------------------------
;FIRE SPARKS LIGHT
[Statedef 8105]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1


[State 8105,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 8105,PlaySnd Squirt]
type = PlaySnd
trigger1 = time = 0
value = S8100,1
volume = 250
;channel = 2
ignorehitpause = 1
persistent = 1

[State 8105,Fire]
type =  explod
trigger1 = gametime%3 = 0
anim = 8100
id = 8105
pos = -30-(abs(const(size.mid.pos.x)))+random%50,-40-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
vfacing  = IfElse(random<499,1,-1)
bindtime = 1
postype = p2
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)

[State 8105,Fire 2]
type = explod
triggerall = (enemy,name!="Gill")
triggerall = (enemy,name!="Ghost Rider")
triggerall = (enemy,name!="Pyron")
triggerall = (enemy,name!="Enja")
triggerall = (enemy,name!="Kasuki")
trigger1 = gametime%2=0
anim = 8100
id = 8105
pos = ifelse((Random < 500),-30,-20)-(abs(const(size.mid.pos.x)))+random%50,ifelse((Random < 500),-40,-30)-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
bindtime = -1
postype = p2
ownpal = 1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)



[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = 8115
postype = p2
pos = ifelse((Random < 500),5,-5)-(abs(const(size.mid.pos.x)))+random%50,ifelse((Random < 500),-10,-20)-(abs(const(size.mid.pos.y)))+random%50
bindtime = -1
removetime = -2
ownpal = 1
sprpriority = 2

[State 1000, Explod]
type = Explod
trigger1 = time = 0
anim = 8115
postype = p2
pos = ifelse((Random < 500),-30,-20)-(abs(const(size.mid.pos.x)))+random%50,ifelse((Random < 500),-50,-30)-(abs(const(size.mid.pos.y)))+random%50
bindtime = -1
removetime = -2
ownpal = 1
sprpriority = 2


[State 8105, destroyself]
Type = destroyself
trigger1 = time >= 30

;-------------------------------------------------------------------------------
;======================<FLAMES SPARKS SHOCK ATACK>==============================
;-------------------------------------------------------------------------------
;FLAMES SPARKS SHOCK
[Statedef 8110]
physics = N
velset = 0,0
anim = 9999
sprpriority = 4


[State 8105,PlaySnd Squirt]
type = PlaySnd
trigger1 = time = 0
value = S8100,1
volume = 250
;channel = 2
ignorehitpause = 1
persistent = 1


[State 8110, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 8110, 1]
type = Explod
trigger1 = NumExplod(8110)<=0
anim = 8110
id = 8110
sprpriority = 4
postype = p2
pos =(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))-20
random = 0,20
ownpal = 1
bindtime = 9999
pausemovetime = -1
facing = -1

[State 8110, 2]
type = Explod
trigger1 = NumExplod(8110)<=0
anim = 8115
id = 8110
sprpriority = 1
postype = p2
;pos=(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))+10
pos = -20,-60
random = 20,20
ownpal = 1
bindtime = 9999
pausemovetime = -1
facing = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)

[State 8110, 3]
type = Explod
trigger1 = NumExplod(8110) <=0
anim = 8115
id = 8110
sprpriority = 4
postype = p2
pos = -10,-50
random = 50,50
ownpal = 1
bindtime = 9999
pausemovetime = -1

[State 8110, 4]
type = Explod
trigger1 = NumExplod(8110) <=0
anim = 8115
id = 8110
sprpriority = 4
postype = p2
pos = -10,-50
random = 50,50
ownpal = 1
bindtime = 9999
pausemovetime = -1
scale = ifelse((Random < 500),.6,.5),ifelse((Random < 500),.6,.5)

[State 8110, 5]
type = Explod
trigger1 = NumExplod(8110) <=0
anim = IfElse(random<499,8110,8115)
id = 8115
sprpriority = -1
postype = p2
pos = -10,-50
random = 50,50
ownpal = 1
bindtime = 9999
pausemovetime = -1


[State 8110, pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)


[State 8110, end]
type = destroyself
trigger1 = time>=2
trigger2 = enemynear,ctrl||(enemynear,movetype!=H)||(enemynear,statetype=L)

;-------------------------------------------------------------------------------
;Fire Sparks
[Statedef 8120]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
anim = 9999;8120

[state 8120,varset]
type = varset
trigger1 = time = 0
var(48) = parent,var(48)
ignorehitpause = 1
persistent = 1

[State 8120,bind]
type = posset
trigger1 = playerIDexist(var(48))
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)+(playerID(var(48)),const(size.mid.pos.y))

[State 8120,bind]
type = posset
trigger1 = playerIDexist(var(48))
trigger1 = playerID(var(48)),statetype=L
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y) ;- 20

[State 8120,face]
type = turn
trigger1 = playerIDexist(var(48))
trigger1 = facing!=(playerID(var(48)),facing)

[State 8120,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 8120,VarSet]
type = VarSet
trigger1 = time = 0
var(9) = parent,var(9)
ignorehitpause = 1

[State 8120,fire]
type = explod
trigger1 = playeridexist(var(48))
trigger1 = gametime%1=0
Anim = 8105
id = 8120
pos = -10,-10
random = 30,40
bindtime = 1
postype = p1
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = .4,.4

[State 8120,fire]
type = explod
trigger1 = playeridexist(var(48))
trigger1 = gametime%2=0
Anim = 8105
id = 8120
pos = -10,-10
random = 30,40
bindtime = 1
postype = p1
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = .7,.7

[State 8120,removeprojectile]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H||playerID(var(48)),stateno=5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])

[State 8120,removeprojectile]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H||playerID(var(48)),stateno=5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])
;-------------------------------------------------------------------------------
;========================<SMOOCK SPARKS LARGE ATACK>==============================
;-------------------------------------------------------------------------------
;SMOOCK SPARKS STRONG
[Statedef 8150]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1

[State 8150,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[state 8150,varset]
type = varset
trigger1 = time = 0
var(48)= parent,var(48)
ignorehitpause = 1
persistent = 1

[State 8150,VarSet]
type = VarSet
trigger1 = time = 0
var(9) = parent,var(9)
ignorehitpause = 1


[State 8150,face]
type = turn
trigger1 = playerIDexist(var(48))
trigger1 = facing!=(playerID(var(48)),facing)



[State 8150,bind]
type = posset
trigger1 = playerIDexist(var(48))
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)+(playerID(var(48)),const(size.mid.pos.y))

[State 8150,bind]
type = posset
trigger1 = playerIDexist(var(48))
trigger1 = playerID(var(48)),statetype=L
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)- 20


[State 8150,Smook]
type = explod
trigger1 = gametime%2=0
anim = 8150
id = 8150
pos = -30-(abs(const(size.mid.pos.x)))+random%50,40-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
sprpriority = 9
random = 30,30
pausemovetime = -1
supermovetime = -1
scale = .2,.2

[State 8150,Smook]
type = explod
trigger1 = gametime%5=0
anim = 8150
id = 8150
pos = -10-(abs(const(size.mid.pos.x)))+random%50,30-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
sprpriority = 9
random = 30,30
pausemovetime = -1
supermovetime = -1
scale = .4,.4


;Generated by Fighter Factory PalFX Editor
[State 8150, PalFXWiz]
type = PalFX
trigger1 = 1
time = 1
add = 0,-100,0
mul = 120,20,124
invertall = 0
color = 0


[State 8150, RemoveExplod]
type = RemoveExplod
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H;||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])


[State 8150,remove]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H;||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])
;-------------------------------------------------------------------------------
;SMOOCK SPARKS STRONG 2
[Statedef 8151]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1

[State 8151,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[state 8151,varset]
type = varset
trigger1 = time = 0
var(48)= parent,var(48)
ignorehitpause = 1
persistent = 1

[State 8151,VarSet]
type = VarSet
trigger1 = time = 0
var(9) = parent,var(9)
ignorehitpause = 1


[State 8151,face]
type = turn
trigger1 = playerIDexist(var(48))
trigger1 = facing!=(playerID(var(48)),facing)



[State 8151,bind]
type = posset
trigger1 = playerIDexist(var(48))
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)+(playerID(var(48)),const(size.mid.pos.y))

[State 8151,bind]
type = posset
trigger1 = playerIDexist(var(48))
trigger1 = playerID(var(48)),statetype=L
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)- 20


[State 8151,Smook]
type = explod
trigger1 = gametime%2=0
anim = 8150
id = 8150
pos = -30-(abs(const(size.mid.pos.x)))+random%50,40-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
sprpriority = 9
random = 30,30
pausemovetime = -1
supermovetime = -1
scale = .2,.2

[State 8151,Smook]
type = explod
trigger1 = gametime%5=0
anim = 8150
id = 8150
pos = -10-(abs(const(size.mid.pos.x)))+random%50,30-(abs(const(size.mid.pos.y)))+random%50
bindtime =1
postype = p1
sprpriority = 9
random = 30,30
pausemovetime = -1
supermovetime = -1
scale = .4,.4


;Generated by Fighter Factory PalFX Editor
[State 8151, PalFXWiz]
type = PalFX
trigger1 = 1
time = 1
add = -100,0,-50
mul = 20,120,24
invertall = 0
color = 0


[State 8151, RemoveExplod]
type = RemoveExplod
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H;||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])


[State 8151,remove]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H;||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;=====================<ELETRIC SPARKS LARGE ATACK>==============================
;-------------------------------------------------------------------------------
;ELETRIC SPARKS STRONG
[Statedef 8300]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1


[State 8300,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[state 8300,varset]
type = varset
trigger1 = time = 0
var(48)= parent,var(48)
ignorehitpause = 1
persistent = 1


[State 8300,face]
type = turn
trigger1 = playerIDexist(var(48))
trigger1 = facing!=(playerID(var(48)),facing)


[State 8300,PlaySnd Eletric]
type = PlaySnd
trigger1 = gametime%10 = 0
value = S8300,0+random%4
ignorehitpause = 1


[State 8300,bind]
type = posset
trigger1 = playerIDexist(var(48))
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y)+(playerID(var(48)),const(size.mid.pos.y))

[State 8300,bind]
type = posset
trigger1 = playerIDexist(var(48))
trigger1 = playerID(var(48)),statetype=L
x = ceil(playerID(var(48)),pos x)
y = ceil(playerID(var(48)),pos y) ;- 20


[State 8300,Eletric 1]
type =  explod
trigger1 = gametime%3 = 0
anim = 8300+random%2
id = 8300
pos = -30-(abs(const(size.mid.pos.x)))+random%50,-20-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
vfacing  = IfElse(random<499,1,-1)
bindtime = 1
postype = p2
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),1,.5),ifelse((Random < 500),1,.5)

[State 8300,Eletric Vel]
type =  explod
trigger1 = gametime%3 = 0
anim = 8300
id = 8300
pos = -30-(abs(const(size.mid.pos.x)))+random%50,-20-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
vfacing  = IfElse(random<499,1,-1)
postype = p2
ownpal = 1
removetime = 24
vel = ifelse((Random < 500),2.8,-2.2),ifelse((Random < 500),2.2,-2.2)
random = 20,20
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),.6,.4),ifelse((Random < 500),.6,.4)

[State 8300,Eletric Max]
type = explod
triggerall = root,var(23) != 4
trigger1 = playeridexist(var(48))
trigger1 = gametime%2=0
anim = 8300+random%2
id = 8300
pos = ifelse((Random < 500),-30,-20)-(abs(const(size.mid.pos.x)))+random%50,ifelse((Random < 500),-20,-10)-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
bindtime = -1
postype = p2
ownpal = 1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),1,.5),ifelse((Random < 500),1,.5)


[State 8300, Eletric Sparks Max]
type = helper
;Fraqueza:
triggerall = time = 0
trigger1 = root,var(23) = 1
trigger2 = root,var(23) = 2
helpertype = normal
stateno = 8310
ID = 8310
name = "EletricSparksMax"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0


[State 8300,remove]
type = destroyself
trigger1 = playerIDexist(var(48))
trigger1 = time>300
trigger2 =!playerIDexist(var(48))

[State 8300,remove]
type = destroyself
triggerall = playerIDexist(var(48))
trigger1 = playerID(var(48)),ctrl
trigger2 = playerID(var(48)),movetype!=H||playerID(var(48)),stateno = 5300
trigger3 = playerID(var(48)),statetype=L&&(playerID(var(48)),stateno!=[5080,5081])
;-------------------------------------------------------------------------------
;=====================<ELETRIC SPARKS MINIMUM ATACK>============================
;-------------------------------------------------------------------------------
;ELETRIC SPARKS LIGHT
[Statedef 8305]
physics = N
ctrl = 0
velset = 0,0
anim = 9999
sprpriority = -3
ignorehitpause = 1


[State 8305,removeshadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 8305,PlaySnd Squirt]
type = PlaySnd
trigger1 = gametime%10 = 0
value = S8300,0+random%4
volume = 250
channel = 2
ignorehitpause = 1
persistent = 1


[State 8305,Blood]
type =  explod
trigger1 = gametime%3 = 0
anim = 8300+random%2
id = 8300
pos = -30-(abs(const(size.mid.pos.x)))+random%50,-40-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
vfacing  = IfElse(random<499,1,-1)
bindtime = 1
postype = p2
ownpal = 1
sprpriority = 9
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),1,.5),ifelse((Random < 500),1,.5)

[State 8305,Eletric 1]
type = explod
triggerall = gametime%2=0
trigger1 = root,var(23) = 1
trigger2 = root,var(23) = 2
anim = 8300+random%2
id = 8305
pos = ifelse((Random < 500),-30,-20)-(abs(const(size.mid.pos.x)))+random%50,ifelse((Random < 500),-40,-30)-(abs(const(size.mid.pos.y)))+random%50
facing = ifelse((Random < 500),1,-1)
bindtime = -1
postype = p2
ownpal = 1
sprpriority = 3
pausemovetime = -1
supermovetime = -1
scale = ifelse((Random < 500),1,.5),ifelse((Random < 500),1,.5)



[State 8305, destroyself]
Type = destroyself
trigger1 = time >= 30

;-------------------------------------------------------------------------------
;=====================<ELETRIC SPARKS SHOCK ATACK>==============================
;-------------------------------------------------------------------------------
;ELETRIC SPARKS SHOCK
[Statedef 8310]
physics = N
velset = 0,0
anim = 9999
sprpriority = 4


[State 8310, assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1


[State 8310, Pause]
type = Pause
triggerall = time = [0,20]
triggerall = RoundState != 3
trigger1 = (GameTime%2) =1
trigger1 = time <= 20
trigger1 = p2life != 0
time = 1
movetime = 0


[State 8310,PlaySnd Eletric]
type = PlaySnd
trigger1 = time = 0
value = S8300,4+random%2
ignorehitpause = 1


[State 8310, 1]
type = Explod
trigger1 = NumExplod(8310) <=0
anim = 8310
id = 8310
sprpriority = 4
postype = p2
pos = 0,-60
random = 0,20
ownpal =1
bindtime = 9999
pausemovetime = -1
;removetime = 50
scale = 1,1

[State 8310, 2]
type = Explod
trigger1 = NumExplod(8311) <=0
anim = 8311
id = 8311
sprpriority = 4
postype = p2
pos = 0,-20
random = 0,20
ownpal = 1
bindtime = 9999
pausemovetime = -1
scale = .7,.7

[State 8310, 3]
type = Explod
trigger1 = NumExplod(8312) <=0
anim = 8310
id = 8312
sprpriority = 4
postype = p2
pos = -20,-80
random = 10,20
ownpal = 1
bindtime = 9999
pausemovetime = -1
scale = .5,.5


[State 8310, pos]
type = posadd
trigger1 = 1
x = ceil(p2dist x)
y = ceil(p2dist y)


[State 8310, end]
type = destroyself
trigger1 = time>=60
trigger2 = enemynear,ctrl||(enemynear,movetype!=H)||(enemynear,statetype=L)
;===========================<ZERO COUNTER FX>===================================
[StateDef 8350]
type = A
physics = N
moveType = I
anim = 9999
ctrl = 0
velSet = 0,0

[State 8350, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S950,0
channel = -1

[State 8350, EnvShake]
type = EnvShake
trigger1 = time = 1
time = 15
freq = 60
ampl = -4
phase = 90


[State 8350, bgPalFX]
type = bgPalFX
trigger1 = 1
time = 1
color = 16 * Time
mul = 16 * Time, 16 * Time, 16 * Time

[State 8350, Circle Explod]
type = Explod
trigger1 = !Time
anim = 8350
ID = 1
sprPriority = 3
posType = P1
removeTime = 16
superMoveTime = -1
ownPal = 1

[State 8350, Scale]
type = ModifyExplod
trigger1 = NumExplod(1)
ID = 1
scale = (0.0625 * Time), (0.0625 * Time)
trans = AddAlpha
alpha = 256 - (16 * Time), 256

[State 8350, Lightning Explod]
type = Explod
trigger1 = !Time
anim = 8351
ID = 2
sprPriority = -2
posType = P1
pos = 0, -ceil(pos y)
superMoveTime = -1
ownPal = 1

[State 8350, End]
type = DestroySelf
trigger1 = Time >= 16

;========================< RECOVER FX >=============================
[Statedef 8200]
type = A
velset = 0, 0
anim = 8200
sprpriority = 5

[State 8200, No Shadow]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8200, Scale]
type = angledraw
trigger1 = 1
scale = 0.25 + (0.017 * time), 0.25 + (0.017 * time)
ignoreHitPause = 1

[State 8200, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = ceil(256 -17.1 * time), 256
ignoreHitPause = 1

[State 8200, End]
type = destroyself
trigger1 = time >= 15

;-------------------------------------------------------------------------------
;=============================<COUNTER F.X.>====================================
[Statedef 8280]
physics = N
velset = 0,0
anim = 9999

[State 9220, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 5
add = 255,255,255
sinadd = -255,-255,-255,20

[State 9220, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Counter"
ID = 8281
stateno = 8281
postype = p2
sprpriority = 5
facing = 1
ownpal = 1


[State 9220, noshadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 9220, end]
type = destroyself
trigger1 = root,movetype!=A
trigger2 = time >20
;=============================<COUNTER FX>======================================
[Statedef 8281]
type = A
physics = N
velset = 0,0
anim = 9999

[State 9221, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 64
postype = p2
pos =(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))
facing = facing
removetime = 32
pausemovetime =-1
supermovetime =-1
ownpal = 1


[State 9221, Scale]
type = modifyexplod
trigger1 = time<8
ID = 8290
scale = .4,.4
trans = addalpha
alpha = 256,0

[State 9221, Scale]
type = modifyexplod
trigger1 = time>=8
ID = 8290
scale = .4+.0625*(time-8), .4+.0625*(time-8)
trans = addalpha
alpha = 256-32*(time-8), 32*(time-8)

[State 9221, Safety]
type = removeexplod
trigger1 = time>=16


[State 9221, End]
type = destroyself
trigger1 = time>=16

;========================< COUNTER FX >=============================
[Statedef 8290]
type = A
physics = N
velset = 0, 0
anim = 9741

[State 8290, Circle]
type = explod
trigger1 = !numexplod(8290)
anim = 8290
ID = 8290
sprpriority = 64
postype = p1
pos =(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1


[State 9221, Scale]
type = modifyexplod
trigger1 = time<8
ID = 8290
scale = .4,.4
trans = addalpha
alpha = 256,0

[State 9221, Scale]
type = modifyexplod
trigger1 = time>=8
ID = 8290
scale = .4+.0625*(time-8), .4+.0625*(time-8)
trans = addalpha
alpha = 256-32*(time-8), 32*(time-8)

[State 8290, Safety]
type = removeexplod
trigger1 = time >= 16


[State 8290, End]
type = destroyself
trigger1 = time >= 16

;========================< COUNTER FX >=============================
[Statedef 8291]
type = A
physics = N
velset = 0, 0
anim = 9741

[State 8291, Circle]
type = explod
trigger1 = !numexplod(8291)
anim = 8291
ID = 8291
sprpriority = 64
postype = p1
pos =(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))
facing = facing
removetime = 32
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 9221, Scale]
type = modifyexplod
trigger1 = time<8
ID = 8291
scale = .4,.4
trans = addalpha
alpha = 256,0

[State 9221, Scale]
type = modifyexplod
trigger1 = time>=8
ID = 8291
scale = .4+.0625*(time-8), .4+.0625*(time-8)
trans = addalpha
alpha = 256-32*(time-8), 32*(time-8)

[State 8291, Safety]
type = removeexplod
trigger1 = time >= 20

[State 8291, End]
type = destroyself
trigger1 = time >= 20
;====================< POWER CHARGE >====================
;--- MAIN FX ---
[Statedef 8330]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 8330, Bind]
type = bindtoroot
trigger1 = (root, stateno = 730)
pos = 0,0

[State 8330, Snd]
type = playsnd
trigger1 = !time
value = 730,0
channel = 0

[State 8330, Aura]
type = explod
trigger1 = !numexplod(8330)
ID = 8330
anim = 8330
sprpriority = 3
postype = p1
pos = 0,10
bindtime = -1
removetime = -1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, Dust]
type = explod
trigger1 = !(time % 14)
ID = 8735
anim = 8735
sprpriority = -3
postype = p1
pos = 0, 10-ceil(pos y)
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power < 3000
ID = 8330
scale = 0.5, 0.1 + 0.4 * (root, power / 3000.0)

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8330) && root, power >= 3000
ID = 8330
scale = 0.5, 0.5

[State 8330, FX]
type = modifyexplod
trigger1 = numexplod(8735) && root, power < 3000
ID = 8735
scale = .5+parent,power*.00005,.3+parent,power*.00005


[State 8330, End]
type = stopsnd
trigger1 = root, stateno != 730
channel = 0

[State 8330, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8330, End]
type = destroyself
trigger1 = root, stateno != 730

;-------------------------------------------------------------------------------
;--- Particles ---
[Statedef 8331]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0

[State 8331, Bind]
type = bindtoroot
trigger1 = !(time%8)
pos = ceil(-153+(random/3.125)),ceil(82-(random/3.125))

[State 8331, Particle]
type = explod
trigger1 = (time%8)= 1
anim = 8331
sprpriority = ifelse(random<750,5,-1)
postype = p1
vel = ((rootdist x+1)/32.0),((rootdist y-75)/32.0)
scale = ifelse(random<500,.5,-.5),ifelse(random<500,.5,-.5)
pausemovetime = -1
supermovetime = -1
ownpal = 1

[State 8331, End]
type = removeexplod
trigger1 = root, stateno != 730

[State 8331, End]
type = destroyself
trigger1 = root, stateno != 730


;====================< ZERO COUNTER PAUSE >====================
[Statedef 8350]
type = A
physics = N
movetype = I
anim = 9741
ctrl = 0
velset = 0, 0


[State 8350, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S750,0
channel = -1
freqmul = 1.0


[State 8350, BG PalFX]
type = bgpalfx
trigger1 = 1
time = 1
color = 16 * time
mul = 16 * time, 16 * time, 16 * time

[State 8350, Circle]
type = explod
trigger1 = !time
anim = 8350
ID = 1
sprpriority = 3
postype = p1
removetime = 16
supermovetime = -1
ownpal = 1

[State 8350, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = (0.0625 * time), (0.0625 * time)
trans = addalpha
alpha = 256 -(16 * time), 256

[State 8350, Lightning]
type = explod
trigger1 = !time
anim = 8351
ID = 2
sprpriority = -2
postype = p1
pos = 0, -ceil(pos y)
supermovetime = -1
ownpal = 1

[State 8350, End]
type = destroyself
trigger1 = time >= 16


;========================< CUSTOM COMBO >=============================
[Statedef 8400]
type = A
physics = N
movetype = I
anim = 8400
ctrl = 0
velset = 0, 0
sprpriority = 5

[State 8400, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8400, BG PalFX]
type = bgpalfx
trigger1 = time < 25
time = 1
mul = 128, 128, 128

[State 8400, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8400, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8400, Scale]
type = angledraw
trigger1 = time < 8
scale = (0.0625 * time), (0.0625 * time)
ignoreHitPause = 1

[State 8400, Scale]
type = angledraw
trigger1 = time >= 8
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time < 16
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8400, Trans]
type = trans
trigger1 = time >= 16
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256
ignoreHitPause = 1

[State 8400, Lines]
type = explod
trigger1 = !time
anim = 8401
ID = 1
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 2 -(0.125 * time), 2 -(0.125 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8400, Circle]
type = explod
trigger1 = time = 16
anim = 8402
ID = 2
sprpriority = 5
postype = p1
removetime = 32
supermovetime = -1

[State 8400, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = (0.1 * (time -16)), (0.1 * (time -16))
trans = addalpha
alpha = ceil(256 - 25.6 * (time -16)), 256

[State 8400, Safety]
type = removeexplod
trigger1 = time >= 26

[State 8400, End]
type = destroyself
trigger1 = time >= 26


;========================< SUPERPAUSE FX >=============================
;--- --Level 1 -----
[Statedef 8500]
type = A
velset = 0, 0
anim = 8500
sprpriority = 5

[State 8500, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8500, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 0, 0, 256

[State 8500, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8500, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8500, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8500, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8500, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8500, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8501
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Circle]
type = explod
trigger1 = time = 24
anim = 8502
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8500, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8500, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8500, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 2 -----
[Statedef 8510]
type = A
velset = 0, 0
anim = 8510
sprpriority = 5

[State 8510, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8510, BG PalFX]
type = bgpalfx
trigger1 = time < 39
time = 1
color = 0
mul = 192, 0, 256

[State 8510, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8510, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8510, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8510, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8510, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8510, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8511
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Circle]
type = explod
trigger1 = time = 24
anim = 8512
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8510, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8510, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8510, End]
type = destroyself
trigger1 = time >= 40


;--- --Level 3 -----
[Statedef 8520]
type = A
velset = 0, 0
anim = 8520
sprpriority = 5

[State 8520, Assert]
type = assertspecial
trigger1 = 1
flag = noshadow
ignoreHitPause = 1

[State 8520, Assert]
type = assertspecial
trigger1 = time < 40
flag = nobardisplay
flag2 = noBG
flag3 = noFG

[State 8520, Rotate]
type = angleset
trigger1 = !time
value = 6 * (random % 60)

[State 8520, Rotate]
type = angleadd
trigger1 = 1
value = -6

[State 8520, Scale]
type = angledraw
trigger1 = time < 16
scale = (0.03125 * time), (0.03125 * time)
ignoreHitPause = 1

[State 8520, Scale]
type = angledraw
trigger1 = time >= 16
scale = 0.5, 0.5
ignoreHitPause = 1

[State 8520, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256, 256
ignoreHitPause = 1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 20
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Portrait]
type = explod
trigger1 = !time
anim = 8525
ID = 21
sprpriority = -16
postype = back
removetime = 40
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && time < 16
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 1 - (0.03125 * time), 1 - (0.03125 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(21) && time < 16
ID = 21
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 2 - (0.09375 * time), 2 - (0.09375 * time)
trans = addalpha
alpha = (8 * time), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(20) && (time = [16, 32])
ID = 20
postype = back
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 121)
scale = 0.5, 0.5
trans = addalpha
alpha = 256, 256

[State 8520, Scale Portrait 2b]
type = ModifyExplod
trigger1 = NumExplod(21) && (Time = [16,32])
ID = 21
scale = 0,0

[State 8520, Scale Portrait 1c]
type = ModifyExplod
trigger1 = NumExplod(20) && Time >= 32
ID = 20
posType = Back
pos = 160 + (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Scale Portrait 2c]
type = ModifyExplod
trigger1 = NumExplod(21) && Time >= 32
ID = 21
posType = Back
pos = 160 - (8 * (Time - 32)), floor((1.3333333 * GameHeight / GameWidth) * 121)
scale = 0.5, 0.5
trans = AddAlpha
alpha = 128 - 16 * (Time - 32), 256

[State 8520, Lines]
type = explod
trigger1 = time = 0 || time = 8 || time = 16 || time = 24
anim = 8521
ID = ifelse(time = 24, 4, ifelse(time = 16, 3, ifelse(time = 8, 2, 1)))
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 16
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(1)
ID = 1
scale = 1 -(0.0625 * time), 1 -(0.0625 * time)
trans = addalpha
alpha = ifelse(time < 4, 64 * time, 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(2)
ID = 2
scale = 1 -(0.0625 * (time -8)), 1 -(0.0625 * (time -8))
trans = addalpha
alpha = ifelse((time -8) < 4, 64 * (time -8), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(3)
ID = 3
scale = 1 -(0.0625 * (time -16)), 1 -(0.0625 * (time -16))
trans = addalpha
alpha = ifelse((time -16) < 4, 64 * (time -16), 256), 256

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(4)
ID = 4
scale = 1 -(0.0625 * (time -24)), 1 -(0.0625 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Circle]
type = explod
trigger1 = time = 24
anim = 8522
ID = 10
sprpriority = 5
postype = p1
facing = ifelse(random < 500, -1, 1)
vfacing = ifelse(random < 500, -1, 1)
removetime = 32
supermovetime = -1

[State 8520, Scale]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
scale = 2 -(0.125 * (time -24)), 2 -(0.125 * (time -24))
trans = addalpha
alpha = ifelse((time -24) < 4, 64 * (time -24), 256), 256

[State 8520, Safety]
type = removeexplod
trigger1 = time >= 40

[State 8520, End]
type = destroyself
trigger1 = time >= 40


;========================< SUPER FINISH >=============================
[Statedef 8600]
type = A
velset = 0, 0
anim = 9741

[State 8600, Sound]
type = playsnd
trigger1 = !time
value = 8600,0
channel = 1

[State 8600, Snd]
type = sndpan
trigger1 = time <= 80
channel = 1
abspan = ceil(sin(gametime / 20.0 * pi) * 160)

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time < 16
time = 1
mul = 0, 0, 0

[State 8600, BG PalFX]
type = bgpalfx
trigger1 = time = [16, 24)
time = 1
mul = 32 * (time -16), 32 * (time -16), 32 * (time -16)

[State 8600, Move Name: Custom Combo]
type = varset
trigger1 = !time && root, var(23) = 900
var(0) = 1

[State 8600, Move Name: Haoh Shokoken]
type = varset
trigger1 = !time && (root, var(23) = [3000, 3099])
var(0) = 2

[State 8600, Move Name: Ryuko Ranbu]
type = varset
trigger1 = !time && (root, var(23) = [3100, 3199])
var(0) = 3

[State 8600, Move Name: Tenchi Haohken]
type = varset
trigger1 = !time && (root, var(23) = [4001, 4299])
var(0) = 4

[State 8600, MvC]
type = explod
trigger1 = !time
anim = 8600
ID = 8600
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8600)
ID = 8600
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), 256

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 10
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 32
pausemovetime = -1
supermovetime = -1

[State 8600, Text]
type = explod
trigger1 = !time && var(0)
anim = 8610 + var(0)
ID = 11
ontop = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
scale = 0.5, 0.5 * (1.3333333 * gameheight / gamewidth)
bindtime = -1
removetime = 8
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(10)
ID = 10
trans = addalpha
alpha = ifelse(time < 16, 256, 256 -32 * (time -16)), ifelse(time < 16, 0, 32 * (time -16))

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(11)
ID = 11
scale = 0.5 + (0.0625 * time), 0.5 + (0.0625 * time)
trans = addalpha
alpha = 256 - (32 * time), 32 * time

[State 8600, Circle]
type = explod
trigger1 = !time
anim = 8601
ID = 8601
under = 1
postype = left
pos = 160, floor((1.3333333 * gameheight / gamewidth) * 120)
bindtime = -1
removetime = 16
pausemovetime = -1
supermovetime = -1

[State 8600, Fade]
type = modifyexplod
trigger1 = numexplod(8601)
ID = 8601
scale = (0.25 * time) * (1.3333333 * gameheight / gamewidth), (0.25 * time) * (1.3333333 * gameheight / gamewidth)
trans = addalpha
alpha = 256 - (16 * time), 256

[State 8600, Assert]
type = assertspecial
trigger1 = time < 16
flag = noFG

[State 8600, Assert]
type = assertspecial
trigger1 = time < 24
flag = nobardisplay

[State 8600, End]
type = removeexplod
trigger1 = time >= 24
trigger2 = roundstate < 3

[State 8600, End]
type = destroyself
trigger1 = roundstate < 3


;========================< CAMERA CONTROL >=============================
[Statedef 8999]
type = S
velset = 0, 0
anim = 9741

[State 8999, bound]
type = screenbound
trigger1 = 1
value = 0
movecamera = 1, 1
ignoreHitPause = 1

[State 8999, End]
type = destroyself
trigger1 = roundstate = 2

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;===============================================================================
;-------------------------------------------------------------------------------
;Hyper BG
[Statedef 9200]
physics = N
anim = 9999
sprpriority = -3


[State 9200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


;Generated by Fighter Factory PalFX Editor
[State 9200, PalFXWiz]
type = PalFX
triggerall = Time = 0
trigger1 = root, stateno = 3050
trigger2 = root, stateno = 3150
time = -1
add = 0,0,0
mul = 120,20,124
sinadd = 85,110,55,0
invertall = 0
color = 256

;Generated by Fighter Factory PalFX Editor
[State 9200, PalFXWiz]
type = PalFX
triggerall = Time = 0
trigger1 = root, stateno = 3303
time = -1
add = 0,0,0
mul = 120,20,124
sinadd = 85,110,55,0
invertall = 0
color = 256

;Generated by Fighter Factory PalFX Editor
[State 9200, PalFXWiz]
type = PalFX
triggerall = Time = 0
trigger1 = root, stateno = 3304
time = -1
add = 60,-130,-180
mul = 170,144,40
sinadd = 0,0,0,0
invertall = 0
color = 0

;Generated by Fighter Factory PalFX Editor
[State 9200, PalFXWiz]
type = PalFX
triggerall = Time = 0
trigger1 = root, stateno = 3500
trigger2 = root, stateno = 3900
time = -1
add = 60,-130,-180
mul = 170,144,40
sinadd = 0,0,0,0
invertall = 0
color = 0

;Generated by Fighter Factory PalFX Editor
[State 0, PalFXWiz]
type = PalFX
triggerall = root, stateno != [6101,6102]
trigger1 = root, stateno = 6100
trigger1 = Time = 0
time = 99999
add = -20,-20,-20
mul = 256,256,256
sinadd = -80,-80,-80,0
invertall = 0
color = 0
persistent = 1


[State 9200, PalFXWiz Gold]
type = PalFX
trigger1 = root, stateno = 6000
trigger1 = Time = 0
time = 99999
add = 40,-70,-200
mul = 256,256,256
sinadd = 40,30,0,10
invertall = 0
color = 0


[State 9200, Explod BG 1]
type  = Explod
trigger1 = numexplod(9200)=0
trigger1 = time = 20
anim = 9200
postype = left
ID = 9200
sprpriority = -9
removetime = -1
pos = 0,0;160,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9200, Explod BG 2] ;anima��o de fundo
type  = Explod
trigger1 = numexplod(9201)=0
trigger1 = time = 20
anim = 9201
postype = left
ID = 9201
sprpriority = -8
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9200, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 10
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9200, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%4
postype = left
ID = 9400
sprpriority = -7
removetime = 35
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9200, Explod Portrait]
type = null;Explod
trigger1 = numexplod(9250)=0
trigger1 = Time = 0
anim = 9250
ID = 9250
name = "Hyper Portrait"
pos = -150,-20
postype = back
bindtime = 999
vel = 4,0
accel = -.2,0
removetime = 55
supermove = 99999
pausemovetime = 99999
sprpriority = -6
ownpal = 1
scale = 1.4,1.4

[State 9200, ChangeState]
type = ChangeState
trigger1 = root, stateno = [6101,6102]
value = 9201

[State 9200, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0;stateno!=3000
trigger3 = numhelper(9300) = 1
trigger4 = numhelper(9315) = 1

[State 9200, destroyself]
Type = destroyself
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0;stateno!=3000
trigger3 = numhelper(9300) = 1
trigger4 = numhelper(9315) = 1
;-------------------------------------------------------------------------------
;Hyper BG
[Statedef 9201]
physics = N
anim = 9999
sprpriority = -3


[State 9201, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1

[State 9201, PlaySnd]
type = PlaySnd
trigger1 = time = 5
value = S6000,8


;Generated by Fighter Factory PalFX Editor
[State 9201, PalFXWiz]
type = PalFX
trigger1 = Time = 0
time = 99999
add = -40,-40,-40
mul = 256,256,256
sinadd = -80,-80,-80,0
invertall = 0
color = 0
persistent = 1

[State 9201, Explod BG 1]
type  = Explod
trigger1 = numexplod(9200)=0
trigger1 = time = 0
anim = 9200
postype = left
ID = 9200
sprpriority = -9
removetime = -1
pos = 0,0;160,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9200, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9405
postype = left
ID = 9400
sprpriority = -7
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9201, Explod BG 2] ;anima��o de fundo
type  = Explod
trigger1 = numexplod(9201)=0
trigger1 = time = 0
anim = 9201
postype = left
ID = 9201
sprpriority = -5
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9201, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0;stateno!=3000
trigger3 = numhelper(9300) = 1
trigger4 = numhelper(9315) = 1

[State 9201, destroyself]
Type = destroyself
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0;stateno!=3000
trigger3 = numhelper(9300) = 1
trigger4 = numhelper(9315) = 1
;-------------------------------------------------------------------------------
;===============================<Level 1>=======================================
;-------------------------------------------------------------------------------
[Statedef 9205]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9205, Circle]
type = explod
trigger1 = !numexplod(9205)
anim = 9205
ID = 9205
sprpriority = 64
pos = 0,-50
postype = P1
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9205, Scale]
type = modifyexplod
trigger1= time>=0
ID = 9205
scale = 0.645+.008*(time-8), 0.645+.008*(time-8)
trans = addalpha
alpha = 256-6*(time-8), 6*(time-8)


[State 9205, Safety]
type = removeexplod
trigger1 = time>=45


[State 9205, End]
type = destroyself
trigger1 = time>=45

;-------------------------------------------------------------------------------
;===============================<Level 2>=======================================
;-------------------------------------------------------------------------------
[Statedef 9206]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9206, Circle]
type = explod
trigger1 = !numexplod(9206)
anim = 9206
ID = 9206
sprpriority = 64
pos = 0,-50
postype = P1
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9206, Scale]
type = modifyexplod
trigger1= time>=0
ID = 9206
scale = 0.645+.008*(time-8), 0.645+.008*(time-8)
trans = addalpha
alpha = 256-6*(time-8), 6*(time-8)


[State 9206, Safety]
type = removeexplod
trigger1 = time>=45


[State 9206, End]
type = destroyself
trigger1 = time>=45

;-------------------------------------------------------------------------------
;===============================<MAX Level>=====================================
;-------------------------------------------------------------------------------
[Statedef 9207]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9207, Circle]
type = explod
trigger1 = !numexplod(9207)
anim = 9207
ID = 9207
sprpriority = 64
pos = 0,-50
postype = P1
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9207, Scale]
type = modifyexplod
trigger1= time>=0
ID = 9207
scale = 0.745+.008*(time-8), 0.745+.008*(time-8)
trans = addalpha
alpha = 256-6*(time-8), 6*(time-8)


[State 9207, Safety]
type = removeexplod
trigger1 = time>=45


[State 9207, End]
type = destroyself
trigger1 = time>=45

;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Fire BG
[Statedef 9210]
physics = N
anim = 9999
sprpriority = -3


[State 9200, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9200, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9200, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9200, Explod BG Fire]
type  = Explod
triggerall = root,var(0) != 2
trigger1 = numexplod(9210)=0
trigger1 = time = 35
anim = 9210
postype = left
ID = 9210
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9200, Explod BG Ice]
type  = Explod
triggerall = numexplod(9215)=0
trigger1 = time = 35
trigger1 = parent,var(0) = 2
anim = 9215
postype = left
ID = 9215
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9200, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9200, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 0, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9211

;-------------------------------------------------------------------------------
;Hyper BG Fire End
[Statedef 9211]
physics = N
anim = 9999
sprpriority = -3


[State 9211, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9211, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1


[State 9211, Explod BG Fire End]
type  = Explod
trigger1 = time = 0
anim = 9211
postype = left
ID = 9211
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999



[State 9211, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1

;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Ice BG
[Statedef 9215]
physics = N
anim = 9999
sprpriority = -3


[State 9215, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9215, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9215, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9215, Explod BG Ice]
type  = Explod
triggerall = numexplod(9215)=0
trigger1 = time = 35
anim = 9215
postype = left
ID = 9215
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9215, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9215, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 9215, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9216

;-------------------------------------------------------------------------------
;Hyper BG Ice End
[Statedef 9216]
physics = N
anim = 9999
sprpriority = -3


[State 9216, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9216, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1



[State 9216, Explod BG Ice End]
type  = Explod
triggerall = numexplod(9216)=0
trigger1 = time = 0
anim = 9216
postype = left
ID = 9216
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9216, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1
;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Thuder BG
[Statedef 9220]
physics = N
anim = 9999
sprpriority = -3


[State 9220, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9220, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9220, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9220, Explod BG Thunder]
type  = Explod
triggerall = numexplod(9220)=0
trigger1 = time = 35
anim = 9220
postype = left
ID = 9220
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9220, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9220, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 9220, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9221

;-------------------------------------------------------------------------------
;Hyper BG Thunder End
[Statedef 9221]
physics = N
anim = 9999
sprpriority = -3


[State 9221, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9221, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1



[State 9221, Explod BG Thunder End]
type  = Explod
triggerall = numexplod(9221)=0
triggerall = time = 0
trigger1 = root,var(0) = 2
anim = 9221
postype = left
ID = 9221
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9221, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1

;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Wind BG
[Statedef 9225]
physics = N
anim = 9999
sprpriority = -3


[State 9225, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9225, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9225, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9225, Explod BG Wind]
type  = Explod
triggerall = numexplod(9225)=0
trigger1 = time = 35
anim = 9225
postype = left
ID = 9225
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9225, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9225, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 9225, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9226

;-------------------------------------------------------------------------------
;Hyper BG Wind End
[Statedef 9226]
physics = N
anim = 9999
sprpriority = -3


[State 9226, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9226, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1



[State 9226, Explod BG Wind End]
type  = Explod
triggerall = numexplod(9226)=0
triggerall = time = 0
trigger1 = root,var(0) = 2
anim = 9226
postype = left
ID = 9226
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9226, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1
;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Earth BG
[Statedef 9230]
physics = N
anim = 9999
sprpriority = -3


[State 9230, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9230, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9230, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9230, Explod BG Earth]
type  = Explod
triggerall = numexplod(9230)=0
trigger1 = time = 35
anim = 9230
postype = left
ID = 9230
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9230, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9230, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 9230, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9231

;-------------------------------------------------------------------------------
;Hyper BG Earth End
[Statedef 9231]
physics = N
anim = 9999
sprpriority = -3


[State 9231, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9231, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1



[State 9231, Explod BG Earth End]
type  = Explod
triggerall = numexplod(9231)=0
trigger1 = time = 0
anim = 9231
postype = left
ID = 9231
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9231, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1

;===============================================================================
;-------------------------------------------------------------------------------
;Hyper Poison BG
[Statedef 9235]
physics = N
anim = 9999
sprpriority = -3


[State 9235, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9235, SuperPause]
type = PLaysnd
trigger1 = time = 35
value = S9250,0
channel = 0


[State 9235, Explod Intro BG]
type = Explod
trigger1 = numexplod(9260)= 0
trigger1 = time = 0
anim = 9260
postype = left
ID = 9260
sprpriority = -7
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9235, Explod BG Poison]
type  = Explod
triggerall = numexplod(9235)=0
trigger1 = time = 35
anim = 9235
postype = left
ID = 9235
sprpriority = -9
removetime = -1
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9235, Explod Image]
type = Explod
trigger1 = numexplod(9400)=0
trigger1 = time = 0
anim = 9400+random%2
postype = left
ID = 9400
sprpriority = -7
removetime = 25
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9235, RemoveExplod]
Type = RemoveExplod
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1


[State 9235, ChangeState]
type = ChangeState
trigger1 = root, movetype = H
trigger2 = root, var(45)= 0
trigger3 = numhelper(9300) = 1
value = 9236

;-------------------------------------------------------------------------------
;Hyper BG Poison End
[Statedef 9236]
physics = N
anim = 9999
sprpriority = -3


[State 9236, AssertSpecial]
type = AssertSpecial
trigger1 = 1
flag = noFG
ignorehitpause = 1


[State 9236, SuperPause]
type = PLaysnd
trigger1 = time = 2
value = S9250,1



[State 9236, Explod BG Poison End]
type  = Explod
triggerall = numexplod(9236)=0
trigger1 = time = 0
anim = 9236
postype = left
ID = 9236
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999


[State 9236, destroyself]
Type = destroyself
trigger1 = time>10
trigger2 = numhelper(9300) = 1
;-------------------------------------------------------------------------------
;===============================<Level 1>=======================================
;-------------------------------------------------------------------------------
[Statedef 9250]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9205, Circle]
type = explod
trigger1 = !numexplod(8197)
anim = 8197
ID = 8197
sprpriority = 64
pos =  160,80
postype = back
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9205, Scale]
type = modifyexplod
trigger1= time>=0
ID = 8197
scale = .125+.005*(time-8), .125+.005*(time-8)
trans = addalpha
alpha = 256-8*(time-8), 8*(time-8)


[State 9205, Safety]
type = removeexplod
trigger1 = time>=45


[State 9205, End]
type = destroyself
trigger1 = time>=45

;-------------------------------------------------------------------------------
;===============================<Level 2>=======================================
;-------------------------------------------------------------------------------
[Statedef 9255]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9210, Circle]
type = explod
trigger1 = !numexplod(8198)
anim = 8198
ID = 8198
sprpriority = 64
pos =  160,80
postype = back
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9210, Scale]
type = modifyexplod
trigger1= time>=0
ID = 8198
scale = .125+.005*(time-8), .125+.005*(time-8)
trans = addalpha
alpha = 256-8*(time-8), 8*(time-8)


[State 9210, Safety]
type = removeexplod
trigger1 = time>=45


[State 9210, End]
type = destroyself
trigger1 = time>=45

;-------------------------------------------------------------------------------
;===============================<MAX Level>=====================================
;-------------------------------------------------------------------------------
[Statedef 9260]
type = A
physics = N
velset = 0,0
anim = 9999


[State 9215, Circle]
type = explod
trigger1 = !numexplod(8199)
anim = 8199
ID = 8199
sprpriority = 64
pos =  160,80
postype = back
facing = facing
removetime = 45
pausemovetime = 300
supermovetime = 300
ownpal = 1


[State 9215, Scale]
type = modifyexplod
trigger1= time>=0
ID = 8199
scale = .125+.005*(time-8), .125+.005*(time-8)
trans = addalpha
alpha = 256-8*(time-8), 8*(time-8)


[State 9215, Safety]
type = removeexplod
trigger1 = time>=45


[State 9215, End]
type = destroyself
trigger1 = time>=45

;-------------------------------------------------------------------------------
;=============================<COUNTER F.X.>====================================
[Statedef 9270]
physics = N
velset = 0,0
anim = 9999

[State 9230, superchargebgpalfx]
type = allpalfx
trigger1 = !time
time = 5
add = 255,255,255
sinadd = -255,-255,-255,20

[State 9230, Helper]
type = Helper
trigger1 = time = 0
helpertype = normal ;player
name = "Counter"
ID = 9271
stateno = 9271
postype = p2
sprpriority = 5
facing = 1
ownpal = 1

[State 9230, slow]
type = null;pause
trigger1 = time <5
time = 2

[State 9220, noshadow]
type = assertspecial
trigger1 = 1
flag = invisible
ignorehitpause = 1

[State 9220, end]
type = destroyself
trigger1= root,movetype!=A

;=============================<COUNTER FX>======================================
[Statedef 9271]
type = A
physics = N
velset = 0,0
anim = 9999

[State 9226, Circle]
type = explod
trigger1 = !numexplod(8196)
anim = 8196
ID = 8196
sprpriority = 64
postype = p2
pos =(enemynear,const(size.mid.pos.x)),(enemynear,const(size.mid.pos.y))
facing = facing
removetime = 32
pausemovetime =-1
supermovetime =-1
ownpal = 1

[State 9221, Scale]
type = modifyexplod
trigger1 = time<8
ID = 8196
scale = .5,.5
trans = addalpha
alpha = 256,0

[State 9221, Scale]
type = modifyexplod
trigger1 = time>=8
ID = 8196
scale = .5+.0625*(time-8), .5+.0625*(time-8)
trans = addalpha
alpha = 256-32*(time-8), 32*(time-8)


[State 9221, Safety]
type = removeexplod
trigger1 = time>=16


[State 9221, End]
type = destroyself
trigger1 = time>=16

;===============================================================================
;Hyper Finish
[Statedef 9300]
physics = N
anim = 9999
sprpriority = -3


[State 9300, AssertSpecial]
type = AssertSpecial
trigger1 = NumExplod(9300) = 1
flag = NoBG
flag2 = NoFG
flag3 = Nomusic


[State 9300, VarSet]
type = VarSet
trigger1 = time = 0
v = 0
value = parent, var(16)

[State 9300, VarSet]
type = VarSet
trigger1 = time = 0
v = 0
value = parent, var(18)

[State 9300, PlaySnd 1]
type = PlaySnd
trigger1 = time = 3
value = S9300,0
persistent = 1

[State 9300, PlaySnd 2]
type = PlaySnd
trigger1 = time = 50
value = S9300,1
persistent = 1

[State 9300, Explod Pos Finish]
type   = Explod
trigger1 = time = 127
anim = 9260
postype = left
ID = 9260
sprpriority = -9
removetime = -2
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
ignorehitpause = 1
supermovetime = 9999
pausemovetime = 9999
supermove = 9999
pausemove = 9999

[State 9300, Explod Finish]
type = Explod
triggerall = NumExplod(9300) = 0
trigger1 = time = 0
ID = 9300
anim = 9300
postype = left
pos = 0, 0
bindtime = -1
removetime = -2
sprpriority = -8
ownpal = 1


[State 9300, ChangeState]
type = ChangeState
trigger1 = NumExplod(9300) = 0
trigger1 = parent, prevstateno =[6000,6999]
value = 9350


;===============================================================================
;Finish
[Statedef 9315]
type = A
velset = 0,0
anim = 9999

[State 9315, Posset]
type = posset
trigger1 = 1
x = 0
y = 0

[State 9315, Playsnd 1]
type = playsnd
trigger1 = time = 1
value = 9315,0
persistent = 1

[State 9315, Playsnd 2]
type = playsnd
triggerall = time = 50
trigger1 = root,StateNo = [1000,2999]
trigger2 = NumHelper >= 0
value = 9316,0
persistent = 1

[State 9315, BG PalFX]
type = bgpalfx
trigger1 = time<10
time = 1
mul = 0,0,0

[State 9315, BG PalFX]
type = bgpalfx
trigger1 = time=[10,20]
time = 1
mul =(time-10)*25,(time-10)*25,(time-10)*25

[State 9315, Explod MvC]
type = explod
trigger1 = !time
anim = 9315
ID = 9315
ontop = 1
postype = Back
pos = 0, 0
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 9315, Modifyexplod Fade]
type = modifyexplod
trigger1 = numexplod(9315)
ID = 9315
trans = addalpha
alpha = ifelse(time<10,256,ceil(256-(time-10)*25.6)),256

[State 9315, Explod Circle]
type = explod
triggerall = !time
trigger1 = Parent,StateNo = [1000,4999]
anim = 9316
ID = 9316
sprpriority = -255
postype = left
pos = 160,120
bindtime = -1
removetime = 20
pausemovetime = -1
supermovetime = -1

[State 9315, Modifyexplod Scale]
type = modifyexplod
trigger1 = numexplod(9316)
ID = 9316
scale =(.25*time),(.25*time)
trans = addalpha
alpha = ceil(256-12.8*time),256

[State 9315, Removeexplod Safety]
type = removeexplod
trigger1 = time>20 && numexplod
trigger2 = roundstate<3
trigger3 = NumHelper(9300)

[State 9315, Assertspecial Nobars]
type = assertspecial
trigger1 = time<=20
flag = nobardisplay
flag2 = noFG
flag3 = globalnoshadow

[State 9315, Destroyself End]
type = destroyself
trigger1 = roundstate<3
trigger2 = NumHelper(9300)

;===============================================================================
;Hyper Finish Core
[Statedef 9350]
physics = N
anim = 9999
sprpriority = -3


[State 9350, AssertSpecial]
type = AssertSpecial
trigger1 = NumExplod(9410) = 1
flag = NoBG
flag2 = NoFG
flag3 = Nomusic


[State 9200, Explod Intro BG]
type = Explod
triggerall = numexplod(9260)= 0
trigger1 = time = 0
trigger2 = time = 120
anim = 9260
postype = left
ID = 9260
sprpriority = -4
removetime = 16
pos = 0,0
scale = 1,1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9200, Explod Image]
type = Explod
trigger1 = numexplod(9410)=0
trigger1 = time = 10
anim = 9410
postype = left
ID = 9410
sprpriority = -5
removetime = 115
pos = 160,120
scale = .37,.37
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


;===============================================================================
;Image
[Statedef 9500]
physics = N
anim = 9999
ctrl = 0
sprpriority = 5

[State 9500, Explod]
type = Explod
trigger1 = root, stateno = 3500
trigger1 = numexplod(9500)= 0
trigger1 = time = 0
anim = 9500
postype = p1
ID = 9500
sprpriority = 6
pos = 0,0
scale = 2.5,2.5
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9500, Explod]
type = Explod
trigger1 = root, stateno = 3900
trigger1 = numexplod(9500)= 0
trigger1 = time = 0
anim = 9501
postype = p1
ID = 9500
sprpriority = 6
pos = 0,0
scale = 2.5,2.5
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9500, Explod]
type = Explod
trigger1 = root, stateno = 3300
trigger1 = numexplod(9500)= 0
trigger1 = time = 0
anim = 3215
postype = p1
ID = 9500
sprpriority = 6
pos = 0,0
scale = 2.5,2.5
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1

[State 9500, Explod]
type = Explod
trigger1 = root, stateno = 3511
trigger1 = numexplod(9500)= 0
trigger1 = time = 0
anim = 3525
postype = p1
ID = 9500
sprpriority = 6
pos = 0,0
scale = 2.5,2.5
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9500, Explod]
type = Explod
trigger1 = root, stateno = 6000
trigger1 = numexplod(9500)= 0
trigger1 = time = 0
anim = 9502
postype = p1
ID = 9500
sprpriority = 6
pos = 0,0
scale = 2.5,2.5
removetime = -1
bindtime = -1
facing = 1
supermove = 99999999999999
pausemove = 99999999999999
ignorehitpause = -1
ownpal = 1


[State 9500, Modifyexplod]
type = modifyexplod
trigger1 = numexplod(9500)
trigger1 = Time <= 45
ID = 9500
scale =(2.5-time*.030),(2.5-time*.030)

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

[State 9500, DestroySelf]
type = DestroySelf
trigger1 = time >=46
ignorehitpause = 1

