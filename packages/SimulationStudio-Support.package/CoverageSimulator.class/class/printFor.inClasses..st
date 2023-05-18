support
printFor: aBlock inClasses: classes
	"
	CoverageSimulator printFor: [MonthTest suite debug] inClasses: {Month}.
	CoverageSimulator printFor: [MonthTest suite debug] inClasses: {Month. DateAndTime}.
	"

	| cov |
	cov := self new.
	cov evaluate: aBlock.
	
	((((classes gather: [:class | class methodDict , class theMetaClass methodDict]) sorted: #asCodeReference ascending)
		select: [:method | (cov coverageOf: method) ">">= 0]
		thenCollect: [:method |
			'"{1}%"\{2}' withCRs asText format:
				{((cov coverageOf: method) * 100) roundTo: 0.01.
				method methodClass asString asText allBold
					, ' >> '
					, (cov coveredSourceOf: method) makeSelectorBold}])
			fold: [:a :b | a , String cr , String cr , b]) edit.