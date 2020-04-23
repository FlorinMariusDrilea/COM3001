# aquaponics
Agent Based Model of Aquaponics for COM3001

## Simulation Flow:

Create Agents
Iteration Loop
		tank.addFood()

		For all agents:
			agent.consumption()
			agent.outcome()

		bacteria.convert()

		For all agents:
			agent.behaviour()