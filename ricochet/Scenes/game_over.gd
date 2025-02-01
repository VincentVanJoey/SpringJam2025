extends Node2D

var pID

# Called when the node enters the scene tree for the first time.
func _ready():
	Universe.winner.connect(_chicken_dinner)
	$PlayerGuy.playerindex = pID

func _chicken_dinner(who):
	pID = who


