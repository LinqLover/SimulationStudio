accessing - toolbuilder
emptyContents

	^ 'This tool allows you to find all methods that convert a given set of inputs into an expected output. Enter inputs (receiver + arguments) and output in the text panes above and press {1} to start the search. For some help or inspiration, you can also press the example button.

Note: To speed up long searches, {2} from time to time after adding/changing/removing a lot of code in your image.' asText format:
	{"Character startOfHeader asString asText addAttribute: (KeyboardEvent new
		type: #keyStroke readFrom: '0 96 115 83' readStream;
		asMorph) asTextAnchor; yourself."
	'Cmd + S'.
	'rebuild the optional selector index' asText addAttribute: (PluggableTextAttribute evalBlock: [self rebuildSelectorIndex]); yourself}