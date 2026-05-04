extends Area2D
class_name Fox

signal dice_eaten

@onready var fox: Sprite2D = $Fox
@onready var chrup: AudioStreamPlayer2D = $Chrup

@export var SPEED = 400
const MARGIN = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var move:float = Input.get_axis("ui_left", "ui_right")
	if not is_zero_approx(move):
		fox.flip_h = (move > 0)
	position.x += move * SPEED * delta
	position.x = clampf(position.x, 53.0, 1093.0)


func eat_dice(area: Area2D) -> void:
	if area is Dice:
		chrup.play()
		area.queue_free()
		dice_eaten.emit(1)
