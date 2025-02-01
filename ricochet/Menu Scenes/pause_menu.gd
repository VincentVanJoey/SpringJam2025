extends Control

#@onready var selectSound = $select

# refer to https://www.youtube.com/watch?v=iGLoOTnKUBo

var _isPaused : bool = false:
	set = SetPaused

func _ready():
	$Panel/VBoxContainer/Resume.grab_focus() # Allows menu options to be navigated using control binds

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("pause")):
		_isPaused = !_isPaused

func SetPaused(value:bool) -> void:
	_isPaused = value
	get_tree().paused = _isPaused
	visible = _isPaused
	$Panel/VBoxContainer/Resume.grab_focus() # Allows menu options to be navigated using control binds

func _on_resume_pressed():
	_isPaused = false
#	selectSound.play()
	await get_tree().create_timer(0.5).timeout

func _on_htp_pressed():
	#selectSound.play()
	#await get_tree().create_timer(0.5).timeout
	#get_tree().change_scene_to_file("res://Menu Scenes/Menu.tscn")
	pass # Replace with function body.

func _on_main_menu_pressed():
	_isPaused = false;
#	selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Menu Scenes/Menu.tscn")

func _on_quit_pressed():
	#selectSound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
