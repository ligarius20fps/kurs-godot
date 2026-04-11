class_name Wizard
extends Node2D

const MAX_SCALE = 2

@onready var appear_timer: Timer = $AppearTimer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	#magik się spłaszcza
	var scale_transform = Vector2(transform.x.x, transform.y.y)
	scale_transform.y += delta
	if abs(scale_transform.y) >= 2:
		scale_transform.y = 0
	scale_transform.x = MAX_SCALE - scale_transform.y
	transform.x.x = scale_transform.x
	transform.y.y = scale_transform.y

#pojawia się po 2 sekundach
func _on_appear_timer_timeout() -> void:
	show()
