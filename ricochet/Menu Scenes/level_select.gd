extends Control

#@onready var selectSound = $select

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridContainer/DebugButton.grab_focus() # Allows menu options to be navigated using control binds

func _on_debug_button_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Levels/debug_level.tscn")

func _on_first_level_button_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Levels/Hexagon.tscn")
	pass # Replace with function body.

func _on_second_level_button_pressed():
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Levels/Hallway.tscn")
	pass # Replace with function body.

func _on_return_button_pressed():
	#MusicPlayer.queue_free()
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu Scenes/Menu.tscn")
