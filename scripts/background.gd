extends Sprite2D

var scroll_speed = Vector2(3, 3)

func _process(delta: float) -> void:
	region_rect.position += scroll_speed * delta
