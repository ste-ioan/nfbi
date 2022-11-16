% Calculating Cohen's D for 'Neural fatigue by passive induction', 
% Stempio, november 2022

% within the outputs folder of each single subject's scan:

% each LOCA_contrast has the COPE  for RQ (cons_001) and LQ stimuli (cons_002)

% first, multiply by subject specific mask

% stash and average across participants separately per condition

% then divide by the shared variance (standard deviation across conditions)

% needs nifti toolbox
cd('/Users/mococomac/Documents/MATLAB/NIfTI')

 
 RQ_mask = load_nii('/Volumes/LaCie/TDT_MRI/2ndlevel/LOCA/cluster_mask.nii');
 LQ_mask = load_nii('/Volumes/LaCie/TDT_MRI/2ndlevel/LOCA/flipped_cluster_mask.nii');
 
 % not binarized!
 RQ_mask.img(RQ_mask.img ~= 0) = 1;
 LQ_mask.img(LQ_mask.img ~= 0) = 1;
 RQ_mask.img(RQ_mask.img == 0) = NaN;
 LQ_mask.img(LQ_mask.img == 0) = NaN;
 
 all_deltas_RQ = zeros(178,24);
 variances_to_be_RQ = [];
 
 all_deltas_LQ = zeros(178,24);
 variances_to_be_LQ = [];
 

for subj = 1:24
    % load the niis
    baseline_RQ_cope = load_nii(['/Volumes/LaCie/TDT_MRI/SCANS/',num2str(subj),'/outputs/LOCA_contrast/baseline/con_0001.nii']);
    baseline_LQ_cope = load_nii(['/Volumes/LaCie/TDT_MRI/SCANS/',num2str(subj),'/outputs/LOCA_contrast/baseline/con_0002.nii']);
    % ----------------------------------------------------------------------------------------------------------------------------%
    conclusion_RQ_cope = load_nii(['/Volumes/LaCie/TDT_MRI/SCANS/',num2str(subj),'/outputs/LOCA_contrast/conclusion/con_0001.nii']);
    conclusion_LQ_cope = load_nii(['/Volumes/LaCie/TDT_MRI/SCANS/',num2str(subj),'/outputs/LOCA_contrast/conclusion/con_0002.nii']);
    % ----------------------------------------------------------------------------------------------------------------------------%
    %% RQ 
    % change all NaNs to 0s so that when we multiply by the masks we can
    % remove NaNs and we are left with the cluster
    baseline_RQ_cope.img(isnan(baseline_RQ_cope.img)) = 0;
    conclusion_RQ_cope.img(isnan(conclusion_RQ_cope.img)) = 0;
    
    delta_RQ = (conclusion_RQ_cope.img - baseline_RQ_cope.img) .* single(RQ_mask.img);
    delta_RQ = delta_RQ(:);
    delta_RQ = delta_RQ(~isnan(delta_RQ));
    
    temp = conclusion_RQ_cope.img .* single(RQ_mask.img);
    temp = temp(:);
    temp = temp(~isnan(temp));
    temp2 = baseline_RQ_cope.img .* single(RQ_mask.img);
    temp2 = temp2(:);
    temp2 = temp2(~isnan(temp2));
      
    variances_to_be_RQ = cat(2,variances_to_be_RQ,[temp,temp2]);
    all_deltas_RQ(:,subj) = delta_RQ;
    clear temp temp2
    %% LQ 
    baseline_LQ_cope.img(isnan(baseline_LQ_cope.img)) = 0;
    conclusion_LQ_cope.img(isnan(conclusion_LQ_cope.img)) = 0;
    
    delta_LQ = (conclusion_LQ_cope.img - baseline_LQ_cope.img) .* single(LQ_mask.img);
    delta_LQ = delta_LQ(:);
    delta_LQ = delta_LQ(~isnan(delta_LQ));
    
    temp = conclusion_LQ_cope.img .* single(LQ_mask.img);
    temp = temp(:);
    temp = temp(~isnan(temp));
    temp2 = baseline_LQ_cope.img .* single(LQ_mask.img);
    temp2 = temp2(:);
    temp2 = temp2(~isnan(temp2));
    
    variances_to_be_LQ = cat(2,variances_to_be_LQ,[temp,temp2]);
    all_deltas_LQ(:,subj) = delta_LQ;
    
    clear temp temp2
end

pooled_variance_RQ = std(variances_to_be_RQ, 0, 2);
pooled_variance_LQ = std(variances_to_be_LQ, 0, 2);

Cohens_D_RQ = mean(mean(all_deltas_RQ,2) ./ pooled_variance_RQ);
Cohens_D_LQ = mean(mean(all_deltas_LQ, 2) ./ pooled_variance_LQ);

overall_CohensD = mean([Cohens_D_LQ,Cohens_D_RQ]);

disp(['Computed Cohen D for univariate analysis is: ', num2str(round(overall_CohensD,2))])

