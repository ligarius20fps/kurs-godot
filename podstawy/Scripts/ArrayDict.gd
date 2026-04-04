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
