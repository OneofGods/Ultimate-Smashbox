; ________________________
;| Akuma by Mr.Ansatsuken |
; 
;==============================================================================================
;=======================================< COMMON STATES >========================================
;==============================================================================================

;==========< ZERO COUNTER >==========
[Statedef 750]
type = S
physics = S
movetype = I
anim = ifelse(var(1)=2,751,750)
ctrl = 0
velset = 0, 0
sprpriority = 2
facep2 = 1



[State 750, Power]
type = poweradd
trigger1 = !time
value = -750

[State 750, Strength]
type = varset
trigger1 = !time && !AIlevel
ignorehitpause = 1
var(10) = ifelse((command = "counter_x" || command = "counter_y" || command = "counter_z"), 1, 2)
[State 750, Strength AI]
type = varset
trigger1 = !time && AIlevel
var(10) = ifelse((p2statetype = A), 1, ifelse((p2statetype = C), 2, ifelse(random < 500, 1, 2)))
ignorehitpause = 1

[State 750, Snd]
type = playsnd
trigger1 = !time
value = 3+ifelse(var(1)=2 || var(1) = 4,11, 0),14+ifelse(var(1)=2 || var(1) = 4,11, 0)
channel = 0
[State 750, Snd]
type = playsnd
trigger1 = !time
value = 3+ifelse(var(1)=2 || var(1) = 4,11, 0),14+ifelse(var(1)=2 || var(1) = 4,11, 0)
channel = 2
[State 750, ECreset]
type = palfx
trigger1 = !time
trigger1 = var(20) := -1
time = 1
[State 750, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7250
ID = 7250
postype = p1
pos = 23, -74
ownpal = 1
persistent = 0
supermovetime = 999
[State 750, Super Pause]
type = superpause
trigger1 = !time
time = 16
movetime = 16
anim = -1
sound = s7, 1
p2defmul = 1
darken = 0
[State 750, End]
type = changestate
trigger1 = time >= 16
value = ifelse(var(10) = 1, ifelse(fvar(3)=37,1955,1100), 1200)





;===================< CUSTOM COMBO >===================
[Statedef 760]
type = U
physics = U
movetype = A
anim = 760 + (statetype = A)
ctrl = (statetype = A)
velset = ifelse((statetype = S), 0, vel x), ifelse((statetype = S), 0, vel y)
poweradd = -1000

[State 760, Snd]
type = playsnd
trigger1 = !time
value = 4, 11
channel = 0
volume = 200
[State 760, Super Pause FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 7260
ID = 7260
postype = p1
pos = -5, -45 -(anim = 761) * 30
ownpal = 1
size.xscale = 1
size.yscale = 1
persistent = 0
supermovetime = 9999
[State 760, superchargepause]
type = superpause
trigger1 = !time
time = 30
anim = -1
sound = s7, 2
darken = 0
movetime = 30 * (anim = 760)

[State Corner Push]
type = varset
trigger1 = !time
fvar(5) = 0

[State 760, Var]
type = varset
trigger1 = anim = 760
trigger2 = anim = 761 && !time
var(20) = 180
[State 760, NHB]
type = nothitby
trigger1 = anim = 760
trigger2 = anim = 761 && time <= 1
time = 8
value = SCA

[State 760, Shadows]
type = afterimage
trigger1 = anim = 760 && time = 30
trigger2 = anim = 761 && time = 1
time = 2
timegap = 1
framegap = 4
length = 13
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 64, 128, 192
palpostbright = 0, 0, 0
trans = add1

[State 760, End]
type = changeanim
trigger1 = anim = 761 && !animtime
value = 41 + (vel x > 0) + (vel x < 0) * 2
elem = 7 -(!vel x) * 4
persistent = 0
[State 760, Type]
type = statetypeset
trigger1 = anim = [41, 43]
statetype = A
physics = A

[State 760, End]
type = changestate
trigger1 = anim = 760 && !animtime
value = 0
ctrl = 1





;==========< PARRY >==========
;--- STANDING ---
[Statedef 700]
type = S
physics = S
movetype = I
anim = 700
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 700, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 700, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 700, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 700, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 700, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 700, Snd]
type = playsnd
trigger1 = !time
value = 7, 3
[State 700, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 36, -65
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 700, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 700, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;--- CROUCHING ---
[Statedef 701]
type = C
physics = C
movetype = I
anim = 701
velset = 0, 0
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 701, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 701, Stop]
type = posfreeze
trigger1 = 1
value = 1

[State 701, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 701, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 701, Flash]
type = palfx
trigger1 = !time
add = 0, 50, 255
sinadd = 0, -50, -255, 60
time = 15

[State 701, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 701, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 701, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 27, -21
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5

[State 701, No walking]
type = assertspecial
trigger1 = 1
flag = nowalk
[State 701, End]
type = changestate
trigger1 = !animtime
value = 11
ctrl = 1


;--- AERIAL ---
[Statedef 702]
type = A
physics = A
movetype = I
anim = 702
ctrl = 0
sprpriority = 2
poweradd = 78
facep2 = 1

[State 702, HB]
type = hitby
trigger1 = time < 15
value = SCA, AT
time = 1

[State 702, Pause]
type = pause
trigger1 = !time
time = 15
movetime = 15
endcmdbuftime = 15
pausebg = 0
[State 702, Pause]
type = pause
trigger1 = !time && numenemy
trigger1 = (enemynear, movehit = 1)
time = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
movetime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
endcmdbuftime = ifelse((enemynear, hitpausetime = [0, 15]), 15 -(enemynear, hitpausetime), 0)
pausebg = 0

[State 702, Type]
type = statetypeset
trigger1 = time < 15
physics = N
[State 702, Stop]
type = posfreeze
trigger1 = time < 15
value = 1

[State 702, Vel]
type = velset
trigger1 = time = 15
x = ifelse(vel x > 2, 2, ifelse(vel x < -2, -2, vel x))
y = ifelse(vel y < -2, vel y, -2)
[State 702, Type]
type = statetypeset
trigger1 = time >= 15
physics = A
[State 702, Ctrl]
type = ctrlset
trigger1 = time >= 15
value = 1

[State 702, Flash]
type = palfx
trigger1 = !time
add = 0, 64, 255
sinadd = 0, -64, -255, 60
time = 15

[State 702, Snd]
type = playsnd
trigger1 = !time
value = 3, (random < 500)
channel = 0
[State 702, Snd]
type = playsnd
trigger1 = !time
value = 7, 3

[State 702, Spark]
type = explod
trigger1 = animelem = 2
anim = 7200
ID = 7200
sprpriority = 5
postype = p1
pos = 41, -64
pausemovetime = 60
ownpal = 1
scale = 0.5, 0.5


;==========< DODGE >==========
[Statedef 710]
type = S
physics = S
movetype = I
anim = 710
velset = 0, 0
ctrl = 0
sprpriority = -1
[State 710, Snd]
type = playsnd
triggerall = var(1) != 2 && var(1) != 4
trigger1 = !time
value = 4, 13
channel = 0
[State 710, Push]
type = playerpush
trigger1 = 1
value = 0
[State 710, HB]
type = hitby
trigger1 = 1
value = SCA, AT
time = 1
[State 710, Attack]
type = changestate
trigger1 = !AIlevel && (time = [15, 25])
trigger1 = command = "x" || command = "y" || command = "z" || command = "a" || command = "b" || command = "c"
value = ifelse((command = "x" || command = "y" || command = "z"), 210, 220)
[State 710, Attack]
type = changestate
trigger1 = AIlevel && (time = [15, 25]) && (p2dist x = [0, 60]) && p2movetype != A
value = ifelse(random < 500, 210, 220)
[State 710, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< ROLL >==========
;--- FORWARD ---
[Statedef 720]
type = C
physics = C
movetype = I
anim = 720
velset = 0, 0
ctrl = 0
sprpriority = 1
[State 720, Snd]
type = playsnd
triggerall = var(1) != 2 && var(1) != 4
trigger1 = animelem = 1
value = 3, ifelse(random < (250 * (AIlevel ** 2 / 64.0)), 0, ifelse(random < 333, 1, ifelse(random < (250 * (AIlevel ** 2 / 64.0)), 3, 4)))
channel = 0
[State 720, Vel]
type = velset
trigger1 = animelemtime(2) >= 0 && animelemtime(7) < 0
x = 6
[State 720, Push]
type = playerpush
trigger1 = 1
value = 0
[State 720, HB]
type = hitby
trigger1 = animelemtime(8) < 0
value = SCA, AT
time = 1
[State 720, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


;==========< POWER CHARGE >==========
[Statedef 740]
type = S
physics = S
movetype = I
anim = 740
ctrl = 0
velset = 0, 0

[State 740, Power]
type = poweradd
triggerall = anim = 740 && power < powermax
trigger1 = !AIlevel && (command = "holdy" && command = "holdb")
trigger2 = AIlevel
value = 2 + (time / 10)

[State 740, Snd]
type = playsnd
triggerall = var(1) != 2 && var(1) != 4
trigger1 = anim = 740 && time = 8
value = 3, 2
channel = 0
volume = 255


[State 740, Snd]
type = playsnd
triggerall = var(1) != 2 && var(1) != 4
trigger1 = anim = 740 && time = 8
value = 3, 2
channel = 2
volume = 255

[State 740, Snd]
type = playsnd
triggerall = var(1) = 2 || var(1) = 4
trigger1 = anim = 740 && time = 8
value = 13, 3
channel = 0
volume = 255


[State 740, Snd]
type = playsnd
triggerall = var(1) = 2 || var(1) = 4
trigger1 = anim = 740 && time = 8
value = 13, 3
channel = 2
volume = 255

[State 740, Shake]
type = envshake
trigger1 = anim = 740 && !(time % 4)
time = 4
freq = 120
ampl = 2
[State 740, Flash]
type = palfx
trigger1 = 1
time = 1
add = 75 + ceil(sin(time / 6.0 * pi) * 75), 25 + ceil(sin(time / 6.0 * pi) * 25), 0


[State 730, FX]
type = helper
trigger1 = !numhelper(8330)
helpertype = normal
stateno = 8330
ID = 8330
name = "Power Charge"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1
[State 730, FX]
type = helper
trigger1 = !numhelper(8331)
helpertype = normal
stateno = 8331
ID = 8331
name = "Particles"
postype = p1
pausemovetime = 65535
supermovetime = 65535
ownpal = 1

[State 740, Aura]
type = helper
trigger1 = anim = 740 && animelemtime(5) >= 0 && !numhelper(6000)
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1

[State 740, Anim]
type = changeanim
triggerall = anim != 741
trigger1 = !AIlevel && (command != "holdy" || command != "holdb")
trigger2 = power >= const(data.power) || power >= powermax || roundstate != 2
trigger3 = AIlevel && (inguarddist || p2bodydist x < 160)
value = 741

[State 740, Ctrl]
type = ctrlset
trigger1 = anim = 741
value = 1

[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 0
persistent = 0
[State 740, Snd]
type = stopsnd
trigger1 = anim = 741
channel = 2
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
value = 4+ifelse(var(1)=2||var(1)=4,10,0), 15+ifelse(var(1)=2||var(1)=4,10,0)
channel = 0
persistent = 0
[State 740, Snd]
type = playsnd
trigger1 = anim = 741 && power >= powermax
value = 4+ifelse(var(1)=2||var(1)=4,10,0), 15+ifelse(var(1)=2||var(1)=4,10,0)
channel = 2
persistent = 0
[State 740, End]
type = changestate
trigger1 = anim = 741 && !animtime
value = 0
ctrl = 1



;====================< STANDING >====================																ON THE EDGE
[Statedef 0]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 191, intro]
type = assertspecial
triggerall = (roundstate = 1) && roundno = 1
trigger1 = ifelse(teammode=simul,(enemy(1), stateno != 0) && (enemy(2), stateno != 0),enemy, stateno!=0)
flag = nobardisplay

[State 4200, imageoff]
type = afterimagetime
trigger1 = !time
time = 0
[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(52) != 5
triggerall = var(1) = 1 || var(1) = 2 || var(1) = 3 || var(1) = 4
triggerall = prevstateno = 191 || prevstateno = 173
triggerall = !numhelper(9200)
triggerall = ((!time) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" && enemy, authorname = "Froz"
trigger6 = enemy, var(40)=1
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
helpertype = normal
stateno = 9203
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(52) != 5
triggerall = var(1) = 1 || var(1) = 2 || var(1) = 3 || var(1) = 4
triggerall = prevstateno = 191 || prevstateno = 173
triggerall = !numhelper(9200)
triggerall = ((!time) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega" 
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega" ||  enemy, name = "CvS_DecapreTAG"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
trigger9 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger10 = enemy, name = "DecapreTAG" || enemy, name = "JuniTAG" || enemy, name = "JuliTAG" || enemy, name = "CvS_DecapreTAG"
trigger11 = enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
trigger12 = enemy, name = "Fei Long" || enemy, name = "FeiLong_mx"
trigger13 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger14 = enemy, name = "CFJ_Hakan" 
trigger15 = enemy, name = "Hakan"
trigger16 = enemy, name = "HakanTAG" || enemy, name = "CFJ_HakanTAG"
trigger17 = enemy, name = "Dee Jay" || enemy, name = "DeeJay_mx" || enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
trigger18 = enemy, name = "Dhalsim" || enemy, name = "DhalsimTAG" || enemy, name = "cvsdhalsim"
trigger19 = enemy, name = "RajaaDhalsim" || enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
trigger20 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugano" || enemy, name = "SakuraKasugano" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
helpertype = normal
stateno = 9203
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(52) != 5
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 4
triggerall = prevstateno = 191 || prevstateno = 173
triggerall = !numhelper(9200)
triggerall = ((!time) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
trigger1 = enemy, name = "Rugal" || enemy, name = "Rugal Bernstein" || enemy, name = "Omega Rugal"
trigger2 = enemy, name = "Rugal94" || enemy, name = "Rugal94(BOSS)" || enemy, name = "rugal_B"
trigger3 = enemy, name = "Rugal_TLE" || enemy, name = "Omega Rugal Gb"
trigger4 = enemy, name = "Mech Rugal" || enemy, name = "Tin 2002_rugal"  || enemy, name = "svcrugal"
trigger5 = enemy, name = "Rugal CvS" || enemy, name = "omega -rugal" || enemy, name = "cvsrugal_normal"
trigger6 = enemy, name = "cvsrugal" && enemy, var(12) != 10
trigger7 = enemy, name = "Iori" || enemy, name = "Iori Yagami" || enemy, name = "cvsiori" || enemy, name = "cvsiori_normal"
trigger8 = enemy, name = "IoriTAG" || enemy, name = "Iori YagamiTAG"
;trigger9 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken" 
;trigger10 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
;trigger11 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG" 
;trigger12 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
helpertype = normal
stateno = 9203
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 0, Gone]
type = removeexplod
trigger1 = ishelper
[State 0, Gone]
type = destroyself
trigger1 = ishelper


;======<Version change>=====

[State 256, Countdown]
type = VarAdd
trigger1 = numhelper(8990)
trigger1 =1 
fvar(30)=-1

[State 256, Countdown]
type = Varset
trigger1 = numhelper(8990)
trigger1=command="fwd" || command="back"
fvar(30)=3

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,32,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,11,32)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,11,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,37,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,37,32)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,32,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,28)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,28,35)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,34,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,34)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,28,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,35,28)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,37,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,34,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,1)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,1,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,1,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,9,1)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,2,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,14,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,9,15)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,15,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,22,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,17,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,17)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,22,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,26,22)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,23,33)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,33,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,26,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,34,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,36,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,36)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,2)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,2,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,0,4)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,4,0)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,2,5)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,5,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,4,8)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,8,4)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,5,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,9,5)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,8,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,11,8)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,9,13)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,13,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,11,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,14,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,18)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,18,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,19,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,22,19)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,20,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,20)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,23,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,26,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,24,27)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,27,24)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,26,29)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,29,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,27,30)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,30,27)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,29,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,34,29)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,30,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,35,30)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,34,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,34)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,35)

