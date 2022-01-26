function mvpa_loca_byquadrant(subject, quadrant)
% since this is the same across sessions

mask  = ['E:\TDT_MRI\',num2str(subject),'\outputs\ROI\combined\images\',quadrant,'_prepost.nii'];

%% baseline
clear cfg
% Set defaults
cfg = decoding_defaults;

% overwrite results
cfg.results.overwrite = 1;

% in this case wholebrain should already correspond to the mask?
cfg.analysis = 'ROI';%'ROI' or 'searchlight' in the latter case add radius parameter

% Set the label names to the regressor names which you want to use for
% decoding, e.g. 'button left' and 'button right'
% don't remember the names? -> run display_regressor_names(beta_loc)
labelname1 = 'RQ';
labelname2 = 'LQ';

% Set the filepath where your SPM.mat and all related betas are, e.g. 'c:\exp\glm\model_button'
beta_loc = ['E:\TDT_MRI\',num2str(subject),'\outputs\LOCA_beta_mvpa\baseline'];

% Set the output directory where data will be saved, e.g. 'c:\exp\results\buttonpress'
cfg.results.dir = ['E:\TDT_MRI\',num2str(subject),'\outputs\MVPA\loca_clean\baseline\', quadrant];
cfg.files.mask = mask;

% Set additional parameters
% cfg.searchlight.spherical = 1;
cfg.verbose = 0; % you want all information to be printed on screen
cfg.results.output = {'accuracy_minus_chance'};

% Decide whether you want to see the searchlight/ROI/... during decoding
cfg.plot_selected_voxels = 1; % 0: no plotting, 1: every step, 2: every second step, 100: every hundredth step...
%  validation analysis.
% The following function extracts all beta names and corresponding run
% numbers from the SPM.mat
regressor_names = design_from_spm(beta_loc);

% manually fix regressor names middle row which indicates the chunk/run, so
% that the mvpa can consider them separate even if arising from same scan
 dummy_chunks = [zeros(1,4), ones(1,4), repmat(2,1,4), repmat(3,1,4),repmat(4,1,4),repmat(5,1,4), zeros(1,1)];

regressor_names(2,:) = cellfun(@plus,regressor_names(2,:), num2cell(dummy_chunks), 'UniformOutput', false);

% change labels directly here instead of separate code
regressor_names(:,end) = [];

% Extract all information for the cfg.files structure (labels will be [1 -1] )
cfg = decoding_describe_data(cfg,{labelname1 labelname2},[1 -1],regressor_names,beta_loc);

% This creates the leave-one-run-out cross validation design:
cfg.design = make_design_cv(cfg);

% Run decoding
results = decoding(cfg);

%% conclusion
clear cfg results
% Set the filepath where your SPM.mat and all related betas are, e.g. 'c:\exp\glm\model_button'
 beta_loc = ['E:\TDT_MRI\',num2str(subject),'\outputs\LOCA_beta_mvpa\conclusion'];

% Set the output directory where data will be saved, e.g. 'c:\exp\results\buttonpress'
cfg.results.dir = ['E:\TDT_MRI\',num2str(subject),'\outputs\MVPA\loca\conclusion\', quadrant];

cfg.files.mask = mask;

cfg.analysis = 'ROI';
cfg.results.overwrite = 1;

%% Set additional parameters
% cfg.searchlight.spherical = 1;
cfg.verbose = 0; % you want all information to be printed on screen
cfg.results.output = {'accuracy_minus_chance'};

%% Decide whether you want to see the searchlight/ROI/... during decoding
cfg.plot_selected_voxels = 1; % 0: no plotting, 1: every step, 2: every second step, 100: every hundredth step...
%% validation analysis.
% The following function extracts all beta names and corresponding run
% numbers from the SPM.mat
regressor_names = design_from_spm(beta_loc);

% manually fix regressor names middle row which indicates the chunk/run, so
% that the mvpa can consider them separate even if arising from same scan
 dummy_chunks = [zeros(1,4), ones(1,4), repmat(2,1,4), repmat(3,1,4),repmat(4,1,4),repmat(5,1,4), zeros(1,1)];

regressor_names(2,:) = cellfun(@plus,regressor_names(2,:), num2cell(dummy_chunks), 'UniformOutput', false);

% remove constant
regressor_names(:,end) = [];

% Extract all information for the cfg.files structure (labels will be [1 -1] )
cfg = decoding_describe_data(cfg,{labelname1 labelname2},[1 -1],regressor_names,beta_loc);

% This creates the leave-one-run-out cross validation design:
cfg.design = make_design_cv(cfg);

% Run decoding
results = decoding(cfg);