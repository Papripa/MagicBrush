class_name CollectableComponent
extends Area2D

@export var collectable_name : String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		InventoryManager.add_collectable(collectable_name)
		print("Collected ",collectable_name)
		get_parent().queue_free()
