extends Node

var directory #= DirAccess.new()
#	Path3D for the template config file that gets copied if no config file exists
var defaultPath = OS.get_executable_path().get_base_dir() + "/Config_Default.cfg"
var defaultPathEditor = ProjectSettings.globalize_path("res://Config_Default.cfg")
#	These crate the path for the new file in /LocalLow
var drive = OS.get_environment("windir").rstrip("WINDOWS")
var user = OS.get_environment("USERNAME")
var path = drive + "/users/" + user + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.cfg"

func restore_default_config():	
	#	Check if we are running in Editor or Build, then load the available DefaultConfig
	if OS.has_feature("editor"):
		print("Running in Editor, looking for config here: ", defaultPathEditor)
		directory = DirAccess.copy_absolute(defaultPathEditor, path)

	#	Same thing, but in Build mode
	else: 
		print("Running as Build, looking for default config here: ", defaultPath)
		directory = DirAccess.copy_absolute(defaultPathEditor, path)
		
	#	After the config file has been restored, finally load its data
	%ConfigManager.config.load(path)

	#	Now Add a timestamp to mark the creation date and load it again
	var timestamp = Time.get_datetime_string_from_system()

	%ConfigManager.config.set_value("Info", "test", timestamp)
	%ConfigManager.config.save(path)
	
	print ("Created new config here: ", path)
