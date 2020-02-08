classdef Graph < handle & matlab.mixin.Copyable
    properties (GetAccess=public, SetAccess=protected)
        A   % adjacency matrix
    end
    properties (Access=protected)
        mdict  % dictionary with calculated measures
    end
    methods (Access=protected)
        function g = Graph(A, varargin)
            g.A = A;
            g.mdict = containers.Map;
        end
    end
    methods
        function A = getA(g)
            A = g.A;
        end
        function graph_code = getGraphCode(g)
            % measure code (same as the measure object name)
                        
            graph_code = class(g);
        end        
        function m = getMeasure(g, measure_code, varargin)
            
            if isKey(g.mdict, measure_code)
                m = g.mdict(measure_code);
            else
                m = Measure.getMeasure(measure_code, g, varargin{:});
                g.mdict(measure_code) = m;
            end 
        end
    end
    methods (Static)
        function list = compatible_measure_list(g)
            % list of measures which work with graph
            
            if isa(g, 'Graph')
                graph_code = g.getGraphCode();
            else % g should be a string with the graph code
                graph_code = g;
            end
            
            measure_list = subclasses('Measure');
            
            list = {};
            for i = 1:1:length(measure_list)
                measure = measure_list{i};
                
                if are_compatible(measure, graph_code)
                    list{end+1} = measure;
                end
            end
        end
    end
    methods (Static, Abstract)
        getName()  % graph name
        getDescription()  % graph description
        is_weighted()  % whether is weighted graph
        is_binary()  % whether is binary graph
        is_directed()  % whether is directed graph
        is_undirected()  % whether is undirected graph
        is_selfconnected()  % whether is self-connected
        is_nonnegative()  % whether is non-negative graph
    end
end