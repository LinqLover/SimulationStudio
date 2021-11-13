instruction decoding
blockReturnConstant: value

	^ simulator context: self blockReturnConstant: value do: [:theValue | super blockReturnConstant: theValue]