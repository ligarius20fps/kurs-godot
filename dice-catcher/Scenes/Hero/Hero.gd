class_name Hero
extends Node2D

signal cast_spell

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit_wizard"):
		cast_spell.emit()
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# knajt się kręci
func _process(delta: float) -> void:
	rotate(PI* delta)

func spelled() -> void:
	scale /= 2
	set_process(false)
