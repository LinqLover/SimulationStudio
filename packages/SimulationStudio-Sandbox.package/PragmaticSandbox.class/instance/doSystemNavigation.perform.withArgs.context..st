pragmatic methods - SystemNavigation
doSystemNavigation: aSystemNavigation perform: selector withArgs: arguments context: aContext
	<pragmaticClass: #SystemNavigation selectors: #(allImplementorsOf: allCallsOn:)>

	self assert: aSystemNavigation == SystemNavigation default.
	self assertUnmodifiedObject: aSystemNavigation.
	self flag: #imprecise. "only works correctly if *no* class changes were made in the system"
	self assert: ((aContext objectClass: arguments first) includesBehavior: Symbol).
	self assertUnmodifiedObject: arguments first.
	
	^ aSystemNavigation perform: selector withArguments: arguments