%% ¡header!
ImporterGroupSubjectFUNXLS < Importer (im, importer of FUN subject group from XLS/XLSX) imports a group of subjects with connectivity data from a series of XLS/XLSX file.

%%% ¡description!
ImporterGroupSubjectFUNXLS imports a group of subjects with connectivity data from a series of XLS/XLSX file.

%% ¡props!

%%% ¡prop!
DIRECTORY (data, string) is the directory containing the FUN subject group files from which to load the subject group.

%%% ¡prop!
BA (data, item) is a brain atlas.
%%%% ¡settings!
'BrainAtlas'
%%%% ¡default!
BrainAtlas()

%%% ¡prop!
GR (result, item) is a group of subjects with functional data.
%%%% ¡settings!
'Group'
%%%% ¡check!
check = any(strcmp(value.get(Group.SUB_CLASS_TAG), subclasses('SubjectFUN', [], [], true))); % Format.checkFormat(Format.ITEM, value, 'Group') already checked
%%%% ¡default!
Group('SUB_CLASS', 'SubjectFUN', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectFUN'))
%%%% ¡calculate!
% creates empty Group
gr = Group( ...
    'SUB_CLASS', 'SubjectFUN', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectFUN') ...
    );

directory = im.get('DIRECTORY');
if isfolder(directory)
    % sets group props
    [~, name] = fileparts(directory);
    gr.set( ...
        'ID', [name], ...
        'LABEL', [name], ...
        'NOTES', ['Group loaded from ' directory] ...
    );

    % analyzes file
    files_XLSX = dir(fullfile(directory, '*.xlsx'));
    files_XLS = dir(fullfile(directory, '*.xls'));
    files = [files_XLSX; files_XLS];

    if length(files) > 0
        % brain atlas
        ba = im.get('BA');
        br_number = size(xlsread(fullfile(directory, files(1).name)), 1);
        if ba.get('BR_DICT').length ~= br_number
            ba = BrainAtlas();
            for j = 1:1:br_number
                br_id = ['br' int2str(j)];
                br = BrainRegion('ID', br_id);
                ba.get('BR_DICT').add(br)
            end
        end

        % adds subjects
        for i = 1:1:length(files)
            % read file
            FUN = xlsread(fullfile(directory, files(i).name));
            [~, sub_id] = fileparts(files(i).name);
            sub = SubjectFUN( ...
                'ID', sub_id, ...
                'BA', ba, ...
                'FUN', FUN ...
            );
            gr.get('SUB_DICT').add(sub);
        end
    end
end

value = gr;

%% ¡methods!
function uigetdir(im)
    % UIGETDIR opens a dialog box to set the directory from where to load the XLS/XLSX files of the FUN subject group.

    directory = uigetdir('Select directory');
    if isfolder(directory)
        im.set('DIRECTORY', directory);
    end
end