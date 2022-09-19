#GuardarCargaTest.gd
extends Node

func _on_BotonGuardar_pressed():
	if $NombreJSON.text !="":
		var guardar:GuardarCarga=GuardarCarga.new()
		var resultado: int = guardar.guardar_datos_json(
			{
				"nombre": $NombreJSON.text
			}
		)
		$TextoResultadoJSON.text="%s"%resultado
	else:
		$TextoResultadoJSON.text= "El campo no puede estar vacio"


func _on_BotonCargar_pressed():
	var cargar: GuardarCarga=GuardarCarga.new()
	var datos: Dictionary= cargar.cargar_datos_json()
	if not datos.empty():
		$NombreJSON.text=datos.nombre
		$TextoResultadoJSON.text="Carga existosa"
	else:
		$TextoResultadoJSON.text= "Error en la carga"


func _on_BotonGuardarGodot_pressed():
	if $NombreTRES.text !="":
		var guardar:GuardarCarga=GuardarCarga.new()
		var resultado: int = guardar.guardar_datos_tres(
			{
				"nombre": $NombreTRES.text
			}
		)
		$TextoResultadoTRES.text="%s"%resultado
	else:
		$TextoResultadoTRES.text= "El campo no puede estar vacio"


func _on_BotonCargarGodot_pressed()->void:
	var cargar: GuardarCarga=GuardarCarga.new()
	var datos: Dictionary= cargar.cargar_datos_tres()
	if not datos.empty():
		$NombreTRES.text=datos.nombre
		$TextoResultadoTRES.text="Carga existosa"
	else:
		$TextoResultadoTRES.text= "Error en la carga"


func _on_BotonBorrar_pressed():
	var borrar: GuardarCarga= GuardarCarga.new()
	var resultado: int = borrar.borrar_datos()
	$TextoResultadoTRES.text="%s" % resultado
