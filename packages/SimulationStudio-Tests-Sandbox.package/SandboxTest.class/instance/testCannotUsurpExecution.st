tests
testCannotUsurpExecution
	"Note down all hypothetical attack scenarios to the sandbox isolation here"

	self
		shouldNotChange: [thisContext simCustomizationLevel]
		after: [
			Sandbox evaluate: [(thisContext findContextSuchThat: [:ctx |
				ctx selector = #runSimulated:contextAtEachStep:]) privSender: nil]].