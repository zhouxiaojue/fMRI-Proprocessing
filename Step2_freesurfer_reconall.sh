#!/bin/bash
#Xiaojue Zhou, Feb 23 2022, zhouxiaojue22@gmail.com

cp /data/data/Nifti/BIDSout/sub-??/ses-01/anat/*.nii.gz /data/fs_tmp/
cd /data/fs_tmp
ls sub*.nii | awk '{print "gunzip "$0""}' | bash

#loop over all the T1w files and replace the in files and out files
bash CorrectNiftiHeaderRotation.sh

ls *T1w.nii | awk -F_ '{print "recon-all -i "$0" -subjid "$1" -parallel -openmp 8 -all "}' | bash

ls *T1w.nii | awk -F_ '{print "recon-all -i "$0" -subjid "$1" -parallel -openmp 8 -all "}' | bash


matlab -nodisplay -nodesktop -r "run /CorrectJsonFile.m"
#move the old json files to T1 unmod and replace the new one with old one

#change these three parameters inside the BIDS directory

cd /data/fs_tmp
ls *.nii | awk '{print "gzip "$1""}' | bash
find *.nii.gz | awk -F_ '{print "cp "$0" /data/data/Nifti/BIDSout/"$1"/ses-01/anat/"}' | bash
#replace the T1 in BIDS directory to be the orientation corrected one.
#"ImageOrientationPatientDICOM","ImageOrientationPatient":"dcmmeta_affine":

#save the files temporarily

find *.nii.gz | awk -F_ '{print "cp /data/data/Nifti/BIDSout/"$1"/ses-01/anat/"$0" /data/data/Nifti/tmp/T1_ummod/"}' | bash
#move the old json files to T1 unmod and replace the new one with old one
find *.nii.gz | awk -F_ '{print "cp /data/data/Nifti/BIDSout/"$1"/ses-01/anat/"$1"_"$2"_"$3"_T1w.json /data/data/Nifti/tmp/T1_unmod/"}' | bash
########3

#change the name of modified json files
find *.nii.gz | awk -F_ '{print "mv /data/data/Nifti/BIDSout/"$1"/ses-01/anat/"$1"_"$2"_"$3"_T1w_new.json /data/data/Nifti/BIDSout/"$1"/ses-01/anat/"$1"_"$2"_"$3"_T1w.json" }' | bash
