extends Panel



func _process(delta: float) -> void:
    global.update_id += 1
    for child in $BoxContainer.get_children():
        if child.link:
            child.link.get_value()
