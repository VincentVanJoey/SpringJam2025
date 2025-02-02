extends Node2D

# Declare the projectile scene
@export var bullet_scene : PackedScene
@export var next_button : Button
@export var timer_label : Label
@export var level_timer : Timer
@export var projectile_speed: float = 500.0  # Speed of the projectiles

const SPEED = 500.0

var parent = null

func _ready():
	parent = get_node("..")
	configure_level_type()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	timer_label.text = format_time(level_timer.time_left)
	
	if level_timer.time_left == 0:
		for child in parent.get_children():
			if child.scene_file_path == bullet_scene.resource_path:
				child.queue_free()
		next_button.visible = true
		next_button.disabled = false

func configure_level_type():
	
	#TODO - set timer for level
	#TODO - figure out bullet pattern
	#TODO - fire set amounts of bullets depending
	#TODO - perform checks for time thresholds to change or shoot more
	
	# Detect the parent node (level)
	if parent:
		match parent.name:  # Assuming parent node names represent different levels
			"Hexagon":
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)

			"Pentagon":
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)
				pass
			"Square":
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)
				pass
			"Triangle" :
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)
				pass
			"Hallway" :
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)
				pass
			_: #default case
				pass
	else:
		print("We fucked up somewhere")

# Function to instantiate and fire a projectile
func fire_projectile(bul_position: Vector2):
	if bullet_scene:
		var projectile := bullet_scene.instantiate()
		projectile.position = bul_position  # Start at the turret's positiona
		projectile.velocity = Vector2.LEFT * 500 
		get_parent().add_child.call_deferred(projectile)  # Add projectile to the level scene

func format_time(input_time: float) -> String:
	var minutes = int(input_time) / 60
	var seconds = int(input_time) % 60
	return "%02d:%02d" % [minutes, seconds]


func _on_button_pressed() -> void:
	match parent.name:
			"Hexagon":
				get_tree().change_scene_to_file("res://Levels/Pentagon.tscn")
			"Pentagon":
				get_tree().change_scene_to_file("res://Levels/Square.tscn")
			"Square":
				get_tree().change_scene_to_file("res://Levels/Triangle.tscn")
			"Triangle" :
				get_tree().change_scene_to_file("res://Levels/Hallway.tscn")
			"Hallway" :
				#TODO- victory
				get_tree().change_scene_to_file("res://Levels/Hexagon.tscn")
			_: #default case
				pass
