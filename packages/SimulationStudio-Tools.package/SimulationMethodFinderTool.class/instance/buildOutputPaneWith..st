toolbuilder
buildOutputPaneWith: builder

	^ builder pluggablePanelSpec new
		children:
			(OrderedCollection new
				add:
					(builder pluggableCodePaneSpec new
						frame:
							(LayoutFrame fullFrame
								bottomOffset: self buttonHeight negated;
								yourself);
						name: #outputText;
						model: self;
						help: #outputPaneHelp;
						getText: #outputText;
						setText: #outputText:requestor:;
						yourself);
				add:
					(builder pluggablePanelSpec new
						frame:
							(LayoutFrame fullFrame
								topFraction: 1;
								topOffset: self buttonHeight negated;
								yourself);
						layout: #horizontal;
						spacing: -1 px;
						children:
							(OrderedCollection new
								add:
									(builder pluggableRadioButtonSpec new
										model: self;
										label: 'value';
										help: 'specify an expression that will be matched against the answer of each method';
										state: #isOutputValue;
										action: #setOutputValue;
										yourself);
								add:
									(builder pluggableRadioButtonSpec new
										model: self;
										label: 'predicate';
										help: 'specify a boolean expression that will be evaluated for the answer of each tested method';
										state: #isOutputPredicate;
										action: #setOutputPredicate;
										yourself);
								add:
									(builder pluggableRadioButtonSpec new
										model: self;
										label: 'send';
										help: 'specify an expression that will be evaluated for each messageSend and sets up a context, evaluates the messageSend, and answers a boolean';
										state: #isOutputSendingPredicate;
										action: #setOutputSendingPredicate;
										yourself);
								yourself);
						yourself);
				yourself);
		yourself