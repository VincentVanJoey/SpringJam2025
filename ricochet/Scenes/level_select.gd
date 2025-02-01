extends Control

#@onready var selectSound = $select

# Called when the node enters the scene tree for the first time.
func _ready():
	$GridContainer/DebugButton.grab_focus() # Allows menu options to be navigated using control binds

func _on_second_level_button_pressed():
	#MusicPlayer.queue_free()
	#selectSound.play()s
	#MusicPlayer.queue_free()
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_return_button_pressed():
	#MusicPlayer.queue_free()
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
