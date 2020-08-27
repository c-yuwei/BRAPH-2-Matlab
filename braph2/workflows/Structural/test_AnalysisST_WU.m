% test AnalysisST_WU

br1 = BrainRegion('BR1', 'brain region 1', 'notes 1', 1, 1.1, 1.11);
br2 = BrainRegion('BR2', 'brain region 2', 'notes 2', 2, 2.2, 2.22);
br3 = BrainRegion('BR3', 'brain region 3', 'notes 3', 3, 3.3, 3.33);
br4 = BrainRegion('BR4', 'brain region 4', 'notes 4', 4, 4.4, 4.44);
br5 = BrainRegion('BR5', 'brain region 5', 'notes 5', 5, 5.5, 5.55);
atlas = BrainAtlas('BA', 'brain atlas', 'notes', 'BrainMesh_ICBM152.nv', {br1, br2, br3, br4, br5});

% data obtain from http://braph.org/videos/mri/mri-cohort/  GR1_MRI.txt
% first 10 subjects, 5 brain regions. abs value
sub11 = SubjectST('ID11', 'label 11', 'notes 11', atlas, 'age', 15, 'ST', [0.009254 0.015379 0.042376 0.001630 0.008111]');
sub12 = SubjectST('ID12', 'label 12', 'notes 12', atlas, 'age', 15, 'ST', [0.015502 0.004323 0.013206 0.006639 0.001157]');
sub13 = SubjectST('ID13', 'label 13', 'notes 13', atlas, 'age', 15, 'ST', [0.008979 0.115102 0.045353 0.001312 0.004045]');
sub14 = SubjectST('ID14', 'label 14', 'notes 14', atlas, 'age', 15, 'ST', [0.016894 0.218212 0.028700 0.007709 0.004460]');

group1 = Group('SubjectST', 'group 1 id', 'group 1 label', 'group 1 notes', {sub11, sub12, sub13, sub14}, 'GroupName', 'GroupTestST1');

sub21 = SubjectST('ID21', 'label 21', 'notes 21', atlas, 'age', 15, 'ST', [0.014241 0.000357 0.010545 0.000858	0.005674]');
sub22 = SubjectST('ID22', 'label 22', 'notes 22', atlas, 'age', 15, 'ST', [0.026439 0.000055 0.020096 0.000803	0.000545]');
sub23 = SubjectST('ID23', 'label 23', 'notes 23', atlas, 'age', 15, 'ST', [0.011974 0.056372 0.010924 0.015115 0.012533]');

group2 = Group('SubjectST', 'group 2 id', 'group 2 label', 'group 2 notes', {sub21, sub22, sub23}, 'GroupName', 'GroupTestST2');

cohort = Cohort('Cohort ST WU', 'cohort label', 'cohort notes', 'SubjectST', atlas, {sub11, sub12, sub13, sub14, sub21, sub22, sub23});
cohort.getGroups().add(group1.getID(), group1)
cohort.getGroups().add(group2.getID(), group2)

graph_type = AnalysisST_WU.getGraphType();
measures = Graph.getCompatibleMeasureList(graph_type);

%% Test 1: Instantiation
analysis = AnalysisST_WU('analysis id', 'analysis label', 'analysis notes', cohort, {}, {}, {}); %#ok<NASGU>

%% Test 2: Create correct ID
analysis = AnalysisST_WU('analysis id', 'analysis label', 'analysis notes', cohort, {}, {}, {});

measurement_id = analysis.getMeasurementID('Degree', group1);
expected_value = [ ...
    tostring(analysis.getMeasurementClass()) ' ' ...
    tostring('Degree') ' ' ...
    tostring(analysis.getCohort().getGroups().getIndex(group1)) ...
    ];
assert(ischar(measurement_id), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getMeasurementID() not creating an ID')
assert(isequal(measurement_id, expected_value), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getMeasurementID() not creating correct ID')

randomcomparison_id = analysis.getRandomComparisonID('Degree', group1);
expected_value = [ ...
    tostring(analysis.getRandomComparisonClass()) ' ' ...
    tostring('Degree') ' ' ...
    tostring(analysis.getCohort().getGroups().getIndex(group1)) ...
    ];
assert(ischar(randomcomparison_id), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getRandomComparisonID() not creating an ID')
assert(isequal(randomcomparison_id, expected_value), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getRandomComparisonID() not creating correct ID')

comparison_id = analysis.getComparisonID('Distance', group1, group2);
expected_value = [ ...
    tostring(analysis.getComparisonClass()) ' ' ...
    tostring('Distance') ' ' ...
    tostring(analysis.getCohort().getGroups().getIndex(group1)) ' ' ...
    tostring(analysis.getCohort().getGroups().getIndex(group2)) ...
    ];
assert(ischar(comparison_id), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getComparisonID() not creating an ID')
assert(isequal(comparison_id, expected_value), ...
    [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
    'AnalysisST_WU.getComparisonID() not creating correct ID')

%% Test 3: Measurement
for i = 1:1:length(measures)
    measure = measures{i};
    analysis = AnalysisST_WU('analysis id', 'analysis label', 'analysis notes', cohort, {}, {}, {});
    calculated_measurement = analysis.getMeasurement(measure, group1);
    
    assert(~isempty(calculated_measurement), ...
        [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
        'AnalysisST_WU.getMeasurement() not working')
    
    measurement_keys = analysis.getMeasurements().getKeys();
    
    for j = 1:1:numel(measurement_keys)
        calculated_measurement = analysis.getMeasurements().getValue(measurement_keys{j});
        calculated_value = calculated_measurement.getMeasureValue();
        
        if Measure.is_global(measure)
            
            assert(isequal(calculated_measurement.getMeasureCode(), measure), ...
                [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
                'AnalysisST_WU.calculateMeasurement() not working for global')
            assert(iscell(calculated_value) && ...
                isequal(numel(calculated_value), 1) && ...
                all(cellfun(@(x) isequal(size(x, 1), 1), calculated_value)) &&...
                all(cellfun(@(x) isequal(size(x, 2), 1), calculated_value)), ...
                [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
                'AnalysisST_WU does not initialize correctly with global measures')
            
        elseif Measure.is_nodal(measure)
            
            assert(isequal(calculated_measurement.getMeasureCode(), measure), ...
                [BRAPH2.STR ':AnalysisST_WU:calculateMeasurement'], ...
                'AnalysisST_WU.calculateMeasurement() not working for nodal')
            assert(iscell(calculated_value) && ...
                isequal(numel(calculated_value), 1) && ...
                all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), calculated_value)) &&...
                all(cellfun(@(x) isequal(size(x, 2), 1), calculated_value)), ...
                [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
                'AnalysisST_WU does not initialize correctly with nodal measures')
        
        elseif Measure.is_binodal(measure)
            
            assert(isequal(calculated_measurement.getMeasureCode(), measure), ...
                [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
                'AnalysisST_WU.calculateMeasurement() not working for binodal')
            assert(iscell(calculated_value) && ...
                isequal(numel(calculated_value), 1) && ...
                all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), calculated_value)) &&...
                all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), calculated_value)), ...
                [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
                'AnalysisST_WU does not initialize correctly with binodal measures')
        end
    end
end
 
%% Test 4: Random Compare
for i = 1:1:numel(measures)
    measure = measures{i};
    analysis = AnalysisST_WU('analysis id', 'analysis label', 'analysis notes', cohort, {}, {}, {});

    number_of_randomizations = 10;
    calculated_comparison = analysis.getRandomComparison(measure, group1, 'RandomizationNumber', number_of_randomizations);

    assert(~isempty(calculated_comparison), ...
        [BRAPH2.STR ':AnalysisST_WU:calculateComparison'], ...
        ['AnalysisST_WU.calculateComparison() not working']) %#ok<*NBRAK>
    
    assert(analysis.getRandomComparisons().length() == 1, ...
        [BRAPH2.STR ':AnalysisST_WU:calculateComparison'], ...
        ['AnalysisST_WU.calculateComparison() not working'])
    
    randomcomparison = analysis.getRandomComparisons().getValue(1);
    randomcomparison_value_group = randomcomparison.getGroupValue();
    randomcomparison_value_random = randomcomparison.getRandomValue();
    randomcomparison_difference = randomcomparison.getDifference();
    randomcomparison_all_differences = randomcomparison.getAllDifferences();
    randomcomparison_p1 = randomcomparison.getP1();
    randomcomparison_p2 = randomcomparison.getP2();
    randomcomparison_confidence_interval_min = randomcomparison.getConfidenceIntervalMin();
    randomcomparison_confidence_interval_max = randomcomparison.getConfidenceIntervalMax();
    
    if Measure.is_global(measures{i})
        assert(iscell(randomcomparison_value_group) && ...
            isequal(numel(randomcomparison_value_group), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_value_group)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_value_group)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_value_random) && ...
            isequal(numel(randomcomparison_value_random), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_value_random)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_value_random)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 
        
        assert(iscell(randomcomparison_difference) && ...
            isequal(numel(randomcomparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_difference)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_all_differences) && ...
            isequal(numel(randomcomparison_all_differences), number_of_randomizations) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_all_differences)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_p1) && ...
            isequal(numel(randomcomparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_p1)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_p2) && ...
            isequal(numel(randomcomparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_p2)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_confidence_interval_min) && ...
            isequal(numel(randomcomparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_confidence_interval_min)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 

        assert(iscell(randomcomparison_confidence_interval_max) && ...
            isequal(numel(randomcomparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), randomcomparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_confidence_interval_max)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with global measures') 
        
    elseif Measure.is_nodal(measures{i})
        assert(iscell(randomcomparison_value_group) && ...
            isequal(numel(randomcomparison_value_group), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_value_group)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_value_group)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_value_random) && ...
            isequal(numel(randomcomparison_value_random), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_value_random)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_value_random)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 
        
        assert(iscell(randomcomparison_difference) && ...
            isequal(numel(randomcomparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_difference)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_all_differences) && ...
            isequal(numel(randomcomparison_all_differences), number_of_randomizations) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_all_differences)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_p1) && ...
            isequal(numel(randomcomparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_p1)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_p2) && ...
            isequal(numel(randomcomparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_p2)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_confidence_interval_min) && ...
            isequal(numel(randomcomparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_confidence_interval_min)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 

        assert(iscell(randomcomparison_confidence_interval_max) && ...
            isequal(numel(randomcomparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), randomcomparison_confidence_interval_max)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with nodal measures') 
        
    elseif Measure.is_binodal(measures{i})
        assert(iscell(randomcomparison_value_group) && ...
            isequal(numel(randomcomparison_value_group), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_value_group)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_value_group)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_value_random) && ...
            isequal(numel(randomcomparison_value_random), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_value_random)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_value_random)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 
        
        assert(iscell(randomcomparison_difference) && ...
            isequal(numel(randomcomparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_difference)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_all_differences) && ...
            isequal(numel(randomcomparison_all_differences), number_of_randomizations) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_all_differences)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_p1) && ...
            isequal(numel(randomcomparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_p1)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_p2) && ...
            isequal(numel(randomcomparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_p2)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_confidence_interval_min) && ...
            isequal(numel(randomcomparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_min)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 

        assert(iscell(randomcomparison_confidence_interval_max) && ...
            isequal(numel(randomcomparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), randomcomparison_confidence_interval_max)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getRandomComparison() not working with binodal measures') 
        
    end
end

%% Test 5: Compare
for i = 1:1:numel(measures)
    measure = measures{i};
    analysis = AnalysisST_WU('analysis id', 'analysis label', 'analysis notes', cohort, {}, {}, {});

    number_of_permutations = 10;
    if Measure.is_nonparametric(measure)
        calculated_comparison = analysis.getComparison(measure, group1, group2, 'PermutationNumber', number_of_permutations);
    else
        calculated_comparison = analysis.getComparison(measure, group1, group2, 'PermutationNumber', number_of_permutations, 'RichnessThreshold', 2);  % problem, fix all the parameters for permutations
    end
    assert(~isempty(calculated_comparison), ...
        [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
        'AnalysisST_WU.getComparison() not working')
    
    assert(analysis.getComparisons().length() == 1, ...
        [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.BUG_FUNC], ...
        'AnalysisST_WU.getComparison() not working')
    
    randomcomparison = analysis.getComparisons().getValue(1);
    comparison_values_1 = randomcomparison.getGroupValue(1);
    comparison_values_2 = randomcomparison.getGroupValue(2);
    comparison_difference = randomcomparison.getDifference();
    comparison_all_differences = randomcomparison.getAllDifferences();
    comparison_p1 = randomcomparison.getP1();
    comparison_p2 = randomcomparison.getP2();
    comparison_confidence_interval_min = randomcomparison.getConfidenceIntervalMin();
    comparison_confidence_interval_max = randomcomparison.getConfidenceIntervalMax();
        
    if Measure.is_global(measures{i})
        assert(iscell(comparison_values_1) && ...
            isequal(numel(comparison_values_1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_values_1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_values_1)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 
        
        assert(iscell(comparison_values_2) && ...
            isequal(numel(comparison_values_2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_values_2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_values_2)), ...        
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 
        
        assert(iscell(comparison_difference) && ...
            isequal(numel(comparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_difference)), ...      
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 
        
        assert(iscell(comparison_all_differences) && ...
            isequal(numel(comparison_all_differences), number_of_permutations) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_all_differences)), ...         
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 
        
        assert(iscell(comparison_p1) && ...
            isequal(numel(comparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_p1)), ...         
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 

        assert(iscell(comparison_p2) && ...
            isequal(numel(comparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_p2)), ...   
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 
        
        assert(iscell(comparison_confidence_interval_min) && ...
            isequal(numel(comparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_confidence_interval_min)), ...   
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures') 

        assert(iscell(comparison_confidence_interval_max) && ...
            isequal(numel(comparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), 1), comparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_confidence_interval_max)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with global measures')

    elseif Measure.is_nodal(measures{i})
        assert(iscell(comparison_values_1) && ...
            isequal(numel(comparison_values_1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_values_1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_values_1)), ... 
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 
        
        assert(iscell(comparison_values_2) && ...
            isequal(numel(comparison_values_2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_values_2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_values_2)), ... 
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 
        
        assert(iscell(comparison_difference) && ...
            isequal(numel(comparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_difference)), ...         
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 
        
        assert(iscell(comparison_all_differences) && ...
            isequal(numel(comparison_all_differences), number_of_permutations) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_all_differences)), ...   
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures')  
        
        assert(iscell(comparison_p1) && ...
            isequal(numel(comparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_p1)), ...     
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 

        assert(iscell(comparison_p2) && ...
            isequal(numel(comparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_p2)), ...  
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 
        
        assert(iscell(comparison_confidence_interval_min) && ...
            isequal(numel(comparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_confidence_interval_min)), ...  
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 

        assert(iscell(comparison_confidence_interval_max) && ...
            isequal(numel(comparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), 1), comparison_confidence_interval_max)), ... 
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with nodal measures') 
        
    elseif Measure.is_binodal(measures{i})
        assert(iscell(comparison_values_1) && ...
            isequal(numel(comparison_values_1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_values_1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_values_1)), ... 
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 
        
        assert(iscell(comparison_values_2) && ...
            isequal(numel(comparison_values_2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_values_2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_values_2)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures')  
        
        assert(iscell(comparison_difference) && ...
            isequal(numel(comparison_difference), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_difference)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_difference)), ...       
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 
        
        assert(iscell(comparison_all_differences) && ...
            isequal(numel(comparison_all_differences), number_of_permutations) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_all_differences)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_all_differences)), ...        
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 
        
        assert(iscell(comparison_p1) && ...
            isequal(numel(comparison_p1), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_p1)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_p1)), ...       
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 

        assert(iscell(comparison_p2) && ...
            isequal(numel(comparison_p2), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_p2)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_p2)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 
        
        assert(iscell(comparison_confidence_interval_min) && ...
            isequal(numel(comparison_confidence_interval_min), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_confidence_interval_min)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_confidence_interval_min)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 

        assert(iscell(comparison_confidence_interval_max) && ...
            isequal(numel(comparison_confidence_interval_max), 1) && ...
            all(cellfun(@(x) isequal(size(x, 1), atlas.getBrainRegions().length()), comparison_confidence_interval_max)) &&...
            all(cellfun(@(x) isequal(size(x, 2), atlas.getBrainRegions().length()), comparison_confidence_interval_max)), ...
            [BRAPH2.STR ':AnalysisST_WU:' BRAPH2.WRONG_OUTPUT], ...
            'AnalysisST_WU.getComparison() not working with binodal measures') 
    end
end