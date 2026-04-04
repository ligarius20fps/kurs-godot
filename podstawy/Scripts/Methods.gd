@tool
extends EditorScript

func rollDice():
	return range(1,7).pick_random()

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	print(rollDice())
