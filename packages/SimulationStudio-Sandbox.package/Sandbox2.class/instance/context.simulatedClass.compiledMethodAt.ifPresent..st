private - object access
context: aContext simulatedClass: aClass compiledMethodAt: aSymbol ifPresent: aBlock

	| array index methodDict size start |
	methodDict := self readableObjectFor: aClass methodDict.
	array := self readableObjectFor: (thisContext object: methodDict instVarAt: 2 "array").
	index := start := aSymbol identityHash \\ (size := array size) + 1.
	
[
		| element |
		((element := thisContext object: methodDict basicAt: index) == nil or: [element == aSymbol])
			ifTrue: [ | compiledMethod |
				compiledMethod := thisContext object: array basicAt: index.
				^ nil == compiledMethod
					ifFalse: [aBlock value: compiledMethod]].
		(index := index \\ size + 1) = start ] whileFalse.
	
	self errorNoFreeSpace.