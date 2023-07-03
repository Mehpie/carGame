extends Area2D

var value = 5


func _on_Fuel_body_entered(body):
	if body.is_in_group("player"):
		get_tree().get_current_scene().get_node("Car").refuel()
		$AnimationPlayer.play("pick_up")
		$CollisionShape2D.set_deferred("disabled", true )


func _on_animation_player_animation_finished(anim_name):
	queue_free()
	
