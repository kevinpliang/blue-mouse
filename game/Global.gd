# This is where we will put things that need Global scope
extends Node

# Global instances
var main = null
var player = null

func _process(delta):
	pass

# Helper method for creating nodes
func instance_node(node, parent, location=Vector2(0,0)):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
