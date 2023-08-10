%% ¡header!
ComparisonGroupPF_GU < ComparisonGroupPF (pf, panel global unilayer group comparison figure) is the base element to plot a global unilayer group comparison figure.

%%% ¡description!
ComparisonGroupPF_GU manages the basic functionalities to plot of a global unilayer group comparison figure.

%%% ¡seealso!
ComparisonGroup

%% ¡layout!

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ID
%%%% ¡title!
Brain Atlas Figure ID

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.LABEL
%%%% ¡title!
Brain Atlas Figure NAME

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.WAITBAR
%%%% ¡title!
WAITBAR ON/OFF

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.NOTES
%%%% ¡title!
Brain Atlas NOTES

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.BKGCOLOR
%%%% ¡title!
BACKGROUND COLOR

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_POSITION
%%%% ¡title!
PANEL POSITION

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_AXIS
%%%% ¡title!
AXIS

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_LINE_DIFF
%%%% ¡title!
DIFFERENCE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_AREA
%%%% ¡title!
CONFIDENCE AREA (95%)

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_LINE_CIL
%%%% ¡title!
LOWER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_LINE_CIU
%%%% ¡title!
UPPER CONFIDENCE LINE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_TITLE
%%%% ¡title!
TITLE

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_XLABEL
%%%% ¡title!
X-LABEL

%%% ¡prop!
%%%% ¡id!
ComparisonGroupPF_GU.ST_YLABEL
%%%% ¡title!
Y-LABEL

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the panel figure global unilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_GU'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure global unilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_GU manages the basic functionalities to plot of a global unilayer group comparison figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure global unilayer group comparison figure.
%%%% ¡settings!
'ComparisonGroupPF_GU'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure global unilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_GU ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure global unilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_GU label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure global unilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_GU notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison figure value and stores it.
%%%% ¡calculate!
cp = pf.get('CP');
g = cp.get('C').get('A1').get('G');

x = g.get('ALAYERTICKS');

diff = cell2mat(cp.get('DIFF'))';
cil = cell2mat(cp.get('CIL'))';
ciu = cell2mat(cp.get('CIU'))';

pf.memorize('ST_LINE_DIFF').set('X', x, 'Y', diff)
pf.memorize('ST_LINE_CIL').set('X', x, 'Y', cil)
pf.memorize('ST_LINE_CIU').set('X', x, 'Y', ciu)

if ~isempty(cil) && ~isempty(ciu)
    if isempty(x) 
        pf.memorize('ST_AREA').set('X', [1:1:length(diff) length(diff):-1:1], 'Y', [cil ciu(end:-1:1)])
    else
        pf.memorize('ST_AREA').set('X', [x x(end:-1:1)], 'Y', [cil ciu(end:-1:1)])
    end
end

xlim = pf.get('H_AXES').get('XLim');
ylim = pf.get('H_AXES').get('YLim');
pf.get('ST_TITLE').set( ...
    'TXT', cp.get('LABEL'), ...
    'X', .5 * (xlim(2) + xlim(1)), ...
    'Y', ylim(2) + .07 * (ylim(2) - ylim(1)), ...
    'Z', 0 ...
    )
pf.get('ST_XLABEL').set( ...
    'TXT', 'Layer', ...
    'X', .5 * (xlim(2) + xlim(1)), ...
    'Y', ylim(1) - .07 * (ylim(2) - ylim(1)), ...
    'Z', 0 ...
    )
pf.get('ST_YLABEL').set( ...
	'TXT', 'Measure Value', ...
    'X', xlim(1) - .14 * (xlim(2) - xlim(1)), ...
    'Y', .5 * (ylim(2) + ylim(1)), ...
    'Z', 0 ...
    )

value = [];

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupPF_GU.PARENT ComparisonGroupPF_GU.H ComparisonGroupPF_GU.ST_POSITION ComparisonGroupPF_GU.ST_AXIS ComparisonGroupPF_GU.CP ComparisonGroupPF_GU.ST_AREA ComparisonGroupPF_GU.ST_LINE_DIFF ComparisonGroupPF_GU.ST_LINE_CIL ComparisonGroupPF_GU.ST_LINE_CIU ComparisonGroupPF_GU.ST_TITLE ComparisonGroupPF_GU.ST_XLABEL ComparisonGroupPF_GU.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupPF_GU'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupPF_GU'])