# 🔥 CO-OP DEPLOYMENT INSTRUCTIONS 🔥

## SIMPLE 3-STEP PROCESS:

### 1️⃣ RUN THE DEPLOYMENT SCRIPT
```bash
cd "/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box"
./DEPLOY_ALL_FIXES.sh
```

### 2️⃣ WAIT FOR SUCCESS MESSAGE
Look for: `🎉🔥 DEPLOYMENT COMPLETE! ALL DEMONS SLAYED! 🔥🎉`

### 3️⃣ TEST THE GAME
- Launch Ultimate Smash Box
- Try CO-OP mode
- The `mapset□□□□□` error should be **GONE**!

---

## 🚨 IF DEPLOYMENT FAILS:

### Manual Steps:
1. Pull latest changes:
   ```bash
   git pull origin claude/debug-pattern-issue-oqB5q
   ```

2. Copy fixed files:
   ```bash
   cp -R morrigan_pots/* "ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan/"
   ```

3. Run verification:
   ```bash
   ./verify_morrigan_fix_clean.sh
   ```

---

## ✅ SUCCESS INDICATORS:
- ✅ No `mapset□□□□□` errors
- ✅ CO-OP mode loads properly  
- ✅ Morrigan character works
- ✅ No encoding demons

## ❌ FAILURE INDICATORS:
- ❌ `mapset□□□□□` still appears
- ❌ Game crashes on character select
- ❌ CO-OP mode doesn't work

---

## 🆘 EMERGENCY CONTACT:
If deployment fails, report:
1. Error messages from script
2. Which step failed
3. Console output

**THE DEMONS ARE DEAD! TIME TO GAME!** 🎮💪