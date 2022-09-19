#DatosJuego.gd
extends Node

##Atributos
var vidas = 3
var monedas_oro = 0
var nivel_actual = ""
var num_nivel_actual:int =0
var nivel_proximo:String = ""
var puntaje = 0
var continue_button = false

##Metedos custom
func reset() -> void:
	vidas= 3
	monedas_oro = 0
	puntaje = 0

func generar_puntaje()-> int:
	var valor_oro = monedas_oro*10
	puntaje = valor_oro
	return puntaje

func restar_vida()-> void:
	vidas -= 1
	if vidas ==0:
		Eventos.emit_signal("game_over")

	Eventos.emit_signal("actualizar_hud")

func sumar_monedas():
	monedas_oro +=1
	Eventos.emit_signal("actualizar_hud")
