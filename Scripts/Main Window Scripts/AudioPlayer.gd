extends AudioStreamPlayer

@export var hoverSounds: Array[AudioStream]
@export var pressedSounds: Array[AudioStream]
@export var buttonParent: Control
@export_node_path var testButtonPath

func play_hover_audio():
	if !self.playing:
		var randomHoverSound = hoverSounds[randi() % hoverSounds.size()]
		self.stream = randomHoverSound
		self.play()

func play_pressed_audio():
	if !self.playing:
		var randomPressedSound = pressedSounds[randi() % pressedSounds.size()]
		self.stream = randomPressedSound
		self.play()
		
func _ready():
	for button in buttonParent.get_children():
		button.connect("mouse_entered", Callable(self, "_on_Button_mouse_entered"))
		button.connect("pressed", Callable(self, "_on_Button_pressed"))

func _on_Button_mouse_entered():
	play_hover_audio()

func _on_Button_pressed():
	play_pressed_audio()
