% test RandomComparisonMRI
br1 = BrainRegion('BR1', 'brain region 1', 1, 11, 111);
br2 = BrainRegion('BR2', 'brain region 2', 2, 22, 222);
br3 = BrainRegion('BR3', 'brain region 3', 3, 33, 333);
br4 = BrainRegion('BR4', 'brain region 4', 4, 44, 444);
br5 = BrainRegion('BR5', 'brain region 5', 5, 55, 555);
atlas = BrainAtlas('brain atlas', {br1, br2, br3, br4, br5});

subject_class = RandomComparison.getSubjectClass('RandomComparisonMRI');

sub1 = Subject.getSubject(subject_class, repmat({atlas}, 1, Subject.getBrainAtlasNumber(subject_class)), 'SubjectID', 1);
sub2 = Subject.getSubject(subject_class, repmat({atlas}, 1, Subject.getBrainAtlasNumber(subject_class)), 'SubjectID', 2);
sub3 = Subject.getSubject(subject_class, repmat({atlas}, 1, Subject.getBrainAtlasNumber(subject_class)), 'SubjectID', 3);
group = Group(subject_class, {sub1, sub2, sub3});

measures = {'Assortativity', 'Degree', 'Distance'};

%% Test 1: Instantiation
for i = 1:1:numel(measures)
    randomcomparison = RandomComparisonMRI('c1', atlas, {group group}, 'RandomComparisonMRI.measure_code', measures{i});
    
    assert(~isempty(randomcomparison), ...
        ['BRAPH:ComparisionDTI:Instantiation'], ...
        ['ComparisionDTI does not initialize correctly.']) %#ok<*NBRAK>
end

