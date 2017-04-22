#!/usr/bin/env bash

set -e
point_list='data/point_count_list_2'
cfg=trainer_config.py
output_dir=./output
   paddle train \
   --config=$cfg \
   --save_dir=$output_dir \
   --trainer_count=8 \
   --log_period=100 \
   --dot_period=100 \
   --num_passes=50 \
   --use_gpu=false \
   --config_args=nearby_num=2,subnode=6,point=22670 \
   --show_parameter_stats_period=3000 \
   2>&1 | tee 'output/train22670.log'

#while read line
#do
#   point=`echo $line|cut -d " " -f 1`
#   num=`echo $line|cut -d " " -f 2`
#   sub_num=`echo $line|cut -d " " -f 3`
#
#   output_dir=/Volumes/ExMac/DeepLearning/output/${point}/
#   paddle train \
#   --config=$cfg \
#   --save_dir=$output_dir \
#   --trainer_count=4 \
#   --log_period=100 \
#   --dot_period=100 \
#   --num_passes=50 \
#   --use_gpu=false \
#   --config_args=nearby_num=${num},subnode=${sub_num},point=${point} \
#   --show_parameter_stats_period=3000 \
#   2>&1 | tee '/Volumes/ExMac/DeepLearning/$point.log'
#
#done < $point_list
