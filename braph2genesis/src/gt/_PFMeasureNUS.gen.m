%% ¡header!
PFMeasureNUS < PFMeasureGU (pf, panel figure measure GU) is a plot of a nodal and superglobal measure.

%%% ¡description!
% % % PFMeasureNUS manages the plot of the nodal superglobal measure choosen by the user. 

%%% ¡seealso!
PanelFig, Measure

%% ¡properties!
p  % handle for panel
h_axes % handle for the axes

h_line % data line
h_xlabel
h_ylabel

%% ¡props_update!

%%% ¡prop!
ST_LINE (figure, item) determines the line settings.
%%%% ¡settings!
'SettingsLine'
%%%% ¡postprocessing!
if check_graphics(pf.h_line, 'line')
    bas = pf.get('M').get('G').get('BAS');
    ba = bas{1};

    if ~ba.get('BR_DICT').contains(pf.get('BR1_ID'))
        pf.set('BR1_ID', ba.get('BR_DICT').getItem(1).get('ID'))
    end
    br1_id = ba.get('BR_DICT').getIndex(pf.get('BR1_ID'));
    
    pf.get('ST_LINE').set( ...
        'X', pf.get('M').get('G').get('LAYERTICKS'), ...
        'Y', cellfun(@(x) x(br1_id), pf.get('M').get('M')), ...
        'VISIBLE', true ...
        )
    pf.get('ST_AXIS').set('AXIS', true)
    set(pf.h_axes, 'InnerPosition', [s(6)/w(pf.h_axes, 'pixels') s(6)/h(pf.h_axes, 'pixels') max(.1, 1-s(8)/w(pf.h_axes, 'pixels')) max(.1, 1-s(8)/h(pf.h_axes, 'pixels'))])
end

%% ¡props!

%%% ¡prop!
BR1_ID (figure, string) is the ID of the brain region of the nodal measure.
%%%% ¡gui!
bas = pf.get('M').get('G').get('BAS');
ba = bas{1};

pr = PP_BrainRegion('EL', pf, 'PROP', PFMeasureNUS.BR1_ID, ...
    'BA', ba, ...
    varargin{:});

%% ¡methods!
function p_out = draw(pf, varargin)

    pf.p = draw@PFMeasureGU(pf, varargin{:});
    pf.h_axes = pf.get('ST_AXIS').h();
    pf.h_line = pf.get('ST_LINE').h();
    
    % output
    if nargout > 0
        p_out = pf.p;
    end
end