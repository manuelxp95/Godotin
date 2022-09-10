extends Control

onready var etiqueta_vidas = $ContenedorVidas/Cantidad
onready var etiqueta_moneda_oro=$ContenedorMonedaOro/Cantidad


func _ready():
# warning-ignore:return_value_discarded
	Eventos.connect("actualizar_hud",self,"actualizar_hud")
	actualizar_hud()


func actualizar_hud():
	etiqueta_vidas.text = "%s" % DatosJuego.vidas
	etiqueta_moneda_oro.text="%s" % DatosJuego.monedas_oro

