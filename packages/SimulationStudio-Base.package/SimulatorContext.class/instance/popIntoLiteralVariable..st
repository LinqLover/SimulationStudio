instruction decoding
popIntoLiteralVariable: value

	^ simulator context: self popIntoLiteralVariable: value do: [:theValue | super popIntoLiteralVariable: theValue]