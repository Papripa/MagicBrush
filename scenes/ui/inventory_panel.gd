extends PanelContainer
@onready var egg_label: Label = $MarginContainer/VBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel
@onready var log_label: Label = $MarginContainer/VBoxContainer/Log/LogLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	InventoryManager.inventory_changed.connect(on_inventory_changed)

func on_inventory_changed() -> void:
	var inventory : Dictionary = InventoryManager.inventory
	if inventory.has("log"):
		log_label.text = str(inventory["log"])
	if inventory.has("tomato"):
		tomato_label.text = str(inventory["tomato"])
	if inventory.has("corn"):
		corn_label.text = str(inventory["corn"])
	if inventory.has("egg"):
		egg_label.text = str(inventory["egg"])
	if inventory.has("stone"):
		stone_label.text = str(inventory["stone"])
	if inventory.has("milk"):
		milk_label.text = str(inventory["milk"])
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
