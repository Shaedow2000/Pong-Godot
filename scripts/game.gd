class_name Game
extends Node

@export var asteroid: CharacterBody2D
@export var player_a: CharacterBody2D
@export var player_b: CharacterBody2D

var camera
var screen_size

var score_a: int = 0
var score_b: int = 0

@export var start: bool = false

func _ready() -> void:
	camera = get_viewport().get_camera_2d()
	screen_size = get_viewport().get_visible_rect().size / camera.zoom

func start_game() -> void:
	player_a.position = Vector2(20, screen_size.y / 2)
	player_b.position = Vector2(screen_size.x - 20, screen_size.y / 2)
	asteroid.position = camera.get_screen_center_position()
	start = true
	
func restart_game() -> void:
	asteroid.position = camera.get_screen_center_position()
	
func scored(player_id: int) -> void:
	if player_id == 0:
		score_a += 1
	else:
		score_b += 1

func _on_top_body_entered(body: Node2D) -> void:
	if body.is_in_group("asteroid"):
		body.call("reverse_direction")

func _on_bottom_body_entered(body: Node2D) -> void:
	if body.is_in_group("asteroid"):
		body.call("reverse_direction")

func _on_left_body_entered(body: Node2D) -> void:
	if body.is_in_group("asteroid") and start:
		scored(1)
		restart_game()

func _on_rigtht_body_entered(body: Node2D) -> void:
	if body.is_in_group("asteroid") and start:
		scored(0)
		restart_game()
