Scriptname _AA_StomachWaterMove extends ObjectReference  

ObjectReference Property acid auto
ObjectReference Property acidMarker1 auto
ObjectReference Property acidMarker2 auto
int upState = 0;

Event OnTranslationComplete()
	if(upState == 0)
		Utility.Wait(1)
		acid.translateToRef(acidMarker2, 30)
		upState = 1
	else
		Utility.Wait(1)
		acid.translateToRef(acidMarker1, 30)
		upState = 0
	endif
 
EndEvent