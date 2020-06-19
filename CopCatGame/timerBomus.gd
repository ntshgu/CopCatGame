extends Timer

#var bonus = load("res://bonus.tscn")

func _ready():
	connect("timeout", self, "on_timeout")

func on_timeout():
	#var road = get_node("../road_layer/road_layer_sprite").get_region_rect()
	var bonus = preload("res://bonus.tscn").instance()
	var player = GameState.PlayerCharacter.position
	bonus.set_bonus(bonus.get_node("BonusSprite"))
	var r = rand_range(-830, 830)
	bonus.set_position(Vector2(r, player.y - 4500))
	get_parent().add_child(bonus)
	#print("Item spawned")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
