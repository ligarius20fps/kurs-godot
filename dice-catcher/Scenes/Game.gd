extends Node2D

const DICE = preload("uid://b402sficj377r")
@onready var timer: Timer = $Pausable/SpawnDiceTimer
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound
@onready var score_label: Label = $ScoreLabel
@onready var bgm: AudioStreamPlayer = $BGM
@onready var pausable: Node = $Pausable


const STOPPABLE_GROUP = "stoppable"

var _score:int = 0

# kostka pojawi się nad planszą
const off_screen_spawn_distnace = 80
# powinien być margines w którym miejscu może pojawić się kostka
const spawn_margin = 260
var screen_size:Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("new_game"):
		new_game()

func _ready():
	update_score_label()
	screen_size = get_viewport_rect().size
	spawn_dice()

func update_score_label():
	score_label.text = "%04d" % _score

func spawn_dice():
	var new_dice: Dice = DICE.instantiate()
	var spawn_point = Vector2(
		randf_range(spawn_margin, screen_size.x - spawn_margin),
		-off_screen_spawn_distnace
	)
	new_dice.off_screen.connect(game_over)
	new_dice.position = spawn_point
	pausable.add_child(new_dice)

func new_game():
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func score_point(points: int):
	_score += points
	update_score_label()

func game_over():
	bgm.stop()
	game_over_sound.play()
	get_tree().paused = true
