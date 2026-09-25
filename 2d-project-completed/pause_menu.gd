extends CanvasLayer

func _ready() -> void:
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_resume_pressed() -> void:
	toggle_pause()

func _on_settings_pressed() -> void:
	#settings menu later
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
