@tool
extends EditorScript

enum test {A, B, C, D}

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	const ss:test = test.A
	match ss:
		test.A:
			print("samogłoska")
		_:
			print("spółgłoska")
