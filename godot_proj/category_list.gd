class_name CategoryList extends Resource

@export_storage var _list: Array[Category]

func debug_print_list():
	print("Category Listing:")
	for item in _list:
		print("%s, id: %d, parent id: %d" % [item.get_category_name(), item.get_category_id(), item.get_category_parent()])
	print("End Category Listing")

func add_category(name: String, parent: Category) -> Category:
	var next_id := _next_id()
	var cat := Category.create_category(next_id, name, parent.get_category_id() if is_instance_valid(parent) else 0)
	_list.push_back(cat)
	Project.save_doc()
	return cat

func get_categories_for_parent(parent: Category) -> Array[Category]:
	var pid = parent.get_category_id() if is_instance_valid(parent) else 0
	var list: Array[Category] = []
	for item in _list:
		if item.get_category_parent() == pid: list.push_back(item)
	return list

func _next_id() -> int:
	var max_id: int = 0
	for item in _list:
		if item.get_category_id() > max_id: max_id = item.get_category_id()
	return max_id + 1
