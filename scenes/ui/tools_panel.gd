extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_watering: Button = $MarginContainer/HBoxContainer/ToolWatering
@onready var tool_tiling: Button = $MarginContainer/HBoxContainer/ToolTiling
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.AxeWood)
	


func _on_tool_watering_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)


func _on_tool_tiling_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround)


func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)


func _on_tool_tomato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_tiling.release_focus()
		tool_watering.release_focus()
		tool_tomato.release_focus()
		tool_corn.release_focus()
