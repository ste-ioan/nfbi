% List of open inputs
global subject
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm_scripts\tdt_beta_estimation_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);

for subject = 14:24
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
end

close all