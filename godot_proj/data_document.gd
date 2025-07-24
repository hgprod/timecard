class_name DataDocument extends Resource

var _categories: CategoryList

func get_categories() -> CategoryList:
	return _categories

func save_doc():
	ResourceSaver.save(self)
