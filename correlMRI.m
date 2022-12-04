% get values for fMRI correlation
cd('E:\TDT_MRI\')

data_carpets = dir();

% keep only the folders with a number as name
data_carpets = data_carpets(~isnan(cellfun(@str2double, {data_carpets.name})));
rootDir = pwd;
subN = length(data_carpets);

sat_perf_delta = nan(subN,1);
non_sat_perf_delta = nan(subN,1);
sat_perf_logit_delta = nan(subN,1);

for jj = 1:subN
    sub = str2double(data_carpets(jj).name);
    
    cd([rootDir,filesep,data_carpets(jj).name,filesep,'behav'])
    % let's calculate the performance change:
    f1 = dir('*Baseline*.csv');
    % exclude possible fake files starting with '.'
    f1 = f1(cellfun(@(c) ~strcmpi(c(1),'.'), {f1.name}));
    sesh1_data = readtable(f1.name);
    f2 = dir('*Conclusion*.csv');
    f2 = f2(cellfun(@(c) ~strcmpi(c(1),'.'), {f2.name}));
    sesh2_data = readtable(f2.name);
    
    if width(sesh1_data) == 23
        sesh1_data.Properties.VariableNames = {'subnumber', 'distance',...
            'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
            'trial',	'targetalignment',	'SOA',...
            'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
            'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time', 'nothing'};
        sesh1_data.nothing = [];
    elseif width(sesh1_data) == 22
        sesh1_data.Properties.VariableNames = {'subnumber', 'distance',...
            'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
            'trial',	'targetalignment',	'SOA',...
            'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
            'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time'};
    end
    
    if width(sesh2_data) == 23
        sesh2_data.Properties.VariableNames = {'subnumber', 'distance',...
            'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
            'trial',	'targetalignment',	'SOA',...
            'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
            'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time', 'nothing'};
        sesh2_data.nothing = [];
    elseif width(sesh2_data) == 22
        sesh2_data.Properties.VariableNames = {'subnumber', 'distance',...
            'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
            'trial',	'targetalignment',	'SOA',...
            'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
            'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time'};
    end
    
    
    sat_log_p_success_pre = log(nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==1)) / nansum(sesh1_data.satQuadrantYN==1));
    sat_log_p_failure_pre = log(1-nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==1)) / nansum(sesh1_data.satQuadrantYN==1));
    
    sat_logit_pre = sat_log_p_success_pre/sat_log_p_failure_pre;
    
    sat_log_p_success_post = log(nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==1)) / nansum(sesh2_data.satQuadrantYN==1));
    sat_log_p_failure_post= log(1-nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==1)) / nansum(sesh2_data.satQuadrantYN==1));
    
    sat_logit_post = sat_log_p_success_post/sat_log_p_failure_post;
    
    
    sat_perf_logit_delta(sub) = sat_logit_post - sat_logit_pre;
%     
%     non_sat_log_p_success_pre = log(nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==0)) / nansum(sesh1_data.satQuadrantYN==0));
%     non_sat_log_p_failure_pre = log(1-nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==0)) / nansum(sesh1_data.satQuadrantYN==0));
%     
%     non_sat_logit_pre = sat_log_p_success_pre/sat_log_p_failure_pre;
%     
%     non_sat_log_p_success_post = log(nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==0)) / nansum(sesh2_data.satQuadrantYN==0));
%     non_sat_log_p_failure_post= log(1-nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==0)) / nansum(sesh2_data.satQuadrantYN==0));
%     
%     non_sat_logit_post = non_sat_log_p_success_post/non_sat_log_p_failure_post;
%     
%     
%     non_sat_perf_delta(sub) = non_sat_logit_post - non_sat_logit_pre;
    
    sat_perf_delta(sub) = nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==1)) / nansum(sesh2_data.satQuadrantYN==1) - ...
        nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==1)) / nansum(sesh1_data.satQuadrantYN==1);
%     
%     non_sat_perf_delta(sub) = nansum(sesh2_data.ACCtar(sesh2_data.satQuadrantYN==0)) / nansum(sesh2_data.satQuadrantYN==0) - ...
%         nansum(sesh1_data.ACCtar(sesh1_data.satQuadrantYN==0)) / nansum(sesh1_data.satQuadrantYN==0);
    
    clear sesh1_data sesh2_data sat_log_p_failure_post sat_log_p_failure_pre sat_log_p_success_post sat_log_p_success_pre
end

randomCoefficients = [-0.352;
    0.375;
    -0.038;
    -0.515;
    0.4;
    -0.199;
    -0.234;
    -0.092;
    -0.045;
    -0.093;
    -0.175;
    -0.069;
    0.638;
    -0.179;
    -0.102;
    0.13;
    -0.335;
    -0.244;
    0.271;
    0.565;
    0.556;
    NaN;
    0.046;
    -0.121];

deltaMFI = mean(MFI_post-MFI_pre,2);

subplot(1,3,1)
plot(sat_perf_delta,deltaMFI,'Color', rgb('dark green'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('MFI-Behaviour correl')
[rho1, pval1] = corr(sat_perf_delta,deltaMFI);

mvpa_scores = readtable('C:\Users\sadek\OneDrive\Desktop\mvpa\loca_mvpa_prepost.txt');

mvpa_sat_delta = mvpa_scores.Var1_2 - mvpa_scores.Var1_1;

subplot(1,3,2)
plot(sat_perf_delta,mvpa_sat_delta,'Color', rgb('coral'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('MVPA-Behaviour correl')
[rho2, pval2] = corr(sat_perf_delta,mvpa_sat_delta);

subplot(1,3,3)
plot(mvpa_sat_delta, deltaMFI, 'Color', rgb('dodger blue'), 'Marker', '.', 'MarkerSize', 30, 'LineStyle', 'none')
title('MFI-MVPA correl')
[rho3, pval3] = corr(deltaMFI,mvpa_sat_delta);



