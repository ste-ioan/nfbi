%-----------------------------------------------------------------------
% Job saved on 05-Oct-2021 23:54:42 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
global subject
matlabbatch{1}.spm.util.imcalc.input = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\baseline\con_0001.nii']};
matlabbatch{1}.spm.util.imcalc.output = ['flipped_con_0001.nii'];
matlabbatch{1}.spm.util.imcalc.outdir = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\baseline\']};
matlabbatch{1}.spm.util.imcalc.expression = 'flipud(i1)';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
% 
% matlabbatch{2}.spm.util.imcalc.input = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\baseline\con_0002.nii']};
% matlabbatch{2}.spm.util.imcalc.output = ['flipped_con_0002.nii'];
% matlabbatch{2}.spm.util.imcalc.outdir = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\baseline\']};
% matlabbatch{2}.spm.util.imcalc.expression = 'flipud(i1)';
% matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
% matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
% matlabbatch{2}.spm.util.imcalc.options.mask = 0;
% matlabbatch{2}.spm.util.imcalc.options.interp = 1;
% matlabbatch{2}.spm.util.imcalc.options.dtype = 4;

matlabbatch{2}.spm.util.imcalc.input = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\conclusion\con_0001.nii']};
matlabbatch{2}.spm.util.imcalc.output = ['flipped_con_0001.nii'];
matlabbatch{2}.spm.util.imcalc.outdir = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\conclusion\']};
matlabbatch{2}.spm.util.imcalc.expression = 'flipud(i1)';
matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{2}.spm.util.imcalc.options.mask = 0;
matlabbatch{2}.spm.util.imcalc.options.interp = 1;
matlabbatch{2}.spm.util.imcalc.options.dtype = 4;

% matlabbatch{4}.spm.util.imcalc.input = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\conclusion\con_0002.nii']};
% matlabbatch{4}.spm.util.imcalc.output = ['flipped_con_0002.nii'];
% matlabbatch{4}.spm.util.imcalc.outdir = {['E:\TDT_MRI\',num2str(subject),'\outputs\TDT\condition\conclusion\']};
% matlabbatch{4}.spm.util.imcalc.expression = 'flipud(i1)';
% matlabbatch{4}.spm.util.imcalc.var = struct('name', {}, 'value', {});
% matlabbatch{4}.spm.util.imcalc.options.dmtx = 0;
% matlabbatch{4}.spm.util.imcalc.options.mask = 0;
% matlabbatch{4}.spm.util.imcalc.options.interp = 1;
% matlabbatch{4}.spm.util.imcalc.options.dtype = 4;