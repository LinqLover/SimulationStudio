instruction decoding
methodReturnConstant: value

	^ simulator context: self methodReturnConstant: value do: [:theValue | super methodReturnConstant: theValue]