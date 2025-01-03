pragmatic methods - SystemNavigation
doSystemNavigation: aSystemNavigation perform: selector withArgs: arguments context: aContext
	<pragmaticClass: #SystemNavigation selectors: #(allImplementorsOf: allCallsOn:)>

	self assertUnmodifiedObject: aSystemNavigation.
	self assertUnmodifiedObject: aSystemNavigation environment.
	self assert: ((aContext objectClass: aSystemNavigation environment) includesBehavior: Environment).
	self assertUnmodifiedObject: (aSystemNavigation environment instVarNamed: 'declarations').
	self flag: #imprecise. "only works correctly if *no* class changes were made in the system"
	self assert: ((aContext objectClass: arguments first) includesBehavior: Symbol).
	self assertUnmodifiedObject: arguments first.
	
	^ aSystemNavigation perform: selector withArguments: arguments