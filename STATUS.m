% 'Status' class creating an enum, used for storing the state of a fish
% Possible options: dead (0) , alive (1) or harvested (2)
classdef STATUS
    properties (Constant)
        DEAD = 0
        ALIVE = 1
        HARVESTED = 2
    end
end