

# func vibrate(ms := 30):
extends Node

var vibration_enabled := true
func vibrate(ms := 30):
	if OS.has_feature("mobile") and Settings.vibration_enabled:
		Input.vibrate_handheld(ms)

func _on_vibration_toggle_toggled(pressed: bool):
	Settings.vibration_enabled = pressed

# Will be deleted
var vibration_enabled := true
func vibrate(ms := 30):
if OS.has_feature("mobile") and Settings.vibration_enabled:
Input.vibrate_handheld(ms)

func _on_vibration_toggle_toggled(pressed: bool):


