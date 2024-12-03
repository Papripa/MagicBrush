extends Node2D

func _ready() -> void:
	load_all_animations()
	print("Loaded")

func load_all_animations():
	var animated_sprite = $Player/AnimatedSprite2D
	#var current_frames = anime_sprite.sprite_frames
	var f_path = "res://animations/original/all_player_pixel.tres"
	if !FileAccess.file_exists(f_path):
		print("File not found:", f_path)
	else:
		var animations_resource = load(f_path)
		var sprite_frames = animations_resource
		print("Replacing...")
		animated_sprite.set_sprite_frames(sprite_frames)
