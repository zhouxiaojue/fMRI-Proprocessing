#!/bin/bash
#Xiaojue Zhou, Feb 23 2022, zhouxiaojue22@gmail.com

#copy them to a new directory named as sub-??/ses-01/the path to scan name
#ignore all the PHYSIOLOG folder for physiology measurement

#mkdir of all the new path to each adc2-?? to sub-??/ses-01

find adc2-?? -maxdepth 0 -mindepth 0 -type d | awk -F- '{print "mkdir /data/tmp/sub-"$2""}' | bash
find adc2-?? -maxdepth 0 -mindepth 0 -type d | awk -F- '{print "mkdir /data/tmp/sub-"$2"/ses-01"}' | bash

#copy all the files to the new ses-01 directory under each subject
find adc2-01  adc2-02  adc2-03  adc2-04  adc2-05  adc2-07  adc2-08  adc2-09 adc2-11  adc2-12  adc2-13  adc2-14  adc2-15  adc2-16  adc2-17  adc2-18  adc2-19  adc2-20  adc2-21  adc2-22  adc2-23  adc2-24  adc2-25  adc2-26  adc2-27  adc2-28  adc2-29  adc2-30  adc2-31  adc2-32 -maxdepth 0 -mindepth 0 -type d | awk -F- '{print "rsync -a --progress --ignore-existing /data/source/"$0"/*/* /data/tmp/sub-"$2"/ses-01/ &>> /data/tmp/2021_ActCueing_moving.log"}' | bash


#change permission on all the copied files
chmod -R 775 /data/tmp/*
#remove all the PHYSIOLOG files
rm -R /data/tmp/sub-??/ses-01/*PHYSIOLOG*
