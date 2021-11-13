instruction decoding implicit literals
sendSpecial: selector numArgs: numArgs

	^ simulator context: self sendSpecial: selector numArgs: numArgs do: [:theSelector :theNumArgs | super sendSpecial: theSelector numArgs: theNumArgs]