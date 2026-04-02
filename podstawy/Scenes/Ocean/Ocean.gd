extends Node2D

@onready var samolot: Sprite2D = $Plane
@onready var heli: Sprite2D = $Helicopter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# przemieszczaj latające maszyny
	const speed:int = 200
	const PI:float = 3.141592653589793238462643383
	const rotate_speed:float = PI
	samolot.move_local_x(speed * delta)
	heli.move_local_x(speed * delta * 0.5)
	
	# obracaj samolotem
	if Input.is_action_pressed("ui_left"):
		samolot.rotate(-rotate_speed * delta)
	if Input.is_action_pressed("ui_right"):
		samolot.rotate(rotate_speed * delta)
	
	# ćwiczenie: helikopter lata w kółko
	heli.rotate(rotate_speed / 8 * delta)
