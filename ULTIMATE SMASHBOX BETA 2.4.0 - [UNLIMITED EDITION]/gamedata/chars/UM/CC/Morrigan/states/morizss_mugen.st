;  ___________________________________
; | Morrigan by Phantom.of.the.Server |
; | MUGEN CONVERSION by Claude Code   |
;  ___________________________________
;
; This file converts the Ikemen GO ZSS format to MUGEN-compatible ST format
; Original: morizss.zss
; Key changes:
; - map() -> var()
; - mapSet{} -> VarSet
; - Removed Ikemen-only functions (for loops, switch/case, let variables)
; - pausetime -> HitPauseTime (MUGEN compatible)
; - Statedef -4 -> Merged into Statedef -3 (MUGEN doesn't support -4)
; - AssertInput removed (Ikemen-only)
;
; VAR MAPPING (converted from map()):
; var(50) = juggle_count
; var(51) = juggle_limit (set to 15)
; var(52) = juggle_timer
; var(53) = juggle_start
; var(54) = juggle_increase
; var(55) = darkforce
; var(56) = exflash
; var(57) = unthrowable
; var(58) = cornerpush
; fvar(10) = truebodydistx
; var(59) = ai_randompass

;###################################################################################################
;                                            STATE -2
;###################################################################################################

[Statedef -2]

; -2, Juggle System - Disable Juggling when limit reached
; NOTE: NoFallHitFlag may be Ikemen-only, keeping for now
[State -2, Juggle Limit Check]
type = AssertSpecial
trigger1 = var(50) >= var(51)
trigger1 = var(55) = 0
flag = NoJuggleCheck
ignorehitpause = 1

; EX Yellow Flash effect
[State -2, EX Flash Decrease]
type = VarAdd
trigger1 = var(56) > 0
trigger1 = HitPauseTime = 0
trigger1 = movetype != H
trigger1 = stateno = [1000, 2999]
var(56) = -1
ignorehitpause = 1

[State -2, EX Flash Reset]
type = VarSet
trigger1 = var(56) > 0
trigger1 = movetype = H || stateno != [1000, 2999]
var(56) = 0
ignorehitpause = 1

[State -2, EX Flash PalFX]
type = PalFX
trigger1 = var(56) > 0
trigger1 = HitPauseTime = 0
trigger1 = (var(56) % 2)
time = 1
color = 0
mul = 256, 224, 0
add = 96, 96, 96
ignorehitpause = 1

; AI Fall Recovery - MUGEN compatible version using ChangeState
; NOTE: AssertInput is Ikemen-only, removed
[State -2, AI Recovery]
type = ChangeState
trigger1 = AILevel
trigger1 = stateno = 5050
trigger1 = pos y >= -20
trigger1 = vel y > 0
trigger1 = CanRecover
trigger1 = random < 800
value = 5200
ignorehitpause = 1

;###################################################################################################
;                                            STATE -3
;###################################################################################################

[Statedef -3]

; -3, Turning Threshold
[State -3, No Auto Turn]
type = AssertSpecial
trigger1 = RoundState = 2
trigger1 = BackEdgeDist > 0
trigger1 = P2Dist X >= -Const(size.ground.back)
flag = NoAutoTurn
ignorehitpause = 1

; -3, True P2BodyDist X calculation (simplified)
[State -3, TrueBodyDistX]
type = VarSet
trigger1 = 1
fvar(10) = P2BodyDist X
ignorehitpause = 1

; Corner Push Reset
[State -3, Corner Push Reset No Target]
type = VarSet
trigger1 = var(58)
trigger1 = !NumTarget
var(58) = 0
ignorehitpause = 1

; -3, Tag In Sounds - REMOVED (Ikemen Tag Mode only)
; Const(StateTagEnteringScreen) is Ikemen-only, MUGEN doesn't have tag system
; [State -3, Tag In Sound 1] - DISABLED
; [State -3, Tag In Sound 2] - DISABLED

;===========================================================================
; MERGED FROM STATE -4 (MUGEN doesn't support Statedef -4)
;===========================================================================

; Initialize juggle variables on round start
[State -3, Init Juggle Limit]
type = VarSet
trigger1 = RoundState = 0
var(51) = 15
ignorehitpause = 1

[State -3, Init Juggle Start]
type = VarSet
trigger1 = RoundState = 0
var(53) = 1
ignorehitpause = 1

[State -3, Init Juggle Increase]
type = VarSet
trigger1 = RoundState = 0
var(54) = 1
ignorehitpause = 1

; Juggle System - Reset Juggle Count
[State -3, Juggle Reset]
type = VarSet
trigger1 = var(50) > 0
trigger1 = P2MoveType != H
trigger2 = var(50) > 0
trigger2 = P2StateType = S || P2StateType = C
trigger3 = var(50) > 0
trigger3 = P2StateType = L
trigger3 = enemynear, Pos Y = 0
trigger3 = enemynear, Vel Y = 0
trigger4 = var(50) > 0
trigger4 = P2StateNo = [120, 155]
trigger5 = var(50) > 0
trigger5 = P2StateNo = 5201 || P2StateNo = 5210
trigger6 = var(50) > 0
trigger6 = MoveGuarded = 1 || MoveReversed = 1
trigger7 = var(50) > 0
trigger7 = RoundState != 2
var(50) = 0
ignorehitpause = 1

; Juggle System - Increase Juggle Count
[State -3, Juggle Increase on Hit]
type = VarAdd
trigger1 = HitPauseTime = 0
trigger1 = MoveHit = 1
trigger1 = NumTarget
trigger1 = P2MoveType = H
trigger1 = var(52) <= 0
var(50) = var(53)
ignorehitpause = 1

[State -3, Juggle Increase Continued]
type = VarAdd
trigger1 = HitPauseTime = 0
trigger1 = MoveHit = 1
trigger1 = NumTarget
trigger1 = P2MoveType = H
trigger1 = var(52) > 0
var(50) = var(54)
ignorehitpause = 1

; Juggle Timer
[State -3, Juggle Timer Increase]
type = VarAdd
trigger1 = P2MoveType = H
trigger1 = HitPauseTime = 0
var(52) = 1
ignorehitpause = 1

[State -3, Juggle Timer Reset]
type = VarSet
trigger1 = P2MoveType != H
var(52) = 0
ignorehitpause = 1

; AI block high detection (simplified)
[State -3, AI Block High Set]
type = VarSet
trigger1 = AILevel
trigger1 = P2StateType = A
trigger1 = random < 100
var(59) = 1
ignorehitpause = 1

[State -3, AI Block High Reset]
type = VarSet
trigger1 = AILevel
trigger1 = P2StateType != A
trigger1 = random < 200
var(59) = 0
ignorehitpause = 1

