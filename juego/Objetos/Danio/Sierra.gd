#Sierra.gd
extends Area

func _on_body_entered(body):
	if body is Godotin:
		body.respawn()
