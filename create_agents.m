% Create arrays of agents with all specific params
% Creating every fish and plant that is inside the tank
function tank = create_agents(tank, tankParams, fishParams, plantParams)    

    tank.plants = Plant.empty(tankParams.maxPlants, 0);
    tank.fish = Fish.empty(tankParams.maxFish, 0);
    
    for i = 1:tankParams.plant.startCount
        tank.plants(i) = Plant(tank.newID(), plantParams);
    end
    
    for i = 1:tankParams.fish.startCount
        tank.fish(i) = Fish(tank.newID(), fishParams);
    end
end