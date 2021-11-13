instruction decoding implicit literals
pushSpecialConstant: value

	^ simulator context: self pushSpecialConstant: value do: [:theValue | super pushSpecialConstant: theValue]