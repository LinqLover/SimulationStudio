accessing
messageColumns

	^ {#yourself. [:selector | self performCarefully: selector ifFailed: ['<error>']]} collect: [:columnBlock |
		self messages collect: [:message | columnBlock value: message]]