[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "fwd"
fvar(3) = 100+ifelse(facing=1,1,-1)
[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "back"
fvar(3) = 100 + ifelse(facing=1,-1,1)

[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) < 0
fvar(3) = 37
[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) = [38,58]
fvar(3) = 0

[State 256, Countdown]
type = Varadd
trigger1 = numhelper(8990)
trigger1= fvar(30)=1
fvar(3)=-100

[State 0, "Shun Goku Satsu!"]
type = ChangeState
triggerall = var(22) = 1
triggerall = prevstateno = 191
triggerall = !(teammode = simul) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
triggerall = var(52) = 2
triggerall = ctrl
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Rugal" || enemy, name = "Rugal Bernstein" || enemy, name = "Omega Rugal"
trigger2 = enemy, name = "Rugal94" || enemy, name = "Rugal94(BOSS)" || enemy, name = "rugal_B"
trigger3 = enemy, name = "Rugal_TLE" || enemy, name = "Omega Rugal Gb"
trigger4 = enemy, name = "Mech Rugal" || enemy, name = "Tin 2002_rugal"  || enemy, name = "svcrugal"
trigger5 = enemy, name = "Rugal CvS" || enemy, name = "omega -rugal" || enemy, name = "cvsrugal_normal"
trigger6 = enemy, name = "cvsrugal" && enemy, var(12) != 10
value = ifelse(fvar(6) = 1 && power >= 5000,4050,4000)
ctrl = 0
;anim =
ignorehitpause = 1
persistent = 1


;====<END>====


[State 0, Anim]
type = changeanim
triggerall = var(1) = 1 || var(1) = 5
trigger1 = anim != 0 + ifelse(var(55)=1,10000,0) && anim != 5 + ifelse(var(55)=1,10000,0)
trigger2 = anim = 5 + ifelse(var(55)=1,10000,0) && !animtime
value = 0 + ifelse(var(55)=1,10000,0)

[State 0, Anim]
type = changeanim
triggerall = var(1) = 2
trigger1 = anim != 1 + ifelse(var(55)=1,10000,0) && anim != 5 + ifelse(var(55)=1,10000,0)
trigger2 = anim = 5 + ifelse(var(55)=1,10000,0) && !animtime
value = 1 + ifelse(var(55)=1,10000,0)

[State 0, Anim]
type = changeanim
triggerall = var(1) = 4
trigger1 = anim != 3 + ifelse(var(55)=1,10000,0) && anim != 5 + ifelse(var(55)=1,10000,0)
trigger2 = anim = 5 + ifelse(var(55)=1,10000,0) && !animtime
value = 3 + ifelse(var(55)=1,10000,0)

[State 0, Anim]
type = changeanim
triggerall = var(1) = 3
trigger1 = anim != 2 + ifelse(var(55)=1,10000,0) && anim != 5 + ifelse(var(55)=1,10000,0)
trigger2 = anim = 5 + ifelse(var(55)=1,10000,0) && !animtime
value = 2 + ifelse(var(55)=1,10000,0)

[State 0, Skywalker]
type = changestate
triggerall = pos y < 0
trigger1 = !numenemy
trigger2 = numenemy = 1
trigger2 = (enemy, name = "M -NES Game 1" + enemy, name = "M -NES Game 2" + enemy, name = "M -GB Game 1" + enemy, authorname = "Bane84") < 2
trigger3 = numenemy >= 2
trigger3 = (enemy(0), name = "M -NES Game 1" + enemy(0), name = "M -NES Game 2" + enemy(0), name = "M -GB Game 1" + enemy(0), authorname = "Bane84") < 2
trigger3 = (enemy(1), name = "M -NES Game 1" + enemy(1), name = "M -NES Game 2" + enemy(1), name = "M -GB Game 1" + enemy(1), authorname = "Bane84") < 2
value = 50

;====================< CROUCHING >====================
[Statedef 10]
type = C
physics = C
movetype = I
velset = 0, 0
sprpriority = 0

[State 10, Anim]
type = changeanim
trigger1 = !time && anim = 12
value = 10 + ifelse(var(55)=1,10000,0)
elem = 3 -animelemno(0)
[State 10, Anim]
type = changeanim
trigger1 = anim != 10 + ifelse(var(55)=1,10000,0)
value = 10 + ifelse(var(55)=1,10000,0)

[State 10, End]
type = changestate
trigger1 = !animtime
value = 11


[Statedef 11]
type = C
physics = C
movetype = I
anim = 11 + ifelse(var(55)=1,10000,0)
velset = 0, 0
sprpriority = 0

[State 11, Anim]
type = changeanim
trigger1 = anim = 6 + ifelse(var(55)=1,10000,0) && !animtime
value = 11 + ifelse(var(55)=1,10000,0)

[Statedef 12]
type = S
physics = S
movetype = I
velset = 0, 0
sprpriority = 0

[State 12, Anim]
type = changeanim
trigger1 = !time && anim = 10 + ifelse(var(55)=1,10000,0)
value = 12 + ifelse(var(55)=1,10000,0)
elem = 3 -animelemno(0)
[State 12, Anim]
type = changeanim
trigger1 = anim != 12 + ifelse(var(55)=1,10000,0)
value = 12 + ifelse(var(55)=1,10000,0)

[State 12, End]
type = changestate
trigger1 = command = "holddown" && command != "holdup"
value = 10
[State 12, End]
type = changestate
trigger1 = !animtime
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


;===================< JUMPING >================
[Statedef 40]
type = S
physics = S
anim = 40
ctrl = 0
velset = 0, 0
sprpriority = 1
facep2 = 1

[State 40, Var]
type = varset
trigger1 = !time && AIlevel
var(9) = ifelse((p2dist x > 240 || p2dist y > 180 || random < 100), 3, 1)
[State 40, Var]
type = varset
trigger1 = AIlevel
sysvar(1) = ifelse((enemynear, movetype != A || backedgebodydist <= 10), 1, ifelse((enemynear, movetype = A), -1, 0))
[State 40, Var]
type = varset
trigger1 = !time && !AIlevel
var(9) = ifelse(command = "highjump", 3, 1)
[State 40, Var]
type = varset
trigger1 = !AIlevel
sysvar(1) = ifelse(!time, 0, ifelse(command = "holdfwd", 1, ifelse(command = "holdback", -1, sysvar(1))))
[State 40, Var]
type = varset
trigger1 = !AIlevel && var(9) != 3 && command != "holdup"
trigger2 = AIlevel && var(9) != 3 && random < 100
var(9) = 2

[State 40, Dust]
type = helper
trigger1 = !animtime
helpertype = normal
stateno = 7100
ID = 7100
name = "Dust"
postype = p1
ownpal = 1

[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) != 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = ifelse(var(9) = 2, 0.75, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = ifelse(!sysvar(1), 1.15, 1) * const(velocity.jump.y)
[State 40, Vel]
type = velset
trigger1 = !animtime && var(9) = 3 && sysvar(1)
x = ifelse(!sysvar(1), const(velocity.jump.neu.x), ifelse(sysvar(1) = 1, 1.5 * const(velocity.jump.fwd.x), 1.5 * const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, Vel]
type = velset
trigger1 = !animtime && prevstateno = 100 && sysvar(1) = 1
trigger1 = var(9) := 3
x = const(velocity.runjump.fwd.x)
[State 40, End]
type = changestate
trigger1 = !animtime
value = 50
ctrl = 1

[Statedef 50]
type = A
physics = A

[State 50, Snd]
type = playsnd
trigger1 = !time && (prevstateno != [110,115]) && prevstateno != 4005
value = 0, ifelse(var(9) = 3, 41, 40)

[State 50, Anim]
type = changeanim
trigger1 = var(9) != 2
value = ifelse(!(vel x), 41, ifelse((vel x) > 0, 42, 43))
persistent = 0
[State 50, Anim]
type = changeanim
trigger1 = var(9) = 2
value = ifelse(!(vel x), 51, ifelse((vel x) > 0, 52, 53))
elem = animelemno(0)
persistent = 0

[State 50, No Guard]
type = assertspecial
trigger1 = var(9) = 2
flag = noairguard


[Statedef 51]
type = A
physics = A
[State 51, null]
type = null
trigger1 = 1


[Statedef 52]
type = S
physics = S
ctrl = 0
anim = ifelse(vel y > 11, 48, 47)
movehitpersist = 1

[State 52, Stop]
type = velset
trigger1 = 1
x = 0
y = 0
[State 52, Pos]
type = posset
trigger1 = 1
y = 0

[State 52, anim48]
type = changeanim
trigger1 = !time && (prevstateno = 222 || (prevstateno = [1200, 1207]) || prevstateno = 3200)
trigger1 = !time && (prevstateno = [1209, 1299])
value = 48

[State 52, anim48]
type = changeanim
trigger1 = !time && (prevstateno = 1208)
value = 49

[State 52, anim48]
type = changeanim
triggerall = !time && (prevstateno = 1208)
trigger1 = var(1) != 5 && var(1) !=3
trigger1 = fvar(3) !=0 && fvar(3) != 1 && fvar(3) != 4 && fvar(3) != 5 && fvar(3) != 8 && fvar(3) != 9 && fvar(3) != 11 && fvar(3) != 14 && fvar(3) != 19 && fvar(3) != 20 && fvar(3) !=  32 && fvar(3) != 33 && fvar(3) != 36
trigger2 = fvar(3) = 37
trigger2 = var(1) != 5
trigger3 = var(1) = 3
trigger3 = fvar(3) !=0 && fvar(3) != 1 && fvar(3) != 4 && fvar(3) != 5 && fvar(3) != 8 && fvar(3) != 9 && fvar(3) != 11 && fvar(3) != 14 && fvar(3) != 19 && fvar(3) != 20 && fvar(3) !=  32 && fvar(3) != 33 && fvar(3) != 36
value = 49 + (random % 2)


[State 52, anim283]
type = changeanim
trigger1 = !time && prevstateno = 282
value = 283
[State 52, anim1102]
type = changeanim
trigger1 = !time && ((prevstateno = [1100, 1107]) || prevstateno = 3100 || prevstateno = 3140)
value = 1102

[State 52, anim1102]
type = changestate
trigger1 = anim = 49 && !animtime
value = ifelse((var(1) = 2 || var(1) = 4) && random<500, 1808,1100)

[State 52, anim1102]
type = changestate
trigger1 = anim = 50 && !animtime
value = ifelse((var(1) = 2 || var(1) = 4) && random<500, 1808,1308)

[State 52, anim3102]
type = changeanim
trigger1 = !time && (prevstateno = 3160)
value = 3102

[State 52, Snd]
type = playsnd
trigger1 = !time
value = 0, 52
[State 52, Dust]
type = explod
trigger1 = !time
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State 52, Ctrl]
type = ctrlset
trigger1 = !time
trigger1 = prevstateno != [200, 4999]
value = 1
[State 52, Ctrl]
type = ctrlset
trigger1 = time >= 1
trigger1 = prevstateno < 1000
value = 1
[State 52, guard]
type = changestate
trigger1 = command = "holdback"
trigger1 = inguarddist && (prevstateno != [200, 4999])
value = 120

[State 52, No walking]
type = assertspecial
trigger1 = time <= 2 || (prevstateno = [200, 4999])
flag = nowalk
[State 52, End]
type = changestate
trigger1 = anim != 1103 && !animtime
value = 0
ctrl = 1



;======================< RUN >===========================
[Statedef 100]
type    = S
physics = N
anim = ifelse(var(1) =2 || var(1) = 4,103,100) + ifelse(var(55)>=1,10000,0)
sprpriority = 1
ctrl = 0

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk


[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[state a]
type = ctrlset
trigger1 = animelemtime(5) = 2
value = 1

;---------------------[]
[State 191, Snd 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0


;---------------------[GtFNg]
[State explod];
type = removeExplod
trigger1 = time = 0
id = 3000

[State explod];
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 2,>=0
trigger2 = animelem = 5,<0
trigger2 = time % 5 = 0
anim = 6202
id = 6200
sprpriority = 10
postype = p1
pos = 0,-60
vel = -1,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 155,255
ownpal = 1
ignorehitpause = 1
scale = 0.35,0.35



;---------------------[x]
[State 100, 1]
type = VelSet
trigger1 = animelem = 2
x = 10 + ifelse(var(55)>=1,3,0)

[State 100, 1]
type = Velmul
trigger1 = 1
x = 1

[State 100, 1]
type = VelSet
trigger1 = animelem = 5
x = 0

[State 100, 1]
type = ctrlset
trigger1 = time = 8
value = 1

;---------------------[]
[State 100, 4]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1

;========================< BACK DASH >==========================
[Statedef 105]
type    = S
physics = N
anim = ifelse(var(1) !=5 && var(1) !=3,103,100) + ifelse(var(55)>=1,10000,0)
sprpriority = 1
ctrl = 0

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[state a]
type = ctrlset
trigger1 = animelemtime(5) = 2
value = 1

;---------------------[]
[State 191, Snd 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0


;---------------------[GtFNg]
[State explod];
type = removeExplod
trigger1 = time = 0
id = 3000

[State explod];
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 2,>=0
trigger2 = animelem = 5,<0
trigger2 = time % 5 = 0
anim = 6202
id = 6200
sprpriority = 10
postype = p1
pos = 20,-60
vel = -1,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 155,255
ownpal = 1
ignorehitpause = 1
scale = 0.35,0.35



;---------------------[x]
[State 100, 1]
type = VelSet
trigger1 = animelem = 2
x = -10

[State 100, 1]
type = Velmul
trigger1 = 1
x = 1

[State 100, 1]
type = VelSet
trigger1 = animelem = 5
x = 0

[State 100, 1]
type = ctrlset
trigger1 = time = 8
value = 1

;---------------------[]
[State 100, 4]
type = ChangeState
trigger1 = animtime = 0
value = 0
ctrl = 1




;======================< RUN >===========================
[Statedef 110]
type    = A
physics = N
anim = ifelse(var(1) =2 || var(1) = 4,103,103) + ifelse(var(55)>=1,10000,0)
sprpriority = 1
ctrl = 0

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk
[State 0, VarSet]
type = VelSet
trigger1 = !time
y = vel y / 4


[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[state a]
type = ctrlset
trigger1 = animelemtime(5) = 2
value = 1

;---------------------[]
[State 191, Snd 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0


;---------------------[GtFNg]
[State explod];
type = removeExplod
trigger1 = time = 0
id = 3000

[State explod];
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 2,>=0
trigger2 = animelem = 5,<0
trigger2 = time % 5 = 0
anim = 6202
id = 6200
sprpriority = 10
postype = p1
pos = 0,-60
vel = -1,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 155,255
ownpal = 1
ignorehitpause = 1
scale = 0.35,0.35



;---------------------[x]
[State 100, 1]
type = VelSet
trigger1 = animelem = 2
x = 10

[State 100, 1]
type = Velmul
trigger1 = 1
x = 1

;[State 100, 1]
;type = VelSet
;trigger1 = animelem = 5
;x = 0
[State 100, 1]
type = ctrlset
trigger1 = time = 8
value = 1

;---------------------[]
[State 100, 4]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 1
[State 100, 4]
type = ChangeState
trigger1 = pos y = [0,50]
value = 52
ctrl = 1

;========================< BACK DASH >==========================
[Statedef 115]
type    = A
physics = N
anim = ifelse(var(1) !=5 && var(1) !=3,103,103) + ifelse(var(55)>=1,10000,0)
sprpriority = 1
ctrl = 0

[State 100, 2] ;Prevent run from canceling into walk
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 0, VarSet]
type = VelSet
trigger1 = !time
y = vel y / 4
[State 100, 3] ;Prevent from turning
type = AssertSpecial
trigger1 = 1
flag = NoAutoTurn

[state a]
type = ctrlset
trigger1 = animelemtime(5) = 2
value = 1

;---------------------[]
[State 191, Snd 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 40,0


;---------------------[GtFNg]
[State explod];
type = removeExplod
trigger1 = time = 0
id = 3000

[State explod];
type = Explod
trigger1 = animelem = 2
trigger2 = animelem = 2,>=0
trigger2 = animelem = 5,<0
trigger2 = time % 5 = 0
anim = 6202
id = 6200
sprpriority = 10
postype = p1
pos = 20,-60
vel = -1,0
bindtime = 1
supermove = 0
under = 0
trans = addalpha
alpha = 155,255
ownpal = 1
ignorehitpause = 1
scale = 0.35,0.35



;---------------------[x]
[State 100, 1]
type = VelSet
trigger1 = animelem = 2
x = -10

[State 100, 1]
type = Velmul
trigger1 = 1
x = 1

;[State 100, 1]
;type = VelSet
;trigger1 = animelem = 5
;x = 0

[State 100, 1]
type = ctrlset
trigger1 = time = 8
value = 1

;---------------------[]
[State 100, 4]
type = ChangeState
trigger1 = animtime = 0
value = 50
ctrl = 1

[State 100, 4]
type = ChangeState
trigger1 = pos y = [0,50]
value = 52
ctrl = 1



;==========< GUARD >==========
;--- START ---
[Statedef 120]
type = U
physics = U
[State 120, Vel]
type = velset
trigger1 = !time && statetype != A
x = 0
y = 0
[State 120, Anim]
type = changeanim
trigger1 = !time
value = 120 + (statetype = C) + (statetype = A) * 2
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
[State 120, High to Low]
type = statetypeset
trigger1 = !AIlevel && statetype = S && command = "holddown"
trigger2 = AIlevel && statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 120, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State AI fix]
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


;--- STAND GUARD (guarding) ---
[Statedef 130]
type = S
physics = S
[State 130, Anim]
type = changeanim
trigger1 = anim != 130
value = 130
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 130, High to Low]
type = changestate
trigger1 = !AIlevel && command = "holddown"
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype = C)
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
value = 0, 52
[State 130, Dust]
type = explod
trigger1 = !time
trigger1 = prevstateno = 132 || (prevstateno = [154, 155])
anim = 7102
ID = 7102
sprpriority = -2
postype = p1
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1

;--- CROUCH GUARD (guarding) ---
[Statedef 131]
type = C
physics = C
[State 131, Anim]
type = changeanim
trigger1 = anim != 131
value = 131
[State AI fix]
type = ctrlset
trigger1 = AIlevel && numenemy
value = (enemynear, time >= 120 || time >= 180)
[State 131, Low to High]
type = changestate
trigger1 = !AIlevel && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = (enemynear, movetype = A) && (enemynear, statetype != C)
value = 130
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
sysvar(0) = (pos y >= 0) && (vel y > 0)
[State 132, Vel]
type = velset
trigger1 = sysvar(0)
y = 0
[State 132, Pos]
type = posset
trigger1 = sysvar(0)
y = 0
[State AI fix]
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
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 140, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
statetype = S
physics = S
[State 140, 5]
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
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 150, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
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
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 151, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
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
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 152, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
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
trigger2 = AIlevel && random < (250 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = S && (enemynear, movetype = A) && (enemynear, statetype = C)
statetype = C
physics = C
[State 153, Low to High]
type = statetypeset
trigger1 = !AIlevel && statetype = C && command != "holddown"
trigger2 = AIlevel && random < (125 * (AIlevel ** 2 / 64.0))
trigger2 = statetype = C && (enemynear, movetype = A) && (enemynear, statetype != C)
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
sysvar(0) = (pos y >= 0) && (vel y > 0)
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


;==========< CHEAP K.O. >==========
[Statedef 5130]
type = S
movetype = H
physics = S
anim = 5130
[State 5130, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5130, Pos]
type = posset
trigger1 = 1
y = 0
[State 5130, End]
type = changestate
trigger1 = !animtime
value = 5131

[Statedef 5131]
type = L
movetype = H
physics = C
anim = 5131
[State 5131, NHB]
type = nothitby
trigger1 = !alive
value = SCA
[State 5131, Pos]
type = posset
trigger1 = 1
y = 0
[State 5131, posfix]
type = posadd
trigger1 = animelem = 4 || animelem = 5
x = ifelse((animelem = 4), -12, -24)
[State 5131, Snd]
type = playsnd
trigger1 = !time
trigger2 = animelem = 5
value = 0, 52
[State 5131, Dust]
type = explod
trigger1 = !time
anim = 7104
ID = 7104
sprpriority = -4
postype = p1
pos = -7, 0
scale = 0.5, 0.5
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, Dust]
type = explod
trigger1 = animelem = 5
anim = 7102
ID = 7102
sprpriority = -5
postype = p1
scale = 0.75, 0.75
ownpal = 1
pausemovetime = -1
supermovetime = -1
[State 5131, End]
type = changestate
trigger1 = !animtime
value = ifelse(alive, 5110, 5150)


;==========< TAUNT >==========
[Statedef 195]
type = S
movetype = A
physics = S
juggle = 0
anim = 195
velset = 0, 0
sprpriority = 1
facep2 = 1
ctrl = 0

[State 195, flames]
type = helper
triggerall = movehit && numtarget && numhelper(7181) < 1
trigger1 = !(target, time) && (target, movetype = H)
helpertype = normal
stateno = 7181
ID = 7181
name = "flames"
postype = p2
bindtime = 1000
ownpal = 1
facing = -1
size.ground.front = 0
size.ground.back = 0
ignorehitpause = 1
persistent = 0


[State 195, Aura]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 195, Kanji]
type = helper
trigger1 = animelem = 5
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 1100, Kek]
type = varset
trigger1 = !time
var(6) = ifelse(random<500,1,2)
[State 195, Snd]
type = playsnd
triggerall = prevstateno = 0
triggerall = var(1) != 4 && var(1) != 2
triggerall = prevstateno != 4900
trigger1 = animelem = 5
value = 4, 14 + var(6)
volume = 255
ignorehitpause = 1
channel = 0
[State 195, Snd]
type = playsnd
triggerall = prevstateno = 0
triggerall = var(1) != 4 && var(1) != 2
triggerall = prevstateno != 4900
trigger1 = animelem = 5
value = 4, 14 + var(6)
volume = 255
ignorehitpause = 1
channel = 2
[State 195, Snd]
type = playsnd
triggerall = prevstateno = 0
triggerall = var(1) = 4 || var(1) = 2
triggerall = prevstateno != 4900
trigger1 = animelem = 5
value = 15 - var(6), ifelse(var(6)=1,35,12)
volume = 255
ignorehitpause = 1
channel = 0
[State 195, Snd]
type = playsnd
triggerall = prevstateno = 0
triggerall = var(1) = 4 || var(1) = 2
triggerall = prevstateno != 4900
trigger1 = animelem = 5
value = 14 - var(6), ifelse(var(6)=1,35,12)
volume = 255
ignorehitpause = 1
channel = 2


[State 195, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
ignorehitpause = 1



[State 195, Dust]
type = explod
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 195, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 195, Shake]
type = envshake
trigger1 = animelemtime(5) >= 0 && animelemtime(5) <= 20
trigger1 = !(animelemtime(5) % 5)
time = 5
freq = 120
ampl = 6 -ceil(animelemtime(5) * 0.25)

[State 195, Power]
type = poweradd
trigger1 = animelem = 5
value = powermax / 15
[State 195, Power]
type = lifeadd
triggerall = AIlevel
trigger1 = animelem = 5
value = powermax/100
[State 195, attackvar]
type = varset
trigger1 = !animtime
var(37) = 1

[State 182, intro]
type = assertspecial
trigger1 = prevstateno = 358
flag = intro
[State 195, Type]
type = statetypeset
trigger1 = animelemtime(6) >= 0
movetype = I
[State 195, End]
type = changestate
trigger1 = !animtime
value = ifelse(prevstateno = 4900, 4901, 0)
ctrl = ifelse(prevstateno = 4900, 0, 1)

;==========< HADOU NO KAMAE >==========
[Statedef 198]
type = S
physics = S
movetype = I
anim = 1000
ctrl = 0
poweradd = ifelse(AIlevel, powermax / 15, 0)
velset = 0, 0

[State 198, Snd]
type = playsnd
triggerall = var(1) != 2 && var(1) !=4
trigger1 = animelem = 4
value = 3, 3
channel = 0
[State 198, Snd]
type = playsnd
triggerall = var(1) = 2 || var(1) =4
trigger1 = animelem = 4
value = 13, 11
channel = 0

[State 3050, pusher]
type = helper
trigger1 = animelemtime(5) >= 0
helpertype = normal
stateno = 3054
ID = 3054
name = "Pusher"
postype = p1
pos = -40, 0
facing = 1
size.xscale = 1
size.yscale = 1
size.ground.back = 20
size.ground.front = 20
size.height = 240
persistent = 0
[State 102, Dust]
type = explod
trigger1 = animelemtime(5) = 0
anim = 7105
sprpriority = 3
postype = p1
pos = 55, 0
removetime = -2
scale = 0.25, 0.25
ownpal = 1
pausemovetime = -1
supermovetime = -1

[State Idle]
type = statetypeset
trigger1 = animelemtime(3) >= 0
movetype = I

[State 198, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1

;==========< LOSE (Time over) >==========
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 0, SprPriority]
type = SprPriority
trigger1 = anim = 170
value = 3
ignorehitpause = 1
persistent = 1

[State 175, Dust]
type = explod
trigger1 = anim = 170 && animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -5, 6
ownpal = 1

[State 4000, Aura]
type = helper
trigger1 = anim = 170 && animelem = 8
helpertype = normal
stateno = 6000
size.xscale = 0.33
size.yscale = 0.4
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
persistent = 0
pos = 0, 50
supermovetime = 9999


[State 175, Snd]
type = playsnd
triggerall = var(1) = 3
trigger1 = anim = 170 && animelem = 2
value = 4, 30
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 3
trigger1 = anim = 170 && animelem = 2
value = 4, 30
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = anim = 170 && animelem = 2
value = 11, 4
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = anim = 170 && animelem = 2
value = 11, 4
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(39)= 2
triggerall = var(1) = 1
trigger1 = anim = 170 && animelem = 2
value = 4, 36
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(39)= 2
triggerall = var(1) = 1
trigger1 = anim = 170 && animelem = 2
value = 4, 36
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(39)= 5
triggerall = var(1) = 1
trigger1 = anim = 170 && animelem = 2
value = 4, 30
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(39)= 5
triggerall = var(1) = 1
trigger1 = anim = 170 && animelem = 2
value = 4, 30
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
trigger1 = anim = 170 && animelem = 5
value = 5, 4
channel = 1

[State 175, Snd]
type = playsnd
trigger1 = anim = 170 && animelem = 10
value = 5, 12
channel = 5
loop = 1
persistent = 0

[State 182, Shake]
type = envshake
triggerall = anim = 170
trigger1 = animelem = 5 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19
trigger2 = animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29
trigger3 = animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34 || animelem = 35 || animelem = 36 || animelem = 37 || animelem = 38 || animelem = 39
trigger4 = animelem = 40 || animelem = 41 || animelem = 42 || animelem = 43 || animelem = 44 || animelem = 45 || animelem = 46 || animelem = 47 || animelem = 48 || animelem = 49
trigger5 = animelem = 50 || animelem = 51 || animelem = 52 || animelem = 53 || animelem = 54 || animelem = 55 || animelem = 56 || animelem = 57 || animelem = 58 || animelem = 59
trigger6 = animelem = 60 || animelem = 61 || animelem = 62 || animelem = 63 || animelem = 64 || animelem = 65 || animelem = 66 || animelem = 67 || animelem = 68 || animelem = 69
trigger7 = animelem = 70 || animelem = 71 || animelem = 72 || animelem = 73 || animelem = 74 || animelem = 75 || animelem = 76 || animelem = 77 || animelem = 78 || animelem = 79
trigger8 = animelem = 80 || animelem = 81 || animelem = 82 || animelem = 83 || animelem = 84 || animelem = 85 || animelem = 86 || animelem = 87 || animelem = 88 || animelem = 89
trigger9 = animelem = 90 || animelem = 91 || animelem = 92 || animelem = 93 || animelem = 94 || animelem = 95 || animelem = 96 || animelem = 97 || animelem = 98 || animelem = 99
trigger10 = animelem = 100 || animelem = 101 || animelem = 102 || animelem = 103 || animelem = 104 || animelem = 105 || animelem = 106 || animelem = 107 || animelem = 108 || animelem = 109
trigger11 = animelem = 110 || animelem = 111 || animelem = 112 || animelem = 113 || animelem = 114 || animelem = 115 || animelem = 116 || animelem = 117 || animelem = 118 || animelem = 119
trigger12 = animelem = 120 || animelem = 121 || animelem = 122 || animelem = 123 || animelem = 124 || animelem = 125 || animelem = 126 || animelem = 127 || animelem = 128 || animelem = 129
trigger13 = animelem = 130 || animelem = 131 || animelem = 132 || animelem = 133 || animelem = 134 || animelem = 135 || animelem = 136 || animelem = 137 || animelem = 138 || animelem = 139
trigger14 = animelem = 140 || animelem = 141 || animelem = 142 || animelem = 143 || animelem = 144 || animelem = 145 || animelem = 146 || animelem = 147 || animelem = 148 || animelem = 149
trigger15 = animelem = 150 || animelem = 151 || animelem = 152 || animelem = 153 || animelem = 154 || animelem = 155 || animelem = 156 || animelem = 157 || animelem = 158 || animelem = 159
trigger16 = animelem = 160 || animelem = 161 || animelem = 162 || animelem = 163 || animelem = 164 || animelem = 165 || animelem = 166 || animelem = 167 || animelem = 168 || animelem = 169
trigger17 = animelem = 170 || animelem = 171 || animelem = 172 || animelem = 173 || animelem = 174 || animelem = 175 || animelem = 176 || animelem = 177 || animelem = 178 || animelem = 179
trigger18 = animelem = 180 || animelem = 181 || animelem = 182 || animelem = 183 || animelem = 184 || animelem = 185 || animelem = 186 || animelem = 187 || animelem = 188 || animelem = 189
trigger19 = animelem = 190 || animelem = 191 || animelem = 192 || animelem = 193 || animelem = 194 || animelem = 195 || animelem = 196 || animelem = 197 || animelem = 198 || animelem = 199 || animelem = 200 || animelem = 201 || animelem = 202 || animelem = 203 || animelem = 204 || animelem = 205 || animelem = 206 || animelem = 207 || animelem = 208 || animelem = 209
time = 22
freq = 120
ampl = 4

[state assertspecial]
type=assertspecial
trigger1=time=[0,200]
flag=roundnotover

;==========< PISED-OFF ONI INTRO >========== Hehhe
[Statedef 173]
type = S
ctrl = 0
anim = 173
velset = 0, 0

[State 182, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 182, intro]
type = assertspecial
triggerall = !(teammode = simul) && !(teammode = turns) && !(enemy, teammode = turns)
triggerall = var(52) != 5
triggerall = var(22) = 1
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" 
trigger6 = enemy, authorname = "Froz" || enemy, authorname = "Phantom.of.the.Server"
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
flag = nobardisplay

[State 182, intro]
type = assertspecial
triggerall = !(teammode = simul) && !(teammode = turns) && !(enemy, teammode = turns)
triggerall = var(52) != 5
triggerall = var(22) = 1
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega" 
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega" ||  enemy, name = "CvS_DecapreTAG"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
trigger9 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger10 = enemy, name = "DecapreTAG" || enemy, name = "JuniTAG" || enemy, name = "JuliTAG" || enemy, name = "CvS_DecapreTAG"
trigger11 = enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
trigger12 = enemy, name = "Fei Long" || enemy, name = "FeiLong_mx"
trigger13 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger14 = enemy, name = "CFJ_Hakan" 
trigger15 = enemy, name = "Hakan"
trigger16 = enemy, name = "HakanTAG" || enemy, name = "CFJ_HakanTAG"
trigger17 = enemy, name = "Dee Jay" || enemy, name = "DeeJay_mx" || enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
trigger18 = enemy, name = "Dhalsim" || enemy, name = "DhalsimTAG" || enemy, name = "cvsdhalsim"
trigger19 = enemy, name = "RajaaDhalsim" || enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
trigger20 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugano" || enemy, name = "SakuraKasugano" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
flag = nobardisplay

;[State 182, intro]
;type = assertspecial
;triggerall = var(52) != 5
;triggerall = var(22) = 1
;trigger1 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken" 
;trigger2 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
;trigger3 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG" 
;trigger4 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
;flag = nobardisplay

[State 195, Shake]
type = envshake
trigger1 = animelem = 6
time = 10
freq = 120
ampl = 6

[State 0, PowerAdd]
type = PowerAdd
trigger1 = animelem = 6
value = (1000 +ifelse(var(53)>=13,500,0)) * ifelse((Enemy,teammode=simul)&&(teammode!=simul),2,1)


[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S14,ifelse(var(53)=11,34,ifelse(var(53)=13,33,ifelse(var(53)=14,34,31)))
volume = 255
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = time = 1
value = S14,ifelse(var(53)=11,34,ifelse(var(53)=13,33,ifelse(var(53)=14,34,31)))
volume = 255
channel = 2


[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelem = 6
value = S5,4
volume = 255
channel = 1

[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(5) = 2
value = S5,40
volume = 255
[State 0, PlaySnd]
type = PlaySnd
trigger1 = animelemtime(5) = 2
value = S5,40
volume = 255

[State 1030, explod]
type = explod
trigger1 = animelem = 6
anim = 4219
ID = 4404
postype = p1
sprpriority = 3
ownpal = 1
pos = 5, 16
scale = 0.333, 0.333
persistent = 0
ignorehitpause = 1


[State 195, Dust]
type = explod
trigger1 = animelem = 6
anim = 7100
ID = 7100
sprpriority = 4
postype = p1
pos = 15, 6
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 195, Dust]
type = explod
trigger1 = animelem = 6
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 15, 6
scale = 1, 1
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1
[State 195, Dust]
type = explod
trigger1 = animelem = 6
anim = 7160
ID = 7104
sprpriority = -1
postype = p1
pos = 15, 6
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
pausemovetime = -1
supermovetime = -1

[State 0, ChangeState]
type = ChangeState
trigger1 = !animtime
value = 0





;==========< DRAWGAME (Time over) >==========
[Statedef 175]
type = S
ctrl = 0
anim = 170
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1
[State 175, Dust]
type = explod
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -5, 6
ownpal = 1

[State 4000, Aura]
type = helper
trigger1 = anim = 170 && animelem = 8
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
persistent = 0
pos = 0, 40
supermovetime = 9999


[State 175, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = animelem = 2
value = 11, 2
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = animelem = 2
value = 11, 2
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = animelem = 2
value = 11, 4
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = animelem = 2
value = 11, 4
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
trigger1 = animelem = 5
value = 5, 4
channel = 1

[State 175, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 12
channel = 5
loop = 1
persistent = 0

[State 175, Snd]
type = playsnd
trigger1 = animelem = 10
value = 5, 12
channel = 6
loop = 1
persistent = 0


[State 182, Shake]
type = envshake
trigger1 = animelem = 5 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16 || animelem = 17 || animelem = 18 || animelem = 19
trigger2 = animelem = 20 || animelem = 21 || animelem = 22 || animelem = 23 || animelem = 24 || animelem = 25 || animelem = 26 || animelem = 27 || animelem = 28 || animelem = 29
trigger3 = animelem = 30 || animelem = 31 || animelem = 32 || animelem = 33 || animelem = 34 || animelem = 35 || animelem = 36 || animelem = 37 || animelem = 38 || animelem = 39
trigger4 = animelem = 40 || animelem = 41 || animelem = 42 || animelem = 43 || animelem = 44 || animelem = 45 || animelem = 46 || animelem = 47 || animelem = 48 || animelem = 49
trigger5 = animelem = 50 || animelem = 51 || animelem = 52 || animelem = 53 || animelem = 54 || animelem = 55 || animelem = 56 || animelem = 57 || animelem = 58 || animelem = 59
trigger6 = animelem = 60 || animelem = 61 || animelem = 62 || animelem = 63 || animelem = 64 || animelem = 65 || animelem = 66 || animelem = 67 || animelem = 68 || animelem = 69
trigger7 = animelem = 70 || animelem = 71 || animelem = 72 || animelem = 73 || animelem = 74 || animelem = 75 || animelem = 76 || animelem = 77 || animelem = 78 || animelem = 79
trigger8 = animelem = 80 || animelem = 81 || animelem = 82 || animelem = 83 || animelem = 84 || animelem = 85 || animelem = 86 || animelem = 87 || animelem = 88 || animelem = 89
trigger9 = animelem = 90 || animelem = 91 || animelem = 92 || animelem = 93 || animelem = 94 || animelem = 95 || animelem = 96 || animelem = 97 || animelem = 98 || animelem = 99
trigger10 = animelem = 100 || animelem = 101 || animelem = 102 || animelem = 103 || animelem = 104 || animelem = 105 || animelem = 106 || animelem = 107 || animelem = 108 || animelem = 109
trigger11 = animelem = 110 || animelem = 111 || animelem = 112 || animelem = 113 || animelem = 114 || animelem = 115 || animelem = 116 || animelem = 117 || animelem = 118 || animelem = 119
trigger12 = animelem = 120 || animelem = 121 || animelem = 122 || animelem = 123 || animelem = 124 || animelem = 125 || animelem = 126 || animelem = 127 || animelem = 128 || animelem = 129
trigger13 = animelem = 130 || animelem = 131 || animelem = 132 || animelem = 133 || animelem = 134 || animelem = 135 || animelem = 136 || animelem = 137 || animelem = 138 || animelem = 139
trigger14 = animelem = 140 || animelem = 141 || animelem = 142 || animelem = 143 || animelem = 144 || animelem = 145 || animelem = 146 || animelem = 147 || animelem = 148 || animelem = 149
trigger15 = animelem = 150 || animelem = 151 || animelem = 152 || animelem = 153 || animelem = 154 || animelem = 155 || animelem = 156 || animelem = 157 || animelem = 158 || animelem = 159
trigger16 = animelem = 160 || animelem = 161 || animelem = 162 || animelem = 163 || animelem = 164 || animelem = 165 || animelem = 166 || animelem = 167 || animelem = 168 || animelem = 169
trigger17 = animelem = 170 || animelem = 171 || animelem = 172 || animelem = 173 || animelem = 174 || animelem = 175 || animelem = 176 || animelem = 177 || animelem = 178 || animelem = 179
trigger18 = animelem = 180 || animelem = 181 || animelem = 182 || animelem = 183 || animelem = 184 || animelem = 185 || animelem = 186 || animelem = 187 || animelem = 188 || animelem = 189
trigger19 = animelem = 190 || animelem = 191 || animelem = 192 || animelem = 193 || animelem = 194 || animelem = 195 || animelem = 196 || animelem = 197 || animelem = 198 || animelem = 199 || animelem = 200 || animelem = 201 || animelem = 202 || animelem = 203 || animelem = 204 || animelem = 205 || animelem = 206 || animelem = 207 || animelem = 208 || animelem = 209
time = 22
freq = 120
ampl = 4





[state assertspecial]
type=assertspecial
trigger1=time=[0,200]
flag=roundnotover



;==========< PREINTRO >==========
[Statedef 191]
type = S
ctrl = 0
velset = 0, 0

[State 0, VarSet]
type = VarSet
trigger1 = !roundsexisted
var(59) = 0
[State 0, VarSet]
type = VarSet
trigger1 = !roundsexisted
var(52) = 0
[State 0, VarSet]
type = VarSet
trigger1 = !roundsexisted
var(56) = 0
[State 0, VarSet]
type = VarSet
trigger1 = !roundsexisted
var(57) = 0

[State 5900, In-battle dialogues]
type = Varset
trigger1 = !time
var(52)= ifelse(var(1) = 2 || var(1) = 4,5,var(53))
[State 5900, In-battle dialogues]
type = Varset
trigger1 = !time
var(56)= var(50)
[State 5900, In-battle dialogues]
type = Varset
trigger1 = !time
var(57)= var(51)
[State 5900, Shin Oni mode]
type = Varset
triggerall = var(39) = 5
trigger1 = !time
fvar(1) = 20
[State 5900, Shin Oni mode]
type = Varset
triggerall = var(39) = 5
trigger1 = !time
fvar(2) = 1
[State 5900, Shin Oni mode]
type = Varset
triggerall = var(39) = 5
trigger1 = !time
var(1) = 4
[State 5900, Shin Oni mode]
type = Varset
triggerall = var(39) = 5
trigger1 = !time
var(0) = 68
[State 5900, Shin mode]
type = Varadd
triggerall = var(39) = 2
trigger1 = var(0) = [1,12]
trigger1 = !time
fvar(1) = 2
[State 5900, Shin mode]
type = Varset
triggerall = var(39) = 2
trigger1 = var(0) = [1,12]
trigger1 = !time
var(1) = 3
[State 5900, Shin mode]
type = Varadd
triggerall = var(39) = 2
trigger1 = var(0) = [1,12]
trigger1 = !time
var(0) = 24
[State 5900, Oni mode]
type = Varadd
triggerall = var(39) = 3
trigger1 = var(0) = [25,36]
trigger1 = !time
fvar(1) = -1
[State 5900, Oni mode]
type = Varset
triggerall = var(39) = 3
trigger1 = var(0) = [25,36]
trigger1 = !time
var(1) = 2
[State 5900, Oni mode]
type = Varadd
triggerall = var(39) = 3
trigger1 = var(0) = [25,36]
trigger1 = !time
var(0) = -12
[State 5900, Oni mode]
type = Varset
triggerall = fvar(3) = 34 || fvar(3) = 14
trigger1 = var(39)= 6
var(39)= 7

;[State 195, Palette Select]
;type = helper
;trigger1= !roundsexisted
;helpertype = normal
;stateno = 8990
;ID = 8990
;postype = p1
;pos = -20, -20
;size.xscale = 0.25
;size.yscale = 0.25
;ownpal = 0
;persistent = 0
;ignorehitpause = 1


[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(21) = 192
[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(22) = 0
[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(23) = 0
[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(24) = 64
[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(25) = 0
[State Pal FX: 000]
type = varset
trigger1 = fvar(1) = 8 || fvar(1) = 25 || fvar(1) = 34
fvar(26) = 0
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(21) = 192
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(22) = 96
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(23) = 0
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(24) = 64
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(25) = 64
[State Pal FX: 030]
type = varset
trigger1 = fvar(1) = 5 || fvar(1) = 13 || fvar(1) = 22
fvar(26) = 0
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(21) = 192
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(22) = 192
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(23) = 0
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(24) = 64
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(25) = 64
[State Pal FX: 060]
type = varset
trigger1 = fvar(1) = 10 || fvar(1) = 30|| fvar(1) = 33
fvar(26) = 0
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(21) = 96
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(22) = 192
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(23) = 0
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(24) = 64
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(25) = 64
[State Pal FX: 090]
type = varset
trigger1 = fvar(1) = 6 || fvar(1) = 14 || fvar(1) = 23
fvar(26) = 0
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(21) = 0
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(22) = 192
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(23) = 0
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(24) = 0
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(25) = 64
[State Pal FX: 120]
type = varset
trigger1 = fvar(1) = 9 || fvar(1) = 29 || fvar(1) = 35
fvar(26) = 0
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(21) = 0
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(22) = 192
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(23) = 96
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(24) = 0
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(25) = 64
[State Pal FX: 150]
type = varset
trigger1 = fvar(1) = 4 || fvar(1) = 15 || fvar(1) = 24
fvar(26) = 64
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(21) = 0
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(22) = 192
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(23) = 192
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(24) = 0
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(25) = 64
[State Pal FX: 180]
type = varset
trigger1 = fvar(1) = 28 || fvar(1) = 11 || fvar(1) = 31
fvar(26) = 64
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(21) = 0
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(22) = 96
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(23) = 192
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(24) = 0
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(25) = 64
[State Pal FX: 210]
type = varset
trigger1 = fvar(1) = 2 || fvar(1) = 19 || fvar(1) = 16
fvar(26) = 64
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(21) = 0
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(22) = 0
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(23) = 192
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(24) = 0
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(25) = 0
[State Pal FX: 240]
type = varset
trigger1 = fvar(1) = 7 || fvar(1) = 27 || fvar(1) = 36
fvar(26) = 64
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(21) = 96
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(22) = 0
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(23) = 192
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(24) = 64
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(25) = 0
[State Pal FX: 270]
type = varset
trigger1 = fvar(1) = 3 || fvar(1) = 20 || fvar(1) = 17
fvar(26) = 64
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(21) = 192
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(22) = 0
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(23) = 192
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(24) = 64
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(25) = 0
[State Pal FX: 300]
type = varset
trigger1 = fvar(1) = 12 || fvar(1) = 26 || fvar(1) = 32
fvar(26) = 64
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(21) = 192
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(22) = 0
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(23) = 96
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(24) = 64
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(25) = 0
[State Pal FX: 330]
type = varset
trigger1 = fvar(1) = 1 || fvar(1) = 21 || fvar(1) = 18
fvar(26) = 64
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(21) = 192
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(22) = 192
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(23) = 192
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(24) = 64
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(25) = 64
[State Pal FX: 0-0]
type = varset
trigger1 = fvar(1) = [37,49]
fvar(26) = 64

[State 5900, turnsintro]
type = changestate
trigger1 = !time && teammode = turns
trigger1 = !roundsexisted && roundno >= 2
value = 358

;[State 190, intro vs my Evil Ryu / Evil Ken]
;type = changestate
;triggerall = (roundno = 1 && !(teammode = simul) && !(enemy, teammode = simul))
;trigger1 = enemy, authorname = "Mr.Ansatsuken"
;trigger1 = enemy, name = "Evil Ken" || enemy, name = "Evil Ryu"
;trigger2 = enemy, authorname = "Phantom.of.the.Server"
;trigger2 = enemy, name = "Ryu" && enemy, var(1) = 2
;trigger2 = enemy, selfanimexist(4201533)
;trigger2 = var(1) != 5
;value = 360

[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
triggerall = AIlevel
triggerall = roundno = 1
trigger1 = StageVar(info.name) = "Hidden Shrine"
trigger2 = StageVar(info.name) = "Gill-Eclipse"
trigger3 = StageVar(info.name) = "Unknown - Gill"
trigger4 = StageVar(info.name) = "Unknown - Gill "
trigger5 = StageVar(info.name) = "Gill Stage"
trigger6 = StageVar(info.name) = "Gill's Stage"
trigger7 = StageVar(info.name) = "Gill's SFII Stage"
value = 188

[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
triggerall = AIlevel
triggerall = roundno = 1
trigger1 = StageVar(info.name) = "Cvs Gouki" || StageVar(info.name) = "Akuma's Forest"
trigger2 = StageVar(info.name) = "Akuma-Kaji"  || StageVar(info.name) = "Oni's Stage"
trigger3 = StageVar(info.name) = "Akuma-Arashi" || StageVar(info.name) = "Oni Stage"
trigger4 = StageVar(info.name) = "Gokuento Island"
trigger5 = StageVar(info.name) = "Akuma's SFA stage"
trigger6 = StageVar(info.name) = "Destroyed Temple"
trigger7 = StageVar(info.name) = "Kiga Cave (Evil Ryu)"
trigger8 = StageVar(info.name) = "Kiga Cave (Akuma)"
trigger9 = StageVar(info.name) = "Kiga Cave (Shin Akuma)"
trigger10 = StageVar(info.name) = "Kiga Cave"
trigger11 = StageVar(info.name) = "Kousyu Street"
trigger12 = StageVar(info.name) = "Japan - Kousyu street - Akuma"
trigger13 = StageVar(info.name) = "Japan - Kousyu street - Gouki"
trigger14 = StageVar(info.name) = "Akuma's Stage"
trigger15 = StageVar(info.name) = "Gouki's Stage"
trigger16 = StageVar(info.name) = "Shin Akuma's Stage"
trigger17 = StageVar(info.name) = "Shin Gouki's Stage"
trigger18 = StageVar(info.name) = "Osaka"
trigger19 = enemy, name = "Guy" || enemy, name = "cvsguy" || enemy, name = "Guy_mx" || enemy, name = "Bison (Boxer)" || enemy, name = "M. Bison (Boxer)"
trigger20 = enemy, name = "Balrog" || enemy, name = "Boxer" || enemy, name = "Balrog (Boxer)" || enemy, name = "Balrog(Boxer)" || enemy, name = "BoxerTAG"
value = ifelse(var(1)=2,188,182)

[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
trigger1 = var(1) = 4
trigger1 = AIlevel
trigger1 = roundno = 1
value = 188;ifelse(enemy, AIlevel, 188, ifelse(random<500,188,182))
[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
triggerall = var(1) = 3
triggerall = AIlevel
trigger1= roundno = 1
value = ifelse(enemy, AIlevel, 188, ifelse(random<600,188,182))
[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
trigger1 = var(1)= 2
trigger1 = AIlevel
trigger1 = roundno = 1
value = ifelse(enemy, AIlevel, 188, ifelse(random<667,188,182))
[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
triggerall = var(1)= 1
triggerall = AIlevel
triggerall = roundno = 1
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison" || enemy, name = "True Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex" || enemy, name = "MBison"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison" || enemy, name = "Shin Bison"
trigger6 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger7 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger8 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger9 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison" || enemy, name = "Final Bison"
trigger10 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger11 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger12 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger13 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger14 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger15 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger16 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger17 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger18 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
trigger19 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger20 = enemy, name = "Vega" || enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
value = ifelse(StageVar(info.name) = "Hidden Shrine" || StageVar(info.name) = "Gill-Eclipse" || StageVar(info.name) = "Unknown - Gill" || StageVar(info.name) = "Unknown - Gill " || StageVar(info.name) = "Gill's Stage" || StageVar(info.name) = "Gill Stage" || StageVar(info.name) = "Gill's SFIII Stage",188,ifelse(random<200,188,182))
[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
triggerall = var(1)= 1
triggerall = AIlevel
trigger1 = roundno = 1
value = ifelse(enemy, AIlevel, 188, ifelse(random<600,188,182))
[State 190, intro]
type = changestate
triggerall = fvar(3) = 37
trigger1 = enemy, name != "Apocalypse"
trigger1 = var(1) = 5
trigger1 = AIlevel
trigger1 = roundno = 1
value = ifelse(enemy, AIlevel, 188, ifelse(random<400,188,182))

[State 190, intro]
type = changestate
trigger1 = roundsexisted
trigger1 = var(1) = 2 || var(1) = 4
trigger1 = var(53) = 11 || var(53) = 12 || var(53) = 13 || var(53) = 14
value = 173
[State 190, intro]
type = changestate
trigger1 = !time && teammode != turns
trigger1 = roundno >= 2
value = 0
[State 190, intro]
type = changestate
trigger1 = roundno = 1
;value = 188
value = 182


;==========< INTRO 1 >==========
;---Intro---
[Statedef 182]
type = S
anim = 182
sprpriority = -1

[State 191, intro]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 5900, Oni Intro quote]
type = Varset
triggerall = var(1) = 2
trigger1 = !time
;var(6) = 1 + (random % 5)
var(6) = ifelse(random<200, 1, ifelse(random<250, 2, ifelse(random<333, 3, ifelse(random<500,4,5))))
[State 5900, Akuma Intro quote]
type = Varset
triggerall = var(1) = 1
trigger1 = !time
;var(6) = 1 + (random % 5)
var(6) = ifelse(random<200, 1, ifelse(random<250, 2, ifelse(random<333, 3, ifelse(random<500,4,5))))
[State 5900, Shin Akuma Intro quote]
type = Varset
triggerall = var(1) = 3
trigger1 = !time
;var(6) = 1 + (random % 3)
var(6) = ifelse(random<333, 1, ifelse(random<500, 2, 3))

;======<Version change>=====

[State 256, Countdown]
type = VarAdd
trigger1 = numhelper(8990)
trigger1 =1 
fvar(30)=-1

[State 256, Countdown]
type = Varset
trigger1 = numhelper(8990)
trigger1=command="fwd" || command="back"
fvar(30)=3

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,32,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,11,32)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,11,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,37,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,37,32)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,32,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,28)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,28,35)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,34,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,34)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,28,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,35,28)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,37,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,34,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,1)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,1,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,1,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,9,1)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,2,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,14,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,9,15)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,15,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,22,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,17,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,17)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,22,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,26,22)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,23,33)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,33,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,26,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,34,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,36,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,36)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,2)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,2,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,0,4)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,4,0)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,2,5)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,5,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,4,8)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,8,4)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,5,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,9,5)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,8,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,11,8)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,9,13)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,13,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,11,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,14,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,18)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,18,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,19,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,22,19)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,20,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,20)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,23,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,26,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,24,27)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,27,24)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,26,29)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,29,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,27,30)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,30,27)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,29,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,34,29)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,30,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,35,30)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,34,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,34)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,35)

