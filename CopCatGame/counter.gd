extends Timer

var score:int = 0
#onready var timer = get_node("Timer")
#onready var counter = get_node("/root/UI/Counter")
onready var counter = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout",self,"_on_timeout") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_point(points):
	score +=  points
	counter.set_text(str(score))
	#print("score = " + counter.get_text())

func _on_timeout():
	#set_point(1 * get_parent().get_node("../player").get_BM())
	#var player = get_node("../player")
	#set_point(1 * player.get_BM())
	#var scoreModifire = get_path().get_node("/root/root/player")
		var plusScore = 1 * GameState.get_SM()
		set_point(plusScore)
		print("Added points: ", plusScore)
	#set_point(1 * GameState.get_SM())
