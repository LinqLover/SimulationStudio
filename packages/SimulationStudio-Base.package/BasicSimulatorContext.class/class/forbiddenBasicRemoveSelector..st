template - accessing method dictionary
forbiddenBasicRemoveSelector: selector
	"This message is sent to read-only context classes!"
	
	selector ifEmpty:
		["edge case for fallback in Object>>#withArgs:executeMethod:"
		^ super basicRemoveSelector: selector].
	
	^ NotImplemented signal: 'You shall not want to edit this uniclass itself. Instead, remove the undesired capability from your simulator and restart all running instances.'