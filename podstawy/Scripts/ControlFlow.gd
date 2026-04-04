@tool
extends EditorScript


# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:
	var tab: Array[Variant] = [1,5,"siema",6,3,7]
	for i in tab:
		print(i)
	
	var my_tab: Array =  range(1, 6, 2)
	print(my_tab)
	
	var my_dict: Dictionary = {1: 2, 3: 4}
	tab.assign(my_tab)
	print(tab)
