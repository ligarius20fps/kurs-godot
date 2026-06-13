class_name TappyPlane
extends CharacterBody2D

# trzy statusy samolotu
# ALIVE - można skakać i obrót zależy od prędkości
# DYING - gdy się dotknęło przeszkody, to przechodzi na ten status i cały czas się szybko kręci
@onready var dying_timer: Timer = $DyingTimer
# DIED - po chwili po statusie DYING przechodzi na ten status i samolot jest do góry nogami
enum PLANE_STATUS {ALIVE, DYING, DIED}

@onready var engine_sound: AudioStreamPlayer = $EngineSound

signal plane_died

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
const JUMP_POWER: float = -500.0
var jumped: bool = false
var plane_status = PLANE_STATUS.ALIVE
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	# przycisk do skakania
	if event.is_action_pressed("jump"):
		jumped = true

# jak samolot umarł
func die():
	animated_sprite_2d.pause()
	# silnik przestaje warkotać
	engine_sound.stop()
	# umiera, czyli się kręci
	plane_status = PLANE_STATUS.DYING
	#get_tree().paused = true
	emit_signal("plane_died")
	velocity = Vector2()
	dying_timer.start()

func _died():
	plane_status = PLANE_STATUS.DIED

func _physics_process(delta: float) -> void:
	match plane_status:
		PLANE_STATUS.ALIVE:
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
		PLANE_STATUS.DYING:
			rotate(8 * PI * delta)
		PLANE_STATUS.DIED:
			rotation = 0
			scale = Vector2(1,-1)
			get_tree().paused = true
			set_physics_process(false)
	# rusz obiektem, to jest na samym końcu
	move_and_slide()
