class_name Character

var name: String = "Jeff"
var weapon: String = "Stick"
var age: int = 25
var health: int = 100

func print_health():
	print("%s's HP: %d" % [self.name, self.health])

func say_info():
	print("%s(%d)" % [self.name, self.age])
	print("Weapon: %s" % self.weapon)
	print("HP: %s" % self.health)

func get_health() -> int:
	return self.health

func set_health(health: int) -> void:
	self.health = clamp(health, 0, 100)

func _init(name:String = "Jeff", health: int = 100, age: int = 25, weapon: String = ""):
	self.name = name
	self.age = age
	self.health = clamp(health, 0, 100)
	self.weapon = weapon
