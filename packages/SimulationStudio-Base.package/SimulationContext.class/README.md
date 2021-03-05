I am a Context that is managed by the image for simulation purposes. Unlike my superclass, my (sub)instances cannot be executed by the VM. My responsibilities can be summarized as follows:

- patching: Since my superclass is strongly coupled to the VM executor in parts, some of its functionalities are broken whenever subclassing Context. I restore these functionalities by providing an alternative image-side implementation.
- converting: For the simulation of entire callstacks, I convert new frames that are created during the simulation to the class of my originating (sub)instances.
- inspection: Through the SimulationStudio plugin which is available during simulation, I provide extended inspection primitives to my (sub)instances.

While I have been designed with the concept of an abstract superclass in mind, I do not contain any abstract members but can be used by clients directly:

	SimulationContext runSimulated: [thisContext class]