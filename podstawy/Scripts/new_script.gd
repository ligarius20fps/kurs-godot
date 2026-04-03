@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	const powitanie: String = "Hello, " + "World!"
	for i in range(0,40):
		print(str(i) + ": " + type_string(i))
		
	print(powitanie)
	
	# ćwiczenie
	const imie: String = "mati"
	const wiek: int = 123
	var health: float = 100.0
	var alive: bool = health > 0
	
	print(imie)
	print(wiek)
	print(health)
	print(alive)
	print(type_string(typeof(imie)))
	print(type_string(typeof(wiek)))
	print(type_string(typeof(health)))
	print(type_string(typeof(alive)))
