Scriptname _AA_ProjectileHellScript extends ObjectReference  
{Script for the marker that fires out 4-8 other spells.}

Spell Property mainSpell auto

Activator Property marker auto
ObjectReference marker1 
ObjectReference marker2 
ObjectReference marker3 
ObjectReference marker4 
ObjectReference marker5 
ObjectReference marker6 
ObjectReference marker7 
ObjectReference marker8 
Actor Property Alduin Auto

Event OnLoad()
	marker1 = self.PlaceAtMe(marker)
	marker2 = self.PlaceAtMe(marker)
	marker3 = self.PlaceAtMe(marker)
	marker4 = self.PlaceAtMe(marker)
	marker5 = self.PlaceAtMe(marker)
	marker6 = self.PlaceAtMe(marker)
	marker7 = self.PlaceAtMe(marker)
	marker8 = self.PlaceAtMe(marker)
	marker1.moveTo(self, afYOffset = 100)
	marker2.moveTo(self, afYOffset = -100)
	marker3.moveTo(self, afXOffset = 100)
	marker4.moveTo(self, afXOffset = -100)
	marker5.moveTo(self, afYOffset = 100, afXOffset = 100)
	marker6.moveTo(self, afYOffset = 100, afXOffset = -100)
	marker7.moveTo(self, afYOffset = -100, afXOffset = 100)
	marker8.moveTo(self, afYOffset = -100, afXOffset = -100)

	Utility.Wait(0.1);

	mainSpell.cast(self, marker1)

	mainSpell.cast(self, marker2)

	mainSpell.cast(self, marker3)
	mainSpell.cast(self, marker4)
	if(!Alduin.IsFlying())

		mainSpell.cast(self, marker5)


		mainSpell.cast(self, marker6)


		mainSpell.cast(self, marker7)


		mainSpell.cast(self, marker8)
		
	endif
	marker1.DeleteWhenAble()
	marker2.DeleteWhenAble()
	marker3.DeleteWhenAble()
	marker4.DeleteWhenAble()
	marker5.DeleteWhenAble()
	marker6.DeleteWhenAble()
	marker7.DeleteWhenAble()
	marker8.DeleteWhenAble()
	self.DeleteWhenAble()
EndEvent