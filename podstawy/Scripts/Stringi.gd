@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	const napis: String = "Zdanie to jest Testowe"
	print(napis.substr(3, 7))
	napis.find
