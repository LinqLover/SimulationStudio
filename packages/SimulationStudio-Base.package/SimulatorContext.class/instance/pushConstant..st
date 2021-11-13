instruction decoding
pushConstant: value

	^ simulator context: self pushConstant: value do: [:theValue | super pushConstant: theValue]