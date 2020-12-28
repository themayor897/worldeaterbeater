Scriptname _AA_Stage3_BigShoutScript extends ObjectReference  

Spell Property spell1 auto ;Call Comet
Spell Property spell2 auto ;Fire bridge
Spell Property spell3 auto ;Ice bridge
Spell Property spell4 auto ;break bridge
Spell Property cometSpell auto ;Fire comet
GlobalVariable Property bridge auto
ObjectReference Property xMarker auto

ObjectReference Property island1 auto
ObjectReference Property island2 auto
ObjectReference Property island3 auto
ObjectReference Property island4 auto
ObjectReference Property island5 auto

ObjectReference Property island6 auto
ObjectReference Property island7 auto
ObjectReference Property island8 auto
ObjectReference Property island9 auto
ObjectReference Property island10 auto

ObjectReference Property island11 auto
ObjectReference Property island12 auto
ObjectReference Property island13 auto
ObjectReference Property island14 auto
ObjectReference Property island15 auto

Sound Property cometShout auto
Sound Property iceShout auto
Sound Property bridgeShout auto

Event OnSpellCast(Form akSpell)
	if(akSpell == spell1)
		cometSpell.cast(xMarker, Game.GetPlayer())
		cometShout.Play(Game.GetPlayer())
	elseif(akSpell == spell2)
 		 if(bridge.GetValue() == 1)
			island1.EnableNoWait(true)
  		elseif(bridge.GetValue() == 2)
			island2.EnableNoWait(true)
  		elseif(bridge.GetValue() == 3)
			island3.EnableNoWait(true)
  		elseif(bridge.GetValue() == 4)
			island4.EnableNoWait(true)
  		elseif(bridge.GetValue() == 5)
			island5.EnableNoWait(true)
		 endif
		cometShout.Play(Game.GetPlayer())
			island6.DisableNoWait(true)
			island7.DisableNoWait(true)
			island8.DisableNoWait(true)
			island9.DisableNoWait(true)
			island10.DisableNoWait(true)
	elseif(akSpell == spell3)
 		 if(bridge.GetValue() == 1)
			island6.EnableNoWait(true)
		  elseif(bridge.GetValue() == 2)
			island7.EnableNoWait(true)
  		 elseif(bridge.GetValue() == 3)
			island8.EnableNoWait(true)
		  elseif(bridge.GetValue() == 4)
			island9.EnableNoWait(true)
  		elseif(bridge.GetValue() == 5)
			island10.EnableNoWait(true)
		endif
		iceShout.Play(Game.GetPlayer())
			island1.DisableNoWait(true)
			island2.DisableNoWait(true)
			island3.DisableNoWait(true)
			island4.DisableNoWait(true)
			island5.DisableNoWait(true)
	elseif(akSpell == spell4)
		 if(bridge.GetValue() == 1)
			island11.DisableNoWait(true)
  		elseif(bridge.GetValue() == 2)
			island12.DisableNoWait(true)
 		 elseif(bridge.GetValue() == 3)
			island13.DisableNoWait(true)
  		elseif(bridge.GetValue() == 4)
			island14.DisableNoWait(true)
 		 elseif(bridge.GetValue() == 5)
			island15.DisableNoWait(true)
 		endif
		bridgeShout.Play(Game.GetPlayer())
	endif
	Game.ShakeCamera(Game.GetPlayer(), 1, 1)
EndEvent