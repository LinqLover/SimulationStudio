instruction decoding
storeIntoLiteralVariable: value

	^ simulator context: self storeIntoLiteralVariable: value do: [:theValue | super storeIntoLiteralVariable: theValue]