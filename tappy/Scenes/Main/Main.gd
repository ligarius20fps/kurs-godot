extends Control

func _unhandled_input(event: InputEvent) -> void:
	# przycisk do skakania
	if event.is_action_pressed("jump"):
		# przejdź do gry
		GameManager.load_game()
