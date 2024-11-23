extends npcs



func _ready() -> void:
	walk_cycle = randf_range(min_work_cycle,max_work_cycle)
