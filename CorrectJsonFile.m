%This is the code to correct T1 json file for correcting orientation to
%make sure the freesurfer and fmriprep has consistent T1 

%By Xiaojue Zhou, Feburary 23rd 2022, zhouxiaojue22@gmail.com
dataPath = '/data/data/Nifti/BIDSout/';

%loop over all the subject directory under the datapath to find the T1 json
%file

files = dir(strcat(dataPath,'*/ses-01/anat/*T1w*.json'));

for filenum = 1:length(files)

    jsonText = fileread(strcat(files(filenum).folder,'/',files(filenum).name));
    jsonData = jsondecode(jsonText);

    %change the Imageorientation

    jsonData.ImageOrientationPatientDICOM = [0 1 0 0 0 1]';
    jsonData.global.const.ImageOrientationPatient = [0 1 0 0 0 1]';
    jsonData.dcmmeta_affine(1:3,1:3) = eye(3);

    jsonText2 = jsonencode(jsonData);
    %write back to the json file 
    OutfName = extractBefore(files(filenum).name,'.json');
    OutfName = strcat(OutfName,'_new.json');
    fid = fopen(strcat(files(filenum).folder,'/',OutfName), 'w');
    fprintf(fid, '%s', jsonText2);
    fclose(fid);
end