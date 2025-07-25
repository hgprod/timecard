class_name CategorySequence extends Container

@warning_ignore("unused_signal")
signal category_changed(cat: Category)

func _on_task_changed(task: Task) -> void:
	visible = not is_instance_valid(task)
