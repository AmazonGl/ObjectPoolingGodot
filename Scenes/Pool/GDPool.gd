class_name GDPool
extends Node2D

@export_range(1, 100, 1, "or_greater") var initial_spawn: int = 10
@export var item: PackedScene

func _ready():
	for i in range(initial_spawn):
		var _item = item.instantiate()
		add_child(_item, true)

func get_item() -> Node2D:
	var _item = get_child(0)
	if("active" in _item and _item.active):
		var new_item = item.instantiate()
		add_child(new_item,true)
		return new_item
	return _item
