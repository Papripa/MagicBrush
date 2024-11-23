class_name Player
extends CharacterBody2D
@onready var hit_component: HitComponent = $HitComponent

@export var current_tool:DataTypes.Tools = DataTypes.Tools.None
var player_direction: Vector2
#使用类继承让最后面对的方向是最后修改的方向

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)
	
func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.tool = tool
	#print("Tool:",tool)
