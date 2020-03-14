% Plot the graphs according to the results, interations etc.
function plot_graphs(iterations, i, part, results)
    f = findobj('Name','Graphs');
    figure(f)
    
    hold on
    
    subplot(2,1,1)
    xlim([0 iterations])
    % Activating the side of the current axes associated with the left y-axis
    yyaxis left
    plot(i-part:i, results.fishPopulation(i-part:i), '-r',...
        i-part:i, results.fishSize(i-part:i), '-k',...
        i-part:i, results.fishFood(i-part:i), '-m',...
        i-part:i, results.plantMass(i-part:i), '-g');
    % Activating the side of the current axes associated with the right y-axis
    yyaxis right
    plot(i-part:i, results.fishHarvested(i-part:i), '-b',...
        i-part:i, results.plantsHarvested(i-part:i), '-c');
    legend('Fish population', 'Fish size', 'Food', 'Plant mass', 'Fish harvested', 'Plant harvested', 'Location', 'EastOutside')
    subplot(2,1,2)  
    yyaxis left
    xlim([0 iterations])
    plot(i-part:i, results.ammoniaConcs(i-part:i), '-b',...
        i-part:i, results.nitrateConcs(i-part:i), '-r');
    % Setting the legend
    legend('Ammonia', 'Nitrate','Location', 'EastOutside')
end