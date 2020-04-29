classdef ComparisonfMRI < Comparison
    properties
        measure_code  % class of measure
        values_1  % array with the values of the measure for each subject of group 1
        average_value_1  % average value of group 1
        values_2  % array with the values of the measure for each subject of group 1
        average_value_2  % average value of group 1
        all_differences  % all differences obtained through the permutation test
        difference   % difference
        p_single  % p value single tailed
        p_double  % p value double tailed
        percentiles   % percentiles
    end
    methods
        function c =  ComparisonfMRI(id, atlas, groups, varargin)
            c = c@Comparison(id, atlas, groups, varargin{:});
        end
        function measure_code = getMeasureCode(c)
            measure_code = c.measure_code;
        end
        function difference = getDifference(c)
            difference = c.difference;
        end
        function all_differences = getAllDifferences(c)
            all_differences = c.all_differences;
        end
        function p_single = getPSingleTail(c)
            p_single = c.p_single;
        end
        function p_double = getPDoubleTail(c)
            p_double = c.p_double;
        end
        function percentile = getPercentiles(c)
            percentile = c.percentiles;
        end
        function values = getGroupValue(c, index) %#ok<*INUSL>
            values = eval(['c.values_' tostring(index)]);
        end
        function average_value = getAverageValue(c, index)
            average_value = eval(['c.average_value_' tostring(index)]);
        end
    end
    methods (Access=protected)
        function initialize_data(c, varargin)
            atlases = c.getBrainAtlases();
            atlas = atlases{1};
            groups =  c.getGroups();
            
            c.measure_code = get_from_varargin('',  'ComparisonfMRI.measure_code', varargin{:});
            
            c.difference = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                1, ...
                'ComparisonfMRI.difference_mean', ...
                varargin{:});
            c.all_differences =  get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                groups{1}.subjectnumber() + groups{2}.subjectnumber(), ...
                'ComparisonfMRI.difference_all', ...
                varargin{:});
            c.p_single = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                1,...
                'ComparisonfMRI.p_single', ...
                varargin{:});
            c.p_double = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                1, ...
                'ComparisonfMRI.p_double', ...
                varargin{:});
            c.percentiles = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                101, ...  % Q = 100 + 1
                'ComparisonfMRI.percentiles', ...
                varargin{:});
            
            % measure
            c.values_1 = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                atlas.getBrainRegions().length(), ...
                'ComparisonfMRI.value_group_1', ...
                varargin{:});
            c.average_value_1 = get_data_from_varargin(c.getMeasureCode(), ...
                1, ...
                atlas.getBrainRegions().length(), ...
                'ComparisonfMRI.mean_value_group_1', ...
                varargin{:});
            c.values_2 = get_data_from_varargin(c.getMeasureCode(), ...
                groups{1}.subjectnumber(), ...
                atlas.getBrainRegions().length(), ...
                'ComparisonfMRI.value_group_2', ...
                varargin{:});
            c.average_value_2 = get_data_from_varargin(c.getMeasureCode(), ...
                1, ...
                atlas.getBrainRegions().length(), ...
                'ComparisonfMRI.mean_value_group_2', ...
                varargin{:});
        end
    end
    methods (Static)
        function measurementClass = getClass(c) %#ok<*INUSD>
            measurementClass = 'ComparisonfMRI';
        end
        function name = getName(c)
            name = 'Comparison fMRI';
        end
        function description = getDescription(c)
            % measurement description missing
            description = '';
        end
        function atlas_number = getBrainAtlasNumber(c)
            atlas_number =  1;
        end
        function group_number = getGroupNumber(c)
            group_number = 2;
        end
        function sub = getComparison(comparisonClass, id, varargin)
            sub = eval([comparisonClass '(id, varargin{:})']);
        end
    end
end