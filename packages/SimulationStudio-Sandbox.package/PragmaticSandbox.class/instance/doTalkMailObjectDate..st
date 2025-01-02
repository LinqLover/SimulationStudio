pragmatic methods - TalkMailObject
doTalkMailObjectDate: aMailObject
	<pragmaticClass: #TalkMailObject selector: #date>

	self assertUnmodifiedObject: aMailObject.
	self flag: #imprecise.
	
	^ aMailObject date