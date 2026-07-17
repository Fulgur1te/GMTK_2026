extends Resource

class_name SaveData

# store UIDs!
@export var first_play := true
#@export var version := 1 # update on each save data revision

func _init() -> void:
	first_play = true
