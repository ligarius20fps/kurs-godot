@tool
extends EditorScript

func fcja() -> void:
	print("hi")
	var c: Character = Character.new("test", 1, "testtt")
	print(c)
	const i: int = 2
	const tab: Array[int] = [3,5,67,62,8,34,233,6]
	print(i)
	print(tab)

func _run() -> void:
	fcja()
	print("bye")
