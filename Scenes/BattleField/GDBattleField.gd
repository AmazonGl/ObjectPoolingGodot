class_name GDBattleField
extends Node2D

@export var path_pool_enemies: NodePath

func timer_spawn_enemy():
	var pool_enemies: GDPool = get_node(path_pool_enemies) as GDPool
	var enemy: GDEnemy = pool_enemies.get_item() as GDEnemy
	enemy.spawn()
	$spawner_timer.start()
