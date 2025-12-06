extends Node2D


const FISH_SCENE = preload("res://scenes/fish_enemy.tscn")

# Spawning parameters
@export var spawn_interval: float = 2.0  # Time in seconds between spawns
@export var spawn_height_range: float = 200.0 # How far up and down they can spawn

var viewport_size: Vector2

func _ready():
	# Get the size of the viewport (the game window)
	viewport_size = get_viewport_rect().size
	
	# Configure the Timer
	$Timer.wait_time = spawn_interval
	$Timer.autostart = true # Start counting immediately
	
	# Connect the Timer's "timeout" signal to a function we will define
	$Timer.connect("timeout", _on_timer_timeout)
	


func _on_timer_timeout() -> void:
	# 1. Create a new instance (object) of the fish scene
	var new_fish = FISH_SCENE.instantiate()
	
	# 2. Determine a random Y position
	# This spawns the fish randomly within the range defined by spawn_height_range 
	# centered around the Spawner's Y position.
	var random_y = randf_range(-spawn_height_range / 2.0, spawn_height_range / 2.0)
	
	# 3. Set the fish's initial position
	# The X position is set to the right edge of the viewport (viewport_size.x)
	new_fish.position = Vector2(viewport_size.x, position.y + random_y)
	
	# Optional: Randomly decide the fish's direction and flip the sprite
	if randi() % 2 == 0:
	new_fish.direction = 1
		# Flip the sprite if necessary (you'd need a function in the FishEnemy script to handle this)
	else:
		new_fish.direction = -1 # Move Left (default)
	# 4. Add the new fish to the scene tree
		get_parent().add_child(new_fish)
