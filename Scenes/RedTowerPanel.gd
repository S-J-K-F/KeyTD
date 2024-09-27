extends Panel


@onready var tower = preload("res://Scenes/Red_Bullet_Tower.tscn")
var currTile

func _on_gui_input(event:InputEvent):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left click down
		add_child(tempTower)
		
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED

		tempTower.scale = Vector2(0.32,0.32)


	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left click down drag
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position

	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click up
		if get_child_count() > 1:
			get_child(1).queue_free()
		var path = get_tree().get_root().get_node("Main/Towers")

		path.add_child(tempTower)
		tempTower.global_position = event.global_position
		tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
