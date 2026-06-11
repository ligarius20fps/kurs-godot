extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
const JUMP_POWER: float = -500.0
var jumped: bool = false
var alive = true
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	# przycisk do skakania
	if event.is_action_pressed("jump"):
		jumped = true

#jak samolot umarł
func die():
	# będzie duszkiem
	animated_sprite_2d.modulate = Color(1,1,1,0.5)
	# śmigło nie kręci się
	animated_sprite_2d.pause()
	# fizyka się stopuje
	set_physics_process(false)
	# nie żyje
	alive = false

func _physics_process(delta: float) -> void:
	# jak jest na podłodze, to giń
	if is_on_floor():
		die()
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
	# rusz obiektem, to jest na samym końcu
	move_and_slide()
