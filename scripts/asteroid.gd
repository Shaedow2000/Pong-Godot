extends CharacterBody2D

const SPEED = 10000.0
var direction: Vector2

@onready var game: Node = $"../"

func _ready() -> void:
	add_to_group("asteroid")
	launch()

func _physics_process(delta: float) -> void:
	if not game.start:
		return
	
	velocity = SPEED * direction * delta
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	direction.y *= -1

func reverse_direction() -> void:
	direction.y *= -1

func launch() -> void:
	var angle = randf_range(-1.396263, 1.396263)
	direction = Vector2.RIGHT.rotated(angle)
	if randf() < 0.5:
		direction *= -1
	
	velocity = SPEED * direction
