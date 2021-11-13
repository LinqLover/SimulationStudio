I am an execution engine for Smalltalk code that is fully customizable by subclasses. Internally, I maintan all stack frames as subinstances of the class BasicSimulatorContext. For performance reasons, the exact stack frame class is determined dynamically based on the capabilities that my instances overwrite. See #requiredCapabilities and the #capability: pragma.

I implement the Chain of Responsibility pattern, allowing clients to combine multiple simulators at their discretion. To chain multiple simulators, send #decorating: or #nextSimulator:. To not break the Chain of Responsibility, subclasses should usually send super when overriding any hook.

I also provide support for the debugger - send #debug: to watch the simulated code in a normal Squeak Debugger.