# This is where we load in the world, player, menus, etc.
extends Node2D

var MailTruck = preload("res://characters/MailTruck.tscn")
var World = preload("res://environment/World.tscn")
var Mail = preload("res://environment/Mail.tscn")
var Menu = preload("res://game/Menu.tscn")

func _ready():
	Global.main = self

func _on_start_button_down():
	Global.instance_node(World, self)
	Global.instance_node(MailTruck, self)
	var mail = Mail.instantiate()
	self.add_child(mail)
	$Menu.queue_free()
