extends Node2D

@onready var samolot: Sprite2D = %Plane
@onready var heli: Sprite2D = $Helicopter
@onready var chrup: AudioStreamPlayer = $chrup
const speed:int = 200
const wind_speed:int = 60
const PI:float = 3.141592653589793238462643383
const rotate_speed:float = PI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# przemieszczaj latające maszyny
	heli.move_local_x(speed * delta * 0.5)
	samolot.move_local_x(speed * delta)
	#samolot.global_translate(Vector2.RIGHT.normalized() * wind_speed * delta)
	
	# samolot śledzi kursor
	var v1:Vector2 = samolot.global_position
	var v2:Vector2 = get_global_mouse_position()
	var angl = (v2 - v1).angle()
	samolot.rotation = angl 
	
	if Input.is_action_pressed("ui_up"):
		samolot.move_local_x(speed * delta)
	
	# obracaj samolotem
	if Input.is_action_pressed("ui_left"):
		samolot.rotate(-rotate_speed * delta)
	if Input.is_action_pressed("ui_right"):
		samolot.rotate(rotate_speed * delta)
	
	if Input.is_action_just_pressed("ui_select"):
		# chrupaj gdy naciskam spację
		chrup.play()
	
	# ćwiczenie: helikopter lata w kółko
	heli.rotate(-rotate_speed / 7 * delta)
