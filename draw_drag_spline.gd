extends CanvasItem



func _draw() -> void:
    if (global.drag_node is Slot):
        var start: Vector2 = global.drag_node.get_global_rect().get_center()
        var points: PackedVector2Array = [start, get_global_mouse_position()]
#        [start, global.drag_offset]
        draw_polyline(
            points,
#            [Vector2(0,0), Vector2(100,100)],
            Color.DARK_SEA_GREEN,
            4.0,
            true
        )

    for input in global.input_slots:
        if input.link:
            var width: float
            var color: Color
            match input.link.master.cached_output_states[input.link.index]:
                -1: width = 4; color = Color.AQUA
                0 : width = 2; color = Color.WHITE
                1 : width = 4; color = Color.ORANGE_RED
                _ : width = 6; color = Color.PURPLE
            var points: PackedVector2Array = [
                input.link.get_global_center(),
                input     .get_global_center(),
            ]
            draw_polyline(points, color, width, true)
