% Allocate an amount of nitrate to each plant, as it asks for it
function [value, this] = feed_plant(this, ~)
    % TO-DO: Spread equally?
    req = 1;

    % for now, each plant simply gets one
    if (this.nitrate - req < 0)
        value = this.nitrate; % take what is left
        this.nitrate = 0; % nothing left now
    else
        this.nitrate = this.nitrate - req;
        value = req;
    end
end