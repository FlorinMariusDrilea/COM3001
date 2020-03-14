% Represent all as a graphic counting every iteration
function graphics(tank, harvestSize, ammoniaThreshold)
    % Visualize all scaling in time
    plantSizeMod = 5/harvestSize;
    fishSizeMod = 0.01;
    ammoniaColorMod = 1/ammoniaThreshold;

    % Get each item every time 
    if (tank.ammoniaConc() > ammoniaThreshold)
        color = 1;
    else
        color = tank.ammoniaConc()*ammoniaColorMod;
    end
    fish = tank.fish;
    plants = tank.plants;
    maxPlants = tank.tankParams.maxPlants;
    plantRange = 10 / maxPlants;
    
    f = findobj('Name','Graphics');
    figure(f)
    clf
    rectangle('Position',[1 1 10 5],...
        'FaceColor', [0, color, 0.6]);
    rectangle('Position',[1 7 10 1]);
    axis([0 12 0 14]);
    
    % Get plants and its proprieties
    for p=1:length(plants)
        if (plants(p).status == STATUS.ALIVE)
            size = plants(p).size;
            rectangle('Position',[1-plantRange+(p*plantRange), 8,...
                plantRange, size * plantSizeMod],...
                'FaceColor', 'r',...
                'EdgeColor', 'none');
        end
    end
    
    % Get tank and its proprieties
    for f=1:tank.fishFood
        rectangle('Position', [(rand()*10)+1, (rand()*5)+1,...
            0.1, 0.1],...
            'FaceColor', 'k',...
            'EdgeColor', 'none');
    end
    
    % Get fish and its proprieties
    for f=1:length(fish)
        if (fish(f).status == STATUS.ALIVE)
            rectangle('Position', [(rand()*10)+1, (rand()*5)+1,...
                fishSizeMod*fish(f).size, fishSizeMod*fish(f).size],...
                'FaceColor', 'c',...
                'EdgeColor', 'none');
        end
    end
end