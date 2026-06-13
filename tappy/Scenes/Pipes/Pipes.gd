class_name Pipes
extends Node2D

const SPEED = 120

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func kill_pipes() -> void:
	queue_free()
