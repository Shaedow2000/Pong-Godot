extends CharacterBody2D

const SPEED = 10000.0
var direction: int = 1

@onready var game: Node = $"../"

func _ready() -> void:
	add_to_group("asteroid")

func _physics_process(delta: float) -> void:
	if not game.start:
		return
	
	velocity.x = SPEED * direction * delta
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	direction *= -1

func reverse_direction() -> void:
	direction *= -1
	print("hello")
