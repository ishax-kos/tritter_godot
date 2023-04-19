extends BaseButton
class_name Gate

var inputs : Array[Slot_in ]
var outputs: Array[Slot_out]

@export var input_count: int = 1
@export var output_count: int = 1

var update_id: = 0
#var step: = 0
var cached_output_states: Array[int]

func _ready() -> void:
    for i in input_count:
        var node: = Slot_in.new()
        inputs.append(node)
        $Input.add_child(node)
        node.index = i

    for i in output_count:
        var node: = Slot_out.new()
        outputs.append(node)
        $Output.add_child(node)
        node.index = i
    cached_output_states.resize(output_count)


func get_value(out_index: int) -> int:

    if global.update_id != update_id:
        update_id = global.update_id
        var input_values: = get_inputs_values()
        print(self)
        if input_values != []:
            cached_output_states = _table_function(input_values)
            assert(cached_output_states.size() == outputs.size())
    return cached_output_states[out_index]


func _table_function(input: Array[int]) -> Array[int]:
    @warning_ignore("assert_always_false")
    assert(0, "Function not implemented!")
    return input


func _on_button_down() -> void:
    global.drag_node = self
    global.drag_offset = self.global_position - get_global_mouse_position()


func get_inputs_values() -> Array[int]:
    var ret: Array[int] = []
    ret.resize(inputs.size())
    for i in inputs.size():
        var slot_out: Slot_out = inputs[i].link
        if slot_out:
            ret[i] = slot_out.get_value()
        else:
            return []
    return ret

