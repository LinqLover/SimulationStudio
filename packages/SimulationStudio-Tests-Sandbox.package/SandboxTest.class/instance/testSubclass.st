tests
testSubclass

	| name |
	self fail: #forLater. "Currently, simulation of subclassing will crash the VM. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-December/217860.html"
	
	name := #SandboxTestClass , UUID new asString asLegalSelector asCamelCase.
	
	self shouldnt: (Smalltalk hasClassNamed: name).
	
	self sandboxClass disableLoggingAndNotifyingDuringCompilation:
		[self sandboxClass evaluate: [ | class instance |
			class := Object
				subclass: name asSymbol
				instanceVariableNames: 'griffle plonk'
				classVariableNames: ''
				poolDictionaries: ''
				category: 'SimulationStudio-Tests-UserObjects'.
			instance := class new.
			
			self
				assert: (instance isKindOf: class);
				assert: (instance class == class);
				assert: (thisContext objectClass: instance) == class.
			
			class compile: 'foo ^ ' , self selector printString.
			
			self assert: self selector printString equals: instance foo]].
	
	self deny: (Smalltalk hasClassNamed: name).