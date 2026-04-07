class_name Hero
extends Node2D

var p_f: int = 0
var ph_f: int = 0

func _init() -> void:
	print("_init(%s %s)" % [get_instance_id(), name])

func _enter_tree() -> void:
	print("_enter_tree(%s %s)" % [get_instance_id(), name])

func _exit_tree() -> void:
	print("_exit_tree(%s %s)" % [get_instance_id(), name])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("_ready(%s %s)" % [get_instance_id(), name])


# knajt się kręci
func _process(delta: float) -> void:
	p_f += 1
	print("_process %d" % p_f)
	rotate(4* delta)

func _physics_process(_delta: float) -> void:
	ph_f += 1
	print("_physics_process %d" % ph_f)
