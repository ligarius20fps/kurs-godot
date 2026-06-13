class_name Game
extends Node

const PIPES = preload("uid://dms402y81minq")

@onready var tappy_plane: TappyPlane = $TappyPlane

@onready var top_spawn: Marker2D = $UpperPipeSpawner
@onready var bottom_spawn: Marker2D = $LowerPipeSpawner

@onready var pipes_holder: Node = $PipesHolder

@onready var spawn_timer: Timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tappy_plane.plane_died.connect(freeze_all)
	spawn_pipe()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func spawn_pipe():
	# x wiemy gdzie będzie
	var spawn_vector = Vector2(top_spawn.position.x, 0)
	# wylosuj po osi y punkt
	var spawn_y: float = randf_range(top_spawn.position.y, bottom_spawn.position.y)
	spawn_vector.y = spawn_y
	# dodaj w tym punkcie rury
	var pipes: Pipes = PIPES.instantiate()
	pipes.position = spawn_vector
	pipes_holder.add_child(pipes)

func freeze_all():
	spawn_timer.stop()
