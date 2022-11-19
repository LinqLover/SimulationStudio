I execute code a sandbox environment, aiming to isolate all side effects and keeping them apart from the rest of the image.

---
## VERSIONING NOTE

This class is a successor implementation of the old Sandbox which needed a special SandboxContext to operate. This class (Sandbox2) is a Simulator subclass instead and can be chained with different simulators on demand. However, this comes with a performance overhead of ~10 %, so make your choice ... The classical sandbox might be deprecated at some point in the future.
---

Public API can be found in the class-side protocols 'evaluating' and 'support'. Examples:
	Sandbox2 evaluate: [World extent: 0 @ 0; bounds].
	Sandbox2 debug: [World extent: 0 @ 0; bounds].
	Sandbox2 evaluate: [1 / 0].
	Sandbox2 evaluate: [1 / 0] ifFailed: [:ex | Transcript showln: ex description].

# Instance Variables (internal)

## objects

A PluggableWeakKeyDictionary that maps real objects to copies of them that have been modified by the simulated code. Entries where key and value are the same represent objects that are possessed by the simulated code.

## hashes

A WeakIdentityKeyDictionary that maps real objects to other real objects whose identity have been exchanged. See #elements:forwardIdentityTo:copyHash:.