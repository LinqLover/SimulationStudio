instruction decoding
callPrimitive: primNumber

	^ simulator context: self callPrimitive: primNumber do: [:thePrimNumber | super callPrimitive: primNumber]