extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2(0,0)
var GRAVITY = 7500.0
var Jump = false
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_just_pressed("forward"):
		var Jump = true
		if Jump == true:
			var GRAVITY = 0
			velocity.y = velocity.y - 100
			var jump = false
		if Jump == false:
			var GRAVITY =7500
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	move_and_collide(Vector2(0, 1))
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	move_and_collide(motion)
