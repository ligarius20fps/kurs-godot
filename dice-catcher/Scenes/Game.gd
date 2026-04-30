extends Node2D

const DICE = preload("uid://b402sficj377r")
@onready var timer: Timer = $SpawnDiceTimer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound


# kostka pojawi się nad planszą
const off_screen_spawn_distnace = 80
# powinien być margines w którym miejscu może upaść kostka
const landing_margin = 260
var screen_size:Vector2

func _ready():
	screen_size = get_viewport_rect().size
	spawn_dice()

func spawn_dice():
	var new_dice: Dice = DICE.instantiate()
	var spawn_point = Vector2(
		randf_range(landing_margin, screen_size.x - landing_margin),
		-off_screen_spawn_distnace
	)
	new_dice.off_screen.connect(game_over)
	new_dice.position = spawn_point
	add_child(new_dice)

func game_over():
	print("Game Over!")
	game_over_sound.play()
