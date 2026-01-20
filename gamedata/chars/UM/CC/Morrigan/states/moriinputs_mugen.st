;  ___________________________________
; | Morrigan by Phantom.of.the.Server |
; | MUGEN INPUT CONVERSION by Claude  |
;  ___________________________________
;
; This file provides AI assistance and variable management for Morrigan
; NOTE: Command triggers only work in CMD files, not ST files!
; Input handling is done in moricmd.cns
;
; VAR MAPPING for inputs:
; var(40) = cmd_buffer_timer
; var(41) = cmd_erase_flag (0 = keep, 1 = erase)
; var(42) = dash_buffer
; var(43) = highjump_buffer
; var(44) = last_direction

;###################################################################################################
;                                        INPUT SYSTEM STATE -4
;###################################################################################################

[Statedef -4]

; Initialize input buffer timer
[State -4, Init Buffer Timer]
type = VarSet
trigger1 = RoundState = 0
var(40) = 0
ignorehitpause = 1

; Clear command buffers when commanded
[State -4, Command Buffer Clear]
type = VarSet
trigger1 = var(41) = 1
var(40) = 0
ignorehitpause = 1

[State -4, Reset Erase Flag]
type = VarSet
trigger1 = var(41) = 1
var(41) = 0
ignorehitpause = 1

; Dash Buffer Decay
[State -4, Dash Buffer Decay]
type = VarAdd
trigger1 = var(42) > 0
var(42) = -1
ignorehitpause = 1

[State -4, Dash Buffer Decay Neg]
type = VarAdd
trigger1 = var(42) < 0
var(42) = 1
ignorehitpause = 1

; High Jump Buffer Decay
[State -4, High Jump Buffer Decay]
type = VarAdd
trigger1 = var(43) > 0
var(43) = -1
ignorehitpause = 1

; AI input assistance - helps AI use special moves
[State -4, AI QCF Assist]
type = ChangeState
trigger1 = AILevel
trigger1 = ctrl
trigger1 = statetype = S
trigger1 = P2BodyDist X = [50, 150]
trigger1 = random < 30
trigger1 = power >= 1000
value = 1000
ignorehitpause = 1

; AI throw assist
[State -4, AI Throw Assist]
type = ChangeState
trigger1 = AILevel
trigger1 = ctrl
trigger1 = statetype = S
trigger1 = P2BodyDist X = [0, 30]
trigger1 = P2StateType != A
trigger1 = P2StateType != L
trigger1 = random < 50
value = 800
ignorehitpause = 1

; AI anti-air assist
[State -4, AI Anti-Air]
type = ChangeState
trigger1 = AILevel
trigger1 = ctrl
trigger1 = statetype = S
trigger1 = P2StateType = A
trigger1 = P2BodyDist X = [0, 100]
trigger1 = P2BodyDist Y = [-150, -50]
trigger1 = random < 60
value = 1100
ignorehitpause = 1

;###################################################################################################
;                                     STATE -3 (empty - commands in CMD)
;###################################################################################################

[Statedef -3]

; Command triggers must be in moricmd.cns, not here

;###################################################################################################
;                                     STATE -2
;###################################################################################################

[Statedef -2]

; Set erase flag after move connects
[State -2, Set Erase on Hit]
type = VarSet
trigger1 = MoveHit = 1
trigger1 = HitPauseTime = 0
var(41) = 1
ignorehitpause = 1

; Buffer timer increment
[State -2, Buffer Timer]
type = VarAdd
trigger1 = var(40) > 0
var(40) = -1
ignorehitpause = 1

