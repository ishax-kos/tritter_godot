extends Slot
class_name Slot_in


var link: Slot_out


#func get_value() -> int:
#    return link.master.get_value(link.index)


func handle_drag_start():
    if link:
        global.drag_node = link
        link = null
    else:
        super.handle_drag_start()


func _enter_tree() -> void:
    global.input_slots.append(self)


func _exit_tree() -> void:
    var i: int = global.input_slots.rfind(self)
    assert(i >= 0)
    global.input_slots[i] = global.input_slots.back()
    global.input_slots.pop_back()


func handle_drop():
    if global.drag_node is Slot_out:
        var output: Slot_out = global.drag_node
        global.drag_node = null
        if output.master != master:
            print("linked")
            link = output
