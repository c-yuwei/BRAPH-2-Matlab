%% EXAMPLE_NN_CON_WU_CLASSIFICATION_ADJACENCYMATRIX
% Script example pipeline for NN classification with the input of adjacency matrix

clear variables %#ok<*NASGU>

%% Load brain atlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('example_CON_WU')) filesep 'example data CON (DTI)' filesep 'desikan_atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load groups of SubjectCON
im_gr1 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_CON_WU')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName1'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectCON_XLS( ...
    'DIRECTORY', [fileparts(which('example_CON_WU')) filesep 'example data CON (DTI)' filesep 'xls' filesep 'GroupName2'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Construct the dataset
nnd1 = NNData_CON_WU( ...
    'GR', gr1, ...
    'INPUT_TYPE', 'adjacency_matrices', ...
    'TARGET_NAME', gr1.get('ID'), ...
    'WAITBAR', true ...
    );

gr1_nn = nnd1.get('GR_NN');

nnd2 = NNData_CON_WU( ...
    'GR', gr2, ...
    'INPUT_TYPE', 'adjacency_matrices', ...
    'TARGET_NAME', gr2.get('ID'), ...
    'WAITBAR', true ...
    );

gr2_nn = nnd2.get('GR_NN');

%% Split the dataset
nnds = NNClassifierDataSplit( ...
    'GR1', gr1_nn, ...
    'GR2', gr2_nn, ...
    'SPLIT_GR1', 0.2, ...
    'SPLIT_GR2', 0.2, ...
    'WAITBAR', true ...
    );

gr_train = nnds.get('GR_TRAIN_FS');
gr_val = nnds.get('GR_VAL_FS');

%% Train the neural network classifier with the training set
classifier = NNClassifierDNN( ...
    'GR', gr_train, ...
    'VERBOSE', false, ...
    'PLOT_TRAINING', false, ...
    'SHUFFLE', 'every-epoch' ...
    );
classifier.memorize('MODEL');

%% Evaluate the classifier for the training set
nne_train = NNClassifierEvaluator( ...
    'GR', gr_train, ...
    'NN', classifier ...
    );

auc_train = nne_train.get('AUC');
cm_train = nne_train.get('CONFUSION_MATRIX');

%% Evaluate the classifier for the validation set
nne_val = NNClassifierEvaluator( ...
    'GR', gr_val, ...
    'NN', classifier ...
    );

auc_val = nne_val.get('AUC');
cm_val = nne_val.get('CONFUSION_MATRIX');
feature_importance = nne_val.get('FEATURE_PERMUTATION_IMPORTANCE');

close all