Scriptname _AA_Stage4WingControl extends ObjectReference  

ObjectReference Property rightWing auto
ObjectReference Property leftWing auto
ObjectReference Property rightWing2 auto
ObjectReference Property leftWing2 auto

Event OnLoad()
	rightWing.TranslateToRef(rightWing2, 10, 5)
	leftWing.TranslateToRef(leftWing2, 10, 5)
EndEvent