#GuardarCarga.gd
class_name GuardarCarga
extends Node

##Guardar Datos
func guardar_datos_json(datos_a_guardar:Dictionary)->int:
	if not OS.get_name()in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	
	var archivo: File= File.new()
	
	var resultado: int = archivo.open(seleccionar_ruta(".json"),File.WRITE)
	if resultado == OK:
		archivo.store_line(to_json(datos_a_guardar))
		archivo.close()
	return resultado

func guardar_datos_tres(datos_a_guardar:Dictionary)->int:
	if not OS.get_name()in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return -1
	var datos:DatosUsuarioGuardado= DatosUsuarioGuardado.new()
	datos.nombre=datos_a_guardar.nombre
	var resultado : int= ResourceSaver.save(seleccionar_ruta(".tres"),datos)
	
	return resultado


func seleccionar_ruta(tipo_extension:String)-> String:
	var ruta: String
	if OS.is_debug_build():
		ruta= DatosConfiguracion.RUTA_GUARDADO_DEBUG
	else:
		ruta= DatosConfiguracion.RUTA_GUARDADO_REALEASE
	chequear_existencia_directorio(ruta)
	
	ruta+= DatosConfiguracion.NOMBRE_ARCHIVO_DATOS+tipo_extension
	return ruta

func chequear_existencia_directorio(ruta:String)-> void:
	var dir = Directory.new()
	if not dir.dir_exists(ruta):
		Directory.new().make_dir_recursive(ruta)

##CArgar Datos
func cargar_datos_json()-> Dictionary:
	if not OS.get_name() in DatosConfiguracion.OS_ADMITIDOS_GUARDADO:
		return{}
	var archivo: File = File.new()
	
	var resultado: int = archivo.open(seleccionar_ruta(".json"),File.READ)
	if resultado== OK:
		var datos_cargados: Dictionary= parse_json(archivo.get_line())
		archivo.close()
		return datos_cargados
	return {}

func cargar_datos_tres()-> Dictionary:
	var datos:Resource=load(seleccionar_ruta(".tres"))
	return{
		"nombre": datos.nombre
	}
