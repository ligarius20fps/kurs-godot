class_name Character

var _name: String = "Jeff"
var _weapon: String = "Stick"
var _age: int = 25
var _health: int = 100

func print_health():
	print("%s's HP: %d" % [_name, _health])

func say_info():
	print("%s(%d)" % [_name, _age])
	print("Weapon: %s" % _weapon)
	print("HP: %s" % _health)

func get_health() -> int:
	return _health

func set_health(health: int) -> void:
	_health = clamp(health, 0, 100)

func _init(name:String = "Jeff", health: int = 100, age: int = 25, weapon: String = ""):
	_name = name
	_age = age
	_health = clamp(health, 0, 100)
	_weapon = weapon