[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "fwd"
fvar(3) = 100+ifelse(facing=1,1,-1)
[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "back"
fvar(3) = 100 + ifelse(facing=1,-1,1)

[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) < 0
fvar(3) = 37
[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) = [38,58]
fvar(3) = 0

[State 256, Countdown]
type = Varadd
trigger1 = numhelper(8990)
trigger1= fvar(30)=1
fvar(3)=-100

;====<END>====




[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(1) != 4 && var(1) != 5
trigger1 = ((time = 10 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
helpertype = normal
stateno = 9200
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State 195, Version select]
type = helper
triggerall = fvar(27)=1
trigger1 = time = 1
helpertype = normal
stateno = 8990
ID = 8990
postype = p1
pos = ifelse(facing=1,-20,20), -80
size.xscale = 0.5
size.yscale = 0.5
facing = ifelse(facing=1,1,-1)
ownpal = 0
persistent = 0
ignorehitpause = 1

[State -2, Enemy = Anyone]
type = Varset
trigger1 = time = 9
var(10) = 0

; Initialize Morrigan's move variables - CRITICAL FIX
[State -2, Enable EX Parasite Roll]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(67) = 1

[State -2, Enable Cardinal Blade]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(68) = 1

[State -2, Enable Soul Phoenix]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(69) = 1

[State -2, Enable Finishing Shower]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(70) = 1

[State -2, Enable EX Shadow Blade]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(75) = 1

[State -2, Enable EX Vector Drain]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(77) = 1

[State -2, Enable Valkyrie Turn]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(93) = 1

[State -2, Enable Air Darkness Illusion]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(94) = 1

[State -2, Enable Eternal Slumber]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(97) = 1

[State -2, Enemy = Akuma]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = (enemy, name = "Akuma" || enemy, name = "MvC-EoH Gouki" || enemy, name = "CvSGouki" || enemy, name = "svcgouki" || enemy, name = "ZXAkuma" || enemy, name = "Gouki" || enemy, name = "cvsgouki_normal" || enemy, name = "ZXAkuma") && enemy, authorname != "Mr. Ansatsuken" && enemy, authorname !="Phantom.of.the.server"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger3 = (enemy, name = "Gouki" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
trigger4 = enemy, name = "AkumaTAG" || enemy, name = "CvSGoukiTAG" || enemy, name = "Gouki" && enemy, authorname != "Mr. Ansatsuken"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
var(10) = 1

[State -2, Enemy = Shin Akuma]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Shin Akuma" || enemy, name = "Shin Gouki" || enemy, name = "cvsgouki_ex"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger3 = (enemy, name = "Gouki"  && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
trigger4 = enemy, name = "Shin AkumaTAG" || enemy, name = "Shin GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
var(10) = 2

[State -2, Enemy = Oni]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Ogre Gouki" || enemy, name = "Kuroshiki Oni" || enemy, name = "CvS_Oni"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
trigger3 = enemy, name = "Ogre" && enemy, authorname = "JUN"
trigger4 = enemy, name = "OniTAG" || enemy, name = "Oni AkumaTAG" || enemy, name = "Oni GoukiTAG" || enemy, name = "Ogre AkumaTAG" || enemy, name = "Ogre GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
var(10) = 3

[State -2, Enemy = Abel]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Abel" || enemy, name = "AbelTAG"
var(10) = 5
[State -2, Enemy = Adon]
type = Varset
triggerall = var(1) != 4 && var(1) != 5
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Adon" || enemy, name = "AdonTAG" || enemy, name = "Adon_mx"
var(10) = 6
[State -2, Enemy = Asura]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Asura" ||  enemy, name = "AsuraTAG" || enemy, name = "Asura(AW)" || enemy, name = "Asura's Wrath" || enemy, name = "Asura (Asura's Wrath)"
trigger1 = enemy, authorname != "Alexlexus" && enemy, authorname !="flowrallia" && enemy, authorname != "Dick Buckus"
var(10) = 7
[State -2, Enemy = Athena]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena"
trigger2 = enemy, name = "AthenaTAG" || enemy, name = "Goddess AthenaTAG"
var(10) = 8
[State -2, Enemy = Apocalypse]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Apocalypse" || enemy, name = "ApocalypseTAG"
var(10) = 9
[State -2, Enemy = Balrog]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Balrog" || enemy, name = "Boxer" || enemy, name = "Balrog (Boxer)" || enemy, name = "Balrog(Boxer)"
trigger2 = enemy, name = "BalrogTAG" || enemy, name = "BoxerTAG" || enemy, name = "Bison (Boxer)" || enemy, name = "M. Bison (Boxer)"
var(10) = 10
[State -2, Enemy = Blanka]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Blanka" || enemy, name = "BlankaTAG" || enemy, name = "cvsblanka" || enemy, name = "cvsblankaTAG"
var(10) = 11
[State -2, Enemy = Cammy]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Cammy" || enemy, name = "cvscammy" || enemy, name = "CammyTAG" || enemy, name = "Cammy_mx" || enemy, name = "Cammy White"
var(10) = 12
[State -2, Enemy = Choi]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Choi" || enemy, name = "Choi Bounge"
trigger2 = enemy, name = "ChoiTAG" || enemy, name = "Choi BoungeTAG"
var(10) = 13
[State -2, Enemy = Chun-Li]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Chun-Li" || enemy, name = "Chun-LiTAG" || enemy, name = "cvschunli" || enemy, name = "SF3 Chun Li" || enemy, name = "ChunLi_mx"
var(10) = 14
[State -2, Enemy = Crimson Viper]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Crimson Viper" || enemy, name = "C. Viper" || enemy, name = "C.Viper" || enemy, name = "CFJ_C.Viper"
trigger2 = enemy, name = "Crimson ViperTAG" || enemy, name = "C. ViperTAG" || enemy, name = "C.ViperTAG" || enemy, name = "CFJ_C.ViperTAG"
var(10) = 15
[State -2, Enemy = Cody]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Cody" || enemy, name = "Cody Travers" || enemy, name = "Cody_mx"
trigger2 = enemy, name = "CodyTAG" || enemy, name = "Cody TraversTAG"
var(10) = 16
[State -2, Enemy = Dan]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dan" || enemy, name = "Dan Hibiki" || enemy, name = "cvsdan" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan"
trigger2 = enemy, name = "DanTAG" || enemy, name = "Dan HibikiTAG" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: DanTAG" || enemy, name = "Dan_mx"
var(10) = 17
[State -2, Enemy = Decapre]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger2 = enemy, name = "DecapreTAG" || enemy, name = "JuniTAG" || enemy, name = "JuliTAG" || enemy, name = "CvS_DecapreTAG"
var(10) = 18
[State -2, Enemy = Dee Jay]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dee Jay" || enemy, name = "DeeJay_mx"
trigger2 = enemy, name = "Dee JayTAG"
var(10) = 19
[State -2, Enemy = Demitri]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Demitri" || enemy, name = "Demitri Maximoff" || enemy, name = "Demitri(DS)"
trigger2 = enemy, name = "DemitriTAG" || enemy, name = "Demitri MaximoffTAG" 
var(10) = 20
[State -2, Enemy = Dhalsim]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dhalsim" || enemy, name = "DhalsimTAG" || enemy, name = "cvsdhalsim"
trigger2 = enemy, name = "RajaaDhalsim"
var(10) = 21
[State -2, Enemy = Dudley]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dudley" || enemy, name = "DudleyTAG" || enemy, name = "Dudley_mx"
var(10) = 22
[State -2, Enemy = Earthquake]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Earthquake" || enemy, name = "EarthquakeTAG"
var(10) = 23
[State -2, Enemy = E. Honda]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Edmond Honda" || enemy, name = "E. Honda" || enemy, name = "cvshonda" || enemy, name = "Honda_mx"
trigger2 = enemy, name = "Edmond HondaTAG" || enemy, name = "E. HondaTAG" || enemy, name = "cvshondaTAG"
var(10) = 24
[State -2, Enemy = El Fuerte]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "El Fuerte" || enemy, name = "ElFuerte" || enemy, name = "CFJ_ElFuerte"
trigger2 = enemy, name = "El FuerteTAG" || enemy, name = "ElFuerteTAG" || enemy, name = "CFJ_ElFuerteTAG"
var(10) = 25
[State -2, Enemy = Elena]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Elena" || enemy, name = "Elena_mx" || enemy, name = "DR_Elena"
trigger2 = enemy, name = "ElenaTAG"
var(10) = 26
[State -2, Enemy = Fei Long]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Fei Long" || enemy, name = "FeiLong_mx"
trigger2 = enemy, name = "Fei LongTAG"
var(10) = 27
[State -2, Enemy = Geese]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Geese" || enemy, name = "Geese Howard" || enemy, name = "cvsgeese" || enemy, name = "cvsgeese_normal"
trigger2 = enemy, name = "GeeseTAG" || enemy, name = "Geese HowardTAG"
var(10) = 28
[State -2, Enemy = Gen]
type = Varset
triggerall = var(1) = 1 || var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
trigger2 = enemy, name = "GenTAG" || enemy, name = "Master GenTAG"
var(10) = 29
[State -2, Enemy = Genjyuro]
type = Varset
triggerall = var(1) = 1 || var(1) =3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Genjuro" || enemy, name = "Genjuro Kibagami"  || enemy, name = "Genjyuro"
trigger2 = enemy, name = "Genjyuro Kibagami"
trigger3 = enemy, name = "GenjuroTAG" || enemy, name = "Genjuro KibagamiTAG"  || enemy, name = "GenjyuroTAG"
trigger4 = enemy, name = "Genjyuro KibagamiTAG"
var(10) = 30
[State -2, Enemy = Goenitz]
type = Varset
triggerall = var(1) =1 || var(1) =3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Goenitz" || enemy, name = "GoenitzTAG"
var(10) = 31
[State -2, Enemy = Gouken]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken" 
trigger2 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
trigger3 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG" 
trigger4 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
var(10) = 32
[State -2, Enemy = Guile]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Guile" || enemy, name = "GuileTAG" || enemy, name = "cvsguile"
var(10) = 33
[State -2, Enemy = Guy]
type = Varset
triggerall = var(1) != 4 && var(1) != 5
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Guy" || enemy, name = "GuyTAG" || enemy, name = "cvsguy" || enemy, name = "Guy_mx"
var(10) = 34
[State -2, Enemy = Hakan]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hakan" || enemy, name = "CFJ_Hakan" 
trigger2 = enemy, name = "HakanTAG" || enemy, name = "CFJ_HakanTAG"
var(10) = 35
[State -2, Enemy = Hsien-Ko]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei"
trigger2 = enemy, name = "Hsien-KoTAG" || enemy, name = "Lei-LeiTAG"
var(10) = 36
[State -2, Enemy = Hugo]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hugo" || enemy, name = "HugoTAG" || enemy, name = "Hugo_mx"
var(10) = 37
[State -2, Enemy = Ibuki]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ibuki" || enemy, name = "IbukiTAG" || enemy, name = "Ibuki_mx" || enemy, name = "DR_Ibuki"
var(10) = 38
[State -2, Enemy = Iori]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Iori" || enemy, name = "Iori Yagami" || enemy, name = "cvsiori" || enemy, name = "cvsiori_normal"
trigger2 = enemy, name = "IoriTAG" || enemy, name = "Iori YagamiTAG"
var(10) = 39
[State -2, Enemy = Orochi Iori]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Orochi Iori" || enemy, name = "Orochi Iori Yagami" || enemy, name = "OrochiIoriYagami" || enemy, name = "@Orochi Iori"
trigger2 = enemy, name = "OrochiIori" || enemy, name = "OrochiIori Yagami" || enemy, name = "Orochi IoriYagami" || enemy, name = "cvsiori_ex"
trigger3 = enemy, name = "Orochi IoriTAG" || enemy, name = "Orochi Iori YagamiTAG" || enemy, name = "OrochiIoriYagamiTAG"
trigger4 = enemy, name = "OrochiIoriTAG" || enemy, name = "OrochiIori YagamiTAG" || enemy, name = "Orochi IoriYagamiTAG"
trigger5 = enemy, name = "Riot of the Blood Iori" || enemy, name = "O. Iori" || enemy, name = "O.Iori" || enemy, name = "O-Iori"
var(10) = 40
[State -2, Enemy = Juri]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Juri" || enemy, name = "Juri Han" || enemy, name = "JuriHan" || enemy, name ="CFJ_JuriHan"
trigger2 = enemy, name = "JuriTAG" || enemy, name = "Juri HanTAG" || enemy, name = "JuriHanTAG" || enemy, name ="CFJ_JuriHanTAG"
var(10) = 41
[State -2, Enemy = Kasumi]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kasumi" || enemy, name = "Kasumi Todoh"
trigger2 = enemy, name = "KasumiTAG" || enemy, name = "Kasumi TodohTAG"
var(10) = 42
[State -2, Enemy = Ken]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ken" || enemy, name = "cvsken" || enemy, name = "cvsken_normal" || enemy, name = "Ken Masters" || enemy, name = "Ken SF3trd" || enemy, name = "Street Fighter 3 Ken" || enemy, name = "Master Ken" && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger2 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) != 1
trigger3 = enemy, name = "KenTAG" || enemy, name = "Ken MastersTAG" || enemy, name = "Master KenTAG" && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger4 = enemy, name = "Ken MastersTAG" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) != 1
var(10) = 43
[State -2, Enemy = Violent Ken]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Violent Ken" || enemy, name = "cvsken_ex"
trigger2 = enemy, name = "Ken" && enemy, authorname = "vyn"
trigger3 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 1
trigger4 = enemy, name = "Violent KenTAG"
trigger5 = enemy, name = "KenTAG" && enemy, authorname = "vyn"
trigger6 = enemy, name = "Ken MastersTAG" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 1
var(10) = 44
[State -2, Enemy = Kim]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kim" || enemy, name = "Kim Kaphwan" || enemy, name = "cvskim"
trigger2 = enemy, name = "KimTAG" || enemy, name = "Kim KaphwanTAG"
var(10) = 45
[State -2, Enemy = Kyo]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kyo" || enemy, name = "Kyo Kusanagi" || enemy, name = "KyoKusanagi" || enemy, name = "cvskyo" || enemy, name = "cvskyo_normal"
trigger2 = enemy, name = "KyoTAG" || enemy, name = "Kyo KusanagiTAG" || enemy, name = "KyoKusanagiTAG"
var(10) = 46
[State -2, Enemy = M. Bison]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega" 
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "VegaTAG" 
trigger5 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
var(10) = 47
[State -2, Enemy = Final Bison]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" && enemy, authorname = "Froz"
trigger6 = enemy, var(40)=1
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
var(10) = 47
[State -2, Enemy = Mai]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mai" || enemy, name = "Mai Shiranui" || enemy, name = "MaiShiranui" || enemy, name = "cvsmai"
trigger2 = enemy, name = "MaiTAG" || enemy, name = "Mai ShiranuiTAG" || enemy, name = "MaiShiranuiTAG"
var(10) = 48
[State -2, Enemy = Makoto]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Makoto" || enemy, name = "Makoto_mx" || enemy, name = "DR_Makoto"
trigger2 = enemy, name = "MakotoTAG"
var(10) = 49
[State -2, Enemy = Mars People]; Yeah, I know it's a f*cking generic character which probably isn't even in M.U.G.E.N... but still.
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mars People";  Best name ever :V
trigger2 = enemy, name = "Mars PeopleTAG"; >Implying "Mars People" has ever been made. >Implying someone will ever make a "tag" version of it.
var(10) = 50
[State -2, Enemy = Mr. Karate]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mr. Karate" || enemy, name = "Mr.Karate" || enemy, name = "Mr Karate" || enemy, name = "MrKarate"
trigger1 = enemy, authorname != "Victorys"
trigger2 = enemy, name = "CvS2_Mr.Karate" || enemy, name = "cvs_mr_karate" || enemy, name = "svckarate"
trigger3 = enemy, name = "Mr. KarateTAG" || enemy, name = "Mr.KarateTAG" || enemy, name = "Mr KarateTAG" || enemy, name = "MrKarateTAG"
trigger4 = enemy, name = "CvS2_Mr.KarateTAG" || enemy, name = "cvs_mr_karateTAG"
trigger5 = enemy, name = "Mr.Karate" && enemy, authorname = "Victorys"
trigger5 = enemy, var(53) = 0
var(10) = 51
[State -2, Enemy = Honki Ni Natta Mr. Karate]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Honki ni Natta Mr. Karate" || enemy, name = "Shin Mr. Karate"  || enemy, name = "Serious Mr. Karate"
trigger2 = enemy, name = "Honki ni Natta Mr.Karate" ||  enemy, name = "Shin Mr.Karate"  ||  enemy, name = "Serious Mr.Karate"
trigger3 = enemy, name = "Honki ni Nata Mr Karate" ||  enemy, name = "Shin Mr Karate"  ||  enemy, name = "Serious Mr Karate"
trigger4 = enemy, name = "Honki ni Natta MrKarate" ||  enemy, name = "Shin MrKarate"  ||  enemy, name = "Serious MrKarate"
trigger5 = enemy, name = "Honki ni Natta Mr. KarateTAG" || enemy, name = "Shin Mr. KarateTAG"  || enemy, name = "Serious Mr. KarateTAG"
trigger6 = enemy, name = "Honki ni Natta Mr.KarateTAG" ||  enemy, name = "Shin Mr.KarateTAG"  ||  enemy, name = "Serious Mr.KarateTAG"
trigger7 = enemy, name = "Honki ni Natta Mr KarateTAG" ||  enemy, name = "Shin Mr KarateTAG"  ||  enemy, name = "Serious Mr KarateTAG"
trigger8 = enemy, name = "Honki ni Natta MrKarateTAG" ||  enemy, name = "Shin MrKarateTAG"  ||  enemy, name = "Serious MrKarateTAG"
trigger9 = enemy, name = "Mr.Karate" && enemy, authorname = "Victorys"
trigger9 = enemy, var(53) = 1
trigger10 = enemy, name = "Mr.KARATEIII"
var(10) = 52
[State -2, Enemy = Ogre]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ogre" || enemy, name = "True Ogre" || enemy, name = "Ancient Ogre" || enemy, name = "CvS_Ogre" && enemy, authorname !="JUN"
trigger2 = enemy, name = "OgreTAG" || enemy, name = "True OgreTAG" || enemy, name = "Ancient OgreTAG" || enemy, name = "CvS_OgreTAG"
var(10) = 53
[State -2, Enemy = Poison]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Poison" || enemy, name = "PoisonTAG"
var(10) = 54
[State -2, Enemy = Rolento]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rolento" || enemy, name = "RolentoTAG" || enemy, name = "cvsrolento" || enemy, name = "Rolento_mx"
var(10) = 55
[State -2, Enemy = Rose]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rose" || enemy, name = "RoseTAG" || enemy, name = "Rose_mx"
var(10) = 56
[State -2, Enemy = Red Arremer]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Red Arremer" || enemy, name = "RedArremer" || enemy, name = "Firebrand"
trigger2 = enemy, name = "Red ArremerTAG" || enemy, name = "RedArremerTAG" || enemy, name = "FirebrandTAG"
var(10) = 57
[State -2, Enemy = Rufus]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rufus" || enemy, name = "RufusTAG"
var(10) = 58
[State -2, Enemy = Ryo]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ryo" || enemy, name = "Ryo Sakazaki" || enemy, name = "RyoSakazaki" || enemy, name = "cvsryo"
trigger2 = enemy, name = "RyoTAG" || enemy, name = "Ryo SakazakiTAG" || enemy, name = "RyoSakazakiTAG"
var(10) = 59
[State -2, Enemy = Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
var(10) = 60
[State -2, Enemy = Evil Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Evil Ryu" || enemy, name = "Evil Ryu Hoshi" || enemy, name = "E. Ryu" || enemy, name = "cvsryu_ex"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger3 = enemy, name = "ERyu" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil Ryu"
trigger4 = enemy, name = "Evil RyuTAG" || enemy, name = "Evil Ryu HoshiTAG" || enemy, name = "E. RyuTAG"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger6 = enemy, name = "ERyuTAG" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil RyuTAG"
var(10) = 61
[State -2, Enemy = Sagat]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sagat" || enemy, name = "SagatTAG" || enemy, name = "cvssagat" || enemy, name = "Sagat_mx"
var(10) = 62
[State -2, Enemy = Sakura]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugano" || enemy, name = "SakuraKasugano" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
trigger2 = enemy, name = "SakuraTAG" || enemy, name = "Sakura KasuganoTAG" || enemy, name = "SakuraKasuganoTAG" || enemy, name = "Sakura_mx"
var(10) = 63
[State -2, Enemy = Sean]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sean" || enemy, name = "Sean Martsuda" || enemy, name = "Sean_mx"
var(10) = 64
[State -2, Enemy = Seth]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
var(10) = 65
[State -2, Enemy = Shiki]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Shiki" || enemy, name = "ShikiTAG"
var(10) = 66
[State -2, Enemy = Terry]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Terry" || enemy, name = "Terry Bogard" || enemy, name = "TerryBogard" || enemy, name = "cvsterry"
trigger2 = enemy, name = "TerryTAG" || enemy, name = "Terry BogardTAG" || enemy, name = "TerryBogardTAG"
var(10) = 67
[State -2, Enemy = Tessa]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Tessa" || enemy, name = "TessaTAG"
trigger2 = enemy, name = "Tessa (Tabasa)" || enemy, name = "Tabasa" || enemy, name = "Tabasa (Tessa)"
var(10) = 68
[State -2, Enemy = T. Hawk]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "T. Hawk" || enemy, name = "T.Hawk" || enemy, name = "Thunder Hawk"
trigger2 = enemy, name = "T Hawk" || enemy, name = "ThunderHawk" || enemy, name = "THawk" || enemy, name = "T.Hawk_mx"
var(10) = 69
[State -2, Enemy = Vega]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Vega" || enemy, name = "Claw" || enemy, name = "Balrog_mx" || enemy, name = "Vega(Claw)" || enemy, name = "Vega (Claw)" || enemy, name = "Balrog(Claw)" || enemy, name = "Balrog (Claw)"
trigger1 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
trigger2 = enemy, name = "VegaTAG" || enemy, name = "ClawTAG"
trigger2 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
var(10) = 70
[State -2, Enemy = Yang]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Yang" || enemy, name = "Yang_mx"
trigger2 = enemy, name = "YangTAG"
var(10) = 71
[State -2, Enemy = Yun]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Yun" || enemy, name = "cvsyun"
trigger2 = enemy, name = "YunTAG" || enemy, name = "Yun_mx"
var(10) = 72
[State -2, Enemy = Zangief]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger2 = enemy, name = "ZangiefTAG"
var(10) = 73
[State -2, Enemy = Zero]
type = Varset
triggerall = var(1) = 1|| var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Zero"
trigger2 = enemy, name = "ZeroTAG"
var(10) = 74
[State -2, Enemy = Chuchoryu]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Chuchoryu" || enemy, name = "ChuchoryuTAG"
var(10) = 75
[State -2, Enemy = Ghost Rider]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ghost Rider" || enemy, name = "Ghost RiderTAG" || enemy, name = "DCvsMGhostRider"
var(10) = 77
;[State -2, Enemy = Arthur]
;type = Varset
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Arthur" || enemy, name = "ArthurTAG"
;var(10) = 78
;[State -2, Enemy = Iron Fist]
;type = Varset
;triggerall = var(1) = 1 || var(1) = 3
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Iron Fist" || enemy, name = "Ironfist"
;trigger2 = enemy, name = "Iron FistTAG" || enemy, name = "IronfistTAG"
;var(10) = 79
;[State -2, Enemy = Phoenix]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Phoenix" || enemy, name = "Jean Grey" || enemy, name = "JeanGrey" || enemy, name = "Phoenix (Jean Grey)"
;trigger2 = enemy, name = "PhoenixTAG" || enemy, name = "Jean GreyTAG" || enemy, name = "JeanGreyTAG"
;var(10) = 80
;[State -2, Enemy = Sentinel]
;type = Varset
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Sentinel" || enemy, name = "SentinelTAG"
;var(10) = 81
;[State -2, Enemy = Taskmaster]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Taskmaster" || enemy, name = "TaskmasterTAG"
;var(10) = 82
;[State -2, Enemy = Tron Bonne]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Tron Bonne" || enemy, name = "TronBonne"
;trigger2 =enemy, name = "Tron BonneTAG" || enemy, name = "TronBonneTAG"
;var(10) = 83
;[State -2, Enemy = Galactus]
;type = Varset
;triggerall = var(1) != 4 && var(1) !=5
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Galactus" || enemy, name = "GalactusTAG"
;var(10) = 84
[State -2, Enemy = Oro]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Oro" || enemy, name = "SFIII_Oro" || enemy, name = "DR_Oro" || enemy, name = "Oro_mx"
var(10) = 85
;[State -2, Enemy = Rugal]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "cvsrugal" || enemy, name = "Rugal" || enemy, name = "rugal94" || enemy, name = "svcrugal" || enemy, name = "cvsrugal_normal"
;var(10) = 86
[State -2, Enemy = KFM/Others]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kung Fu Man" || enemy, name = "Phantom.of.the.Server" || enemy, name = "Reu" || enemy, name = "Reuben Kee" || enemy, name = "Jmorphman"
trigger2 = enemy, name = "Divine Wolf" ; || enemy, name = "Anyone who I forgot to put here or... I was just lazy, gimme a break, hehh heh-"
var(10) = 88
[State -2, Enemy = BANE?]
type = Varset
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Bane" || enemy, name = "Bane edit"
var(10) = 89

[State 182, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 182, Spr]
type = sprpriority
triggerall = anim = 182
trigger1 = animelemtime(5) >= 0
value = 0

[State 182, Aura]
type = helper
triggerall = anim = 182
trigger1 = animelem = 11
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0

[State 182, Akuma special quote against a PITIFUL CREATURE] 
type = varset
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = enemy, SelfAnimExist(8055022) || enemy, SelfAnimExist(8055023) || enemy, SelfAnimExist(8055026) || enemy, SelfAnimExist(8055027)
trigger2 = enemy, name = "Blanka" || enemy, name = "cvsblanka" || enemy, name = "cvsblanka" || enemy, name = "Morrigan" || enemy, name = "Morrigan Aensland"
trigger3 = enemy, name = "Felicia" || enemy, name = "Demitri" || enemy, name = "cvsfelicia" || enemy, name = "Amingo" || enemy, name = "Goro" || enemy, name = "Q"
trigger4 = enemy, name = "RajaaAmingo" || enemy, name = "Twelve" || enemy, name = "Carnage" || enemy, name = "Venom" || enemy, name = "Garuda" || enemy, name = "VenomEX"
trigger5 = enemy, name = "Beast" || enemy, name = "Hulk" || enemy, name = "Kintaro" || enemy, name = "Motaro" || enemy, name = "Bishamon" || enemy, name = "Jedah Dohma"
trigger6 = enemy, name = "Anakaris" || enemy, name = "Nemesis" || enemy, name = "Red Arremer" || enemy, name = "Firebrand" || enemy, name = "Black Heart" || enemy, name = "Jedah(DS)"
trigger7 = enemy, name = "Abyss" || enemy, name = "Jedah" || enemy, name = "Lllith" || enemy, name = "RajaaLllith" || enemy, name = "Morrigan_Aensland"
trigger8 = enemy, name = "Demitri(DS)" || enemy, name = "Demitri Maximoff" || enemy, name = "Lord Raptor" || enemy, name = "RajaaLllith" || enemy, name = "Lord Raptor(DS)"
trigger9 = enemy, name = "Necro" || enemy, name = "Twelve" || enemy, name = "Necro_mx" || enemy, name = "Twelve_mx" || enemy, name = "Saiki" || enemy, name = "Mukai" || enemy, name = "DR_Necro"
var(6) = 12
[State 182, Akuma special quote against a machine]
type = varset
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Cyber" || enemy, name = "Cyber Akuma" || enemy, name = "Z-Gouki"
trigger2 = enemy, SelfAnimExist(8055021) || enemy, selfanimexist(8055025)
trigger3 = enemy, SelfAnimExist(8055029)
trigger4 = enemy, name = "Mech Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma"
trigger5 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack"
trigger6 = enemy, name = "Mokujin" || enemy, name = "Pacman" || enemy, name = "Draon Claw" ;|| enemy, name = "Q"
trigger7 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger7 = enemy, var(55) = 1
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger8 = enemy, var(1) = 5
trigger9 = enemy, name = "Mech-Zangief" && enemy, authorname = "cvszangief_ex" || enemy, name = "Victor Von Doom"
trigger10 = enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom" || enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom"
trigger11 = enemy, name = "Dan" || enemy, name = "Dan Hibiki" || enemy, name = "cvsdan" || enemy, name = "svcdan" || enemy, name = "Dan_mx" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan"
var(6) = 11
[State 182, Akuma special quote against a god]
type = varset
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = enemy, SelfAnimExist(8055028)
trigger2 = enemy, name = "God Rugal" || enemy, name = "Orochi" || enemy, name = "Asura" || enemy, name = "Pyron" ||  enemy, name = "Thor" || enemy, name = "Pyron(DS)"
trigger3 = enemy, name = "Gill" || enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Kuroshiki Oni"
trigger4 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena" || enemy, name = "Amaterasu" || enemy, name = "Ogre Gouki"
trigger5 = enemy, name = "D-Rugal" || enemy, name = "Dormammu" || enemy, name = "Galactus" || enemy, name = "Shuma-Gorath" || enemy, name = "Ancient Ogre"
trigger6 = enemy, name = "Ancient Ogre" || enemy, name = "Ogre" || enemy, name = "cvs_ogre" || enemy, name = "True Ogre" || enemy, name = "Monstrous Ogre"																	|| enemy, name = "Chuchoryu"
trigger7 = enemy, name = "Ingrid" || enemy, name = "God Orochi" || enemy, name = "Kung Fu Man" || enemy, name = "Kung Fu Man 720"; Based Kung Fu Man. He's the reason... of everything. 
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken" 
trigger8 = enemy, var(1) = 2 || enemy, var(1) = 4
var(6) = 10
[State -2, Akuma special quote against Ryu]
type = Varset
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
var(6) = 15
[State -2, Akuma special quote against Evil Ryu]
type = Varset
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = enemy, name = "Evil Ryu" || enemy, name = "Evil Ryu Hoshi" || enemy, name = "E. Ryu" || enemy, name = "cvsryu_ex"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger3 = enemy, name = "ERyu" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil Ryu"
trigger4 = enemy, name = "Evil RyuTAG" || enemy, name = "Evil Ryu HoshiTAG" || enemy, name = "E. RyuTAG"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger6 = enemy, name = "ERyuTAG" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil RyuTAG"
var(6) = 16

[State 0, ChangeAnim (Akuma)]
type = ChangeAnim; The fuck are you doing here?
triggerall = var(1) = 1
triggerall = anim = 182
trigger1 = var(6) = [1,5]
trigger1 = animelemtime(1) = 50
trigger2 = animelemtime(1) = 40
trigger2 = var(6) = 10
trigger3 = animelemtime(1) = 50
trigger3 = var(6) = 11
trigger4 = animelemtime(1) = 170
trigger4 = var(6) = 12
trigger5 = animelemtime(1) = 100
trigger5 = var(6) = 15
trigger6 = animelemtime(1) = 10
trigger6 = var(6) = 16
value = 182
elem = 2
[State 0, ChangeAnim (Oni)]
type = ChangeAnim
triggerall = anim = 182
triggerall = var(1) = 2 
trigger1 = animelemtime(1) = 50
trigger1 = var(6) = 1
trigger2 = animelemtime(1) = 200
trigger2 = var(6) = 4
trigger3 = animelemtime(1) = 160
trigger3 = var(6) = 5
trigger4 = animelemtime(1) = 70
trigger4 = var(6) =3
trigger5 = animelemtime(1) = 250
trigger5 = var(6) =2
value = 182
elem = 2
[State 0, ChangeAnim (Shin Akuma)]
type = ChangeAnim
triggerall = anim = 182
triggerall = var(1) = 3 
trigger1 = animelemtime(1) = 160
trigger1 = var(6) = 1
trigger2 = animelemtime(1) = 160
trigger2 = var(6) = 2
trigger3 = animelemtime(1) = 160
trigger3 = var(6) = 3
trigger4 = animelemtime(1) = 40
trigger4 = var(6) = 10
trigger5 = animelemtime(1) = 50
trigger5 = var(6) = 11
trigger6 = animelemtime(1) = 170
trigger6 = var(6) = 12
trigger7 = animelemtime(1) = 100
trigger7 = var(6) = 15
trigger8 = animelemtime(1) = 10
trigger8 = var(6) = 16
value = 182
elem = 2
[State 0, ChangeAnim (Cyber Akuma)]
type = ChangeAnim
triggerall = anim = 182
trigger1 = var(1) = 4  || var(1) = 5
trigger1 = animelemtime(1) = 5
value = 182
elem = 3
;[State 0, ChangeAnim (Oni-1)]
;type = ChangeAnim
;triggerall = var(1) = 2 && var(10) = 2
;trigger1 = animelemtime(1) = 200
;value = 182
;elem = 2

[State 182, Oni quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 2
trigger1 = var(6) = 1
trigger1 = time = 1
value = 14, 10
channel = 0
volume = 255
[State 182, Oni quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 2
trigger1 = var(6) = 1
trigger1 = time = 1
value = 14, 10
channel = 2
volume = 255
[State 182, Oni quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 2
trigger1 = var(6) = [2,5]
trigger1 = time = 1
value = 14, 10 + var(6)
channel = 0
volume = 255
[State 182, Oni quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 2
trigger1 = var(6) = [2,5]
trigger1 = time = 1
value = 14, 10 + var(6)
channel = 2
volume = 255


[State 182, Cyber Akuma quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 5
trigger1 = time = 1
value = 4, 34
channel = 0
volume = 255
[State 182, Cyber Akuma quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 5
trigger1 = time = 1
value = 4, 34
channel = 2
volume = 255

[State 182, Akuma quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 1
trigger1 = time = 1
value = 4, 10
channel = 0
volume = 255
[State 182, Akuma quote 1]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 1
trigger1 = time = 1
value = 4, 10
channel = 2
volume = 255
[State 182, Akuma quote 2]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 2
trigger1 = time = 1
value = 4, 12
channel = 0
volume = 255
[State 182, Akuma quote 2]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 2
trigger1 = time = 1
value = 4, 12
channel = 2
volume = 255
[State 182, Akuma quote 3]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 3
trigger1 = time = 1
value = 4, 17
channel = 0
volume = 255
[State 182, Akuma quote 3]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 3
trigger1 = time = 1
value = 4, 17
channel = 2
volume = 255
[State 182, Akuma quote 4]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 4
trigger1 = time = 1
value = 4, 11
channel = 0
volume = 255
[State 182, Akuma quote 4]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 4
trigger1 = time = 1
value = 4, 11
channel = 2
volume = 255
[State 182, Akuma quote 5]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 5
trigger1 = time = 1
value = 4, 55
channel = 0
volume = 255
[State 182, Akuma quote 5]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1
triggerall = var(6) = 5
trigger1 = time = 1
value = 4, 55
channel = 2
volume = 255
[State 182, Shin Akuma quotes]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 3
trigger1 = time = 1
value = 4, 51 + var(6)
channel = 0
volume = 255
[State 182, Shin Akuma quotes]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 3
trigger1 = time = 1
value = 4, 51 + var(6)
channel = 2
volume = 255

[State 182, Akuma special quote against a "creature"]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 12
value = 4, 56
channel = 0
volume = 255
[State 182, Akuma special quote against a "creature"]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 12
value = 4, 56
channel = 2
volume = 255
[State 182, Akuma special quote against a machine]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 11
value = 4, 6
channel = 0
volume = 255
[State 182, Akuma special quote against a machine]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 11
value = 4, 6
channel = 2
volume = 255
[State 182, Akuma special quote against a god]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 10
value = 4, 3
channel = 0
volume = 255
[State 182, Akuma special quote against a god]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 10
value = 4, 3
channel = 2
volume = 255
[State 182, Akuma special quote against Ryu/Evil Ryu]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 15
trigger2 = var(6) = 16
value = 4, 42 + var(6)
channel = 0
volume = 255
[State 182, Akuma special quote against Ryu/Evil Ryu]
type = playsnd
triggerall = anim = 182
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 1
trigger1 = var(6) = 15
trigger2 = var(6) = 16
value = 4, 42 + var(6)
channel = 2
volume = 255
;
;[State 0, ChangeAnim]
;type = ChangeAnim
;trigger1 = !time && facing = 1
;value = 186
;[State 0, PosSet]
;type = PosSet
;triggerall = anim = 186
;trigger1 = !time
;y = -70
;
;
;
;
;[State 0, Explod]
;type = Explod
;triggerall = anim = 186
;trigger1 = !time
;anim = 189
;ID = 189
;pos = 0,-50
;postype = p1  ;p2,front,back,left,right
;facing = 1
;removetime = -1
;vfacing = 1
;scale = 1,0.5
;sprpriority = 10
;[State 0, Helper]
;type = Helper
;triggerall = anim = 186
;trigger1 = !time
;helpertype = normal ;player
;name = "Cloud"
;stateno = 189
;pos = 0,-50
;postype = p1    ;p2,front,back,left,right
;facing = 1
;size.xscale = 1
;size.yscale = 0.5
;ownpal = 1
;supermovetime = 0
;pausemovetime = 0
;
;
;
;[State 0, ScreenBound]
;type = ScreenBound
;trigger1 = anim = 186
;value = 1
;movecamera = 1,0


[State 182, Snd]
type = playsnd
triggerall = anim = 182
trigger1 = animelem = 11
value = 5, 4

[State 182, Dust]
type = explod
triggerall = anim = 182
trigger1 = animelem = 11
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
[State 182, Aura]
type = helper
triggerall = anim = 182
trigger1 = animelem = 11
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 182, Dust]
type = explod
triggerall = anim = 182
trigger1 = animelem = 11
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1

[State 182, Shake]
type = envshake
triggerall = anim = 182
trigger1 = animelemtime(11) >= 0 && animelemtime(26) < 0 && !(animelemtime(11) % 12)
time = 12
freq = 120
ampl = 4
[State 182, End]
type = changestate
triggerall = anim = 182
trigger1 = !animtime
value = 0


;========================< BOSS INTRO >=============================
[Statedef 188]
type = S
physics = N
movetype = I
ctrl = 0
sprpriority = -1

[State 191, intro]
type = assertspecial
trigger1 = 1
flag = nobardisplay

[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(1) != 4 && var(1) != 5
trigger1 = ((time = 10 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
helpertype = normal
stateno = 9200
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1

[State -2, Enemy = Anyone]
type = Varset
trigger1 = time = 9
var(10) = 0

; Initialize Morrigan's move variables - CRITICAL FIX
[State -2, Enable EX Parasite Roll]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(67) = 1

[State -2, Enable Cardinal Blade]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(68) = 1

[State -2, Enable Soul Phoenix]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(69) = 1

[State -2, Enable Finishing Shower]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(70) = 1

[State -2, Enable EX Shadow Blade]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(75) = 1

[State -2, Enable EX Vector Drain]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(77) = 1

[State -2, Enable Valkyrie Turn]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(93) = 1

[State -2, Enable Air Darkness Illusion]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(94) = 1

[State -2, Enable Eternal Slumber]
type = VarSet
trigger1 = roundno = 1 && time = 0
var(97) = 1

[State -2, Enemy = Akuma]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = (enemy, name = "Akuma" || enemy, name = "MvC-EoH Gouki" || enemy, name = "CvSGouki" || enemy, name = "svcgouki" || enemy, name = "ZXAkuma" || enemy, name = "Gouki" || enemy, name = "cvsgouki_normal" || enemy, name = "ZXAkuma") && enemy, authorname != "Mr. Ansatsuken" && enemy, authorname !="Phantom.of.the.server"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger3 = (enemy, name = "Gouki" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
trigger4 = enemy, name = "AkumaTAG" || enemy, name = "CvSGoukiTAG" || enemy, name = "Gouki" && enemy, authorname != "Mr. Ansatsuken"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
var(10) = 1

[State -2, Enemy = Shin Akuma]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Shin Akuma" || enemy, name = "Shin Gouki" || enemy, name = "cvsgouki_ex"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger3 = (enemy, name = "Gouki"  && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
trigger4 = enemy, name = "Shin AkumaTAG" || enemy, name = "Shin GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
var(10) = 2

[State -2, Enemy = Oni]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Ogre Gouki" || enemy, name = "Kuroshiki Oni" || enemy, name = "CvS_Oni"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
trigger3 = enemy, name = "Ogre" && enemy, authorname = "JUN"
trigger4 = enemy, name = "OniTAG" || enemy, name = "Oni AkumaTAG" || enemy, name = "Oni GoukiTAG" || enemy, name = "Ogre AkumaTAG" || enemy, name = "Ogre GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
var(10) = 3

[State -2, Enemy = Abel]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Abel" || enemy, name = "AbelTAG"
var(10) = 5
[State -2, Enemy = Adon]
type = Varset
triggerall = var(1) != 4 && var(1) != 5
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Adon" || enemy, name = "AdonTAG" || enemy, name = "Adon_mx"
var(10) = 6
[State -2, Enemy = Asura]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Asura" ||  enemy, name = "AsuraTAG" || enemy, name = "Asura(AW)" || enemy, name = "Asura's Wrath" || enemy, name = "Asura (Asura's Wrath)"
trigger1 = enemy, authorname != "Alexlexus" && enemy, authorname !="flowrallia" && enemy, authorname != "Dick Buckus"
var(10) = 7
[State -2, Enemy = Athena]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena"
trigger2 = enemy, name = "AthenaTAG" || enemy, name = "Goddess AthenaTAG"
var(10) = 8
[State -2, Enemy = Apocalypse]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Apocalypse" || enemy, name = "ApocalypseTAG"
var(10) = 9
[State -2, Enemy = Balrog]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Balrog" || enemy, name = "Boxer" || enemy, name = "Balrog (Boxer)" || enemy, name = "Balrog(Boxer)"
trigger2 = enemy, name = "BalrogTAG" || enemy, name = "BoxerTAG" || enemy, name = "Bison (Boxer)" || enemy, name = "M. Bison (Boxer)"
var(10) = 10
[State -2, Enemy = Blanka]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Blanka" || enemy, name = "BlankaTAG" || enemy, name = "cvsblanka" || enemy, name = "cvsblankaTAG"
var(10) = 11
[State -2, Enemy = Cammy]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Cammy" || enemy, name = "cvscammy" || enemy, name = "CammyTAG" || enemy, name = "Cammy_mx" || enemy, name = "Cammy White"
var(10) = 12
[State -2, Enemy = Choi]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Choi" || enemy, name = "Choi Bounge"
trigger2 = enemy, name = "ChoiTAG" || enemy, name = "Choi BoungeTAG"
var(10) = 13
[State -2, Enemy = Chun-Li]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Chun-Li" || enemy, name = "Chun-LiTAG" || enemy, name = "cvschunli" || enemy, name = "SF3 Chun Li" || enemy, name = "ChunLi_mx"
var(10) = 14
[State -2, Enemy = Crimson Viper]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Crimson Viper" || enemy, name = "C. Viper" || enemy, name = "C.Viper" || enemy, name = "CFJ_C.Viper"
trigger2 = enemy, name = "Crimson ViperTAG" || enemy, name = "C. ViperTAG" || enemy, name = "C.ViperTAG" || enemy, name = "CFJ_C.ViperTAG"
var(10) = 15
[State -2, Enemy = Cody]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Cody" || enemy, name = "Cody Travers" || enemy, name = "Cody_mx"
trigger2 = enemy, name = "CodyTAG" || enemy, name = "Cody TraversTAG"
var(10) = 16
[State -2, Enemy = Dan]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dan" || enemy, name = "Dan Hibiki" || enemy, name = "cvsdan" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan"
trigger2 = enemy, name = "DanTAG" || enemy, name = "Dan HibikiTAG" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: DanTAG" || enemy, name = "Dan_mx"
var(10) = 17
[State -2, Enemy = Decapre]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Decapre" || enemy, name = "Juni" || enemy, name = "Juli" || enemy, name = "CvS_Decapre" || enemy, name = "cvsjuni"
trigger2 = enemy, name = "DecapreTAG" || enemy, name = "JuniTAG" || enemy, name = "JuliTAG" || enemy, name = "CvS_DecapreTAG"
var(10) = 18
[State -2, Enemy = Dee Jay]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dee Jay" || enemy, name = "DeeJay_mx"
trigger2 = enemy, name = "Dee JayTAG"
var(10) = 19
[State -2, Enemy = Demitri]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Demitri" || enemy, name = "Demitri Maximoff" || enemy, name = "Demitri(DS)"
trigger2 = enemy, name = "DemitriTAG" || enemy, name = "Demitri MaximoffTAG" 
var(10) = 20
[State -2, Enemy = Dhalsim]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dhalsim" || enemy, name = "DhalsimTAG" || enemy, name = "cvsdhalsim"
trigger2 = enemy, name = "RajaaDhalsim"
var(10) = 21
[State -2, Enemy = Dudley]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Dudley" || enemy, name = "DudleyTAG" || enemy, name = "Dudley_mx"
var(10) = 22
[State -2, Enemy = Earthquake]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Earthquake" || enemy, name = "EarthquakeTAG"
var(10) = 23
[State -2, Enemy = E. Honda]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Edmond Honda" || enemy, name = "E. Honda" || enemy, name = "cvshonda" || enemy, name = "Honda_mx"
trigger2 = enemy, name = "Edmond HondaTAG" || enemy, name = "E. HondaTAG" || enemy, name = "cvshondaTAG"
var(10) = 24
[State -2, Enemy = El Fuerte]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "El Fuerte" || enemy, name = "ElFuerte" || enemy, name = "CFJ_ElFuerte"
trigger2 = enemy, name = "El FuerteTAG" || enemy, name = "ElFuerteTAG" || enemy, name = "CFJ_ElFuerteTAG"
var(10) = 25
[State -2, Enemy = Elena]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Elena" || enemy, name = "Elena_mx"
trigger2 = enemy, name = "ElenaTAG"
var(10) = 26
[State -2, Enemy = Fei Long]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Fei Long" || enemy, name = "FeiLong_mx"
trigger2 = enemy, name = "Fei LongTAG"
var(10) = 27
[State -2, Enemy = Geese]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Geese" || enemy, name = "Geese Howard" || enemy, name = "cvsgeese" || enemy, name = "cvsgeese_normal"
trigger2 = enemy, name = "GeeseTAG" || enemy, name = "Geese HowardTAG"
var(10) = 28
[State -2, Enemy = Gen]
type = Varset
triggerall = var(1) = 1 || var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
trigger2 = enemy, name = "GenTAG" || enemy, name = "Master GenTAG"
var(10) = 29
[State -2, Enemy = Genjyuro]
type = Varset
triggerall = var(1) = 1 || var(1) =3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Genjuro" || enemy, name = "Genjuro Kibagami"  || enemy, name = "Genjyuro"
trigger2 = enemy, name = "Genjyuro Kibagami"
trigger3 = enemy, name = "GenjuroTAG" || enemy, name = "Genjuro KibagamiTAG"  || enemy, name = "GenjyuroTAG"
trigger4 = enemy, name = "Genjyuro KibagamiTAG"
var(10) = 30
[State -2, Enemy = Goenitz]
type = Varset
triggerall = var(1) =1 || var(1) =3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Goenitz" || enemy, name = "GoenitzTAG"
var(10) = 31
[State -2, Enemy = Gouken]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken" 
trigger2 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
trigger3 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG" 
trigger4 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
var(10) = 32
[State -2, Enemy = Guile]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Guile" || enemy, name = "GuileTAG" || enemy, name = "cvsguile"
var(10) = 33
[State -2, Enemy = Guy]
type = Varset
triggerall = var(1) != 4 && var(1) != 5
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Guy" || enemy, name = "GuyTAG" || enemy, name = "cvsguy" || enemy, name = "Guy_mx"
var(10) = 34
[State -2, Enemy = Hakan]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hakan" || enemy, name = "CFJ_Hakan" 
trigger2 = enemy, name = "HakanTAG" || enemy, name = "CFJ_HakanTAG"
var(10) = 35
[State -2, Enemy = Hsien-Ko]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei"
trigger2 = enemy, name = "Hsien-KoTAG" || enemy, name = "Lei-LeiTAG"
var(10) = 36
[State -2, Enemy = Hugo]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Hugo" || enemy, name = "HugoTAG" || enemy, name = "Hugo_mx"
var(10) = 37
[State -2, Enemy = Ibuki]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ibuki" || enemy, name = "IbukiTAG" || enemy, name = "Ibuki_mx" || enemy, name = "DR_Ibuki"
var(10) = 38
[State -2, Enemy = Iori]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Iori" || enemy, name = "Iori Yagami" || enemy, name = "cvsiori" || enemy, name = "cvsiori_normal"
trigger2 = enemy, name = "IoriTAG" || enemy, name = "Iori YagamiTAG"
var(10) = 39
[State -2, Enemy = Orochi Iori]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Orochi Iori" || enemy, name = "Orochi Iori Yagami" || enemy, name = "OrochiIoriYagami" || enemy, name = "@Orochi Iori"
trigger2 = enemy, name = "OrochiIori" || enemy, name = "OrochiIori Yagami" || enemy, name = "Orochi IoriYagami" || enemy, name = "cvsiori_ex"
trigger3 = enemy, name = "Orochi IoriTAG" || enemy, name = "Orochi Iori YagamiTAG" || enemy, name = "OrochiIoriYagamiTAG"
trigger4 = enemy, name = "OrochiIoriTAG" || enemy, name = "OrochiIori YagamiTAG" || enemy, name = "Orochi IoriYagamiTAG"
trigger5 = enemy, name = "Riot of the Blood Iori" || enemy, name = "O. Iori" || enemy, name = "O.Iori" || enemy, name = "O-Iori"
var(10) = 40
[State -2, Enemy = Juri]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Juri" || enemy, name = "Juri Han" || enemy, name = "JuriHan" || enemy, name ="CFJ_JuriHan"
trigger2 = enemy, name = "JuriTAG" || enemy, name = "Juri HanTAG" || enemy, name = "JuriHanTAG" || enemy, name ="CFJ_JuriHanTAG"
var(10) = 41
[State -2, Enemy = Kasumi]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kasumi" || enemy, name = "Kasumi Todoh"
trigger2 = enemy, name = "KasumiTAG" || enemy, name = "Kasumi TodohTAG"
var(10) = 42
[State -2, Enemy = Ken]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ken" || enemy, name = "cvsken" || enemy, name = "cvsken_normal" || enemy, name = "Ken Masters" || enemy, name = "Ken SF3trd" || enemy, name = "Street Fighter 3 Ken" || enemy, name = "Master Ken" && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger2 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) != 1
trigger3 = enemy, name = "KenTAG" || enemy, name = "Ken MastersTAG" || enemy, name = "Master KenTAG" && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger4 = enemy, name = "Ken MastersTAG" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) != 1
var(10) = 43
[State -2, Enemy = Violent Ken]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Violent Ken" || enemy, name = "cvsken_ex"
trigger2 = enemy, name = "Ken" && enemy, authorname = "vyn"
trigger3 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 1
trigger4 = enemy, name = "Violent KenTAG"
trigger5 = enemy, name = "KenTAG" && enemy, authorname = "vyn"
trigger6 = enemy, name = "Ken MastersTAG" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 1
var(10) = 44
[State -2, Enemy = Kim]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kim" || enemy, name = "Kim Kaphwan" || enemy, name = "cvskim"
trigger2 = enemy, name = "KimTAG" || enemy, name = "Kim KaphwanTAG"
var(10) = 45
[State -2, Enemy = Kyo]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kyo" || enemy, name = "Kyo Kusanagi" || enemy, name = "KyoKusanagi" || enemy, name = "cvskyo" || enemy, name = "cvskyo_normal"
trigger2 = enemy, name = "KyoTAG" || enemy, name = "Kyo KusanagiTAG" || enemy, name = "KyoKusanagiTAG"
var(10) = 46
[State -2, Enemy = M. Bison]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega" 
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "VegaTAG" 
trigger5 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
var(10) = 47
[State -2, Enemy = Final Bison]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" && enemy, authorname = "Froz"
trigger6 = enemy, var(40)=1
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
var(10) = 47
[State -2, Enemy = Mai]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mai" || enemy, name = "Mai Shiranui" || enemy, name = "MaiShiranui" || enemy, name = "cvsmai"
trigger2 = enemy, name = "MaiTAG" || enemy, name = "Mai ShiranuiTAG" || enemy, name = "MaiShiranuiTAG"
var(10) = 48
[State -2, Enemy = Makoto]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Makoto" || enemy, name = "Makoto_mx" || enemy, name = "DR_Makoto"
trigger2 = enemy, name = "MakotoTAG"
var(10) = 49
[State -2, Enemy = Mars People]; Yeah, I know it's a f*cking generic character which probably isn't even in M.U.G.E.N... but still.
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mars People";  Best name ever :V
trigger2 = enemy, name = "Mars PeopleTAG"; >Implying "Mars People" has ever been made. >Implying someone will ever make a "tag" version of it.
var(10) = 50
[State -2, Enemy = Mr. Karate]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Mr. Karate" || enemy, name = "Mr.Karate" || enemy, name = "Mr Karate" || enemy, name = "MrKarate"
trigger1 = enemy, authorname != "Victorys"
trigger2 = enemy, name = "CvS2_Mr.Karate" || enemy, name = "cvs_mr_karate" || enemy, name = "svckarate"
trigger3 = enemy, name = "Mr. KarateTAG" || enemy, name = "Mr.KarateTAG" || enemy, name = "Mr KarateTAG" || enemy, name = "MrKarateTAG"
trigger4 = enemy, name = "CvS2_Mr.KarateTAG" || enemy, name = "cvs_mr_karateTAG"
trigger5 = enemy, name = "Mr.Karate" && enemy, authorname = "Victorys"
trigger5 = enemy, var(53) = 0
var(10) = 51
[State -2, Enemy = Honki Ni Natta Mr. Karate]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Honki ni Natta Mr. Karate" || enemy, name = "Shin Mr. Karate"  || enemy, name = "Serious Mr. Karate"
trigger2 = enemy, name = "Honki ni Natta Mr.Karate" ||  enemy, name = "Shin Mr.Karate"  ||  enemy, name = "Serious Mr.Karate"
trigger3 = enemy, name = "Honki ni Nata Mr Karate" ||  enemy, name = "Shin Mr Karate"  ||  enemy, name = "Serious Mr Karate"
trigger4 = enemy, name = "Honki ni Natta MrKarate" ||  enemy, name = "Shin MrKarate"  ||  enemy, name = "Serious MrKarate"
trigger5 = enemy, name = "Honki ni Natta Mr. KarateTAG" || enemy, name = "Shin Mr. KarateTAG"  || enemy, name = "Serious Mr. KarateTAG"
trigger6 = enemy, name = "Honki ni Natta Mr.KarateTAG" ||  enemy, name = "Shin Mr.KarateTAG"  ||  enemy, name = "Serious Mr.KarateTAG"
trigger7 = enemy, name = "Honki ni Natta Mr KarateTAG" ||  enemy, name = "Shin Mr KarateTAG"  ||  enemy, name = "Serious Mr KarateTAG"
trigger8 = enemy, name = "Honki ni Natta MrKarateTAG" ||  enemy, name = "Shin MrKarateTAG"  ||  enemy, name = "Serious MrKarateTAG"
trigger9 = enemy, name = "Mr.Karate" && enemy, authorname = "Victorys"
trigger9 = enemy, var(53) = 1
trigger10 = enemy, name = "Mr.KARATEIII"
var(10) = 52
[State -2, Enemy = Ogre]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ogre" || enemy, name = "True Ogre" || enemy, name = "Ancient Ogre" || enemy, name = "CvS_Ogre" && enemy, authorname !="JUN"
trigger2 = enemy, name = "OgreTAG" || enemy, name = "True OgreTAG" || enemy, name = "Ancient OgreTAG" || enemy, name = "CvS_OgreTAG"
var(10) = 53
[State -2, Enemy = Poison]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Poison" || enemy, name = "PoisonTAG"
var(10) = 54
[State -2, Enemy = Rolento]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rolento" || enemy, name = "RolentoTAG" || enemy, name = "cvsrolento" || enemy, name = "Rolento_mx"
var(10) = 55
[State -2, Enemy = Rose]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rose" || enemy, name = "RoseTAG" || enemy, name = "Rose_mx"
var(10) = 56
[State -2, Enemy = Red Arremer]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Red Arremer" || enemy, name = "RedArremer" || enemy, name = "Firebrand"
trigger2 = enemy, name = "Red ArremerTAG" || enemy, name = "RedArremerTAG" || enemy, name = "FirebrandTAG"
var(10) = 57
[State -2, Enemy = Rufus]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Rufus" || enemy, name = "RufusTAG"
var(10) = 58
[State -2, Enemy = Ryo]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ryo" || enemy, name = "Ryo Sakazaki" || enemy, name = "RyoSakazaki" || enemy, name = "cvsryo"
trigger2 = enemy, name = "RyoTAG" || enemy, name = "Ryo SakazakiTAG" || enemy, name = "RyoSakazakiTAG"
var(10) = 59
[State -2, Enemy = Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
var(10) = 60
[State -2, Enemy = Evil Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Evil Ryu" || enemy, name = "Evil Ryu Hoshi" || enemy, name = "E. Ryu" || enemy, name = "cvsryu_ex"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger3 = enemy, name = "ERyu" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil Ryu"
trigger4 = enemy, name = "Evil RyuTAG" || enemy, name = "Evil Ryu HoshiTAG" || enemy, name = "E. RyuTAG"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger6 = enemy, name = "ERyuTAG" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil RyuTAG"
var(10) = 61
[State -2, Enemy = Sagat]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sagat" || enemy, name = "SagatTAG" || enemy, name = "cvssagat" || enemy, name = "Sagat_mx"
var(10) = 62
[State -2, Enemy = Sakura]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugano" || enemy, name = "SakuraKasugano" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
trigger2 = enemy, name = "SakuraTAG" || enemy, name = "Sakura KasuganoTAG" || enemy, name = "SakuraKasuganoTAG" || enemy, name = "Sakura_mx"
var(10) = 63
[State -2, Enemy = Sean]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Sean" || enemy, name = "Sean Matsuda" || enemy, name = "Sean_mx"
var(10) = 64
[State -2, Enemy = Seth]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Seth" || enemy, name = "SethTAG" || enemy, name = "SF4Seth"
var(10) = 65
[State -2, Enemy = Shiki]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Shiki" || enemy, name = "ShikiTAG"
var(10) = 66
[State -2, Enemy = Terry]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Terry" || enemy, name = "Terry Bogard" || enemy, name = "TerryBogard" || enemy, name = "cvsterry"
trigger2 = enemy, name = "TerryTAG" || enemy, name = "Terry BogardTAG" || enemy, name = "TerryBogardTAG"
var(10) = 67
[State -2, Enemy = Tessa]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Tessa" || enemy, name = "TessaTAG"
trigger2 = enemy, name = "Tessa (Tabasa)" || enemy, name = "Tabasa" || enemy, name = "Tabasa (Tessa)"
var(10) = 68
[State -2, Enemy = T. Hawk]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "T. Hawk" || enemy, name = "T.Hawk" || enemy, name = "Thunder Hawk"
trigger2 = enemy, name = "T Hawk" || enemy, name = "ThunderHawk" || enemy, name = "THawk" || enemy, name = "T.Hawk_mx"
var(10) = 69
[State -2, Enemy = Vega]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Vega" || enemy, name = "Claw" || enemy, name = "Balrog_mx" || enemy, name = "Vega(Claw)" || enemy, name = "Vega (Claw)" || enemy, name = "Balrog(Claw)" || enemy, name = "Balrog (Claw)"
trigger1 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
trigger2 = enemy, name = "VegaTAG" || enemy, name = "ClawTAG"
trigger2 = enemy, authorname != "Phantom.of.the.Server" && enemy, authorname != "Froz"
var(10) = 70
[State -2, Enemy = Yang]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Yang" || enemy, name = "Yang_mx"
trigger2 = enemy, name = "YangTAG"
var(10) = 71
[State -2, Enemy = Yun]
type = Varset
triggerall = var(1) =2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Yun" || enemy, name = "cvsyun"
trigger2 = enemy, name = "YunTAG" || enemy, name = "Yun_mx"
var(10) = 72
[State -2, Enemy = Zangief]
type = Varset
triggerall = var(1) = 2
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger2 = enemy, name = "ZangiefTAG"
var(10) = 73
[State -2, Enemy = Zero]
type = Varset
triggerall = var(1) = 1|| var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Zero"
trigger2 = enemy, name = "ZeroTAG"
var(10) = 74
[State -2, Enemy = Chuchoryu]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Chuchoryu" || enemy, name = "ChuchoryuTAG"
var(10) = 75
[State -2, Enemy = Ghost Rider]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ghost Rider" || enemy, name = "Ghost RiderTAG" || enemy, name = "DCvsMGhostRider"
var(10) = 77
;[State -2, Enemy = Arthur]
;type = Varset
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Arthur" || enemy, name = "ArthurTAG"
;var(10) = 78
;[State -2, Enemy = Iron Fist]
;type = Varset
;triggerall = var(1) = 1 || var(1) = 3
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Iron Fist" || enemy, name = "Ironfist"
;trigger2 = enemy, name = "Iron FistTAG" || enemy, name = "IronfistTAG"
;var(10) = 79
;[State -2, Enemy = Phoenix]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Phoenix" || enemy, name = "Jean Grey" || enemy, name = "JeanGrey" || enemy, name = "Phoenix (Jean Grey)"
;trigger2 = enemy, name = "PhoenixTAG" || enemy, name = "Jean GreyTAG" || enemy, name = "JeanGreyTAG"
;var(10) = 80
;[State -2, Enemy = Sentinel]
;type = Varset
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Sentinel" || enemy, name = "SentinelTAG"
;var(10) = 81
;[State -2, Enemy = Taskmaster]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Taskmaster" || enemy, name = "TaskmasterTAG"
;var(10) = 82
;[State -2, Enemy = Tron Bonne]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Tron Bonne" || enemy, name = "TronBonne"
;trigger2 =enemy, name = "Tron BonneTAG" || enemy, name = "TronBonneTAG"
;var(10) = 83
;[State -2, Enemy = Galactus]
;type = Varset
;triggerall = var(1) != 4 && var(1) !=5
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "Galactus" || enemy, name = "GalactusTAG"
;var(10) = 84
[State -2, Enemy = Oro]
type = Varset
triggerall = var(1) = 1 || var(1) = 3
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Oro" || enemy, name = "SFIII_Oro" || enemy, name = "DR_Oro" || enemy, name = "Oro_mx"
var(10) = 85
;[State -2, Enemy = Rugal]
;type = Varset
;triggerall = var(1) = 1
;triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
;trigger1 = enemy, name = "cvsrugal" || enemy, name = "Rugal" || enemy, name = "rugal94" || enemy, name = "svcrugal" || enemy, name = "cvsrugal_normal"
;var(10) = 86
[State -2, Enemy = KFM/Others]
type = Varset
triggerall = var(1) = 1
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Kung Fu Man" || enemy, name = "Phantom.of.the.Server" || enemy, name = "Reu" || enemy, name = "Reuben Kee" || enemy, name = "Jmorphman"
trigger2 = enemy, name = "Divine Wolf" ; || enemy, name = "Anyone who I forgot to put here or... I was just lazy, gimme a break, hehh heh-"
var(10) = 88
[State -2, Enemy = BANE?]
type = Varset
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Bane" || enemy, name = "Bane edit"
var(10) = 89

;[State 0, ChangeState]
;type = Changeanim
;trigger1 = !time && var(1)=2
;value = 187
[State 0, ChangeState]
type = Changeanim
trigger1 = !time && var(1)=3; && var(1)=3
value = 188;ifelse(random<500,183 + ifelse(var(55)=1,10000,0),188)
[State 0, ChangeState]
type = Changeanim
trigger1 = !time && var(1)=1; && var(1)=3
value = 183;ifelse(random<500,183 + ifelse(var(55)=1,10000,0),188)
[State 0, ChangeState]
type = Changeanim
trigger1 = !time && var(1)=5; && var(1)=3
value = 183 + ifelse(var(55)=1,10000,0)
[State 0, ChangeState]
type = Changeanim
trigger1 = !time && var(1)=2; && var(1)=3
value = 187;ifelse(random<500, 187, ifelse(random<500,183 + ifelse(var(55)=1,10000,0),188))
[State 0, ChangeState]
type = Changeanim
trigger1 = !time && var(1)=4; && var(1)=3
value = ifelse(random<500, 187, ifelse(random<500,183 + ifelse(var(55)=1,10000,0),188))


[State 0, You expected M. Bison? Too bad...]
type = Changeanim
triggerall = var(1) != 5
triggerall = !time; && var(1)=3
trigger1 = StageVar(info.name) = "Secret Point 48106-A"
trigger2 = StageVar(info.name) = "Secret Point 48106-B"
trigger3 = StageVar(info.name) = "Secret Point 48106-C"
trigger4 = StageVar(info.name) = "Secret Point 48106"
trigger5 = StageVar(info.name) = "Onboard the VTOL"
trigger6 = StageVar(info.name) = "Venezuela"
trigger7 = StageVar(info.name) = "Bison's SFA stage"
trigger8 = StageVar(info.name) = "M. Bison's Stage"
trigger9 = StageVar(info.name) = "M. Bison Stage"
trigger10 = StageVar(info.name) = "M.Bison's Stage"
trigger11 = StageVar(info.name) = "M.Bison Stage"
trigger12 = stagevar(info.name) = "SFA3 Bison"
value = 183 + ifelse(var(55)=1,10000,0)

[State 0, You expected Gill? Too bad... It's RAPE TIME!!]
type = Changeanim
triggerall = var(1) != 5
triggerall = !time; && var(1)=3
trigger1 = StageVar(info.name) = "Hidden Shrine"
trigger2 = StageVar(info.name) = "Gill-Eclipse"
trigger3 = StageVar(info.name) = "Unknown - Gill"
trigger4 = StageVar(info.name) = "Unknown - Gill "
trigger5 = StageVar(info.name) = "Gill Stage"
trigger6 = StageVar(info.name) = "Gill's Stage"
trigger7 = StageVar(info.name) = "Gill's SFII Stage"
value = 188
 
[State 0, M. Bison exists]
type = Changeanim
triggerall = !time; || var(1)=3
triggerall= var(1) != 5
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison" || enemy, name = "True Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex" || enemy, name = "MBison"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison" || enemy, name = "Shin Bison"
trigger6 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger7 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger8 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger9 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison" || enemy, name = "Final Bison"
trigger10 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger11 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger12 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger13 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger14 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger15 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger16 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger17 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger18 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
trigger19 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger20 = enemy, name = "Vega" || enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
value = ifelse(StageVar(info.name) = "Hidden Shrine" || StageVar(info.name) = "Gill-Eclipse" || StageVar(info.name) = "Unknown - Gill" || StageVar(info.name) = "Unknown - Gill " || StageVar(info.name) = "Gill's Stage" || StageVar(info.name) = "Gill Stage" || StageVar(info.name) = "Gill's SFIII Stage",188,ifelse((var(1) = 4) && random<500, 187,ifelse(var(1)=2,187,188)))

[State 0, Gill exists]
type = Changeanim
triggerall = !time; || var(1)=3
triggerall= var(1) != 5
trigger1= enemy, name = "Gill" || enemy, name = "Gill_mx"
value = 183





;[State 0, ChangeState]
;type = Changeanim
;trigger1 = !time && var(1)=4
;value = ifelse(random>500,188,187)

;[State 0, Explod]
;type = Explod
;triggerall = anim = 187
;trigger1 = time = 180
;anim = 15199
;ID = 15199
;pos = -135,-66
;postype = p1  ;p2,front,back,left,right
;removetime = -2
;scale = 0.5,0.5
;sprpriority = -8
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 187 && time = 180
;value = S5,28
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 187 && time = 180
;value = S5,28
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 187 && time = 180
;value = S13,7
;channel = 0
;[State 0, PlaySnd]
;type = PlaySnd
;trigger1 = anim = 187 && time = 180
;value = S13,7
;channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 187 && animelemtime(7)=0
value = S14,11
channel = 0
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 187 && animelemtime(7)=0
value = S14,11
channel = 2
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 187 && animelemtime(2)=0
value = S5,40
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 187 && animelemtime(2)=0
value = S5,40
[State 0, PlaySnd]
type = PlaySnd
trigger1 = anim = 187 && animelemtime(2)=0
value = S5,57

[State 191, Intro]
type = AssertSpecial
trigger1 = anim = 187 && animelemtime(2)<=0
flag = nomusic

[State 191, Intro]
type = AssertSpecial
trigger1 = anim = 183
trigger2 = anim = 4001 + ifelse(var(55)=1,10000,0) && animelemtime(35)<0
flag = nomusic


[State 5900, Shin Akuma Intro quote]
type = Varset
;triggerall = var(1) = 3 || var(1) = 4
trigger1 = !time
;var(6) = 1 + (random % 3)
var(6) = ifelse(random<500, 1, 2)

[State 0, StateTypeSet]
type = StateTypeSet
trigger1 = var(1) = 3
statetype = A

[State 1030, explod]
type = explod
trigger1 = anim = 187
trigger1 = animelem = 2
anim = 4208
ID = 4404
postype = p1
ownpal = 1
scale = 0.5, 0.5
persistent = 0
ignorehitpause = 1

[State 0, PlaySnd]
type = PlaySnd
triggerall = anim = 187
trigger1 = time = 255
trigger2 = time = 265
trigger3 = time = 270
value = S5,40

[State 1030, explod]
type = explod
triggerall = anim = 187
trigger1 = time = 260
anim = 4218
ID = 4404
postype = p1
ownpal = 1
pos = -60,20
scale = 0.333, 0.333
persistent = 0
ignorehitpause = 1
[State 1030, explod]
type = explod
triggerall = anim = 187
trigger1 = time = 275
anim = 4218
ID = 4404
postype = p1
ownpal = 1
pos = -30,20
scale = 0.333, 0.333
persistent = 0
ignorehitpause = 1
[State 1030, explod]
type = explod
trigger1 = anim = 187
trigger1 = time = 270
anim = 4218
ID = 4404
postype = p1
pos = 60,20
ownpal = 1
facing = -1
scale = 0.333, 0.333
persistent = 0
ignorehitpause = 1

[State 191, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 188, Apocalypse]
type = helper
;trigger1 = var(1) = 5
triggerall = anim = 183 + ifelse(var(55)=1,10000,0)
triggerall = var(1) = 5
trigger1 = !time
helpertype = normal
stateno = 15180
ID = 15180
name = "Apocalypse"
postype = p1
pos = 0, 0
;pos = 15, -ceil(pos y)
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 188, M. Bison]
type = helper
;trigger1 = var(1) = 1
triggerall = anim = 183 + ifelse(var(55)=1,10000,0)
triggerall = var(1) != 5
trigger1 = !time
helpertype = normal
stateno = ifelse(random<500, 15187, 15186)
ID = 15180
name = "Vega"
postype = p1
size.shadowoffset = 0
pos = 0, 0
;pos = 15, -ceil(pos y)
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 188, M. Bison/Apocalypse]
type = helper
;trigger1 = var(1) = 1
triggerall = anim = 183 && var(1) = 4
trigger1 = !time
helpertype = normal
stateno = ifelse(random<500, 15187, 15186)
ID = 15180
name = "Vega"
postype = p1
size.shadowoffset = 6
pos = 0, 0
;pos = 15, -ceil(pos y)
size.xscale = 1
size.yscale = 1
ownpal = 1
;[State 188, Final Bison]
;type = helper
;triggerall = anim = 187
;trigger1 = !time
;helpertype = normal
;stateno = 15183
;ID = 15180
;name = "Vega"
;postype = p1
;pos = 0, 0
;;pos = 15, -ceil(pos y)
;size.xscale = 1
;size.yscale = 1
;ownpal = 1
[State 188, Gill]
type = helper
trigger1 = anim = 188
trigger1 = !time
helpertype = normal
stateno = 15182
ID = 15180
name = "Gill"
postype = p1
pos = 0, 0
size.shadowoffset = 0
size.xScale = 0.83333
size.yScale = 0.96754
;pos = 15, -ceil(pos y)
ownpal = 1

[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = anim = 188 && animelemtime(2)<0
id = 8913
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = anim = 188 && animelemtime(2)<0
id = 8912


[State 0, VarSet]
type = VarSet
trigger1 = !time && anim = 183 + ifelse(var(55)=1,10000,0)
var(42) = pos x
;[State 0, VarSet]	
;type = VarSet
;trigger1 = !time && anim = 187
;var(43) = pos y
[State 0, PosSet]
type = changeanim
triggerall = anim = 183 + ifelse(var(55)=1,10000,0)
triggerall = time>150
trigger1 = pos x -40<= var(42)
trigger1 = facing = 1
trigger2 = pos x +40>= var(42)
trigger2 = facing = -1
value = 4001 + ifelse(var(55)=1,10000,0)
;y = var(43)
;y = var(43)
[State 0, PosSet]
type = PosSet
triggerall = time>150
triggerall = anim = 4001 + ifelse(var(55)=1,10000,0)
trigger1 = pos x -40<= var(42)
trigger1 = facing = 1
trigger2 = pos x +40>= var(42)
trigger2 = facing = -1
x = var(42)
[State 0, PosSet]
type = Posadd
trigger1 = anim = 183 + ifelse(var(55)=1,10000,0)
trigger1 = !time
x = 300
;y = var(43)
[State 0, PosSet]
type = velset
trigger1 = anim = 183 + ifelse(var(55)=1,10000,0)
trigger1 = time >= 170
x = -16 
;y = var(43)
[State 0, PosSet]
type = velset
trigger1 = anim = 4001 + ifelse(var(55)=1,10000,0)
x = 0
;y = var(43)
;
;[State -3, Lv5 Shadows]
;type = afterimage
;trigger1 = anim = 183 && !time
;time = 230
;timegap = 1
;framegap = 1
;length = 12
;palbright = 75, 75, 75
;paladd = 0, 0, 0
;palmul = 0.75, 0.75, 0.75
;palcontrast = 160, 32, 32
;palpostbright = 0, 0, 0
;trans = add1

[State 182, Dust]
type = explod
triggerall = anim = 187
trigger1 = animelem = 13
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
pos = -34, 0
ownpal = 1
[State 182, Aura]
type = helper
triggerall = anim = 187
trigger1 = animelem = 13
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
[State 182, Dust]
type = explod
triggerall = anim = 187
trigger1 = animelem = 13
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = -34, 0
scale = 0.75, 0.75
ownpal = 1

[State 188, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 188, Pos]
type = screenbound
trigger1 = anim = 188
trigger1 = animelemtime(5) < 0
value = 0
movecamera = 1, 0
[State 188, Pos]
type = screenbound
trigger1 = anim = 187
trigger1 = animelemtime(2)<0
value = 0
movecamera = 0, 0
[State 188, Pos]
type = screenbound
trigger1 = anim = 183 + ifelse(var(55)=1,10000,0)
value = 0
movecamera = 0, 0
[State 188, palfx]
type = palfx
trigger1 = anim = 188
trigger1 = animelemtime(2) < 0
add = -255, -255, -255
time = 1
[State 188, palfx]
type = palfx
trigger1 = anim = 188
trigger1 = animelem = 2
add = -255, -255, -255
sinadd = 255, 255, 255, 28
time = 7
[State 188, Pos]
type = posadd
trigger1 = anim = 188
trigger1 = !time
y = -240
[State 188, Vel]
type = velset
trigger1 = anim = 188
trigger1 = animelem = 2
y = 20
[State 188, Accel]
type = gravity
trigger1 = anim = 188
trigger1 = animelemtime(2) > 0
[State 188, Anim]
type = changeanim
trigger1 = anim = 188
trigger1 = time && animelemtime(5) < 0 && pos y >= -5
value = 188
elem = 5
persistent = 0
[State 188, Stop]
type = posset
trigger1 = anim = 188
trigger1 = animelemtime(5) >= 0
y = 0
[State 188, Stop]
type = velset
trigger1 = anim = 188
trigger1 = animelemtime(5) >= 0
y = 0


[State 1030, Aura]
type = helper
trigger1 = anim = 188
trigger1 = animelem = 16
helpertype = normal
stateno = 6000
ID = 6000
postype = p1
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 1030, Aura]
type = playsnd
trigger1 = anim = 188
trigger1 = animelem = 16
Value = 5, 12
channel = 7
loop = 1
ignorehitpause = 1
[State 1030, Aura]
type = stopsnd
trigger1 = anim = 188
trigger1 = animelem = 34
persistent = 1
channel = 7
ignorehitpause = 1

[State 1030, Kanji]
type = helper
trigger1 = anim = 188
trigger1 = animelem = 16
trigger2 = anim = 187
trigger2 = animelem = 13
helpertype = normal
stateno = 6002
ID = 6002
postype = p1
pos = -5, -100
facing = ifelse(facing = 1, 1, -1)
ownpal = 1
persistent = 0
ignorehitpause = 1


[State 195, Shake]
type = envshake
trigger1 = anim = 188
trigger1 = animelemtime(16) >= 0 && animelemtime(34) <= 0
trigger1 = !(time % 5)
time = 5
freq = 120
ampl = 7 -ceil(animelemtime(16) * 0.05)

[State 195, Shake]
type = envshake
trigger1 = anim = 187
trigger1 = animelemtime(13) >= 0 && animelemtime(36) <= 0
trigger1 = !(time % 5)
time = 5
freq = 120
ampl = 7 -ceil(animelemtime(13) * 0.05)

[State 195, Shake]
type = envshake
trigger1 = anim = 187
trigger1 = animelem = 2
time = 10
freq = 120
ampl = 12

[State 4100, fire]
type = explod
trigger1 = anim = 188
trigger1 = animelemtime(5)=0
vel = 0, 0
anim = 4105
sprpriority = 7
postype = p1
scale = 0.5, 0.5
pos = -4, 0
ownpal = 1

[State 0, Helper]
type = Helper
trigger1 = anim = 188
trigger1 = animelemtime(8)=40
helpertype = normal ;player
name = "Lighting"
stateno = 7006
pos = -4,5
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
size.xscale = 0.5
size.yscale = 0.5
supermovetime = 0
pausemovetime = -1
[State 0, Helper]
type = Helper
trigger1 = anim = 188
trigger1 = animelemtime(8)=40
helpertype = normal ;player
name = "Lighting"
stateno = 7007
pos = -4,5
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
size.xscale = 0.75
size.yscale = 0.75
supermovetime = 0
pausemovetime = -1
[State 0, Helper]
type = Helper
trigger1 = anim = 188
trigger1 = animelemtime(8)=40
helpertype = normal ;player
name = "Fire"
stateno = 4409
pos = -24,-15
postype = p1    ;p2,front,back,left,right
facing = 1
ownpal = 1
size.xscale = 0.25
size.yscale = 0.25
supermovetime = 0
pausemovetime = -1
[State 0, Helper]
type = Helper
trigger1 = anim = 188
trigger1 = animelemtime(8)=40
helpertype = normal ;player
name = "Fire"
stateno = 4409
pos = 16,-15
postype = p1    ;p2,front,back,left,right
facing = -1
ownpal = 1
size.xscale = 0.25
size.yscale = 0.25
supermovetime = 0
pausemovetime = -1



[State 188, Shake]
type = envshake
trigger1 = anim = 188
trigger1 = animelem = 5
time = 30
ampl = 12
freq = 120
;[State 188, Snd]
;type = playsnd
;trigger1 = var(1) = 3
;trigger1 = animelem = 5
;value = 5, 10
;[State 188, Snd]
;type = playsnd
;trigger1 = var(1) = 3
;trigger1 = animelem = 5
;value = 5, 61
;channel = 5
[State 188, Snd]
type = playsnd
trigger1 = anim = 188
trigger1 = animelem = 5
value = 5, 61
channel = 3
[State 188, Snd]
type = playsnd
trigger1 = anim = 183 + ifelse(var(55)=1,10000,0)
trigger1 = animelemtime(1)=165
value = 5, 6
[State 182, Aura]
type = helper
trigger1 = anim = 183 + ifelse(var(55)=1,10000,0)
trigger1 = animelemtime(1)=165
helpertype = normal
stateno = 6000
ID = 6000
facing = -1
size.xscale = 0.4
size.yscale = 0.5
postype = p1
ownpal = 1
persistent = 0
[State 188, Snd]
type = playsnd
trigger1 = anim = 188
trigger1 = animelemtime(5) = 20
;value = 4, 52 + var(6)
value = 4 + ifelse(var(1)=2 || var(1) = 4, 10,0), 54 - ifelse(var(1)=2 || var(1) = 4, 41,0)
channel = 0
[State 188, Snd]
type = playsnd
trigger1 = anim = 188
trigger1 = animelemtime(5) = 20
;value = 4, 52 + var(6)
value = 4 + ifelse(var(1)=2 || var(1) = 4, 10,0), 54 - ifelse(var(1)=2 || var(1) = 4, 41,0)
channel = 2
[State 188, Snd]
type = playsnd
trigger1 = var(1) = 2 || var(1) = 4
trigger1 = anim = 188
trigger1 = animelemtime(5) = 20
;value = 4, 52 + var(6)
value = 4 + ifelse(var(1)=2 || var(1) = 4, 10,0), 54 - ifelse(var(1)=2 || var(1) = 4, 41,0)
[State 188, Dust]
type = explod
trigger1 = anim = 188
trigger1 = animelem = 5
anim = 7100
ID = 7100
sprpriority = 2
postype = p1
ownpal = 1
[State 188, Dust]
type = explod
trigger1 = anim = 188
trigger1 = animelem = 5
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
scale = 0.75, 0.75
ownpal = 1
;[State 188, Snd]
;type = playsnd
;trigger1 = anim = 188
;trigger1 = animelem = 3
;value = 4, 10
;channel = 0
[State 188, End]
type = changestate
trigger1 = anim = 188
trigger1 = !animtime
value = 0
[State 188, End]
type = changestate
trigger1 = anim = 187
trigger1 = !animtime
value = 0










[State 4004, pos]
type = posset
triggerall = anim = 4001 || anim = 14001
trigger1 = !time
y = 0

[State 4001, throw]
type = targetstate
triggerall = anim = 4001 || anim = 14001
trigger1 = !time
value = 1114002
[State 4001, throw]
type = targetfacing
triggerall = anim = 4001 || anim = 14001
trigger1 = !time
value = -1

[State 4001, grabsound]
type = playsnd
triggerall = anim = 4001 || anim = 14001
trigger1 = !time
value = 0, 800
[State 4001, Snd]
type = playsnd
triggerall = anim = 4001 || anim = 14001
trigger1 = !time
value = 5, 8
;[State 4701, vsothers]
;type = varset
;trigger1 = !time
;var(30) = 345
;

;NEED TO FINISH
;[State 4001, Pause]
;type = pause
;triggerall = anim = 4001 || anim = 14001
;trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
;time = 2
;movetime = 2
[State 4001, Push]
type = playerpush
trigger1 = anim = 4001 || anim = 14001
value = 0
[State 4001, nothitby]
type = sprpriority
trigger1= anim = 4001 || anim = 14001
value = -5
[State 4001, imageoff]
type = afterimagetime
triggerall = anim = 4001 || anim = 14001
trigger1 = animelemtime(5) > 0
time = 0


[State 4001, black]
type = envcolor
triggerall = anim = 4001 || anim = 14001
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 4
value = 0, 0, 0

[State 4001, Assert]
type = assertspecial
triggerall = anim = 4001 || anim = 14001
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG
[State 4001, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0
;
;[State 4001, hitadd]
;type = hitadd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 1
;trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
;trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
;value = 15
;
;[State 4001, hitadd]
;type = hitadd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 3 || var(1) = 4
;trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
;trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
;value = 33
;
;[State 4001, hitadd]
;type = hitadd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 5
;trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
;trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
;value = 24
;
;[State 4001, hitadd]
;type = hitadd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 2
;trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
;trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
;value = 27

[State 4001, HitSound]
type = playsnd
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 17
value = 2, ifelse(!var(30), 0, ifelse((animelem = 15), 10, 10))
channel = 2

[State 4001, Sparks]
type = helper
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
sprPriority = 5
posType = p1
pos = 0, const(size.mid.pos.y)
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300

[State 4001, Shake]
type = envshake
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
time = 6
freq = 120
ampl = -4

[State 183, Kanji]
type = helper
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 35
helpertype = normal
stateno = 6012
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, -8)
ownpal = 1
size.xscale = 0.25
size.yscale = 0.25
persistent = 0
pausemovetime = 99
supermovetime = 99


[State 183, Kanji]
type = helper
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 35
helpertype = normal
stateno = 6013
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, -8)
ownpal = 1
size.xscale = 0.25
size.yscale = 0.25
persistent = 0
pausemovetime = 99
supermovetime = 99

[State 183, Kanji]
type = helper
triggerall = enemy, authorname != "Mr.Ansatsuken" || enemy, name != "Akuma" || enemy, anim != 4001
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 35
helpertype = normal
stateno = 7610
ID = 7610
postype = left
ownpal = 1
persistent = 0
[State 183, Kanji]
type = helper
triggerall = facing = 1
triggerall = enemy, authorname = "Mr.Ansatsuken" && enemy, anim = 4001
triggerall = enemy, name = "Akuma"
triggerall = anim = 4001 || anim = 14001
trigger1 = animelem = 35
helpertype = normal
stateno = 7610
ID = 7610
postype = left
ownpal = 1
persistent = 0
;
;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 1
;trigger1 = animelemtime(14) = 10
;value = 4, 1
;channel = 0
;volume = 255


;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 1
;trigger1 = animelemtime(14) = 10
;value = 4, 1
;channel = 2
;volume = 255

;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 3
;trigger1 = animelemtime(14) = 10
;value = 4, 65
;channel = 0
;volume = 255


;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 3
;trigger1 = animelemtime(14) = 10
;value = 4, 65
;channel = 2
;volume = 255

;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 2 || var(1) = 4
;trigger1 = animelemtime(14) = 10
;value = 14, 9
;channel = 0
;volume = 255

;[State 4001, Snd]
;type = playsnd
;triggerall = anim = 4001 || anim = 14001
;triggerall = var(1) = 2 || var(1) = 4
;trigger1 = animelemtime(14) = 10
;value = 14, 9
;channel = 2
;volume = 255

;[State 4001, End]
;type = changestate
;trigger1 = animelemtime(16) >= 0 
;;trigger1 = animelemtime(16) <= 5
;trigger1 = winko
;value = 183

[State 4001, End]
type = changestate
triggerall = anim = 4001 || anim = 14001
trigger1 = !animtime
value = 0


;======================< INTRO vs EVIL RYU / EVIL KEN >=======================
[Statedef 360]
type = S
physics = N
anim = 4000
sprpriority = 0
[State 368, intro]
type = assertspecial
trigger1 = 1
flag = intro
[State 368, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 368, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1




[State 4000, Snd]
type = playsnd
trigger1 = !time
value = 7, 11
channel = 5
volume = 255



[State 4000, Snd]
type = playsnd
trigger1 = time = 1
value = 5, 6
channel = 8
volume = 255





[State 4000, ECreset]
type = palfx
trigger1 = !time
trigger1 = !(var(20) := 0)
time = 1


[State 195, DIALOGUE]
type = helper
triggerall = var(22) = 1
triggerall = var(1) != 4 && var(1) != 5
trigger1 = ((time = 10 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns) && gametime
helpertype = normal
stateno = 9200
ID = 9200
postype = p1
pos = -20, -20
size.xscale = 1
size.yscale = 1
ownpal = 0
persistent = 0
ignorehitpause = 1
[State -2, Enemy = Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
var(10) = 60
[State -2, Enemy = Evil Ryu]
type = Varset
triggerall = var(1) != 5 && var(1) != 4
triggerall= ((time = 9 && !roundsexisted) && !(teammode = simul)) && !(teammode = turns) && !(enemy, teammode = turns)
trigger1 = enemy, name = "Evil Ryu" || enemy, name = "Evil Ryu Hoshi" || enemy, name = "E. Ryu" || enemy, name = "cvsryu_ex"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger3 = enemy, name = "ERyu" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil Ryu"
trigger4 = enemy, name = "Evil RyuTAG" || enemy, name = "Evil Ryu HoshiTAG" || enemy, name = "E. RyuTAG"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger6 = enemy, name = "ERyuTAG" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil RyuTAG"
var(10) = 61
[State 4000, Aura]
type = helper
trigger1 = anim = 4000 && animelem = 1
helpertype = normal
stateno = 6001
ID = 6001
name = "Aura"
postype = p1
size.xscale = 0.5
size.yscale = 0.5
ownpal = 1
persistent = 0
supermovetime = 9999


[State 368, Vel]
type = posset
trigger1 = !time
x = -246 * facing
[State 4000, Vel]
type = velset
trigger1 = 1
x = 16
[State 368, Anim]
type = changestate
trigger1 = time = 11
value = 4075



[Statedef 4075]
type = S
physics = N
movetype = A
anim = 4009
ctrl = 0
velset = 0, 0
sprpriority = 1

[State 4009, throw]
type = targetstate
trigger1 = !time
value = 1114002
[State 4009, throw]
type = targetfacing
trigger1 = !time
value = -1

[State 368, intro]
type = assertspecial
trigger1 = 1
flag = intro

[State 4009, grabsound]
type = playsnd
trigger1 = !time
value = 0, 800
[State 4009, grabsound]
type = stopsnd
trigger1 = 1
channel = 0
[State 4009, Snd]
type = playsnd
trigger1 = !time
value = 5, 19

[State 4009, Pause]
type = pause
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 2
movetime = 2
[State 4009, Push]
type = playerpush
trigger1 = 1
value = 0
[State 4009, nothitby]
type = nothitby
trigger1 = animelemtime(35) < 0
value = SCA
time = 1
[State 4009, imageoff]
type = afterimagetime
trigger1 = animelemtime(5) > 0
time = 0


[State 4009, black]
type = envcolor
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
time = 4
value = 0, 0, 0

[State 4009, Assert]
type = assertspecial
trigger1 = animelemtime(2) >= 0 && animelemtime(35) < 0
flag = nobardisplay
flag2 = noFG
[State 4009, spr]
type = sprpriority
trigger1 = animelemtime(35) >= 0
value = 1
[State 4009, Bind]
type = targetbind
trigger1 = animelemtime(35) < 0
pos = 45, 0

[State 4009, hitadd]
type = hitadd
triggerall = var(1) = 2
triggerall = var(30) > 0
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 16
value = 1




[State 4009, hitdamage]
type = targetlifeadd
triggerall = var(1) = 2
triggerall = numtarget
trigger1 = animelem = 15
value = -600
;-ceil(ifelse((var(30) = 456), (target, lifemax * 0.8), (target, lifemax * 0.6)) / 33)
kill = animelem = 15
absolute = 1




[State 4009, givepower]
type = targetpoweradd
triggerall = var(1) = 2
triggerall = numtarget
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
value = 36


[State 4009, HitSound]
type = playsnd
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
value = 2, 10
channel = 1

[State 4001, Sparks]
type = helper
trigger1 = animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15 || animelem = 17
helperType = Normal
stateNo = 8015
ID = 8000
name = "Spark"
sprPriority = 5
posType = p1
pos = -25+(random%100), -100+(random%100)
ownPal = 1
onTop = 1
pauseMoveTime = 300
superMoveTime = 300

[State 4009, Shake]
type = envshake
triggerall = var(1) = 2
trigger1 = animelem = 1 || animelem = 2 || animelem = 3 || animelem = 4 || animelem = 5 || animelem = 6 || animelem = 7 || animelem = 8
trigger2 = animelem = 9 || animelem = 10 || animelem = 11 || animelem = 12 || animelem = 13 || animelem = 14 || animelem = 15
time = 6
freq = 120
ampl = -4


[State 183, Kanji]
type = helper
trigger1 = animelem = 35
helpertype = normal
stateno = 7617
ID = 7610
postype = left
ownpal = 1
persistent = 0

[State 4009, throw]
type = targetstate
trigger1 = animelemtime(34) >= 0 && numtarget
value = 1114003
persistent = 0

[State 4009, interrupt]
type = changestate
triggerall = animelemtime(2) > 0 && animelemtime(35) < 0
trigger1 = !var(30) && numtarget
trigger2 = target, stateno = 1114010
value = 4009


[State 4009, End]
type = changestate
trigger1 = !animtime
value = 0



;======================< TURNS INTRO >=======================
[Statedef 358]
type = S
physics = N
anim = 181
sprpriority = 0
facep2 = 1
[State 368, intro]
type = assertspecial
trigger1 = prevstateno = 191
flag = intro



;======<Version change>=====

[State 256, Countdown]
type = VarAdd
trigger1 = numhelper(8990)
trigger1 =1 
fvar(30)=-1

[State 256, Countdown]
type = Varset
trigger1 = numhelper(8990)
trigger1=command="fwd" || command="back"
fvar(30)=3

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,32,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,11,32)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,11,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 32
fvar(3) =100 + ifelse(facing=1,37,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,37,32)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 5
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,32,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,28)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,28,35)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,34,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,34)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,28,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 34
fvar(3) =100 + ifelse(facing=1,35,28)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,37,34)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 2
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 28
fvar(3) =100 + ifelse(facing=1,34,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,1)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,1,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,1,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,9,1)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,2,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,14,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,9,15)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 14
fvar(3) =100 + ifelse(facing=1,15,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,22,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,17,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,17)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,22,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 23
fvar(3) =100 + ifelse(facing=1,26,22)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,23,33)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,33,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,26,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 33
fvar(3) =100 + ifelse(facing=1,35,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,33,36)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,36,33)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,36,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 3
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,36)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,37,2)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 0
fvar(3) =100 + ifelse(facing=1,2,37)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,0,4)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 2
fvar(3) =100 + ifelse(facing=1,4,0)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,2,5)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 4
fvar(3) =100 + ifelse(facing=1,5,2)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,4,8)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 5
fvar(3) =100 + ifelse(facing=1,8,4)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,5,9)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 8
fvar(3) =100 + ifelse(facing=1,9,5)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,8,11)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 9
fvar(3) =100 + ifelse(facing=1,11,8)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,9,13)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 11
fvar(3) =100 + ifelse(facing=1,13,9)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,11,14)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 13
fvar(3) =100 + ifelse(facing=1,14,11)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,14,17)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 15
fvar(3) =100 + ifelse(facing=1,17,14)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,15,18)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 17
fvar(3) =100 + ifelse(facing=1,18,15)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,19,22)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 20
fvar(3) =100 + ifelse(facing=1,22,19)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,20,23)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 22
fvar(3) =100 + ifelse(facing=1,23,20)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,23,26)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 24
fvar(3) =100 + ifelse(facing=1,26,23)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,24,27)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 26
fvar(3) =100 + ifelse(facing=1,27,24)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,26,29)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 27
fvar(3) =100 + ifelse(facing=1,29,26)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,27,30)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 29
fvar(3) =100 + ifelse(facing=1,30,27)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,29,35)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 30
fvar(3) =100 + ifelse(facing=1,35,29)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,30,37)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 35
fvar(3) =100 + ifelse(facing=1,37,30)

