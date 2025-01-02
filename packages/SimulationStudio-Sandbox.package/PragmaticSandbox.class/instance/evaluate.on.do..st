sandbox
evaluate: aBlock on: exceptionHandler do: exceptionBlock
	"Evaluate aBlock in the receiver, isolating it from the rest of the image. If aBlock signals an exception that can handled by the exceptionHandler, evaluate exceptionBlock with it. NOTE: Unhandled errors raised by aBlock will bubble up along the sender stack, but still, all handling is simulated in the sandbox until the exception will have been resumed. Depending on the configuration of the sandbox and your image, this can mean that even the pop-up of the eventual debugger will be simulated and thus invisible to you! Thus make sure to pass all relevant exceptions with this message.
	
	Example:
		PragmaticSandbox evaluate: [1 / 0] on: ZeroDivide do: [:ex | Transcript showln: ex description].
		
		""Use with CAUTION and check your image via the ProcessBrowser afterwards""
		PragmaticSandbox evaluate: [self halt] on: ZeroDivide do: [:ex | Transcript showln: ex description].
	"

	| result exception |
	self basicEvaluate: [[result := aBlock value]
		on: exceptionHandler
		do: [:ex | exception := ex]].
	
	(self basicEvaluate: [exception]) ifNotNil: [:ex | ^ exceptionBlock cull: ex].
	
	^ self readableObjectFor: (self basicEvaluate: [result])