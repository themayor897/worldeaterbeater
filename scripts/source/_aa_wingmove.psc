Scriptname _AA_WingMove extends ObjectReference  

ObjectReference Property wing1 auto
ObjectReference Property wing2 auto
int moveState = 0

Event OnTranslationComplete()
	if(moveState == 0)
			moveState = 1
			self.TranslateToRef(wing1, 10, 5)

	else
			moveState = 0
			self.TranslateToRef(wing2, 10, 5)

	endif
		Game.ShakeCamera(Game.GetPlayer(), 1, 1)
EndEvent