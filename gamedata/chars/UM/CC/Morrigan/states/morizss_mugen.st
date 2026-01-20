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
; - pausetime -> HitPauseTime (MUGEN doesn't have pausetime trigger)
; - Removed Ikemen-only functions (for loops, switch/case, let variables)
; - Simplified complex AI and spark systems
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
; NOTE: NoFallHitFlag is Ikemen-only, so we use a workaround with NotHitBy
; This prevents further juggle hits when limit is reached
[State -2, Juggle Limit Check]
type = NotHitBy
trigger1 = var(50) >= var(51)
trigger1 = var(55) = 0
value = SCA
time = 1
ignorehitpause = 1

; EX Yellow Flash effect
; NOTE: pausetime is Ikemen-only, using HitPauseTime = 0 instead
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

; AI Fall Recovery and Throw Escape
; NOTE: AssertInput is Ikemen-only, so AI recovery is handled via ChangeState
; The AI will automatically try to recover when in fall states
[State -2, AI Fall Recovery]
type = ChangeState
trigger1 = AILevel
trigger1 = stateno = 5050
trigger1 = pos y >= -20
trigger1 = vel y > 0
trigger1 = CanRecover
trigger1 = random < 800
value = 5200
ignorehitpause = 1

; AI tries to break throws
[State -2, AI Throw Break Attempt]
type = ChangeState
trigger1 = AILevel
trigger1 = stateno = [5000, 5019]
trigger1 = time < 10
trigger1 = random < 600
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

; -3, Tag In Sounds (only trigger if tag system is active)
; NOTE: Const(StateTagEnteringScreen) is Ikemen-only, using stateno = 5900 as fallback
[State -3, Tag In Sound 1]
type = PlaySnd
trigger1 = stateno = 5900
trigger1 = time = 1
value = 4, 20
channel = 0

[State -3, Tag In Sound 2]
type = PlaySnd
trigger1 = stateno = 5900
trigger1 = time = 1
value = 5, 4

;###################################################################################################
;                                            STATE -4
;###################################################################################################

[Statedef -4]

; Initialize juggle variables on round start
[State -4, Init Juggle Limit]
type = VarSet
trigger1 = RoundState = 0
var(51) = 15
ignorehitpause = 1

[State -4, Init Juggle Start]
type = VarSet
trigger1 = RoundState = 0
var(53) = 1
ignorehitpause = 1

[State -4, Init Juggle Increase]
type = VarSet
trigger1 = RoundState = 0
var(54) = 1
ignorehitpause = 1

; -4, Juggle System - Reset Juggle Count
[State -4, Juggle Reset]
type = VarSet
trigger1 = var(50) > 0
trigger1 = P2MoveType != H
trigger2 = var(50) > 0
trigger2 = P2StateNo = [0, 52]
trigger3 = var(50) > 0
trigger3 = P2StateType = S || P2StateType = C
trigger4 = var(50) > 0
trigger4 = P2StateType = L
trigger4 = P2BodyDist Y = 0
trigger5 = var(50) > 0
trigger5 = P2StateNo = [120, 155]
trigger6 = var(50) > 0
trigger6 = P2StateNo = 5201 || P2StateNo = 5210
trigger7 = var(50) > 0
trigger7 = MoveGuarded = 1 || MoveReversed = 1
trigger8 = var(50) > 0
trigger8 = RoundState != 2
var(50) = 0
ignorehitpause = 1

; -4, Juggle System - Increase Juggle Count
; NOTE: pausetime -> HitPauseTime
[State -4, Juggle Increase on Hit]
type = VarAdd
trigger1 = HitPauseTime = 0
trigger1 = MoveHit = 1
trigger1 = NumTarget
trigger1 = P2MoveType = H
trigger1 = var(52) <= 0
var(50) = var(53)
ignorehitpause = 1

[State -4, Juggle Increase Continued]
type = VarAdd
trigger1 = HitPauseTime = 0
trigger1 = MoveHit = 1
trigger1 = NumTarget
trigger1 = P2MoveType = H
trigger1 = var(52) > 0
var(50) = var(54)
ignorehitpause = 1

; -4, Juggle Timer
; NOTE: P2 HitPauseTime redirect not supported, using P2MoveType check
[State -4, Juggle Timer Increase]
type = VarAdd
trigger1 = P2MoveType = H
var(52) = 1
ignorehitpause = 1

[State -4, Juggle Timer Reset]
type = VarSet
trigger1 = P2MoveType != H
var(52) = 0
ignorehitpause = 1

; AI block high detection (simplified)
[State -4, AI Block High Set]
type = VarSet
trigger1 = AILevel
trigger1 = P2StateType = A
trigger1 = random < 100
var(59) = 1
ignorehitpause = 1

[State -4, AI Block High Reset]
type = VarSet
trigger1 = AILevel
trigger1 = P2StateType != A
trigger1 = random < 200
var(59) = 0
ignorehitpause = 1

; Debug display
[State -4, Debug Display]
type = DisplayToClipboard
trigger1 = 1
text = "Juggle=%d Limit=%d DarkForce=%d"
params = var(50), var(51), var(55)
ignorehitpause = 1

[State -4, Debug Append]
type = AppendToClipboard
trigger1 = 1
text = "\nMorrigan MUGEN Converted by Claude Code"
ignorehitpause = 1
