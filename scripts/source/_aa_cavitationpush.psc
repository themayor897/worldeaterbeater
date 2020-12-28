Scriptname _AA_CavitationPush extends ActiveMagicEffect  

Event OnEffectStart(actor Target, actor Caster)
	if(Target != Game.GetPlayer())
		Caster.PushActorAway(Target, PushForce)
	endif
EndEvent

int Property PushForce  Auto  