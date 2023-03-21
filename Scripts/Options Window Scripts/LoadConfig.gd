extends Node

#	These crate the path for the new file in /LocalLow
var windowsDrive = OS.get_environment("windir").rstrip("WINDOWS")
var username = OS.get_environment("USERNAME")
var configPath = windowsDrive + "/users/" + username + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.json"

func load_config():
	if FileAccess.file_exists(configPath):

		var jsonString = FileAccess.get_file_as_string(configPath)
		%ConfigManager.config = JSON.parse_string(jsonString)
		
		# Apparently we can just load data from this json string
		# for example like this: 
		
#		var test = JSON.parse_string(jsonString).maxFPS
#		print("Config Found with version " + str(test))

	else:
		print ("Restoring Default config")
		%DefaultConfigLoader.restore_default_config()
