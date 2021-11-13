instruction decoding
jump: distance

	^ simulator context: self jump: distance do: [:theDistance | super jump: theDistance]