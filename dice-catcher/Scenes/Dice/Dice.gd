class_name Dice
extends Area2D

signal off_screen

@onready var dice: Sprite2D = $Dice

@export
var SPEED:int = 200
@export
var ROTATION_SPEED:float = TAU/4
const max_angle = 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# mówili mi: "nie kręć całą sceną"
	# a zróbmy tak, że będzie spadało na ukos
	var _rotation = randf_range(-max_angle, max_angle)
	rotate(_rotation)
	SPEED = randi_range(100, 400)
	ROTATION_SPEED = randf_range(-TAU, TAU)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	dice.rotate(ROTATION_SPEED * delta)
	move_local_y(SPEED * delta)
	is_off_screen()

func is_off_screen():
	if get_viewport_rect().end.y <= position.y:
		off_screen.emit()
		queue_free()
