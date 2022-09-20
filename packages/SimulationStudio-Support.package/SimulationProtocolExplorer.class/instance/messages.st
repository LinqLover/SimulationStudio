accessing
messages

	^ messages ifNil: [messages :=
		self selectors collect: [:selector |
			self newMessageFor: selector]]