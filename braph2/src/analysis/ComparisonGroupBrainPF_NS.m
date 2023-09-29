classdef ComparisonGroupBrainPF_NS < ComparisonGroupBrainPF
	%ComparisonGroupBrainPF_NS is the base element to plot a nodal superglobal group comparison on brain surface figure.
	% It is a subclass of <a href="matlab:help ComparisonGroupBrainPF">ComparisonGroupBrainPF</a>.
	%
	% ComparisonGroupBrainPF_NS manages the basic functionalities to plot of a nodal superglobal group comparison on brain surface figure.
	%
	% The list of ComparisonGroupBrainPF_NS properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the % % % .
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal group comparison on brain surface figure.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure brain atlas.
	%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
	%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
	%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
	%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
	%  <strong>20</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
	%  <strong>21</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
	%  <strong>22</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
	%  <strong>23</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
	%  <strong>24</strong> <strong>VIEW</strong> 	VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.
	%  <strong>25</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
	%  <strong>26</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
	%  <strong>27</strong> <strong>SURFFILE</strong> 	SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.
	%  <strong>28</strong> <strong>SURF</strong> 	SURF (metadata, item) is the brain surface to be plotted.
	%  <strong>29</strong> <strong>H_BRAIN</strong> 	H_BRAIN (evanescent, handle) is the handle for brain surface.
	%  <strong>30</strong> <strong>BRAIN</strong> 	BRAIN (figure, logical) determines whether the brain surface is shown.
	%  <strong>31</strong> <strong>ST_SURFACE</strong> 	ST_SURFACE (figure, item) determines the surface settings.
	%  <strong>32</strong> <strong>ST_AMBIENT</strong> 	ST_AMBIENT (figure, item) determines the ambient settings.
	%  <strong>33</strong> <strong>BA</strong> 	BA (metadata, item) is the brain atlas with the brain regions.
	%  <strong>34</strong> <strong>H_SPHS</strong> 	H_SPHS (evanescent, handlelist) is the set of handles for the spheres.
	%  <strong>35</strong> <strong>SPHS</strong> 	SPHS (figure, logical) determines whether the spheres are shown.
	%  <strong>36</strong> <strong>SPH_DICT</strong> 	SPH_DICT (figure, idict) contains the spheres of the brain regions.
	%  <strong>37</strong> <strong>H_SYMS</strong> 	H_SYMS (evanescent, handlelist) is the set of handles for the symbols.
	%  <strong>38</strong> <strong>SYMS</strong> 	SYMS (figure, logical) determines whether the symbols are shown.
	%  <strong>39</strong> <strong>SYM_DICT</strong> 	SYM_DICT (figure, idict) contains the symbols of the brain regions.
	%  <strong>40</strong> <strong>H_IDS</strong> 	H_IDS (evanescent, handlelist) is the set of handles for the ids.
	%  <strong>41</strong> <strong>IDS</strong> 	IDS (figure, logical) determines whether the ids are shown.
	%  <strong>42</strong> <strong>ID_DICT</strong> 	ID_DICT (figure, idict) contains the ids of the brain regions.
	%  <strong>43</strong> <strong>H_LABS</strong> 	H_LABS (evanescent, handlelist) is the set of handles for the labels.
	%  <strong>44</strong> <strong>LABS</strong> 	LABS (figure, logical) determines whether the labels are shown.
	%  <strong>45</strong> <strong>LAB_DICT</strong> 	LAB_DICT (figure, idict) contains the labels of the brain regions.
	%  <strong>46</strong> <strong>CP</strong> 	CP (metadata, item) is the group comparison on brain surface.
	%  <strong>47</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the group comparison figure value and stores it.
	%  <strong>48</strong> <strong>NODE</strong> 	NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
	%  <strong>49</strong> <strong>LAYER</strong> 	LAYER (figure, scalar) is the layer number of the nodal measure.
	%  <strong>50</strong> <strong>SIZE_DIFF</strong> 	SIZE_DIFF (figure, option) determines whether the difference is shown with size effect.
	%  <strong>51</strong> <strong>SIZE_SCALE</strong> 	SIZE_SCALE (figure, scalar) determines the scale of size effect.
	%  <strong>52</strong> <strong>COLOR_DIFF</strong> 	COLOR_DIFF (figure, option) determines whether the difference is shown with color effect.
	%  <strong>53</strong> <strong>FDR</strong> 	FDR (figure, option) determines whether the difference is shown with FDR correction.
	%  <strong>54</strong> <strong>QVALUE</strong> 	QVALUE (figure, scalar) determines the QVALUE for FDR correction.
	%
	% ComparisonGroupBrainPF_NS methods (constructor):
	%  ComparisonGroupBrainPF_NS - constructor
	%
	% ComparisonGroupBrainPF_NS methods:
	%  set - sets values of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns the value of a property and memorizes it
	%             (for RESULT, QUERY, and EVANESCENT properties)
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% ComparisonGroupBrainPF_NS methods (display):
	%  tostring - string with information about the panel nodal superglobal group comparison on brain surface figure
	%  disp - displays information about the panel nodal superglobal group comparison on brain surface figure
	%  tree - displays the tree of the panel nodal superglobal group comparison on brain surface figure
	%
	% ComparisonGroupBrainPF_NS methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel nodal superglobal group comparison on brain surface figure are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel nodal superglobal group comparison on brain surface figure
	%
	% ComparisonGroupBrainPF_NS methods (save/load, Static):
	%  save - saves BRAPH2 panel nodal superglobal group comparison on brain surface figure as b2 file
	%  load - loads a BRAPH2 panel nodal superglobal group comparison on brain surface figure from a b2 file
	%
	% ComparisonGroupBrainPF_NS method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel nodal superglobal group comparison on brain surface figure
	%
	% ComparisonGroupBrainPF_NS method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel nodal superglobal group comparison on brain surface figure
	%
	% ComparisonGroupBrainPF_NS methods (inspection, Static):
	%  getClass - returns the class of the panel nodal superglobal group comparison on brain surface figure
	%  getSubclasses - returns all subclasses of ComparisonGroupBrainPF_NS
	%  getProps - returns the property list of the panel nodal superglobal group comparison on brain surface figure
	%  getPropNumber - returns the property number of the panel nodal superglobal group comparison on brain surface figure
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditioned default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% ComparisonGroupBrainPF_NS methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% ComparisonGroupBrainPF_NS methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% ComparisonGroupBrainPF_NS methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% ComparisonGroupBrainPF_NS methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatTag - returns the tag of a format
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% To print full list of constants, click here <a href="matlab:metaclass = ?ComparisonGroupBrainPF_NS; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">ComparisonGroupBrainPF_NS constants</a>.
	%
	%
	% See also ComparisonGroup.
	
	properties (Constant) % properties
		NODE = 48; %CET: Computational Efficiency Trick
		NODE_TAG = 'NODE';
		NODE_CATEGORY = 8;
		NODE_FORMAT = 11;
		
		LAYER = 49; %CET: Computational Efficiency Trick
		LAYER_TAG = 'LAYER';
		LAYER_CATEGORY = 8;
		LAYER_FORMAT = 11;
		
		SIZE_DIFF = 50; %CET: Computational Efficiency Trick
		SIZE_DIFF_TAG = 'SIZE_DIFF';
		SIZE_DIFF_CATEGORY = 8;
		SIZE_DIFF_FORMAT = 5;
		
		SIZE_SCALE = 51; %CET: Computational Efficiency Trick
		SIZE_SCALE_TAG = 'SIZE_SCALE';
		SIZE_SCALE_CATEGORY = 8;
		SIZE_SCALE_FORMAT = 11;
		
		COLOR_DIFF = 52; %CET: Computational Efficiency Trick
		COLOR_DIFF_TAG = 'COLOR_DIFF';
		COLOR_DIFF_CATEGORY = 8;
		COLOR_DIFF_FORMAT = 5;
		
		FDR = 53; %CET: Computational Efficiency Trick
		FDR_TAG = 'FDR';
		FDR_CATEGORY = 8;
		FDR_FORMAT = 5;
		
		QVALUE = 54; %CET: Computational Efficiency Trick
		QVALUE_TAG = 'QVALUE';
		QVALUE_CATEGORY = 8;
		QVALUE_FORMAT = 11;
	end
	methods % constructor
		function pf = ComparisonGroupBrainPF_NS(varargin)
			%ComparisonGroupBrainPF_NS() creates a panel nodal superglobal group comparison on brain surface figure.
			%
			% ComparisonGroupBrainPF_NS(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% ComparisonGroupBrainPF_NS(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of ComparisonGroupBrainPF_NS properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the class of the % % % .
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal group comparison on brain surface figure.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the figure brain atlas.
			%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel.
			%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel.
			%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.
			%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel.
			%  <strong>20</strong> <strong>ST_POSITION</strong> 	ST_POSITION (figure, item) determines the panel position.
			%  <strong>21</strong> <strong>H_TOOLBAR</strong> 	H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.
			%  <strong>22</strong> <strong>H_TOOLS</strong> 	H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.
			%  <strong>23</strong> <strong>H_AXES</strong> 	H_AXES (evanescent, handle) is the handle for the axes.
			%  <strong>24</strong> <strong>VIEW</strong> 	VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.
			%  <strong>25</strong> <strong>ST_AXIS</strong> 	ST_AXIS (figure, item) determines the axis settings.
			%  <strong>26</strong> <strong>LISTENER_ST_AXIS</strong> 	LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.
			%  <strong>27</strong> <strong>SURFFILE</strong> 	SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.
			%  <strong>28</strong> <strong>SURF</strong> 	SURF (metadata, item) is the brain surface to be plotted.
			%  <strong>29</strong> <strong>H_BRAIN</strong> 	H_BRAIN (evanescent, handle) is the handle for brain surface.
			%  <strong>30</strong> <strong>BRAIN</strong> 	BRAIN (figure, logical) determines whether the brain surface is shown.
			%  <strong>31</strong> <strong>ST_SURFACE</strong> 	ST_SURFACE (figure, item) determines the surface settings.
			%  <strong>32</strong> <strong>ST_AMBIENT</strong> 	ST_AMBIENT (figure, item) determines the ambient settings.
			%  <strong>33</strong> <strong>BA</strong> 	BA (metadata, item) is the brain atlas with the brain regions.
			%  <strong>34</strong> <strong>H_SPHS</strong> 	H_SPHS (evanescent, handlelist) is the set of handles for the spheres.
			%  <strong>35</strong> <strong>SPHS</strong> 	SPHS (figure, logical) determines whether the spheres are shown.
			%  <strong>36</strong> <strong>SPH_DICT</strong> 	SPH_DICT (figure, idict) contains the spheres of the brain regions.
			%  <strong>37</strong> <strong>H_SYMS</strong> 	H_SYMS (evanescent, handlelist) is the set of handles for the symbols.
			%  <strong>38</strong> <strong>SYMS</strong> 	SYMS (figure, logical) determines whether the symbols are shown.
			%  <strong>39</strong> <strong>SYM_DICT</strong> 	SYM_DICT (figure, idict) contains the symbols of the brain regions.
			%  <strong>40</strong> <strong>H_IDS</strong> 	H_IDS (evanescent, handlelist) is the set of handles for the ids.
			%  <strong>41</strong> <strong>IDS</strong> 	IDS (figure, logical) determines whether the ids are shown.
			%  <strong>42</strong> <strong>ID_DICT</strong> 	ID_DICT (figure, idict) contains the ids of the brain regions.
			%  <strong>43</strong> <strong>H_LABS</strong> 	H_LABS (evanescent, handlelist) is the set of handles for the labels.
			%  <strong>44</strong> <strong>LABS</strong> 	LABS (figure, logical) determines whether the labels are shown.
			%  <strong>45</strong> <strong>LAB_DICT</strong> 	LAB_DICT (figure, idict) contains the labels of the brain regions.
			%  <strong>46</strong> <strong>CP</strong> 	CP (metadata, item) is the group comparison on brain surface.
			%  <strong>47</strong> <strong>SETUP</strong> 	SETUP (query, empty) calculates the group comparison figure value and stores it.
			%  <strong>48</strong> <strong>NODE</strong> 	NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.
			%  <strong>49</strong> <strong>LAYER</strong> 	LAYER (figure, scalar) is the layer number of the nodal measure.
			%  <strong>50</strong> <strong>SIZE_DIFF</strong> 	SIZE_DIFF (figure, option) determines whether the difference is shown with size effect.
			%  <strong>51</strong> <strong>SIZE_SCALE</strong> 	SIZE_SCALE (figure, scalar) determines the scale of size effect.
			%  <strong>52</strong> <strong>COLOR_DIFF</strong> 	COLOR_DIFF (figure, option) determines whether the difference is shown with color effect.
			%  <strong>53</strong> <strong>FDR</strong> 	FDR (figure, option) determines whether the difference is shown with FDR correction.
			%  <strong>54</strong> <strong>QVALUE</strong> 	QVALUE (figure, scalar) determines the QVALUE for FDR correction.
			%
			% See also Category, Format.
			
			pf = pf@ComparisonGroupBrainPF(varargin{:});
		end
	end
	methods (Static) % inspection
		function pf_class = getClass()
			%GETCLASS returns the class of the panel nodal superglobal group comparison on brain surface figure.
			%
			% CLASS = ComparisonGroupBrainPF_NS.GETCLASS() returns the class 'ComparisonGroupBrainPF_NS'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel nodal superglobal group comparison on brain surface figure PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('ComparisonGroupBrainPF_NS') returns 'ComparisonGroupBrainPF_NS'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			
			pf_class = 'ComparisonGroupBrainPF_NS';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel nodal superglobal group comparison on brain surface figure.
			%
			% LIST = ComparisonGroupBrainPF_NS.GETSUBCLASSES() returns all subclasses of 'ComparisonGroupBrainPF_NS'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel nodal superglobal group comparison on brain surface figure PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('ComparisonGroupBrainPF_NS') returns all subclasses of 'ComparisonGroupBrainPF_NS'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'ComparisonGroupBrainPF_NS' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel nodal superglobal group comparison on brain surface figure.
			%
			% PROPS = ComparisonGroupBrainPF_NS.GETPROPS() returns the property list of panel nodal superglobal group comparison on brain surface figure
			%  as a row vector.
			%
			% PROPS = ComparisonGroupBrainPF_NS.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel nodal superglobal group comparison on brain surface figure PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('ComparisonGroupBrainPF_NS'[, CATEGORY]) returns the property list of 'ComparisonGroupBrainPF_NS'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 3];
				case 2 % Category.METADATA
					prop_list = [6 7 28 33 46];
				case 3 % Category.PARAMETER
					prop_list = 4;
				case 4 % Category.DATA
					prop_list = 5;
				case 6 % Category.QUERY
					prop_list = [8 11 12 16 17 18 19 47];
				case 7 % Category.EVANESCENT
					prop_list = [10 15 21 22 23 26 29 34 37 40 43];
				case 8 % Category.FIGURE
					prop_list = [14 20 24 25 27 30 31 32 35 36 38 39 41 42 44 45 48 49 50 51 52 53 54];
				case 9 % Category.GUI
					prop_list = [9 13];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel nodal superglobal group comparison on brain surface figure.
			%
			% N = ComparisonGroupBrainPF_NS.GETPROPNUMBER() returns the property number of panel nodal superglobal group comparison on brain surface figure.
			%
			% N = ComparisonGroupBrainPF_NS.GETPROPNUMBER(CATEGORY) returns the property number of panel nodal superglobal group comparison on brain surface figure
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel nodal superglobal group comparison on brain surface figure PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('ComparisonGroupBrainPF_NS') returns the property number of 'ComparisonGroupBrainPF_NS'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 54;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 3;
				case 2 % Category.METADATA
					prop_number = 5;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 8;
				case 7 % Category.EVANESCENT
					prop_number = 11;
				case 8 % Category.FIGURE
					prop_number = 23;
				case 9 % Category.GUI
					prop_number = 2;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel nodal superglobal group comparison on brain surface figure/error.
			%
			% CHECK = ComparisonGroupBrainPF_NS.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(ComparisonGroupBrainPF_NS, PROP) checks whether PROP exists for ComparisonGroupBrainPF_NS.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%  Element.EXISTSPROP(ComparisonGroupBrainPF_NS, PROP) throws error if PROP does NOT exist for ComparisonGroupBrainPF_NS.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 54 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for ComparisonGroupBrainPF_NS.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel nodal superglobal group comparison on brain surface figure/error.
			%
			% CHECK = ComparisonGroupBrainPF_NS.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(ComparisonGroupBrainPF_NS, TAG) checks whether TAG exists for ComparisonGroupBrainPF_NS.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%  Element.EXISTSTAG(ComparisonGroupBrainPF_NS, TAG) throws error if TAG does NOT exist for ComparisonGroupBrainPF_NS.
			%   Error id: [BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT'  'BA'  'H_SPHS'  'SPHS'  'SPH_DICT'  'H_SYMS'  'SYMS'  'SYM_DICT'  'H_IDS'  'IDS'  'ID_DICT'  'H_LABS'  'LABS'  'LAB_DICT'  'CP'  'SETUP'  'NODE'  'LAYER'  'SIZE_DIFF'  'SIZE_SCALE'  'COLOR_DIFF'  'FDR'  'QVALUE' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for ComparisonGroupBrainPF_NS.'] ...
					)
			end
		end
		function prop = getPropProp(pointer)
			%GETPROPPROP returns the property number of a property.
			%
			% PROP = Element.GETPROPPROP(PROP) returns PROP, i.e., the 
			%  property number of the property PROP.
			%
			% PROP = Element.GETPROPPROP(TAG) returns the property number 
			%  of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PROPERTY = PF.GETPROPPROP(POINTER) returns property number of POINTER of PF.
			%  PROPERTY = Element.GETPROPPROP(ComparisonGroupBrainPF_NS, POINTER) returns property number of POINTER of ComparisonGroupBrainPF_NS.
			%  PROPERTY = PF.GETPROPPROP(ComparisonGroupBrainPF_NS, POINTER) returns property number of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT'  'BA'  'H_SPHS'  'SPHS'  'SPH_DICT'  'H_SYMS'  'SYMS'  'SYM_DICT'  'H_IDS'  'IDS'  'ID_DICT'  'H_LABS'  'LABS'  'LAB_DICT'  'CP'  'SETUP'  'NODE'  'LAYER'  'SIZE_DIFF'  'SIZE_SCALE'  'COLOR_DIFF'  'FDR'  'QVALUE' })); % tag = pointer %CET: Computational Efficiency Trick
			else % numeric
				prop = pointer;
			end
		end
		function tag = getPropTag(pointer)
			%GETPROPTAG returns the tag of a property.
			%
			% TAG = Element.GETPROPTAG(PROP) returns the tag TAG of the 
			%  property PROP.
			%
			% TAG = Element.GETPROPTAG(TAG) returns TAG, i.e. the tag of 
			%  the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  TAG = PF.GETPROPTAG(POINTER) returns tag of POINTER of PF.
			%  TAG = Element.GETPROPTAG(ComparisonGroupBrainPF_NS, POINTER) returns tag of POINTER of ComparisonGroupBrainPF_NS.
			%  TAG = PF.GETPROPTAG(ComparisonGroupBrainPF_NS, POINTER) returns tag of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				comparisongroupbrainpf_ns_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'ST_POSITION'  'H_TOOLBAR'  'H_TOOLS'  'H_AXES'  'VIEW'  'ST_AXIS'  'LISTENER_ST_AXIS'  'SURFFILE'  'SURF'  'H_BRAIN'  'BRAIN'  'ST_SURFACE'  'ST_AMBIENT'  'BA'  'H_SPHS'  'SPHS'  'SPH_DICT'  'H_SYMS'  'SYMS'  'SYM_DICT'  'H_IDS'  'IDS'  'ID_DICT'  'H_LABS'  'LABS'  'LAB_DICT'  'CP'  'SETUP'  'NODE'  'LAYER'  'SIZE_DIFF'  'SIZE_SCALE'  'COLOR_DIFF'  'FDR'  'QVALUE' };
				tag = comparisongroupbrainpf_ns_tag_list{pointer}; % prop = pointer
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the category of the
			%  property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the category of the
			%  property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = PF.GETPROPCATEGORY(POINTER) returns category of POINTER of PF.
			%  CATEGORY = Element.GETPROPCATEGORY(ComparisonGroupBrainPF_NS, POINTER) returns category of POINTER of ComparisonGroupBrainPF_NS.
			%  CATEGORY = PF.GETPROPCATEGORY(ComparisonGroupBrainPF_NS, POINTER) returns category of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongroupbrainpf_ns_category_list = { 1  1  1  3  4  2  2  6  9  7  6  6  9  8  7  6  6  6  6  8  7  7  7  8  8  7  8  2  7  8  8  8  2  7  8  8  7  8  8  7  8  8  7  8  8  2  6  8  8  8  8  8  8  8 };
			prop_category = comparisongroupbrainpf_ns_category_list{prop};
		end
		function prop_format = getPropFormat(pointer)
			%GETPROPFORMAT returns the format of a property.
			%
			% FORMAT = Element.GETPROPFORMAT(PROP) returns the
			%  format of the property PROP.
			%
			% FORMAT = Element.GETPROPFORMAT(TAG) returns the
			%  format of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  FORMAT = PF.GETPROPFORMAT(POINTER) returns format of POINTER of PF.
			%  FORMAT = Element.GETPROPFORMAT(ComparisonGroupBrainPF_NS, POINTER) returns format of POINTER of ComparisonGroupBrainPF_NS.
			%  FORMAT = PF.GETPROPFORMAT(ComparisonGroupBrainPF_NS, POINTER) returns format of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongroupbrainpf_ns_format_list = { 2  2  2  8  2  2  2  2  4  18  4  4  8  20  18  4  4  4  4  8  18  19  18  12  8  18  5  8  18  4  8  8  8  19  4  10  19  4  10  19  4  10  19  4  10  8  1  11  11  5  11  5  5  11 };
			prop_format = comparisongroupbrainpf_ns_format_list{prop};
		end
		function prop_description = getPropDescription(pointer)
			%GETPROPDESCRIPTION returns the description of a property.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(PROP) returns the
			%  description of the property PROP.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(TAG) returns the
			%  description of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PF.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(ComparisonGroupBrainPF_NS, POINTER) returns description of POINTER of ComparisonGroupBrainPF_NS.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(ComparisonGroupBrainPF_NS, POINTER) returns description of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			comparisongroupbrainpf_ns_description_list = { 'ELCLASS (constant, string) is the class of the % % % .'  'NAME (constant, string) is the name of the panel figure nodal superglobal group comparison on brain surface figure.'  'DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal group comparison on brain surface figure.'  'TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal group comparison on brain surface figure.'  'ID (data, string) is a few-letter code for the panel figure nodal superglobal group comparison on brain surface figure.'  'LABEL (metadata, string) is an extended label of the panel figure nodal superglobal group comparison on brain surface figure.'  'NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal group comparison on brain surface figure.'  'TOSTRING (query, string) returns a string that represents the object.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the figure brain atlas.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel.'  'HIDE (query, logical) hides the figure containing the panel.'  'DELETE (query, logical) resets the handles when the panel figure brain surface is deleted.'  'CLOSE (query, logical) closes the figure containing the panel.'  'ST_POSITION (figure, item) determines the panel position.'  'H_TOOLBAR (evanescent, handle) returns the handle of the toolbar.'  'H_TOOLS (evanescent, handlelist) is the list of panel-specific tools from the first.'  'H_AXES (evanescent, handle) is the handle for the axes.'  'VIEW (figure, rvector) sets the desired view as the line-of-sight azimuth and elevation angles.'  'ST_AXIS (figure, item) determines the axis settings.'  'LISTENER_ST_AXIS (evanescent, handle) contains the listener to the axis settings to update the pushbuttons.'  'SURFFILE (figure, option) is the name of the file of the brain surface to be plotted.'  'SURF (metadata, item) is the brain surface to be plotted.'  'H_BRAIN (evanescent, handle) is the handle for brain surface.'  'BRAIN (figure, logical) determines whether the brain surface is shown.'  'ST_SURFACE (figure, item) determines the surface settings.'  'ST_AMBIENT (figure, item) determines the ambient settings.'  'BA (metadata, item) is the brain atlas with the brain regions.'  'H_SPHS (evanescent, handlelist) is the set of handles for the spheres.'  'SPHS (figure, logical) determines whether the spheres are shown.'  'SPH_DICT (figure, idict) contains the spheres of the brain regions.'  'H_SYMS (evanescent, handlelist) is the set of handles for the symbols.'  'SYMS (figure, logical) determines whether the symbols are shown.'  'SYM_DICT (figure, idict) contains the symbols of the brain regions.'  'H_IDS (evanescent, handlelist) is the set of handles for the ids.'  'IDS (figure, logical) determines whether the ids are shown.'  'ID_DICT (figure, idict) contains the ids of the brain regions.'  'H_LABS (evanescent, handlelist) is the set of handles for the labels.'  'LABS (figure, logical) determines whether the labels are shown.'  'LAB_DICT (figure, idict) contains the labels of the brain regions.'  'CP (metadata, item) is the group comparison on brain surface.'  'SETUP (query, empty) calculates the group comparison figure value and stores it.'  'NODE (figure, scalar) is the node number of the nodal group comparison on brain surface figure.'  'LAYER (figure, scalar) is the layer number of the nodal measure.'  'SIZE_DIFF (figure, option) determines whether the difference is shown with size effect.'  'SIZE_SCALE (figure, scalar) determines the scale of size effect.'  'COLOR_DIFF (figure, option) determines whether the difference is shown with color effect.'  'FDR (figure, option) determines whether the difference is shown with FDR correction.'  'QVALUE (figure, scalar) determines the QVALUE for FDR correction.' };
			prop_description = comparisongroupbrainpf_ns_description_list{prop};
		end
		function prop_settings = getPropSettings(pointer)
			%GETPROPSETTINGS returns the settings of a property.
			%
			% SETTINGS = Element.GETPROPSETTINGS(PROP) returns the
			%  settings of the property PROP.
			%
			% SETTINGS = Element.GETPROPSETTINGS(TAG) returns the
			%  settings of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SETTINGS = PF.GETPROPSETTINGS(POINTER) returns settings of POINTER of PF.
			%  SETTINGS = Element.GETPROPSETTINGS(ComparisonGroupBrainPF_NS, POINTER) returns settings of POINTER of ComparisonGroupBrainPF_NS.
			%  SETTINGS = PF.GETPROPSETTINGS(ComparisonGroupBrainPF_NS, POINTER) returns settings of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 48 % ComparisonGroupBrainPF_NS.NODE
					prop_settings = Format.getFormatSettings(11);
				case 49 % ComparisonGroupBrainPF_NS.LAYER
					prop_settings = Format.getFormatSettings(11);
				case 50 % ComparisonGroupBrainPF_NS.SIZE_DIFF
					prop_settings = {'on' 'off' 'disable'};
				case 51 % ComparisonGroupBrainPF_NS.SIZE_SCALE
					prop_settings = Format.getFormatSettings(11);
				case 52 % ComparisonGroupBrainPF_NS.COLOR_DIFF
					prop_settings = {'on' 'off' 'disable'};
				case 53 % ComparisonGroupBrainPF_NS.FDR
					prop_settings = {'on' 'off' 'disable'};
				case 54 % ComparisonGroupBrainPF_NS.QVALUE
					prop_settings = Format.getFormatSettings(11);
				case 4 % ComparisonGroupBrainPF_NS.TEMPLATE
					prop_settings = 'ComparisonGroupBrainPF_NS';
				otherwise
					prop_settings = getPropSettings@ComparisonGroupBrainPF(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = ComparisonGroupBrainPF_NS.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonGroupBrainPF_NS.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(ComparisonGroupBrainPF_NS, POINTER) returns the default value of POINTER of ComparisonGroupBrainPF_NS.
			%  DEFAULT = PF.GETPROPDEFAULT(ComparisonGroupBrainPF_NS, POINTER) returns the default value of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 48 % ComparisonGroupBrainPF_NS.NODE
					prop_default = Format.getFormatDefault(11, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 49 % ComparisonGroupBrainPF_NS.LAYER
					prop_default = 1;
				case 50 % ComparisonGroupBrainPF_NS.SIZE_DIFF
					prop_default = 'on';
				case 51 % ComparisonGroupBrainPF_NS.SIZE_SCALE
					prop_default = 5;
				case 52 % ComparisonGroupBrainPF_NS.COLOR_DIFF
					prop_default = 'on';
				case 53 % ComparisonGroupBrainPF_NS.FDR
					prop_default = 'off';
				case 54 % ComparisonGroupBrainPF_NS.QVALUE
					prop_default = 0.05;
				case 1 % ComparisonGroupBrainPF_NS.ELCLASS
					prop_default = 'ComparisonGroupBrainPF_NS';
				case 2 % ComparisonGroupBrainPF_NS.NAME
					prop_default = 'ComparisonGroupBrainPF_NS';
				case 3 % ComparisonGroupBrainPF_NS.DESCRIPTION
					prop_default = 'ComparisonGroupBrainPF_NS manages the basic functionalities to plot of a nodal superglobal group comparison on brain surface figure.';
				case 4 % ComparisonGroupBrainPF_NS.TEMPLATE
					prop_default = Format.getFormatDefault(8, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 5 % ComparisonGroupBrainPF_NS.ID
					prop_default = 'ComparisonGroupBrainPF_NS ID';
				case 6 % ComparisonGroupBrainPF_NS.LABEL
					prop_default = 'ComparisonGroupBrainPF_NS label';
				case 7 % ComparisonGroupBrainPF_NS.NOTES
					prop_default = 'ComparisonGroupBrainPF_NS notes';
				otherwise
					prop_default = getPropDefault@ComparisonGroupBrainPF(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = ComparisonGroupBrainPF_NS.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonGroupBrainPF_NS.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(ComparisonGroupBrainPF_NS, POINTER) returns the conditioned default value of POINTER of ComparisonGroupBrainPF_NS.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(ComparisonGroupBrainPF_NS, POINTER) returns the conditioned default value of POINTER of ComparisonGroupBrainPF_NS.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			prop_default = ComparisonGroupBrainPF_NS.conditioning(prop, ComparisonGroupBrainPF_NS.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PF.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PF.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PF.
			%  CHECK = Element.CHECKPROP(ComparisonGroupBrainPF_NS, PROP, VALUE) checks VALUE format for PROP of ComparisonGroupBrainPF_NS.
			%  CHECK = PF.CHECKPROP(ComparisonGroupBrainPF_NS, PROP, VALUE) checks VALUE format for PROP of ComparisonGroupBrainPF_NS.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:ComparisonGroupBrainPF_NS:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: BRAPH2:ComparisonGroupBrainPF_NS:WrongInput
			%  Element.CHECKPROP(ComparisonGroupBrainPF_NS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonGroupBrainPF_NS.
			%   Error id: BRAPH2:ComparisonGroupBrainPF_NS:WrongInput
			%  PF.CHECKPROP(ComparisonGroupBrainPF_NS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonGroupBrainPF_NS.
			%   Error id: BRAPH2:ComparisonGroupBrainPF_NS:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('ComparisonGroupBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = ComparisonGroupBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case 48 % ComparisonGroupBrainPF_NS.NODE
					check = Format.checkFormat(11, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 49 % ComparisonGroupBrainPF_NS.LAYER
					check = Format.checkFormat(11, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 50 % ComparisonGroupBrainPF_NS.SIZE_DIFF
					check = Format.checkFormat(5, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 51 % ComparisonGroupBrainPF_NS.SIZE_SCALE
					check = Format.checkFormat(11, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 52 % ComparisonGroupBrainPF_NS.COLOR_DIFF
					check = Format.checkFormat(5, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 53 % ComparisonGroupBrainPF_NS.FDR
					check = Format.checkFormat(5, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 54 % ComparisonGroupBrainPF_NS.QVALUE
					check = Format.checkFormat(11, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				case 4 % ComparisonGroupBrainPF_NS.TEMPLATE
					check = Format.checkFormat(8, value, ComparisonGroupBrainPF_NS.getPropSettings(prop));
				otherwise
					if prop <= 47
						check = checkProp@ComparisonGroupBrainPF(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput'], ...
					['BRAPH2' ':ComparisonGroupBrainPF_NS:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' ComparisonGroupBrainPF_NS.getPropTag(prop) ' (' ComparisonGroupBrainPF_NS.getFormatTag(ComparisonGroupBrainPF_NS.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % postset
		function postset(pf, prop)
			%POSTSET postprocessing after a prop has been set.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing after PROP has been set. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% This postprocessing occurs only when PROP is set.
			%
			% See also conditioning, preset, checkProp, postprocessing, calculateValue,
			%  checkValue.
			
			switch prop
				case 49 % ComparisonGroupBrainPF_NS.LAYER
					pf.get('SETUP');
					
				case 50 % ComparisonGroupBrainPF_NS.SIZE_DIFF
					pf.get('SETUP');
					
				case 51 % ComparisonGroupBrainPF_NS.SIZE_SCALE
					pf.get('SETUP');
					
				case 52 % ComparisonGroupBrainPF_NS.COLOR_DIFF
					pf.get('SETUP');
					
				case 53 % ComparisonGroupBrainPF_NS.FDR
					pf.get('SETUP');
					
				case 54 % ComparisonGroupBrainPF_NS.QVALUE
					pf.get('CP').set('QVALUE', pf.get('QVALUE'));
					pf.get('SETUP');
					
				otherwise
					if prop <= 47
						postset@ComparisonGroupBrainPF(pf, prop);
					end
			end
		end
	end
	methods (Access=protected) % postprocessing
		function postprocessing(pf, prop)
			%POSTPROCESSING postprocessesing after setting.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing of PROP after setting. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% The postprocessing of all properties occurs each time set is called.
			%
			% See also conditioning, preset, checkProp, postset, calculateValue,
			%  checkValue.
			
			switch prop
				case 54 % ComparisonGroupBrainPF_NS.QVALUE
					if isempty(pf.get('QVALUE'))
					    pf.set('QVALUE', pf.get('CP').get('QVALUE'));
					end
					
				otherwise
					if prop <= 47
						postprocessing@ComparisonGroupBrainPF(pf, prop);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pf, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case 11 % ComparisonGroupBrainPF_NS.DRAW
					value = calculateValue@ComparisonGroupBrainPF(pf, 11, varargin{:}); % also warning
					if value
					    % reset the ambient lighting
					    pf.get('ST_AMBIENT').get('SETUP')
					
					    % call setup
					    pf.get('SETUP');
					end
					
				case 18 % ComparisonGroupBrainPF_NS.DELETE
					value = calculateValue@ComparisonGroupBrainPF(pf, 18, varargin{:}); % also warning
					if value
					
					end
					
				case 47 % ComparisonGroupBrainPF_NS.SETUP
					cp = pf.get('CP');
					g = cp.get('C').get('A1').get('G');
					
					% get brain region related list
					sph_list = pf.get('SPH_DICT').get('IT_LIST');
					sym_list = pf.get('SYM_DICT').get('IT_LIST');
					id_list = pf.get('ID_DICT').get('IT_LIST');
					lab_list = pf.get('LAB_DICT').get('IT_LIST');
					
					% get the value to show on the surface
					layer = pf.get('LAYER');
					diffs = cp.get('DIFF');
					if isempty(diffs)
					    value = {};
					    return
					end
					diff = diffs{layer};
					p2s = cp.get('P2');
					p2 = p2s{layer};
					
					% apply FDR to spheres, symbols, ids, and labels
					fdr_diff = pf.get('FDR');
					switch fdr_diff
					    case 'on'
					        [~, mask] = fdr(p2', pf.get('QVALUE'));
					        for i = 1:1:length(sph_list)
					            set(sph_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(sym_list)
					            set(sym_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(id_list)
					            set(id_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(lab_list)
					            set(lab_list{i}, 'VISIBLE', mask(i));
					        end
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('SYMS')
					            for i = 1:1:length(sym_list)
					                set(sym_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('IDS')
					            for i = 1:1:length(id_list)
					                set(id_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('LABS')
					            for i = 1:1:length(lab_list)
					                set(lab_list{i}, 'VISIBLE', true);
					            end
					        end
					    case 'disable'
					end
					
					size_diff = pf.get('SIZE_DIFF');
					switch size_diff
					    case 'on'
					        % transfrom diff value to appropriate size
					        % value ranching from 0.01 to 1
					        diff(isnan(diff)) = 0.1;
					        size_value = abs(diff);
					        min_bound = 0.01;
					        max_bound = 1.0;
					        min_size_value = min(size_value);
					        max_size_value = max(size_value);
					        if max_size_value == min_size_value
					            normalized_size_value = ones(size(size_value)) * max_bound;
					        else
					            normalized_size_value = min_bound + (max_bound - min_bound) * (size_value - min_size_value) / (max_size_value - min_size_value);
					        end
					        size_scale = pf.get('SIZE_SCALE');
					        scaled_size_value = normalized_size_value * size_scale;
					
					        % set size to sphs
					        for i = 1:1:length(sph_list)
					            set(sph_list{i}, 'SPHERESIZE', scaled_size_value(i));
					        end
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'SPHERESIZE', SettingsSphere.getPropDefault('SPHERESIZE'));
					            end
					        end
					    case 'disable'
					end
					
					color_diff = pf.get('COLOR_DIFF');
					switch color_diff
					    case 'on'
					        % transfrom diff value to appropriate color
					        % code
					        color_code_list = cell(size(diff));
					
					        for i = 1:numel(color_code_list)
					            if diff(i) > 0
					                color_code_list{i} = [1 0 0]; % Red
					            elseif diff(i) < 0
					                color_code_list{i} = [0 0 1]; % Blue
					            else
					                color_code_list{i} = [0 0 0]; % Black (or any other color for zero)
					            end
					        end
					
					        % set color to sphs
					        cellfun(@(sph, color_code) set(sph, 'FACECOLOR', color_code), sph_list, color_code_list', 'UniformOutput', false);
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'FACECOLOR', SettingsSphere.getPropDefault('FACECOLOR'));
					            end
					        end
					    case 'disable'
					end
					
					value = [];
					
				otherwise
					if prop <= 47
						value = calculateValue@ComparisonGroupBrainPF(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
		end
	end
	methods % GUI
		function pr = getPanelProp(pf, prop, varargin)
			%GETPANELPROP returns a prop panel.
			%
			% PR = GETPANELPROP(EL, PROP) returns the panel of prop PROP.
			%
			% PR = GETPANELPROP(EL, PROP, 'Name', Value, ...) sets the properties 
			%  of the panel prop.
			%
			% See also PanelProp, PanelPropAlpha, PanelPropCell, PanelPropClass,
			%  PanelPropClassList, PanelPropColor, PanelPropHandle,
			%  PanelPropHandleList, PanelPropIDict, PanelPropItem, PanelPropLine,
			%  PanelPropItemList, PanelPropLogical, PanelPropMarker, PanelPropMatrix,
			%  PanelPropNet, PanelPropOption, PanelPropScalar, PanelPropSize,
			%  PanelPropString, PanelPropStringList.
			
			switch prop
				case 48 % ComparisonGroupBrainPF_NS.NODE
					pr = ComparisonGroupPF_NxPP_Node('EL', pf, 'PROP', 48);
					
				otherwise
					pr = getPanelProp@ComparisonGroupBrainPF(pf, prop, varargin{:});
					
			end
		end
	end
end
