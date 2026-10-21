class_name GameStartHUD
extends CanvasLayer

func _on_start_pressed() -> void:
	print("Start")
	queue_free()
