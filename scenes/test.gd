extends Node2D

var quest
var buttons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	quest = ObjectsManager.get_quest()
	buttons = quest.items
	$CanvasLayer/Control/Panel/RichTextLabel.text = str(quest)
	for i in range(1,5):
		var item = buttons[i-1]
		item.set_variant(i)
		$CanvasLayer/Control/VBoxContainer2.add_child(item)
		if item.is_true_answer:
			item.add_to_group('true_answer')
		item.connect('pressed',self,'pressed')
		item.connect('answer_true',self,'answer_true',[item])
		item.connect('answer_false',self,'answer_false',[item])

func pressed():
	for i in buttons:
		i.disabled=true
		
func answer_true(obj):
	pass
	
func answer_false(obj):
	get_tree().call_group('true_answer','show_true_answer')
