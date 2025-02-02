extends Node2D

# Declare the projectile scene
@export var bullet_scene: PackedScene
@export var timer_label : Label
@export var level_timer : Timer
@export var projectile_speed: float = 500.0  # Speed of the projectiles

const SPEED = 500.0

var parent = get_parent()

func _ready():
	configure_level_type()

func configure_level_type():
	
	#TODO - set timer for level
	#TODO - figure out bullet pattern
	#TODO - fire set amounts of bullets depending
	#TODO - perform checks for time thresholds to change or shoot more
	
	# Detect the parent node (level)
	if parent:
		match parent.name:  # Assuming parent node names represent different levels
			"Level1":
				level_timer.wait_time = 60000
				level_timer.start()
				fire_projectile(Vector2.DOWN)
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
func fire_projectile(direction: Vector2):
	if bullet_scene:
		var projectile := bullet_scene.instantiate()
		projectile.position = position  # Start at the turret's position
		#TODO - set fire direction and or speed
		#shit
		get_parent().add_child(projectile)  # Add projectile to the level scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer_label.text = str(level_timer.time_left)
	
	if level_timer.time_left == 0:
		print("over")
	
	pass
