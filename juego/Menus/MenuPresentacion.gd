#MenuPresentacion.gd
tool
extends Control

export(String,FILE,"*.tscn") var menu_inicial= ""

func _ready():
	var cargar: GuardarCarga=GuardarCarga.new()
	cargar.cargar_datos_configuracion()

func _get_configuration_warning() -> String:
	if menu_inicial == "":
		return "No hay menu inicial asignado"
	return ""

func carga_menu()->void:
	get_tree().change_scene(menu_inicial)
