pragmatic methods - TalkInbox
doTalkInbox: aTalkInbox perform: selector
	<pragmaticClass: #TalkInbox selectors: #(conversations contributions messages mostRecentConversations)>

	self assertUnmodifiedObject: aTalkInbox.
	self flag: #imprecise. "only works correctly if talk messages, mail objects, and sqh wrappers are unchanged"
	
	^ aTalkInbox perform: selector