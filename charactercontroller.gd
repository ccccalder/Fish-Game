extends CharacterBody2D

@export var speed = 300

@onready var moveDirection = Vector2.ZERO

@export var ProjectileScene: PackedScene

@onready var main_scene_node: Node2D = get_parent()

@onready var shootingPosition: Node2D = $shootingPosition

func GetMovementInput():
	moveDirection.x = int(Input.is_action_pressed("moveright")) - int(Input.is_action_pressed("moveleft"))
	moveDirection.y = int(Input.is_action_pressed("movedown")) - int(Input.is_action_pressed("moveup"))
	
	velocity = moveDirection * speed

func move():
	GetMovementInput()
	move_and_slide()

func _process(_delta):
		Shoot()

func _physics_process(_delta):
	move()
	
func Shoot():
	if Input.is_action_just_pressed("shoot"):
		shoot_straight_up()

func shoot_straight_up() -> void:
	# 1. Instantiate a new projectile instance
	var projectile = ProjectileScene.instantiate()

	projectile.global_position = shootingPosition.global_position
	main_scene_node.add_child(projectile) 
	projectile.initialize(Vector2.UP)
