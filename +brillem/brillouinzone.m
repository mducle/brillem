% brillem -- a MATLAB interface for brille
% Copyright 2020 Greg Tucker
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

function bz = brillouinzone(Reciprocal,varargin)
kdef = struct('extent',1);
[args,kwds]=brillem.parse_arguments(varargin,kdef);

reqInType = 'py.brille._brille.Reciprocal';
assert(isa(Reciprocal,reqInType), ['A single',reqInType,' lattice is required as input']);
if numel(args)>0 && isscalar(args{1})
    extent = int32(args{1});
else
    extent = int32(kwds.extent);
end

bz = py.brille.BrillouinZone( Reciprocal, extent);
end
