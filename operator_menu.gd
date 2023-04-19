extends Tree


var texture: = preload("res://icon.svg")
func add_gate(
    group: TreeItem,
    gate_index: StringName,
) -> TreeItem:
    var item = create_item(group)
    item.set_metadata(0, gate_index)
    var gate_data: Array = gates[gate_index]
    item.set_text(0, gate_data[name_])
    item.set_icon(0, texture, )
#    item.set/
    return item

enum {name_, packed_scene_,}

var gates: Dictionary = {
    &"gate_constant": [
        "Constant",
        preload("res://gates/constant.tscn")
    ],
#}
#
#var gates_2_1: Dictionary = {
    &"gate_max": [
        "Max",
        preload("res://gates/max.tscn")
    ],
    #    &"gate_min": [
    #        "Min",
    #        preload("res://gates/min.tscn")
    #    ],
    #    &"gate_sum": [
    #        "Sum",
    #        preload("res://gates/sum.tscn")
    #    ],
    #    &"gate_product": [
    #        "Product",
    #        preload("res://gates/product.tscn")
    #    ],
#}
#
#var gates_1_1: Dictionary = {
    &"gate_negate": [
        "Negate",
        preload("res://gates/negate.tscn")
    ],
    #    &"gate_increment": [
    #        "Increment",
    #        preload("res://gates/increment.tscn")
    #    ],
    #    &"gate_decrement": [
    #        "Decrement",
    #        preload("res://gates/decrement.tscn")
    #    ],
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    print(texture.get_size())
    var root: = create_item()

    var other: = create_item(root)
    other.set_text(0, "Other")
    add_gate(other, &"gate_constant")

    var gates_2_1: = create_item(root)
    gates_2_1.set_text(0, "Binary Gates")
    add_gate(gates_2_1, &"gate_max")
#    add_gate(gates_2_1, &"gate_min")
#    add_gate(gates_2_1, &"gate_sum")
#    add_gate(gates_2_1, &"gate_product")

    var gates_1_1: = create_item(root)
    gates_1_1.set_text(0, "Unary Gates")

    add_gate(gates_1_1, &"gate_negate")
#    add_gate(gates_1_1, &"gate_increment")
#    add_gate(gates_1_1, &"gate_decrement")



func _on_button_clicked(item: TreeItem, column: int, id: int, mouse_button_index: int) -> void:
    print(item)
