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
