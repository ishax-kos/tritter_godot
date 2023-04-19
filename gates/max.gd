extends Gate


func _table_function(input: Array[int]) -> Array[int]:
    assert(input.size() == 2)
    return [max(input[0], input[1])]
