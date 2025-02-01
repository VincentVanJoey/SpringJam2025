extends Button

@onready var selectSound = $select

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	pass # Replace with function body.


func _on_DebugButton_pressed():
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/debug_level.tscn")


func _on_return_button_pressed():
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
