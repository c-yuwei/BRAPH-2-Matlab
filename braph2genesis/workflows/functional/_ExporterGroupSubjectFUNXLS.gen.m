%% ¡header!
ExporterGroupSubjectFUNXLS < Exporter (ex, exporter of FUN subject group in XLS/XLSX) exports a group of subjects with functional data to a series of XLSX file.

%%% ¡description!
ExporterGroupSubjectFUNXLS exports a group of subjects with functional data to a series of XLSX file.

%% ¡props!

%%% ¡prop!
GR (data, item) is a group of subjects with functional data.
%%%% ¡settings!
'Group'
%%%% ¡check!
check = any(strcmp(value.get(Group.SUB_CLASS_TAG), subclasses('SubjectFUN', [], [], true))); % Format.checkFormat(Format.ITEM, value) already checked
%%%% ¡default!
Group('SUB_CLASS', 'SubjectFUN', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectFUN'))

%%% ¡prop!
DIRECTORY (data, string) is the directory name where to save the group of subjects with functional data.
%%%% ¡default!
fileparts(which('test_braph2'))

%%% ¡prop!
SAVE (result, empty) saves the group of subjects with functional data in XLS/XLSX files in the selected directory.
%%%% ¡calculate!
directory = ex.get('DIRECTORY');

if isfolder(directory)
    gr = ex.get('GR');

    gr_directory = [directory filesep() gr.get('ID')];
    if ~exist(gr_directory, 'dir')
        mkdir(gr_directory)
    end

    sub_dict = gr.get('SUB_DICT');
    sub_number = sub_dict.length();
    for i = 1:1:sub_number
        sub = sub_dict.getItem(i);
        sub_id = sub.get('ID');
        sub_FUN = sub.get('FUN');

        tab = table(sub_FUN);

        sub_file = [gr_directory filesep() sub_id '.xlsx'];

        % save file
        writetable(tab, sub_file, 'Sheet', 1, 'WriteVariableNames', 0);
    end
    
    % sets value to empty
    value = [];
else
    value = ex.getr('SAVE');    
end

%% ¡methods!
function uigetdir(ex)
    % UIGETDIR opens a dialog box to set the directory where to save the group of subjects with functional data.

    directory = uigetdir('Select directory');
    if isfolder(directory)
        ex.set('DIRECTORY', directory);
    end
end

%% ¡tests!

%%% ¡test!
%%%% ¡name!
export and import
%%%% ¡code!
br1 = BrainRegion( ...
    'ID', 'ISF', ...
    'LABEL', 'superiorfrontal', ...
    'NOTES', 'notes1', ...
    'X', -12.6, ...
    'Y', 22.9, ...
    'Z', 42.4 ...
    );
br2 = BrainRegion( ...
    'ID', 'lFP', ...
    'LABEL', 'frontalpole', ...
    'NOTES', 'notes2', ...
    'X', -8.6, ...
    'Y', 61.7, ...
    'Z', -8.7 ...
    );
br3 = BrainRegion( ...
    'ID', 'lRMF', ...
    'LABEL', 'rostralmiddlefrontal', ...
    'NOTES', 'notes3', ...
    'X', -31.3, ...
    'Y', 41.2, ...
    'Z', 16.5 ...
    );
br4 = BrainRegion( ...
    'ID', 'lCMF', ...
    'LABEL', 'caudalmiddlefrontal', ...
    'NOTES', 'notes4', ...
    'X', -34.6, ...
    'Y', 10.2, ...
    'Z', 42.8 ...
    );
br5 = BrainRegion( ...
    'ID', 'lPOB', ...
    'LABEL', 'parsorbitalis', ...
    'NOTES', 'notes5', ...
    'X', -41, ...
    'Y', 38.8, ...
    'Z', -11.1 ...
    );

ba = BrainAtlas( ...
    'ID', 'TestToSaveCoolID', ...
    'LABEL', 'Brain Atlas', ...
    'NOTES', 'Brain atlas notes', ...
    'BR_DICT', IndexedDictionary('IT_CLASS', 'BrainRegion', 'IT_KEY', 1, 'IT_LIST', {br1, br2, br3, br4, br5}) ...
    );

sub1 = SubjectFUN( ...
    'ID', 'SUB FUN 1', ...
    'LABEL', 'Subejct FUN 1', ...
    'NOTES', 'Notes on subject FUN 1', ...
    'BA', ba, ...
    'FUN', rand(ba.get('BR_DICT').length(), 10) ...
    );
sub2 = SubjectFUN( ...
    'ID', 'SUB FUN 2', ...
    'LABEL', 'Subejct FUN 2', ...
    'NOTES', 'Notes on subject FUN 2', ...
    'BA', ba, ...
    'FUN', rand(ba.get('BR_DICT').length(), 10) ...
    );
sub3 = SubjectFUN( ...
    'ID', 'SUB FUN 3', ...
    'LABEL', 'Subejct FUN 3', ...
    'NOTES', 'Notes on subject FUN 3', ...
    'BA', ba, ...
    'FUN', rand(ba.get('BR_DICT').length(), 10) ...
    );

gr = Group( ...
    'ID', 'GR FUN', ...
    'LABEL', 'Group label', ...
    'NOTES', 'Group notes', ...
    'SUB_CLASS', 'SubjectFUN', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectFUN', 'IT_KEY', 1, 'IT_LIST', {sub1, sub2, sub3}) ...
    );

directory = [fileparts(which('test_braph2')) filesep 'trial_group_subjects_FUN_to_be_erased'];
if ~exist(directory, 'dir')
    mkdir(directory)
end

ex = ExporterGroupSubjectFUNXLS( ...
    'DIRECTORY', directory, ...
    'GR', gr ...
    );
ex.get('SAVE');

% import with same brain atlas
im1 = ImporterGroupSubjectFUNXLS( ...
    'DIRECTORY', [directory filesep() gr.get(Group.ID)], ...
    'BA', ba ...
    );
gr_loaded1 = im1.get('GR');

assert(gr.get('SUB_DICT').length() == gr_loaded1.get('SUB_DICT').length(), ...
	[BRAPH2.STR ':ExporterGroupSubjectFUNXLS:' BRAPH2.BUG_IO], ...
    'Problems saving or loading a group.')
for i = 1:1:max(gr.get('SUB_DICT').length(), gr_loaded1.get('SUB_DICT').length())
    sub = gr.get('SUB_DICT').getItem(i);
    sub_loaded = gr_loaded1.get('SUB_DICT').getItem(i);    
    assert( ...
        isequal(sub.get('ID'), sub_loaded.get('ID')) & ...
        isequal(sub.get('BA'), sub_loaded.get('BA')) & ...
        isequal(sub.get('FUN'), sub_loaded.get('FUN')), ...
        [BRAPH2.STR ':ExporterGroupSubjectFUNXLS:' BRAPH2.BUG_IO], ...
        'Problems saving or loading a group.')    
end

% import with new brain atlas
im2 = ImporterGroupSubjectFUNXLS( ...
    'DIRECTORY', [directory filesep() gr.get(Group.ID)] ...
    );
gr_loaded2 = im2.get('GR');

assert(gr.get('SUB_DICT').length() == gr_loaded2.get('SUB_DICT').length(), ...
	[BRAPH2.STR ':ExporterGroupSubjectFUNXLS:' BRAPH2.BUG_IO], ...
    'Problems saving or loading a group.')
for i = 1:1:max(gr.get('SUB_DICT').length(), gr_loaded2.get('SUB_DICT').length())
    sub = gr.get('SUB_DICT').getItem(i);
    sub_loaded = gr_loaded2.get('SUB_DICT').getItem(i);    
    assert( ...
        isequal(sub.get('ID'), sub_loaded.get('ID')) & ...
        ~isequal(sub.get('BA'), sub_loaded.get('BA')) & ...
        isequal(sub.get('FUN'), sub_loaded.get('FUN')), ...
        [BRAPH2.STR ':ExporterGroupSubjectFUNXLS:' BRAPH2.BUG_IO], ...
        'Problems saving or loading a group.')    
end

rmdir(directory, 's')
