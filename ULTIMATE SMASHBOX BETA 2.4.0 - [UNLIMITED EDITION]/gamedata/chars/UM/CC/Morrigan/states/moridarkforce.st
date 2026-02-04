; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;==============================================================================================
;======================================<DARK FORCE STATES>=====================================
;==============================================================================================

;===================<START>===================
[Statedef 774]
type = S
physics = N
movetype = I
anim = 773
ctrl = 0
sprpriority = 1
facep2 = 1

[State 774, End]
type = changestate
trigger1 = !ishelper(775)
value = 0
ctrl = 1

[State 774, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1
[State 774, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 774, Vel]
type = velset
trigger1 = !time
x = 0.05 * facing * (root, pos x + 2 * (root, p2dist x * root, facing) -pos x)

[State 774, Anim]
type = changeanim
trigger1 = anim = 773 && time >= 20
value = 774

[State 774, Vel]
type = velset
trigger1 = anim = 774
x = 0

[State 774, Pos]
type = posset
trigger1 = anim = 774
x = root, pos x + 2 * (root, p2dist x * root, facing)
y = root, pos y

[State 774, Turn]
type = turn
trigger1 = facing = (root, facing)

[State 774, End]
type = changestate
trigger1 = anim = 774 && !animtime
value = 775
[State 774, End]
type = changestate
trigger1 = root, var(20) <= 0
value = 779


;===================<MAIN>===================
[Statedef 775]
type = A
physics = N
movetype = I
anim = 0
ctrl = 0
velset = 0, 0

[State 775, End]
type = selfstate
trigger1 = !ishelper(775)
value = 0
ctrl = 1

[State 775, NHB]
type = nothitby
trigger1 = 1
time = -1
value = SCA, AA, AP, AT
ignorehitpause = 1
[State 775, Push]
type = playerpush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 775, Anim]
type = changeanim
trigger1 = selfanimexist(root, anim)
trigger1 = root, stateno != [770, 771]
trigger1 = ifelse((root, movetype = H), (root, anim = [5000, 5300]), 1)
trigger1 = (anim != root, anim) || (animelemno(0) != root, animelemno(0))
value = root, anim
elem = root, animelemno(0)
ignorehitpause = 1

[State 775, Custom States Anim]
type = changeanim
trigger1 = root, movetype = H
trigger1 = root, anim != [5000, 5300]
trigger2 = !selfanimexist(root, anim)
value = 5010
ignorehitpause = 1

[State 775, Pos]
type = bindtoroot
trigger1 = 1
time = 1
facing = -1
pos = 2 * (root, p2dist x), 0

[State 775, Spr]
type = sprpriority
trigger1 = 1
value = 0
ignorehitpause = 1

[State 775, Type]
type = statetypeset
trigger1 = root, movetype = A
movetype = A
ignorehitpause = 1

[State 775, Type]
type = statetypeset
trigger1 = root, movetype = I
trigger2 = root, movetype = H
movetype = I
ignorehitpause = 1

[State 775, Strength]
type = varset
trigger1 = 1
var(10) = root, var(10)
[State 775, Hit Reset]
type = movehitreset
trigger1 = !(root, movecontact)
[State 775, Dampener]
type = attackmulset
trigger1 = 1
value = root, fvar(12)
ignorehitpause = 1

[State 775, No rapid fire]
type = varadd
trigger1 = var(0) > 0
var(0) = 1
ignorehitpause = 1

[State 775, No rapid fire]
type = varset
trigger1 = !var(0)
trigger1 = numtarget
trigger1 = anim = 200 || anim = 201 || anim = 400 || anim = 430 || anim = 431
var(0) = 1
ignorehitpause = 1

[State 775, No rapid fire]
type = varset
trigger1 = !numtarget
var(0) = 0

