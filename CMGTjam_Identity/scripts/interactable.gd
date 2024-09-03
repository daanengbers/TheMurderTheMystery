extends StaticBody2D

@export var objectname = "Rock"
@export var interacttext1 = "This object can have one line of text"
@export var interacttext2 = "2"
@export var interacttext3 = "3"
@export var interacttext4 = "4"
@export var interacttext5 = "5"
@export var interacttext6 = "6"
@export var interacttext7 = "7"
@export var interacttext8 = "8"
@export var interacttext9 = "9"

@export var int_maxlines = 5

func interact():
	GlobalDialogue.loadLines(interacttext1,interacttext2,interacttext3,interacttext4,interacttext5,interacttext6,interacttext7,interacttext8,interacttext9)
	GlobalDialogue.setPersonSpeaking(str(objectname))
	GlobalDialogue.setDialougueOn()
	GlobalDialogue.maxlines = int_maxlines
	GlobalDialogue.nextLine()
