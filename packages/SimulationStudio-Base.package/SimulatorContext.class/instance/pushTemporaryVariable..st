instruction decoding
pushTemporaryVariable: offset

	^ simulator context: self pushTemporaryVariable: offset do: [:theOffset | super pushTemporaryVariable: theOffset]