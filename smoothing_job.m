%-----------------------------------------------------------------------
% Job saved on 04-Oct-2021 14:48:55 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

global subject

homepath = 'E:\TDT_MRI\';

matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.name = 'brains';
%%
matlabbatch{1}.cfg_basicio.file_dir.file_ops.cfg_named_file.files = {
    {
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC1_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC2_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC3_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC4_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC5_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC6_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC7_registered.nii']
    [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_BLOC8_registered.nii']
     [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_LOCA1_correct.nii']
     [homepath,num2str(subject),'\brain\norm_core-Sub',num2str(subject),'_LOCA2_registered.nii']
    }
    }';
%%
matlabbatch{2}.spm.spatial.smooth.data(1) = cfg_dep('Named File Selector: brains(1) - Files', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files', '{}',{1}));
matlabbatch{2}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{2}.spm.spatial.smooth.dtype = 0;
matlabbatch{2}.spm.spatial.smooth.im = 0;
matlabbatch{2}.spm.spatial.smooth.prefix = 'smooth_';
