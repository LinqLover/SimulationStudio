template - accessing method dictionary
forbiddenBasicRemoveSelector: selector

	"This message is sent to read-only context classes!"
	^ NotImplemented signal: 'You shall not want to edit this uniclass itself. Instead, remove the undesired capability from your simulator and restart all running instances.'