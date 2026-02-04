; ___________________________________
;| Morrigan by Phantom.of.the.Server |
; ___________________________________
;============================================================================================
;=====================================<NORMAL STATES>========================================
;============================================================================================

;=========<Standing Light Punch>==========
[Statedef 200]
type = S
movetype = A
physics = S
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 201, 200)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0

[State 200, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 200, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -72
;sparkXY = -10 + 0 * (var(35) := 60), var(36):=-80
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12 + 2 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 200, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Medium Punch>==========
[Statedef 210]
type = S
movetype = A
physics = S
anim = ifelse(p2bodydist x <= (const(size.xscale) * 25), 211, 210)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 210, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 210, Snd]
type = playsnd
trigger1 = anim = 210 && animelem = 3
trigger2 = anim = 211 && animelem = 4
value = 1, 1;ifelse(anim = 210, 1, 8)
channel = 1

[State 210, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = anim = 210 && animelem = 3
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -54
hitsound = -1 + 0 * (var(31) := 2)
guardsound = -1
ground.type = Low
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9) + 3 * var(9)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = anim = 211 && animelem = 4
attr = S, NA
damage = 80, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8021)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -62
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1
ground.type = High
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9) + 3 * var(9)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 210, Blood]
type = helper
trigger1 = fvar(32)
trigger1 = anim = 211
trigger1 = hitpausetime = 9
trigger1 = movehit = 1 && numtarget
helpertype = normal
stateno = 7051
ID = 7050
name = "Blood"
postype = p1
pos = ifelse(p2dist x < 0, 0, ceil(p2dist x)), -62
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 210
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 210
elem = 4
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 211
elem = 5
ignorehitpause = 1

[State 210, Anim]
type = changeanim
trigger1 = anim = 211
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 5
value = 211
elem = 6
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 210 && animelemtime(4) >= 0
trigger2 = anim = 211 && animelemtime(7) >= 0
movetype = I

[State 210, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Hard Punch>==========
[Statedef 220]
type = S
movetype = A
physics = S
anim = ifelse(prevstateno = 710 || ((prevstateno != [200, 299]) && p2bodydist x <= (const(size.xscale) * 25)), 221, 220)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 220, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 220, Snd]
type = playsnd
trigger1 = anim = 220 && animelem = 4
trigger2 = anim = 221 && animelem = 2
value = 1, ifelse((anim = 220), 3, 9)
channel = 1

