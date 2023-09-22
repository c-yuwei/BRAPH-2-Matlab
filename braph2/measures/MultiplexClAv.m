classdef MultiplexClAv < MultiplexCl
	%MultiplexClAv is the graph average multiplex clustering.
	% It is a subclass of <a href="matlab:help MultiplexCl">MultiplexCl</a>.
	%
	% The average multiplex clustering coefficient of a multilayer graph is 
	%   the average of the two-multiplex clustering coefficients of all nodes.
	%
	% The list of MultiplexClAv properties is:
	%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the average multiplex clustering.
	%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the average multiplex clustering.
	%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the average multiplex clustering.
	%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the average multiplex clustering.
	%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the average multiplex clustering.
	%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the average multiplex clustering.
	%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>8</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
	%  <strong>9</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
	%  <strong>10</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
	%  <strong>11</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
	%  <strong>12</strong> <strong>G</strong> 	G (data, item) is the measure graph.
	%  <strong>13</strong> <strong>M</strong> 	M (result, cell) is the average multiplex clustering.
	%  <strong>14</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
	%
	% MultiplexClAv methods (constructor):
	%  MultiplexClAv - constructor
	%
	% MultiplexClAv methods:
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
	% MultiplexClAv methods (display):
	%  tostring - string with information about the average multiplex clustering
	%  disp - displays information about the average multiplex clustering
	%  tree - displays the tree of the average multiplex clustering
	%
	% MultiplexClAv methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two average multiplex clustering are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the average multiplex clustering
	%
	% MultiplexClAv methods (save/load, Static):
	%  save - saves BRAPH2 average multiplex clustering as b2 file
	%  load - loads a BRAPH2 average multiplex clustering from a b2 file
	%
	% MultiplexClAv method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the average multiplex clustering
	%
	% MultiplexClAv method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the average multiplex clustering
	%
	% MultiplexClAv methods (inspection, Static):
	%  getClass - returns the class of the average multiplex clustering
	%  getSubclasses - returns all subclasses of MultiplexClAv
	%  getProps - returns the property list of the average multiplex clustering
	%  getPropNumber - returns the property number of the average multiplex clustering
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
	% MultiplexClAv methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% MultiplexClAv methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% MultiplexClAv methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% MultiplexClAv methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?MultiplexClAv; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">MultiplexClAv constants</a>.
	%
	
	methods % constructor
		function m = MultiplexClAv(varargin)
			%MultiplexClAv() creates a average multiplex clustering.
			%
			% MultiplexClAv(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% MultiplexClAv(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of MultiplexClAv properties is:
			%  <strong>1</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the average multiplex clustering.
			%  <strong>2</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the average multiplex clustering.
			%  <strong>3</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the average multiplex clustering.
			%  <strong>4</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code of the average multiplex clustering.
			%  <strong>5</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the average multiplex clustering.
			%  <strong>6</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the average multiplex clustering.
			%  <strong>7</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>8</strong> <strong>SHAPE</strong> 	SHAPE (constant, scalar) is the measure shape Measure.NODAL.
			%  <strong>9</strong> <strong>SCOPE</strong> 	SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.
			%  <strong>10</strong> <strong>PARAMETRICITY</strong> 	PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.
			%  <strong>11</strong> <strong>COMPATIBLE_GRAPHS</strong> 	COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
			%  <strong>12</strong> <strong>G</strong> 	G (data, item) is the measure graph.
			%  <strong>13</strong> <strong>M</strong> 	M (result, cell) is the average multiplex clustering.
			%  <strong>14</strong> <strong>PFM</strong> 	PFM (gui, item) contains the panel figure of the measure.
			%
			% See also Category, Format.
			
			m = m@MultiplexCl(varargin{:});
		end
	end
	methods (Static) % inspection
		function m_class = getClass()
			%GETCLASS returns the class of the average multiplex clustering.
			%
			% CLASS = MultiplexClAv.GETCLASS() returns the class 'MultiplexClAv'.
			%
			% Alternative forms to call this method are:
			%  CLASS = M.GETCLASS() returns the class of the average multiplex clustering M.
			%  CLASS = Element.GETCLASS(M) returns the class of 'M'.
			%  CLASS = Element.GETCLASS('MultiplexClAv') returns 'MultiplexClAv'.
			%
			% Note that the Element.GETCLASS(M) and Element.GETCLASS('MultiplexClAv')
			%  are less computationally efficient.
			
			m_class = 'MultiplexClAv';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the average multiplex clustering.
			%
			% LIST = MultiplexClAv.GETSUBCLASSES() returns all subclasses of 'MultiplexClAv'.
			%
			% Alternative forms to call this method are:
			%  LIST = M.GETSUBCLASSES() returns all subclasses of the average multiplex clustering M.
			%  LIST = Element.GETSUBCLASSES(M) returns all subclasses of 'M'.
			%  LIST = Element.GETSUBCLASSES('MultiplexClAv') returns all subclasses of 'MultiplexClAv'.
			%
			% Note that the Element.GETSUBCLASSES(M) and Element.GETSUBCLASSES('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'MultiplexClAv' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of average multiplex clustering.
			%
			% PROPS = MultiplexClAv.GETPROPS() returns the property list of average multiplex clustering
			%  as a row vector.
			%
			% PROPS = MultiplexClAv.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = M.GETPROPS([CATEGORY]) returns the property list of the average multiplex clustering M.
			%  PROPS = Element.GETPROPS(M[, CATEGORY]) returns the property list of 'M'.
			%  PROPS = Element.GETPROPS('MultiplexClAv'[, CATEGORY]) returns the property list of 'MultiplexClAv'.
			%
			% Note that the Element.GETPROPS(M) and Element.GETPROPS('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 8 9 10 11];
				case 2 % Category.METADATA
					prop_list = [5 6];
				case 3 % Category.PARAMETER
					prop_list = 3;
				case 4 % Category.DATA
					prop_list = [4 12];
				case 5 % Category.RESULT
					prop_list = 13;
				case 6 % Category.QUERY
					prop_list = 7;
				case 9 % Category.GUI
					prop_list = 14;
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of average multiplex clustering.
			%
			% N = MultiplexClAv.GETPROPNUMBER() returns the property number of average multiplex clustering.
			%
			% N = MultiplexClAv.GETPROPNUMBER(CATEGORY) returns the property number of average multiplex clustering
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = M.GETPROPNUMBER([CATEGORY]) returns the property number of the average multiplex clustering M.
			%  N = Element.GETPROPNUMBER(M) returns the property number of 'M'.
			%  N = Element.GETPROPNUMBER('MultiplexClAv') returns the property number of 'MultiplexClAv'.
			%
			% Note that the Element.GETPROPNUMBER(M) and Element.GETPROPNUMBER('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 14;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 6;
				case 2 % Category.METADATA
					prop_number = 2;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 2;
				case 5 % Category.RESULT
					prop_number = 1;
				case 6 % Category.QUERY
					prop_number = 1;
				case 9 % Category.GUI
					prop_number = 1;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in average multiplex clustering/error.
			%
			% CHECK = MultiplexClAv.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSPROP(PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(M, PROP) checks whether PROP exists for M.
			%  CHECK = Element.EXISTSPROP(MultiplexClAv, PROP) checks whether PROP exists for MultiplexClAv.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSPROP(PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%  Element.EXISTSPROP(M, PROP) throws error if PROP does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%  Element.EXISTSPROP(MultiplexClAv, PROP) throws error if PROP does NOT exist for MultiplexClAv.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%
			% Note that the Element.EXISTSPROP(M) and Element.EXISTSPROP('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 14 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput'], ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for MultiplexClAv.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in average multiplex clustering/error.
			%
			% CHECK = MultiplexClAv.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = M.EXISTSTAG(TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(M, TAG) checks whether TAG exists for M.
			%  CHECK = Element.EXISTSTAG(MultiplexClAv, TAG) checks whether TAG exists for MultiplexClAv.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%
			% Alternative forms to call this method are:
			%  M.EXISTSTAG(TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%  Element.EXISTSTAG(M, TAG) throws error if TAG does NOT exist for M.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%  Element.EXISTSTAG(MultiplexClAv, TAG) throws error if TAG does NOT exist for MultiplexClAv.
			%   Error id: [BRAPH2:MultiplexClAv:WrongInput]
			%
			% Note that the Element.EXISTSTAG(M) and Element.EXISTSTAG('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput'], ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for MultiplexClAv.'] ...
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
			%  PROPERTY = M.GETPROPPROP(POINTER) returns property number of POINTER of M.
			%  PROPERTY = Element.GETPROPPROP(MultiplexClAv, POINTER) returns property number of POINTER of MultiplexClAv.
			%  PROPERTY = M.GETPROPPROP(MultiplexClAv, POINTER) returns property number of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPPROP(M) and Element.GETPROPPROP('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = M.GETPROPTAG(POINTER) returns tag of POINTER of M.
			%  TAG = Element.GETPROPTAG(MultiplexClAv, POINTER) returns tag of POINTER of MultiplexClAv.
			%  TAG = M.GETPROPTAG(MultiplexClAv, POINTER) returns tag of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPTAG(M) and Element.GETPROPTAG('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				multiplexclav_tag_list = { 'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'SHAPE'  'SCOPE'  'PARAMETRICITY'  'COMPATIBLE_GRAPHS'  'G'  'M'  'PFM' };
				tag = multiplexclav_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = M.GETPROPCATEGORY(POINTER) returns category of POINTER of M.
			%  CATEGORY = Element.GETPROPCATEGORY(MultiplexClAv, POINTER) returns category of POINTER of MultiplexClAv.
			%  CATEGORY = M.GETPROPCATEGORY(MultiplexClAv, POINTER) returns category of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPCATEGORY(M) and Element.GETPROPCATEGORY('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			multiplexclav_category_list = { 1  1  3  4  2  2  6  1  1  1  1  4  5  9 };
			prop_category = multiplexclav_category_list{prop};
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
			%  FORMAT = M.GETPROPFORMAT(POINTER) returns format of POINTER of M.
			%  FORMAT = Element.GETPROPFORMAT(MultiplexClAv, POINTER) returns format of POINTER of MultiplexClAv.
			%  FORMAT = M.GETPROPFORMAT(MultiplexClAv, POINTER) returns format of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPFORMAT(M) and Element.GETPROPFORMAT('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			multiplexclav_format_list = { 2  2  8  2  2  2  2  11  11  11  7  8  16  8 };
			prop_format = multiplexclav_format_list{prop};
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
			%  DESCRIPTION = M.GETPROPDESCRIPTION(POINTER) returns description of POINTER of M.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(MultiplexClAv, POINTER) returns description of POINTER of MultiplexClAv.
			%  DESCRIPTION = M.GETPROPDESCRIPTION(MultiplexClAv, POINTER) returns description of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPDESCRIPTION(M) and Element.GETPROPDESCRIPTION('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			multiplexclav_description_list = { 'NAME (constant, string) is the name of the average multiplex clustering.'  'DESCRIPTION (constant, string) is the description of the average multiplex clustering.'  'TEMPLATE (parameter, item) is the template of the average multiplex clustering.'  'ID (data, string) is a few-letter code of the average multiplex clustering.'  'LABEL (metadata, string) is an extended label of the average multiplex clustering.'  'NOTES (metadata, string) are some specific notes about the average multiplex clustering.'  'TOSTRING (query, string) returns a string that represents the object.'  'SHAPE (constant, scalar) is the measure shape Measure.NODAL.'  'SCOPE (constant, scalar) is the measure scope Measure.UNILAYER.'  'PARAMETRICITY (constant, scalar) is the parametricity of the measure Measure.NONPARAMETRIC.'  'COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.'  'G (data, item) is the measure graph.'  'M (result, cell) is the average multiplex clustering.'  'PFM (gui, item) contains the panel figure of the measure.' };
			prop_description = multiplexclav_description_list{prop};
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
			%  SETTINGS = M.GETPROPSETTINGS(POINTER) returns settings of POINTER of M.
			%  SETTINGS = Element.GETPROPSETTINGS(MultiplexClAv, POINTER) returns settings of POINTER of MultiplexClAv.
			%  SETTINGS = M.GETPROPSETTINGS(MultiplexClAv, POINTER) returns settings of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPSETTINGS(M) and Element.GETPROPSETTINGS('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 3 % MultiplexClAv.TEMPLATE
					prop_settings = 'MultiplexClAv';
				otherwise
					prop_settings = getPropSettings@MultiplexCl(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = MultiplexClAv.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClAv.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULT(POINTER) returns the default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULT(MultiplexClAv, POINTER) returns the default value of POINTER of MultiplexClAv.
			%  DEFAULT = M.GETPROPDEFAULT(MultiplexClAv, POINTER) returns the default value of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPDEFAULT(M) and Element.GETPROPDEFAULT('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 1 % MultiplexClAv.NAME
					prop_default = 'MultiplexClAv';
				case 2 % MultiplexClAv.DESCRIPTION
					prop_default = 'The average multiplex clustering coefficient of a multilayer graph is the average of the two-multiplex clustering coefficients of all nodes.';
				case 3 % MultiplexClAv.TEMPLATE
					prop_default = Format.getFormatDefault(8, MultiplexClAv.getPropSettings(prop));
				case 4 % MultiplexClAv.ID
					prop_default = 'MultiplexClAv ID';
				case 5 % MultiplexClAv.LABEL
					prop_default = 'MultiplexClAv label';
				case 6 % MultiplexClAv.NOTES
					prop_default = 'MultiplexClAv notes';
				case 8 % MultiplexClAv.SHAPE
					prop_default = 1;
				case 9 % MultiplexClAv.SCOPE
					prop_default = 1;
				case 10 % MultiplexClAv.PARAMETRICITY
					prop_default = 2;
				case 11 % MultiplexClAv.COMPATIBLE_GRAPHS
					prop_default = {'MultiplexWU' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'OrdMxWU'};;
				otherwise
					prop_default = getPropDefault@MultiplexCl(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = MultiplexClAv.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = MultiplexClAv.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of M.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(MultiplexClAv, POINTER) returns the conditioned default value of POINTER of MultiplexClAv.
			%  DEFAULT = M.GETPROPDEFAULTCONDITIONED(MultiplexClAv, POINTER) returns the conditioned default value of POINTER of MultiplexClAv.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(M) and Element.GETPROPDEFAULTCONDITIONED('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			prop_default = MultiplexClAv.conditioning(prop, MultiplexClAv.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = M.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = M.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of M.
			%  CHECK = Element.CHECKPROP(MultiplexClAv, PROP, VALUE) checks VALUE format for PROP of MultiplexClAv.
			%  CHECK = M.CHECKPROP(MultiplexClAv, PROP, VALUE) checks VALUE format for PROP of MultiplexClAv.
			% 
			% M.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:MultiplexClAv:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  M.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of M.
			%   Error id: BRAPH2:MultiplexClAv:WrongInput
			%  Element.CHECKPROP(MultiplexClAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClAv.
			%   Error id: BRAPH2:MultiplexClAv:WrongInput
			%  M.CHECKPROP(MultiplexClAv, PROP, VALUE) throws error if VALUE has not a valid format for PROP of MultiplexClAv.
			%   Error id: BRAPH2:MultiplexClAv:WrongInput]
			% 
			% Note that the Element.CHECKPROP(M) and Element.CHECKPROP('MultiplexClAv')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = MultiplexClAv.getPropProp(pointer);
			
			switch prop
				case 3 % MultiplexClAv.TEMPLATE
					check = Format.checkFormat(8, value, MultiplexClAv.getPropSettings(prop));
				otherwise
					if prop <= 14
						check = checkProp@MultiplexCl(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput'], ...
					['BRAPH2' ':MultiplexClAv:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' MultiplexClAv.getPropTag(prop) ' (' MultiplexClAv.getFormatTag(MultiplexClAv.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(m, prop, varargin)
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
				case 13 % MultiplexClAv.M
					rng_settings_ = rng(); rng(m.getPropSeed(13), 'twister')
					
					g = m.get('G'); % graph from measure class
					A = g.get('A'); % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.)
					l = g.get('LAYERNUMBER');
					ls = g.get('PARTITIONS');
					
					if l == 0
					    value = {};
					else
					    multiplex_clustering = calculateValue@MultiplexCl(m, prop);
					    multiplex_clustering_av = cell(length(ls), 1);
					
					    for i=1:length(ls)
					        multiplex_clustering_av(i) = {mean(multiplex_clustering{i})};
					    end
					    value = multiplex_clustering_av;
					end
					
					rng(rng_settings_)
					
				otherwise
					if prop <= 14
						value = calculateValue@MultiplexCl(m, prop, varargin{:});
					else
						value = calculateValue@Element(m, prop, varargin{:});
					end
			end
			
		end
	end
end