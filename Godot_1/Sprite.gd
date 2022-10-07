extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var angular_speed = 2 
var speed = 500
var max_speed = 600
var boton_inc_speed
var estado_label 
#senales

signal speed_change(new_speed)

func _ready():
	boton_inc_speed = get_parent().get_node("Inc_speed")
	estado_label = get_parent().get_node("Label")
	var timer = get_parent().get_node("Timer")
	timer.connect("timeout",self,"_on_timer_timeout")
	print(boton_inc_speed.text) 
	
func _on_timer_timeout():
	print("HA PASADO UN SEGUNDO ")
	visible = not visible	
	#print(boton_inc_speed.text)
	
	
	

func _process(delta):
	var direction = 0
	var velocity  = Vector2.ZERO	
	
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_just_pressed("ui_right"):
		direction = 1

	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation)*speed
	if Input.is_action_just_pressed("ui_up"):
		velocity = -Vector2.UP.rotated(rotation)*speed
	rotation += angular_speed * delta * direction 
	position += velocity *delta 
	#rotation += delta * angular_speed 
	#var velocity = Vector2.UP.rotated(rotation)
	#position += delta * velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Button_button_up():
#	 visible = not visible


func _on_Inc_speed_button_up():
	speed += 10
	if speed > max_speed:
		speed = max_speed		
	#esto por refenerencia 
	#estado_label.text = str(speed)
	emit_signal("speed_change",speed)	


func _on_Inc_speed3_button_down():
	speed -= 10
	if speed < 0:
	   speed = 0 
	
	
	
