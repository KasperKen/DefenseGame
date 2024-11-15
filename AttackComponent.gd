class_name AttackComponent
extends Area2D


@export var damage : float = 10.0
@export var cooldown_time : float = 1.50


@onready var CooldownTimer : Timer = $CooldownTimer


var attack_ready : bool = true


func _physics_process(_delta):
	var target = check_for_target()
	if target and attack_ready:
		attack(target)


func check_for_target() -> HitboxComponent:
	var target : HitboxComponent = null
	var attack_area = get_overlapping_areas()
	
	if attack_area.size() < 1:
		return null
	for t in attack_area:
		if t is HitboxComponent:
			target = t
	return target


func attack(target):
	attack_ready = false
	target.damage(damage)
	CooldownTimer.start(cooldown_time)


func _on_cooldown_timer_timeout():
	attack_ready = true
