extends Node2D

const GRID_SIZE := 20
const WIDTH := 32
const HEIGHT := 24

const UP := Vector2(0, -1)
const DOWN := Vector2(0, 1)
const LEFT := Vector2(-1, 0)
const RIGHT := Vector2(1, 0)

var direction := RIGHT
var snake := []
var food := Vector2.ZERO
var move_timer := 0.0
var move_delay := 0.15

func _ready():
	start_game()

func start_game():
	snake.clear()
	snake.append(Vector2(10, 12))
	snake.append(Vector2(9, 12))
	snake.append(Vector2(8, 12))
	direction = RIGHT
	spawn_food()

func _process(delta):
	move_timer += delta
	if move_timer >= move_delay:
		move_timer = 0
		move_snake()
		queue_redraw()

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

	# Move snake
	snake.insert(0, new_head)


	if new_head == food:
		spawn_food()
		vibrate(40)
	else:
		snake.pop_back()

func spawn_food():
	while true:
		food = Vector2(randi() % WIDTH, randi() % HEIGHT)
		if food not in snake:
			break

func _draw():
	for part in snake:
		draw_rect(Rect2(part * GRID_SIZE, Vector2(GRID_SIZE, GRID_SIZE)), Color.GREEN)

	draw_rect(Rect2(food * GRID_SIZE, Vector2(GRID_SIZE, GRID_SIZE)), Color.RED)

func vibrate(ms := 30):
	if OS.has_feature("mobile"):
		Input.vibrate_handheld(ms)

# --- BUTTON CONTROLS ---

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


# Functions to be added
if combo_count >= 5:
	Engine.time_scale = 0.6
	await get_tree().create_timer(0.25).timeout
	Engine.time_scale = 1.0

var snake_color := Color.GREEN
Color.GREEN
snake_color
if combo_count >= 5:
	snake_color = Color.GOLD
elif combo_count >= 3:
	snake_color = Color.ORANGE
else:
	snake_color = Color.GREEN

# Snake color change
#var snake_color: Color = Color.GREEN
#var segments: Array = []
#@onready var head = $Head
#@onready var head = $Head

# To be deleted
var snake_color: Color.BLACK
var segments: Array = []
@onready var head = $Head







	
	


