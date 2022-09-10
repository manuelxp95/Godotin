#MenuInicio.gd
tool
extends Control

export(String,FILE,"*.tscn") var menu_ajustes=""
export(String,FILE,"*.tscn") var nivel_inicial=""

func _get_configuration_warning()->String:
	if menu_ajustes =="":
		return "Chequear rutas"
	return ""


func _on_BotonSalir_pressed():
	get_tree().quit()


func _on_BotonOpciones_pressed():
	$BotonSFX.play()
	get_tree().change_scene(menu_ajustes)


func _on_BotonNuevo_pressed():
	get_tree().change_scene(nivel_inicial)
