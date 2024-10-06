extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func squeeze():
	##if back and front feet grabbing, release back feet, contract, move to front feet location
	
	##if only back feet grabbing, contract
	$BodyPart2.
