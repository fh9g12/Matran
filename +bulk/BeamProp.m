classdef BeamProp < bulk.BulkData
    %BeamProp Describes the properties of a bulk.Beam object.
    %
    % The definition of the 'BeamProp' object matches that of the PBEAM
    % bulk data type from MSC.Nastran.
    %
    % Valid Bulk Data Types:
    %   - 'PBEAM' -> TODO
    %   - 'PBAR'
    %   - 'PROD'  -> TODO
        
    methods % constructor
        function obj = BeamProp(varargin)
            
            %Initialise the bulk data sets
            addBulkDataSet(obj, 'PBAR', ...
                'BulkProps'  , {'PID', 'MID', 'A', 'I1', 'I2', 'J', 'NSM', 'C', 'D', 'E', 'F', 'K', 'I12'}, ...
                'PropTypes'  , {'i'  , 'i'  , 'r', 'r' , 'r' , 'r', 'r'  , 'r', 'r', 'r', 'r', 'r', 'r'}  , ...
                'PropDefault', {''   , ''   , 0  , 0   , 0   , 0  , 0    , 0  , 0  , 0  , 0  , 0  , 0}    , ...
                'PropMask'   , {'C', 2, 'D', 2, 'E', 2, 'F', 2, 'K', 2}, ...
                'Connections', {'MID', 'bulk.Material', 'Materials'}, ...
                'AttrList'   , {'A', {'nonnegative'}, 'I1', {'nonnegative'}, 'I2', {'nonnegative'}, 'J', {'nonnegative'}, ...
                'C', {'nrows', 2}, 'NSM', {'nonnegative'}, 'D', {'nrows', 2}, 'E', {'nrows', 2}, 'F', {'nrows', 2}, ...
                'K', {'nrows', 2}, 'I12', {'nonnegative'}});
            
            varargin = parse(obj, varargin{:});
            preallocate(obj);
            
        end
    end
    
end

