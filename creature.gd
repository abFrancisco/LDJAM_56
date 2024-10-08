extends Node2D

var food:int = 10000
var happiness:int = 10000
var colors:Array[Color]=[Color("4040ff"), Color("ff4040"), Color("40ff40")]
var color:Color = Color.WHITE
var current_color:Color = color
var current_scale = 1

func _ready() -> void:
	color = colors[randi_range(0,2)]
	current_color = color
	%Sprite.modulate = current_color


#add color expression, maybe in another module
func _on_timer_timeout() -> void:
	food-=3
	happiness-=5
	#change color fade, instead of fadin to white, fade to black, or fade to background color.
	current_color = Color.from_hsv(color.h, color.s * (happiness/1000.0), color.v)
	%Sprite.modulate = current_color
	current_scale = food/1000.0
	%Sprite.scale = Vector2.ONE * current_scale
	
	if food or happiness <= 0:
		gameover()

func gameover():
	pass
