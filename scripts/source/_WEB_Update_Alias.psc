Scriptname _WEB_Update_Alias extends ReferenceAlias  

_WEB_Update Property UpdateQuest Auto

Event OnPlayerLoadGame()
	UpdateQuest.CheckWEBVersion()
EndEvent 