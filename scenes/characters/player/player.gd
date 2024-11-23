class_name Player
extends CharacterBody2D

@export var current_tool:DataTypes.Tools = DataTypes.Tools.None
var player_direction: Vector2
#使用类继承让最后面对的方向是最后修改的方向
