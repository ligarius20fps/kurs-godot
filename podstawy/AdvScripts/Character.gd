class_name Character

static var character_count: int = 0:
	get:
		return character_count

var name: String = "Jeff":
	get:
		return name
	set(new_name):
		name = new_name

var weapon: String = "Stick":
	get:
		return weapon
	set(new_weapon):
		weapon = new_weapon

var health: int = 100:
	get:
		print("health getter invoked")
		return health
	set(new_health):
		print("health setter invoked(%d)" % new_health)
		health = clamp(new_health, 0, 100)

func print_health():
	print("%s's HP: %d" % [name, health])

func say_info():
	print("%s" % name)
	print("Weapon: %s" % weapon)
	print("HP: %s" % health)

func get_health() -> int:
	return health

func set_health(health: int) -> void:
	health = clamp(health, 0, 100)

func _init(name:String, health: int, weapon: String):
	self.name = name
	self.health = health
	self.weapon = weapon
	character_count += 1
