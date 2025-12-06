extends Node2D


@export var Fish_Scene: PackedScene
# Spawning parameters
@export var spawn_interval: float = 2.0  # Time in seconds between spawns
@export var spawn_height_range: float = 200.0 # How far up and down they can spawn
@export var spawnDirection: float = -1

var viewport_size: Vector2

func _ready():
	# Get the size of the viewport (the game window)
	viewport_size = get_viewport_rect().size
	
	# Configure the Timer
	$SpawnClock.wait_time = spawn_interval
	$SpawnClock.autostart =true# Start counting immediately


func _on_spawn_clock_timeout() -> void:	
	
	var new_fish = Fish_Scene.instantiate()
	var random_y = randf_range(-spawn_height_range / 2.0, spawn_height_range / 2.0)
	if(spawnDirection == 1):
		new_fish.position = Vector2(-viewport_size.x, position.y + random_y)
	elif (spawnDirection == -1):
		new_fish.position = Vector2(viewport_size.x, position.y + random_y)

	get_parent().add_child(new_fish)
	#changes direction
	new_fish.direction = spawnDirection
