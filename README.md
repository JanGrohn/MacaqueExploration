## Neural responses in macaque prefrontal cortex are linked to strategic exploration

Data and code to reproduce the figures and stats in:

Jahn C, Grohn J, Cuell S, Emberton A, Bouret S, Walton ME, Kolling N, Sallet J. Neural responses in macaque prefrontal cortex are linked to strategic exploration. PLOS Biology.

### Plotting behavioural models and ROI results
The `plot_figures` folder contains scripts to plot the behavioural model fits. Fits are precomputed and saved as .mat files. The folder also contains scripts to plot the t-statistics within specific ROIs as shown in the paper. The folder also includes a `data.mat` file that contains the trial-by-trial behavioural data for all 3 animals.

### Model fits
Behavioural models can be fitted by running the `fit_models.R` script in the `model_fitting` folder. Model fits are outputted as .csv files. The script also produces Supplementary Figures S1, S2, S3 and S5 that show the full model fits.

### Neural
Raw and cluster corrected whole-brain maps for all contrasts shown in the paper can be found in the `fMRI` folder. They can be viewed with [fsleyes](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes) or similar software. The `cluster_corrected` and the `uncorrected` subfolders contain cluster and non-cluster corrected z-statistic maps. The `ROIs` subfolder contains the regions of interest used throughout the paper.

Z-statistic maps are named according to the convention `Feedback_Contrast_Timepoints`. `Feedback` can be `Complete`, `Partial`, `Sum` (Complete + Partial), or `Diff` (Complete-Partial) and refers to the session type that was included in the analysis. `Contrast` indicates which contrast over regressors is being plotted, and `Timepoints` denotes whether `All` or only `First` choices are included in that contrast.
