classdef GUI
    properties (Access=protected)
        el % element to be visualized
        
        name % app name
        
        f % figure
        p % panel
        s % slider
        
        pr % property cell array
        prop_text_tag
    end
    properties (Constant)
        BKGCOLOR = [.98 .95 .95]
        FRGCOLOR = [.90 .90 .90]
    end
    methods % constructor
        function gui = GUI(el, varargin)

            assert( ...
                el.getPropNumber() > 0, ...
                [BRAPH2.STR ':GUI:' BRAPH2.WRONG_INPUT], ...
                [BRAPH2.STR ':GUI:' BRAPH2.WRONG_INPUT ' ' ...
                'The element cannot have zero properties, which is not the case for ' tostring(el, 100, '...')] ...
                )
            
            gui.el = el;
            
            % name
            if el.existsTag('ID')
                gui.name = get_from_varargin([el.getClass() ' - ' el.get('ID')], 'name', varargin);
            else
                gui.name = get_from_varargin(el.getClass(), 'name', varargin);
            end
            
            position = get_from_varargin([.02 .30 .30 .80], 'position', varargin);

            % initializes GUI
            gui.f = figure( ...
                'Visible', 'off', ...
                'NumberTitle', 'off', ...
                'Name', [gui.name ' - ' BRAPH2.STR], ...
                'Units', 'normalized', ...
                'Position', position, ...
                'Units', 'character', ...
                'DockControls', 'off', ...
                'Color', GUI.BKGCOLOR, ...
                'SizeChangedFcn', {@resize}, ...
                'CloseRequestFcn', {@close} ...
                );
            
            function close(~, ~)
                selection = questdlg(['Do you want to close ' gui.name '?'], ...
                    ['Close ' gui.name], ...
                    'Yes', 'No', 'Yes');
                switch selection
                    case 'Yes'
                        delete(gui.f)
                    case 'No'
                        return
                end
            end
            function resize(~, ~)
                set(gui.p, 'Position', [0 0 w(gui.f) h(gui.f)])
                                
                dw = 1; % border along x
                dh = .5; % border along y
                
                pr_panel_w = w(gui.p) - 2 * dw - w(gui.s);
                pr_panel_h = cellfun(@(x) h(x), cellfun(@(y) y.panel, gui.pr, 'UniformOutput', false));
                pr_panel_x0 = dw;
                pr_panel_y0 = sum(pr_panel_h + dh) - cumsum(pr_panel_h + dh) + dh;
                for prop = 1:1:el.getPropNumber() %#ok<FXUP>
                    set(gui.pr{prop}.panel, 'Position', [pr_panel_x0 pr_panel_y0(prop) pr_panel_w pr_panel_h(prop)])
                    set(gui.pr{prop}.text_tag, 'Position', [0 pr_panel_h(prop)-h(gui.pr{prop}.text_tag) pr_panel_w h(gui.pr{prop}.text_tag)])
                end

                h_p = sum(pr_panel_h + dh) + dh;
                set(gui.p, 'Position', [0 h(gui.f) - h_p w(gui.f) h_p])
                
                if h(gui.f) >= h(gui.p)
                    set(gui.s, 'Visible', 'off')
                else
                    set(gui.s, ...
                        'Visible', 'on', ...
                        'Position', [w(gui.p)-w(gui.s) 0 w(gui.s) h(gui.f)], ...
                        'Min', h(gui.f) - h(gui.p) ...
                        )
                end
            end
            
            gui.p = uipanel( ...
                'Parent', gui.f, ...
                'Units', 'character', ...
                'BackgroundColor', GUI.BKGCOLOR, ...
                'BorderType', 'none' ...
                );

            for prop = 1:1:el.getPropNumber() %#ok<FXUP>
                gui.pr{prop}.panel = uipanel( ...
                    'Parent', gui.p, ...
                    'Units', 'character', ...
                    'Position', [0 0 eps 1], ... % defines prop panel height
                    'BackgroundColor', GUI.FRGCOLOR, ...
                    'BorderType', 'none' ...
                    );
                
                gui.pr{prop}.text_tag =  uicontrol( ...
                    'Style', 'text', ...
                    'Parent', gui.pr{prop}.panel, ...
                    'Units', 'character', ...
                    'Position', [0 0 eps 1], ... % defines prop text tag height
                    'String', upper(el.getPropTag(prop)), ...
                    'HorizontalAlignment', 'left', ...
                    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
                    'BackgroundColor', GUI.FRGCOLOR ...
                    );
                
                switch el.getPropFormat(prop)
                    case Format.EMPTY
                        draw_empty(prop)
                    case Format.STRING
                        draw_string(prop)
                    case Format.LOGICAL
                        draw_logical(prop)
                    case Format.OPTION
                        draw_option(prop)
                    case Format.CLASS
                        draw_class(prop)
                    case Format.CLASSLIST
                        draw_classlist(prop)
                    case Format.ITEM
                        draw_item(prop)
                    case Format.ITEMLIST
                        draw_itemlist(prop)
                    case Format.IDICT
                        draw_idict(prop)
                    case Format.SCALAR
                        draw_scalar(prop)
                    case Format.RVECTOR
                        draw_rvector(prop)
                    case Format.CVECTOR
                        draw_cvector(prop)
                    case Format.MATRIX
                        draw_matrix(prop)
                    case Format.SMATRIX
                        draw_smatrix(prop)
                    case Format.CELL
                        draw_cell(prop)
                end
            end
            function draw_empty(prop) %#ok<INUSD>
            end
            function draw_string(prop)
                set(gui.pr{prop}.panel, 'Position', [0 0 eps 2.5]) % re-defines prop panel height

                gui.pr{prop}.edit_value = uicontrol( ...
                    'Style', 'edit', ...
                    'Parent', gui.pr{prop}.panel, ...
                    'Units', 'normalized', ...
                    'Position', [.01 .10 .79 .40], ...
                    'String', el.get(prop), ...
                    'HorizontalAlignment', 'left', ...
                    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
                    'BackgroundColor', 'w' ...
                    );
            end
            function draw_logical(prop) %#ok<INUSD>
            end
            function draw_option(prop) %#ok<INUSD>
            end
            function draw_class(prop) %#ok<INUSD>
            end
            function draw_classlist(prop) %#ok<INUSD>
            end
            function draw_item(prop) %#ok<INUSD>
            end
            function draw_itemlist(prop) %#ok<INUSD>
            end
            function draw_idict(prop)%#ok<INUSD>
            end
            function draw_scalar(prop)
                set(gui.pr{prop}.panel, 'Position', [0 0 eps 2.5]) % re-defines prop panel height

                gui.pr{prop}.edit_value = uicontrol( ...
                    'Style', 'edit', ...
                    'Parent', gui.pr{prop}.panel, ...
                    'Units', 'normalized', ...
                    'Position', [.01 .10 .29 .40], ...
                    'String', num2str(el.get(prop)), ...
                    'HorizontalAlignment', 'center', ...
                    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
                    'BackgroundColor', 'w' ...
                    );
            end                
            function draw_rvector(prop) %#ok<INUSD>
            end
            function draw_cvector(prop) %#ok<INUSD>
            end
            function draw_matrix(prop) %#ok<INUSD>
            end
            function draw_smatrix(prop) %#ok<INUSD>
            end
            function draw_cell(prop) %#ok<INUSD>
            end
            
            gui.s = uicontrol( ...
                'Style', 'slider', ...
                'Parent', gui.f, ...
                'Units', 'character', ...
                'Position', [0 0 5 eps], ... % defines slider width
                'Min', -eps, ...
                'Max', 0, ...
                'Value', 0, ...
                'Callback', {@cb_s});
                
            function cb_s(~, ~)
                offset = get(gui.s, 'Value');
                set(gui.p, 'Position', [x0(gui.p) h(gui.f)-h(gui.p)-offset w(gui.p) h(gui.p)]);
            end               

            % shows GUI
            set(gui.f, 'Visible', 'on')
            
            % auxiliary functions
            function r = x0(h)
                r = get(h, 'Position');
                r = r(1);
            end
            function r = y0(h) %#ok<DEFNU>
                r = get(h, 'Position');
                r = r(2);
            end
            function r = w(h)
                r = get(h, 'Position');
                r = r(3);
            end
            function r = h(h)
                r = get(h, 'Position');
                r = r(4);
            end
        end
    end
end