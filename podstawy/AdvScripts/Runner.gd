@tool
extends EditorScript

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var my_char: Character = Character.new()
	my_char.print_health()
	my_char.health = 75
	my_char.print_health()
	print(my_char.get_instance_id())
	my_char.say_info()
	var new_char = Character.new("Bob", 80, 17, "Gun")
	new_char.say_info()
	print(new_char.get_instance_id())
