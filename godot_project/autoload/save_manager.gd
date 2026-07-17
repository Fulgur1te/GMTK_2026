extends Node

var save_data_path = "user://save_data.tres"

## Don't forget to save_game() after modifying this!
var save_data: SaveData

func _ready() -> void:
	if not FileAccess.file_exists(save_data_path):
		save_data = SaveData.new()
		save_game()
	else:
		load_game()


##Save current game state to the file
func save_game() -> void:
	var result = ResourceSaver.save(save_data, save_data_path)
	if result != OK:
		push_error("[SaveManager] Couldn't save game!")


##Load game state from the file
func load_game() -> void:
	var result = ResourceLoader.load(save_data_path)
	if result == null or result is not SaveData:
		push_error("[SaveManager] Loaded save data is not correct!")
		return
	save_data = result
