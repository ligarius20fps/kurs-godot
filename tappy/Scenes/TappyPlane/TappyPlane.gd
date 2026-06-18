class_name TappyPlane
extends CharacterBody2D

# do odtwarzania animacji umierania samolotu
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var propeller_animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound

var alive = true
var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
const JUMP_POWER: float = -500.0
var jumped: bool = false

signal plane_died

func _unhandled_input(event: InputEvent) -> void:
	# przycisk do skakania
	if event.is_action_pressed("jump"):
		jumped = true

func _physics_process(delta: float) -> void:
	if alive:
		# spadamy
		velocity.y += gravity * delta
		# żeby prędkość się zgadzała z rotacją,
		# rotacja to arkustangens z prędkości
		rotation = atan(velocity.y / 1000)
		# skocz
		if jumped:
			velocity.y = JUMP_POWER
			jumped = !jumped
		# jak jest na podłodze, to giń
		if is_on_floor():
			die()
	move_and_slide()

# jak samolot umarł
func die():
	# wyprostuj i nie ruszaj się
	rotation = 0
	velocity = Vector2()
	# śmigło się nie kręci
	propeller_animation.pause()
	# silnik przestaje warkotać
	engine_sound.stop()
	# umiera, czyli cały się kręci
	animation_player.play("dying")
	emit_signal("plane_died")
	get_tree().paused = true
	set_physics_process(false)
	
