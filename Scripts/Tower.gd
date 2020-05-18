tool
extends Node2D

export var attack_damage = 10
export var attack_range = 300
export var build_cost = 100
export var upgrade_cost = 50
export var sell_cost = 75

func _ready():
	update_sprite_size()
	
func _process(delta):
	if Engine.editor_hint:
		update_sprite_size()

func upgrade_range():
	attack_range += 50
	sell_cost += 15
	update_sprite_size()
	
func upgrade_damage():
	attack_damage += 5
	sell_cost += 15
	
func update_sprite_size():
	var width = $Area2D/Sprite.texture.get_width()
	var shape = $Area2D/CollisionShape2D.shape
	if shape is CircleShape2D:
		shape.set_radius(attack_range)
		var scale_vector = float((float(attack_range) / float(width))*2)
		$Area2D/Sprite.set_scale(Vector2(scale_vector , scale_vector))
	pass
