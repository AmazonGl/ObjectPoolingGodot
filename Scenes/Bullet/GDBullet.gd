class_name GDBullet
extends Area2D

var _speed: float = 120
var _direction: Vector2 = Vector2.RIGHT

var active: bool = false

func _ready():
	visible = false
	monitoring = false
	monitorable = false
	set_process(false)

func _process(delta):
	position += _direction * _speed * delta

func set_direction(angle: float):
	position = Vector2.ZERO
	_direction = Vector2.RIGHT.rotated(angle)

func spawn(angle: float):
	active = true
	visible = true
	monitoring = true
	monitorable = true
	set_process(true)
	get_parent().move_child(self, -1)
	set_direction(angle)
	$Timer_destroy.start()

func destroy():
	active = false
	visible = false
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	set_process(false)
	get_parent().move_child(self, 0)
	$Timer_destroy.stop()


func _on_area_entered(area: Area2D) -> void:
	if area is GDEnemy: area.destroy()
	destroy()
