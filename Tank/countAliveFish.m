% Calculating the number of fish that are alive
function val = countAliveFish(this)
    % Trivally, starting with 0 fish
    val = 0;
    [~, n] = size(this.fish);
    % Iterating
    for i = 1:n
        % Using status to check if a fish is alive
        if (this.fish(i).status == STATUS.ALIVE)
            % If the condition is met, count the fish as alive
            val = val + 1;
        end
    end
end