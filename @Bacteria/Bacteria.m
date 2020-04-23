% Class that represents bacteria producing nitrate

classdef Bacteria
    
    properties
        % Parameters
        bacteriaParameters
    end
    
    methods
        % Constructor
        function this = Bacteria(bacteriaParameters)
            this.bacteriaParameters = bacteriaParameters;
        end
        
        % Convert levels and return them
        function tank = convert(this, tank)
            % If concentration of nitrate is too high -> cannot convert
            if (tank.nitrateConcentration() < this.bacteriaParameters.maxNitrateConcentration)
                
                % Ammonia is never negative
                if (tank.ammonia - this.bacteriaParameters.convertRate < 0)
                    convertedAmmonia = tank.ammonia;
                    tank.ammonia = 0;
                else                
                    convertedAmmonia = this.bacteriaParameters.convertRate; 
                    tank.ammonia = tank.ammonia - this.bacteriaParameters.convertRate;
                end

                % Nitrate increases by ammount that was convertet above
                tank.nitrate = tank.nitrate + convertedAmmonia;
            end
        end
    end
    
end