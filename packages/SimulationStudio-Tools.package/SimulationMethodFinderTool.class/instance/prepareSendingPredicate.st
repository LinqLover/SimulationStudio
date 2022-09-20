private
prepareSendingPredicate
	"Evaluate the predicate for a pseudo message send, generating all bindings through #bindingOf:. Answer false iff the message send was not evaluated."

	finder predicate value:
		(MessageSend
			receiver: [^ true]
			selector: #value).
	^ false