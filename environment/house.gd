extends Node2D

class_name House

# Constants
var myCoordinates
var myColor
var myLot
var myAddress
var flagUp = false

func _ready() -> void:
	$Flag.frame = myColor
	$Label.text = "%04d" % myAddress

func _process(float) -> void:
	if(flagUp): 
		$Flag.visible = true
	else: 
		pass
		#$Flag.visible = false
