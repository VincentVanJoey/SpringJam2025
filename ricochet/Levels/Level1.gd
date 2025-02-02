extends Node2D
@onready var fightingStart = $FIGHTING_start
@onready var fightingSong = $FIGHTING


# Called when the node enters the scene tree for the first time.
func _ready():
	fightingStart.play()
	await get_tree().create_timer(11).timeout
	fightingSong.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
