The present collection of files are the scripts employed for the publication "neural fatigue by passive induction".
the data files can be found at: https://zenodo.org/record/7395703

These analyses require SPM12, TDT and SwE toolboxes for fMRI and MVPA.

The scripts "coreg_seg_norm" and "smoothing" are the ones employed for preprocessing.

"localiser_contrast" employes the smoothes brains to run the analysis that is employed to derive the subject-specific masks.

while "tdt/loca_beta_estimation" scripts employed the non smoothed brains to compute the betas later employed in the MVPA.

"combine_rois" sums all the subject specific ROIs to yield whole-sample masks for representation.

"brain_flippin" homogenizes the side of stimulation across participants.

"mriTDT_coefficients" runs the behavioral model in R and extracts the subject specific coefficients, used in correlations

"LOCA_betas_prepost_in_ROIs" extracts the values in the smoothed brains in pre and post sessions, computes their delta and correlates with behavior.

"behavior-question_correls" combines the subject specific coefficients with the questionnaire scores to run correlations

while the scripts beginning with "mvpa" run the multivariate analysis, whose outputs are then gathered by "extract_MVPA_scores" in a single txt file.

the "clusterwise_bootstrap_satxsesh" script runs a bootstrapped repeated measures univariate analysis on the flipped brains.

finally, the "read_mri_csv" script joins all the behavioral csv files in a single table.


For any questions feel free to contact me at ste.ioannucci@gmail.com
