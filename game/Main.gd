# This is where we load in the world, player, menus, etc.
extends Node2D

var MailTruck = preload("res://characters/MailTruck.tscn")

func _ready():
	Global.main = self
	Global.instance_node(MailTruck, self)
