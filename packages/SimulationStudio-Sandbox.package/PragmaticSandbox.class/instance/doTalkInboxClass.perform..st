pragmatic methods - TalkInbox
doTalkInboxClass: aTalkInboxClass perform: selector
	<pragmaticClass: #'TalkInbox class'>

	self assertUnmodifiedObject: aTalkInboxClass.
	self assertUnmodifiedObject: aTalkInboxClass methodDict.
	self flag: #imprecise.
	self assert: (aTalkInboxClass wellKnownInboxPragmas anySatisfy: [:pragma | pragma selector = selector]).
	
	^ aTalkInboxClass perform: selector