class_name InterationComponent

extends Area2D
signal Interation_activated
signal Interation_deactivated



func _on_body_entered(body: Node2D) -> void:
	Interation_activated.emit()


func _on_body_exited(body: Node2D) -> void:
	Interation_deactivated.emit()
