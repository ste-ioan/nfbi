%-----------------------------------------------------------------------
% Job saved on 29-Apr-2021 15:46:49 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Stempio
%-----------------------------------------------------------------------
global subject

homepath = 'E:\TDT_MRI\';
thres = -inf;

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'pre brain';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_LOCA1_correct.nii']}};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'pre array';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\arrays\spm_array_for_MVPA_Baseline.mat']}};
matlabbatch{3}.spm.stats.fmri_spec.dir = {[homepath,num2str(subject),'\outputs\LOCA_beta_mvpa\baseline']};
matlabbatch{3}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{3}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{3}.spm.stats.fmri_spec.sess.scans(1) = cfg_dep('Named File Selector: pre brain(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{3}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess.multi(1) = cfg_dep('Named File Selector: pre array(1) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{3}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{3}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{3}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{3}.spm.stats.fmri_spec.volt = 1;
matlabbatch{3}.spm.stats.fmri_spec.global = 'None';
matlabbatch{3}.spm.stats.fmri_spec.mthresh = thres;
matlabbatch{3}.spm.stats.fmri_spec.mask = {''};
matlabbatch{3}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{4}.spm.stats.review.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{4}.spm.stats.review.display.matrix = 1;
matlabbatch{4}.spm.stats.review.print = '';
matlabbatch{5}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{5}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{5}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{6}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'post brain';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_LOCA2_registered.nii']}};
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'post array';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\arrays\spm_array_for_MVPA_Conclusion.mat']}};
matlabbatch{8}.spm.stats.fmri_spec.dir = {[homepath,num2str(subject),'\outputs\LOCA_beta_mvpa\conclusion']};
matlabbatch{8}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{8}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{8}.spm.stats.fmri_spec.sess.scans(1) = cfg_dep('Named File Selector: post brain(1) - Files', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{8}.spm.stats.fmri_spec.sess.cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{8}.spm.stats.fmri_spec.sess.multi(1) = cfg_dep('Named File Selector: post array(1) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{8}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess.multi_reg = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{8}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{8}.spm.stats.fmri_spec.volt = 1;
matlabbatch{8}.spm.stats.fmri_spec.global = 'None';
matlabbatch{8}.spm.stats.fmri_spec.mthresh = thres;
matlabbatch{8}.spm.stats.fmri_spec.mask = {''};
matlabbatch{8}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{9}.spm.stats.review.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{9}.spm.stats.review.display.matrix = 1;
matlabbatch{9}.spm.stats.review.print = '';
matlabbatch{10}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{10}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{10}.spm.stats.fmri_est.method.Classical = 1;
