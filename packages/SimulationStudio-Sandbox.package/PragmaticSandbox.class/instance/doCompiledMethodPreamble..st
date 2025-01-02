pragmatic methods - CompiledMethod
doCompiledMethodPreamble: aCompiledMethod
	<pragmaticClass: #CompiledMethod selector: #preamble>

	self assertUnmodifiedObject: aCompiledMethod.
	self assertUnmodifiedObject: aCompiledMethod trailer.
	
	^ aCompiledMethod preamble