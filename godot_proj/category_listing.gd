class_name CategoryListing extends OptionButton

signal selection_changed()

var _parent: Category = null

var _cat_data: Array[Category]
var _selected: Category = null

func get_selected_category() -> Category:
	return _selected

func set_selected_category(cat: Category) -> bool:
	if _parent == null:
		if cat.get_category_parent() == 0:
			_selected = cat
			return true
		else: return false
	if _parent.get_category_id() == cat.get_category_parent():
		_selected = cat
		return true
	return false

func set_parent(parent: Category):
	_parent = parent
	if is_node_ready(): _update_display()

func _enter_tree() -> void:
	if not item_selected.is_connected(_on_selected):
		item_selected.connect(_on_selected)

func _exit_tree() -> void:
	if item_selected.is_connected(_on_selected):
		item_selected.disconnect(_on_selected)

func _ready():
	_update_display()

func _update_display():
	clear()
	_cat_data = Project.get_data().get_categories().get_categories_for_parent(_parent)
	add_item("None Selected", 0)
	for item in _cat_data:
		add_item(item.get_category_name(), item.get_category_id())
	selected = get_item_index(_selected.get_category_id() if is_instance_valid(_selected) else 0)

func _on_selected(_index: int) -> void:
	var id = get_selected_id()
	_selected = null
	for item in _cat_data:
		if item.get_category_id() == id:
			_selected = item
	selection_changed.emit()
