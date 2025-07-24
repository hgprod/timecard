class_name Category extends Resource

var _id: int
var _name: String
var _parent: int

func get_category_id() -> int:
	return _id

func get_category_name() -> String:
	return _name

func get_category_parent() -> int:
	return _id

static func create_category(id: int, name: String, parent: int) -> Category:
	var cat := Category.new()
	cat._id = id
	cat._name = name
	cat._parent = parent
	return cat
