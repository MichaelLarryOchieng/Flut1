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
