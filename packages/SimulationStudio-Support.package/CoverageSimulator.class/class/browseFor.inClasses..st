support
browseFor: aBlock inClasses: classes
	"
	CoverageSimulator browseFor: [MonthTest suite debug] inClasses: {Month}.
	CoverageSimulator browseFor: [MonthTest suite debug] inClasses: {Month. DateAndTime}.
	"

	| cov methods references |
	cov := self new.
	cov evaluate: aBlock.
	
	methods := classes gather: [:class | class methodDict , class theMetaClass methodDict].
	references := (methods collect: #asCodeReference)
		sorted.
	references do: [:reference |
		reference stringVersion:
			('{1} ({2}%)' format:
				{reference stringVersion.
				((cov coverageOf: reference compiledMethod) * 100) printShowingMaxDecimalPlaces: 2})].
	^ MessageSetForCoverage openFor: cov messageList: references name:
		('Coverage ({1}%)' format:
			{((cov overallCoverageOf: methods) * 100) printShowingMaxDecimalPlaces: 2})