[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "back"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,35,0)
[State 0, VarSet]
type = Varset
triggerall = var(1) = 1
trigger1 = numhelper(8990)
trigger1 = command = "fwd"
trigger1 = fvar(3) = 37
fvar(3) =100 + ifelse(facing=1,0,35)

[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "fwd"
fvar(3) = 100+ifelse(facing=1,1,-1)
[State 0, VarSet]
type = Varadd
triggerall = numhelper(8990)
triggerall = fvar(3) = [0,37]
trigger1 = command = "back"
fvar(3) = 100 + ifelse(facing=1,-1,1)

[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) < 0
fvar(3) = 37
[State 0, VarSet]
type = Varset
trigger1 = numhelper(8990)
trigger1 = fvar(3) = [38,58]
fvar(3) = 0

[State 256, Countdown]
type = Varadd
trigger1 = numhelper(8990)
trigger1= fvar(30)=1
fvar(3)=-100

;====<END>====


[State 368, Camera]
type = helper
trigger1 = !numhelper(7650)
helpertype = normal
stateno = 7650
ID = 7650
name = "Camera"
postype = p1
[State 368, screen]
type = screenbound
trigger1 = 1
value = 0
movecamera = 0, 1
[State 4000, Snd]
type = playsnd
trigger1 = time = 1
value = 5, 6
channel = 8
volume = 255
[State 368, Vel]
type = posset
trigger1 = !time
x = -246 * facing
y = 0
[State 4000, Vel]
type = velset
trigger1 = 1
x = ifelse(!winko, 4, 2)
[State 368, Anim]
type = changestate
triggerall = prevstateno = 4306
trigger1 = time = 44
value = 195
ctrl = 0
[State 368, Anim]
type = changestate
triggerall = prevstateno != 4306
trigger1 = time = 44
value = 0





;==========< WIN POSE DECIDER >==========
[Statedef 180]
type = S

[State 180, Akuma Win Quotes]
type = victoryquote
trigger1 = var(1) = 1
value = 1;ceil(random/62.5)-1

[State 180, Shin Akuma Win Quotes]
type = victoryquote
trigger1 = var(1) = 3
value = 1;ceil(random/40)-1

[State 180, Oni Win Quotes]
type = victoryquote
trigger1 = var(1) = 2 || var(1) = 4
value = 24;+ceil(random/62.5)

[State 180, Cyber Akuma Win Quotes]
type = victoryquote
trigger1 = var(1) = 5
value = 40;+ceil(random/125)

[State 180, vs Bison]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "M. Bison" || enemy, name = "M.Bison" || enemy, name = "Bison" || enemy, name = "Dictator" || enemy, name = "cvsvega" || enemy, name = "cvsvega_normal" || enemy, name = "cvsvega_ex"
trigger2 = enemy, name = "Vega" 
trigger2 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger3 = enemy, name = "True Bison" || enemy, name = "Shin Bison" || enemy, name = "Final Bison" || enemy, name = "MBison"
trigger4 = enemy, name = "M. BisonTAG" || enemy, name = "M.BisonTAG" || enemy, name = "BisonTAG" || enemy, name = "DictatorTAG"
trigger5 = enemy, name = "VegaTAG" 
trigger5 = enemy, authorname = "Phantom.of.the.Server" || enemy, authorname = "Froz"
trigger6 = enemy, name = "True BisonTAG" || enemy, name = "Shin BisonTAG" || enemy, name = "Final BisonTAG" || enemy, name = "MBisonTAG"
trigger7 = enemy, name = "True Vega" || enemy, name = "Shin Vega" || enemy, name = "Final Vega"
trigger8 = enemy, name = "[Necromancer's] M. Bison" || enemy, name = "cvsvega" || enemy, name = "svcvega"
value = 58;+ceil(random/250)

[State 180, Shun Goku Satsu Win Quotes]
type = victoryquote
triggerall = numhelper(7600)
triggerall = var(1) = 1 || var(1) = 3
trigger1 = helper(7600), var(39) = 11
trigger2 = helper(7600), var(39) = 12
trigger3 = helper(7600), var(39) = 13
trigger4 = helper(7600), var(39) = 18
trigger5 = helper(7600), var(39) = 9
value = 97;+ceil(random/500)

[State -2, vs Teens-]
type = victoryquote
triggerall = var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Yun" || enemy, name = "cvsyun" || enemy, name = "yun_mx"
trigger2 = enemy, name = "Yang" || enemy, name = "cvsyang" || enemy, name = "Yang_mx"
trigger3 = enemy, selfanimexist(8055010) || enemy, selfanimexist(8055011) || enemy, selfanimexist(8055012)
trigger3 = enemy, selfanimexist(8055020)
trigger4 = enemy, name = "Karin" || enemy, name = "Karin Kanzuki"  || enemy, name = "Yuri" || enemy, name = "Yuri Sakazaki"
trigger5 = enemy, name = "Sakura" || enemy, name = "Sakura Kasugani"  || enemy, name = "Yuri" || enemy, name = "Yuri Sakazaki"
trigger6 = enemy, name = "Sean" || enemy, name = "Sean Matsuda"  || enemy, name = "cvsyuri" || enemy, name = "svsyuri" || enemy, name = "Orochi Chris"
trigger7 = enemy, name = "cvsKarin" || enemy, name = "cvssakura" || enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex"
trigger8 = enemy, name = "Ibuki" || enemy, name = "Sakura_mx" || enemy, name = "Karin_mx" || enemy, name = "Ibuki_mx"
trigger9 = enemy, name = "Juri" || enemy, name = "Juri Han" || enemy, name = "CFJ_JuriHan" || enemy, name = "Makoto"
trigger10 = enemy, name = "Makoto_mx" || enemy, name = "Shiki" || enemy, name = "svcshiki" || enemy, name = "Chris"
trigger11 = enemy, name = "Dark Sakura" || enemy, name = "D.Sakura" || enemy, name = "D. Sakura" || enemy, name = "D Sakura"
trigger12 = enemy, name = "D-Sakura" || enemy, name = "DSakura" || enemy, name = "Athena Asamiya"
value = 94

[State -2, vs Beasts]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055022)
trigger2 = enemy, name = "Blanka" || enemy, name = "Blanka_mx" || enemy, name = "cvsBlanka" || enemy, name = "cvs_Kuma"
trigger3 = enemy, name = "Kuma" || enemy, name = "Panda" || enemy, name = "Beast"
value = 76

