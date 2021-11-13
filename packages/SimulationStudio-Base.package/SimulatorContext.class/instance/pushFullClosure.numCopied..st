instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied

	^ simulator context: self pushFullClosure: aCompiledBlock numCopied: numCopied do: [:theCompiledBlock :theNumCopied | super pushFullClosure: theCompiledBlock numCopied: theNumCopied]