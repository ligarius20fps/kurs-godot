extends Node2D

const DICE = preload("uid://b402sficj377r")
@onready var timer: Timer = $SpawnDiceTimer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound
const STOPPABLE_GROUP = "stoppable"

var score:int = 0

# kostka pojawi się nad planszą
const off_screen_spawn_distnace = 80
# powinien być margines w którym miejscu może pojawić się kostka
const spawn_margin = 260
var screen_size:Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("new_game"):
		new_game()

func _ready():
	screen_size = get_viewport_rect().size
	spawn_dice()

func spawn_dice():
	var new_dice: Dice = DICE.instantiate()
	var spawn_point = Vector2(
		randf_range(spawn_margin, screen_size.x - spawn_margin),
		-off_screen_spawn_distnace
	)
	new_dice.off_screen.connect(game_over)
	new_dice.position = spawn_point
	add_child(new_dice)

func freeze_all():
	timer.stop()
	var to_stop:Array[Node] = get_tree().get_nodes_in_group(STOPPABLE_GROUP)
	for my_node in to_stop:
		my_node.set_physics_process(false)

func new_game():
	get_tree().reload_current_scene()
	

func score_point(points: int):
	score += points
	print("Score: %d" % score)

func game_over():
	print("Game Over! Total score: %d" % score)
	game_over_sound.play()
	freeze_all()
