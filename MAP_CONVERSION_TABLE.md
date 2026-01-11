# MAP() TO VAR() CONVERSION TABLE
# For Ultimate Smashbox (DirectX Engine - NO map() support)

## CRITICAL GAMEPLAY VARIABLES (var 44-59)
| map() name | var() | Uses | Description |
|------------|-------|------|-------------|
| map(darkforce) | var(44) | 160 | Dark Force mode active |
| map(strength) | var(45) | 97 | Attack strength level |
| map(combocheck) | var(46) | 97 | Combo validation flag |
| map(sparkno) | var(47) | 92 | Spark effect number |
| map(sparky) | var(48) | 79 | Spark Y position |
| map(projcontact) | var(49) | 31 | Projectile contact flag |
| map(superfinish) | var(50) | 19 | Super move finish state |
| map(supercancelflag) | var(51) | 17 | Super cancel allowed |
| map(hypercancelflag) | var(52) | 17 | Hyper cancel allowed |
| map(supercancel) | var(53) | 9 | Super cancel state |
| map(hypercancel) | var(54) | 9 | Hyper cancel state |
| map(specialcancel) | var(55) | 2 | Special cancel flag |
| map(normalcancel) | var(56) | 1 | Normal cancel flag |
| map(jumptype) | var(57) | 4 | Jump type tracker |
| map(unthrowable) | var(58) | 6 | Unthrowable state |
| map(target) | var(59) | 25 | Target tracking |

## JUGGLE SYSTEM (var 15-19)
| map() name | var() | Uses | Description |
|------------|-------|------|-------------|
| map(juggle_limit) | var(15) | 72 | Juggle limit value |
| map(juggle_start) | var(16) | 71 | Juggle start value |
| map(juggle_increase) | var(17) | 71 | Juggle increase value |
| map(juggle_count) | var(18) | 12 | Current juggle count |
| map(juggle_timer) | var(19) | 1 | Juggle timer |

## COMMAND ERASE SYSTEM (var 3-9)
| map() name | var() | Uses | Description |
|------------|-------|------|-------------|
| map(cmd_erase_completed) | var(3) | 57 | Command erase done |
| map(cmd_erase_motion_super) | var(4) | 44 | Super motion erased |
| map(cmd_erase_motion_special) | var(5) | 31 | Special motion erased |
| map(counterhit_buffer) | var(6) | 42 | Counter hit buffer |
| map(techhit_timer) | var(7) | 4 | Tech hit timer |
| map(techhit_facing) | var(8) | 1 | Tech hit facing |
| map(timer) | var(9) | 4 | General timer |

## CONFIG/DISPLAY (var 22, fvar 3-10)
| map() name | var()/fvar() | Uses | Description |
|------------|--------------|------|-------------|
| map(cfg_sparks) | var(22) | 78 | Sparks config |
| map(cfg_superfx) | fvar(3) | 24 | Super FX config |
| map(cfg_winzoom) | fvar(4) | 1 | Win zoom config |
| map(cfg_victorybgm) | fvar(5) | 3 | Victory BGM config |
| map(cfg_blood) | fvar(6) | 2 | Blood config |
| map(victorybgm) | fvar(7) | 3 | Victory BGM state |
| map(victorycam) | fvar(8) | 1 | Victory camera |
| map(zoom_allowed) | fvar(9) | 1 | Zoom allowed |
| map(sparkle_timer) | fvar(10) | 3 | Sparkle timer |

## DAMAGE/SCALING (fvar 11-15)
| map() name | fvar() | Uses | Description |
|------------|--------|------|-------------|
| map(damagescaling) | fvar(11) | 11 | Damage scaling factor |
| map(meterscaling) | fvar(12) | 6 | Meter scaling factor |
| map(cornerpush) | fvar(13) | 5 | Corner push distance |
| map(superlevel) | fvar(14) | 8 | Super level value |
| map(exflash) | fvar(15) | 8 | EX flash effect |

## AI SYSTEM (fvar 16-23)
| map() name | fvar() | Uses | Description |
|------------|--------|------|-------------|
| map(ai_spacing) | fvar(16) | 6 | AI spacing |
| map(ai_combowindow) | fvar(17) | 3 | AI combo window |
| map(ai_attackwindow) | fvar(18) | 2 | AI attack window |
| map(ai_punishwindow) | fvar(19) | 1 | AI punish window |
| map(ai_confirm) | fvar(20) | 1 | AI confirm |
| map(ai_p2fireball_distx) | fvar(21) | 7 | AI fireball X dist |
| map(ai_p2fireball_disty) | fvar(22) | 2 | AI fireball Y dist |
| map(ai_p2fireball_eta) | fvar(23) | 4 | AI fireball ETA |

## HELPER/MISC (fvar 26-35)
| map() name | fvar() | Uses | Description |
|------------|--------|------|-------------|
| map(layering) | fvar(26) | 4 | Layer control |
| map(hitparticles) | fvar(27) | 3 | Hit particle effect |
| map(grabbehind) | fvar(28) | 3 | Grab behind flag |
| map(customcombo) | fvar(29) | 3 | Custom combo mode |
| map(truebodydistx) | fvar(30) | 5 | True body X distance |
| map(p2_yaccelfix) | fvar(31) | 3 | P2 Y accel fix |
| map(projflag) | fvar(32) | 1 | Projectile flag |
| map(posx) | fvar(33) | 1 | Position X |
| map(direction) | fvar(34) | 1 | Direction |
| map(message_hkd) | fvar(35) | 2 | HKD message |

## CMD STRENGTH (Use sysvar or dedicated handling)
These are command strength values - may need special handling:
- map(cmd_strength_x/y/z) - Punch strength
- map(cmd_strength_a/b/c) - Kick strength
- map(cmd_strength_xy/xz/yz/xyz) - Combined punch
- map(cmd_strength_ab/ac/bc/abc) - Combined kick

## CMD CHECK VARS (Temporary - can reuse)
All map(cmd_check_*) variables are temporary input state checks.
These can potentially share a small set of var() slots since they're
reset each frame. Consider using var(60+) or consolidating.

## PALETTE FX (fvar 36-38)
| map() name | fvar() | Uses |
|------------|--------|------|
| map(palfx1_r) | fvar(36) | 2 |
| map(palfx1_g) | fvar(37) | 2 |
| map(palfx1_b) | fvar(38) | 2 |

---
NOTE: The cmd_* maps (200+ of them) are input command checks.
Many are temporary and reset each frame - need special handling strategy.
