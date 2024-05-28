class_name GDEnemy
extends Area2D

var _speed: float = 30
var _direction: Vector2 = Vector2.RIGHT

var active: bool = false

func _ready():
	visible = false
	monitoring = false
	monitorable = false
	set_process(false)

func _process(delta):
	position += _direction * _speed * delta

func set_random_position():
	_direction = -Vector2.RIGHT.rotated(lerp(0.0, PI*2.0, randf()))
	position = _direction * -350

func spawn():
	active = true
	visible = true
	monitoring = true
	monitorable = true
	set_process(true)
	get_parent().move_child(self, -1)
	set_random_position()
	$Timer_destroy.start()

func destroy():
	active = false
	visible = false
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
	set_process(false)
	get_parent().move_child(self, 0)
	$Timer_destroy.stop()
