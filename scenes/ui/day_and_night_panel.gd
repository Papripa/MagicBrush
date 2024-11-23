extends Control
@onready var day_label: Label = $DayPanel/MarginContainer/DayLabel
@onready var time_label: Label = $TimePanel/MarginContainer/TimeLabel

@export var normal_speed = 5
@export var fast_speed = 100
@export var super_fast_speed = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DayAndNightCycleManager.time_tick.connect(on_time_tick)
func on_time_tick(day:int, hour:int,mins: int) -> void:
	day_label.text = "DAY "+ str(day)
	time_label.text = "%02d:%02d" % [hour,mins]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_normal_s_pressed() -> void:
	DayAndNightCycleManager.game_speed = normal_speed


func _on_fast_s_pressed() -> void:
	DayAndNightCycleManager.game_speed = fast_speed


func _on_super_fast_s_pressed() -> void:
	DayAndNightCycleManager.game_speed = super_fast_speed
