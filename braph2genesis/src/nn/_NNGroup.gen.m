%% ¡header!
NNGroup < Group (gr, group of subjects) is a group of subjects.

%%% ¡description!
Group represents a group of subjects whose class is defined in the property SUB_CLASS.
Group provides the methods necessary to handle groups of subjects. 
It manages the subjects as an indexed dictionary of subjects SUB_DICT, 
whose methods can be used to inspect, add or remove subjects.

%%% ¡seealso!
Element, Subject, IndexedDictionary


%% ¡props!

%%% ¡prop!
FEATURE_LABEL (metadata, string) is an extended label of the group of subjects.

%%% ¡prop!
FEATURE_MASK (metadata, cell) is an extended label of the group of subjects.