%% Test 2: Correct Size defaults
for i = 1:1:numel(measures)
    number_of_permutations = 10;
    
    randomcomparison = RandomComparisonMRI('c1', atlas, {group group}, 'RandomComparisonMRI.measure_code', measures{i}, 'RandomComparisonMRI.number_of_permutations', number_of_permutations);
    
    value_group = randomcomparison.getGroupValue();    
    value_random = randomcomparison.getRandomValue();
    difference = randomcomparison.getDifference();  % difference
    all_differences = randomcomparison.getAllDifferences(); % all differences obtained through the permutation test
    p1 = randomcomparison.getP1(); % p value single tailed
    p2 = randomcomparison.getP2();  % p value double tailed
    confidence_interval_min = randomcomparison.getConfidenceIntervalMin();  % min value of the 95% confidence interval
    confidence_interval_max = randomcomparison.getConfidenceIntervalMax(); % max value of the 95% confidence interval

    if Measure.is_global(measures{i})
        assert(iscell(value_group) & ...
            isequal(numel(value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [1, 1]), value_group)) & ...
            iscell(value_random) & ...
            isequal(numel(value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [1, 1]), value_random)), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with global measures.']) %#ok<*NBRAK>
         assert(isequal(numel(difference), 1) & ...
            isequal(numel(all_differences), number_of_permutations) & ...
            isequal(numel(p1), 1) & ...
            isequal(numel(p2), 1) & ...
            isequal(numel(confidence_interval_min), 1) & ...
            isequal(numel(confidence_interval_max), 1), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with global measures.']) 
    elseif Measure.is_nodal(measures{i})
        assert(iscell(value_group) & ...
            isequal(numel(value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), 1]), value_group)) & ...
            iscell(value_random) & ...
            isequal(numel(value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), 1]), value_random)) , ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with nodal measures.']) %#ok<*NBRAK>
        assert(isequal(size(difference), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(all_differences), [1, number_of_permutations]) & ...
            isequal(size(p1), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(p2), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(confidence_interval_min), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(confidence_interval_max), [atlas.getBrainRegions().length(), 1]), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with nodal measures.']) %#ok<*NBRAK>
    elseif Measure.is_binodal(measures{i})
        assert(iscell(value_group) & ...
            isequal(numel(value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), value_group)) & ...
            iscell(value_random) & ...
            isequal(numel(value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), value_random)), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with binodal measures.']) %#ok<*NBRAK>
        assert(isequal(size(difference), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(all_differences), [1, number_of_permutations]) & ...
            isequal(size(p1), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(p2), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(confidence_interval_min), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(confidence_interval_max), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with binodal measures.']) %#ok<*NBRAK>
    end
end

%% Test 3: Initialize with values
for i = 1:1:numel(measures)
    % setup
    number_of_permutations = 10;
    A_1 = rand(atlas.getBrainRegions().length());
    A_2 = rand(atlas.getBrainRegions().length());
    g_1 = Graph.getGraph('GraphWU', A_1);
    g_2 = Graph.getGraph('GraphWU', A_2);
    m_1  = Measure.getMeasure(measures{i}, g_1);
    m_2 = Measure.getMeasure(measures{i}, g_2);
    value_group = {m_1.getValue()}; %#ok<*SAGROW>
    value_random = {m_2.getValue()};
    
    % for the dimensions 
    difference  = value_random{1} - value_group{1};
    
    for j = 1:1:number_of_permutations
        all_differences{j} =  value_random{1} - value_group{1};  % similar
    end
    p1 = difference;  % all similar
    p2 = difference;
    confidence_interval_min = difference;
    confidence_interval_max = difference;
    
    % act
    randomcomparison = RandomComparisonMRI('c1', atlas, {group group}, ...
        'RandomComparisonMRI.measure_code', measures{i}, ...
        'RandomComparisonMRI.number_of_permutations', number_of_permutations, ...
        'RandomComparisonMRI.value_group', value_group, ...
        'RandomComparisonMRI.value_random', value_random, ...
        'RandomComparisonMRI.difference', difference, ...
        'RandomComparisonMRI.all_differences', all_differences, ...
        'RandomComparisonMRI.p1', p1, ...
        'RandomComparisonMRI.p2', p2, ....
        'RandomComparisonMRI.confidence_min', confidence_interval_min, ...
        'RandomComparisonMRI.confidence_max', confidence_interval_max ...
        );
    
    comparison_value_group = randomcomparison.getGroupValue();
    comparison_value_random = randomcomparison.getRandomValue();
    comparison_difference = randomcomparison.getDifference();
    comparison_all_differences = randomcomparison.getAllDifferences();
    comparison_p1 = randomcomparison.getP1();
    comparison_p2 = randomcomparison.getP2();
    comparison_confidence_interval_min = randomcomparison.getConfidenceIntervalMin();
    comparison_confidence_interval_max = randomcomparison.getConfidenceIntervalMax();
    
    % assert
    if Measure.is_global(measures{i})
        assert(iscell(comparison_value_group) & ...
            isequal(numel(comparison_value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [1, 1]), comparison_value_group)) & ...
            iscell(comparison_value_random) & ...
            isequal(numel(comparison_value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [1, 1]), comparison_value_random)), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with global measures.']) %#ok<*NBRAK>
        assert(isequal(numel(comparison_difference), 1) & ...
            isequal(numel(comparison_all_differences), number_of_permutations) & ...
            isequal(numel(comparison_p1), 1) & ...
            isequal(numel(comparison_p2), 1) & ...
            isequal(numel(comparison_confidence_interval_min), 1) & ...
            isequal(numel(comparison_confidence_interval_max), 1), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with global measures.']) %#ok<*NBRAK>
    elseif Measure.is_nodal(measures{i})
        assert(iscell(comparison_value_group) & ...
            isequal(numel(comparison_value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), 1]), comparison_value_group)) & ...
            iscell(comparison_value_random) & ...
            isequal(numel(comparison_value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), 1]), comparison_value_random)) , ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with nodal measures.']) %#ok<*NBRAK>
        assert(isequal(size(comparison_difference), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(comparison_all_differences), [1, number_of_permutations]) & ...
            isequal(size(comparison_p1), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(comparison_p2), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(comparison_confidence_interval_min), [atlas.getBrainRegions().length(), 1]) & ...
            isequal(size(comparison_confidence_interval_max), [atlas.getBrainRegions().length(), 1]), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with nodal measures.']) %#ok<*NBRAK>
    elseif Measure.is_binodal(measures{i})
        assert(iscell(comparison_value_group) & ...
            isequal(numel(comparison_value_group), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), comparison_value_group)) & ...
            iscell(comparison_value_random) & ...
            isequal(numel(comparison_value_random), 1) & ...
            all(cellfun(@(x) isequal(size(x), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), comparison_value_random)), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with binodal measures.']) %#ok<*NBRAK>
        assert(isequal(size(comparison_difference), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(comparison_all_differences), [1, number_of_permutations]) & ...
            isequal(size(comparison_p1), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(comparison_p2), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(comparison_confidence_interval_min), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]) & ...
            isequal(size(comparison_confidence_interval_max), [atlas.getBrainRegions().length(), atlas.getBrainRegions().length()]), ...
            ['BRAPH:RandomComparisonMRI:Instantiation'], ...
            ['RandomComparisonMRI does not initialize correctly with binodal measures.']) %#ok<*NBRAK>
    end    
end