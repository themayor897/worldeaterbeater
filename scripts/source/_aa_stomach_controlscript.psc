Scriptname _AA_Stomach_ControlScript extends ObjectReference  

ObjectReference Property alduinHurtBit1 auto
ObjectReference Property alduinHurtBit2 auto
ObjectReference Property alduinHurtBit3 auto
ObjectReference Property alduinHurtBit4 auto
int random

Event OnLoad()
	RegisterForSingleUpdate(40)
EndEvent

Event OnUpdate()
	random = Utility.RandomInt(0, 3)
	if(random == 0)
		alduinHurtBit1.EnableNoWait(true); 
		alduinHurtBit2.DisableNoWait(true);
		alduinHurtBit3.DisableNoWait(true);
		alduinHurtBit4.DisableNoWait(true);

	elseif(random == 1)
		alduinHurtBit2.EnableNoWait(true); 
		alduinHurtBit1.DisableNoWait(true);
		alduinHurtBit3.DisableNoWait(true);
		alduinHurtBit4.DisableNoWait(true);

	elseif(random == 2)
		alduinHurtBit3.EnableNoWait(true); 
		alduinHurtBit2.DisableNoWait(true);
		alduinHurtBit1.DisableNoWait(true);
		alduinHurtBit4.DisableNoWait(true);

	elseif(random == 3)
		alduinHurtBit4.EnableNoWait(true); 
		alduinHurtBit2.DisableNoWait(true);
		alduinHurtBit3.DisableNoWait(true);
		alduinHurtBit1.DisableNoWait(true);

	endif
	RegisterForSingleUpdate(40)
	Game.ShakeCamera(Game.GetPlayer(), 1, 3)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent