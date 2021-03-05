tests
testCustomize

	| context customized home |
	home := SimulationContext newFrom: thisContext.
	context := [6 * 7] asContextWithSender: home.
	
	customized := home customize: context.
	
	self assert: SimulationContext equals: customized class.
	self assert: context sender equals: customized sender.
	self assert: context closure equals: customized closure.