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
