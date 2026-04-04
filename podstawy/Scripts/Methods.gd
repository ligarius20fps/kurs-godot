@tool
extends EditorScript

func rollDice() -> int:
	return range(1,7).pick_random()

func rollDice2() -> int:
	#return randi() % 6 + 1
	#korzystając z reszty z dzielenia liczby losowej od 0 do (2^32)-1
	#rzut kostką nie będzie równomierny:
	# 1 - 0, 6,  ... (2^32)-10, (2^32)-4
	# 2 - 1, 7,  ... (2^32)-9,  (2^32)-3
	# 3 - 2, 8,  ... (2^32)-8,  (2^32)-2
	# 4 - 3, 9,  ... (2^32)-7,  (2^32)-1
	# 5 - 4, 10, ... (2^32)-6
	# 6 - 5, 11, ... (2^32)-5
	
	# ((2^32)-1) % 6 == 3
	# oznacza to, że liczba zdarzeń rzutu 5/6 jest o jeden mniejsza od rzutu 1/2/3/4
	var my_rand = (2**32)-1
	while my_rand >= 2 ** 32 - 4:
		my_rand = randi()
	# teraz mamy gwarancję, że prawdopodobieństwo jest takie same
	return my_rand % 6 + 1

func dodaj2(my_num: int) -> void:
	my_num+=2
	print("w funkcji: %d" % [my_num])
# -----ZADANIE-----
# Write a function called takes_damage(current_health: int, damage: int) -> int
# It should subtract damage from current_health
# If health goes below 0, set it to 0
# Return the new health
func takes_damage(current_health: int, damage: int) -> int:
	return clamp(current_health - damage, 0, current_health)
	
func showHP(health: int) -> void:
	print("HP: %d" % health)

func _run() -> void:
	var result
	for i in range(4):
		result = rollDice2()
		print(result)
	dodaj2((result)) # przekazuję wartość
	print("w mainie: %d" % [result])
	print("-----ZADANIE-----")
	var health = 100
	showHP(health)
	# In _run(), call it like this:
	health = takes_damage(health, 30)
	# print the new health
	print("OW!")
	showHP(health)
	
	# If health is 0, print "Game Over!"
	if health <= 0:
		print("Game Over!")
	# Otherwise print "Still alive!"
	else:
		print("Still alive!")
