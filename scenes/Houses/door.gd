extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interaction_component: InterationComponent = $InteractionComponent


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_component.Interation_activated.connect(on_interactable_activated)
	interaction_component.Interation_deactivated.connect(on_interactable_deactivated)
	collision_layer = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_interactable_activated()->void:
	animated_sprite_2d.play("open_door")
	collision_layer = 2 
	print("activated")
	
func on_interactable_deactivated()->void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
	print("deactivated")
