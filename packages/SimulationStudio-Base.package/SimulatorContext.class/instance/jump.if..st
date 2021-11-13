instruction decoding
jump: distance if: condition

	^ simulator context: self jump: distance if: condition do: [:theDistance :theCondition | super jump: theDistance if: theCondition]