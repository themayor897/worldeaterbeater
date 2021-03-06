Scriptname _AA_BarrierRelease extends ObjectReference  

MagicEffect Property unrelentingForce1 auto
MagicEffect Property unrelentingForce2 auto
MagicEffect Property unrelentingForce3 auto
GlobalVariable Property freed auto
Actor Property linkedActor auto
ObjectReference Property beam auto
bool doOnce = False

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	if(akCaster== Game.GetPlayer())
	
	if(akEffect== unrelentingForce1 || akEffect== unrelentingForce2 || akEffect== unrelentingForce3)
	if(!doOnce)
		self.DisableNoWait(true)
		freed.SetValue(freed.GetValue() + 1)
		linkedActor.DisableNoWait(true)
		beam.EnableNoWait(true)
		Game.ShakeCamera(Game.GetPlayer(), 1, 1)
		doOnce = True
	endif
	endif
	endif
EndEvent