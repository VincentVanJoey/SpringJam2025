extends CharacterBody2D


const SPEED = 500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2

func _ready():
	direction = Vector2(1,0).rotated(rotation)



func _physics_process(delta):
	# Add the gravity.
	velocity = SPEED * direction
	if not is_on_floor():
		velocity.y += gravity * 1 * delta # might have to tweak value 1 here
	var collisionResult = move_and_collide(direction * SPEED * delta)
	if collisionResult != null:
		queue_free()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("player"):
			queue_free()
