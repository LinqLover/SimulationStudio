toolbuilder
acceptDroppingMorph: dropee event: evt inMorph: targetMorph 
	"Return the dropee to its old position, and add a reference to it at the cursor point."
	
	| bindingName externalName reference |
	(dropee isKindOf: TransferMorph)
		ifTrue: [
			reference := dropee passenger.
			externalName := dropee passenger className]
		ifFalse: [
			reference := dropee.
			externalName := dropee externalName].
	externalName := externalName isOctetString
		ifTrue: [externalName]
		ifFalse: ['a' , externalName].
	
	bindingName := Project uiManager
		request: 'Please enter a name for the dropped object:' translated
		initialAnswer: (externalName withFirstCharacterDownshifted , reference identityHash printString) asLegalSelector.
	bindingName isEmptyOrNil ifTrue: [^ false].
	bindingName := Parser new parseSelector: bindingName.
	bindingName ifNil: [
		self inform: 'Invalid selector.' translated.
		^ false].
	
	externalBindings at: bindingName put: reference.
	bindings addAll: externalBindings.
	
	targetMorph correctSelectionWithString: bindingName , ' '.
	(dropee isKindOf: TransferMorph)
		ifFalse: [dropee rejectDropMorphEvent: evt].
	^ true