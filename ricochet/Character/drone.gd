extends Node2D

# Declare the projectile scene
@export var projectile_scene: PackedScene
@export var fire_rate: float = 1.0  # Default fire rate (in seconds)
@export var projectile_speed: float = 500.0  # Speed of the projectiles

var fire_timer: Timer
var level_type: int = 0  # We will assign this based on the parent level
var parent = get_parent()

func _ready():
	# Create and set up the timer to control firing rate
	fire_timer.wait_time = fire_rate
	fire_timer.start()

	# Detect the parent node (level)
	if parent:
		match parent.name:  # Assuming parent node names represent different levels
			"Level1":
				level_type = 1
			"Level2":
				level_type = 2
			"Level3":
				level_type = 3
			_: #default case
				level_type = 0
				
	# Configure the behavior based on the level type
	configure_fire_behavior()

# Function to configure fire behavior based on the level
func configure_fire_behavior():
	match level_type:
		1:  # Level 1 - slower fire rate, fewer projectiles
			fire_rate = 2.0
			projectile_speed = 300
		2:  # Level 2 - moderate fire rate and projectile speed
			fire_rate = 1.5
			projectile_speed = 400
		3:  # Level 3 - faster fire rate, more projectiles
			fire_rate = 1.0
			projectile_speed = 500
		_:  # Default case if no level matches
			fire_rate = 1.0
			projectile_speed = 400
	fire_timer.wait_time = fire_rate  # Update the timer

# This function is called when the fire timer times out

# Function to instantiate and fire a projectile
func fire_projectile():
	if projectile_scene:
		var projectile = projectile_scene.instantiate()
		projectile.position = position  # Start at the turret's position
		var direction = Vector2(1, 0).rotated(rotation)  # Fire direction (can be modified)
		projectile.linear_velocity = direction * projectile_speed  # Set the speed of the projectile
		get_parent().add_child(projectile)  # Add projectile to the level scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_fire_timer_timeout() -> void:
	pass # Replace with function body.
