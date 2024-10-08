extends Node2D

var time = 0
var spawn = 2
var creatures = [preload("res://square.tscn"), preload("res://circle.tscn")]

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn >= 3:
		spawn = 0
		spawn_creature()

func spawn_creature():
	var creature = creatures[randi_range(0, 1)]
	var instance = creature.instantiate()
	add_child(instance)
	instance.position = %SpawnPoints.get_child(randi_range(0, %SpawnPoints.get_child_count()-1)).position

func _on_timer_timeout() -> void:
	time+=1
	spawn+=1
	%Label.text = str(time)
	
