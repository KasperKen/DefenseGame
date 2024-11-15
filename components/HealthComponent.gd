class_name HealthComponent
extends Node


signal health_depleted
signal health_changed(new_val)


@export var max_health : float = 100.0


@onready var current_health : float = max_health


func subtract_health(val) -> void:
	current_health -= val
	health_changed.emit(current_health)
	if current_health <= 0:
		emit_signal('health_depleted')
