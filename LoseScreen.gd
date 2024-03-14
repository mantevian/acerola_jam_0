extends Control


func _ready():
	pass


func _process(delta):
	pass


func _on_button_pressed():
	self.hide()
	get_tree().reload_current_scene()
