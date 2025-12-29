extends Area2D

#hodnoty na pohyb
var speed = 2250
var left_limit = -2970
var right_limit = 2970
var direction = Vector2.RIGHT
var random_time = 1
#hodnoty na kontakt
var is_entered = false
var score = 0
var time_to_get_points = 0.0
var add_points = 0.1

func _ready():
	#pri štarte zvolí náhodný smer a začne náhodný čas na otočenie
	direction = Vector2(randi_range(0, 1) * 2 - 1, 0)
	random_time = randf_range(1, 3)
	$Timer.start(random_time)

func _process(delta):
	#pohyb doprava doľava na ploche
	speed += delta*4 #zrýchlenie fazuľky časom
	position += speed*delta*direction
	if position.x > right_limit:
		direction = Vector2.LEFT
	elif position.x < left_limit:
		direction = Vector2.RIGHT
	#rátanie bodov ak si vo fazuľke
	if is_entered == true:
		time_to_get_points += delta
		if add_points <= time_to_get_points:
			time_to_get_points = 0
			score += 10

func _on_timer_timeout() -> void:
	#náhodné otočenie
	direction = Vector2(randi_range(0, 1) * 2 - 1, 0) 
	random_time = randf_range(0,1)
	$Timer.start(random_time)

func _on_body_entered(body: Node2D) -> void:
	is_entered = true

func _on_body_exited(body: Node2D) -> void:
	is_entered = false
