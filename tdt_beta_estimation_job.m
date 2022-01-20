%-----------------------------------------------------------------------
% Job saved on 16-Jul-2021 15:21:01 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Stempio
%-----------------------------------------------------------------------

global subject
homepath = 'E:\TDT_MRI\';
thres = -inf;

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'baseline bloc brains';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC1_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC2_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC3_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC4_registered.nii']}
                                                                     }';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'baseline arrays';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block1_mvpa_tdt_Baseline.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block2_mvpa_tdt_Baseline.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block3_mvpa_tdt_Baseline.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block4_mvpa_tdt_Baseline.mat']}
                                                                     }';
matlabbatch{3}.spm.stats.fmri_spec.dir = {[homepath,num2str(subject),'\outputs\TDT\baseline']};
matlabbatch{3}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{3}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{3}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{3}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Named File Selector: baseline bloc brains(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{3}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(1).multi(1) = cfg_dep('Named File Selector: baseline arrays(1) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{3}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(1).multi_reg = {''};
matlabbatch{3}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Named File Selector: baseline bloc brains(2) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{3}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(2).multi(1) = cfg_dep('Named File Selector: baseline arrays(2) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{3}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(2).multi_reg = {''};
matlabbatch{3}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('Named File Selector: baseline bloc brains(3) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{3}.spm.stats.fmri_spec.sess(3).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(3).multi(1) = cfg_dep('Named File Selector: baseline arrays(3) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{3}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(3).multi_reg = {''};
matlabbatch{3}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{3}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('Named File Selector: baseline bloc brains(4) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{3}.spm.stats.fmri_spec.sess(4).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(4).multi(1) = cfg_dep('Named File Selector: baseline arrays(4) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{3}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{3}.spm.stats.fmri_spec.sess(4).multi_reg = {''};
matlabbatch{3}.spm.stats.fmri_spec.sess(4).hpf = 128;
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
matlabbatch{6}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'conclusion bloc brains';
matlabbatch{6}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC5_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC6_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC7_registered.nii']}
                                                                     {[homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC8_registered.nii']}
                                                                     }';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'conclusion arrays';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block1_mvpa_tdt_Conclusion.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block2_mvpa_tdt_Conclusion.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block3_mvpa_tdt_Conclusion.mat']}
                                                                     {[homepath,num2str(subject),'\arrays\averaged_block4_mvpa_tdt_Conclusion.mat']}
                                                                     }';

matlabbatch{8}.spm.stats.fmri_spec.dir = {[homepath,num2str(subject),'\outputs\TDT\conclusion']};
matlabbatch{8}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{8}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{8}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{8}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Named File Selector: conclusion bloc brains(1) - Files', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{8}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).multi(1) = cfg_dep('Named File Selector: conclusion arrays(1) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{8}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(1).multi_reg = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Named File Selector: conclusion bloc brains(2) - Files', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{8}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).multi(1) = cfg_dep('Named File Selector: conclusion arrays(2) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{2}));
matlabbatch{8}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(2).multi_reg = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(3).scans(1) = cfg_dep('Named File Selector: conclusion bloc brains(3) - Files', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{8}.spm.stats.fmri_spec.sess(3).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).multi(1) = cfg_dep('Named File Selector: conclusion arrays(3) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{3}));
matlabbatch{8}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(3).multi_reg = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{8}.spm.stats.fmri_spec.sess(4).scans(1) = cfg_dep('Named File Selector: conclusion bloc brains(4) - Files', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{8}.spm.stats.fmri_spec.sess(4).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).multi(1) = cfg_dep('Named File Selector: conclusion arrays(4) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{4}));
matlabbatch{8}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{8}.spm.stats.fmri_spec.sess(4).multi_reg = {''};
matlabbatch{8}.spm.stats.fmri_spec.sess(4).hpf = 128;
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
