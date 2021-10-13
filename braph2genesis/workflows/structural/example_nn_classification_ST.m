%EXAMPLE_NN_CLASSIFICATION
% Script example workflow 

clear variables %#ok<*NASGU>


%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS('FILE', [fileparts(which('example_ST_WU')) filesep 'example data ST (MRI)' filesep 'desikan_atlas.xlsx']);

ba = im_ba.get('BA');

%% Load Groups of SubjectST
im_gr1 = ImporterGroupSubjectSTXLS( ...
    'FILE', [fileparts(which('example_ST_WU')) filesep 'example data ST (MRI)' filesep 'xls' filesep 'ST_group1.xlsx'], ...
    'BA', ba ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectSTXLS( ...
    'FILE', [fileparts(which('example_ST_WU')) filesep 'example data ST (MRI)' filesep 'xls' filesep 'ST_group2.xlsx'], ...
    'BA', ba ...
    );

gr2 = im_gr2.get('GR');

%% Neural network
nn_classifier_ST = ClassifierNN_ST( ...
    'GR1', gr1, ...
    'GR2', gr2 ...
    );

% nn result calculation
nn_classifier_ST.memorize('NEURAL_NETWORK_ANALYSIS');
test_acc = nn_classifier_ST.get('TEST_ACCURACY');
train_acc = nn_classifier_ST.get('TRAINING_ACCURACY');

% save the training progress figure
currentfig = findall(groot, 'Tag', 'NNET_CNN_TRAININGPLOT_UIFIGURE');
savefig(currentfig, [fileparts(which('example_ST_WU')) filesep 'example data ST (MRI)' filesep 'classification_training_progress.fig'])