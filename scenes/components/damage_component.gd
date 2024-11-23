class_name DamageComponent

extends Node2D

@export var max_damage = 1
@export var current_damage = 0

signal max_damage_reached


func apply_damage(damage:int) ->void:
	current_damage = clamp(current_damage + damage, 0, max_damage)
	if(current_damage == max_damage):
		max_damage_reached.emit()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
