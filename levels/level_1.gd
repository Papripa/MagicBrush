extends Node2D

var action_frames : Dictionary = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_all_animations()
	print("Loaded")

func load_all_animations():
	var animated_sprite = $Player/AnimatedSprite2D
	#var current_frames = anime_sprite.sprite_frames
	var f_path = "res://animations/original/all_player.tres"
	if !FileAccess.file_exists(f_path):
		print("File not found:", f_path)
	else:
		var animations_resource = load(f_path)
		var sprite_frames = animations_resource
		print("Replacing...")
		animated_sprite.set_sprite_frames(sprite_frames)
				


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
