extends Node

var vibration_enabled := true
func vibrate(ms := 30):
	if OS.has_feature("mobile") and Settings.vibration_enabled:
		Input.vibrate_handheld(ms)

VibrationToggle