[State 775, FX]
type = explod
trigger1 = root, stateno = 1000
trigger1 = anim = 1000 && animelem = 1
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
ownpal = 1
[State 775, SoulFist]
type = helper
trigger1 = root, stateno = 1000
trigger1 = anim = 1000 && animelem = 6
helpertype = normal
stateno = 1005
ID = 1005
name = "Soul Fist"
postype = p1
pos = ceil(6 * const(size.xscale)), ceil(-50 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1010
trigger1 = anim = 1000 && animelem = 1
anim = 1004
ID = 1004
sprpriority = 3
postype = p1
ownpal = 1
[State 775, EX SoulFist]
type = helper
trigger1 = root, stateno = 1010
trigger1 = anim = 1000 && animelem = 6
helpertype = normal
stateno = 1015
ID = 1015
name = "EX Soul Fist"
postype = p1
pos = ceil(12 * const(size.xscale)), ceil(-100 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1050
trigger1 = anim = 1050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1
[State 775, SoulFist]
type = helper
trigger1 = root, stateno = 1050
trigger1 = anim = 1050 && animelem = 6
helpertype = normal
stateno = 1055
ID = 1055
name = "Soul Fist"
postype = p1
pos = ceil(120 * const(size.xscale)), ceil(-96 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 1060
trigger1 = anim = 1050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1
[State 775, EX Air Soul Fist]
type = helper
trigger1 = root, stateno = 1060
trigger1 = anim = 1050 && animelem = 6
helpertype = normal
stateno = 1065
ID = 1065
name = "EX Air Soul Fist"
postype = p1
pos = ceil(120 * const(size.xscale)), ceil(-96 * const(size.yscale))
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 3000
trigger1 = anim = 3000 && animelem = 3
anim = 3004
ID = 3004
sprpriority = 3
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1
[State 775, SoulFist]
type = helper
trigger1 = root, stateno = 3000
trigger1 = anim = 3000 && animelem = 6
helpertype = normal
stateno = 3005
ID = 3005
name = "Soul Fist"
postype = p1
pos = 6, -50
size.xscale = 0.85
size.yscale = 0.85
ownpal = 1

[State 775, FX]
type = explod
trigger1 = root, stateno = 3050
trigger1 = anim = 3050 && animelem = 4
anim = 1054
ID = 1054
sprpriority = 3
postype = p1
bindtime = -1
removeongethit = 1
ownpal = 1
[State 775, SoulFist]
type = helper
trigger1 = root, stateno = 3050
trigger1 = anim = 3050 && animelem = 6
helpertype = normal
stateno = 3055
ID = 3055
name = "Soul Fist"
postype = p1
pos = 60, -48
size.xscale = 0.85
size.yscale = 0.85
ownpal = 1

[State 775, Hit]
type = hitdef
trigger1 = (root, anim = [200, 201]) && root, animelem = 2
trigger1 = root, var(15) < 1
attr = S, NA
damage = 30, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, anim = 200), -82, -74)
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = Low
air.velocity = 0, -2
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 210 && root, animelem = 3
trigger1 = root, var(15) < 1
attr = S, NA
damage = 70, 0
animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8011)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -54
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -3.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 211 && root, animelem = 4
trigger1 = root, var(15) < 1
attr = S, NA
damage = 80, 0
animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -62
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -3.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 220 && root, animelem = 5
trigger1 = root, var(15) < 1
attr = S, NA
damage = 100, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -4.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 221 && root, animelem = 2
trigger1 = root, var(15) < 1
attr = S, NA
damage = 90, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -36
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -4.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 221 && root, animelem = 3 && !movecontact && !movereversed
trigger1 = root, var(15) < 1
attr = S, NA
damage = 90, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -62
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -4.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 230 && root, animelem = 2
trigger1 = root, var(15) < 1
attr = S, NA
damage = 30, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -32
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = Low
air.velocity = 0, -2
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 240 && root, animelem = 4
trigger1 = root, var(15) < 1
attr = S, NA
damage = 70, 0
animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8011)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -53
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -3.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 250 && root, animelem = 4
trigger1 = root, var(15) < 1
attr = S, NA
damage = 90, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -59
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -4.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255 && (root, animelem = 3 || root, animelem = 4)
trigger1 = root, var(15) < 1
attr = A, NA
damage = 30, 0
animtype = Hard
guardflag = HA
hitflag = HAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, animelem = 3), -96, -72)
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -3
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255 && root, animelem = 5
trigger1 = root, var(15) < 1
attr = A, NA
damage = 30, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -3
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 255 && root, animelem = 6
trigger1 = root, var(15) < 1
attr = A, NA
damage = 30, 0
animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -24
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, 9
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 400 && (root, animelem = 2 || root, animelem = 3)
trigger1 = root, var(15) < 1
attr = C, NA
damage = 20, 0
animtype = Light
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -36
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = Low
air.velocity = 0, -2
down.velocity = 0, -2
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 410 && root, animelem = 2
trigger1 = root, var(15) < 1
attr = C, NA
damage = 60, 0
animtype = Medium
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -29
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -3.5
down.velocity = 0, -3
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, animelem = 4 && root, anim = 420
trigger1 = root, var(15) < 1
attr = C, NA
damage = 100, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -32
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -4.5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, animelem = 3 && root, anim = 425
trigger1 = root, var(15) < 1
attr = C, NA
damage = 90, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -120
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -11
air.type = Low
air.velocity = 0, -11
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = (root, anim = 430 || root, anim = 431) && root, animelem = 2
trigger1 = root, var(15) < 1
attr = C, NA
damage = 30, 0
animtype = Light
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, anim = 430), -4, -17)
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = Low
air.velocity = 0, -2
down.velocity = 0, -2
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850
fall = var(0) >= 40

