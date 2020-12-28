Scriptname _AA_Stage4HurtBitScript extends ObjectReference  


GlobalVariable Property alduinHealth auto
ObjectReference Property alduinHurtBit1 auto
ObjectReference Property alduinHurtBit2 auto
ObjectReference Property alduinHurtBit3 auto
int random
bool hitOnce = false
Sound Property dragonMadSound auto
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,bool abBashAttack, bool	abHitBlocked)
	if(hitOnce == false)
	if(akAggressor == Game.GetPlayer())
		hitOnce = true
		alduinHealth.setValue(alduinHealth.getValue() + 1)
		random = Utility.RandomInt(0, 2)
		self.DisableNoWait(true)
		if(random == 0)
			alduinHurtBit1.EnableNoWait(true); 
			alduinHurtBit2.DisableNoWait(true);
			alduinHurtBit3.DisableNoWait(true);


		elseif(random == 1)
			alduinHurtBit2.EnableNoWait(true); 
			alduinHurtBit1.DisableNoWait(true);
			alduinHurtBit3.DisableNoWait(true);


		elseif(random == 2)
			alduinHurtBit3.EnableNoWait(true); 
			alduinHurtBit2.DisableNoWait(true);
			alduinHurtBit1.DisableNoWait(true);
		endif
		dragonMadSound.Play(Game.GetPlayer())
		Game.ShakeCamera(Game.GetPlayer(), 1, 1)
		Utility.Wait(6)
		hitOnce = false
	endif
	endif
EndEvent