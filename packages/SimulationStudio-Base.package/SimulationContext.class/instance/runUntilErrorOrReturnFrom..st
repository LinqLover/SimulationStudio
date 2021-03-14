controlling
runUntilErrorOrReturnFrom: homeContext
	"Overriden to enforce simulation."

	|  errorBlock guardError ensureBlock guardEnsure ctxt error |
	"Insert ensure and exception handler contexts under homeContext"
	guardError := homeContext insertSender: (self customize: (
		Context contextOn: UnhandledError do: (errorBlock := [:ex | ex resumeUnchecked: nil]))).
	guardEnsure := guardError insertSender: (self customize: (
		Context contextEnsure: (ensureBlock := []))).
	
	ctxt := self.
	error := nil.
	[:exit | [
		error ifNil: [
			ctxt closure
				caseOf: {
					[errorBlock] -> [
						error := (ctxt tempAt: 1) exception.
						exit value].
					[ensureBlock] -> [
						exit value] }
				otherwise: []].
		ctxt := ctxt step
	] repeat] valueWithExit.
	
	^ error
		ifNil: [
			"No error was raised, remove ensure context by stepping until popped"
			[guardEnsure isDead] whileFalse: [ctxt := ctxt stepToCallee].
			{ctxt. nil}]
		ifNotNil: [
			"Error was raised, remove inserted above contexts then return signaler context"
			homeContext terminateTo: guardEnsure sender. "remove above ensure and handler contexts"
			{ctxt. error}]