[State 220, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = anim = 220 && animelem = 5
attr = S, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -48
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 220, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = anim = 221 && animelem = 2
attr = S, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -36
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

[State 220, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = anim = 221 && animelem = 3 && !movecontact && !movereversed
attr = S, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -62
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

;[State 220, Blood]
;type = helper
;trigger1 = fvar(32)
;trigger1 = hitpausetime = 9
;trigger1 = movehit = 1 && numtarget
;helpertype = normal
;stateno = 7052
;ID = 7050
;name = "Blood"
;postype = p1
;pos = ifelse(p2dist x < 0, 0, ceil(p2dist x)), ifelse(anim = 220, -48, ifelse(animelemtime(3) < 0, -36, -62))
;facing = -1
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 220
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 8
value = 220
elem = 6
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 221
elem = 3
ignorehitpause = 1

[State 220, Anim]
type = changeanim
trigger1 = anim = 221
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 5
value = 221
elem = 4
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = anim = 220 && animelemtime(6) >= 0
trigger2 = anim = 221 && animelemtime(5) >= 0
movetype = I

[State 220, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Light Kick>==========
[Statedef 230]
type = S
movetype = A
physics = S
anim = 230
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 230, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 230, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 230, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = S, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -32
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = High
ground.slidetime = 12
ground.hittime = 12 + 2 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 230, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Medium Kick>==========
[Statedef 240]
type = S
movetype = A
physics = S
anim = 240
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 240, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 240, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 5
channel = 1

[State 240, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 4
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -53
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 240, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 4 && prevstateno = 710
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -53
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9)
ground.velocity = -6.46 * !numhelper(775), -5.25
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.velocity = -6.46 * !numhelper(775), -5.25
air.cornerpush.veloff = 0
guard.cornerpush.veloff = 0
guard.velocity = -10.52 * !numhelper(775)
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall = 1
fall.recover = 1
fall.recovertime = 120

[State 240, Anim]
type = changeanim
trigger1 = anim = 240
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 240
elem = 5
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 240, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Hard Kick>==========
[Statedef 250]
type = S
movetype = A
physics = S
anim = 250
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 250, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 250, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 9
channel = 1

[State 250, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 4
attr = S, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -59
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)
forcestand = 1

;[State 250, Blood]
;type = helper
;trigger1 = fvar(32)
;trigger1 = hitpausetime = 9
;trigger1 = movehit = 1 && numtarget
;helpertype = normal
;stateno = 7052
;ID = 7050
;name = "Blood"
;postype = p1
;pos = ifelse(p2dist x < 0, 0, ceil(p2dist x)), -59
;facing = -1
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 8
value = 250
elem = 5
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(5) >= 0 && animelemtime(6) <= 0
trigger1 = hitpausetime <= 6
value = 250
elem = 6
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= 4
value = 250
elem = 7
ignorehitpause = 1

[State 250, Anim]
type = changeanim
trigger1 = anim = 250
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(7) >= 0 && animelemtime(8) <= 0
trigger1 = hitpausetime <= 2
value = 250
elem = 8
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 250, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Standing Hard Kick 2>==========
[Statedef 255]
type = S
movetype = A
physics = S
anim = 255
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 255, Width]
type = width
trigger1 = animelemtime(3) >= 0
player = ceil(30 * const(size.xscale)), 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 3
value = 3, ifelse(random < 500, 0, 2)
channel = 0

[State 255, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 255, Type]
type = statetypeset
trigger1 = animelemtime(2) >= 0
statetype = A
physics = N

[State 255, Accel]
type = veladd
trigger1 = animelemtime(3) >= 0
y = 0.5

[State 255, Vel]
type = velset
trigger1 = animelem = 3
x = 4
y = -5

[State 255, Snd]
type = playsnd
trigger1 = animelem = 2
value = 0, 40
[State 255, Dust]
type = helper
trigger1 = animelem = 2
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 255, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 3 || animelem = 4
attr = A, NA
damage = 30, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = HAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((animelem = 3), -96, -72)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 255, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 5
attr = A, NA
damage = 30, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 4, 4
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -48
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 255, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 6
attr = A, NA
damage = 30, 0
animtype = Hard
air.animtype = Hard
fall.animtype = Hard
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -24
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -6, 9
air.fall = 1
fall.recover = 1
fall.recovertime = 120
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State Land]
type = changestate
trigger1 = statetype = A
trigger1 = vel y > 0 && (pos y > -vel y)
value = 256


;---Land---
[Statedef 256]
type = S
physics = S
movetype = I
anim = 256
ctrl = 0
velset = 0, 0
sprpriority = 1
movehitpersist = 1
hitcountpersist = 1

[State 255, Pos]
type = posset
trigger1 = 1
y = 0

[State 255, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 255, Dust]
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

[State 255, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Crouching Light Punch>==========
[Statedef 400]
type = C
movetype = A
physics = C
anim = 400
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 400, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 400, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 400, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2 || animelem = 3
attr = C, NA
damage = 20, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -36
hitsound = -1 + 0 * (var(31) := 1)
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12 + 2 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State Idle]
type = statetypeset
trigger1 = animelemtime(4) >= 0
movetype = I

[State 400, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouching Medium Punch>==========
[Statedef 410]
type = C
movetype = A
physics = C
anim = 410
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 410, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 410, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 8
channel = 1

[State 410, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = C, NA
damage = 60, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -29
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1
ground.type = Low
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

;[State 410, Blood]
;type = helper
;trigger1 = fvar(32)
;trigger1 = hitpausetime = 9
;trigger1 = movehit = 1 && numtarget
;helpertype = normal
;stateno = 7051
;ID = 7050
;name = "Blood"
;postype = p1
;pos = ifelse(p2dist x < 0, 0, ceil(p2dist x)), -29
;facing = -1
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State 410, Anim]
type = changeanim
trigger1 = anim = 410
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 410
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 410, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouching Hard Punch>==========
[Statedef 420]
type = C
movetype = A
physics = C
anim = 420
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 420, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 420, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
channel = 1

[State 420, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 4
attr = C, NA
damage = 100, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -32
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -10.52 * !numhelper(775), 0
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
down.velocity = -4, -4
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

;[State 420, Blood]
;type = helper
;trigger1 = fvar(32)
;trigger1 = hitpausetime = 9
;trigger1 = movehit = 1 && numtarget
;helpertype = normal
;stateno = 7052
;ID = 7050
;name = "Blood"
;postype = p1
;pos = ifelse(p2dist x < 0, 0, ceil(p2dist x)), -32
;facing = -1
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 420, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Ecstatic Climb>==========
[Statedef 425]
type = C
movetype = A
physics = C
anim = 425
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 425, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 425, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 9
channel = 1

[State 425, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 3
attr = C, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Up
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -120
hitsound = -1 + 0 * (var(31) := 9)
guardsound = -1
ground.type = Low
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -1.5 * !numhelper(775), -11
ground.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -3 * !numhelper(775), -11
air.cornerpush.veloff = 0
getpower = ifelse(p2movetype = H, 72, 216) * !var(20), 36 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcestand = 1
fall = 1

[State 425, Anim]
type = changeanim
trigger1 = anim = 425
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 425
elem = 4
ignorehitpause = 1

[State 425, Anim]
type = changeanim
trigger1 = anim = 425
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(4) >= 0 && animelemtime(5) <= 0
trigger1 = hitpausetime <= 5
value = 425
elem = 5
ignorehitpause = 1

;[State 425, Blood]
;type = helper
;trigger1 = fvar(32)
;trigger1 = hitpausetime = 9
;trigger1 = movehit = 1 && numtarget
;helpertype = normal
;stateno = 7052
;ID = 7050
;name = "Blood"
;postype = p1
;pos = ceil(p2dist x), ceil(p2dist y - target, const(size.height))
;facing = -1
;ownpal = 1
;pausemovetime = 65535
;supermovetime = 65535
;ignorehitpause = 1

[State 425, Jump Cancel]
type = changestate
value = 40
trigger1 = movehit = 1
trigger1 = !AIlevel && !ishelper
trigger1 = roundstate = 2 && command = "holdup"

[State Idle]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I

[State 425, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;=========<Crouching Light Kick>==========
[Statedef 430]
type = C
movetype = A
physics = C
anim = ifelse(command = "holdfwd", 431, 430)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 430, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 430, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 430, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = C, NA
damage = 30, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((anim = 430), -4, -17)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = Low
ground.slidetime = 12
ground.hittime = 12 + 2 * var(9)
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
down.velocity = -2, -2
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 430, Anim]
type = changeanim
trigger1 = anim = 430
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 430
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 430, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouching Medium Kick>==========
[Statedef 440]
type = C
movetype = A
physics = C
anim = ifelse(command = "holdfwd", 441, 440)
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 440, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 440, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 5
channel = 1

[State 440, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = S, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((anim = 440), -14, -31)
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = Low
ground.slidetime = 14
ground.hittime = 15 + 3 * var(9)
ground.velocity = -7.51 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
down.velocity = -3, -3
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 440, Anim]
type = changeanim
trigger1 = anim = 440
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 440
elem = 3
ignorehitpause = 1

[State 440, Anim]
type = changeanim
trigger1 = anim = 441
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 441
elem = 3
ignorehitpause = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 440, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Crouching Hard Kick>==========
[Statedef 450]
type = C
movetype = A
physics = C
anim = 450
velset = 0, 0
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = 1

[State 450, Snd]
type = playsnd
trigger1 = animelem = 4 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 450, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 450, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 4
attr = C, NA
damage = 80, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = L
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -30
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = Trip
ground.slidetime = 18
ground.hittime = 18 + 4 * var(9)
ground.velocity = -1, -8.24
air.type = Trip
air.velocity = -1, -8.24
down.velocity = -4, -4
ground.cornerpush.veloff = 0
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.677
fall = 1
fall.recover = !var(9)
fall.recovertime = 120

[State Idle]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State 450, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;=========<Air Light Punch>==========
[Statedef 600]
type = A
movetype = A
physics = N
anim = 600
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 600, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 600, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 1
channel = 1

[State 600, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = A, NA
damage = 40, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -43
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 12
guard.slidetime = 12
guard.velocity = -4.49 * !numhelper(775)
guard.cornerpush.veloff = 0;-9.83
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 600, Anim]
type = changeanim
trigger1 = anim = 600
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 600
elem = 3
ignorehitpause = 1

[State 600, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Medium Punch>==========
[Statedef 610]
type = A
movetype = A
physics = N
anim = 610
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 610, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 8
channel = 1
[State 610, Snd]
type = playsnd
trigger1 = animelem = 3
value = 5, 5
channel = 1

[State 610, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 3
attr = A, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -48
hitsound = -1 + 0 * (var(31) := 8)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 15
guard.slidetime = 15
guard.velocity = -7.51 * !numhelper(775)
guard.cornerpush.veloff = 0;-13.38
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 610, Anim]
type = changeanim
trigger1 = anim = 610
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 610
elem = 4
ignorehitpause = 1

[State 610, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Hard Punch>==========
[Statedef 620]
type = A
movetype = A
physics = N
anim = 620
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 620, Snd]
type = playsnd
trigger1 = animelem = 5 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 620, Snd]
type = playsnd
trigger1 = animelem = 5
value = 1, 3
channel = 1

[State 620, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 6
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -66
hitsound = -1 + 0 * (var(31) := 3)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 18
guard.slidetime = 18
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 620, Anim]
type = changeanim
trigger1 = anim = 620
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(6) >= 0 && animelemtime(7) <= 0
trigger1 = hitpausetime <= 8
value = 620
elem = 7
ignorehitpause = 1

[State 620, Type]
type = statetypeset
trigger1 = animelemtime(7) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Light Kick>==========
[Statedef 630]
type = A
movetype = A
physics = N
anim = ifelse(vel x, 630, 631)
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 630, Snd]
type = playsnd
trigger1 = animelem = 2 && random < 200
value = 3, ifelse(random < 500, 1, 2)
channel = 0
[State 630, Snd]
type = playsnd
trigger1 = animelem = 2
value = 1, 4
channel = 1

[State 630, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 2
attr = A, NA
damage = 40, 0
animtype = Light
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8010)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := ifelse((anim = 630), -42, -62)
hitsound = -1 + 0 * (var(31) := 4)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 12
guard.slidetime = 12
guard.velocity = -4.49 * !numhelper(775)
guard.cornerpush.veloff = 0;-9.83
air.type = High
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 50) * !var(20), 25 * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 630, Anim]
type = changeanim
trigger1 = anim = 630
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 630
elem = 3
ignorehitpause = 1

[State 630, Anim]
type = changeanim
trigger1 = anim = 631
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(2) >= 0 && animelemtime(3) <= 0
trigger1 = hitpausetime <= 8
value = 631
elem = 3
ignorehitpause = 1

[State 630, Type]
type = statetypeset
trigger1 = anim = 630 && animelemtime(7) >= 0
trigger2 = anim = 631 && animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Medium Kick>==========
[Statedef 640]
type = A
movetype = A
physics = N
anim = 640
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 640, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 350
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 640, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 5
channel = 1

[State 640, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 3
attr = A, NA
damage = 70, 0
animtype = Medium
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8011)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := -25) * (var(36) := 75), var(37) := -42
hitsound = -1 + 0 * (var(31) := 5)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 15
guard.slidetime = 15
guard.velocity = -7.51 * !numhelper(775)
guard.cornerpush.veloff = 0;-13.38
air.type = High
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 100) * !var(20), ifelse(moveguarded, 25, 50) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 640, Anim]
type = changeanim
trigger1 = anim = 640
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 640
elem = 4
ignorehitpause = 1