[State 775, Hit]
type = hitdef
trigger1 = (root, anim = 440 || root, anim = 441) && root, animelem = 2
trigger1 = root, var(15) < 1
attr = S, NA
damage = 70, 0
animtype = Medium
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8011)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, anim = 440), -14, -31)
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -3.5
down.velocity = 0, -3
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 450 && root, animelem = 4
trigger1 = root, var(15) < 1
attr = C, NA
damage = 80, 0
animtype = Hard
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -30
hitsound = -1
guardsound = -1
ground.type = Trip
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -3
air.type = Trip
air.velocity = 0, -3
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 600 && root, animelem = 2
trigger1 = root, var(15) < 1
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -43
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = Low
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 610 && root, animelem = 3
trigger1 = root, var(15) < 1
attr = A, NA
damage = 70, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -48
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = Low
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 620 && root, animelem = 6
trigger1 = root, var(15) < 1
attr = A, NA
damage = 90, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -66
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = (root, anim = [630, 631]) && root, animelem = 2
trigger1 = root, var(15) < 1
attr = A, NA
damage = 40, 0
animtype = Light
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, anim = 630), -42, -62)
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = 0
air.type = High
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 9
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 640 && root, animelem = 3
trigger1 = root, var(15) < 1
attr = A, NA
damage = 70, 0
animtype = Medium
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8011)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -47
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 15
ground.hittime = 15
ground.velocity = 0
air.type = High
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 1
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 650 && root, animelem = 3
trigger1 = root, var(15) < 1
attr = A, NA
damage = 90, 0
animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8012)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -54
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0
air.type = Low
air.velocity = 0, -5
getpower = 0
givepower = 0
envshake.time = 10
envshake.freq = 60
envshake.ampl = 3
yaccel = 0.4850

[State 775, Hit]
type = hitdef
trigger1 = (root, animelem = 2 || root, animelem = 3) && root, anim = 1100
trigger1 = root, var(15) < 1
trigger1 = !movecontact && !movereversed
attr = S, SA
damage = 90 + (10 * var(10)), 0
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8023)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, animelem = 2), -35, -60)
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = 0, -6 -var(10)
air.type = Low
air.velocity = 0, -6 -var(10)
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = 2
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = root, animelem = 4 && root, anim = 1100
trigger1 = root, var(15) < 1
trigger1 = !movecontact && !movereversed
attr = A, SA
damage = 60, 0
animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8023)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = 0, -6 -var(10)
air.type = Low
air.velocity = 0, -6 -var(10)
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = 2
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1
[State 775, Hit]
type = hitdef
trigger1 = root, anim = 1110
trigger1 = root, animelem = 2 || root, animelem = 3
trigger1 = (root, var(15) < (2 + root, hitcount))
attr = S, SA
damage = 40, 5
animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -10.0
air.type = Low
air.velocity = 0, -10.0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = root, anim = 1110
trigger1 = root, animelem = 4
trigger1 = (root, var(15) < (2 + root, hitcount))
attr = A, SA
damage = 60, 7
animtype = Up
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 8, 8
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18
ground.velocity = 0, -10.0
air.type = Low
air.velocity = 0, -10.0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.cornerpush.veloff = 0
airguard.velocity = 0, -1.5
forcestand = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = [1205, 1207]
trigger1 = root, animelem = 4 || root, animelem = 10 || root, animelem = 16
trigger1 = root, var(15) < 1
attr = S, SA
damage = 40, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8023)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -7
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = 0, -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 1251
trigger1 = !((root, movecontact + root, movereversed) % 8)
trigger1 = root, var(15) < 1
attr = S, SA
damage = 20, 0
animtype = Hard
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = ifelse(root, fvar(31), -1, 2)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -60
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18
p2facing = 1
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -7
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
getpower = 0, 0
givepower = 40, 40
envshake.time = 12
envshake.freq = 180
envshake.ampl = 2
fall = 0
air.fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = 0, -1.5
forcestand = 1
airguard.cornerpush.veloff = 0