[State -2, vs Dhalsim]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Dhalsim" || enemy, name = "RajaaDhalsim" || enemy, name = "Dhalsim_mx" || enemy, name = "cvsdhalsim" || enemy, name = "svcdhalsim"
value = 74

[State -2, vs Girls]; He DOES show proof of his imperfections, after all.
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055002)
trigger1 = enemy, selfanimexist(8055020) || enemy, selfanimexist(8055022) || enemy, selfanimexist(8055026)
trigger1 = enemy, selfanimexist(8055010) || enemy, selfanimexist(8055012) || enemy, selfanimexist(8055013)
trigger2 = enemy, name = "Christie" || enemy, name = "Christie Monteiro" || enemy, name = "Chun-Li" || enemy, name = "Chun Li"
trigger3 = enemy, name = "Elena_mx" || enemy, name = "Elena" || enemy, name = "cvschunli" || enemy, name = "ChunLi" || enemy, name = "Karin"
trigger4 = enemy, name = "Lili"  || enemy, name = "cvs_lili" || enemy, name = "Emilie de Rochefort" || enemy, name = "Chun-Li_mx" || enemy, name = "Karin Kanzuki"
trigger5 = enemy, name = "Cammy"  || enemy, name = "cvscammy" || enemy, name = "Cammy White" || enemy, name = "Psylocke" || enemy, name = "cvsKarin"
trigger6 = enemy, name = "Rogue"  || enemy, name = "Shiki" || enemy, name = "Athena Asamiya" || enemy, name = "Kula" || enemy, name = "Kula Diamond"
trigger7 = enemy, name = "Kasumi"  || enemy, name = "Kasumi Todoh" || enemy, name = "svckasumi" || enemy, name = "Xiaoyu" || enemy, name = "Cvs_Xiaoyu"
trigger8 = enemy, name = "Ling Xiaoyu"  || enemy, name = "RubyHeart" || enemy, name = "Ruby Heart" || enemy, name = "Makoto" || enemy, name = "Makoto_mx"
trigger9 = enemy, name = "R.Mika"  || enemy, name = "R-Mika" || enemy, name = "R. Mika" || enemy, name = "RMika" || enemy, name = "cammy_mx"
trigger10 = enemy, name = "R Mika"  || enemy, name = "Rainbow Mika" || enemy, name = "Mika" || enemy, name = "May" || enemy, name = "May Lee"
trigger11 = enemy, name = "Eliza"  || enemy, name = "Eliza Masters" || enemy, name = "Kung Fu Girl" || enemy, name = "KFG" || enemy, name = "Juri"
trigger12 = enemy, name = "Juri Han"  || enemy, name = "CFJ_JuriHan" || enemy, name = "Nakoruru" || enemy, name = "Tron Bonne"
value = 82

