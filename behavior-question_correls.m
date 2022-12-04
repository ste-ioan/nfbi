% correlate behaviour of tdt mri with questionnaires

% harmonize MFI items

results = readtable('~/Documents/jamovi analyses/TDT/MRI/questionnaire/scores.csv');

Karopre = results.KarolinskaPre;
Karopost= results.KarolinskaPost;

T_karo = array2table([Karopre, Karopost]);

negative_items = [2, 4, 7, 10, 11, 12, 13, 14];

for k = 1:numel(negative_items)
    tmp_pre(:,k) = eval(['results.MFI',num2str(negative_items(k)),'_Pre']);
    tmp_post(:,k) = eval(['results.MFI',num2str(negative_items(k)),'_Post']);
end

for jj = 1:length(tmp_pre)
    
    for ll = 1:numel(negative_items)
        switch tmp_pre(jj, ll)
            case 5
                tmp_pre(jj, ll) = 1;
            case 4
                tmp_pre(jj, ll) = 2;
            case 2
                tmp_pre(jj, ll) = 4;
            case 1
                tmp_pre(jj, ll) = 5;
        end
    end
end

for jj = 1:length(tmp_post)
    
    for ll = 1:numel(negative_items)
        switch tmp_post(jj, ll)
            case 5
                tmp_post(jj, ll) = 1;
            case 4
                tmp_post(jj, ll) = 2;
            case 2
                tmp_post(jj, ll) = 4;
            case 1
                tmp_post(jj, ll) = 5;
        end
    end
end

MFI_pre = [results.MFI1_Pre,tmp_pre(:,1),results.MFI3_Pre,tmp_pre(:,2),...
    results.MFI5_Pre, results.MFI6_Pre, tmp_pre(:,3), results.MFI8_Pre,...
    results.MFI9_Pre, tmp_pre(:,4), tmp_pre(:,5), tmp_pre(:,6),tmp_pre(:,7),...
    tmp_pre(:,8), results.MFI15_Pre];

MFI_post = [results.MFI1_Post,tmp_post(:,1),results.MFI3_Post,tmp_post(:,2),...
    results.MFI5_Post, results.MFI6_Post, tmp_post(:,3), results.MFI8_Post,...
    results.MFI9_Post, tmp_post(:,4), tmp_post(:,5), tmp_post(:,6),tmp_post(:,7),...
    tmp_post(:,8), results.MFI15_Post];

T_MFI = array2table([mean(MFI_pre,2), mean(MFI_post,2)]);

[~, pval_fat, ci_fat, stats_fat] = ttest(T_MFI.Var1, T_MFI.Var2);
[pval_sleepy,~,stats_sleepy] = signrank(T_karo.Var1, T_karo.Var2);

cd('/Volumes/LaCie/TDT_MRI/')

% Quadrant * Saturation subject coefficients
% extracted from random model on R
% sub 22 missing because no data of second tdt session
randomCoefficients = [-0.349;
    0.345;
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
    -0.121;
    -0.105];

deltaMFI = mean(MFI_post-MFI_pre,2);

plot(randomCoefficients,deltaMFI,'Color', rgb('dark green'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('MFI-Behaviour correl')
[rho1, pval1] = corr(randomCoefficients,deltaMFI, 'rows', 'complete'); % excl missing subj 22

deltaKaro = Karopost - Karopre;
plot(randomCoefficients, deltaKaro, 'Color', rgb('dodger blue'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')

title('Sleepiness - Behaviour')
hold on
[rho2, pval2] = corr(deltaKaro,randomCoefficients, 'rows', 'complete'); % excl missing subject 2 and 22
Fit = polyfit(randomCoefficients,deltaKaro,1);
plot(randomCoefficients,polyval(Fit,randomCoefficients))

% mvpa correlation here
mvpa_scores = readtable('~/Documents/jamovi analyses/TDT/MRI/mvpa/loca_mvpa_prepost.txt');
mvpa_sat_delta = mvpa_scores.Var1_2 - mvpa_scores.Var1_1;

mvpa_sat_delta(25) = NaN; % brain scans contained artefacts

subplot(1,3,2)
plot(randomCoefficients,mvpa_sat_delta,'Color', rgb('coral'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('MVPA-Behaviour correl')
[rho3, pval3] = corr(randomCoefficients,mvpa_sat_delta, 'rows', 'complete');
