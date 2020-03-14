# aquaponics
Agent Based Model of Aquaponics for COM3001

## Simulation Flow:

Create Agents
Iteration Loop
		tank.addFood()

		For all agents:
			agent.intake()
			agent.output()

		bacteria.convert()

		For all agents:
			agent.behaviour()