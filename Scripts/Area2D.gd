extends Area2D

onready var x = preload("res://assets/imageX.png")
onready var o = preload("res://assets/image0.jpg")

var selected = false

#func _ready():
#	 self.mouse_over.hide()

func _on_Area2D_mouse_entered():
	if (!selected):
		$mouse_over.show()


func _on_Area2D_mouse_exited():
	 $mouse_over.hide()

func play_x():
	if (!selected):
		$x.set_texture(x)

func play_o():
	if (!selected):
		$x.set_texture(o)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT):
			play_x()
			$mouse_over.hide()
			selected = true
		else:
			play_o()
			$mouse_over.hide()
			selected = true 	
