extends Node2D

var tomato_harvest_scene = preload("res://scenes/objects/plants/tomatoharvest.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var flowering_particles: GPUParticles2D = $FloweringParticles
@onready var watering_particles: GPUParticles2D = $WateringParticles
@onready var hurt_component: HurtComponent = $HurtComponent
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent

var growth_state :  DataTypes.GrowthStates =  DataTypes.GrowthStates.Germination
var offset : int = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	hurt_component.hurt.connect(on_hurt)
	growth_cycle_component.crop_maturity.connect(on_crop_maturity)
	growth_cycle_component.crop_harvesting.connect(on_crop_harvesting)
	
	
func _process(delta: float) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state + offset 
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true
	
	if growth_state == DataTypes.GrowthStates.Harvesting:
		queue_free()
	
func on_crop_maturity() -> void:
	flowering_particles.emitting = true
	
func on_hurt(hit_damage:int) -> void:
	if !growth_cycle_component.is_watered:
		watering_particles.emitting = true
		await get_tree().create_timer(5.0).timeout
		watering_particles.emitting = false
		growth_cycle_component.is_watered = true
		
func on_crop_harvesting() -> void :
	var tomato_harvest_instance = tomato_harvest_scene.instantiate() as Node2D
	tomato_harvest_instance.global_position = global_position
	get_parent().add_child(tomato_harvest_instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
