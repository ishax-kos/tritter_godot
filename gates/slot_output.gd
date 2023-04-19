extends Slot
class_name Slot_out


func get_value() -> int:
    return master.get_value(index)


func handle_drop():
    if global.drag_node is Slot_in:
        var input: Slot_in = global.drag_node
        global.drag_node = null
        if input.master != master:
            print("linked")
            input.link = self
