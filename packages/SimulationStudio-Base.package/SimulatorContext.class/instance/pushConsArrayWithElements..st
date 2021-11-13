instruction decoding
pushConsArrayWithElements: numElements

	^ simulator context: self pushConsArrayWithElements: numElements do: [:theNumElements | super pushConsArrayWithElements: theNumElements]