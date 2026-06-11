extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
const JUMP_POWER: float = -500.0
var jumped: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	# przycisk do skakania
	if event.is_action_pressed("jump"):
		jumped = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
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
