func _on_up_button_pressed():
	if direction != DOWN:
		direction = UP
func _on_down_button_pressed():
	if direction != UP:
		direction = DOWN
func _on_left_button_pressed():
	if direction != RIGHT:
		direction = LEFT
func _on_right_button_pressed():
	if direction != LEFT:
		direction = RIGHT
Input.vibrate_handheld(duration_ms)
func vibrate(ms := 30):
	if OS.has_feature("mobile"):
		Input.vibrate_handheld(ms)
func _on_up_button_pressed():
	if direction != DOWN:
		direction = UP
		vibrate(20)
func _on_down_button_pressed():
	if direction != UP:
		direction = DOWN
		vibrate(20)
func _on_left_button_pressed():
	if direction != RIGHT:
		direction = LEFT
		vibrate(20)
func _on_right_button_pressed():
	if direction != LEFT:
		direction = RIGHT
		vibrate(20)