[State -2, vs Demons]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Morrigan" || enemy, name = "Lilith" || enemy, name = "Morrigan Aensland" || enemy, name = "Morrigan_Aensland"
trigger2 = enemy, name = "Morrigan(DS)" || enemy, name = "Lilith(DS)" || enemy, name = "Pyron" || enemy, name = "Pyron(DS)"
trigger4 = enemy, name = "RajaaLilith" || enemy, name = "cvsLilith" || enemy, name = "cvsmorrigan" || enemy, name = "Jedah"
trigger5 = enemy, name = "Jedah(DS)" || enemy, name = "Shadow(DS)" || enemy, name = "Demitri" || enemy, name = "Demitri(DS)"
trigger6 = enemy, name = "svcdemitri" || enemy, name = "Lord Raptor" || enemy, name = "LordRaptor" || enemy, name = "LordRaptor(DS)"
trigger7 = enemy, name = "Dormammu" || enemy, name = "D-Rugal" || enemy, name = "DRugal" || enemy, name = "Mephisto"
trigger8 = enemy, name = "Black Heart" || enemy, name = "BlackHeart" || enemy, name = "Vergil" || enemy, name = "Scorpion"
value = 67

[State -2, vs Dolls]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 =  enemy, name = "Decapre" || enemy, name = "CvS_Decapre" || enemy, name = "Juni'" || enemy, name = "Juli"
value = 78

[State -2, vs Ninjas]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055143)
trigger2 =  enemy, name = "Ibuki" || enemy, name = "Ibuki_mx" || enemy, name = "Mai'" || enemy, name = "Mai Shiranui"
trigger3 =  enemy, name = "cvsmai" || enemy, name = "svcmai" || enemy, name = "Shiranui Mai'" || enemy, name = "Sub-Zero"
trigger4 =  enemy, name = "Strider" || enemy, name = "Strider Hiryu" || enemy, name = "Geki'" || enemy, name = "SF1Geki"
trigger5 =  enemy, name = "MvC EoH - Strider" || enemy, name = "Sub Zero" || enemy, name = "SubZero'" || enemy, name = "CFJ_Hayabusha"
trigger6 =  enemy, name = "Ryu Hayabusha"
value = 80

[State -2, vs Ansatsuken/Kyokugen dudes]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055175) || enemy, selfanimexist(8055161)
trigger1 = enemy, selfanimexist(8055001)
trigger2 = enemy, name = "RyoSakazaki" || enemy, name = "Sakazaki Ryo" || enemy, name = "SakazakiRyo"
trigger3 = enemy, name = "Sean" || enemy, name = "Sean Matsuda" || enemy, name = "cvssean"
trigger4 = enemy, name = "CvS_Sean" || enemy, name = "Robert" || enemy, name = "Robert Garcia"
trigger5 = enemy, name = "cvs_robert" || enemy, name = "Marco" || enemy, name = "Marco Rodriguez"
trigger6 = enemy, name = "Khusnood Butt" || enemy, name = "Khushnood" || enemy, name = "Marco Rodriguez"
trigger7 = enemy, name = "Ryo Sakazaki"  || enemy, name = "cvsryo" || enemy, name = "svcryo"
value = 72

[State -2, vs Ansatsuken/Kyokugen girls]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055175) || enemy, selfanimexist(8055161)
trigger1 = enemy, selfanimexist(8055002)
trigger2 = enemy, name = "cvssakura_normal" || enemy, name = "cvssakura_ex" || enemy, name = "Yuri"
trigger3 = enemy, name = "Yuri Sakazaki" || enemy, name = "cvsyuri" || enemy, name = "Dark Sakura"
trigger4 = enemy, name = "D.Sakura" || enemy, name = "D. Sakura" || enemy, name = "D-Sakura"
trigger5 = enemy, name = "Sakura"  || enemy, name = "Sakura Kasugano" || enemy, name = "cvssakura"
trigger6 = enemy, name = "Yuka" || enemy, name = "Yuka Takeuchi"
value = 85

[State 180, vs Worthy Opponents]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Oro" || enemy, name = "SFIII_Oro" || enemy, name = "DR_Oro" || enemy, name = "Oro_mx" || enemy, name = "CvS_Heihachi"
trigger2 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken"  || enemy, name = "CvS_HeihachiTAG"
trigger3 = enemy, name = "Shen Long" || enemy, name = "Master Gouken" || enemy, name = "Pocket Shin Gouki" || enemy, name = "Garuda"
trigger4 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG"
trigger5 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG" || enemy, name = "Iron Fist"
trigger6 = enemy, name = "Saisyu" || enemy, name = "Saisyu Kusanagi" || enemy, name = "Kusanagi Saisyu" || enemy, name = "Kenpachi" || enemy, name = "Kenpachi Zaraki"
trigger7 = enemy, name = "JinpachiMishima" || enemy, name = "Zaraki Kenpachi" || enemy, name = "IronFist"
trigger8 = enemy, name = "CvS_HeihachiTAG" || enemy, name = "CvS_Heihachi" || enemy, name = "Heihachi Mishima" || enemy, name = "Jinpachi Mishima"
trigger9 = enemy, name = "Mishima Heihachi" || enemy, name = "Heihachi" || enemy, name = "HeihachiMishima" || enemy, name = "CvS_Jinpachi" || enemy, name = "Zeku"
trigger10 = enemy, name = "Retsu" || enemy, name = "Master Retsu" || enemy, name = "CvS_JinpachiTAG"
trigger11 = enemy, name = "Takuma" || enemy, name = "Takuma Sakazaki" || enemy, name = "Sakazaki Takuma" || enemy, name = "cvs_takuma"
trigger12= enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx" || enemy, name = "Q"
trigger13 = enemy, name = "Gou" || enemy, name = "Go" || enemy, name = "Gou Hibiki" || enemy, name = "Go Hibiki" || enemy, name = "GoHibiki" || enemy, name = "GouHibiki"
trigger14 = enemy, name = "Mr Saikyo" || enemy, name = "Mr. Saikyo" || enemy, name = "MrSaikyo" || enemy, name = "Mr.Saikyo" || enemy, name = "Oyaji" || enemy, name = "Dan's Oyaji"
trigger15 = (enemy, name = "Ken") && (enemy, authorname = "Phantom.of.the.Server&Jmorphman")
trigger15 = enemy, var(40) = 2
trigger16 = enemy, name = "Master Ken"
value = 49;+ceil(random/500)

[State 180, vs Final Bison]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Final Bison" || enemy, name = "Final Vega" || enemy, name = "Shin Bison" || enemy, name = "Bison 2"
trigger2 = enemy, name = "Vega II" || enemy, name = "Bison2" || enemy, name = "VegaII" || enemy, name = "ShinBison"
trigger3 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "ShinM.Bison"
trigger4 = enemy, name = "FinalVega" || enemy, name = "FinalBison" ||  enemy, name = "cvsvega_ex"
trigger5 = enemy, name = "ShinVega" || enemy, name = "Shin Vega" ||  enemy, name = "Shin M.Bison"
trigger6 = enemy, name = "Vega" && enemy, authorname = "Froz"
trigger6 = enemy, var(40)=1
trigger7 = enemy, name = "Shin M. Bison" || enemy, name = "Final M. Bison" || enemy, name = "M. Bison 2" || enemy, name = "M. Bison II"
trigger8 = enemy, name = "M.Bison 2" || enemy, name = "M.Bison2" || enemy, name = "M.Bison II" || enemy, name = "M.BisonII"
trigger9 = enemy, name = "Final M.Bison" || enemy, name = "Final M. Bison" || enemy, name = "Shin M.Bison"
trigger10 = enemy, name = "Vega2" || enemy, name = "Vega 2" || enemy, name = "Bison Bison"
trigger11 = enemy, name = "True M.Bison" || enemy, name = "True M. Bison" || enemy, name = "TrueM.Bison"
trigger12 = enemy, name = "True Bison" || enemy, name = "True Bison" || enemy, name = "True Vega" || enemy, name = "TrueVega"
trigger13 = enemy, name = "Shin Dictator" || enemy, name = "ShinDictator" || enemy, name = "True Dictator" || enemy, name = "TrueDictator"
trigger14 = enemy, name = "Dictator2" || enemy, name = "Dictator 2" || enemy, name = "DictatorII" || enemy, name = "Dictator II"
trigger15 = enemy, name = "FinalDictator" || enemy, name = "Final Dictator" || enemy, name = "MBison2" || enemy, name = "MBison 2"
trigger16 = enemy, name = "MBisonII" || enemy, name = "MBison II" || enemy, name = "ShinMBison" || enemy, name = "Shin MBison"
trigger17 = enemy, name = "Final MBison" || enemy, name = "FinalMBison" || enemy, name = "TrueMBison" || enemy, name = "True MBison"
trigger18 = enemy, name = "M BisonII" || enemy, name = "M Bison II" || enemy, name = "ShinM Bison" || enemy, name = "Shin M Bison" || enemy, name = "M Bison2"
trigger19 = enemy, name = "Final M Bison" || enemy, name = "FinalM Bison" || enemy, name = "TrueM Bison" || enemy, name = "True M Bison" || enemy, name = "M Bison 2"
value = 60

[State -2, vs Zangief, Hugo, etc]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Zangief" || enemy, name = "cvszangief" || enemy, name = "cvszangief_normal" || enemy, name = "cvszangief_ex"
trigger2 = enemy, name = "Hugo" || enemy, name = "HugoSFIII" || enemy, name = "svchugo" || enemy, name = "Griffon" || enemy, name = "Earthquake"
trigger3 = enemy, name = "Hulk" || enemy, name = "The Hulk" || enemy, name = "Haggar" || enemy, name = "MvC-EoH Hulk"
trigger4 = enemy, name = "Mike Haggar" || enemy, name = "Juggernaut"
trigger5 = enemy, selfanimexist(8055114) && enemy, selfanimexist(8055020)
value = ifelse(var(1) = 2 || var(1) = 4,95,86)

[State -2, vs "AAAARGHHH!!!"]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Hulk" || enemy, name = "The Hulk" || enemy, name = "MvC-EoH Hulk"
trigger1 = ceil(random<500)
trigger2 = enemy, name = "Necalli" || enemy, name = "CvS_Necalli"
trigger3 = (enemy, name = "Ken") && (enemy, authorname = "Phantom.of.the.Server&Jmorphman")
trigger3 = enemy, var(40) = 1
value = 70

[State 4701, vs Rugal]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Rugal" || enemy, name = "Rugal Bernstein" || enemy, name = "Omega Rugal"
trigger2 = enemy, name = "Rugal94" || enemy, name = "Rugal94(BOSS)" || enemy, name = "rugal_B"
trigger3 = enemy, name = "Rugal_TLE" || enemy, name = "Omega Rugal Gb"
trigger4 = enemy, name = "Mech Rugal" || enemy, name = "Tin 2002_rugal" || enemy, name = "svcrugal" || enemy, name = "Chuchoryu"; You know what, if you can make a friend (or... anyone else) smile just by typping a few letters with your keyboard, do it. You aren't supposed to be here anyway, hehhehheh ;)
trigger5 = enemy, name = "Rugal CvS" || enemy, name = "omega -rugal" || enemy, name = "cvsrugal_normal"
trigger6 = enemy, name = "cvsrugal" && enemy, var(12) != 10
value = 59;ceil(ifelse(random<333, 59, ifelse(random<500,65, 49+ceil(random/500))))

[State -2, vs Rolento, C. Viper, etc]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, SelfAnimExist(8055056) || enemy, selfanimexist(8055055) || enemy, SelfAnimExist(8055057) || enemy, SelfAnimExist(8055059)
trigger2 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "C.Viper" || enemy, name = "CrimsonViper" || enemy, name = "Crimson Viper" || enemy, name = "Albert Wesker"
trigger3 = enemy, name = "CViper" || enemy, name = "CFJ_C.Viper" || enemy, name = "C. Viper" || enemy, name = "Taskmaster" || enemy, name = "Mr-Big" || enemy, name = "Wesker"
trigger4 = enemy, name = "LeiLei" || enemy, name = "HsienKo" || enemy, name = "Raven" || enemy, name = "cvsraven" || enemy, name = "Mr. Big" || enemy, name = "Mr Big"
trigger5 = enemy, name = "Jill" || enemy, name = "Jill Valentine" || enemy, name = "Rolento" || enemy, name = "cvsrolento" || enemy, name = "MrBig"
trigger6 = enemy, name = "Billy" || enemy, name = "Billy Kane" || enemy, name = "Cable" || enemy, name = "Deadpool" || enemy, name = "Mr.Big" || enemy, name = "Maxima"
value = ifelse(var(1) = 2 || var(1) = 4,93,84)

[State -2, vs (Apparent) Machines]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055021)
trigger2 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack" || enemy, name = "DR_Necro"
trigger3 = enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma" || enemy, name = "Z-Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Necro"
trigger4 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Dr Doom"
trigger5 = enemy, name = "Victor Von Doom" || enemy, name = "Doctor Doom" || enemy, name = "Doom" || enemy, name = "Dr. Doom"
value = 81

[State -2, vs Twelve / Necro / Venom / Etc]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055027) || enemy, selfanimexist(8055029)
trigger2 = enemy, name = "Necro" || enemy, name = "Twelve" || enemy, name = "Twelve_mx" || enemy, name = "Necro_mx"
trigger3 = enemy, name = "Venom" || enemy, name = "Carnage" || enemy, name = "Mars People" || enemy, name = "svcMarsPeople"
value = 83

[State -2, vs Seth]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 =  enemy, name = "Seth" || enemy, name = "Cvs_Seth"
value = 83;ceil(ifelse(var(1) = 2 || var(1) = 4,49,ifelse(random<500,83,ifelse(random<500,81,59))))

[State -2, vs Androids]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, selfanimexist(8055025)
trigger2 =  enemy, name = "Alisa Bosconovitch" || enemy, name = "Alisa" || enemy, name = "K'" || enemy, name = "K"
trigger3 =  enemy, name = "Bryan" || enemy, name = "Bryan Fury" || enemy, name = "Maxima" || enemy, name = "Mizuchi"
value = 75

[State -2, vs Dolls]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 =  enemy, name = "Decapre" || enemy, name = "CvS_Decapre" || enemy, name = "Juni'" || enemy, name = "Juli"
value = 78

[State -2, vs Wolverine]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 
trigger1 =  enemy, name = "Wolverine" || enemy, name = "MvC EoH - Wolverine"
value = 71

[State -2, vs Hsien-Ko]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "LeiLei" || enemy, name = "HsienKo"
value = 66

[State -2, vs Orochi Blood]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Iori Yagami" || enemy, name = "cvsiori" || enemy, name = "svciori" || enemy, name = "svciori_normal"
trigger2 = enemy, name = "Iori" || enemy, name = "cvsiori_ex" || enemy, name = "cvsiori_normal" || enemy, name = "svciori_ex"
trigger3 = enemy, name = "Orochi Iori Yagami" || enemy, name = "O. Iori" || enemy, name = "O-Iori" || enemy, name = "O Iori"
trigger4 = enemy, name = "Riot of the Blood Iori" || enemy, name = "Orochi Iori" || enemy, name = "O.Ioril" || enemy, name = "svcorochiiori"
trigger5 = enemy, name = "Orochi Leona" || enemy, name = "O. Leona" || enemy, name = "O-Leona" || enemy, name = "cvsorochiiori"
trigger6 = enemy, name = "Ryuji Yamazaki" || enemy, name = "Yamazaki" || enemy, name = "O.Leona" || enemy, name = "OLeona"
trigger7 = enemy, name = "Orochi Ryuji Yamazaki" || enemy, name = "Orochi Yamazaki" || enemy, name = "cvsyamazaki" || enemy, name = "O Leona"
trigger8 = enemy, name = "Vice" || enemy, name = "cvsvice" || enemy, name = "O. Yamazaki" || enemy, name = "O-Yamazaki"
value = 65

[State -2, vs Bushin-Ryuu]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Guy"  || enemy, name = "cvsguy" || enemy, name = "Guy_mx"
trigger2 = enemy, name = "Maki" || enemy, name = "cvsmaki" || enemy, name = "RajaaMaki"
trigger3 = enemy, name = "Zeku" || enemy, name = "Master Zeku" || enemy, name = "cvs_zeku"
trigger4 = enemy, selfanimexist(8055176)
value = ifelse(var(1) = 2 || var(1) = 4,96,79)

[State -2, vs Sumos]
type = victoryquote
triggerall = var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Edmond Honda" || enemy, name = "E. Honda" || enemy, name = "cvshonda" || enemy, name = "Honda_mx"
trigger2 = enemy, name = "Ganryu" || enemy, name = "cvs_Ganryu" || enemy, name = "Devil Ganryu"
value = 97

[State -2, vs Lord Dan]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Dan" || enemy, name = "Dan Hibiki" || enemy, name = "Pocket Dan Hibiki"
trigger2 = enemy, name = "Evil Dan" || enemy, name = "Evil Dan Hibiki" || enemy, name = "Marvel vs Capcom - Eternity of Heroes: Dan"
trigger3 = enemy, name = "svcdan" || enemy, name = "cvsdan"
value = 77;ceil(ifelse(random<667,77,85))

[State 180, vs Gen]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
triggerall = ceil(random<500)
trigger1 = enemy, name = "Gen" || enemy, name = "Master Gen" || enemy, name = "Gen_mx"
value = 49;+ceil(random/500)

[State 180, vs Mr. Karate]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Mr. Karate" || enemy, name = "Mr.Karate" || enemy, name = "Mr Karate" || enemy, name = "MrKarate"
trigger2 = enemy, name = "CvS2_Mr.Karate" || enemy, name = "cvs_mr_karate" || enemy, name = "svckarate" || enemy, name = "Mr.KARATEIII"
trigger3 = enemy, name = "Honki ni Natta Mr. Karate" || enemy, name = "Shin Mr. Karate"  || enemy, name = "Serious Mr. Karate"
trigger4 = enemy, name = "Honki ni Natta Mr.Karate" ||  enemy, name = "Shin Mr.Karate"  ||  enemy, name = "Serious Mr.Karate"
trigger5 = enemy, name = "Honki ni Nata Mr Karate" ||  enemy, name = "Shin Mr Karate"  ||  enemy, name = "Serious Mr Karate"
trigger6 = enemy, name = "Honki ni Natta MrKarate" ||  enemy, name = "Shin MrKarate"  ||  enemy, name = "Serious MrKarate"
value = 49;+ceil(random/500)

[State 180, vs Deities]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, SelfAnimExist(8055028)
trigger2 = enemy, name = "God Rugal" || enemy, name = "Orochi" || enemy, name = "Asura" || enemy, name = "Pyron" ||  enemy, name = "Thor" || enemy, name = "Pyron(DS)"
trigger3 = enemy, name = "Gill" || enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Kuroshiki Oni"
trigger4 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena" || enemy, name = "Amaterasu" || enemy, name = "Ogre Gouki"
trigger5 = enemy, name = "D-Rugal" || enemy, name = "Dormammu" || enemy, name = "Galactus" || enemy, name = "Shuma-Gorath" || enemy, name = "Ancient Ogre"
trigger6 = enemy, name = "Ancient Ogre" || enemy, name = "Ogre" || enemy, name = "cvs_ogre" || enemy, name = "True Ogre" || enemy, name = "Monstrous Ogre"																	|| enemy, name = "Chuchoryu"
trigger7 = enemy, name = "Ingrid" || enemy, name = "God Orochi" || enemy, name = "Kung Fu Man" || enemy, name = "Kung Fu Man 720"; Based Kung Fu Man. He's the reason... of everything. 
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken" 
trigger8 = enemy, var(1) = 2 || enemy, var(1) = 4
trigger9 = enemy, name = "Asura" ||  enemy, name = "AsuraTAG" || enemy, name = "Asura(AW)" || enemy, name = "Asura's Wrath" || enemy, name = "Asura (Asura's Wrath)" || enemy, name = "CvS_Asura"
value = ifelse(var(1) = 2 || var(1) = 4,87,52)

[State 180, vs Gouken]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Gouken SSF4" || enemy, name = "Gouken" || enemy, name = "Shin Gouken" 
trigger2 = enemy, name = "Shen Long" || enemy, name = "Master Gouken"
trigger3 = enemy, name = "Gouken SSF4" || enemy, name = "GoukenTAG" || enemy, name = "Shin GoukenTAG" 
trigger4 = enemy, name = "Shen LongTAG" || enemy, name = "Master GoukenTAG"
value = ifelse(var(1) = 2 || var(1) = 4,91,63)

[State -2, vs Oni]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
triggerall = ceil(random<500)
trigger1 = enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Ogre Gouki" || enemy, name = "Kuroshiki Oni" || enemy, name = "CvS_Oni"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
trigger3 = enemy, name = "Ogre" && enemy, authorname = "JUN"
trigger4 = enemy, name = "OniTAG" || enemy, name = "Oni AkumaTAG" || enemy, name = "Oni GoukiTAG" || enemy, name = "Ogre AkumaTAG" || enemy, name = "Ogre GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 2
value = 51;ifelse(var(1) = 2 || var(1) = 4,88,51+ceil(random/500))

