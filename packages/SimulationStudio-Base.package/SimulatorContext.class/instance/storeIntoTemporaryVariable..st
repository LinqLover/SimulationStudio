instruction decoding
storeIntoTemporaryVariable: offset

	^ simulator context: self storeIntoTemporaryVariable: offset do: [:theOffset | super storeIntoTemporaryVariable: theOffset]