extends Node2D

const MAX_SCALE = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scale_transform = Vector2(transform.x.x, transform.y.y)
	scale_transform.y += delta
	if abs(scale_transform.y) >= 2:
		scale_transform.y = 0
	scale_transform.x = MAX_SCALE - scale_transform.y
	transform.x.x = scale_transform.x
	transform.y.y = scale_transform.y
