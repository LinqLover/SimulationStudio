system simulation
runSimulated: aBlock contextAtEachStep: anotherBlock
	"Copied from super. Details: Use #customize: before starting the simulation and convert back to simple context at the end."

	| home current resume ensure |
	self flag: #moveUpstream. "But what?"
	
	home := thisContext home sender.
	resume := false.
	"Affect the context stack of the receiver during the simulation of aBlock."
	current := aBlock asContext.
	current privSender: home.
	"Insert outer context denoting the end of the simulation."
	ensure := (ensure := current) insertEnsure:
		[resume := true.
		self flag: #todo. "terminate some contexts from previous sender here?"
		ensure := thisContext sender.
		home
			push: (ensure selector
				caseOf:
					{"[#resume:through:] -> [ensure at: 1 ""value""]." "goold old eem 4/25/2012 10:48, no longer in use"
					[#resumeEvaluating:] ->
						[| resumeBlock |
						resumeBlock := ensure at: 1 "aBlock".
						self assert: resumeBlock outerContext selector == #resume:. "other sender #returnEvaluating: is only sent to signaler contexts"
						resumeBlock value]}
				otherwise: [:selector |
					| outer |
					(selector == #ensure: and: [(outer := (ensure at: 1) outerContext) method == (Context >> #runUntilReturnFrom:)])
						ifTrue: [(outer sender sender at: 1) at: 1]
						ifFalse: [(ensure "BlockClosure >> #ensure: or BlockClosure >> #ifCurtailed:" at: 3) "returnValue"]]);
			jump].
	
	current := self customize: current.
	
	((home canSimulateYourself and: [anotherBlock numArgs = 0])
		ifTrue: ["optimized" [resume]]
		ifFalse: ["stop execution on time, don't expose simulation details to caller"
			| methodResume methodResumeThrough |
			"remember the original compiledMethod to prevent the simulated code from stealing the stack by modifying Context methods"
			methodResume := Context >> #resume:.
			methodResumeThrough := Context >> #resume:through:.
			[(current sender == ensure and: [current willReturn]) or: 
				["Context >> #resume:"
				(self objectClass: current receiver) simIsContextClass
					and: [(current method == methodResume or: [current method == methodResumeThrough])
					and: [current size >= 2]
					and: [(current at: 2) == ensure]]]]	])
		whileFalse:
			[anotherBlock cull: current.
			current := current step].
	
	"Continue with the execution in the previous context."
	current := self decustomize: current.
	current jump.