extends Area2D

@export var speed: float = 150.0  # Speed in pixels per second
@export var direction: int = -1   # -1 for left, 1 for right


func _process(delta: float) -> void:
	# Calculate the new position based on speed, direction, and time (delta)
	var movement = Vector2(speed * direction * delta, 0)
	
	global_position += movement

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	pass 
