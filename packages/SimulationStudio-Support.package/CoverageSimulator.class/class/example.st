as yet unclassified
example

	(CoverageSimulator new
		evaluate:
			[2 / 3.
			"[2 / 0] on: Error do: [:ex | ex resume: nil]."
			2 / 3.5];
		coveredSymbolicOf: SmallInteger >> #/) edit.