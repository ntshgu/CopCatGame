extends Sprite

const veloc = Vector2(0, -75)

func _process(delta):
	move(delta)
	#removeWhenOffScreen()

func move(delta):
	global_position += veloc

#func removeWhenOffScreen():
	#if global_position.y < 0:
		#queue_free()
