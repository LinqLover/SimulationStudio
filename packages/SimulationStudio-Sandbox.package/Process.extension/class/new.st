*SimulationStudio-Sandbox-instance creation-override
new
	"Keep track of the processes being created and alive to avoid the need for #allSubInstances in tools such as the ProcessBrowser."

	| newProcess |
	thisContext isSandboxContext ifTrue:
		[^ self sandboxedNew].
	newProcess := super new.
	AllProcessesLock critical: [AllProcesses add: newProcess].
	^ newProcess
	

"	[ [] newProcess terminate ] bench.

AFTER:  '140,000 per second. 7.13 microseconds per run. 35.02 % GC time.' 
BEFORE:  '224,000 per second. 4.47 microseconds per run. 4.38 % GC time.' 

	[aProcessBrowser updateProcessList] bench. -- allow quick updates

AFTER:  '4,410 per second. 227 microseconds per run. 77.34453 % GC time.' 
BEFORE: '118 per second. 8.47 milliseconds per run. 2.59792 % GC time.' 

"