[State 775, Hit]
type = hitdef
trigger1 = (root, animelem = 2 || root, animelem = 3) && root, anim = 3100
trigger1 = root, var(15) < 1
attr = S, HA
damage = 25, 0
animtype = Back
guardflag = M
hitflag = MAFD
priority = 4, Hit
pausetime = 3, 4
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8024)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, ifelse((root, animelem = 2), -35, -60)
hitsound = -1
guardsound = -1
ground.type = Low
ground.slidetime = 22
ground.hittime = 22
ground.velocity = 0, -10
air.type = Low
air.velocity = 0, -10
down.hittime = 20
down.velocity = 0, 0
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = 5
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
fall.animtype = Medium
yaccel = 0.4850
forcestand = 1

[State 775, Hit 2]
type = hitdef
trigger1 = (root, animelem = 4 || root, animelem = 6 || root, animelem = 8 || root, animelem = 9 || root, animelem = 10 || root, animelem = 11) && root, anim = 3100
trigger1 = root, var(15) < 1
attr = A, HA
damage = 25, 0
animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = ifelse((root, animelem = 11), 15, 3), ifelse((root, animelem = 11), 15, 3)
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8024)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -100
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 22
ground.hittime = 22
ground.velocity = 0, -10
air.type = Low
air.velocity = 0, -10
down.velocity = 0, 0
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = 5
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
fall = 1
fall.recover = 0
yaccel = 0.4850
forcestand = 1

[State 775, Hit]
type = hitdef
trigger1 = root, anim = 3402 && hitcount <= 13
trigger1 = !((root, movecontact + root, movereversed) % 3)
trigger1 = root, var(15) < (3 + hitcount)
attr = A, HA
damage = 11, 0
animtype = Hard
air.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 6, 6
sparkno = ifelse(root, fvar(31), -1, 2) + 0 * (var(33) := 8024)
guard.sparkno = ifelse(root, fvar(31), -1, 40)
sparkxy = -10, -43
hitsound = -1
guardsound = -1
ground.type = High
ground.slidetime = 32
ground.hittime = 32
ground.velocity = 0, 0
air.type = Low
air.velocity = 0, -2
air.fall = 1
fall.recover = 0
getpower = 0
givepower = 0
envshake.time = 12
envshake.freq = 60
envshake.ampl = 5
yaccel = 0.4850
forcestand = 1

[State 775, Hit Detection]
type = varset
trigger1 = movecontact = 1 && var(30) < 0
var(30) = hitpausetime
ignorehitpause = 1

[State 775, Sparks]
type = varset
trigger1 = var(33) := (root, var(33))
trigger1 = var(34) := (root, var(34))
trigger1 = var(35) := (root, var(35))
trigger1 = var(36) := (root, var(36))
trigger1 = var(37) := (root, var(37))
var(35) = var(35)
ignorehitpause = 1

[State 775, Sparks]
type = helper
triggerall = root, fvar(31)
triggerall = movecontact = 1 && var(30) = hitpausetime
trigger1 = movehit = 1 && numenemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8020 || var(33) = 8021 || var(33) = 8022 || var(33) = 8023 || var(33) = 8024
trigger2 = moveguarded = 1 && numenemy
trigger2 = var(34) = 8000 || var(34) = 8001
helpertype = normal
stateno = ifelse(moveguarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = p1
pos = ceil(cond(p2dist x > (var(36) * const(size.xscale)), (var(36) * const(size.xscale)), cond(p2dist x > (var(35) * const(size.xscale)), p2dist x, (var(35) * const(size.xscale))))), ceil(var(37) * const(size.yscale))
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 775, Hit Detection]
type = varset
trigger1 = 1
var(30) = -1

[State 775, End]
type = changestate
trigger1 = root, var(20) <= 0
value = 779


;========================<DISAPPEAR>=============================
[Statedef 779]
physics = N
velset = 0, 0

[State 779, Anim]
type = changeanim
trigger1 = 1
value = anim
elem = animelemno(0)

[State 779, shrink]
type = angledraw
trigger1 = 1
scale = 1 -(0.1 * time), 1

[State 779, Trans]
type = trans
trigger1 = 1
trans = addalpha
alpha = 256 - ceil(25.6 * time), ceil(25.6 * time)

[State 779, Bats]
type = helper
trigger1 = time = 1 || time = 2 || time = 4 || time = 6 || time = 8
helpertype = normal
stateno = 6110
ID = 6110
name = "Bat"
postype = p1
pos = 0, -55

[State 779, End]
type = destroyself
trigger1 = time >= 10
