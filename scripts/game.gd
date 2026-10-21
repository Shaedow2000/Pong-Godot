class_name Game
extends Node

@export var asteroid: CharacterBody2D
@export var player_a: CharacterBody2D
@export var player_b: CharacterBody2D

var camera
var screen_size

@export var start: bool = false

func _ready() -> void:
	camera = get_viewport().get_camera_2d()
	screen_size = get_viewport().get_visible_rect().size / camera.zoom

func start_game() -> void:
	player_a.position = Vector2(20, screen_size.y / 2)
	player_b.position = Vector2(screen_size.x - 20, screen_size.y / 2)
	asteroid.position = camera.get_screen_center_position()
	start = true
