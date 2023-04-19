extends ColorRect


func _ready() -> void:
    global.position = get_viewport_rect().position
    global.size = get_viewport_rect().size


func _input(event: InputEvent) -> void:
    var rect = get_viewport_rect()
    if global.drag_node is Gate:
        if event is InputEventMouseMotion:
            $LineDraw.queue_redraw()
            var p = event.global_position + global.drag_offset
            var s = global.drag_node.size
            global.drag_node.position = Vector2(
                clampf(p.x, rect.position.x, rect.end.x - s.x),
                clampf(p.y, rect.position.y, rect.end.y - s.y),
            )
    elif global.drag_node is Slot:
        if event is InputEventMouseMotion:
#            global.drag_offset = get_global_mouse_position()
            $LineDraw.queue_redraw()

#    elif global.drag_node is Slot:
    if event is InputEventMouseButton\
    && event.button_index == MouseButton.MOUSE_BUTTON_LEFT\
    && !event.pressed:
        global.drag_node = null
        $LineDraw.queue_redraw()