[State 640, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========<Air Hard Kick>==========
[Statedef 650]
type = A
movetype = A
physics = N
anim = 650
poweradd = 0
sprpriority = 1
ctrl = 0
facep2 = (prevstateno = [100, 105]) && p2dist x < 0
velset = vel x * ifelse((prevstateno = [100, 105]), 0.5, 1), vel y

[State 650, Snd]
type = playsnd
trigger1 = animelem = 3 && random < 500
value = 3, ifelse(random < 500, 0, 2)
channel = 0
[State 650, Snd]
type = playsnd
trigger1 = animelem = 3
value = 1, 6
channel = 1

[State 650, Hit]
type = hitdef
trigger1 = var(15) < 1
trigger1 = animelem = 3
attr = A, NA
damage = 90, 0
animtype = Hard
air.animtype = Back
fall.animtype = Back
guardflag = HA
hitflag = MAF
priority = 4, Hit
pausetime = 10, 10
sparkno = -1 + 0 * (var(33) := 8012)
guard.sparkno = -1 + 0 * (var(34) := 8000)
sparkxy = -10 + 0 * (var(35) := 30) * (var(36) := 90), var(37) := -54
hitsound = -1 + 0 * (var(31) := 6)
guardsound = -1
ground.type = High
ground.hittime = 12
ground.slidetime = 12
ground.velocity = -4.49 * !numhelper(775), 0
ground.cornerpush.veloff = 0;-9.83
guard.hittime = 18
guard.slidetime = 18
guard.velocity = -10.52 * !numhelper(775)
guard.cornerpush.veloff = 0
air.type = Low
air.hittime = 120
air.velocity = -4.25 * !numhelper(775), -6.88
air.cornerpush.veloff = 0
getpower = ifelse(movehit, 25, 200) * !var(20), ifelse(moveguarded, 25, 100) * !var(20)
givepower = 40, 40
yaccel = 0.4850
airguard.ctrltime = 16
airguard.velocity = -6.00 * !numhelper(775), -1.00
airguard.cornerpush.veloff = 0
fall.recover = 1
fall.recovertime = 120
forcenofall = !var(20)

[State 650, Anim]
type = changeanim
trigger1 = anim = 650
trigger1 = (movecontact = 1 || movereversed = 1) && hitpausetime
trigger1 = animelemtime(3) >= 0 && animelemtime(4) <= 0
trigger1 = hitpausetime <= 8
value = 650
elem = 4
ignorehitpause = 1

[State 650, Type]
type = statetypeset
trigger1 = animelemtime(5) >= 0
movetype = I

[State Gravity]
type = gravity
trigger1 = 1

[State Land]
type = changestate
trigger1 = vel y > 0 && (pos y > -vel y)
value = 52


;=========================================================================
;===============================<THROWS>==================================
;=========================================================================
;========<GROUND THROW CONTROLLER>==========
[Statedef 800]
type = S
movetype = A
physics = S
velset = 0, 0
ctrl = 0
anim = 800
sprpriority = 1
facep2 = 1
poweradd = 0

[State 800, Strength]
type = varset
trigger1 = !time && !AIlevel
var(10) = ifelse(command = "kk", 2, 1)
[State 800, Strength]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse(random < 500, 2, 1)

[State 800, Tech Hit]
type = varset
trigger1 = 1
var(19) = 0
[State 800, Tech Hit]
type = varset
trigger1 = numenemy
trigger1 = enemynear, statetype != A
trigger1 = (enemynear, stateno = [0, 999]) && (enemynear, stateno != [100, 119]) && (enemynear, stateno != [200, 799]) && enemynear, anim != 5300
var(19) = 7

[State 800, Do not guard]
type = attackdist
trigger1 = 1
value = 0

[State 800, Hit]
type = hitdef
trigger1 = !var(29)
trigger1 = animelem = 2
trigger1 = p2dist x >= 0 && p2bodydist x <= ceil(64 * const(size.xscale))
ID = 800
attr = S, NT
hitflag = M
priority = 1, Miss
sparkno = -1 + 0 * (var(33) := 0)
hitsound = -1 + 0 * (var(31) := 800)
p1facing = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 1, -1)
p2facing = 1
p1stateno = ifelse((!AIlevel && command = "holdfwd") || (AIlevel && frontedgedist < backedgedist), 801, 803)
guard.dist = 0
animtype = Back
fall = 1
fall.recover = 1
fall.recovertime = 120
numhits = 0

