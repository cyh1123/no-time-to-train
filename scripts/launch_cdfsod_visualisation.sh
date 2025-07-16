#! /bin/bash

# Argument order:
# DATASET_NAME, SHOT, DEVICES, CAT_NAMES, CATEGORY_NUM

# Function to plot reference images
function plot_reference_images() {
    python dev_hongyi/make_plots/plot_reference_images.py \
        --json_path ./data/$1/annotations/1_shot_with_segm.json \
        --image_dir ./data/$1/train \
        --output_dir ./data/$1/annotations/1_shot_with_segm_vis \
        --dataset_name $1
}

# NEU-DET dataset, 1 shot, 2 GPUs
echo "Running NEU-DET"
plot_reference_images "NEU-DET"
CAT_NAMES='crazing,inclusion,patches,pitted_surface,rolled-in_scale,scratches'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "NEU-DET" 1 "4,5" "$CAT_NAMES" 6

# UODD dataset, 1 shot, 2 GPUs
echo "Running UODD"
plot_reference_images "UODD"
CAT_NAMES='seacucumber,seaurchin,scallop'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "UODD" 1 "4,5" "$CAT_NAMES" 3

# DIOR dataset, 1 shot, 2 GPUs
echo "Running DIOR"
plot_reference_images "DIOR"
CAT_NAMES='Expressway-Service-area,Expressway-toll-station,airplane,airport,baseballfield,basketballcourt,bridge,chimney,dam,golffield,groundtrackfield,harbor,overpass,ship,stadium,storagetank,tenniscourt,trainstation,vehicle,windmill'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "DIOR" 1 "4,5" "$CAT_NAMES" 20

# FISH dataset, 1 shot, 2 GPUs
echo "Running FISH"
plot_reference_images "FISH"
CAT_NAMES='fish'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "FISH" 1 "5,6" "$CAT_NAMES" 1

# ArTaxOr dataset, 1 shot, 1 GPU
echo "Running ArTaxOr"
plot_reference_images "ArTaxOr"
CAT_NAMES='Araneae,Coleoptera,Diptera,Hemiptera,Hymenoptera,Lepidoptera,Odonata'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "ArTaxOr" 1 "5" "$CAT_NAMES" 7

# clipart1k dataset, 1 shot, 1 GPU
echo "Running clipart1k"
plot_reference_images "clipart1k"
CAT_NAMES='sheep,chair,boat,bottle,diningtable,sofa,cow,motorbike,car,aeroplane,cat,train,person,bicycle,pottedplant,bird,dog,bus,tvmonitor,horse'
zsh scripts/cdfsod_pipeline_only_visualisation.sh "clipart1k" 1 "5" "$CAT_NAMES" 20