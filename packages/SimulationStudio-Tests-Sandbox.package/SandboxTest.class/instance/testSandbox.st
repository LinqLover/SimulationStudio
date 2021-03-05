tests
testSandbox

	| obj sandbox |
	obj := OrderedCollection new.
	obj add: 1.
	self assert: [obj includes: 1].
	
	sandbox := Sandbox new.
	sandbox evaluate: [obj add: 2].
	
	self deny: [obj includes: 2].
	
	self assert: [
		sandbox evaluate: [obj includes: 2]].