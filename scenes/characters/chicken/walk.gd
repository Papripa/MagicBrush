extends NodeState
@export var character: npcs
@export var animated_sprite_2d : AnimatedSprite2D
@export var navigation_agent_2d : NavigationAgent2D
@export var min_speed : float = 10.0
@export var max_speed : float = 20.0

var speed : float

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	call_deferred("character_setup")
	

func character_setup() ->void:
	await get_tree().physics_frame#需要在第一个物理帧后等待
	set_move_target()
	
func set_move_target() ->void:
	var target_pos : Vector2 = NavigationServer2D.map_get_random_point(
		navigation_agent_2d.get_navigation_map(),
		navigation_agent_2d.navigation_layers,
		false)
	navigation_agent_2d.target_position = target_pos
	speed = randf_range(min_speed,max_speed)
	
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		character.c_walk_cycle += 1
		set_move_target()
		return 
	var target_pos : Vector2 = navigation_agent_2d.get_next_path_position()
	var tar_dir : Vector2 = character.global_position.direction_to(target_pos)
	
	var velocity  = tar_dir * speed 
	#If true the agent is registered for an RVO avoidance callback on the 
	#NavigationServer2D. When velocity is used and the processing 
	#is completed a safe_velocity Vector2 is received 
	#with a signal connection to velocity_computed. 
	#Avoidance processing with many registered agents has a 
	#significant performance cost and should only be enabled on agents 
	#that currently require it.
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = tar_dir.x < 0 #向左还是向右走
		navigation_agent_2d.velocity = velocity
	else:
		character.velocity = tar_dir * speed
		character.move_and_slide()#内部使用了delta时间

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	animated_sprite_2d.flip_h =safe_velocity.x < 0 #向左还是向右走
	character.velocity = safe_velocity
	 	
	character.move_and_slide()#内部使用了delta时间
	

func _on_next_transitions() -> void:
	if character.walk_cycle == character.c_walk_cycle:
		character.velocity = Vector2.ZERO
		transition.emit("idle")


func _on_enter() -> void:
	animated_sprite_2d.play("walk")
	character.c_walk_cycle = 0


func _on_exit() -> void:
	animated_sprite_2d.stop()
