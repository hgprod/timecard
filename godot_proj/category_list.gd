class_name CategoryList extends Resource

var _list: Array[Category]

func add_category(name: String, parent: Category) -> Category:
	var next_id := _next_id()
	var cat := Category.create_category(next_id, name, parent.get_category_id() if is_instance_valid(parent) else -1)
	_list.push_back(cat)
	return cat

func get_categories_for_parent(parent: Category) -> Array[Category]:
	var pid = parent.get_category_id() if is_instance_valid(parent) else -1
	var list: Array[Category] = []
	for item in _list:
		if item.get_category_parent() == pid: list.push_back(item)
	return list

func _next_id() -> int:
	var max: int = -1
	for item in _list:
		if item.get_category_id() > max: max = item.get_category_id()
	return max + 1
