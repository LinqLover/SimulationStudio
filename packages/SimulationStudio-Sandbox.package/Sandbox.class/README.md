I provide an isolated environment to a stack of SandboxContexts.

Public API can be found in the class-side protocls 'evaluating' and 'support'. Examples:
	Sandbox evaluate: [World extent: 0 @ 0; bounds].
	Sandbox debug: [World extent: 0 @ 0; bounds].
	Sandbox evaluate: [1 / 0].
	Sandbox evaluate: [1 / 0] ifFailed: [:ex | Transcript showln: ex description].

# Instance Variables (internal)

## objects

A WeakIdentityKeyDictionary that maps real objects to copies of them that have been modified by the simulated code. Entries where key and value are the same represent objects that are possessed by the simulated code.

## hashes

A WeakIdentityKeyDictionary that maps real objects to other real objects whose identity have been exchanged. See #elements:forwardIdentityTo:copyHash:.