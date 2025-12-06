extends Area2D

## Adjustable speed for the projectile
@export var speed: float = 600.0
## Vector to store the direction (straight up)
var velocity: Vector2 = Vector2.UP

func _process(delta: float) -> void:
	# Move the projectile upwards
	position += velocity * speed * delta

	# Simple check to remove the projectile when it goes off-screen (adjust as needed)
	if position.y < -50:
		queue_free()

# Optional: Add a function to set the initial direction (though for straight up, it's fixed)
func initialize(dir: Vector2) -> void:
	velocity = dir
