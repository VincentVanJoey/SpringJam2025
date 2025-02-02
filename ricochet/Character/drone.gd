extends Node2D

# Declare the projectile scene
@export var bullet_scene: PackedScene
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
		print("over")

func configure_level_type():
	
	#TODO - set timer for level
	#TODO - figure out bullet pattern
	#TODO - fire set amounts of bullets depending
	#TODO - perform checks for time thresholds to change or shoot more
	
	# Detect the parent node (level)
	if parent:
		match parent.name:  # Assuming parent node names represent different levels
			"Level1":
				level_timer.wait_time = 60
				level_timer.start()
				fire_projectile(position)
				pass
			"Level2":
				pass
			"Level3":
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
