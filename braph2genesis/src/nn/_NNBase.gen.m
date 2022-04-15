%% ¡header!
NNBase < Element (nn, base neural network) is a base neural network.

%%% ¡description!
NNBase provides the methods necessary for setting up neural networks.
Instances of this class should not be created. 
Use one of its subclasses instead.

%% ¡props!
%%% ¡prop!
ID (data, string) is a few-letter code for the neural network.

%%% ¡prop!
LABEL (metadata, string) is an extended label of the neural network.

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the neural network.

%%% ¡prop!
GR (data, item) is a group of NN subjects containing the information for training the neural network.
%%%% ¡settings!
'NNGroup'

%%% ¡prop!
MODEL (result, cell) is a trained neural network.
%%%% ¡gui!
pr = PPNNBase_Model('EL', nn, 'PROP', nn.MODEL, varargin{:});

%% ¡methods!
function installed = check_nn_toolboxes(nn)
    %CHECK_NN_TOOLBOXES checks whether the deep-learning-required toolboxes are installed.
    %
    % INSTALLED = CHECK_NN_TOOLBOXES(NN) checks the installation of the toolboxes:
    %  "Deep Learning Toolbox" and 
    %  "Deep learning Toolbox Converter for ONNX Model Format" installation status. 
    %  If they are not installed, then it throws a warning.
    %  Typically, this method is only called internally when training
    %  any subclass of the neural networks.
    
    addons = matlab.addons.installedAddons;
    installed = all(ismember(["Deep Learning Toolbox"; "Deep Learning Toolbox Converter for ONNX Model Format"], addons.Name));
    if ~installed
        warning(['Some of the required deep-learning toolboxs are not installed. ' ...
            'Please, refer to ' ...
            '<a href="matlab: web(''https://se.mathworks.com/products/deep-learning.html'') ">Deep Learning Toolbox</a> ' ...
            'and ' ...
            '<a href="matlab: web(''https://se.mathworks.com/matlabcentral/fileexchange/67296-deep-learning-toolbox-converter-for-onnx-model-format'') ">Deep Learning Toolbox Converter for ONNX Model Format</a>'])
    end
end
function nn_cell = from_net(nn, net)
    %FROM_NET saves the newtork object as the binary format in braph.
    % 
    % NN_CELL = FROM_NET(NN, NET) transforms the build-in neural network
    %  object NET to a cell format. Firstly, the NET is exported to an
    %  ONNX file and then the file is imported as the binary format which 
    %  can be saved as cell in braph.
    %  Typically, this method is called internally when a neural network
    %  model is trained and ready to be saved in braph.
    %
    % See also to_net.
    
    w = warning('query','MATLAB:mir_warning_unrecognized_pragma');
    warning('off', 'MATLAB:mir_warning_unrecognized_pragma');

    directory = [fileparts(which('test_braph2')) filesep 'trial_nn_from_matlab_to_be_erased'];
    if ~exist(directory, 'dir')
        mkdir(directory)
    end
    filename = [directory filesep 'nn_from_matlab_to_be_erased.onnx'];

    exportONNXNetwork(net, filename);
    
    fileID = fopen(filename);
    nn_cell = {fread(fileID)};	
    fclose(fileID);
    
    rmdir(directory, 's')
    warning(w.state, 'MATLAB:mir_warning_unrecognized_pragma')
end
function net = to_net(nn, saved_nn, varargin)
    %TO_NET transforms the saved neural network 
    % in braph to a build-in object in matlab.
    %
    % NET = TO_NET(NN) transforms the saved neural network in braph
    %  to a build-in object in matlab. Firstly the saved neural network
    %  in braph is exported as an ONNX file, and then the file is 
    %  imported as a build-in neural network object in matlab.
    %  Typically, this method is called internally when a saved neural 
    %  network model is evaluated by a test data.
    %
    % See also from_net.
    
    w_matlab = warning('query','MATLAB:mir_warning_unrecognized_pragma');
    warning('off', 'MATLAB:mir_warning_unrecognized_pragma');
    w_nnet = warning('query','nnet_cnn:internal:cnn:analyzer:NetworkAnalyzer:NetworkHasWarnings');
    warning('off','nnet_cnn:internal:cnn:analyzer:NetworkAnalyzer:NetworkHasWarnings');

    directory = [fileparts(which('test_braph2')) filesep 'trial_nn_from_braph_to_be_erased'];
    if ~exist(directory, 'dir')
        mkdir(directory)
    end
    filename = [directory filesep 'nn_from_braph_to_be_erased.onnx'];

    fileID = fopen(filename, 'w');
    fwrite(fileID, saved_nn{1});
    fclose(fileID);
    
    if length(varargin) == 3
        format = varargin{1};
        type = varargin{2};
        class_name = varargin{3};
        net = importONNXNetwork(filename, "InputDataFormats", format, "OutputLayerType", type, "Classes", class_name);
    elseif length(varargin) == 2
        format = varargin{1};
        type = varargin{2};
        net = importONNXNetwork(filename, "InputDataFormats", format, "OutputLayerType", type);
    else
        lgraph = importONNXLayers(filename, "InputDataFormats", "BCSS");
        net = assembleNetwork(lgraph);
    end
    
    rmdir(directory, 's');
    warning(w_matlab.state, 'MATLAB:mir_warning_unrecognized_pragma');
    warning(w_nnet.state,'nnet_cnn:internal:cnn:analyzer:NetworkAnalyzer:NetworkHasWarnings');
end

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Net import and export
%%%% ¡code!
net = squeezenet;
img = rand(net.Layers(1).InputSize);
pred_from_original_net = predict(net, img);

net_braph = NNBase().to_net(NNBase().from_net(squeezenet));
pred_from_braph = predict(net_braph, img);

assert(max(abs(pred_from_braph - pred_from_original_net)) < 1E-06, ...
    [BRAPH2.STR ':NNBase:' BRAPH2.BUG_ERR], ...
    'Prediction is not being calculated correctly for neural networks.')