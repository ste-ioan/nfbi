    cd('E:\TDT_MRI')
    data_carpets = dir();
    data_carpets = data_carpets(~isnan(cellfun(@str2double, {data_carpets.name})));
    complete_dataset=[];
for jj = 1:length(data_carpets)
if ~strcmp(data_carpets(jj).name,'22') % participant with no responses in conclusion tdt
cd([cd,'/',data_carpets(jj).name])
cd('behav')
csv_files = dir('t*.csv');

for kk = 1:length(csv_files)
    bigT = find(csv_files(kk).name == 'T');
    typefile = csv_files(kk).name(1:bigT-1);
if strcmp('test', typefile)    
actual_data = readtable(csv_files(kk).name, 'Delimiter', 'comma');
if width(actual_data) == 23
actual_data.Properties.VariableNames = {'subnumber', 'distance',...
    'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
    'trial',	'targetalignment',	'SOA',...
    'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
    'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time', 'nothing'};
actual_data.nothing = [];
elseif width(actual_data) == 22
    actual_data.Properties.VariableNames = {'subnumber', 'distance',...
    'height',	'session',	'quadrant',	'satQuadrantYN',	'block',...
    'trial',	'targetalignment',	'SOA',...
    'Resp',	'firstKEY',	'RESPtar',	'ACCtar',	'RTtar',...
    'SOATime',	'PreBlankTime',	'FixTime',	'StimTime',	'MaskTime',	'ClockTime','MRI_trig_time'};
end


complete_dataset = [complete_dataset;actual_data];
end
end
cd ..
cd ..
end
end

complete_dataset = sortrows(complete_dataset,1);
cd('E:\jamovi analyses\TDT\MRI')
writetable(complete_dataset)
