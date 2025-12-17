#!/bin/bash
# 💀🔥 MAP() DEMON ELIMINATION SCRIPT 🔥💀

echo "💀🔥 STARTING MASS MAP() DEMON ELIMINATION! 🔥💀"
echo ""

# Files to process
FILES=(
    "morrigan_pots/states/morisystem.st"
    "morrigan_pots/states/moridarkforce.st"
    "morrigan_pots/states/morihelper.st"
    "morrigan_pots/states/morispecial.st"
    "morrigan_pots/states/morisuper.st"
    "morrigan_pots/states/morinormal.st"
    "morrigan_pots/moricmd.cns"
)

# Backup files first
echo "📦 Creating backups..."
for file in "${FILES[@]}"; do
    cp "$file" "${file}.pre-map-elimination" 2>/dev/null
done
echo ""

# Phase 1: Replace map() function calls with var()
echo "🔥 Phase 1: Replacing map() with var()..."

for file in "${FILES[@]}"; do
    echo "  Processing: $file"

    # Replace map(name) with var(number) - using the conversion table
    sed -i \
        -e 's/map(darkforce)/var(50)/g' \
        -e 's/map(jumptype)/var(51)/g' \
        -e 's/map(projcontact)/var(52)/g' \
        -e 's/map(normalcancel)/var(53)/g' \
        -e 's/map(specialcancel)/var(54)/g' \
        -e 's/map(supercancel)/var(55)/g' \
        -e 's/map(hypercancel)/var(56)/g' \
        -e 's/map(supercancelflag)/var(57)/g' \
        -e 's/map(hypercancelflag)/var(58)/g' \
        -e 's/map(superfinish)/var(59)/g' \
        -e 's/map(victorycam)/var(60)/g' \
        -e 's/map(victorybgm)/var(61)/g' \
        -e 's/map(cfg_victorybgm)/var(62)/g' \
        -e 's/map(cfg_winzoom)/var(63)/g' \
        -e 's/map(zoom_allowed)/var(64)/g' \
        -e 's/map(combocheck)/var(65)/g' \
        -e 's/map(sparkle_timer)/var(66)/g' \
        -e 's/map(damagescaling)/var(67)/g' \
        "$file"
done
echo ""

# Phase 2: Fix assignment operators (:= to =)
echo "🔥 Phase 2: Fixing assignment operators..."
for file in "${FILES[@]}"; do
    # Replace var(N) := value with var(N) = value
    sed -i 's/var(\([0-9]*\)) :=/var(\1) =/g' "$file"
done
echo ""

# Phase 3: Remove old map = "name" lines (leftover from mapset)
echo "🔥 Phase 3: Removing map = \"name\" lines..."
for file in "${FILES[@]}"; do
    # Remove lines that are just: map = "something"
    sed -i '/^map = ".*"$/d' "$file"
done
echo ""

# Count remaining map() instances
echo "📊 DEMON COUNT AFTER ELIMINATION:"
for file in "${FILES[@]}"; do
    count=$(grep -c "map(" "$file" 2>/dev/null || echo "0")
    echo "  $(basename $file): $count map() remaining"
done
echo ""

echo "✅ MASS ELIMINATION COMPLETE!"
echo ""
echo "🎯 Next steps:"
echo "  1. Review the changes"
echo "  2. Test for any syntax errors"
echo "  3. Commit and push to GitHub"
echo ""
echo "💀 THE MAP() DEMONS HAVE BEEN SLAUGHTERED! 🔥"
