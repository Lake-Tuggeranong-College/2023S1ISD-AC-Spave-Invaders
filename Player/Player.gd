extends KinematicBody2D

var movement_speed=200 
var bulletSource = preload("res://Bullet/Bullet.tscn") 


func _ready():
	set_process (true) 
	set_physics_process (true)

func _process(delta):
	if Input.is_action_just_pressed("fire"):
		var bulletInstance = bulletSource.instance()
		bulletInstance.position = Vector2(position.x, position.y-20)
		get_tree().get_root().add_child(bulletInstance)

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -movement_speed * delta))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, movement_speed * delta))
