class_name Task extends Resource

@export_storage var _category: int
@export_storage var _start_time: int
@export_storage var _end_time: int

func end_task():
	_end_time = Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system(true))
	Project.save_doc()

func is_running() -> bool:
	return _end_time == 0

static func start_task(cat: int) -> Task:
	var t := Task.new()
	t._category = cat
	t._start_time = Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system(true))
	t._end_time = 0
	Project.get_data().push_task(t)
	Project.save_doc()
	return t
