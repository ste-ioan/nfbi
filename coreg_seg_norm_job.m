%-----------------------------------------------------------------------
% Job saved on 30-Sep-2021 11:27:44 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Stempio
%-----------------------------------------------------------------------
global subject

homepath = 'E:\TDT_MRI\';
%% selecting T1 and reference
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'anat';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\anatomical.nii']}};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'ref';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\reference.nii']}};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'brains';
%% selecting experiment brains
matlabbatch{3}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
    {
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC1_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC2_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC3_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC4_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC5_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC6_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC7_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_BLOC8_registered.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_LOCA1_correct.nii']
    [homepath,num2str(subject),'\brain\Sub',num2str(subject),'_LOCA2_registered.nii']
    }
    }';
%% coregistration
matlabbatch{4}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Named File Selector: ref(1) - Files', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{4}.spm.spatial.coreg.estwrite.source(1) = cfg_dep('Named File Selector: anat(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{4}.spm.spatial.coreg.estwrite.other(1) = cfg_dep('Named File Selector: brains(1) - Files', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{4}.spm.spatial.coreg.estwrite.roptions.prefix = 'core-';
%% segmentation
matlabbatch{5}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'coregistered anatomical';
matlabbatch{5}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\core-anatomical.nii']}};
matlabbatch{6}.spm.spatial.preproc.channel.vols(1) = cfg_dep('Named File Selector: coregistered anatomical(1) - Files', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{6}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{6}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{6}.spm.spatial.preproc.channel.write = [0 1];
matlabbatch{6}.spm.spatial.preproc.tissue(1).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,1'};
matlabbatch{6}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,2'};
matlabbatch{6}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,3'};
matlabbatch{6}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,4'};
matlabbatch{6}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{6}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,5'};
matlabbatch{6}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{6}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).tpm = {'C:\Users\sadek\OneDrive\Documenti\MATLAB\spm12\tpm\TPM.nii,6'};
matlabbatch{6}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{6}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{6}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{6}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{6}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{6}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{6}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{6}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{6}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
    NaN NaN NaN];
%% normalisation
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'deformation field';
matlabbatch{7}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {{[homepath,num2str(subject),'\brain\y_core-anatomical.nii']}};
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'coregistered brains';
matlabbatch{8}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
    {
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC1_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC2_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC3_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC4_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC5_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC6_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC7_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_BLOC8_registered.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_LOCA1_correct.nii']
    [homepath,num2str(subject),'\brain\core-Sub',num2str(subject),'_LOCA2_registered.nii']
    }
    }';
%%
matlabbatch{9}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Named File Selector: deformation field(1) - Files', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{9}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Named File Selector: coregistered brains(1) - Files', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{9}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
    78 76 85];
matlabbatch{9}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{9}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{9}.spm.spatial.normalise.write.woptions.prefix = 'norm_';
