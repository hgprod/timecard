class_name DataDocument extends Resource

@export_storage var _categories: CategoryList
@export_storage var _tasks: Array[Task]

func get_categories() -> CategoryList:
	if not is_instance_valid(_categories): _categories = CategoryList.new()
	return _categories

func push_task(task: Task):
	_tasks.push_back(task)

func get_running_task() -> Task:
	for t in _tasks:
		if t.is_running(): return t
	return null

func get_task_list() -> Array[Task]:
	return _tasks
