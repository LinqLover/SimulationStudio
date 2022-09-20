accessing - constants
exampleSpecs

	^ #(('2. 3' '5')
	('2. 3' '8')
	('6. 7' '42' value nil nil Magnitude)
	('2. 4. 7' '4' value true false)
	('1. 10. 100' '111' value nil nil Integer true)
	('#(2 1 4 3)' '#(1 2 3 4)')
	('#(2 1 4 3). #asWords' '#(4 1 3 2)' value nil nil nil true)
	('#(7 2 9 8 4). 2' '#(8 9)' value nil nil nil true)
	('''carpe squeak''' '''Carpe squeak''')
	('''carpe squeak''' '#carpeSqueak')
	('''carpe squeak''' 'answer isSymbol' predicate nil nil nil nil)
	('10 @ 20 corner: 60 @ 40' 'answer isPoint' predicate nil nil nil nil)
	('10 @ 20 corner: 60 @ 40' 'answer isPoint and: [(10 @ 20 corner: 60 @ 40) containsPoint: answer]' predicate nil nil nil nil)
	('Sandbox. [2 + 3]' '5')
	('[self error: ''plonk'']. [:x | x]' '''Error: plonk''')
	('#(1 2 3 4). [:a :b | stream nextPut: {a. b}]'
'(Array streamContents: [:s |
	stream := s.
	messageSend value]) = #((1 2) (3 4))' sendingPredicate))