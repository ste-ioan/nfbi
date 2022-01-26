function mvpa_tdt_byquadrant(subject, quadrant)
%% baseline
% Set defaults
cfg = decoding_defaults;

% overwrite results
cfg.results.overwrite = 1;

% in this case wholebrain should already correspond to the mask?
cfg.analysis = 'ROI';

% Set the label names to the regressor names which you want to use for 
% decoding, e.g. 'button left' and 'button right'
% don't remember the names? -> run display_regressor_names(beta_loc)
labelname1 = 'RQ';
labelname2 = 'LQ';

% Set the filepath where your SPM.mat and all related betas are, e.g. 'c:\exp\glm\model_button'
beta_loc = ['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\baseline'];

% Set the output directory where data will be saved, e.g. 'c:\exp\results\buttonpress'
cfg.results.dir = ['E:\TDT_MRI\',num2str(subject),'\outputs\MVPA\tdt\baseline\', quadrant];

cfg.files.mask = ['E:\TDT_MRI\',num2str(subject),'\outputs\ROI\combined\images\',quadrant,'_prepost.nii'];

% Set additional parameters
% cfg.searchlight.spherical = 1;
cfg.verbose = 0; % you want all information to be printed on screen
cfg.results.output = {'accuracy_minus_chance'};


% Decide whether you want to see the searchlight/ROI/... during decoding
cfg.plot_selected_voxels = 0; % 0: no plotting, 1: every step, 2: every second step, 100: every hundredth step...
%  validation analysis.
% The following function extracts all beta names and corresponding run
% numbers from the SPM.mat
regressor_names = design_from_spm(beta_loc);

% Extract all information for the cfg.files structure (labels will be [1 -1] )
cfg = decoding_describe_data(cfg,{labelname1 labelname2},[1 -1],regressor_names,beta_loc);

% This creates the leave-one-run-out cross validation design:
cfg.design = make_design_cv(cfg); 

% Run decoding
results = decoding(cfg);

%% conclusion 
clear cfg

% Set defaults
cfg = decoding_defaults;

% overwrite results
cfg.results.overwrite = 1;

% in this case wholebrain should already correspond to the mask?
cfg.analysis = 'ROI';
cfg.files.mask = ['E:\TDT_MRI\',num2str(subject),'\outputs\ROI\combined\images\',quadrant,'_prepost.nii'];

% Set the label names to the regressor names which you want to use for 
% decoding, e.g. 'button left' and 'button right'
% don't remember the names? -> run display_regressor_names(beta_loc)
labelname1 = 'RQ';
labelname2 = 'LQ';
% Set the filepath where your SPM.mat and all related betas are, e.g. 'c:\exp\glm\model_button'
beta_loc = ['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\conclusion'];

% Set the output directory where data will be saved, e.g. 'c:\exp\results\buttonpress'
cfg.results.dir = ['E:\TDT_MRI\',num2str(subject),'\outputs\MVPA\tdt\conclusion\', quadrant];

%% Set additional parameters
% cfg.searchlight.spherical = 1;
cfg.verbose = 0; % you want all information to be printed on screen
cfg.results.output = {'accuracy_minus_chance'};

%% Decide whether you want to see the searchlight/ROI/... during decoding
cfg.plot_selected_voxels = 0; % 0: no plotting, 1: every step, 2: every second step, 100: every hundredth step...
%% validation analysis.
% The following function extracts all beta names and corresponding run
% numbers from the SPM.mat
regressor_names = design_from_spm(beta_loc);

% Extract all information for the cfg.files structure (labels will be [1 -1] )
cfg = decoding_describe_data(cfg,{labelname1 labelname2},[1 -1],regressor_names,beta_loc);

% This creates the leave-one-run-out cross validation design:
cfg.design = make_design_cv(cfg);

% Run decoding
results = decoding(cfg);