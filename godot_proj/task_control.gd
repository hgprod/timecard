class_name TaskControl extends Container

@warning_ignore("unused_signal")
signal task_changed(task: Task)

@onready var _data_control := %DataControl

func _ready() -> void:
	if is_instance_valid(Project.get_data().get_running_task()): visible = true
	_data_control.load_running_task()

func _on_set_category(cat: Category) -> void:
	var valid := is_instance_valid(cat)
	visible = valid
	if valid: _data_control.set_category(cat)
