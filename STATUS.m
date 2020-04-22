% 'Status' class creating an enum, used for storing the state of a fish
% Possible options: died (0) , alive (1) or harvested (2)
classdef STATUS
    properties (Constant)
        DIED = 0
        ALIVE = 1
        HARVESTED = 2
    end
end