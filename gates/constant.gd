extends Gate


func _on_v_slider_value_changed(value: float) -> void:
    cached_output_states[0] = int(value)

func _table_function(input: Array[int]) -> Array[int]:
    return cached_output_states
