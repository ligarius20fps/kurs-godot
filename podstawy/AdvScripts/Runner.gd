@tool
extends EditorScript

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var jeff: Character = Character.new()
	jeff.print_health()
	jeff._health = 105
	jeff.print_health()
	print(jeff.get_instance_id())
	jeff.say_info()
	
	var bob = Character.new("Bob", 80, 17, "Gun")
	bob.say_info()
	print(bob.get_instance_id())
	print("Bob: OW !")
	bob._health -= 20
	bob.print_health()
	
	var steve:Character = Character.new("Steve", 105, 16, "Sword")
	steve.say_info()
	while steve.get_health() > 0:
		steve.set_health(steve.get_health() - range(17, 24).pick_random())
		steve.print_health()
	if steve.get_health() <= 0:
		print("Steve is dead by now")
