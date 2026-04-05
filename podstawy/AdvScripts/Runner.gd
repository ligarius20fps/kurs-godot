@tool
extends EditorScript

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	# liczba postaci nie resetuje się po ponownym uruchomieniu aplikacji
	Character.character_count = 0
	var jeff: Character = Character.new("Jeff", 100, "Stick")
	#jeff.print_health()
	#jeff.health = 105
	#jeff.print_health()
	#print(jeff.get_instance_id())
	#jeff.say_info()
	
	var bob = Character.new("Bob", 80, "Gun")
	#bob.say_info()
	#print(bob.get_instance_id())
	#print("Bob: OW !")
	#bob.health -= 20
	#bob.print_health()
	
	var steve:Character = Character.new("Steve", 105, "Sword")
	#steve.say_info()
	#while steve.get_health() > 0:
		#steve.set_health(steve.get_health() - range(17, 24).pick_random())
		#steve.print_health()
	#if steve.get_health() <= 0:
		#print("%s is dead by now" % steve._name)
		
	var johnny: Character = Character.new("Johnny", 2000, "Bare fists")
	johnny.say_info()
	while johnny.health > 0:
		johnny.health = johnny.health - range(17, 24).pick_random()
		johnny.print_health()
	if johnny.health <= 0:
		print("%s is dead by now" % johnny.name)
	
	print("character_count: %d" % Character.character_count)
