% List of open inputs
global subject
nrun = 1; % enter the number of runs here
jobfile = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm_scripts\brain_flippin_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
subjs = 2:2:24;
for k = 1:numel(subjs)
    subject = subjs(k);
    spm('defaults', 'FMRI');
    spm_jobman('run', jobs, inputs{:});
end

