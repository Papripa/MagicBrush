extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent
var log_scene =  preload("res://scenes/objects/trees/log.tscn")
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(hit_damage:int)-> void:
	damage_component.apply_damage(hit_damage)
	material.set_shader_parameter("shake_intensity", 0.5)
	await get_tree().create_timer(1.0).timeout#超时器
	material.set_shader_parameter("shake_intensity", 0.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene")
	print("Max damage reached")
	queue_free()

func add_log_scene()->void:
	var log_instance = log_scene.instantiate() as Node2D
	log_instance.global_position = global_position
	print("loading logs")
	get_parent().add_child(log_instance)