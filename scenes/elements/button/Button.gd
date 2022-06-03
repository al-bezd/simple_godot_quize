extends Button
class_name QuestItem

var tween 
var answer_test setget set_answer_text
var variant setget set_variant
export var is_true_answer = false

var is_pressed=false
var delay_speed = .3
var true_color = Color.green
var false_color = Color.red

signal answer_true
signal answer_false


func _ready():
	rect_min_size=Vector2(480,75)
	rect_size=Vector2(480,75)
	tween = Tween.new()
	add_child(tween)
	connect("pressed",self,'_on_Button_pressed')

func set_answer_text(val):
	answer_test = val
	text = '{variant}) {text}'.format({"variant":variant,"text":answer_test})

func show_true_answer(emmit_signals=false):
	var color=Color.white
	for i in 2:
		if is_true_answer:
			color = true_color
		else:
			color = false_color
			
		tween.interpolate_property(self,'modulate',Color.white,color,delay_speed)
		tween.start()
		yield(get_tree().create_timer(delay_speed),"timeout")
		
		tween.interpolate_property(self,'modulate',color,Color.white,delay_speed)
		tween.start()
		yield(get_tree().create_timer(delay_speed),"timeout")
		
	tween.interpolate_property(self,'modulate',Color.white,color,delay_speed)
	tween.start()
	yield(get_tree().create_timer(delay_speed),"timeout")
	if !emmit_signals:
		return
	if color==true_color:
		emit_signal('answer_true')
	else:
		emit_signal('answer_false')

func _on_Button_pressed():
	
	if is_pressed:
		return
		
	is_pressed=true
	disabled=true
	
	show_true_answer(true)
	
func set_variant(val):
	variant = ObjectsManager.Variant.new(val)
	set_answer_text(answer_test)
	



