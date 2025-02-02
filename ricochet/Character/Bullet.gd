extends CharacterBody2D

var particle_system : CPUParticles2D

const SPEED = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	direction = Vector2(1,0).rotated(rotation)
	particle_system = $CPUParticles2D

func _physics_process(delta):
	
	var screen_size = get_viewport_rect().size
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# Bullet Particle Direction Changes (could be optimized by placing in reflect if statements
	particle_system.set_gravity(Vector2(-velocity.x, -velocity.y)) 
	
	# Add the gravity.
	velocity = SPEED * direction
	
	if not is_on_floor():
		velocity.y += gravity * 1 * delta # might have to tweak value 1 here
		
	#handles grabbing collision data to delete it it hits something
	var collisionResult = move_and_collide(direction * SPEED * delta)
	if collisionResult != null:
		direction = Vector2(cos(randf_range(180, 360)), sin(randf_range(180, 360)))


# Reflect when hitting screen borders
	if position.x <= 0 or position.x >= screen_size.x:
		direction = Vector2(cos(randf_range(180, 360)), sin(randf_range(180, 360)))
		
	if position.y <= 0 or position.y >= screen_size.y:
		direction = Vector2(cos(randf_range(180, 360)), sin(randf_range(180, 360)))

func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
		print("hit")
		queue_free()
	if area.is_in_group("bullet"):
		direction = Vector2(cos(randf_range(180, 360)), sin(randf_range(180, 360)))
		print("bullet collision")
