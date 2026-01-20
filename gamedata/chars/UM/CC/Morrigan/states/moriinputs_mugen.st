;  ___________________________________
; | Morrigan by Phantom.of.the.Server |
; | MUGEN INPUT CONVERSION by Claude  |
;  ___________________________________
;
; This file converts the Ikemen GO inputs.zss to MUGEN-compatible ST format
; Original: inputs.zss (2961 lines of Ikemen ZSS)
;
; The original ZSS used:
; - inputTime() triggers for frame-perfect input detection
; - map() variables for command buffering
; - Complex motion detection (QCF, QCB, DP, etc.)
;
; MUGEN approach:
; - Use standard command definitions in moricmd.cns
; - Use var() for any needed state tracking
; - Simplified input handling that works with MUGEN's native command system
;
; VAR MAPPING for inputs:
; var(40) = cmd_buffer_timer
; var(41) = cmd_erase_flag (0 = keep, 1 = erase)
; var(42) = dash_buffer
; var(43) = highjump_buffer
; var(44) = last_direction (1=F, 2=B, 3=D, 4=U, 5=DF, 6=DB, 7=UF, 8=UB)

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

; Track dash input for forward dash
[State -4, Dash Buffer Forward]
type = VarSet
trigger1 = command = "FF"
var(42) = 10
ignorehitpause = 1

[State -4, Dash Buffer Back]
type = VarSet
trigger1 = command = "BB"
var(42) = -10
ignorehitpause = 1

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

; Track high jump input
[State -4, High Jump Buffer]
type = VarSet
trigger1 = command = "highjump"
var(43) = 8
ignorehitpause = 1

[State -4, High Jump Buffer Decay]
type = VarAdd
trigger1 = var(43) > 0
var(43) = -1
ignorehitpause = 1

; Track last direction for motion detection assist
[State -4, Direction Track F]
type = VarSet
trigger1 = command = "holdfwd"
trigger1 = command != "holddown"
trigger1 = command != "holdup"
var(44) = 1
ignorehitpause = 1

[State -4, Direction Track B]
type = VarSet
trigger1 = command = "holdback"
trigger1 = command != "holddown"
trigger1 = command != "holdup"
var(44) = 2
ignorehitpause = 1

[State -4, Direction Track D]
type = VarSet
trigger1 = command = "holddown"
trigger1 = command != "holdfwd"
trigger1 = command != "holdback"
var(44) = 3
ignorehitpause = 1

[State -4, Direction Track U]
type = VarSet
trigger1 = command = "holdup"
trigger1 = command != "holdfwd"
trigger1 = command != "holdback"
var(44) = 4
ignorehitpause = 1

[State -4, Direction Track DF]
type = VarSet
trigger1 = command = "holddown"
trigger1 = command = "holdfwd"
var(44) = 5
ignorehitpause = 1

[State -4, Direction Track DB]
type = VarSet
trigger1 = command = "holddown"
trigger1 = command = "holdback"
var(44) = 6
ignorehitpause = 1

[State -4, Direction Track UF]
type = VarSet
trigger1 = command = "holdup"
trigger1 = command = "holdfwd"
var(44) = 7
ignorehitpause = 1

[State -4, Direction Track UB]
type = VarSet
trigger1 = command = "holdup"
trigger1 = command = "holdback"
var(44) = 8
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
;                                     COMMAND NORMALIZATION
;###################################################################################################
; These states help normalize MUGEN's command system to work more like Ikemen's
; The original ZSS had complex input buffering - this simplified version
; relies on MUGEN's native command definitions in moricmd.cns

[Statedef -3]

; Nothing critical needed here for basic functionality
; The command definitions in moricmd.cns handle the input parsing

[Statedef -2]

; Set erase flag after move connects (simplified from ZSS)
[State -2, Set Erase on Hit]
type = VarSet
trigger1 = MoveHit = 1
trigger1 = pausetime = 0
var(41) = 1
ignorehitpause = 1

; Buffer timer increment
[State -2, Buffer Timer]
type = VarAdd
trigger1 = var(40) > 0
var(40) = -1
ignorehitpause = 1
