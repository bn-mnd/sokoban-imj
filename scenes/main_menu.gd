extends Node2D

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$fade_transition.show()
	$"fade_transition/fade-timer".start()
	$fade_transition/AnimationPlayer.play("fade-in")
	

func _on_options_pressed() -> void:
	button_type = "options"
	$fade_transition.show()
	$"fade_transition/fade-timer".start()
	$fade_transition/AnimationPlayer.play("fade-in")
	


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_fadetimer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/level1.tscn")
	elif button_type == "options":
		get_tree().change_scene_to_file("res://scenes/options_menu.tscn")
