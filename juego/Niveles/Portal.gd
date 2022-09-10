#Portal.gd
class_name PortalNivel
extends Area

export(String,FILE,"*.tscn") var proximo_nivel=""


func _on_body_entered(body):
	if proximo_nivel != "":
		get_tree().change_scene(proximo_nivel)