[State -2, vs Akuma]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = (enemy, name = "Akuma" || enemy, name = "MvC-EoH Gouki" || enemy, name = "CvSGouki" || enemy, name = "svcgouki" || enemy, name = "ZXAkuma" || enemy, name = "Gouki" || enemy, name = "cvsgouki_normal" || enemy, name = "ZXAkuma") && enemy, authorname != "Mr. Ansatsuken" && enemy, authorname !="Phantom.of.the.server"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger3 = (enemy, name = "Gouki" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
trigger4 = enemy, name = "AkumaTAG" || enemy, name = "CvSGoukiTAG" || enemy, name = "Gouki" && enemy, authorname != "Mr. Ansatsuken"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 1
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 0
value = 54;ifelse(var(1) = 2 || var(1) = 4,87,ifelse(random<500,54,49+ceil(random/500)))

[State -2, vs Shin Akuma]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Shin Akuma" || enemy, name = "Shin Gouki" || enemy, name = "cvsgouki_ex"
trigger2 = (enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger3 = (enemy, name = "Gouki"  && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
trigger4 = enemy, name = "Shin AkumaTAG" || enemy, name = "Shin GoukiTAG"
trigger5 = (enemy, name = "AkumaTAG" && enemy, authorname = "Mr.Ansatsuken") && enemy, var(1) = 3
trigger6 = (enemy, name = "GoukiTAG" && enemy, authorname = "Phantom.of.the.Server") && enemy, var(1) = 1
value = 49;ifelse(var(1) = 2 || var(1) = 4,87,ifelse(random<500,54,49+ceil(random/500)))

[State -2, vs Ryu]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Ryu" || enemy, name = "Ryu Hoshi" || enemy, name = "Master Ryu" && enemy, authorname != "Phantom.of.the.Server"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger3 = enemy, name = "MvC-EoH Ryu" || enemy, name = "cvsryu" || enemy, name = "cvsryu_normal" || enemy, name = "svcryu"
trigger4 = enemy, name = "RyuTAG" || enemy, name = "Ryu HoshiTAG" || enemy, name = "Master RyuTAG" && enemy, authorname != "Phantom.of.the.Server"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) !=2
trigger6 = enemy, name = "MvC-EoH RyuTAG"
value = 89;ifelse(var(1) = 2 || var(1) = 4,89,54+ceil(random/500))

[State -2, vs Master Ryu]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Master Ryu"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =3
value = 57;ifelse(var(1) = 2 || var(1) = 4,89,57)

[State -2, vs Evil Ryu]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = enemy, name = "Evil Ryu" || enemy, name = "Evil Ryu Hoshi" || enemy, name = "E. Ryu" || enemy, name = "cvsryu_ex"
trigger2 = enemy, name = "Ryu" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger3 = enemy, name = "ERyu" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil Ryu"
trigger4 = enemy, name = "Evil RyuTAG" || enemy, name = "Evil Ryu HoshiTAG" || enemy, name = "E. RyuTAG"
trigger5 = enemy, name = "RyuTAG" && enemy, authorname = "Phantom.of.the.Server" && enemy, var(1) =2
trigger6 = enemy, name = "ERyuTAG" || enemy, name = "Shin Ryu" || enemy, name = "MvC-EoH Evil RyuTAG"
value = 90;ifelse(var(1) = 2 || var(1) = 4,90,58)

[State -2, vs Ken]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3 || var(1) = 2 || var(1) = 4
trigger1 = (enemy, name = "Ken" || enemy, name = "cvsken" || enemy, name = "cvsken_normal" || enemy, name = "Ken Masters" || enemy, name = "Ken SF3trd" || enemy, name = "Street Fighter 3 Ken" || enemy, name = "Master Ken" && random<750) && enemy, authorname != "Phantom.of.the.Server&Jmorphman" && enemy, authorname != "vyn"
trigger2 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 0
trigger3 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 2 && random<750
trigger4 = enemy, name = "Ken Masters" && enemy, authorname = "Phantom.of.the.Server&Jmorphman" && enemy, var(40) = 1 && random<600
value = 92;ifelse(var(1) = 2 || var(1) = 4,92,71+ceil(random/500))

[State -2, vs Galactus]
type = victoryquote
triggerall = var(1) = 1 || var(1) = 3
trigger1 = enemy, name = "Galactus"
value = 67

[State -2, vs Apocalypse]
type = victoryquote
trigger1 = enemy, name = "Apocalypse"
value = 49

[State 180, win]
type = changestate
triggerall = prevstateno != 183
trigger1 = !time
value = 185
[State 180, win]
type = changestate
triggerall = prevstateno = 183
trigger1 = !time
value = 183

;==========< WIN by Shin Misogi >==========
[Statedef 183]
type = S
anim = 185
facep2 = 0
sprpriority = -5

[State 0, AssertSpecial]
type = AssertSpecial
trigger1 = matchover
flag = nomusic

[State 183, win]
type = changestate
trigger1 = roundstate = 3 && time >= 60
trigger1 = prevstateno != 180
value = 180
ctrl = 1


;==========< WIN 1 >==========
;--Win--
[Statedef 185]
type = S
anim = 180 + ifelse(var(55)=1,10000,0)
ctrl = 0
[State 185, Spr]
type = sprpriority
trigger1 = animelem = 16
value = -5




[State 182, fire]
type = playsnd
trigger1 = animelem = 15
value = 5, 47
channel = 3
volume = 255
[State 182, fire]
type = playsnd
trigger1 = animelem = 15
value = 5, 47
channel = 1
volume = 255

[State 182, fire]
type = playsnd
trigger1 = animelem = 4
value = 5, 48
channel = 3
volume = 128


[State 182, Oni quote 1]
type = playsnd
triggerall = var(10) = 1
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 28
channel = 0
volume = 255
[State 182, Oni quote 1]
type = playsnd
triggerall = var(10) = 1
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 28
channel = 2
volume = 255
[State 182, Oni quote 2]
type = playsnd
triggerall = var(10) = 2
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 4
channel = 0
volume = 255
[State 182, Oni quote 2]
type = playsnd
triggerall = var(10) = 2
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 4
channel = 2
volume = 255
[State 182, Oni quote 3]
type = playsnd
triggerall = var(10) = [3,10]
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 14 + var(10)
channel = 0
volume = 255
[State 182, Oni quote 3]
type = playsnd
triggerall = var(10) = [3,10]
triggerall = var(1) =2
trigger1 = time = 2
value = 14, 14 + var(10)
channel = 2
volume = 255

[State 182, Shin Akuma quotes]
type = playsnd
triggerall = var(1) =3
trigger1 = time = 2
value = 4, 39 + var(10)
channel = 0
volume = 255
[State 182, Shin Akuma quotes]
type = playsnd
triggerall = var(1) = 3
trigger1 = time = 2
value = 4, 39 + var(10)
channel = 2
volume = 255

[State 182, Akuma quote 1]
type = playsnd
triggerall = var(10)=1
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 9
channel = 0
volume = 255
[State 182, Akuma quote 1]
type = playsnd
triggerall = var(10)=1
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 9
channel = 2
volume = 255

[State 182, Akuma quote 2]
type = playsnd
triggerall = var(10)=2
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 8
channel = 0
volume = 255
[State 182, Akuma quote 2]
type = playsnd
triggerall = var(10)=2
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 8
channel = 2
volume = 255

[State 182, Akuma quote 3]
type = playsnd
triggerall = var(10)=3
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 2
channel = 0
volume = 255
[State 182, Akuma quote 3]
type = playsnd
triggerall = var(10)=3
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 2
channel = 2
volume = 255

[State 182, Akuma quote 4]
type = playsnd
triggerall = var(10)=4
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 18
channel = 0
volume = 255
[State 182, Akuma quote 4]
type = playsnd
triggerall = var(10)=4
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 18
channel = 2
volume = 255

[State 182, Akuma quote 5]
type = playsnd
triggerall = var(10)=5
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 35
channel = 0
volume = 255
[State 182, Akuma quote 5]
type = playsnd
triggerall = var(10)=5
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 35
channel = 2
volume = 255
[State 182, Akuma quote 5]
type = playsnd
triggerall = var(10)=5
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 35
channel = 0
volume = 255

[State 182, Akuma quote 6]
type = playsnd
triggerall = var(10)=6
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 37
channel = 0
volume = 255
[State 182, Akuma quote 6]
type = playsnd
triggerall = var(10)=6
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 37
channel = 2
volume = 255

[State 182, Akuma quote 7]
type = playsnd
triggerall = var(10)=7
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 38
channel = 0
volume = 255
[State 182, Akuma quote 7]
type = playsnd
triggerall = var(10)=7
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 38
channel = 2
volume = 255

[State 182, Akuma quote 8]
type = playsnd
triggerall = var(10)=8
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 39
channel = 0
volume = 255
[State 182, Akuma quote 8]
type = playsnd
triggerall = var(10)=8
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 39
channel = 2
volume = 255

[State 182, Akuma quote 9]
type = playsnd
triggerall = var(10)=9
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 50
channel = 0
volume = 255
[State 182, Akuma quote 9]
type = playsnd
triggerall = var(10)=9
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 50
channel = 2
volume = 255

[State 182, Akuma quote 10]
type = playsnd
triggerall = var(10)=10
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 51
channel = 0
volume = 255
[State 182, Akuma quote 10]
type = playsnd
triggerall = var(10)=10
triggerall = var(1) = 1
trigger1 = time = 2
value = 4, 51
channel = 2
volume = 255

[State 182, Akuma quote "Your toys will not defeat me!"]
type = playsnd
triggerall = matchover && !roundsexisted
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Cyber" || enemy, name = "Cyber Akuma" || enemy, name = "Z-Gouki"
trigger2 = enemy, SelfAnimExist(8055021) || enemy, selfanimexist(8055025) || enemy, SelfAnimExist(8055059)
trigger3 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "C.Viper" || enemy, name = "CrimsonViper" || enemy, name = "Crimson Viper"
trigger4 = enemy, name = "Mech Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma"
trigger5 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack"
trigger6 = enemy, name = "Pacman" || enemy, name = "CViper" || enemy, name = "CFJ_C.Viper" || enemy, name = "C. Viper" || enemy, name = "Taskmaster"
trigger7 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger7 = enemy, var(55) = 1
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger8 = enemy, var(1) = 5
trigger9 = enemy, name = "Victor Von Doom" || enemy, name = "LeiLei" || enemy, name = "HsienKo" || enemy, name = "RubyHeart"
trigger10 = enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom" || enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom"
trigger11 = enemy, name = "Jill" || enemy, name = "Jill Valentine" || enemy, name = "Rolento" || enemy, name = "cvsrolento"
trigger12 = enemy, name = "Billy" || enemy, name = "Billy Kane" || enemy, name = "Cable" || enemy, name = "Deadpool"
trigger13 = enemy, name = "Tron Bonne" || enemy, name = "Apocalypse" || enemy, name = "Onslaught" || enemy, name = "Ruby Heart"
value = 4, 7
channel = 0
volume = 255
[State 182, Akuma quote "Your toys will not defeat me!"]
type = playsnd
triggerall = matchover && !roundsexisted
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Cyber" || enemy, name = "Cyber Akuma" || enemy, name = "Z-Gouki"
trigger2 = enemy, SelfAnimExist(8055021) || enemy, selfanimexist(8055025) || enemy, SelfAnimExist(8055059)
trigger3 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "C.Viper" || enemy, name = "CrimsonViper" || enemy, name = "Crimson Viper"
trigger4 = enemy, name = "Mech Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma"
trigger5 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack"
trigger6 = enemy, name = "Pacman" || enemy, name = "CViper" || enemy, name = "CFJ_C.Viper" || enemy, name = "C. Viper" || enemy, name = "Taskmaster"
trigger7 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger7 = enemy, var(55) = 1
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger8 = enemy, var(1) = 5
trigger9 = enemy, name = "Victor Von Doom" || enemy, name = "LeiLei" || enemy, name = "HsienKo" || enemy, name = "RubyHeart"
trigger10 = enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom" || enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom"
trigger11 = enemy, name = "Jill" || enemy, name = "Jill Valentine" || enemy, name = "Rolento" || enemy, name = "cvsrolento"
trigger12 = enemy, name = "Billy" || enemy, name = "Billy Kane" || enemy, name = "Cable" || enemy, name = "Deadpool"
trigger13 = enemy, name = "Tron Bonne" || enemy, name = "Apocalypse" || enemy, name = "Onslaught" || enemy, name = "Ruby Heart"
value = 4, 7
channel = 2
volume = 255
[State 182, Akuma quote "Your toys will not defeat me!"]
type = playsnd
triggerall = !matchover
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Cyber" || enemy, name = "Cyber Akuma" || enemy, name = "Z-Gouki"
trigger2 = enemy, SelfAnimExist(8055021) || enemy, selfanimexist(8055025) || enemy, SelfAnimExist(8055059)
trigger3 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "C.Viper" || enemy, name = "CrimsonViper" || enemy, name = "Crimson Viper"
trigger4 = enemy, name = "Mech Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma"
trigger5 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack"
trigger6 = enemy, name = "Pacman" || enemy, name = "CViper" || enemy, name = "CFJ_C.Viper" || enemy, name = "C. Viper" || enemy, name = "Taskmaster"
trigger7 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger7 = enemy, var(55) = 1
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger8 = enemy, var(1) = 5
trigger9 = enemy, name = "Victor Von Doom" || enemy, name = "LeiLei" || enemy, name = "HsienKo" || enemy, name = "RubyHeart"
trigger10 = enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom" || enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom"
trigger11 = enemy, name = "Jill" || enemy, name = "Jill Valentine" || enemy, name = "Rolento" || enemy, name = "cvsrolento"
trigger12 = enemy, name = "Billy" || enemy, name = "Billy Kane" || enemy, name = "Cable" || enemy, name = "Deadpool"
trigger13 = enemy, name = "Tron Bonne" || enemy, name = "Apocalypse" || enemy, name = "Onslaught" || enemy, name = "Ruby Heart"
value = 4, 7
channel = 0
volume = 255
[State 182, Akuma quote "Your toys will not defeat me!"]
type = playsnd
triggerall = !matchover
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, name = "Sentinel" || enemy, name = "Cyborg" || enemy, name = "Cyber" || enemy, name = "Cyber Akuma" || enemy, name = "Z-Gouki"
trigger2 = enemy, SelfAnimExist(8055021) || enemy, selfanimexist(8055025) || enemy, SelfAnimExist(8055059)
trigger3 = enemy, name = "Hsien-Ko" || enemy, name = "Lei-Lei" || enemy, name = "C.Viper" || enemy, name = "CrimsonViper" || enemy, name = "Crimson Viper"
trigger4 = enemy, name = "Mech Gouki" || enemy, name = "Zero-Gouki" || enemy, name = "Zero-Akuma" || enemy, name = "Z-Akuma"
trigger5 = enemy, name = "CvS_JackTAG" || enemy, name = "CvS_Jack" || enemy, name = "Jack-X" || enemy, name = "Tekken Jack"
trigger6 = enemy, name = "Pacman" || enemy, name = "CViper" || enemy, name = "CFJ_C.Viper" || enemy, name = "C. Viper" || enemy, name = "Taskmaster"
trigger7 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger7 = enemy, var(55) = 1
trigger8 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken"
trigger8 = enemy, var(1) = 5
trigger9 = enemy, name = "Victor Von Doom" || enemy, name = "LeiLei" || enemy, name = "HsienKo" || enemy, name = "RubyHeart"
trigger10 = enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom" || enemy, name = "Dr.Doom" || enemy, name = "Dr. Doom"
trigger11 = enemy, name = "Jill" || enemy, name = "Jill Valentine" || enemy, name = "Rolento" || enemy, name = "cvsrolento"
trigger12 = enemy, name = "Billy" || enemy, name = "Billy Kane" || enemy, name = "Cable" || enemy, name = "Deadpool"
trigger13 = enemy, name = "Tron Bonne" || enemy, name = "Apocalypse" || enemy, name = "Onslaught" || enemy, name = "Ruby Heart"
value = 4, 7
channel = 2
volume = 255

[State 182, Akuma quote "I have killed a god with my fists!"]
type = playsnd
triggerall = matchover
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, SelfAnimExist(8055028)
trigger2 = enemy, name = "God Rugal" || enemy, name = "Orochi" || enemy, name = "Asura" || enemy, name = "Pyron" ||  enemy, name = "Thor"
trigger3 = enemy, name = "Gill" || enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Kuroshiki Oni"
trigger4 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena" || enemy, name = "Amaterasu" || enemy, name = "Ogre Gouki"
trigger5 = enemy, name = "D-Rugal" || enemy, name = "Dormammu" || enemy, name = "Galactus" || enemy, name = "Shuma-Gorath" || enemy, name = "Ancient Ogre"
trigger6 = enemy, name = "Ancient Ogre" || enemy, name = "Ogre" || enemy, name = "cvs_ogre" || enemy, name = "True Ogre" || enemy, name = "Monstrous Ogre"
trigger7 = enemy, name = "Ingrid" || enemy, name = "God Orochi" || enemy, name = "Kung Fu Man" || enemy, name = "Kung Fu Man 720"; If there's a god, his name is Kung Fu Man (just kidding... I'm not an atheist btw).
trigger8 = enemy, name = "Chuchoryu"; What did you expcet!? An explaination!? Get the fuck out of my files or I'll Shun Goku Satsu you.
trigger9 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken" 
trigger9 = enemy, var(1) = 2 || enemy, var(1) = 4
trigger10 = enemy, name = "Shrek" || enemy, name = "Bane" || enemy, name = "CIA"; Uh, you don't get to bring friends
value = 4, 4
channel = 0
volume = 255
[State 182, Akuma quote "I have killed a god with my fists!"]
type = playsnd
triggerall = matchover
triggerall = var(1) = 1 || var(1) = 3
triggerall = time = 2
trigger1 = enemy, SelfAnimExist(8055028)
trigger2 = enemy, name = "God Rugal" || enemy, name = "Orochi" || enemy, name = "Asura" || enemy, name = "Pyron" ||  enemy, name = "Thor"
trigger3 = enemy, name = "Gill" || enemy, name = "Oni" || enemy, name = "Oni Akuma" || enemy, name = "Oni Gouki" || enemy, name = "Ogre Akuma" || enemy, name = "Kuroshiki Oni"
trigger4 = enemy, name = "Athena" || enemy, name = "Goddess Athena" || enemy, name = "svcathena" || enemy, name = "Amaterasu" || enemy, name = "Ogre Gouki"
trigger5 = enemy, name = "D-Rugal" || enemy, name = "Dormammu" || enemy, name = "Galactus" || enemy, name = "Shuma-Gorath" || enemy, name = "Ancient Ogre"
trigger6 = enemy, name = "Ancient Ogre" || enemy, name = "Ogre" || enemy, name = "cvs_ogre" || enemy, name = "True Ogre" || enemy, name = "Monstrous Ogre"
trigger7 = enemy, name = "Ingrid" || enemy, name = "God Orochi" || enemy, name = "Kung Fu Man" || enemy, name = "Kung Fu Man 720"; He's the main reason why you're reading this, after all.
trigger8 = enemy, name = "Chuchoryu"; Hi there.
trigger9 = enemy, name = "Akuma" && enemy, authorname = "Mr.Ansatsuken" 
trigger9 = enemy, var(1) = 2 || enemy, var(1) = 4
trigger10 = enemy, name = "Shrek" || enemy, name = "Bane" || enemy, name = "CIA"; They are not my friends.
value = 4, 4
channel = 2
volume = 255

[State 185, Snd]
type = playsnd
trigger1 = animelem = 16
value = 7, 7
channel = 7
volume = 255


[State 185, Flames]
type = explod
trigger1 = animelem = 15
anim = 3511
ID = 6011
sprpriority = 7
postype = p1
pos = 0, -20
scale = 0.5, 1 
bindtime = -1
removeongethit = 1
ownpal = 1


[State 185, Flames]
type = explod
trigger1 = animelem = 15
anim = 3802
ID = 6011
sprpriority = 6
postype = p1
pos = 0, 10
scale = 0.5, 0.5 
bindtime = -1
removeongethit = 1
ownpal = 1

[State 185, More flames]
type = explod
trigger1 = animelem = 15
anim = 3512
ID = 6011
sprpriority = 5
postype = p1
pos = 0, 10
scale = 0.5, 0.5 
bindtime = -1
removeongethit = 1
ownpal = 1


[State 185, Kanji]
type = explod
trigger1 = animelem = 4
anim = 1591
ID = 6011
sprpriority = 6
postype = p1
pos = -27, -40
scale = 0.5, 0.5
bindtime = -1
removeongethit = 1
removetime = 60
ownpal = 1



[State 183, Kanji]
type = helper
trigger1 = animelem = 16
helpertype = normal
stateno = 6012
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, -8)
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99
size.xscale = 0.25
size.yscale = 0.25


[State 183, Kanji]
type = helper
trigger1 = animelem = 16
helpertype = normal
stateno = 6013
ID = 6012
postype = p1
facing = ifelse(facing = 1, 1, -1)
pos = ifelse(facing = 1, 0, -8)
ownpal = 1
persistent = 0
pausemovetime = 99
supermovetime = 99
size.xscale = 0.25
size.yscale = 0.25

[State 0, ChangeAnim]
type = ChangeAnim
trigger1 = matchover && numhelper(7600)
trigger1 = anim = 180 && animelemtime(16)=0
value = 185

[state assertspecial]
type=assertspecial
trigger1=time=[0,350]
flag=roundnotover

;==========< CONTINUE? >==========
[Statedef 5500]
type = S
anim = 5500
ctrl = 0
velset = 0, 0
[State 5500, Anim]
type = changeanim
trigger1 = !time
value = 5500
type = S
ctrl = 0
anim = 170
velset = 0, 0
[State 170, NHB]
type = nothitby
trigger1 = 1
value = SCA
time = 1

[State 4000, Aura]
type = helper
trigger1 = anim = 5500 && animelem = 1
helpertype = normal
stateno = 6000
ID = 6000
name = "Aura"
postype = p1
ownpal = 1
persistent = 0
pos = 0, 40
supermovetime = 9999

[State 175, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = animelem = 2
value = 11, 2
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) != 2
trigger1 = animelem = 2
value = 11, 2
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = animelem = 2
value = 11, 4
channel = 10
volume = 255

[State 175, Snd]
type = playsnd
triggerall = var(1) = 2
trigger1 = animelem = 2
value = 11, 4
channel = 12
volume = 255

[State 175, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 12
channel = 5
loop = 1
persistent = 0

[State 175, Snd]
type = playsnd
trigger1 = animelem = 1
value = 5, 12
channel = 6
loop = 1
persistent = 0


[State 182, Shake]
type = envshake
trigger1 = animelem = 1
time = 22
freq = 120
ampl = 4



;==========< FALL RECOVERY >==========
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
trigger1 = vel y > 0 && pos y >= -10
value = 5201

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
[State 5201, Vel]
type = velset
trigger1 = !time
x = -8
y = 0
[State 5201, Vel]
type = velmul
trigger1 = 1
x = 0.9

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Snd]
type = playsnd
trigger1 = var(1) = 1  || var(1) = 3
trigger1 = !time
value = 4, 19
channel = 0

[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8211
ID = 8200
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 5201, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5201, Dust]
type = playsnd
trigger1 = !time
value = 0, 101
[State 5201, Dust]
type = explod
trigger1 = !(time % 6) && abs(vel x) >= 1
anim = 7103
sprpriority = 3
postype = p1
pos = 0, 0
vel = 1, 0
scale = 1, 1
pausemovetime = -1
supermovetime = -1
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

[Statedef 5210]
type = A
movetype = I
physics = N
anim = 5210
ctrl = 0

[State 5210, Snd]
type = playsnd
trigger1 = animelem = 1
value = 3 + (var(1) = 2) * 10, 3 * (var(1) = 2)
channel = 0

[State 5210, Flash]
type = palfx
trigger1 = !time
add = 255, 255, 255
sinadd = -255, -255, -255, 40
time = 10

[State 5210, Snd]
type = playsnd
trigger1 = !time
value = 0, 5200

[State 5210, Snd]
type = playsnd
trigger1 = var(1) = 1  || var(1) = 3
trigger1 = !time
value = 4, 19
channel = 0

[State 5201, FX]
type = helper
trigger1 = !time
helpertype = normal
stateno = 8211
ID = 8211
name = "Recover FX"
postype = p1
pos = 0, ceil(-18 * const(size.yscale))
size.xscale = 1
size.yscale = 1
ownpal = 1
[State 5210, Accel]
type = veladd
trigger1 = 1
y = 0.6

[State 5210, Vel]
type = velset
trigger1 = !time
x = ifelse((command = "holdfwd" && command != "holdback"), 4, ifelse((command != "holdfwd" && command = "holdback"), -4, 0))
y = -7.55

[State 5210, Turn]
type = turn
trigger1 = !time
trigger1 = p2dist x < 0

[State 5210, NHB]
type = nothitby
trigger1 = time < 14
value = SCA
time = 1

[State 5210, Ctrl]
type = ctrlset
trigger1 = time >= 14
value = 1

[State 5210, Land]
type = changestate
trigger1 = vel y > 0
trigger1 = pos y > -vel y
value = 52



