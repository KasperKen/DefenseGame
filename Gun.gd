extends Node2D


@onready var bullet_to_fire : PackedScene = load("res://bullet.tscn")
@onready var BulletSpawnPoint : Marker2D = $GunSprite/BulletSpawnPoint
@onready var CooldownTimer : Timer = $CooldownTimer
@onready var RangeComponent : Area2D = $RangeComponent
@onready var GunSprite : Sprite2D = $GunSprite


@export var weapon_available : bool = true
@export var cooldown_time : float = 2.0


var target : CharacterBody2D = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var target_array = $RangeComponent.get_overlapping_bodies()
	if target_array.size() > 0:
		target = target_array[0]
	else:
		target = null
	
	
	if weapon_available and target:
		var adjusted_target_location = calculate_bullet_trajectory()
		GunSprite.look_at(adjusted_target_location)
		shoot(adjusted_target_location)


func shoot(adjusted_target_location):
	weapon_available = false
	CooldownTimer.start(cooldown_time)
	var new_bullet = bullet_to_fire.instantiate()
	new_bullet.global_position = BulletSpawnPoint.global_position
	new_bullet.bullet_direction = (new_bullet.global_position - adjusted_target_location).normalized()
	get_parent().get_parent().add_child(new_bullet)
	

func calculate_bullet_trajectory():
	var target_velocity = target.get_real_velocity()
	var target_distance = BulletSpawnPoint.global_position.distance_to(target.position)
	var bullet_time = target_distance / 1200
	var adjusted_target_position = target.global_position + target_velocity * bullet_time
	return adjusted_target_position


func _on_cooldown_timer_timeout():
	weapon_available = true
