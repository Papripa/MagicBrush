class_name DayAndNightCycleComponent
extends CanvasModulate

@export var initial_day : int = 1:
	set(id):
		initial_day = id
		DayAndNightCycleManager.begin_day = id
		DayAndNightCycleManager.set_begin_time()
		
@export var initial_hour : int = 12:
	set(ih):
		initial_hour = ih
		DayAndNightCycleManager.begin_hour = ih
		DayAndNightCycleManager.set_begin_time()		
		
@export var initial_mins : int = 30:
	set(im):
		initial_mins = im
		DayAndNightCycleManager.begin_mins = im
		DayAndNightCycleManager.set_begin_time()	
@export var day_night_gradient_texture : GradientTexture1D
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DayAndNightCycleManager.begin_day = initial_day
	DayAndNightCycleManager.begin_hour = initial_hour
	DayAndNightCycleManager.begin_mins = initial_mins
	DayAndNightCycleManager.set_begin_time()
	DayAndNightCycleManager.game_time.connect(on_game_time)

	
func on_game_time(time:float)-> void:
	var sample_value =  0.5 *(sin(time - PI * 0.5) + 1.0)
	color = day_night_gradient_texture.gradient.sample(sample_value)
	
