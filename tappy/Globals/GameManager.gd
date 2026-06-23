extends Node

const MAIN_SCREEN = preload("uid://bk7wx4bliuk8n")
const GAME = preload("uid://cmvi8rt67bmrw")

func load_main() -> void:
	get_tree().change_scene_to_packed(MAIN_SCREEN)

func load_game() -> void:
	get_tree().change_scene_to_packed(GAME)
