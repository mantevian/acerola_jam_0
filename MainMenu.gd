extends Control


func _ready():
	pass


func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Level.tscn")


func _on_github_button_pressed():
	OS.shell_open("https://github.com/mantevian/")
