toolbuilder
buildInputsPaneWith: builder

	^ builder pluggablePanelSpec new
		children:
			(OrderedCollection new
				add:
					(builder pluggableCodePaneSpec new
						frame:
							(LayoutFrame fullFrame
								bottomOffset: self buttonHeight negated;
								yourself);
						name: #inputsText;
						model: self;
						help: self inputsPaneHelp;
						getText: #inputsText;
						setText: #inputsText:requestor:;
						yourself);
				add:
					(builder pluggablePanelSpec new
						frame:
							(LayoutFrame fullFrame
								topFraction: 1;
								topOffset: self buttonHeight negated;
								yourself);
						layout: #horizontal;
						children:
							(OrderedCollection new
								add:
									(builder pluggableButtonSpec new
										model: self;
										label: 'pin receiver';
										help: 'Search methods that are defined on the first entered item only. If disabled, methods will be tested with all entered items as receiver.';
										state: #hasPinnedReceiver;
										action: #togglePinnedReceiver;
										yourself);
								add:
									(builder pluggableButtonSpec new
										model: self;
										label: 'pin arguments';
										help: 'Honor the order of entered arguments. If disabled, methods will be tested with all permutations of the arguments.';
										state: #hasPinnedArguments;
										action: #togglePinnedArguments;
										yourself);
								add:
									(builder pluggableButtonSpec new
										style: #menuButton;
										model: self;
										help: 'only find methods below (excluding) a certain class';
										label: #outerSuperclassLabel;
										state: #hasOuterSuperclass;
										action: #setOuterSuperclass;
										yourself);
								add:
									(builder pluggableButtonSpec new
										model: self;
										label: 'recursive';
										help: 'also find composite message expressions (slower)';
										state: #isCompositeSearch;
										action: #toggleCompositeSearch;
										yourself);
								add:
									(builder pluggableActionButtonSpec new
										model: self;
										label: 'example';
										help: 'Too complex UI? Click here to fill in some example config to understand it in action! (hold shift to see all examples)';
										action: #displayExample;
										yourself);
								yourself);
						yourself);
				yourself);
		yourself