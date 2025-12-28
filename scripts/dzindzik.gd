extends Node2D

var speed = 4000
var left_limit = -3300
var right_limit = 3300

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		if right_limit>position.x:
			direction.x += 1
	if Input.is_action_pressed("ui_left"):
		if left_limit<position.x:
			direction.x -= 1
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	speed += delta*4
	position += direction * speed * delta  # for Node2D
