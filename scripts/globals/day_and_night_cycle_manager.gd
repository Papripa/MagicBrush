extends Node
const MINS_DAY :int = 24*60
const MINS_HOUR : int = 60
const GAME_MINS : float = TAU / MINS_DAY# TAU= 2 * pi

var game_speed : float = 5.0
var begin_day : int = 1
var begin_hour : int = 12
var begin_mins : int = 30

var time = 0.0
var current_mins = -1
var current_day = 0

signal game_time(time:float)
signal time_tick(day:int, hour:int,mins: int)
signal time_tick_day(day:int)



func set_begin_time() -> void:
	var begin_total_mins = begin_day * MINS_DAY + begin_hour * MINS_HOUR + begin_mins
	
	time = begin_total_mins * GAME_MINS



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_begin_time()
	
func recalculate_time() -> void:
	var total_mins = int(time/GAME_MINS)
	var day = int(total_mins/MINS_DAY)
	var current_day_mins = total_mins % MINS_DAY
	var hour = int(current_day_mins/MINS_HOUR)
	var minute = int(current_day_mins%MINS_HOUR)	
	
	if current_mins != minute:
		current_mins = minute
		time_tick.emit(day,hour,minute)
	
	if current_day != day:
		current_day = day
		time_tick_day.emit(day) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * game_speed * GAME_MINS
	game_time.emit(time)
	recalculate_time()
