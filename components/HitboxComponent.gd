class_name HitboxComponent
extends Area2D


@export var health_component : HealthComponent


func damage(dmg):
	if health_component:
		health_component.subtract_health(dmg)
