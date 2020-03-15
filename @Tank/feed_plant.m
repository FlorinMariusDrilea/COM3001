% Allocate an amount of nitrate to each plant, as it asks for it
function [val, this] = feed_plant(this, ~)
    % TO-DO: Spread equally?
    request = 1;

    % for now, each plant simply gets one
    if (this.nitrate - request < 0)
        val = this.nitrate; % take what is left
        this.nitrate = 0; % nothing left now
    else
        this.nitrate = this.nitrate - request;
        val = request;
    end
end