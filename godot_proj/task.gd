class_name Task extends Resource

@export_storage var _category: int
@export_storage var _start_time: int
@export_storage var _end_time: int

func get_category_id() -> int:
	return _category

func get_elapsed_time() -> int:
	if _end_time == 0:
		return Time.get_unix_time_from_datetime_dict(Time.get_datetime_dict_from_system(true)) - _start_time
	return _end_time - _start_time

func get_elapsed_time_string() -> String:
	var time = get_elapsed_time()
	@warning_ignore("integer_division")
	var h: int = time / 3600
	time -= h * 3600
	@warning_ignore("integer_division")
	var m: int = time / 60
	time -= m * 60
	var s: int = time
	return "%d:%02d:%02d" % [h, m, s]

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
