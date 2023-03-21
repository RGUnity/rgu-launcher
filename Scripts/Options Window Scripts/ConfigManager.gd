extends Node

@export_group("Display Category")
@export var windowModeDropdown: OptionButton
@export var vsyncCheckbox: CheckBox
@export var limitFPSCheckbox: CheckBox
@export var maxFPSSpinbox: SpinBox

@export_group("Graphics Category")
@export var antiAliasingCheckbox: CheckBox
@export var shadowsCheckbox: CheckBox

@export_group("Audio Category")
@export var musicSlider: Slider
@export var effectsSlider: Slider
@export var voicesSlider: Slider

@export_group("Gameplay Category")
@export var subtitlesCheckbox: CheckBox
@export var autodefendCheckbox: CheckBox

@export_group("")

# PATH
@export var redguardPathLineEdit: LineEdit


var config


func _on_options_window_about_to_popup():
	load_config_and_set_values()


func load_config_and_set_values():
	
	%ConfigLoader.load_config()
	
	# DISPLAY CATEGORY GETTERS
	windowModeDropdown.selected = config.windowMode
	vsyncCheckbox.button_pressed = config.vsync
	limitFPSCheckbox.button_pressed = config.limitFPS
	maxFPSSpinbox.value = config.maxFPS
	
	# GRAPHICS CATEGORY GETTERS
	antiAliasingCheckbox.button_pressed = config.antiAliasing
	shadowsCheckbox.button_pressed = config.shadows
	
	# AUDIO CATEGORY GETTERS
	musicSlider.value = config.music
	effectsSlider.value = config.effects
	voicesSlider.value = config.voices
	
	# GAMEPLAY CATEGORY GETTERS
	subtitlesCheckbox.button_pressed = config.subtitles
	autodefendCheckbox.button_pressed = config.autoDefend
	
	# FILEPATHS CATEGORY GETTERS
	redguardPathLineEdit.text = config.redguardPath
	
	%DependencyManager.update_vsync_dependencies()
	%DependencyManager.update_fpslimit_dependencies()


func set_values_and_save_config():
	
	# DISPLAY CATEGORY SETTERS
	config.windowMode = windowModeDropdown.selected
	config.vsync = vsyncCheckbox.button_pressed
	config.limitFPS = limitFPSCheckbox.button_pressed
	config.maxFPS = int(maxFPSSpinbox.value)

	# GRAPHICS CATEGORY SETTERS
	config.antiAliasing = antiAliasingCheckbox.button_pressed
	config.shadows = shadowsCheckbox.button_pressed
	
	# AUDIO CATEGORY SETTERS
	config.music = int(musicSlider.value)
	config.effects = int(effectsSlider.value)
	config.voices = int(voicesSlider.value)
	
	# GAMEPLAY CATEGORY SETTERS
	config.subtitles = subtitlesCheckbox.button_pressed
	config.autoDefend = autodefendCheckbox.button_pressed
	
	# FILEPATHS CATEGORY SETTERS
	config.redguardPath = redguardPathLineEdit.text
	
	%ConfigSaver.save_config()
