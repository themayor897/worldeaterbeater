Scriptname _AA_CometReleaseScript extends ObjectReference  

ObjectReference Property marker1 auto
ObjectReference Property marker2 auto
ObjectReference Property marker3 auto

ObjectReference Property marker4 auto
ObjectReference Property marker5 auto
ObjectReference Property marker6 auto

ObjectReference Property marker7 auto
ObjectReference Property marker8 auto
ObjectReference Property marker9 auto
ObjectReference Property alduinBack auto

Spell Property bigExplosion auto
Sound Property roar auto

ActorBase Property shadesofAlduin auto
Actor Property alduin auto
ObjectReference dragon1
ObjectReference dragon2

Int startingState = 0
GlobalVariable Property dragonBornsFreed auto
GlobalVariable Property alduinHealth auto
bool doOnce = false
MusicType Property music1 auto
MusicType Property music2 auto

Event OnLoad()
	if(dragonBornsFreed.GetValue() < 3)
		dragon1 = self.PlaceAtMe(shadesofAlduin, 1)
		dragon1.MoveTo(self, 100)
	endif
	if(dragonBornsFreed.GetValue() < 2)
		dragon2 = self.PlaceAtMe(shadesofAlduin, 1)
		dragon2.MoveTo(self, -100)
	endif
EndEvent

MagicEffect Property unrelentingForce1 auto
MagicEffect Property unrelentingForce2 auto
MagicEffect Property unrelentingForce3 auto


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if(akCaster== Game.GetPlayer())

	if(akEffect== unrelentingForce1 || akEffect== unrelentingForce2 || akEffect== unrelentingForce3)

		if(startingState < 10)

			self.TranslateToRef(marker1, 1000)
			startingState  = 11
			Game.ShakeCamera(Game.GetPlayer(), 1, 1)
		elseif(startingState > 11)
			if(doOnce == False)
				doOnce = True
				startingState == 20
				self.StopTranslation()
				self.TranslateToRef(alduin, 1000)
				Utility.Wait(3)
				startingState = 50
				bigExplosion.Cast(self, alduin)
				self.Disable()
				alduinHealth.setValue(alduinHealth.GetValue() + 1)
				roar.Play(Game.GetPlayer())
				Game.ShakeCamera(Game.GetPlayer(), 1, 1)		
				if(alduinHealth.GetValue() >= 10)
					Game.GetPlayer().TranslateToRef(alduin, 700)
					Game.ShakeCamera(Game.GetPlayer(), 1, 6)		
					Utility.Wait(4)
					music1.Remove()
					Game.GetPlayer().StopTranslation()
					Game.GetPlayer().MoveTo(alduinBack)
					Utility.Wait(3)
					music2.Add()
				endif
				Utility.Wait(5)
				doOnce = False
				self.DeleteWhenAble()
			endif
		endif
	endif
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if(akAggressor == Game.GetPlayer())
		startingState += 5
		if(startingState == 10)
			self.TranslateToRef(marker1, 600)
			startingState  = 11
			Game.ShakeCamera(Game.GetPlayer(), 1, 1)
		endif
	endif
EndEvent

Event OnTranslationComplete()
	if(startingState == 11)
		startingState = 12
		self.TranslateToRef(marker2, 1000)
	elseif(startingState == 12)
		startingState = 13
		self.TranslateToRef(marker3, 1000)
	elseif(startingState == 13)
		startingState = 14
		self.TranslateToRef(marker4, 1000)
	elseif(startingState == 14)
		startingState = 15
		self.TranslateToRef(marker5, 1000)
	elseif(startingState == 15)
		startingState = 16
		self.TranslateToRef(marker6, 1000)		
	elseif(startingState == 16)
		startingState = 17
		self.TranslateToRef(marker7, 1000)
	elseif(startingState == 17)
		startingState = 18
		self.TranslateToRef(marker8, 1000)		
	elseif(startingState == 18)
		startingState = 19
		self.TranslateToRef(marker9, 1000)		
	elseif(startingState == 19)
		startingState = 20
		self.TranslateToRef(marker1, 1000)	
	elseif(startingState == 20)
		startingState = 12
		self.TranslateToRef(marker2, 1000)	
	endif
EndEvent