%% Join masks across participants
% stempio october 2021

%% for every brain
for subj = 1:24
    
    % load their masks
    RQmask = load_nii(['E:\TDT_MRI\',num2str(subj),'\outputs\ROI\combined\images\RQ_prepost.nii']);
    LQmask = load_nii(['E:\TDT_MRI\',num2str(subj),'\outputs\ROI\combined\images\LQ_prepost.nii']);
    
    % if it's first mask, then initialize file
    if subj == 1
        RQ_sum_mask.hdr = RQmask.hdr;
        RQ_sum_mask.img = RQmask.img;
        
        LQ_sum_mask.hdr = LQmask.hdr;
        LQ_sum_mask.img = LQmask.img;
    else % otherwise sum the masks, which are 1s and 0s, so count how many times
        % each voxel is present across participants
        LQ_sum_mask.img = LQ_sum_mask.img + LQmask.img;
        RQ_sum_mask.img = RQ_sum_mask.img + RQmask.img;
    end
    clear LQmask RQmask
    
end