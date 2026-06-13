class_name Pipes
extends Node2D

@onready var score_sound: AudioStreamPlayer = $ScoreSound

const SPEED = 120

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func kill_pipes() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is TappyPlane:
		body.die()

func score(body: Node2D) -> void:
	if body is TappyPlane:
		score_sound.play()
