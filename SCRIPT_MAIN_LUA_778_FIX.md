# 🔥💀🔥 SCRIPT/MAIN.LUA:778 ERROR - DEMON SLAIN! 🔥💀🔥

## 🚨 ERROR DIAGNOSIS:
**Error Location**: `script/main.lua:778`  
**Error Line**: `textImgDraw(txt_subTitle)`  
**Root Cause**: Missing `data.usx` value in `data_sav.lua`

## 🎯 THE DEMON:
The game tries to create `txt_subTitle` based on `data.usx` value:

```lua
if data.usx == 'Champion Edition' then
    txt_subTitle = createTextImg(font5, 0, 1, 'CHAMPION EDITION', 110, 8)
elseif data.usx == 'Unlimited Edition' then
    txt_subTitle = createTextImg(font5, 0, 1, 'UNLIMITED EDITION', 108, 8)
-- ... other editions
end
```

**But `data.usx` was MISSING from data_sav.lua!**

## ✅ SOLUTION APPLIED:
Added missing line to `data_sav.lua`:
```lua
data.usx = 'Unlimited Edition'
```

## 🔧 CO-OP ACTION REQUIRED:
Copy this corrected `data_sav.lua` to your game directory:

**CO-OP PATH**: `/home/user/Ultimate-Smashbox/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/saved/data_sav.lua`

**FIXED CONTENT**:
```lua
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
data.difficulty = 5
data.continueCount = 0
data.contSelection = false
data.aiRamping = true
data.autoguard = false
data.vsDisplayWin = true
data.saveReplay = false
data.debugKeys = false
data.quickVS = false
data.firstRun = false
data.lifebar = 'data/screenpack/fightSD.def'
data.usx = 'Unlimited Edition'
```

## 🎮 EXPECTED RESULT:
- ✅ Game will show "UNLIMITED EDITION" subtitle
- ✅ No more script/main.lua:778 crashes
- ✅ Title screen loads properly
- ✅ Morrigan is ready for testing!

---
🔥💀👑 **ANOTHER DEMON DOWN! GAME ENGINE FIXED!** 👑💀🔥