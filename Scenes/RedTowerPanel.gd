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
			get_child(1).global_position = get_global_mouse_position()

			var mapPath = get_tree().get_root().get_node("Main/TileMap")
			var tile = mapPath.local_to_map(get_global_mouse_position())
			currTile = mapPath.get_cell_atlas_coords(0, tile, false)
			if (currTile == Vector2i(4,5)):
				get_child(1).get_node("Area").modulate = Color.BLUE
			else:
				get_child(1).get_node("Area").modulate = Color.RED
	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click up
		if event.global_position.x >= 1545:
			if get_child_count() > 1:
				get_child(1).queue_free()
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
			if currTile == Vector2i(4,5):
				var path = get_tree().get_root().get_node("Main/Towers")

				path.add_child(tempTower)
				tempTower.global_position = get_global_mouse_position()
				tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
