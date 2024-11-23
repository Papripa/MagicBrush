extends Node

var inventory: Dictionary = Dictionary()

signal inventory_changed


func add_collectable(collectable_name:String):
	inventory.get_or_add(collectable_name)
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1 
		
	inventory_changed.emit()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
