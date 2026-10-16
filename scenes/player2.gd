extends CharacterBody2D

const tile_size: Vector2 = Vector2(8, 8)
var sprite_node_pos_tween: Tween

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") and !$up.is_colliding():
		_move(Vector2(0, -1));
	elif Input.is_action_just_pressed("ui_down") and !$down.is_colliding():
		_move(Vector2(0, 1));
	elif Input.is_action_just_pressed("ui_left") and !$left.is_colliding() and !$"down-left".is_colliding():
		_move(Vector2(-1, 0));
		$"player-anim".play("run");
		$"player-anim".flip_h = true;
	elif Input.is_action_just_pressed("ui_right") and !$right.is_colliding() and !$"down-right".is_colliding():
		_move(Vector2(1, 0));
		$"player-anim".play("run");
		$"player-anim".flip_h = false;
	else:
		$"player-anim".play("idle");


func _move(dir: Vector2):
	global_position += dir * tile_size
	$"player-anim".global_position -= dir * tile_size
	
	if sprite_node_pos_tween:
		sprite_node_pos_tween.kill()
	sprite_node_pos_tween = create_tween()
	sprite_node_pos_tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	sprite_node_pos_tween.tween_property($"player-anim", "global_position", global_position, 0.185).set_trans(Tween.TRANS_SINE)
