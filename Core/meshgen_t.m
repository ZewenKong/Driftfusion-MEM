function [t] = meshgen_t(par)
    % creates the output time mesh
    % Note- ODE15S uses an adaptive time step and then interpolates to the requested times
    %
    %% LICENSE
    % Copyright (C) 2020  Philip Calado, Ilario Gelmetti, and Piers R. F. Barnes
    % Imperial College London
    % This program is free software: you can redistribute it and/or modify
    % it under the terms of the GNU Affero General Public License as published
    % by the Free Software Foundation, either version 3 of the License, or
    % (at your option) any later version.
    %
    % - - - - - - - - - - CODE START - - - - - - - - - -

    switch par.tmesh_type
        case 'linear'
            t = linspace(0, par.tmax, par.tpoints);
        case 'log10'
            t = logspace(log10(par.t0), log10(par.tmax), par.tpoints);
            % to avoid rounding errors
            t(1) = 0;
            t(end) = par.tmax;

        case 'log10-double'
            % 2 log meshes consecutively
            t1 = logspace(log10(par.t0), log10(par.tmax / 2), round(par.tpoints / 2));
            t1(1) = 0;
            t1(end) = par.tmax / 2;
            t2 = t1(end) + logspace(log10(par.t0), log10(par.tmax / 2), round(par.tpoints / 2));
            t2(end) = par.tmax;
            t = [t1, t2];
    end

end
