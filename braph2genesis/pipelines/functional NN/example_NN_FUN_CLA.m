%% EXAMPLE_NN_FUN_CLA
% Script example pipeline for NN classification with the input of SubjectFUN 

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

im_gr3 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('NNDataPoint_FUN_CLA')) filesep 'Example data NN CLA FUN XLS' filesep 'FUN_Group_3_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr3 = im_gr3.get('GR');

%% Training-test split
% create item lists of NNDataPoint_FUN_CLA
it_list1 = cellfun(@(x) NNDataPoint_FUN_CLA( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_CLASS', {gr1.get('ID')}), ...
    gr1.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list2 = cellfun(@(x) NNDataPoint_FUN_CLA( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_CLASS', {gr2.get('ID')}), ...
    gr2.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

it_list3 = cellfun(@(x) NNDataPoint_FUN_CLA( ...
    'ID', x.get('ID'), ...
    'SUB', x, ...
    'TARGET_CLASS', {gr3.get('ID')}), ...
    gr3.get('SUB_DICT').get('IT_LIST'), ...
    'UniformOutput', false);

% create NNDataPoint_FUN_CLA DICT items
dp_list1 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_FUN_CLA', ...
        'IT_LIST', it_list1 ...
        );

dp_list2 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_FUN_CLA', ...
        'IT_LIST', it_list2 ...
        );

dp_list3 = IndexedDictionary(...
        'IT_CLASS', 'NNDataPoint_FUN_CLA', ...
        'IT_LIST', it_list3 ...
        );

% create a NNDataset containing the NNDataPoint_FUN_CLA DICT
d1 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_FUN_CLA', ...
    'DP_DICT', dp_list1 ...
    );

d2 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_FUN_CLA', ...
    'DP_DICT', dp_list2 ...
    );

d3 = NNDataset( ...
    'DP_CLASS', 'NNDataPoint_FUN_CLA', ...
    'DP_DICT', dp_list3 ...
    );

% Split the NNData into training set and test set
d_split1 = NNDatasetSplit('D', d1, 'SPLIT', {0.7, 0.3});
d_split2 = NNDatasetSplit('D', d2, 'SPLIT', {0.7, 0.3});
d_split3 = NNDatasetSplit('D', d3, 'SPLIT', {0.7, 0.3});

d_training = NNDatasetCombine('D_LIST', {d_split1.get('D_LIST_IT', 1), d_split2.get('D_LIST_IT', 1), d_split3.get('D_LIST_IT', 1)}).get('D');
d_test = NNDatasetCombine('D_LIST', {d_split1.get('D_LIST_IT', 2), d_split2.get('D_LIST_IT', 2), d_split3.get('D_LIST_IT', 2)}).get('D');

%% Create a MLP classifier with training set
nn = NNClassifierMLP('D', d_training, 'LAYERS', [20 20]);
nn.get('TRAIN');

%% Evaluate the classifier with the test set
nne_test = NNClassifierMLP_Evaluator('D', d_test, 'NN', nn);
confusion_matrix = nne_test.get('C_MATRIX');
auc = nne_test.get('AUC');
av_auc = nne_test.get('MACRO_AUC');