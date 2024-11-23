extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var stone_scene =  preload("res://scenes/objects/rocks/stone.tscn")
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(hit_damage:int)-> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity", 0.3)
	await get_tree().create_timer(0.5).timeout#超时器
	material.set_shader_parameter("shake_intensity", 0.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_max_damage_reached() -> void:
	print("Max")
	call_deferred("add_stone_scene")
	queue_free()

func add_stone_scene()->void:
	var stone_instance = stone_scene.instantiate() as Node2D
	stone_instance.global_position = global_position
	print("You can collect!")
	get_parent().add_child(stone_instance)
