extends KinematicBody2D

var run_speed:int = 1500 #get it later
var h_speed_max:int = 1500 #get it later
var h_speed:int = 0
var h_acceleration:int = 800 #get it later
var velocity:Vector2

func _ready():
	GameState.PlayerCharacter = self

func _process(delta):
	acceleration(delta)
	moving_calc(delta)
	move_and_slide(velocity)

func acceleration(delta):
	if global_position.x != get_global_mouse_position().x:
		h_speed = Service.step_to(h_speed_max, h_acceleration, h_speed, delta)


func moving_calc(delta):
	velocity.y = -run_speed
	velocity.x = Service.step_to(get_global_mouse_position().x, h_speed, global_position.x, delta, false)
