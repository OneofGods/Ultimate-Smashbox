#!/bin/bash
# 🔥 VERIFICATION SCRIPT FOR MORRIGAN FIX 🔥

echo "💀🔥 MORRIGAN DEMON SLAYING VERIFICATION SCRIPT 🔥💀"
echo ""

# Set the path to the ACTUAL game installation
GAME_PATH="/Volumes/NEMESIS/ROMs/Instinct Games/Ultimate Smash Box/ULTIMATE SMASHBOX BETA 2.4.0 - [UNLIMITED EDITION]/gamedata/chars/UM/CC/Morrigan"
MORISYSTEM="${GAME_PATH}/states/morisystem.st"

echo "Checking: $MORISYSTEM"
echo ""

# Check if file exists
if [ ! -f "$MORISYSTEM" ]; then
    echo "❌ ERROR: morisystem.st not found at expected location!"
    echo "   Expected: $MORISYSTEM"
    echo ""
    echo "🎯 ACTION REQUIRED: Update GAME_PATH in this script to point to your actual MUGEN installation"
    exit 1
fi

echo "✅ File found!"
echo ""

# Check for backup files
echo "🔍 Checking for backup files..."
BACKUP_COUNT=$(find "${GAME_PATH}" -name "*.backup" -o -name "*.bak" -o -name "*~" 2>/dev/null | wc -l)
if [ "$BACKUP_COUNT" -gt 0 ]; then
    echo "❌ FOUND $BACKUP_COUNT BACKUP FILES:"
    find "${GAME_PATH}" -name "*.backup" -o -name "*.bak" -o -name "*~" 2>/dev/null
    echo ""
    echo "🎯 ACTION REQUIRED: DELETE these backup files!"
    echo "   Run: rm \"${GAME_PATH}/states/\"*.backup"
else
    echo "✅ No backup files found!"
fi
echo ""

# Check file encoding
echo "🔍 Checking file encoding..."
ENCODING=$(file "$MORISYSTEM" | grep -o "ASCII\|UTF-8\|ISO-8859")
if [[ "$ENCODING" == *"ISO-8859"* ]]; then
    echo "❌ ENCODING ERROR: File is $ENCODING (should be ASCII or UTF-8)"
    echo "🎯 ACTION REQUIRED: Convert file to UTF-8 or replace with clean version!"
elif [[ "$ENCODING" == *"ASCII"* ]] || [[ "$ENCODING" == *"UTF-8"* ]]; then
    echo "✅ Encoding is correct: $ENCODING"
else
    echo "⚠️  Unknown encoding: $(file "$MORISYSTEM")"
fi
echo ""

# Check line 35
echo "🔍 Checking line 35..."
LINE35=$(sed -n '35p' "$MORISYSTEM")
if [[ "$LINE35" == *"value = 0"* ]]; then
    echo "✅ Line 35 is CORRECT: $LINE35"
elif [[ "$LINE35" == *"map(darkforce)"* ]]; then
    echo "❌ Line 35 is WRONG: $LINE35"
    echo "   Should be: value = 0"
    echo "🎯 ACTION REQUIRED: Fix line 35!"
else
    echo "⚠️  Line 35 unexpected: $LINE35"
fi
echo ""

# Check line 45
echo "🔍 Checking line 45..."
LINE45=$(sed -n '45p' "$MORISYSTEM")
if [[ "$LINE45" == *"stateno != [0,199]"* ]]; then
    echo "✅ Line 45 is CORRECT: $LINE45"
elif [[ "$LINE45" == *"incustomstate"* ]]; then
    echo "❌ Line 45 is WRONG: $LINE45"
    echo "   Should be: trigger1 = stateno != [0,199]"
    echo "🎯 ACTION REQUIRED: Fix line 45!"
else
    echo "⚠️  Line 45 unexpected: $LINE45"
fi
echo ""

# Check for invalid characters
echo "🔍 Checking for invalid characters (boxes/corruption)..."
INVALID_COUNT=$(grep -P '[^\x00-\x7F]' "$MORISYSTEM" 2>/dev/null | wc -l)
if [ "$INVALID_COUNT" -gt 0 ]; then
    echo "❌ FOUND $INVALID_COUNT lines with non-ASCII characters!"
    echo "   This could cause □□□□□ display errors!"
    echo "🎯 ACTION REQUIRED: Clean or replace the file!"
    echo ""
    echo "   Lines with issues:"
    grep -n -P '[^\x00-\x7F]' "$MORISYSTEM" 2>/dev/null | head -5
else
    echo "✅ No invalid characters found!"
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "💀 DEMON SLAYING STATUS REPORT 💀"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "If you see ANY ❌ above, you need to fix those issues!"
echo "If all checks show ✅, the demon should be DEAD! 🔥"
echo ""
echo "🎯 Next step: Run MUGEN and verify no more □□□□□ errors!"
