instruction decoding
pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize

	^ simulator context: self pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize do: [:theNumCopied :theNumArgs :theBlockSize | super pushClosureCopyNumCopiedValues: theNumCopied numArgs: theNumArgs blockSize: theBlockSize]