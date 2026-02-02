extends Node2D

# Grid settings
const GRID_SIZE := 20
const WIDTH := 32
const HEIGHT := 24

# Directions
const UP := Vector2(0, -1)
const DOWN := Vector2(0, 1)
const LEFT := Vector2(-1, 0)
const RIGHT := Vector2(1, 0)

var direction := RIGHT
var snake := []
var food := Vector2.ZERO
var move_timer := 0.0
var move_delay := 0.15

#Controls
var touch_start := Vector2.ZERO
var touch_end := Vector2.ZERO
var min_swipe_distance := 30


func _ready():
	start_game()

func start_game():
	snake.clear()
	snake.append(Vector2(10, 12))
	snake.append(Vector2(9, 12))
	snake.append(Vector2(8, 12))
	direction = RIGHT
	spawn_food()

func spawn_food():
	while true:
		food = Vector2(
			randi() % WIDTH,
			randi() % HEIGHT
		)
		if food not in snake:
			break

func _process(delta):
	handle_input()

	move_timer += delta
	if move_timer >= move_delay:
		move_timer = 0
		move_snake()
		queue_redraw()

func handle_input():
	if Input.is_action_pressed("ui_up") and direction != DOWN:
		direction = UP
	elif Input.is_action_pressed("ui_down") and direction != UP:
		direction = DOWN
	elif Input.is_action_pressed("ui_left") and direction != RIGHT:
		direction = LEFT
	elif Input.is_action_pressed("ui_right") and direction != LEFT:
		direction = RIGHT

func move_snake():
	var new_head = snake[0] + direction

# Wall collision
	if new_head.x < 0 or new_head.y < 0 or new_head.x >= WIDTH or new_head.y >= HEIGHT:
		start_game()
		return
# Self collision
	if new_head in snake:
		start_game()
		return
snake.insert(0, new_head)

	# Eat food
	if new_head == food:
		spawn_food()
	else:
		snake.pop_back()

func _draw():
	# Draw snake
	for part in snake:
		draw_rect(
			Rect2(part * GRID_SIZE, Vector2(GRID_SIZE, GRID_SIZE)),
			Color.GREEN
		)
	# Draw food
	draw_rect(
		Rect2(food * GRID_SIZE, Vector2(GRID_SIZE, GRID_SIZE)),
		Color.RED
	)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touch_start = event.position
		else:
			touch_end = event.position
			handle_swipe()

func handle_swipe():
	var swipe = touch_end - touch_start

	if swipe.length() < min_swipe_distance:
		return
if abs(swipe.x) > abs(swipe.y):
		# Horizontal swipe
		if swipe.x > 0 and direction != LEFT:
			direction = RIGHT
elif swipe.x < 0 and direction != RIGHT:
			direction = LEFT
else:
		# Vertical swipe
		if swipe.y > 0 and direction != UP:
			direction = DOWN
		elif swipe.y < 0 and direction != DOWN:
			direction = UP

