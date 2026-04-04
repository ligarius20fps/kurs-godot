@tool
extends EditorScript

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var inventory: Array[String] = ["Stick", "Apple", "Torch"]
	# Add Sword and Shield
	inventory.append_array(["Sword", "Shield"])
	# Remove Apple
	inventory.erase("Apple")
	# Check if Sword is in the inventory
	const checked_item = "Sword"
	print("Do we have %s? " % checked_item + str(checked_item in inventory))
	# use a for loop to print all items in the inventory
	print("Inventory:")
	for item in inventory:
		print(item)
	
	var heroes: Dictionary[String, Dictionary] = {
		"Frodo": {"race": "Hobbit", "weapon": "Sting"},
		"Aragorn": {"race": "Human", "weapon": "Andúril"},
		"Legolas": {"race": "Elf", "weapon": "Bow"}
	}
	# Add Gimli
	heroes.Gimli = {
		"race": "Formula 1",
		"weapon": "Banana peel"
	}
	# Change Legolas weapon
	heroes.Legolas.weapon = "Stick"
	# Print Aragorn weapon
	print(heroes.Aragorn.weapon)
	# use a for loop to print all races and weapons
	var my_values = heroes.values()
	for v in my_values:
		print("%s, %s" % [v.race, v.weapon])
