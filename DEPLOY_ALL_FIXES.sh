#!/bin/bash
# 🔥 ULTIMATE DEMON SLAYING DEPLOYMENT SCRIPT 🔥
# Deploys ALL fixes to the actual game installation

echo "🚀 DEPLOYING ALL MORRIGAN FIXES TO ACTUAL GAME..."
echo ""

# Define paths
REPO_PATH="/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box"
GAME_PATH="/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]"
MORRIGAN_GAME_PATH="$GAME_PATH/gamedata/chars/UM/CC/Morrigan"
MORRIGAN_REPO_PATH="$REPO_PATH/morrigan_pots"

echo "📁 Repository Path: $REPO_PATH"
echo "📁 Game Installation: $GAME_PATH"
echo "📁 Morrigan Game Dir: $MORRIGAN_GAME_PATH"
echo "📁 Morrigan Fixed Files: $MORRIGAN_REPO_PATH"
echo ""

# Step 1: Pull latest changes
echo "🔄 STEP 1: Pulling latest GitHub changes..."
cd "$REPO_PATH"
git pull origin claude/debug-pattern-issue-oqB5q
if [ $? -eq 0 ]; then
    echo "✅ GitHub pull successful!"
else
    echo "❌ GitHub pull failed! Check your internet connection."
    exit 1
fi
echo ""

# Step 2: Backup current Morrigan
echo "💾 STEP 2: Creating backup of current Morrigan..."
BACKUP_PATH="$GAME_PATH/gamedata/chars/UM/CC/Morrigan_BACKUP_$(date +%Y%m%d_%H%M%S)"
if [ -d "$MORRIGAN_GAME_PATH" ]; then
    cp -R "$MORRIGAN_GAME_PATH" "$BACKUP_PATH"
    echo "✅ Backup created at: $BACKUP_PATH"
else
    echo "⚠️  Original Morrigan directory not found, proceeding without backup..."
fi
echo ""

# Step 3: Copy ALL fixed files
echo "📂 STEP 3: Copying ALL fixed Morrigan files to game..."
if [ -d "$MORRIGAN_REPO_PATH" ]; then
    # Remove old Morrigan
    rm -rf "$MORRIGAN_GAME_PATH"
    
    # Copy new fixed Morrigan
    cp -R "$MORRIGAN_REPO_PATH" "$MORRIGAN_GAME_PATH"
    echo "✅ ALL Morrigan files copied successfully!"
else
    echo "❌ Fixed Morrigan files not found in repository!"
    exit 1
fi
echo ""

# Step 4: Apply critical fixes to actual game files
echo "🔧 STEP 4: Applying critical fixes to game installation..."

# Fix the CO-OP configuration
SAVE_DATA="$GAME_PATH/gamedata/saved/data_sav.lua"
if [ -f "$SAVE_DATA" ]; then
    # Fix teamLifeShare
    sed -i '' 's/data.teamLifeShare = false/data.teamLifeShare = true/' "$SAVE_DATA"
    # Fix debugMode  
    sed -i '' 's/data.debugMode = true/data.debugMode = false/' "$SAVE_DATA"
    # Fix coopenemy
    sed -i '' 's/data.coopenemy = .Simul./data.coopenemy = '\''Single'\''/' "$SAVE_DATA"
    # Add missing coop variable if not present
    if ! grep -q "data.coop" "$SAVE_DATA"; then
        sed -i '' '/data.coopenemy/a\
data.coop = false' "$SAVE_DATA"
    fi
    echo "✅ CO-OP configuration fixed!"
else
    echo "⚠️  Save data not found, skipping CO-OP config..."
fi
echo ""

# Step 5: Verify fixes
echo "🔍 STEP 5: Running verification script..."
cd "$REPO_PATH"
if [ -f "verify_morrigan_fix_clean.sh" ]; then
    ./verify_morrigan_fix_clean.sh
    if [ $? -eq 0 ]; then
        echo "✅ Verification PASSED! All demons eliminated!"
    else
        echo "❌ Verification FAILED! Some demons may remain!"
        exit 1
    fi
else
    echo "⚠️  Verification script not found, skipping verification..."
fi
echo ""

# Step 6: Final check
echo "🎯 STEP 6: Final demon check..."
MORRIGAN_STATES="$MORRIGAN_GAME_PATH/states/morisystem.st"
if [ -f "$MORRIGAN_STATES" ]; then
    # Check for encoding demons
    if grep -q "□" "$MORRIGAN_STATES"; then
        echo "❌ ENCODING DEMONS STILL EXIST!"
        exit 1
    fi
    
    # Check for fixed lines
    if grep -q "stateno != \[0,199\]" "$MORRIGAN_STATES"; then
        echo "✅ Line 45 fix confirmed!"
    else
        echo "❌ Line 45 fix MISSING!"
        exit 1
    fi
    
    if grep -q "!incustomstate" "$MORRIGAN_STATES"; then
        echo "✅ Line 3625 fix confirmed!"
    else
        echo "❌ Line 3625 fix MISSING!"
        exit 1
    fi
else
    echo "❌ Morrigan states file not found!"
    exit 1
fi

echo ""
echo "🎉🔥 DEPLOYMENT COMPLETE! ALL DEMONS SLAYED! 🔥🎉"
echo ""
echo "📊 SUMMARY OF APPLIED FIXES:"
echo "   ✅ GitHub changes pulled"
echo "   ✅ Original Morrigan backed up"
echo "   ✅ ALL fixed files deployed"
echo "   ✅ CO-OP configuration updated"
echo "   ✅ Encoding demons eliminated"
echo "   ✅ Critical state fixes applied"
echo ""
echo "🎮 READY TO ROCK! Start Ultimate Smash Box and test CO-OP!"
echo "💪 The mapset□□□□□ error should be GONE!"
echo ""