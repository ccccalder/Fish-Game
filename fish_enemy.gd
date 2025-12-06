extends Area2D

@export var explosionScene: PackedScene

@export var minSpeed: float = 150.0  
@export var maxSpeed: float = 300.0  
var speed

@export var direction: int = -1   # -1 for left, 1 for right

func _ready() -> void:
	#randomize speed
	speed = randf_range(minSpeed, maxSpeed)
	
	
func _process(delta: float) -> void:
	var movement = Vector2(speed * direction * delta, 0)
	
	global_position += movement


func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:# 1. Instantiate the Explosion
	var explosion = explosionScene.instantiate()
		
	explosion.global_position = global_position
	var particles = explosion.get_node("Particles")
	get_parent().add_child(explosion)
	particles.emitting = true
	if area.is_in_group("bullet"):
		queue_free()
		
	particles.finished.connect(explosion.queue_free)
