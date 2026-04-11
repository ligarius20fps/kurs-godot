extends Node

@onready var hero: Hero = $Hero
@onready var wizard: Wizard = $Wizard

func _on_wizard_cast_spell() -> void:
	hero.spelled()
	#wizard.cast_spell.disconnect(_on_wizard_cast_spell)


func _on_hero_cast_spell() -> void:
	wizard.spelled()
	#hero.cast_spell.disconnect(_on_hero_cast_spell)

func _ready() -> void:
	hero.cast_spell.connect(_on_hero_cast_spell, ConnectFlags.CONNECT_ONE_SHOT)
	wizard.cast_spell.connect(_on_wizard_cast_spell, CONNECT_ONE_SHOT)
