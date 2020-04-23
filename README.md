# Aquaponics
Agent Based Model of Aquaponics in MATLAB

## Description of model

Our natural system will be focused on analysing how fish are influenced by the growth of plants from the environment, which are considered food supplies. The reproduction of the agents is also essential. 

For example, a crop cleans the water for fish. And the waste from the fish can be used to supply nutrients for a crop. Such a system is also called aquaponics. 

This is also a main research area in the Internet Of Things field. In order to keep it simple, we will only focus on one fish species and one for plants.

## List of agent types with important memory parameters

Fish: growth coefficient, excrete rate,  harvest size, cannibalism size, ammonia threshold, reproduction age;

Plant: growth coefficient, harvest size;

Bacteria: conversion rate


## Behaviours included 

Plants grow (depending on concentration of NO − 3), then harvest it and replace it.

Fish increase size and nutrition depending on consumption of food. If the population of fish is bigger, more ammonia is produced, causing individual fish to die.

Fish of varying sizes.

Reproduction of fish causes reduction of food supply, and that leads to cannibalism and starvation.

Bacteria created don’t allow plants to grow.

## Virtual experiment
Our virtual experiment is focused on determining the ratio between fish and plants so that we can find the most stable system.


## Simulation flow:

Create Agents
Iteration Loop
		tank.addFood()

		For all agents:
			agent.intake()
			agent.output()

		bacteria.convert()

		For all agents:
			agent.behaviour()
