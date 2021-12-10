Scriptname _AA_StomachHurtBit extends ObjectReference  

GlobalVariable Property alduinHealth auto
ObjectReference Property alduinHurtBit1 auto
ObjectReference Property alduinHurtBit2 auto
ObjectReference Property alduinHurtBit3 auto
Sound Property dragonMadSound auto
int random
bool doOnce = False
actor property playerRef auto
Quest property UtilityQ auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,bool abBashAttack, bool abHitBlocked)
    if(akAggressor == playerRef)
    if(doOnce == False)
    alduinHealth.Mod(1)
    ;Play a roar sound?
    doOnce = True
    if(alduinHealth.getValue() == 5)
		UtilityQ.SetStage(29)
    endif
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
    dragonMadSound.Play(playerRef)
    Utility.Wait(6)
    doOnce = False
    endif
    endif
EndEvent

