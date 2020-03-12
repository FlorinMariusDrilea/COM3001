% Each plant requests an amount of nitrate
function [val, this] = feedPlant(this, plant)
    % Firstly, assuming it takes one
    request = 1;

    % As explained above, each plan has one
    if (this.nitrate - request < 0)
        % Take the remaining amount
        val = this.nitrate;
        % No amount of nitrate left
        this.nitrate = 0;
    else
        this.nitrate = this.nitrate - request;
        % Take the requested value
        val = request;
    end
end