;==========< RECOVERY ROLL >==========
[Statedef 5220]
type = A
movetype = H
physics = N
[State 5220, Anim]
type = changeanim
trigger1 = anim = 5035 && !animtime
value = 5050
[State 5220, Vel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)
[State 5220, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= -10
value = 5221

[Statedef 5221]
type = C
movetype = I
physics = N
anim = 5210 ; Changed from 5220 (missing) to 5210 (exists)
facep2 = 1

[State 5221, Pos]
type = posset
trigger1 = 1
y = 0
[State 5221, Vel]
type = velset
trigger1 = 1
x = 5
y = 0
[State 5221, Push]
type = playerpush
trigger1 = animelemtime(15) < 0
value = 0
[State 5221, Anim]
type = changeanim
trigger1 = animelem = 8
trigger1 = !AIlevel && command != "holdfwd"
value = 5220
elem = 12
[State 5221, Type]
type = statetypeset
trigger1 = animelemtime(15) >= 0
physics = S
[State 5221, Dust]
type = explod
trigger1 = animelemtime(13) < 0 && !(time % 5)
anim = 6051
ID = 6051
sprpriority = 3
postype = p1
vel = -1, 0
ownpal = 1
[State 5221, Dust]
type = explod
trigger1 = animelem = 15
anim = 7104
ID = 7104
sprpriority = -2
postype = p1
pos = 25, 0
vel = 0, 0
ownpal = 1
scale = 0.5, 0.5
pausemovetime = -1
supermovetime = -1
[State 5221, Snd]
type = playsnd
trigger1 = animelem = 15
value = 0, 53
persistent = 0

[State 5221, End]
type = changestate
trigger1 = !animtime
value = 0
ctrl = 1


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


;==========< TARGET OTG RESET >==========
[Statedef 5085]
type = A
physics = N
movetype = H
velset = 0, 0
anim = 5090
ctrl = 0
facep2 = 1

[State 5085, nothitby]
type = nothitby
trigger1 = gethitvar(fallcount) > 1
value = SCA
time = 1

[State 5085, hfs]
type = hitfallset
trigger1 = 1
value = 0

[State 5085, End]
type = changestate
trigger1 = hitshakeover
value = 5086


[Statedef 5086]
type = A
physics = N
movetype = H
anim = 5040
ctrl = 0

[State 5086, nothitby]
type = nothitby
trigger1 = gethitvar(fallcount) > 1
value = SCA
time = 1

[State 5086, Vel]
type = hitvelset
trigger1 = !time
x = 1
y = 1

[State 5086, Accel]
type = veladd
trigger1 = 1
y = gethitvar(yaccel)

[State 5086, End]
type = selfstate
trigger1 = vel y > 0 && pos y >= 0
value = 52


;===========================================================================
;===============================< -2 STATES >=================================
;===========================================================================
[Statedef -2]

[State 0, VarSet]
type = VarSet
trigger1 = fvar(3) = 24 || fvar(3) = 26 || fvar(3) = 28 || fvar(3) = 30 || fvar(3) = 34 || fvar(3) = 35 || fvar(3) = 36 || fvar(3) = 37
fvar(6) = 1
[State 0, VarSet]
type = VarSet
trigger1 = fvar(3) != 24 && fvar(3) != 26  && fvar(3) != 28 && fvar(3) != 30 && fvar(3) != 34 && fvar(3) != 35 && fvar(3) != 36 && fvar(3) != 37
fvar(6) = 0

[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 0
trigger1 = winko
var(50) = 1
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 0
trigger1 = winko
var(53) = 1
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 0
trigger1 = life = 0
var(51) = 1
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 0
trigger1 = life = 0
var(53) = 11
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 1
trigger1 = winko
var(50) = 2
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 1
trigger1 = winko
var(53) = 2
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 1
trigger1 = life = 0
var(51) = 2
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 1
trigger1 = life = 0
var(53) = 12
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 2
trigger1 = winko
var(50) = 3
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 2
trigger1 = winko
var(53) = 3
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 2
trigger1 = life = 0
var(51) = 3
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 2
trigger1 = life = 0
var(53) = 13
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 3
trigger1 = winko
var(50) = 4
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 3
trigger1 = winko
var(53) = 4
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 3
trigger1 = life = 0
var(51) = 4
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 3
trigger1 = life = 0
var(53) = 14
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 4
trigger1 = winko
var(50) = 5
[State 0, In-battle dialogues]
type = Varset
triggerall = var(56) = 4
trigger1 = winko
var(53) = 5
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 4
trigger1 = life = 0
var(51) = 5
[State 0, In-battle dialogues]
type = Varset
triggerall = var(57) = 4
trigger1 = life = 0
var(53) = 15


[State 3025, particles]
type = explod
triggerall = stateno != [1251110,1251113]
trigger1 = movetype != H && time % 2
trigger1 = anim != 187
trigger1 = (var(1) = 2)
trigger1 = stateno != [4900,4905]
trigger1 = stateno != 195
trigger2 = anim = 187 && animelemtime(2)>0
trigger2 = time % 2
trigger2 = (var(1) = 2)
trigger3 = anim = [120,152]
trigger3 = (var(1) = 2 || var(1) = 5)
trigger3 = time % 2
vel = 0, 0
accel = 0,0
anim = 3031
sprpriority = ifelse(random<500, 3, -5)
ID = 8912
postype = p1
pos = 0+ifelse(anim=3060,30,0)+ifelse(anim=3051,30-animelemtime(1),0)+ifelse(anim=3000 && animelemtime(38)>=0,15,0)+ifelse(anim=1002,30-animelemtime(3),0)+ifelse(anim=1001,10,0), -65 + ifelse(statetype=C,30,0)
random = 50, 75
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
supermovetime = -1

[State 3025, particles]
type = explod
triggerall = stateno != [1251110,1251113]
trigger1 = movetype != H && time % 3
trigger1 = anim != 187
trigger1 = (var(1) = 2) ;&& time % 2
trigger1 = stateno != [4900,4905]
trigger1 = stateno != 195
trigger2 = anim = 187 && animelemtime(2)>0
trigger2 = time % 3
trigger2 = (var(1) = 2)
trigger3 = time % 3
trigger3 = (var(1) = 2)
trigger3 = anim = [120,152]
vel = 0, -1 -(random / 1000.0)
accel = 0, 0.150- (0.001*(random%300))
anim = ifelse(random<200, 7181, 7180)
;anim = ifelse(random<200, 7181, 6029)
sprpriority = ifelse(random<500, 3, -5)
postype = p1
pos = 0+ifelse(anim=3060,30,0)+ifelse(anim=3051,30-animelemtime(1),0)+ifelse(anim=3000 && animelemtime(38)>=0,15,0)+ifelse(anim=1002,30-animelemtime(3),0)+ifelse(anim=1001,10,0), -60 + ifelse(statetype=C,30,0)
random = 50, 50
ID = 8913
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
scale = 0.125+0.0001*(random%625), 0.125+0.0001*(random%625)
ownpal = 1
ignorehitpause = 1
supermovetime = -1

[State 3025, particles]
type = explod
triggerall = stateno != [1251110,1251113]
trigger1 = movetype != H
trigger1 = anim != 187
trigger1 = var(1) = 4 && stateno != 4901
trigger2 = var(1) = 2
trigger2 = stateno = 4900 || stateno = 4902
trigger3 = stateno = 188
trigger3 = var(1) = 4
trigger3 = anim = 187 && animelemtime(2)>0
trigger4 = anim = [120,152]
trigger4 = var(1) = 4 
vel = 0, -1 -(random / 1000.0)
accel = 0, 0.150- (0.001*(random%300))
anim = 6029
sprpriority = -5
postype = p1
pos = 0+ifelse(anim=3060,30,0)+ifelse(anim=3051,30-animelemtime(1),0)+ifelse(anim=3000 && animelemtime(38)>=0,15,0)+ifelse(anim=1002,30-animelemtime(3),0)+ifelse(anim=1001,10,0), -60 + ifelse(statetype=C,30,0)
random = 50, 50
ID = 8913
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
;scale = 0.25+0.0002*(random%625), 0.25+0.0002*(random%625
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
supermovetime = -1

[State 3025, particles]
type = explod
triggerall = stateno != [1251110,1251113]
trigger1 = stateno = 4901
vel = 0, 20 +(random / 1000.0)
pos = 0+ifelse(anim=3060,40,0), 0.150- (0.001*(random%300))
anim = 6029
sprpriority = -5
postype = p1
pos = 0, -60
random = 50, 50
ID = 8913
facing = -1 + (random < 500) * 2
vfacing = -1 + (random < 500) * 2
;scale = 0.25+0.0002*(random%625), 0.25+0.0002*(random%625)
scale = 0.5, 0.5
ownpal = 1
ignorehitpause = 1
supermovetime = -1


[State 182, VarSet]
type = VarSet
trigger1 = win && var(1) = 1
var(10) = 1 +(random%10)
ignorehitpause = 1
persistent = 1
[State 182, VarSet]
type = VarSet
trigger1 = win && var(1) = 2
var(10) = 1 +(random%10)
ignorehitpause = 1
persistent = 1
[State 182, VarSet]
type = VarSet
trigger1 = win && var(1) = 3
var(10) = 1 +(random%10)
ignorehitpause = 1
persistent = 1

[State 6000, Shin mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 37 || fvar(3) = 34
trigger1 = var(39) = 1 && life = 0
trigger1 = var(0) = [1,12]
var(39)= 2
[State 6000, Shin mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 14
trigger1 = var(39) = 1 && life = 0
trigger1 = var(0) = [1,12]
var(39)= 6
[State 6000, Shin mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 34
trigger1 = var(39) = 0 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 6
[State 6000, Shin mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 14
trigger1 = var(39) = 7 && life = 0
trigger1 = var(0) = [1,12]
var(39)= 2
[State 6000, Shin mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 34 
trigger1 = var(39) = 7 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 3
[State 6000, Oni mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 37 || fvar(3) = 34
trigger1 = var(39) = 2 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 3
[State 6000, Oni mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 34
trigger1 = var(39) = 0 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 8
[State 6000, Oni mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 34
trigger1 = var(39) = 9 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 3
[State 6000, ... sample text]
type = varset
triggerall = fvar(3) = 37
triggerall = var(39) = 5 && life = 0
trigger1 = var(0) = [37,49]
trigger2 = var(0) = 68
var(39)= 4
[State 6000, ... sample text]
type = varset
triggerall = fvar(3) = 34
triggerall = var(39) = 3 && life = 0
trigger1 = var(0) = [13,24]
trigger2 = var(0) = 68
var(39)= 4
[State 6000, ... sample text]
type = varset
triggerall = fvar(3) = 14
triggerall = var(39) = 2 && life = 0
trigger1 = var(0) = [25,36]
var(39)= 4
[State 6000, ... sample text]
type = varset
triggerall = fvar(3) = 37
triggerall = var(39) = 3 && life = 0
trigger1 = var(0) = [13,24]
var(39)= 4
[State 6000, Shin Oni mode]
type = varset
triggerall = !matchover
triggerall = fvar(3) = 37
triggerall = var(1) != 4
trigger1 = life = 0 && enemy, life >= ((enemy, lifemax /10) * 9)
;trigger2 = var(39) = 3 && life = 0
;trigger2 = var(0) = [13,24]
var(39)= 5

[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
source = 4050, 1
dest = 4050, fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
source = 4050, 1
dest = 4050, fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
source = 4051, 1
dest = 4051, fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [1,3] 
trigger2 = fvar(1) = [7,9]
trigger3 = fvar(1) = [13,15]
trigger4 = fvar(1) = [19,21]
trigger5 = fvar(1) = [25,27]
trigger6 = fvar(1) = [31,33]
source = 4050, 4
dest = 4050, fvar(1) + 3
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [4,6]
trigger2 = fvar(1) = [10,12]
trigger3 = fvar(1) = [16,18]
trigger4 = fvar(1) = [22,24]
trigger5 = fvar(1) = [28,30]
trigger6 = fvar(1) = [34,36]
source = 4050, 4
dest = 4050, fvar(1) - 3
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [37,49]
source = 4050, 4
dest = 4050, fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [1,3] 
trigger2 = fvar(1) = [7,9]
trigger3 = fvar(1) = [13,15]
trigger4 = fvar(1) = [19,21]
trigger5 = fvar(1) = [25,27]
trigger6 = fvar(1) = [31,33]
source = 4051, 4
dest = 4051, fvar(1) + 3
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [4,6]
trigger2 = fvar(1) = [10,12]
trigger3 = fvar(1) = [16,18]
trigger4 = fvar(1) = [22,24]
trigger5 = fvar(1) = [28,30]
trigger6 = fvar(1) = [34,36]
source = 4051, 4
dest = 4051, fvar(1) - 3
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
triggerall = stateno != 195
trigger1 = fvar(1) = [37,49]
source = 4051, 4
dest = 4051, fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [1,6]
source = 4050, 25
dest = 4050, 24+fvar(1)
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [7,12]
source = 4050, 25
dest = 4050, 24+fvar(1)-6
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [13,18]
source = 4050, 25
dest = 4050, 24+fvar(1)-12
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [19,24]
source = 4050, 25
dest = 4050, 24+fvar(1)-18
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [25,30]
source = 4050, 25
dest = 4050, 24+fvar(1)-24
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [31,36]
source = 4050, 25
dest = 4050, 24+fvar(1)-30
[State 6000, Energy]
type = remappal
triggerall = stateno != [4900,4902]
trigger1= stateno != 195
trigger1 = fvar(1) = [37,49]
source = 4050, 25
dest = 4050, 49
;[State 6000, Energy]
;type = remappal
;trigger1 = fvar(1) = [4,6]
;trigger2 = fvar(1) = [10,12]
;trigger3 = fvar(1) = [16,18]
;trigger4 = fvar(1) = [22,24]
;trigger5 = fvar(1) = [28,30]
;trigger6 = fvar(1) = [34,36]
;source = 4050, 25
;dest = 4050, 30-ifelse(fvar(1) = [1,6], fvar(1), ifelse(fvar(1) = [7,12], fvar(1)-6, ifelse(fvar(1) = [13,18],fvar(1)-12, ifelse(fvar(1)=[19,24], fvar(1)-18, ifelse(fvar(1) = [25,30], fvar(1)-24, ifelse(fvar(1)=[31,36], fvar(1)-30,0))))))
;[State 6000, Energy]
;type = remappal
;trigger1 = fvar(1) = [37,49]
;source = 4050, 25
;dest = 4050, 49
;dest = 4050, ifelse(fvar(1)=1, 7, ifelse(fvar(1)=2, 5, ifelse(fvar(1)=3, 6, ifelse(fvar(1)=5, 2, ifelse(fvar(1)=8, 11, ifelse(fvar(1)=9, 12, ifelse(fvar(1)=10, 13, ifelse(fvar(1)=11, 8, ifelse(fvar(1)=12, 9, ifelse(fvar(1)=13, 10, ifelse(fvar(1)=14, 16, ifelse(fvar(1)=15, 18, ifelse(fvar(1)=16, 14, ifelse(fvar(1)=17, 19, ifelse(fvar(1)=18, 15, ifelse(fvar(1)=19, 17, ifelse(fvar(1)=20, 22, ifelse(fvar(1)=21, 24, ifelse(fvar(1)=22, 20, ifelse(fvar(1)=23, 25, ifelse(fvar(1)=24, 21, ifelse(fvar(1)=25, 23, 4)))))))))))))))))))))) 

[State -2, varset]
type = varadd
triggerall = numhelper(8991)
trigger1 = command = "fwd"
var(0) = ifelse(var(0)=70, -69, 1)
[State -2, varset]
type = varadd
triggerall = numhelper(8991)
trigger1 = command = "back"
var(0) = ifelse(var(0)=1, 69, -1)
[State -2, varset]
type = varadd
triggerall = numhelper(8991)
trigger1 = command = "up"
fvar(1) = ifelse(fvar(1)=49, -48, 1)
[State -2, varset]
type = varadd
triggerall = numhelper(8991)
trigger1 = command = "down"
fvar(1) = ifelse(fvar(1)=1, 48, -1)

[State 6000, Kanji]
type = remappal
trigger1 = 1
source = 4050, 50
dest = 4050, ifelse(fvar(2) = 1, 51, ifelse(fvar(2) = 2, 49, ifelse(fvar(2) = 3, fvar(1), 50)))
[state -2, Palette Selection]
type = remappal
trigger1 = stateno != [4900,4902]
trigger1 = stateno != 195
source = 1, 4
dest = 1, var(0)
;
;;1000 Life
;[State -2, Defence Levels]
;type = defencemulset
;trigger1 = 1
;value = 0.6 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
;ignorehitpause = 1

;1110 Life
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 2 ;2
value = 0.727272727272 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1

;900 Life
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 3 ; 3
value = 0.888888888 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1

;1200 Life
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 4
value = 0.6666666666 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1

;1000 Life
[State -2, Defence Levels]
type = defencemulset
trigger1 = var(1) = 5
value = 0.800000000001 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
ignorehitpause = 1
[State -2, Hit Detection]
type = VarSet
trigger1 = MoveContact = 1 && var(30) < 0
var(30) = HitPauseTime
ignoreHitPause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 2, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Hit Sparks]
type = Helper
triggerAll = ((StateNo != [1200,1260]) && (StateNo != [3200,3250])) || ((StateNo = [1200,1260]) && P2Dist x >= 0) || ((StateNo = [3200,3250]) && P2Dist x >= 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014 || var(33) = 8015 || var(33) = 8017 || var(33) = 8018 || var(33) = 8019 || var(33) = 8001
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
size.xscale = 1
size.yscale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Hit Sparks (Tatsumaki's, Opponent Behind)]
type = Helper
triggerAll = ((StateNo = [1200,1260]) && P2Dist x < 0) || ((StateNo = [3900,3950]) && P2Dist x < 0)
triggerAll = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && NumEnemy
trigger1 = var(33) = 8010 || var(33) = 8011 || var(33) = 8012 || var(33) = 8013 || var(33) = 8014
trigger2 = MoveGuarded = 1 && NumEnemy
trigger2 = var(34) = 8000 || var(34) = 8001
helperType = Normal
stateNo = ifElse(MoveGuarded, var(34), var(33))
ID = 8000
name = "Spark"
postype = P1
pos = ifelse(stateno = 3250, -43,ifElse(P2Dist x >= 0, 0, ifElse(P2Dist x >= var(35), ceil(P2Dist x), var(35)))), var(36)
facing = 1
ownPal = 1
size.xscale = 1
size.yscale = 1
pauseMoveTime = 65535
superMoveTime = 65535
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(29)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarSet
trigger1 = 1
var(30) = -1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

;[State -2, Counter FX]
;type = helper
;trigger1 = !numhelper(7400) && var(29)
;trigger1 = movehit = 1 && numtarget && !(hitdefattr = SCA, AT)
;helpertype = normal
;stateno = 7400
;ID = 7400
;name = "Counter"
;postype = left
;;pausemovetime = 255
;supermovetime = 255
;ignorehitpause = 1
[State 0, RemoveExplod]
type = RemoveExplod
trigger1 = stateno != 213 && stateno != 4902
id = 214
ignorehitpause = 1
persistent = 1

[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Super Finish Detection]
type = VarSet
triggerAll = !(Enemy, Alive)
trigger1 = StateNo = 3120
var(11) = 1
ignoreHitPause = 1

[State -2, Hit Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA, AT)
var(13) = 1

[State -2, Hit Count Reset]
type = VarSet
trigger1 = NumEnemy && var(13)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(13) = 0
ignoreHitPause = 1

[State -2, Juggle Count]
type = VarAdd
trigger1 = MoveHit = 1
trigger1 = !(HitDefAttr = SCA,AT)
var(15) = 1

[State -2, Juggle Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(15)
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Juggle Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(15)
trigger1 = (EnemyNear(0), StateType != A) && (EnemyNear(0), Time >= 1)
trigger2 = (EnemyNear(0), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), StateType != A) && (EnemyNear(0), Time >= 1)
trigger4 = (EnemyNear(1), MoveType != H) || (EnemyNear(0), StateNo = [120,155]) || (EnemyNear(0), Ctrl)
var(15) = 0
ignoreHitPause = 1

[State -2, Free Juggling]
type = VarSet
trigger1 = RoundState != 2
trigger2 = var(20)>0
var(15) = 0
ignoreHitPause = 1

[State -2, Normal Atk Juggle Count]
type = VarAdd
triggerall = !var(20)
trigger1 = var(27)
trigger1 = (Stateno = [200, 285])
trigger1 = Stateno!= 265
trigger1 = MoveHit = 1
var(15) = 9

[State -2, Tatsumaki Juggle Reset]
type = VarSet
triggerall = NumEnemy = 1 && var(27)
triggerall = !(Enemy, Stateno = [1111310,1111315])
trigger1 = (Enemy, StateType != A) && (Enemy, StateNo != [5100,5109]) && (Enemy, Time >= 1)
trigger2 = (Enemy, MoveType != H) || (Enemy, StateNo = [120,155]) || (Enemy, Ctrl)
var(27) = 0

[State -2, Juggle Flag]
type = VarSet
trigger1 = NumEnemy && !var(16)
trigger1 = (EnemyNear, StateNo = 5040) && !(EnemyNear, Ctrl)
var(16) = 1
ignorehitpause = 1

[State -2, Juggle Flag Reset Single]
type = VarSet
triggerAll = NumEnemy = 1 && var(16)
trigger1 = (Enemy, MoveType != H) && (Enemy, StateNo != 5040)
trigger2 = !(Enemy, HitShakeOver) || (Enemy, StateType = L) || (Enemy, Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Juggle Flag Reset Simul]
type = VarSet
triggerAll = NumEnemy >= 2 && var(16)
trigger1 = (EnemyNear(0), MoveType != H) && (EnemyNear(0), StateNo != 5040)
trigger2 = !(EnemyNear(0), HitShakeOver) || (EnemyNear(0), StateType = L) || (EnemyNear(0), Ctrl)
trigger3 = (EnemyNear(1), MoveType != H) && (EnemyNear(1), StateNo != 5040)
trigger4 = !(EnemyNear(1), HitShakeOver) || (EnemyNear(1), StateType = L) || (EnemyNear(1), Ctrl)
var(16) = 0
ignoreHitPause = 1

[State -2, Modified Juggle Count Reset]
type = VarSet
trigger1 = NumEnemy && var(17)
trigger1 = (EnemyNear, MoveType != H) && (EnemyNear, StateNo != 5300)
var(17) = 0
ignoreHitPause = 1

[State -2, Original Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1



[State -2, Original Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1



[State -2, Original Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, movetype != H
trigger1 = enemynear, stateno != 140
trigger1 = (enemynear, ctrl && enemynear, time >= 1) || (enemynear, time >= 8)
trigger2 = enemynear, movetype = A
trigger3 = (enemynear, stateno != [0, 52]) && (enemynear, stateno != [120, 155]) && (enemynear, stateno != [5000, 5120])
var(38) = 0
[State -2, Throws Disallowed]
type = varset
triggerall = numenemy
trigger1 = enemynear, stateno = [150, 155]
trigger2 = (enemynear, stateno = 51 || enemynear, stateno = 140) && (enemynear, prevstateno = [150, 155])
trigger3 = enemynear, movetype = H && enemynear, statetype != A && !var(20)
trigger4 = (enemynear, stateno = [5020, 5040]) && enemynear, hitfall = 0
trigger5 = enemynear, stateno = 40 && enemynear, prevstateno != 52 && (enemynear, anim != [0, 29])
var(38) = 1
ignorehitpause = 1

[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy
fvar(10) = ifelse(enemynear, gethitvar(hitcount) < 3, 24, ifelse(enemynear, gethitvar(hitcount) >= 24, 2, 26 - enemynear, gethitvar(hitcount))) / 24.0
ignorehitpause = 1
[State -2, attackvarbyhits]
type = varset
trigger1 = numenemy && var(20)
fvar(10) = 0.72 * (10 -ifelse(enemynear, gethitvar(hitcount) >= 10, 10, enemynear, gethitvar(hitcount))) / 10.0
ignorehitpause = 1
[State -2, attackvarbyhitsreset]
type = varset
trigger1 = numenemy
trigger1 = (enemynear, movetype != H)
trigger2 = !numenemy
fvar(10) = ifelse(var(20), 0.72, 1)
ignorehitpause = 1
[State -2, attackvarbyhits]
type = VarSet
trigger1 = (stateNo = [3000,4999])
fvar(10) = ifelse(var(22), 0.6, ifelse(var(21) || var(23), 0.8, 1.0))
ignoreHitPause = 1
[State -2, dampenervar]
type = varset
trigger1 = 1
fvar(12) = ((fvar(10) + (var(29) * 0.2)) * 1.1) + ((const(data.attack)*0.005) * (var(37) > 0));+ 0.5*(var(37) > 0)
ignorehitpause = 1

[State -2, dampener]
type = attackmulset
trigger1 = 1
value = fvar(12)
ignorehitpause = 1

;[State -2, Defence Levels]
;type = lifeadd
;trigger1 = !AIlevel
;trigger1 = var(1) = 1
;trigger1 = gethitvar(hitcount) = 1 && gethitvar(damage)
;value = -ceil(0.125 * gethitvar(damage))
;kill = 0
;ignorehitpause = 1
;[State -2, Defence Levels]
;type = defencemulset
;trigger1 = !AIlevel
;trigger1 = var(1) = 1
;value = 1.125 * (const(data.fall.defence_mul) ** gethitvar(fallcount))
;ignorehitpause = 1

[State -2, VarSet]
type = VarSet
trigger1 = stateno!= 52
trigger1 = !(stateno = [3000,4999])
var(23) = 0
ignorehitpause = 1

[State -2, attackincreasereset]
type = varset
triggerall = var(37)
trigger1 = !hitdefattr=SCA,AT
trigger1 = movecontact || movereversed
trigger1 = stateno != 1900
trigger2 = helper, movecontact
trigger3 = prevstateno = 1331 || prevstateno = 1321 || prevstateno = 4001 || prevstateno = 4004 || prevstateno = 860 || prevstateno = 825 || prevstateno = 820 || prevstateno = 815 || prevstateno = 810 || prevstateno = 805
;trigger3 = !time
var(37) = 0
ignorehitpause = 1

[State -2, Hit Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveHit = 1 && var(31) >= 0
value = 2, var(31)
channel = 2
ignoreHitPause = 1

[State -2, Guard Sound]
type = PlaySnd
trigger1 = MoveContact = 1 && var(30) = HitPauseTime
trigger1 = MoveGuarded = 1 && var(32) >= 0
value = 2, var(32)
channel = 2
ignoreHitPause = 1

[State -2, Counter FX]
type = Helper
trigger1 = MoveHit = 1 && var(30) = HitPauseTime
trigger1 = NumEnemy && var(29)
trigger1 = !(HitDefAttr = SCA, AT) && (EnemyNear, MoveReversed != 1)
helperType = Normal
stateNo = 8290
ID = 8290
name = "Counter FX"
posType = P1
pos = ceil(ifElse(P2Dist x < 0, 0, ifElse(P2Dist x < var(35), ceil(P2Dist x), var(35))) * const(size.xScale)), ceil(var(36) * const(size.yScale))
facing = -1
ownPal = 1
pauseMoveTime = 255
superMoveTime = 255
ignoreHitPause = 1

[State -2, Hit Detection]
type = VarRangeSet
trigger1 = MoveType = I
trigger2 = MoveType = H && Time
first = 30
last = 36
value = -1
ignoreHitPause = 1

[State -2, P2 OTG Recovery]
type = targetstate
trigger1 = (stateno = [200, 299])
trigger1 = movehit = 1 && numtarget
trigger1 = (target, stateno = 5080) && (target, alive) && (target, gethitvar(yvel) < 0)
value = 5085
ignorehitpause = 1

[State -2, P2 Facing]
type = targetfacing
trigger1 = movecontact = 1 && numtarget
trigger1 = !(target, hitshakeover) && !(target, hitfall) && (target, time <= 1)
value = ifelse(p2dist x >= 0, -1, 1)
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

;[State -2, Counter FX]
;type = helper
;trigger1 = !numhelper(7400) && var(29)
;trigger1 = movehit = 1 && numtarget && !(hitdefattr = SCA, AT)
;helpertype = normal
;stateno = 7400
;ID = 7400
;name = "Counter"
;postype = left
;pausemovetime = 255
;supermovetime = 255
;ignorehitpause = 1
[State -2, Counter Flag]
type = varset
trigger1 = numenemy
var(29) = (enemynear, movetype = A)
ignorehitpause = 1

[State -2, Original Combo End]
type = varset
trigger1 = var(20) < 0
trigger2 = movetype = H
trigger3 = roundstate != 2
var(20) = 0
ignorehitpause = 1
[State -2, Original Combo Time]
type = varadd
trigger1 = var(20) > 0
var(20) = -1
ignorehitpause = 1

[State -2, No dizzy]
type = selfstate
triggerall = var(1) != 1
trigger1 = anim = 5300
trigger1 = numenemy && !pos y
trigger1 = enemynear, movetype != A
trigger1 = ((enemy, name = "Catwalk") + (enemy, authorname = "Phantom.of.the.Server")) != 2
value = 0
ctrl = 1



[State -2, OTG]
type = varset
trigger1 = p2statetype = L
var(24) = 1
ignorehitpause = 1
[State -2, OTG]
type = varset
trigger1 = movecontact = 1 && p2statetype != L
trigger2 = p2statetype != A && p2statetype != L
var(24) = 0
ignorehitpause = 1

[State -2, Free Juggling]
type = assertspecial
trigger1 = var(20) > 0 || var(24) || numtarget(3300)
trigger2 = roundstate != 2
flag = nojugglecheck
ignorehitpause = 1
[State -2, Original Combo Guard]
type = assertspecial
trigger1 = var(20) > 0
flag = nostandguard
flag2 = nocrouchguard
flag3 = noairguard
ignorehitpause = 1

[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) > 60
time = 2
add = 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32), 32 + ceil(sin(var(20) / 16.0 * pi) * 32)
ignorehitpause = 1
[State -2, Original Combo PalFX]
type = palfx
trigger1 = var(20) = [1, 60]
time = 2
add = 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64), 64 + ceil(sin(var(20) / 8.0 * pi) * 64)
ignorehitpause = 1


[State -2, Snd]
type = stopsnd
trigger1 = !time && prevstateno = 187
channel = 4

[State -2, KO snd]
type = varset
trigger1 = alive && var(8) > 0
trigger2 = !alive && var(8) < 2
var(8) = ifelse(alive, 0, var(8) + 1)
ignorehitpause = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2 || var(1)=4), 3, 1)
ignorehitpause = 1
volume = 255
persistent = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2 || var(1)=4), 3, 1)
ignorehitpause = 1
volume = 255
persistent = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2 || var(1)=4), 3, 1)
ignorehitpause = 1
volume = 255
persistent = 1
[State -2, KO snd]
type = playsnd
trigger1 = !alive && var(8) = 1
trigger1 = var(8) := 2
value = 11, ifelse((var(1) = 2 || var(1)=4), 3, 1)
ignorehitpause = 1
volume = 255
persistent = 1

[State -2, Voice Pos]
type = sndpan
trigger1 = 1
channel = 0
pan = 0
ignorehitpause = 1

[State -2, Debug]
type = displaytoclipboard
trigger1 = 1
text = "AI = %d"
params = AIlevel
ignorehitpause = 1

[State -2, Debug]
type = appendtoclipboard
trigger1 = 1
text = "\nBy Mr. Ansatsuken - http://ansatsukenmugen.webs.com/ \n\Enjoy! :D"
ignorehitpause = 1


;===========================================================================
;===============================< -3 STATES >=================================
;===========================================================================
[Statedef -3]

;===========================================================================
; MOVE ENABLE FLAGS - Initialize on round start
; MUGEN doesn't support Statedef -4, so this goes in Statedef -3
; These vars enable all moves in moricmd.cns (map() -> var() conversion)
; FIXED: MUGEN VarSet only supports ONE var per state controller!
;===========================================================================

[State -3, Init var(66)]
type = VarSet
trigger1 = RoundState = 0
var(66) = 1
ignorehitpause = 1

[State -3, Init var(67)]
type = VarSet
trigger1 = RoundState = 0
var(67) = 1
ignorehitpause = 1

[State -3, Init var(68)]
type = VarSet
trigger1 = RoundState = 0
var(68) = 1
ignorehitpause = 1

[State -3, Init var(69)]
type = VarSet
trigger1 = RoundState = 0
var(69) = 1
ignorehitpause = 1

[State -3, Init var(70)]
type = VarSet
trigger1 = RoundState = 0
var(70) = 1
ignorehitpause = 1

[State -3, Init var(71)]
type = VarSet
trigger1 = RoundState = 0
var(71) = 1
ignorehitpause = 1

[State -3, Init var(72)]
type = VarSet
trigger1 = RoundState = 0
var(72) = 1
ignorehitpause = 1

[State -3, Init var(73)]
type = VarSet
trigger1 = RoundState = 0
var(73) = 1
ignorehitpause = 1

[State -3, Init var(74)]
type = VarSet
trigger1 = RoundState = 0
var(74) = 1
ignorehitpause = 1

[State -3, Init var(75)]
type = VarSet
trigger1 = RoundState = 0
var(75) = 1
ignorehitpause = 1

[State -3, Init var(76)]
type = VarSet
trigger1 = RoundState = 0
var(76) = 1
ignorehitpause = 1

[State -3, Init var(77)]
type = VarSet
trigger1 = RoundState = 0
var(77) = 1
ignorehitpause = 1

[State -3, Init var(78)]
type = VarSet
trigger1 = RoundState = 0
var(78) = 1
ignorehitpause = 1

[State -3, Init var(79)]
type = VarSet
trigger1 = RoundState = 0
var(79) = 1
ignorehitpause = 1

[State -3, Init var(80)]
type = VarSet
trigger1 = RoundState = 0
var(80) = 1
ignorehitpause = 1

[State -3, Init var(81)]
type = VarSet
trigger1 = RoundState = 0
var(81) = 1
ignorehitpause = 1

[State -3, Init var(82)]
type = VarSet
trigger1 = RoundState = 0
var(82) = 1
ignorehitpause = 1

[State -3, Init var(83)]
type = VarSet
trigger1 = RoundState = 0
var(83) = 1
ignorehitpause = 1

[State -3, Init var(84)]
type = VarSet
trigger1 = RoundState = 0
var(84) = 1
ignorehitpause = 1

[State -3, Init var(85)]
type = VarSet
trigger1 = RoundState = 0
var(85) = 1
ignorehitpause = 1

[State -3, Init var(86)]
type = VarSet
trigger1 = RoundState = 0
var(86) = 1
ignorehitpause = 1

[State -3, Init var(90)]
type = VarSet
trigger1 = RoundState = 0
var(90) = 1
ignorehitpause = 1

[State -3, Init var(91)]
type = VarSet
trigger1 = RoundState = 0
var(91) = 1
ignorehitpause = 1

[State -3, Init var(92)]
type = VarSet
trigger1 = RoundState = 0
var(92) = 1
ignorehitpause = 1

[State -3, Init var(93)]
type = VarSet
trigger1 = RoundState = 0
var(93) = 1
ignorehitpause = 1

[State -3, Init var(94)]
type = VarSet
trigger1 = RoundState = 0
var(94) = 1
ignorehitpause = 1

[State -3, Init var(95)]
type = VarSet
trigger1 = RoundState = 0
var(95) = 1
ignorehitpause = 1

[State -3, Init var(96)]
type = VarSet
trigger1 = RoundState = 0
var(96) = 1
ignorehitpause = 1

[State -3, Init var(97)]
type = VarSet
trigger1 = RoundState = 0
var(97) = 1
ignorehitpause = 1

[State -3, Init var(102)]
type = VarSet
trigger1 = RoundState = 0
var(102) = 1
ignorehitpause = 1

[State -3, Init var(103)]
type = VarSet
trigger1 = RoundState = 0
var(103) = 1
ignorehitpause = 1

[State -3, Init var(104)]
type = VarSet
trigger1 = RoundState = 0
var(104) = 1
ignorehitpause = 1

[State -3, Init var(109)]
type = VarSet
trigger1 = RoundState = 0
var(109) = 1
ignorehitpause = 1

[State -3, Init var(118)]
type = VarSet
trigger1 = RoundState = 0
var(118) = 1
ignorehitpause = 1

[State -3, Gametime Var]
type = varset
trigger1 = 1
var(58) = gametime
ignorehitpause = 1

[State -3, Shadows]
type = afterimage
triggerall = time = 1 && !var(20)
trigger1 = stateno = 50 && var(9) = 3
trigger2 = stateno = [710, 720]
trigger3= stateno = 1450
time = 2
timegap = 1
framegap = 4
length = 9
palbright = 0, 0, 0
paladd = 0, 0, 0
palmul = 0.9, 0.9, 0.9
palcontrast = 120, 120, 120
palpostbright = 0, 0, 0
trans = add1



[State -3, Lv5 Shadows]
type = afterimage
triggerall = var(10) = 5
trigger1 = stateno = [3000,4999]
trigger1 = time = 1
time = 2
timegap = 1
framegap = 1
length = 21
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1

[State -3, Level 1 Super AfterImage]
type = AfterImage
triggerall = var(10) = 1
trigger1 = stateno = [3000,3999]
trigger1 = time = 1
trigger2 = stateno = [4100,4999]
trigger2 = time = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 128,128,128
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 2 Super AfterImage]
type = AfterImage
triggerall = var(10) = 2
trigger1 = stateno = [3000,3999]
trigger1 = time = 1
trigger2 = stateno = [4100,4999]
trigger2 = time = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 32,32,160
palPostBright = 0,0,0
palAdd = 0,0,0
palMul = 0.75,0.75,0.75
trans = Add1

[State -3, Level 3 Super AfterImage]
type = AfterImage
triggerall = var(10) = 3
trigger1 = stateno = [3000,3999]
trigger1 = time = 1
trigger2 = stateno = [4100,4999]
trigger2 = time = 1
time = 2
timeGap = 1
frameGap = 10
length = 21
palBright = 0,0,0
palContrast = 160,32,32
palPostBright = 0,0,0
palAdd = 0,0,0
palMul= 0.75,0.75,0.75
trans = Add1



[State -3, Lv5 Shadows]
type = afterimage
trigger1 = stateno = 1400 && time = 1
;trigger2 = stateno = 1301 && time = 1
trigger2 = stateno = 360 && time = 1
trigger3 = stateno = 358 && time = 1
trigger4 = stateno = 4000 && time = 1
trigger5 = stateno = 4005 && time = 1
trigger6 = stateno = 188 && time = 1
time = 2
timegap = 1
framegap = 1
length = 12
palbright = 75, 75, 75
paladd = 0, 0, 0
palmul = 0.75, 0.75, 0.75
palcontrast = 160, 32, 32
palpostbright = 0, 0, 0
trans = add1





[State -3, AfterImagePersist]
type = afterimagetime
trigger1 = stateno = 50 && var(9) = 3 && vel y < -1
trigger2 = (stateno = [3000, 4999])
trigger3 = (stateno = [710, 720]) || stateno = 1400 || stateno = [350,370]
trigger4 = stateno = 192 && animelemtime(2) < 0
trigger5 = anim = 183 + ifelse(var(55)=1,10000,0)
time = 2

[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = numtarget
trigger1 = target, hitover || (target, gethitvar(hitshaketime) > 0 && target, time <= 0)
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = movecontact = 1 && numtarget
fvar(5) = target, gethitvar(xvel)
ignorehitpause = 1
[State -3, Corner Push]
type = posadd
triggerall = fvar(5)
triggerall = (statetype = S || statetype = C) && numtarget
triggerall = !hitpausetime && target, gethitvar(hitshaketime) <= 0
triggerall = (target, statetype = S || target, statetype = C) && !(target, gethitvar(yvel)) && !(target, hitfall)
trigger1 = target, frontedgebodydist <= abs(target, vel x)
trigger1 = (target, gethitvar(xvel) * target, facing) > 0
trigger2 = target, backedgebodydist <= abs(target, vel x)
trigger2 = (target, gethitvar(xvel) * target, facing) < 0
x = ifelse(target, frontedgebodydist <= 0, -1, 1) * (target, facing) * fvar(5)
[State -3, Corner Push]
type = varset
trigger1 = fvar(5)
trigger1 = abs(fvar(5)) < 1.0
fvar(5) = 0
[State -3, Corner Push]
type = varset
trigger1 = numtarget
trigger1 = target, gethitvar(hitshaketime) <= 0
fvar(5) = fvar(5) * 0.85

[State -3, Underground Juggle Prevention]
type = targetbind
trigger1 = movecontact = 1
trigger1 = numtarget && numenemy
trigger1 = (target, time = 0) && (target, ID = enemynear, ID)
trigger1 = !(target, hitshakeover) && (target, pos y > 0)
pos = ceil(p2dist x), ceil(-pos y)
ignorehitpause = 1

[State -3, Prevent Crossup]
type = width
trigger1 = movetype != H
edge = 8, 0
ignorehitpause = 1

[State -3, Variable Height]
type = playerpush
triggerall = statetype = A && movetype != H && numenemy = 1
triggerall = p2bodydist x = [ -(enemynear, const(size.ground.back) + enemynear, const(size.ground.front)) , 0]
trigger1 = p2statetype = S
trigger1 = p2dist y >= (enemynear, const(size.height) - 30)
trigger2 = p2statetype = C
trigger2 = p2dist y >= (enemynear, const(size.height) - 56)
trigger3 = p2statetype = L
trigger3 = p2dist y >= 12
value = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
triggerall = stateno = 5000 || stateno = 5010
trigger1 = gethitvar(animtype) >= 2 && random < 500
trigger2 = gethitvar(animtype) = 1 && random < 375
trigger3 = gethitvar(animtype) = 0 && random < (250 * (AIlevel ** 2 / 64.0))
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, GetHit Snd]
type = playsnd
triggerall = alive && time = 1
trigger1 = (stateno = 5000 || stateno = 5010) && numenemy
trigger1 = gethitvar(fall) || (enemynear, hitdefattr = SCA, SA, HA)
trigger2 = (stateno = 5020 || stateno = 5070 || stateno = 5080)
trigger3 = (stateno = 5050 || stateno = 5100) && (prevstateno != [5000, 5199])
value = 5000, 1 + (random % 5)
channel = 0
ignorehitpause = 1

[State -3, NoWalk after Parry]
type = assertspecial
trigger1 = prevstateno = 700
trigger1 = stateno = 0 && time < 7
flag = nowalk

[State -3, Collapse]
type = changestate
trigger1 = !alive && (stateno = [5000, 5030])
trigger1 = (prevstateno = [130, 131]) || (prevstateno = [140, 141]) || (prevstateno = [150, 153])
value = 5130

[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(7600) && stateno != [4901,4905] 
triggerall = stateno != [4305,4306]
triggerall = stateno != [4700,4701]
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = [3000, 4999])
trigger2 = numhelper(3005)
trigger2 = helper(3005), var(3)
trigger3 = numhelper(3055)
trigger3 = helper(3055), var(3)
trigger4 = numhelper(3075)
trigger4 = helper(3075), var(3)
trigger5 = numhelper(4105)
trigger5 = helper(4105), var(3)
trigger6 = numhelper(4106)
trigger6 = helper(4106), var(3)
trigger7 = numhelper(4205)
trigger7 = helper(4205), var(3)
trigger8 = numhelper(4206)
trigger8 = helper(4206), var(3)
trigger9 = numhelper(3065)
trigger9 = helper(3065), var(3)
trigger10 = numhelper(3015)
trigger10 = helper(3015), var(3)
trigger11 = numhelper(4095)
trigger11 = helper(4095), var(3)
trigger12 = numhelper(3095)
trigger12 = helper(3095), var(3)
trigger13 = numhelper(4905)
trigger13 = helper(4905), var(3)
trigger14 = stateno = [4401,4405]
trigger15= numhelper(3085)
trigger15 = helper(3085), var(3)
trigger16= numhelper(3035)
trigger16 = helper(3035), var(3)
helpertype = normal
stateno = 7600
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999


[State -3, Super Finish]
type = helper
triggerall = winKO
triggerall = roundstate = 3 && !numhelper(7600)
trigger1 = (movehit = [1, 4]) && numtarget && (stateno = [3000, 4999])
trigger2 = stateno = [4901,4905]
trigger3 = stateno = 4001
trigger4 = stateno = 4004
trigger5 = stateno = [4305,4306]
trigger6 = stateno = [4500,4509]
trigger7 = stateno = [4700,4701]
trigger8= numhelper(3036)
trigger8 = helper(3036), var(3)
helpertype = normal
stateno = 7605
ID = 7600
name = "KO FX"
postype = left
pos = 160, -120
ownpal = 1
ignorehitpause = 1
pausemovetime = 999
supermovetime = 999

