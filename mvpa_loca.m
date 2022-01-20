% script to run MVPA on the Localiser Betas
% for "neural fatigue by passive induction"
% this script was made by stempio, summer 2021

quads = {'LQ', 'RQ'};

for k = 1:24
for quad = 1:2
    mvpa_loca_byquadrant(k, quads{quad})
end
end

close all