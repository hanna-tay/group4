extends Node2D

var kill_count = 0

func _ready():
	%KillCounterLabel.text = "Kills: 0"

func spawn_mob():
	%PathFollow2D.progress_ratio = randf()
	var new_mob = preload("res://mob.tscn").instantiate()
	new_mob.global_position = %PathFollow2D.global_position
	new_mob.died.connect(_on_mob_died)
	add_child(new_mob)

func _on_mob_died():
	kill_count += 1
	%KillCounterLabel.text = "Kills: " + str(kill_count)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	%GameOver.show()
	get_tree().paused = true
	
