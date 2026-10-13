extends CharacterBody2D

@export var SPEED := 100
@export var acceleration := 14.0

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction*SPEED;
	
	if Input.is_action_pressed("move_right"):
		$"player-anim".play("run");
		$"player-anim".flip_h = false;
	elif Input.is_action_pressed("move_left"):
		$"player-anim".play("run");
		$"player-anim".flip_h = true;
	else:
		$"player-anim".play("idle");
	
	move_and_collide(velocity*delta);
