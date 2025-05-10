# This is where we load in the world, player, menus, etc.
extends Node2D

var MailTruck = preload("res://characters/MailTruck.tscn")
var World = preload("res://environment/World.tscn")

func _ready():
	Global.main = self
	Global.instance_node(World, self)
	Global.instance_node(MailTruck, self)
	
