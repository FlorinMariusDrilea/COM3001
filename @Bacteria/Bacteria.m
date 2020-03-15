% Class that represents bacteria producing nitrate

classdef Bacteria
    
    properties
        % Parameters
        bacteriaParams
    end
    
    methods
        % Constructor
        function this = Bacteria(bacteriaParams)
            this.bacteriaParams = bacteriaParams;
        end
        
        % Convert levels and return them
        function tank = convert(this, tank)
            % If concentration of nitrate is too high -> cannot convert
            if (tank.nitrateConc() < this.bacteriaParams.maxNitrateConc)
                
                % Ammonia is never negative
                if (tank.ammonia - this.bacteriaParams.convertRate < 0)
                    convertedAmmonia = tank.ammonia;
                    tank.ammonia = 0;
                else                
                    convertedAmmonia = this.bacteriaParams.convertRate; 
                    tank.ammonia = tank.ammonia - this.bacteriaParams.convertRate;
                end

                % Nitrate increases by ammount that was convertet above
                tank.nitrate = tank.nitrate + convertedAmmonia;
            end
        end
    end
    
end