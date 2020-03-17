classdef Panel < bulk.BulkData
    %Panel Describes a 2D or 3D element connected to an arbitrary number of
    %Nodes.
    %
    % The definition of the 'Panel' object matches that of the CQUAD4 bulk
    % data type from MSC.Nastran.
    %
    % Valid Bulk Data Types:
    %   - 'CPENTA'  -> TODO
    %   - 'CQUAD'   -> TODO
    %   - 'CQUAD4'  -> TODO
    %   - 'CQUAD8'  -> TODO
    %   - 'CQUADR'  -> TODO
    %   - 'CQUADX'  -> TODO
    %   - 'CRAC2D'  -> TODO
    %   - 'CRAC3D'  -> TODO
    %   - 'CTETRA'  -> TODO
    %   - 'CTRIA3'  -> TODO
    %   - 'CTRIA6'  -> TODO
    %   - 'CTRIAR'  -> TODO
    %   - 'CTRIAX'  -> TODO
    %   - 'CTRIAX6' -> TODO
    
    methods % construction
        function obj = Panel(varargin)
            
            %Initialise the bulk data sets
            addBulkDataSet(obj, 'CQUAD4', ...
                'BulkProps'  , {'EID', 'PID', 'G', 'THETA', 'ZOFFS'     , 'TFLAG', 'T'}, ...
                'PropTypes'  , {'i'  , 'i'  , 'i', 'r'    , 'r'    , 'b', 'i'    , 'r'}, ...
                'PropDefault', {''   , ''   , '' , ''     , ''          , 0      , 0  }, ...
                'PropMask'   , {'G', 4, 'T', 4}, ...
                'Connections', {'G', 'bulk.Node', 'Nodes', 'PID', 'bulk.PanelProp', 'Prop'}     , ...
                'AttrList'   , {'G', {'nrows', 4}, 'T', {'nrows', 4}});
            addBulkDataSet(obj, 'CTRIA3', ...
                'BulkProps'  , {'EID', 'PID', 'G', 'THETA', 'ZOFFS'     , 'TFLAG', 'T'}, ...
                'PropTypes'  , {'i'  , 'i'  , 'i', 'r'    , 'r'    , 'b', 'i'    , 'r'}, ...
                'PropDefault', {''   , ''   , '' , ''     , ''          , 0      , 0  }, ...
                'PropMask'   , {'G', 3, 'T', 3}, ...
                'Connections', {'G', 'bulk.Node', 'Nodes', 'PID', 'bulk.PanelProp', 'Prop'}     , ...
                'AttrList'   , {'G', {'nrows', 3}, 'T', {'nrows', 3}});
            
            varargin = parse(obj, varargin{:});
            preallocate(obj);
            
        end
    end
    
    methods % visualisation
        function hg = drawElement(obj, hAx)
            %drawElement Draws the panel objects as a patch object between
            %the nodes and returns a single handle for all the patches in
            %the collection.
            
            index  = obj.NodesIndex;
            coords = arrayfun(@(ii) obj.Nodes.X(:, index(ii, :)), 1 : size(index, 1), 'Unif', false);
            coords = permute(cat(3, coords{:}), [3, 2, 1]);
            
            hg = patch(hAx, ...
                'XData'    , coords(:, :, 1), ...
                'YData'    , coords(:, :, 2), ...
                'ZData'    , coords(:, :, 3), ...
                'FaceColor', 'none', ...
                'EdgeColor', 'k'   , ...
                'Tag'      , 'Panel Elements');
            
        end
    end
    
end

