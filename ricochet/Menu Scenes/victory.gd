extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score = 15 - Globals.lives_used 
	$Label.text = "Score: %d" % score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_main_menu_pressed() -> void:
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu Scenes/Menu.tscn")


func _on_quit_pressed() -> void:
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
	
