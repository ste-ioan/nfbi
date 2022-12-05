quads = {'RQ', 'LQ'};
sessions = {'pre','post'};
other_sess = {'baseline', 'conclusion'};
% create empty tables to stash data
betas = nan(24,4);

% for every subject
for subj = 1:24
    for sesh = 1:2
        
        
        if any(subj == 1:2:24)
            sat_quad = 'RQ';
            sat_beta_code = '0001';
            non_sat_quad = 'LQ';
            non_sat_beta_code = '0002';
        else
            sat_quad = 'LQ';
            sat_beta_code = '0002';
            non_sat_quad = 'RQ';
            
            non_sat_beta_code = '0001';
        end
        
        % like this, i only take the saturated side of brain, with
        % betas of that quadrant over the non saturated, in pre and post.
        sat_mask = load_nii(['E:\TDT_MRI\SCANS\',num2str(subj),'\outputs\ROI\combined\images\',sat_quad,'_prepost.nii']);
        
        sat_vals = load_nii(['E:\TDT_MRI\SCANS\',num2str(subj),'\outputs\LOCA_contrast\',other_sess{sesh},'\beta_',sat_beta_code,'.nii']);
        
        % discard all values outside of mask
        sat_mask.img = double(sat_mask.img);
        sat_mask.img(sat_mask.img == 0) = NaN;
        
        cont1 = double(sat_mask.img) .* double(sat_vals.img);
        cont1 = cont1(~isnan(cont1));
        
        betas(subj,sesh) = mean(cont1(cont1~=0));
        
        non_sat_mask = load_nii(['E:\TDT_MRI\SCANS\',num2str(subj),'\outputs\ROI\combined\images\',non_sat_quad,'_prepost.nii']);
        
        non_sat_vals = load_nii(['E:\TDT_MRI\SCANS\',num2str(subj),'\outputs\LOCA_contrast\',other_sess{sesh},'\beta_',non_sat_beta_code,'.nii']);
        
        % discard all values outside of mask
        cont2 = double(non_sat_mask.img) .* double(non_sat_vals.img);
        cont2 = cont2(~isnan(cont2));
        
        betas(subj,sesh+2) = mean(cont2(cont2~=0));
        
        clear cont1 cont 2 sat_vals non_sat_vals sat_mask non_sat_mask sat_beta_code non_sat_beta_code
    end
end

% correlate w/random coefficients from jamovi model {extracted thru R}
randomCoefficients = [-0.349;
    0.374;
    -0.038;
    -0.516;
    0.399;
    -0.199;
    -0.233;
    -0.092;
    -0.045;
    -0.095;
    -0.174;
    -0.069;
    0.637;
    -0.179;
    -0.1;
    0.13;
    -0.333;
    -0.242;
    0.269;
    0.563;
    0.556;
    NaN;
    0.046;
    -0.121];

% calculate delta betas in sat quad, or in general
sat_betas = betas(:,2) - betas(:,1);

% no data for trials in second sessions of tdt of this subj
randomCoefficients(22) = [];
sat_betas(22) = [];

plot(randomCoefficients,sat_betas,'Color', rgb('coral'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('Brain - Behaviour correl')
[rho, pval] = corr(randomCoefficients,sat_betas);
Fit = polyfit(randomCoefficients,sat_betas,1);
hold on
plot(randomCoefficients,polyval(Fit,randomCoefficients))
