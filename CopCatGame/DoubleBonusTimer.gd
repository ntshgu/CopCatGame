extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("timeout", self, "_on_timeout") # Replace with function body.


func _on_timeout():
	get_parent().double_points(0)
	#get_node("../UI/Bonuses/double_points").set_texture(0)
