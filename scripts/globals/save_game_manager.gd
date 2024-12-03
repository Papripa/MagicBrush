extends Node
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("save_game"):
		save_game()
		
func save_game() -> void:
	var save_level_data_component = get_tree().get_first_node_in_group("save_level_data_component")
	
	if save_level_data_component != null:
		save_level_data_component.save_game()
		
		
func load_game() -> void:
	var save_level_data_component = get_tree().get_first_node_in_group("save_level_data_component")
	
	if save_level_data_component != null:
		save_level_data_component.load_game()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
