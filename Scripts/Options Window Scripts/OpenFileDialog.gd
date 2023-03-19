extends HBoxContainer

# "NativeFileDialog" is from the Addon "NativeDialogs" by 98teg on GitHub
# Link: https://github.com/98teg/NativeDialogs
@export var fileDialog: NativeFileDialog
@export var lineEdit: LineEdit


# When the "..." button is pressed, open a file dialog 
func _on_select_path_pressed():
	fileDialog.show()


# When that dialog returns a path, set it as the text for the lineEdit
func _on_native_file_dialog_dir_selected(dir):
	lineEdit.text = dir
