Scriptname _AA_Stage3_DealWithIt extends ObjectReference  

Spell Property fireBreath1 auto ;Firebreath for putting out ice
Spell Property fireBreath2 auto ;Firebreath for putting out ice
Spell Property fireBreath3 auto ;Firebreath for putting out ice
Spell Property flames auto ;Flames to put out ice

Spell Property clearSkies1 auto ;Clear skies to put out fire
Spell Property clearSkies2 auto ;Clear skies to put out fire
Spell Property clearSkies3 auto ;Clear skies to put out fire
Spell Property unrelenting1 auto ;Unrelenting to put out fire
Spell Property unrelenting2 auto ;Unrelenting to put out fire
Spell Property unrelenting3 auto ;Unrelenting to put out fire

Spell Property iceBreath1 auto ;Ice breath to put out fire
Spell Property iceBreath2 auto ;Ice breath to put out fire
Spell Property iceBreath3 auto ;Ice breath to put out fire

GlobalVariable Property shoutType auto ;What if the bridge is on fire or some shit

ObjectReference Property iceMarker auto
ObjectReference Property fireMarker auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	if(shoutType.getValue() == 1) ;Fire
		if(akSpell == clearSkies1 || akSpell == clearSkies2 || akSpell == clearSkies3 || akSpell == unrelenting1  || akSpell == unrelenting2  || akSpell == unrelenting3 || akSpell == iceBreath1 || akSpell == iceBreath2 || akSpell == iceBreath3)
			fireMarker.DisableNoWait(true)
		endif
	elseif(shoutType.getValue() == 2) ; Ice
		if(akSpell == fireBreath1 || akSpell == fireBreath2 || akSpell == fireBreath3 || akSpell == flames)
			iceMarker.DisableNoWait(true)
		endif
	endif
EndEvent