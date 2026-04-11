extends Node

@onready var hero: Hero = $Hero
@onready var wizard: Wizard = $Wizard

func _on_wizard_cast_spell() -> void:
	hero.spelled()


func _on_hero_cast_spell() -> void:
	wizard.spelled()
