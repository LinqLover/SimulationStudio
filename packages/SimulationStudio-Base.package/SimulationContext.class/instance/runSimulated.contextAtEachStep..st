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
					{[#resume:through:] -> [ensure at: 1 "value"].
					[#resumeEvaluating:] ->
						[| resumeBlock |
						resumeBlock := ensure at: 1 "aBlock".
						self assert: resumeBlock outerContext selector == #resume:. "other sender #returnEvaluating: is only sent to signaler contexts"
						resumeBlock value]}
				otherwise: [(ensure "BlockClosure >> #ensure: or BlockClosure >> #ifCurtailed:" at: 3) "returnValue"]);
			jump].
	
	current := self customize: current.
	
	(anotherBlock numArgs = 0
		ifTrue: ["optimized" [resume]]
		ifFalse: ["stop execution on time, don't expose simulation details to caller"
			[(current sender == ensure and: [current willReturn]) or: 
				["Context >> #resume:"
				((self objectClass: current receiver) inheritsFrom: Context)
					and: [(current selector == #resume: or: [current selector == #resume:through:])
					and: [current size >= 2]
					and: [(current at: 2) == ensure]]]]	])
		whileFalse:
			[anotherBlock cull: current.
			current := current step].
	
	"Continue with the execution in the previous context."
	current := self decustomize: current.
	current jump.