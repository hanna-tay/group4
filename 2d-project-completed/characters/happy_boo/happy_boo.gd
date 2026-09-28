extends Node2D


func play_idle_animation():
	%AnimationPlayer.play("idle")

func play_walk_animation():
	%AnimationPlayer.play("walk")

func play_hurt_animation():
	%AnimationPlayer2.play("hurt")
