extends KinematicBody2D

var run_speed:int = 1500 #get it later
var h_speed_max:int = 1500 #get it later
var h_speed:int = 0
var h_acceleration:int = 800 #get it later
var velocity:Vector2
const bullets_patron = preload("res://patron.tscn")
const reload_time = 0.2
var reloading = 0.0
var speedTaken = false
var standSpeed = run_speed
onready var SBT = get_node("../player/SpeedBonusTimer")
onready var DBT = get_node("../player/DoubleBonusTimer")
var scoreModifire = 1
var stanSM = scoreModifire
var doubleTaken = false

func _ready():
	GameState.PlayerCharacter = self


func _process(delta):
	acceleration(delta)
	moving_calc(delta)
	move_and_slide(velocity)
	if Input.is_key_pressed(KEY_UP):
		fire()
	reloading -= delta

func fire():
	if reloading <= 0.0:
		var bullet = bullets_patron.instance()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		reloading = reload_time

func acceleration(delta):
	if global_position.x != get_global_mouse_position().x:
		h_speed = Service.step_to(h_speed_max, h_acceleration, h_speed, delta)


func moving_calc(delta):
	velocity.y = -run_speed
	velocity.x = Service.step_to(get_global_mouse_position().x, h_speed, global_position.x, delta, false)

func double_speed(mode):
#	if (speedTaken == false):
#		speedTaken = true
#		var timeLimit = 10
#		run_speed *= 2
#		for i in range(timeLimit):
#			if (i == timeLimit):
#				run_speed /= 2
#				speedTaken = false
#			else:
#				i += 1
#	else:
#		get_node("../UI/Counter/Timer").set_point(50)
#	run_speed += 100
#	print("Speed id ", run_speed)
	if ((mode == 1) and (speedTaken == false)):
		speedTaken = true
		run_speed *= 2
		SBT.start()
	elif((mode == 1) and (speedTaken == true)):
		get_node("../UI/Counter/Timer").set_point(50 * scoreModifire)
		print("scrPlus = 50 * ", scoreModifire)
		#get_node("../UI/Counter/Timer").set_point(50)
	else:
		print("Get slow")
		run_speed = standSpeed
		speedTaken = false
	print("Speed is ", run_speed)
	
func double_points(mode):
	if(mode == 1):
		scoreModifire *= 2
		if(doubleTaken == false):
			doubleTaken = true
			DBT.start()
	else:
		scoreModifire = stanSM
		doubleTaken = false

func get_SM():
	return scoreModifire
