#PantallaCarga.gd
extends Control




func _on_Timer_timeout()-> void:
	if OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_THREADS:
		##cargamos en segundo plano
		pass
	else:
		get_tree().change_scene(DatosJuego.nivel_actual)
