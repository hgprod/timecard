class_name Project extends RefCounted

const save_loc = "user://data_doc.res"

static var _doc: DataDocument

static func get_data() -> DataDocument:
	if is_instance_valid(_doc): return _doc
	if not FileAccess.file_exists(save_loc):
		_doc = DataDocument.new()
		ResourceSaver.save(_doc, save_loc)
		return _doc
	_doc = ResourceLoader.load(save_loc)
	return _doc

static func save_doc():
	if not is_instance_valid(_doc):
		_doc = get_data()
	ResourceSaver.save(_doc, save_loc)
