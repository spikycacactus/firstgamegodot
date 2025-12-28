extends Node2D

@onready var fazuľka: Area2D = $fazuľka

func _process(delta) -> void:
	var score = fazuľka.score
	$Label.text = "Score:" +str(score)
