% Create arrays of agents with all specific parameters
% Creating every fish and plant that is inside the tank
function tank = create_agents(tank, tankParameters, fishParameters, plantParameters)    

    tank.plants = Plant.empty(tankParameters.maxPlants, 0);
    tank.fish = Fish.empty(tankParameters.maxFish, 0);
    
    for i = 1:tankParameters.plant.startCounter
        tank.plants(i) = Plant(tank.newID(), plantParameters);
    end
    
    for i = 1:tankParameters.fish.startCounter
        tank.fish(i) = Fish(tank.newID(), fishParameters);
    end
end