[State 800, Snd]
type = playsnd
trigger1 = animelem = 4
value = 5000, 1
channel = 0

[State 800, Snd]
type = playsnd
trigger1 = animelem = 4
value = 1, 1
channel = 1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 800, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- PLAYER ---
[Statedef 801]
type = S
movetype = A
physics = S
anim = 801
ctrl = 0
sprpriority = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 802

[State 801, grab snd]
type = playsnd
trigger1 = !time
value = 4, 29
channel = 0

[State Width]
type = width
trigger1 = 1
edge = ceil(60 * const(size.xscale)), 0

[State 801, Bind 1]
type = targetbind
trigger1 = 1
pos = ceil(100 * const(size.xscale)), 0

[State 801, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 1, 810, 820)
ctrl = 0


;--- PLAYER TURNS ---
[Statedef 803]
type = S
movetype = A
physics = S
anim = 803
ctrl = 0
velset = 0, 0
sprpriority = -1

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State Throw]
type = targetstate
trigger1 = !time
value = 804

[State 803, grab snd]
type = playsnd
trigger1 = !time
value = 4, 29
channel = 0

[State Width]
type = width
trigger1 = 1
edge = ceil(60 * const(size.xscale)), ceil(60 * const(size.xscale))

[State 803, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(-100 * const(size.xscale)), 0

[State 803, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(-50 * const(size.xscale)), 0

[State 803, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = 0, 0

[State 803, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0
pos = ceil(50 * const(size.xscale)), 0

[State 803, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0
pos = ceil(100 * const(size.xscale)), 0

[State 803, End]
type = changestate
trigger1 = !animtime
value = ifelse(var(10) = 1, 810, 820)
ctrl = 0


;--- TARGET ---
[Statedef 802]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 802, Anim]
type = changeanim2
trigger1 = !time
value = 802

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


[Statedef 804]
type = A
physics = N
movetype = H
velset = 0, 0
sprpriority = 0

[State 804, Anim]
type = changeanim2
trigger1 = !time
value = 804

[State Safety]
type = selfstate
trigger1 = time >= 60
value = ifelse(pos y < 0, 5040, 0)
ctrl = 1


;========<SEOI NAGE>==========
;--- PLAYER ---
[Statedef 810]
type = S
movetype = A
physics = S
anim = 810
sprpriority = 1
ctrl = 0

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 810, Throw]
type = targetstate
trigger1 = !time
value = 811

[State 810, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 810, Width]
type = width
trigger1 = animelemtime(5) < 0
edge = ceil(100 * const(size.xscale)), 0

[State 810, Width]
type = width
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
edge = ceil(120 * const(size.xscale)), 0

[State 810, Width]
type = width
trigger1 = animelemtime(6) >= 0 && animelemtime(7) < 0
edge = ceil(150 * const(size.xscale)), 0

[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 5
value = 3, 2
channel = 0
[State 810, throwsnd]
type = playsnd
trigger1 = animelem = 4
value = 1, 6
channel = 1

[State 810, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(132 * const(size.xscale)), -76

[State 810, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(120 * const(size.xscale)), -77

[State 810, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(4) < 0
pos = ceil(-8 * const(size.xscale)), -72

[State 810, Bind 4]
type = targetbind
trigger1 = animelemtime(4) >= 0 && animelemtime(5) < 0
pos = ceil(104 * const(size.xscale)), -70

[State 810, Bind 5]
type = targetbind
trigger1 = animelemtime(5) >= 0 && animelemtime(6) < 0
pos = ceil(144* const(size.xscale)), -38

[State 810, Bind 6]
type = targetbind
trigger1 = animelem = 6
pos = ceil(168 * const(size.xscale)), 0

[State 810, Damage]
type = hitadd
trigger1 = animelem = 6
value = 1

[State 810, Juggle]
type = varadd
trigger1 = animelem = 6
var(15) = 1

[State 810, Damage]
type = targetlifeadd
trigger1 = animelem = 6
value = -ceil(110 * fvar(11))

[State 810, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(120 * fvar(11))
persistent = 0

[State 810, Damage]
type = targetpoweradd
trigger1 = animelem = 6
value = 40;givepower

[State 810, Damage]
type = poweradd
trigger1 = animelem = 6 && !var(20)
value = 100;getpower

[State 810, Throw]
type = targetstate
trigger1 = animelem = 6
value = 812

[State 810, Stun]
type = targetstate
trigger1 = numtarget(800)
trigger1 = target(800), stateno = 5101 && target(800), time = 1
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 810, Snd]
type = playsnd
trigger1 = numtarget
trigger1 = target, stateno = 812
value = 5, 2
persistent = 0

[State 810, Dust]
type = explod
trigger1 = numtarget
trigger1 = target, stateno = 812
anim = 7120
ID = 7120
sprpriority = -5
postype = p2
removetime = -2
ownpal = 1
scale = 0.5, 0.5
persistent = 0

[State 810, Shake]
type = envshake
trigger1 = numtarget
trigger1 = target, stateno = 812
time = 12
freq = 60
ampl = 6
persistent = 0

[State 810, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 811]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 811, Anim]
type = changeanim2
trigger1 = !time
value = 811

[State 811, Camera]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 0

[State 811, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 812]
type = A
movetype = H
physics = N

[State 812, Anim]
type = changeanim2
trigger1 = !time
value = 812

[State 812, Pos]
type = posset
trigger1 = 1
y = 0

[State 812, Vel]
type = velset
trigger1 = time >= 12
x = -3

[State 812, End]
type = selfstate
trigger1 = time >= 12
value = 5101


;========<0...>==========
;--- PLAYER ---
[Statedef 820]
type = S
movetype = A
physics = S
anim = 820
sprpriority = 1
ctrl = 0

[State Tech Hit]
type = changestate
trigger1 = numtarget && var(19)
trigger1 = (target, command = "holdfwd" || target, command = "holdback") && target, command != "holdup" && target, command != "holddown"
trigger1 = (target, command = "b" || target, command = "c" || target, command = "y" || target, command = "z")
value = 890
[State Tech Hit]
type = varadd
trigger1 = var(19) > 0
var(19) = -1

[State 820, Throw]
type = targetstate
trigger1 = !time
value = 821
[State 820, Throw]
type = targetfacing
trigger1 = time <= 1
value = -1

[State 820, Width]
type = width
trigger1 = animelemtime(8) < 0
edge = ceil(100 * const(size.xscale)), 0

[State 820, Width]
type = width
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
edge = ceil(80 * const(size.xscale)), 0

[State 820, throwsnd]
type = playsnd
trigger1 = animelem = 4
value = 4, 1
channel = 0
[State 820, throwsnd]
type = playsnd
trigger1 = animelem = 6
value = 1, 3
channel = 1
[State 820, throwsnd]
type = playsnd
trigger1 = animelem = 9
value = 5, 3

[State 820, Bind 1]
type = targetbind
trigger1 = animelemtime(1) >= 0 && animelemtime(2) < 0
pos = ceil(120 * const(size.xscale)), -71

[State 820, Bind 2]
type = targetbind
trigger1 = animelemtime(2) >= 0 && animelemtime(3) < 0
pos = ceil(132 * const(size.xscale)), -75

[State 820, Bind 3]
type = targetbind
trigger1 = animelemtime(3) >= 0 && animelemtime(8) < 0
pos = ceil(132 * const(size.xscale)), -70

[State 820, Bind 8]
type = targetbind
trigger1 = animelemtime(8) >= 0 && animelemtime(9) < 0
pos = ceil(224 * const(size.xscale)), -66

[State 820, claw]
type = helper
trigger1 = animelem = 8
helpertype = normal
stateno = 825
ID = 825
name = "Claw"
postype = p1
pos = ceil(210 * const(size.xscale)), -65
size.ground.front = (target, const(size.ground.back))

[State 820, HitSound]
type = playsnd
trigger1 = animelem = 8 && numtarget
value = 2, 9
channel = 2

[State 820, Spark]
type = helper
trigger1 = fvar(31)
trigger1 = animelem = 8 && numtarget
helpertype = normal
stateno = 8021
ID = 8000
name = "Spark"
postype = p1
pos = ceil(210 * const(size.xscale)), -65
facing = 1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 820, Sparks]
type = explod
trigger1 = !fvar(31)
trigger1 = animelem = 8 && numtarget
anim = F2
ID = 8000
ontop = 1
postype = p1
pos = ceil(210 * const(size.xscale)), -65
ownpal = 1
persistent = 0
pausemovetime = 100
supermovetime = 100

[State 820, Blood]
type = helper
trigger1 = fvar(32)
trigger1 = animelem = 8 && numtarget
helpertype = normal
stateno = 7052
ID = 7050
name = "Blood"
postype = p1
pos = ceil(210 * const(size.xscale)), -65
facing = -1
ownpal = 1
pausemovetime = 65535
supermovetime = 65535
ignorehitpause = 1

[State 820, Damage]
type = hitadd
trigger1 = animelem = 8
value = 1

[State 820, Juggle]
type = varadd
trigger1 = animelem = 8
var(15) = 1

[State 820, Damage]
type = targetlifeadd
trigger1 = animelem = 8
value = -ceil(119 * fvar(11))
kill = 0

[State 820, Stun System - Add]
type = varadd
trigger1 = !var(19)
trigger1 = var(20) <= 0
trigger1 = var(42) >= 0
var(42) = ceil(120 * fvar(11))
persistent = 0

[State 820, Damage]
type = targetpoweradd
trigger1 = animelem = 8
value = 40;givepower

[State 820, Damage]
type = poweradd
trigger1 = animelem = 8 && !var(20)
value = 100;getpower

[State 820, Throw]
type = targetstate
trigger1 = animelem = 9
value = 822

[State 820, Stun]
type = targetstate
trigger1 = numtarget(800)
trigger1 = target(800), stateno = 823 && target(800), time = 9
trigger1 = numenemy = 1 && numpartner = 0
trigger1 = var(42) >= (target, const(data.life))
value = 1115312

[State 825, Snd]
type = playsnd
trigger1 = (target, stateno = 822) && (target, backedgebodydist <= 0)
value = 5, 2
persistent = 0
[State 825, Dust]
type = explod
trigger1 = (target, stateno = 822) && (target, backedgebodydist <= 0)
anim = 7121
ID = 7121
sprpriority = -2
postype = back
pos = 320, ceil(screenpos y -65)
ownpal = 1
scale = 0.5, 0.5
persistent = 0

[State 825, syncvar]
type = varset
trigger1 = numtarget
var(0) = (target, stateno)

[State 820, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- TARGET ---
[Statedef 821]
type = A
movetype = H
physics = N
velset = 0, 0
sprpriority = 0

[State 821, Anim]
type = changeanim2
trigger1 = !time
value = 821

[State 821, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 821, Safety]
type = selfstate
trigger1 = time >= 180
value = 5040


[Statedef 822]
type = A
movetype = H
physics = N

[State 822, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 822, Vel]
type = velset
trigger1 = 1
x = -12
y = 0

[State 822, Hitwall]
type = changestate
trigger1 = backedgebodydist <= 0
trigger2 = time >= 180
value = 823


[Statedef 823]
type = A
movetype = H
physics = N
velset = 0, 0

[State 823, Damage]
type = lifeadd
trigger1 = !time
value = -1
kill = 1

[State 823, Anim]
type = changeanim2
trigger1 = !time
value = 823

[State 823, Camera]
type = screenbound
trigger1 = 1
value = 1
movecamera = 1, 0

[State 823, Turn]
type = turn
trigger1 = !time

[State 823, Shake]
type = envshake
trigger1 = !time
time = 16
fre = 120
ampl = 6

[State 823, Pos]
type = posadd
trigger1 = animelem = 2
x = ifelse((frontedgebodydist > backedgebodydist), backedgebodydist, frontedgebodydist)
y = -const(size.mid.pos.y)
persistent = 0

[State 823, Vel]
type = velset
trigger1 = animelem = 2
x = -3
y = -6

[State 823, Accel]
type = veladd
trigger1 = animelemtime(2) >= 0
y = 0.4850;yaccel

[State 823, Recover]
type = selfstate
trigger1 = alive
trigger1 = command = "recovery"
trigger1 = vel y > 0 && pos y >= const(movement.air.gethit.groundrecover.ground.threshold)
value = 5200

[State 823, hitground]
type = selfstate
trigger1 = vel y > 0 && pos y >= 25
value = 5100


;===========<Target Escaped>==========
[Statedef 890]
type = S
physics = N
movetype = I
anim = 5945
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 890, Bind]
type = targetbind
trigger1 = !time && numtarget
pos = 0, 0
[State 890, P2 State]
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
x = ceil(24 * const(size.xscale))

[State 890, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 890, Push]
type = playerpush
trigger1 = 1
value = 0

[State 890, Pos]
type = posset
trigger1 = !time
y = 0
[State 890, Vel]
type = velset
trigger1 = 1
x = -1.425
y = 0

[State 890, Snd]
type = playsnd
trigger1 = time = 2
value = 5000, 1
channel = 0

[State 890, FX]
type = playsnd
trigger1 = !time
value = 2, 0
channel = 2
volumescale = 75

[State 890, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8200
ID = 8200
name = "Spark"
postype = p1
pos = 0, -48
facing = -1
ownpal = 1
size.xscale = 1
size.yscale = 1
pausemovetime = 65535
supermovetime = 65535

[State 890, End]
type = changestate
trigger1 = time >= 27
value = 0
ctrl = 1


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
[State 895, Anim]
type = changeanim
trigger1 = !time && !selfanimexist(5945) && selfanimexist(5910)
value = 5910
[State 895, Anim]
type = changeanim
trigger1 = time >= 20 && anim = 130
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
