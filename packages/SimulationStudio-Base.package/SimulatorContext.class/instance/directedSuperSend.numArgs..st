instruction decoding
directedSuperSend: selector numArgs: numArgs

	^ simulator context: self directedSuperSend: selector numArgs: numArgs do: [:theSelector :theNumArgs | super directedSuperSend: theSelector numArgs: theNumArgs]