extends Node2D

var spawned = true
var moving = false
var food:int = 1000
var happiness:int = 1000
var food_decay:int=5
var colors:Array[Color]=[Color("4040ff"), Color("ff4040"), Color("40ff40")]
var color:Color=Color.WHITE
var current_color:Color = color
var current_scale = 1

func _ready() -> void:
	color = colors[randi_range(0,2)]
	current_color = color
	%Sprite.modulate = current_color

func _on_timer_timeout() -> void:
	food-=3
	happiness-=5
	current_color = Color.from_hsv(color.h, color.s * (happiness/1000.0), color.v)
	%Sprite.modulate = current_color
	current_scale = food/1000.0
	%Sprite.scale = Vector2.ONE * current_scale
	if not moving:
		moving = true
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", (position + Vector2(randi_range(-125, 125), randi_range(-125, 125))).clamp(Vector2.ZERO, Vector2(512,512)),1)
		tween.connect("finished", on_tween_finished)
	if food or happiness <= 0:
		gameover()

func on_tween_finished():
	moving = false

func gameover():
	pass
