
#!/bin/bash
#Xiaojue Zhou, Feb 23 2022, zhouxiaojue22@gmail.com

#create directory for nifti output
mkdir /data/data/Nifti
#first, pull the latest heudiconv
docker pull nipy/heudiconv:latest

#second, run HeuDiConv,#this generate the dicominfo.tsv and heuristic.py
docker run --rm -it -v /data/tmp:/base -v /data/data/Nifti:/output nipy/heudiconv:latest -d /base/sub-{subject}/ses-{session}/*/*.IMA -o /output -f convertall -s 01  02  03  04  05  06  07  08  09  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32 -ss 01 -c none

#edit the heuristic.py and copy it to the the base of ./Nifti/code/, if need to rerun, update the heuristic.py and delete the dicomin.tsv file

docker run --rm -it -v /data/tmp:/base -v /data/data/Nifti:/output nipy/heudiconv:latest -d /base/sub-{subject}/ses-{session}/*/*.IMA -o /output/BIDSout -f /output/heuristic.py -s 01  02  03  04  05  06  07  08  09  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32 -ss 01 -c dcm2niix -b
