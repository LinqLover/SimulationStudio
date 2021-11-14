I am a simple simulator that limits the execution to a specified number of steps. If the limit is exceeded, I will raise an error.

Usage:

	LimitSimulator new
		stepLimit: 100;
		evaluate: [5 factorial].
	LimitSimulator new
		stepLimit: 100;
		evaluate: [10 factorial]