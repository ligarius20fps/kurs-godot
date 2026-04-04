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

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var result
	for i in range(4):
		result = rollDice2()
		print(result)
	dodaj2((result)) # przekazuję wartość
	print("w mainie: %d" % [result])
