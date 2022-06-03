extends Node


func get_quest():
	var quest = Quest.new()
	quest.text = 'TEST'
	
	for i in range(1,5):
		var item = QuestItem.new()
		item.set_answer_text(i)
		item.is_true_answer= i==1
		quest.add(item)
	randomize()
	quest.items.shuffle()
	return quest 
	

class Quest extends Node2D:
	var text=''
	var items = []
	
	func add(item:QuestItem):
		items.append(item)

	
	func _to_string():
		return text
		
class Variant:
	var value
	var text=''
	func _init(val):
		value = val
		if val==1:
			text='A'
		elif val==2:
			text='B'
		elif val==3:
			text='C'
		elif val==4:
			text='D'
	func _to_string():
		return text
#class QuestItem extends Node2D:
#	var 
