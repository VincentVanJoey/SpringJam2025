extends Node2D

@export var wall : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wall.add_to_group("Platforms")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
