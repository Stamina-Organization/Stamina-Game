extends Control

@onready var leave_windows = $"."
var windows_show = false

# Il est possible d'optimiser le code ci-dessous en récupérant les paramètrs de visibilité de la fenêtre
# Une fois la touche echap pressé, si la fenêtre est affiché elle disparait et inversement
# En gros une sorte de !window.isVisible
# Si window.isVisible = true alors le !window.isVisible fera que window.isVisible = false et inversement
# Je met ça en commentaire parce que je connais pas le langage mais c'est une suggestion 😭

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if windows_show == true:
			leave_windows.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			windows_show = false
		elif windows_show == false: 
			leave_windows.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			windows_show = true


func _on_stay_game_pressed():
	leave_windows.hide()
	windows_show = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_leave_game_pressed():
	ChangeScene.goto_scene("res://launcher/launcher.tscn", self, false)
