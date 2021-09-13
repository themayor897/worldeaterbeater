Scriptname web_fxSkuldafnPortal extends ObjectReference 
{This script controls the fx and sequences for the portal to sovnegard}

;Stormy weather for when portal is open
;Weather property WeatherForm auto
;local ref name for light to go with fx
ObjectReference Property myLight auto 
ObjectReference Property QSTSovengardePortalOpenRef auto 
ObjectReference Property QSTSovengardePortalOn2DLPMREF auto 
ObjectReference Property QSTSovengardePortalFarLPMREF auto 
ObjectReference Property QSTSovengardePortalOnMonoLPMREF auto 
Sound Property QSTSovengardePortalCloseSDREF auto
int soundInstance01

bool property isOpen = true auto conditional
{set to true to start open}


Event OnLoad()
    OpenPortal(NONE, isOpen, true)
endEvent

auto STATE waiting  ; waiting to be activated
    EVENT onActivate (objectReference triggerRef)
        ; switch open state when activated
        OpenPortal(triggerRef, !isOpen)
    endEVENT
endState

state busy
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    if asEventName == "Done" 
        UnRegisterForAnimationEvent(akSource, "Done")
        ClosePortal()
    endif
endEvent

endState


function OpenPortal(ObjectReference triggerRef, bool abOpen = true, bool abQuickOpen = false)
    ; if busy, wait to finish
    while getState() == "busy"
;       debug.trace(self + "OpenPortal- BUSY - wait 1 second")
        utility.wait(1)
    endWhile    

    gotoState("busy")
    if abOpen && (!isOpen || abQuickOpen)
        ;debug.trace(self + " opening portal...")
        ;Play opening sounds
        QSTSovengardePortalOpenRef.enable()
        utility.wait(1)
        QSTSovengardePortalOn2DLPMREF.enable()
        QSTSovengardePortalFarLPMREF.enable()
        QSTSovengardePortalOnMonoLPMREF.enable()
        ; set portal to be open
        self.PlayAnimation("PlayAnim02")

        ;turnLight for fx on
        myLight.enable()
        ;start stormy weather
;       WeatherForm.SetActive(true)
        isOpen = true
;       debug.trace(self + " opening portal DONE")
        goToState("waiting")
    elseif !abOpen && isOpen
;       debug.trace(self + " closing portal...")
    elseif !abOpen && !isOpen &&  abQuickOpen
;       debug.trace(self + " activated by onLoad while closed...")
        goToState("Waiting")
    endif

endFunction

function ClosePortal()
    ;Stop opening sounds
    QSTSovengardePortalOpenRef.disable()
    QSTSovengardePortalOn2DLPMREF.disable()
    QSTSovengardePortalFarLPMREF.disable()
    QSTSovengardePortalOnMonoLPMREF.disable()
    self.PlayAnimation("PlayAnim01")
    ;turnLight for fx on
    myLight.disable()
    utility.wait(3.3)
    ;cancel the stormy weather
;   weather.ReleaseOverride()
    isOpen = false
;   debug.trace(self + " closing portal DONE")
    goToState("waiting")
endFunction


Weapon Property MQ303DragonPriestStaff  Auto  
