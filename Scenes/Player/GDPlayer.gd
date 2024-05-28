class_name GDPlayer
extends CharacterBody2D

var _can_fire_bullet: bool = true

@export_range(0.01, 999, 0.01, "or_greater") var cooldown_fire_bullet = 0.2
@export var path_pool_bullets: NodePath

func _ready():
	$Timer_fire.wait_time = cooldown_fire_bullet
	$Timer_fire.timeout.connect(func(): _can_fire_bullet = true)
	
func _physics_process(_delta):
	look_at(get_global_mouse_position())
	if(Input.is_action_pressed("fire_bullet") and _can_fire_bullet):
		var pool_bullets = get_node(path_pool_bullets) as GDPool
		var bullet = pool_bullets.get_item() as GDBullet
		bullet.spawn(rotation)
		_can_fire_bullet = false;
		$Timer_fire.start()
