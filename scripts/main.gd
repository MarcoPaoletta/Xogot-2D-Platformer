extends Node2D

@onready var time_label = $CanvasLayer/TimeLabel

var initial_time = 10
var time_left = 0

var coins_to_collect = 0
var coins_collected = 0

func _ready() -> void:
	time_left = initial_time
	time_label.text = str(time_left)
	
	coins_to_collect = $Levels/Level1/Coins.get_child_count()

	$Player.position = $Levels/Level1/SpawnPoint.position

func _on_timer_timeout() -> void:
	time_left -= 1
	
	if time_left == 0:
		get_tree().reload_current_scene()
	else:
		time_label.text = str(time_left)
		


func _on_player_on_coin_collected() -> void:
	coins_collected += 1
	if coins_to_collect == coins_collected:
		get_tree().call_deferred("reload_current_scene")
