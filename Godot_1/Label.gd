extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _on_Sprite_speed_change(new speed):
	print("delta label")
	text = str (new speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
