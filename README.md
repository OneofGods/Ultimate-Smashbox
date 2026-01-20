# Ultimate Smashbox - UNLIMITED EDITION 🎮

## Repository Overview
This repository contains character configurations, debugging documentation, and unlock system info for **ULTIMATE SMASHBOX PUBLIC BETA 2.4.0 [DirectX]** - a crossover fighting game with 311+ characters!

**GitHub:** https://github.com/OneofGods/Ultimate-Smashbox  
**Platform:** macOS with Wine compatibility layer  
**Engine:** Ikemen GO / MUGEN-based

---

## 🔓 CHARACTER UNLOCK SYSTEM

### How Character Visibility Works
Characters are controlled in `gamedata/data/screenpack/selectUM.def`

| Flag | Effect |
|------|--------|
| `exclude=1` | **HIDDEN** - Not visible on select screen until unlocked |
| No `exclude` flag | **VISIBLE** - Always available |
| `boss=1` | Boss character (affects arcade mode order) |
| `order=X` | When character appears in Arcade (1=early, 9=late boss, 20=hidden) |

### Example Entry
```ini
; Visible character with stage and music
UM/CC/Dante/Dante.def, stages/Temen Ni Gru.def, music=sound/Devils Never Cry.mp3, order=5

; Hidden character (needs unlock)
UM/CC/Vergil/Vergil.def, order=20, exclude=1

; Boss character  
UM/CC/Nero/Nero.def, stages/The Fury of The Ancient God.def, order=9, boss=1
```

### Unlock Mechanisms (from `gamedata/script/`)
The game has **3 unlock systems** controlled by Lua scripts:

| Unlock Type | Trigger | Variable |
|-------------|---------|----------|
| **Arcade Unlocks** | Complete Arcade mode | `data.arcadeUnlocks = true` |
| **Survival Unlocks** | Complete Survival mode | `data.survivalUnlocks = true` |
| **Shop Unlocks** | Purchase with coins | `data.shopUnlocks = true` |

### Game Editions
```lua
data.usx = 'Unlimited Edition'  -- Current edition
-- Other options: 'Lite Edition', 'Deluxe Edition', 'Champion Edition'
```

### Save Files Location
- `gamedata/saved/data_sav.lua` - Game settings and progress
- `gamedata/saved/stats_sav.lua` - Player statistics and unlock counts

### 🎯 QUICK UNLOCK ALL CHARACTERS
To make ALL 311+ characters visible immediately, remove `exclude=1` from `selectUM.def`:
```bash
cd gamedata/data/screenpack/
sed -i '' 's/, exclude=1//g' selectUM.def
sed -i '' 's/,exclude=1//g' selectUM.def
```

---

## 📁 CHARACTER STRUCTURE

### File Organization
```
gamedata/chars/UM/[FRANCHISE]/[CHARACTER]/
├── [character].def       # Main definition file (REQUIRED)
├── [char]cmd.cns         # Commands/inputs  
├── [char]cns.cns         # Constants and variables
├── [char]anim.air        # Animation definitions
├── [char]sprite.sff      # Sprite file (can be large!)
├── [char]sound.snd       # Sound file
├── palettes/             # Color palettes (.act files)
├── portraits/            # Selection screen portraits
└── states/               # State machine files (.st)
```

### Franchise Folders
| Folder | Franchise |
|--------|-----------|
| `CC` | Capcom (Dante, Vergil, Morrigan, etc.) |
| `SF` | Street Fighter |
| `KOF` | King of Fighters |
| `DB` | Dragon Ball |
| `MV` | Marvel |
| `DC` | DC Comics |
| `MK` | Mortal Kombat |
| `Anime` | Various Anime |
| `NT` | Nintendo |
| `OT` | Other/Misc |

---

## 🔥 MORRIGAN CHARACTER INTEGRATION - EPIC DEBUGGING BREAKTHROUGH!

### The Challenge
- Adding Morrigan as the FIRST custom character to the new engine
- Encountered persistent encoding errors with square characters (□□□□□□□)
- Multiple `nohardcodedkeys`, `mapset`, `ifelse`, and encoding issues

### The EUREKA Breakthrough! 💥
**ROOT CAUSE**: The engine doesn't support `nohardcodedkeys` flag!
- **SOLUTION**: Replaced all `flag = nohardcodedkeys` with `flag = noshadow`
- **RESULT**: Successfully passed line 659 and entered Phase 2!

### Engine Compatibility Fixes (USE FOR NEW CHARACTERS!)
| Original Code | Engine-Compatible Replacement |
|---------------|------------------------------|
| `flag = nohardcodedkeys` | `flag = noshadow` |
| `mapset(varname, value)` | `varset(var(X), value)` |
| `map(varname)` | `var(X)` |
| `ifelse(condition,a,b)` | Separate trigger conditions |
| `assertinput` | `null` |
| `guardpointsadd` | `varset` |
| `incustomstate` | Remove or simplify |
| `prevmovetype` | Use alternative triggers |

### Files Modified for Morrigan
- `gamedata/chars/UM/CC/Morrigan/states/morisystem.st`
- `gamedata/data/screenpack/selectUM.def`
- `gamedata/chars/UM/CC/Morrigan/morrigan_pots.def`

### Current Morrigan Status
- ✅ Appears in character selection  
- ✅ Loads into battle without crashes
- ✅ Sprites and animations work perfectly
- ⚠️ **KNOWN ISSUE**: Only defends, doesn't attack (input/command file needs debugging)

---

## 🐛 KNOWN ISSUES & TODO

### Morrigan Input Problem
**Symptom:** Morrigan can move and defend but won't perform attacks or specials  
**Suspected Cause:** `moricmd.cns` (command file) likely has same encoding issues as state files  
**Status:** INVESTIGATION NEEDED

### TODO List
- [ ] Debug Morrigan's `moricmd.cns` for input encoding issues
- [ ] Apply same demon-slaying techniques to command file
- [ ] Test all special moves after fix
- [ ] Document working input mappings

---

## 🎯 ADDING NEW CHARACTERS - QUICK GUIDE

1. **Copy character folder** to appropriate franchise directory
2. **Check/fix encoding issues** (Windows → Unix line endings)
3. **Apply compatibility fixes** (see table above)
4. **Add to `selectUM.def`**:
   ```ini
   UM/[FRANCHISE]/[CHARACTER]/[character].def, order=5
   ```
5. **Test with Wine**:
   ```bash
   cd "ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]"
   wine "ULTIMATE SMASHBOX.exe"
   ```

---

## 👥 Team
- **Senior Debuggers**: OneofGods & Claude Code  
- **Engine**: ULTIMATE SMASHBOX PUBLIC BETA [DirectX]  
- **Platform**: macOS with Wine compatibility layer

---

## 📊 Statistics
- **Total Characters**: 311+ (312 with Morrigan!)
- **Capcom Characters Added**: Dante, Vergil, Nero, Kenji, Captain Commando, Morrigan
- **Lines of Code Debugged**: 3300+ in Morrigan's state files alone!

**HOLY GODDESS OF SYRUP - THE STRUGGLE CONTINUES!** 🎯💪

---
*This repository proves that with systematic analysis, senior developer thinking, and persistent effort, any encoding demon can be defeated!*
