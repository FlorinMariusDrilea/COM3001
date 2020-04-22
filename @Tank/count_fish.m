% Calculating the number of fish that are alive
function value = count_fish(this)
    % Trivaluely, starting with 0 fish
    value = 0;
    [~, n] = size(this.fish);
    
    % Iterating
    for i = 1:n
        % Using status to check if a fish is alive
        if (this.fish(i).status == STATUS.ALIVE)
            % If the condition is met, count the fish as alive
            value = value + 1;
        end
    end
end