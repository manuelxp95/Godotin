#CargaSegundoPlano.gd
extends Control

var hilo: Thread = null
var puede_iniciar: bool = false
var escena_precargada: Node = null

onready var barra_progreso:ProgressBar =$ProgressBar
onready var texto_completo : Label = $TextoCompleto

func _ready()-> void:
	barra_progreso.visible=false
	barra_progreso.visible=false

func cargar_nivel(nivel:String)-> void:
	hilo = Thread.new()
	hilo.start(self,"cargar_hilo",nivel,2)
	raise()
	barra_progreso.visible=true

func cargar_hilo(nivel: String)-> void:
	pass
