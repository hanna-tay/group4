extends CharacterBody2D

signal health_depleted

var health = 100.0
var is_hurt := false

func player_dmg():
	if is_hurt:
		return
	is_hurt = true
	%HappyBoo.play_hurt_animation()
	await get_tree().create_timer(0.4).timeout  # match your hurt animation length
	is_hurt = false

func _physics_process(delta):
	const SPEED = 600.0
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()

	# Only play walk/idle if not currently hurt
	if not is_hurt:
		if velocity.length() > 0.0:
			%HappyBoo.play_walk_animation()
		else:
			%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 6.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		player_dmg()  # trigger the hurt animation
		if health <= 0.0:
			health_depleted.emit()

	%HealthBar.value = health
	%HealthBarLabel.text = str(roundi(health)) + " / " + str(100)
