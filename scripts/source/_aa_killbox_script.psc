Scriptname _AA_Killbox_Script extends ObjectReference  

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		Game.GetPlayer().Kill()
	endif
EndEvent