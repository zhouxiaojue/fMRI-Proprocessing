#!/bin/bash
#Xiaojue Zhou, Feb 23 2022, zhouxiaojue22@gmail.com

#no longer needs to add the intended for field inside each fieldmap

#1.use seed to add in a line for each fieldmap.json files for IntendedFor and B0map to trigger the fieldmap correction
#  "B0FieldIdentifier": "pepolar_fmap0", : SOME SUBJECT DONT WANT THIS LINE,
#  "IntendedFor": [
#      "ses-01/func/sub-01_ses-01_task-yourtask_run-1_bold.nii.gz"]"

#2. copy the freesurfer directory into the BIDSout folder to be used for fmriprep '

cp -R /data/fs_tmp/sub-?? /data/data/Nifti/BIDSout/derivatives/freesurfer/


for subID in 03  04  05  06  07  08  09  10 12  13  14  15  16  17  18  19  20  21  22  23  25  26  27  28  29  30  31  32; do
  docker run -ti --rm -v /data/data/Nifti/BIDSout:/base:ro -v /data/data/Nifti/BIDSout/derivatives:/output -v /usr/local/freesurfer/license.txt:/opt/freesurfer/license.txt nipreps/fmriprep:21.0.1 /base /output participant --participant-label $subID  --output-spaces MNI152NLin2009cAsym anat fsnative fsaverage --omp-nthreads 8 --nthreads 8 -w /data/data/Nifti/tmp/sub-$subID --fs-subjects-dir /output/freesurfer &> /data/analysis/preprocess_fmriprep/sub-${subID}_preprocess.txt
done


