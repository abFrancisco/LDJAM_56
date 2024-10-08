extends Node

@export var palette:Palette

func _ready():
	Singleton.palette = palette
	print("palette = " + str(palette))
	print("global palette = " + str(Singleton.palette))
	for entry in palette.entry:
		print(entry.name)
		print(entry.color)
