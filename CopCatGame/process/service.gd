extends Node

func step_to(target:float, step:float, value:float = 0, delta:float = 1, use_delta_in_result = true):
	if target != value:
		if abs(target - value) < step * delta:
			return target
		else:
			if use_delta_in_result:
				return value + step * ((target - value)/abs(target - value)) * delta
			else:
				return value + step * ((target - value)/abs(target - value))
	else:
		return value
