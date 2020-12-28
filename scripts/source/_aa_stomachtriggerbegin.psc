Scriptname _AA_StomachTriggerBegin extends ObjectReference  

ObjectReference Property acid auto
ObjectReference Property acidTrigger auto
ObjectReference Property acidMarker auto
ObjectReference Property shooter1 auto
ObjectReference Property shooter2 auto
ObjectReference Property shooter3 auto
ObjectReference Property walls auto
MusicType Property bestMusic auto
MusicType Property worstMusic auto
bool doOnce = False
Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
	if(doOnce == False)

	Game.GetPlayer().SetGhost(false)
	acid.TranslateToRef(acidMarker, 30)
	acidTrigger.TranslateToRef(acidMarker, 75)
	shooter1.EnableNoWait()
	walls.DisableNoWait()
 	shooter2.EnableNoWait()
	shooter3.EnableNoWait()
	;worstMusic.Remove()
	;bestMusic.Add()
	doOnce = True
	endif
	endif
EndEvent