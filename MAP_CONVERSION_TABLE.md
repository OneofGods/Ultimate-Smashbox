# 💀 MAP() TO VAR() CONVERSION TABLE 💀

## Strategy
Replace all `map(name)` with `var(number)` using high numbers to avoid conflicts.

## Conversion Map (Using var(50+) range)

| map() Name | var() Number | Purpose |
|------------|--------------|---------|
| map(darkforce) | var(50) | Dark Force mode active |
| map(jumptype) | var(51) | Jump type (normal/high) |
| map(projcontact) | var(52) | Projectile contact flag |
| map(normalcancel) | var(53) | Normal move cancel flag |
| map(specialcancel) | var(54) | Special move cancel flag |
| map(supercancel) | var(55) | Super move cancel flag |
| map(hypercancel) | var(56) | Hyper move cancel flag |
| map(supercancelflag) | var(57) | Super cancel state flag |
| map(hypercancelflag) | var(58) | Hyper cancel state flag |
| map(superfinish) | var(59) | Super finish state |
| map(victorycam) | var(60) | Victory camera flag |
| map(victorybgm) | var(61) | Victory BGM setting |
| map(cfg_victorybgm) | var(62) | Config: Victory BGM |
| map(cfg_winzoom) | var(63) | Config: Win zoom |
| map(zoom_allowed) | var(64) | Zoom allowed flag |
| map(combocheck) | var(65) | Combo check flag |
| map(sparkle_timer) | var(66) | Sparkle effect timer |
| map(damagescaling) | var(67) | Damage scaling value |

## Replacement Strategy

### Phase 1: Simple Replacements
Replace direct `map(name)` with `var(number)` in:
- Trigger conditions
- Value assignments
- Comparisons

### Phase 2: Assignment Operator Fixes
Replace `map(name) := value` with `var(number) = value`
(Note: `:=` is map assignment operator, change to `=` for var)

### Phase 3: Remove Non-Critical Logic
For features like:
- Victory camera/BGM (cosmetic)
- Zoom effects (visual)
- Config checks (optional)

Consider REMOVING the entire trigger if it's not game-critical.

## Files to Process (Priority Order)
1. morisystem.st (47 demons)
2. moridarkforce.st (94 demons)
3. morihelper.st (140 demons)
4. morispecial.st (164 demons)
5. morisuper.st (155 demons)
6. morinormal.st (308 demons)
7. moricmd.cns (362 demons)

**TOTAL TARGET: 1,270 DEMONS TO SLAY! 💀🔥**
