-- 🔥💀🔥 FIXED data_sav.lua FOR CO-OP 🔥💀🔥
-- Copy this to: /home/user/Ultimate-Smashbox/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/saved/data_sav.lua

data.lifeMul = 160
data.team1VS2Life = 180
data.turnsRecoveryRate = 100
data.teamLifeShare = false
data.zoomActive = true
data.zoomMin = 0.75
data.zoomMax = 1.1
data.zoomSpeed = 1
data.roundTime = 321
data.numTurns = 4
data.numSimul = 4
data.simulType = 'Tag'
data.disablePadP1 = false
data.disablePadP2 = false
data.difficulty = 5  -- FIXED: Was 7, causing AI overload in tag mode
data.continueCount = 0
data.contSelection = false
data.aiRamping = true
data.autoguard = false
data.vsDisplayWin = true
data.saveReplay = false
data.debugKeys = false
data.quickVS = false
data.firstRun = false
data.lifebar = 'data/screenpack/fightSD.def'  -- FIXED: Added missing lifebar setting
data.usx = 'Unlimited Edition'  -- FIXED: Added missing edition setting (prevents script/main.lua:778 crash)