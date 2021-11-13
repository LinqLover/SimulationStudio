instruction decoding
pushLiteralVariable: value

	^ simulator context: self pushLiteralVariable: value do: [:theValue | super pushLiteralVariable: theValue]