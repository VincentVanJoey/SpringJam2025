extends CharacterBody2D

@export var SPEED : float = 300.0
@export var JUMP_VELOCITY : float = -600.0
@export var playerindex = 1;
@export var health = 3;

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var fireballSound = $fireball
#@onready var jumpSound = $jump

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the gravity from the project settings to be synced with RigidBody nodes.
var animation_locked: bool = false
var direction : Vector2 = Vector2.ZERO
var jumped : bool = false
#var hit
#var winner
#var canshoot : bool = true
#var timer = 0

#colors the players - TODO
func _ready(): 
	pass
	#match playerindex:
		#1: modulate = Color(0,0,0)
		#2: modulate = Color(0,0,0)

#Refactor - TODO
func _physics_process(delta):
	
	#timer -= delta
	
	direction = Input.get_vector("left_%s" % [playerindex], "right_%s" % [playerindex],"ui_up", "ui_down")
	
	if not is_on_floor(): # Add the gravity.
		velocity.y += gravity * delta
	else:
		animation_locked = false
		
	# Come back here, retool and dupe script to just take controller vs p1 that can do keyboard.
	if Input.is_action_just_pressed("jump_%s" % [playerindex]) and is_on_floor(): # Handle Jump.
		jump()
		
	if velocity.y > 0 and !animation_locked:
		land()

	screenwrap()
	_horizontalMove()
	_update_animation()
	update_facing_direction()
	
	move_and_slide()

#region Movement

func _horizontalMove():
		if Input.is_action_pressed("right_%s" % [playerindex]):
			velocity.x = SPEED
		elif Input.is_action_pressed("left_%s" % [playerindex]):
			velocity.x = -SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

func jump():
	velocity.y = JUMP_VELOCITY
	#jumpSound.play()
	animated_sprite.play("jump")
	animation_locked = true
	
func land():
	animated_sprite.play("fall")
	animation_locked = true

func screenwrap():
	position = position.posmodv(get_viewport_rect().size)

#endregion

#region Animation
func _update_animation():
	if not animation_locked:
		if velocity.x != 0:
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")

func update_facing_direction():
	if direction.x < 0: #facing left
		animated_sprite.flip_h = true
	elif direction.x > 0: # facing right
		animated_sprite.flip_h = false

func _on_animated_sprite_2d_animation_finished():
	if(animated_sprite.animation == "fall"):
		animation_locked = false
#endregion

func flash_damage():
	animated_sprite.modulate = Color(1, 0, 0)  # Red flash
	await get_tree().create_timer(.1).timeout
	animated_sprite.modulate = Color(1, 1, 1)  # Reset to normal

func _on_hurtbox_area_entered(area):
	if area.is_in_group("bullet"):
			flash_damage()
			health -= 1
			if health < 1:
				get_tree().change_scene_to_file("res://Menu Scenes/game_over.tscn")

#delete these - TODO
#region ------------------UNUSED--------------------------
## if a bullet collodes wit ha player
#func _on_hurtbox_area_entered(area):
	#if area.is_in_group("bullet"):
			#hit = self.name # gets the person who got hit
			#if hit == "PlayerGuy": #if player 1 is hit
				#Universe.points_2 += 1 # player 2 gets a point
			#
			#elif hit == "PlayerGuy2": #if player 2 is hit
				#Universe.points_1 += 1 #player 1 gets a point
			#
			#if Universe.points_1 >= 5 || Universe.points_2 >= 5:
				#get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
				#
			#else:
				#queue_free()
				#get_tree().reload_current_scene()
#endregion
