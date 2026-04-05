class_name Character

var name: String = "Jeff"
var weapon: String = "Stick"
var age: int = 25
var health: int = 100

func print_health():
	print("%s's HP: %d" % [name, health])

func say_info():
	print("%s(%d)" % [name, age])
	print("Weapon: %s" % weapon)
	print("HP: %s" % health)

func _init(new_name:String = "Jeff", new_health: int = 100, new_age: int = 25, new_weapon: String = ""):
	name = new_name
	age = new_age
	health = new_health
	weapon = new_weapon
