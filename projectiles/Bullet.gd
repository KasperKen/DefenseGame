class_name Bullet
extends Node2D


@export var bullet_damage : int = 10
@export var bullet_speed : int = 1200


var bullet_direction : Vector2



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position -= bullet_direction * bullet_speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is HitboxComponent:
		area.damage(bullet_damage)
		queue_free()
