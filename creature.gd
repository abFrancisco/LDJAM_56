extends Node2D

#type 0 = square
#type 1 = circle
#type 2 = triangle
var type:int=0
var food:int = 1000
var happiness:int = 1000
var food_decay:Array[int]=[15, 5, 10]
var colors:Array[Color]=[Color("4040ff"), Color("ff4040"), Color("40ff40")]
var textures = [preload("res://white_square.svg"), preload("res://white_circle.svg"), preload("res://white_triangle.svg")]
var speed:int = 0
var speed_mult:Array[int]=[0.5, 2, 1]

func _ready() -> void:
	randomize()
	type=randi_range(0,2)
	%Sprite.texture = textures[randi_range(0, 2)]
	%Sprite.modulate = colors[randi_range(0,2)]

func _on_timer_timeout() -> void:
	food-=1
	happiness-=1
	if food or happiness <= 0:
		gameover()

func gameover():
	pass
