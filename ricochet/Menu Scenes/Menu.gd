extends Control#@onready var selectSound = $select

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus() # Allows menu options to be navigated using control binds

func _on_start_pressed(): # Starts the Game
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Levels/Hexagon.tscn")
	
func _on_how_to_play_pressed(): # Shows the tutotrial/ how to play screen
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu Scenes/how_to_play.tscn") 

func _on_quit_pressed(): # Quits the program
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

 
