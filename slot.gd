extends Button
class_name Slot



var index: int = 0
var master: Control

func _ready() -> void:
    master = get_node("../..")
    modulate = Color(1024, 1024, 1024)
    custom_minimum_size = Vector2(16,16)
    index = get_index()


func get_global_center():
    return get_global_rect().get_center()


func get_value() -> int:
    @warning_ignore("assert_always_false")
    assert(0, "Instatiation of abstract class 'Slot'")
    return 0


func _input(event: InputEvent) -> void:
    if get_global_rect().has_point(event.global_position)\
    && event is InputEventMouseButton:
        if global.drag_node is Slot\
        && event.button_index == MouseButton.MOUSE_BUTTON_LEFT\
        && !event.pressed:
            handle_drop()
        elif event.pressed:
            handle_drag_start()


func handle_drag_start():
    global.drag_node = self
    global.drag_offset = position


func handle_drop() -> void:
    @warning_ignore("assert_always_false")
    assert(0, "Function not implemented")

