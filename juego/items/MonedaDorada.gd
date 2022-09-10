#MonedaDorada.gd
class_name Moneda
extends Area


func _on_body_entered(body):
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled",true)
	$AnimationPlayer.play("consumida")
