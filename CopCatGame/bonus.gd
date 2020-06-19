extends Area2D

# Bonuses: 0 - bonus points; 1 - double speed; 2 - double points

var bonusPictures = [
	load("res://graphics/bonuses/minetki.png"),
	load("res://graphics/bonuses/skorost.png")
	#load("res://graphics/bonuses/double_points.png")
	]
var bonusType:int
#onready var bonusSprite = get_node("/root/Bonus/BonusSprite")
#onready var bonusSprite = get_tree().get_root().get_node("Bonus/BonuSprite")
#onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	connect("timeout", timer, "on_timeout")
	# bonusSprite.set_texture(bonusPictures[bonusType])

func set_bonus(bonus):
	bonusType = rand_range(0, bonusPictures.size())
	bonus.set_texture(bonusPictures[bonusType])

#func _process(delta):
#	if(timer.is_stopped()):
#		bonusSprite.set_texture(bonusPictures[bonusType])
#		print("Picture set")


func _on_Bonus_body_entered(body):
	print("Shiny!")
	if(bonusType == 0):
		#get_node("../UI/Counter/Timer").set_point(100 * get_node("../player").get_BM())
		get_node("../UI/Counter/Timer").set_point(100)
	elif(bonusType == 1):
		get_node("../player").double_speed(1)
	queue_free()
