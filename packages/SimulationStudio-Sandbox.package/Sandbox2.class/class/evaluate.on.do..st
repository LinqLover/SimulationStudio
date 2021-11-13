evaluating
evaluate: aBlock on: exceptionHandler do: exceptionBlock
	"Evaluate aBlock in a new sandbox instance and answer the result, isolating it from the rest of the image. If aBlock signals an exception that can handled by the exceptionHandler, evaluate exceptionBlock with it. NOTE: Unhandled errors raised by aBlock will bubble up along the sender stack, but still, all handling is simulated in the sandbox until the exception will have been resumed. Depending on the configuration of the sandbox and your image, this can mean that even the eventual pop-up of the debugger will be simulated and thus invisible to you! Thus make sure to pass all relevant exceptions with this message.
	
	Example:
		Sandbox2 evaluate: [1 / 0] on: ZeroDivide do: [:ex | Transcript showln: ex description].
		
		""Use with CAUTION and check your image via the ProcessBrowser afterwards""
		Sandbox evaluate: [self halt] on: ZeroDivide do: [:ex | Transcript showln: ex description].
	"

	^ self new
		evaluate: aBlock
		on: exceptionHandler
		do: exceptionBlock