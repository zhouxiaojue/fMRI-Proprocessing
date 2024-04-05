#!/bin/bash
#Xiaojue Zhou, Feb 23 2022, zhouxiaojue22@gmail.com

#find all source files that we want
#find adc2-01  adc2-02  adc2-03  adc2-04  adc2-05  adc2-07  adc2-08  adc2-09 adc2-11  adc2-12  adc2-13  adc2-14  adc2-15  adc2-16  adc2-17  adc2-18  adc2-19  adc2-20  adc2-21  adc2-22  adc2-23  adc2-24  adc2-25  adc2-26  adc2-27  adc2-28  adc2-29  adc2-30  adc2-31  adc2-32
#01  02  03  04  05  06  07  08  09  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32



###test

docker run -it --rm -v /data/tmp/test-05_autoCorrectT1json:/data:ro -v /data/tmp/test-05_autoCorrectT1json/derivatives/mriqc:/out poldracklab/mriqc:latest /data /out participant --participant_label 01 -m T1w bold
