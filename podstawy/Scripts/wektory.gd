@tool
extends EditorScript

func moje():
	print("funkcja się wykonała")
	return 2

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	const v1 = Vector2(25, 20)
	const v2 = Vector2(20, 100)
	print("v1: " + str(v1))
	print("v2: " + str(v2))
	print("v1 > v2? " + str(v1 > v2))
	print("czy v1 jest dłuższy od v2? " + str(v1.length() > v2.length()))
	print("\nklasyka: 0.1 + 0.2 == 0.3? " + str(0.1+0.2==0.3))
	print("na oko: " + str(is_equal_approx(0.1+0.2, 0.3)))
	
	var czy_sie_wykona:bool = true or moje() > 1
	print(czy_sie_wykona)
	
	# ćwiczenie
	# Make the script print whether the player is READY TO FIGHT.
	var health: int = 75
	var potions: int = 2
	var enemies: int = 6
	var arrows: int = 11
	
	# Each enemy needs 2 arrows.
	# Create a variable called arrows_needed and calculate how many arrows are required.
	var arrows_needed:int = enemies * 2
	
	# Create a bool called enough_arrows.
	# It should be true if arrows is greater than or equal to arrows_needed.
	var enough_arrows:bool = arrows >= arrows_needed

	# Each potion heals 20 health.
	# Create a variable called healed_health and calculate the new health.
		#rozumiem, że healed_health to ilość zdrowia po wypiciu mikstur, zgadza się?
	var healed_health:int = 20 * potions + health

	# Create a bool called is_safe.
	# The player is safe if healed_health is 100 or more.
	var is_safe:bool = healed_health >= 100

	# Create a bool called ready_to_fight.
	# The player is ready if they have enough arrows AND they are safe.
	var ready_to_fight:bool = enough_arrows and is_safe
	if ready_to_fight:
		print("READY TO FIGHT !")
	else:
		print("I need to prepare...")
