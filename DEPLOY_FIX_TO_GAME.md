# 🔥 DEPLOYMENT INSTRUCTIONS FOR CO-OP 🔥

## THE PROBLEM
The box pattern error `incustamstate□□□□□` is happening because the **ACTUAL GAME FILES** at the MUGEN installation have corrupted backup files!

## WHERE THE ACTUAL GAME IS RUNNING FROM
```bash
/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]
```

## THE FIX (CO-OP MUST DO THIS ON THE ACTUAL GAME INSTALLATION)

### Step 1: Navigate to the Morrigan Character Folder
```bash
cd "/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/"
```

### Step 2: DELETE ALL BACKUP FILES
```bash
rm morisystem.st.backup
rm *.backup
rm *.bak
rm *~
```

### Step 3: CHECK Line 35 and Line 45 in morisystem.st

**Line 35 should be:**
```
value = 0
```
**NOT:** `value = ifelse(map(darkforce) > 0, 1, 0)` or `value = map(darkforce) > 0`

**Line 45 should be:**
```
trigger1 = stateno != [0,199]
```
**NOT:** `trigger1 = incustomstate`

### Step 4: If Line 45 is WRONG, Fix It
```bash
# Edit the file and change line 45 from:
# trigger1 = incustomstate
# TO:
# trigger1 = stateno != [0,199]
```

### Step 5: Verify File Encoding
```bash
file morisystem.st
# Should show: "ASCII text" or "UTF-8 text"
# Should NOT show: "ISO-8859"
```

### Step 6: ALTERNATIVE - Copy Fixed Files from This Repo
```bash
# If you want to copy the CLEAN files from this repo:
cp "/path/to/this/repo/morrigan_pots/states/morisystem.st" "/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/"
```

## THE ROOT CAUSE
1. **Corrupted backup files** with ISO-8859 encoding
2. **Wrong code** at line 45: `trigger1 = incustomstate`
3. **Invalid characters** displaying as □□□□□

## WHAT WE FIXED IN THIS REPO
✅ Deleted corrupted backup files from `morrigan_pots/`
✅ Verified `morrigan_pots/states/morisystem.st` is clean ASCII
✅ Line 35: `value = 0`
✅ Line 45: `trigger1 = stateno != [0,199]`

## WHAT CO-OP NEEDS TO DO
🎯 Apply the SAME fixes to the ACTUAL GAME FILES at the MUGEN installation path!

---

**DEMON LOCATION:** `/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/states/morisystem.st`

**SLAY IT! 💀🔥**
