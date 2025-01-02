pragmatic methods - TalkConversation
doTalkConversation: aTalkConversation perform: selector
	<pragmaticClass: #TalkConversation selectors: #(latestDate latestMessage messages)>

	self assertUnmodifiedObject: aTalkConversation.
	self flag: #imprecise. "only works correctly if talk messages, mail objects, and sqh wrappers are unchanged"
	
	^ aTalkConversation perform: selector