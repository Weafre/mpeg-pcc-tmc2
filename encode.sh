#!/bin/bash
rate_cfgs=('cfg/rate_losslessgeo_lossyatt/ctc-r1.cfg'  'cfg/rate_losslessgeo_lossyatt/ctc-r2.cfg'  'cfg/rate_losslessgeo_lossyatt/ctc-r3.cfg'   'cfg/rate_losslessgeo_lossyatt/ctc-r4.cfg'  'cfg/rate_losslessgeo_lossyatt/ctc-r5.cfg')
flags=('r1' 'r2' 'r3' 'r4' 'r5')

arraylength=${#rate_cfgs[@]}

for (( i=0; i<${arraylength}; i++ ));
do
  ./bin/PccAppEncoder \
    --configurationFolder=cfg/ \
    --config=cfg/common/ctc-common.cfg \
    --config=cfg/condition/ctc-low-delay.cfg \
    --config=cfg/sequence/redandblack_vox10.cfg \
    --config=${rate_cfgs[$i]} \
    --uncompressedDataFolder=/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/10bits_TestPCs/MPEG8i/redandblack/Ply/ \
    --frameCount=100 \
    --reconstructedDataPath=Output/${flags[$i]}/S26C03R03_rec_%04d.ply \
    --compressedStreamPath=Output/${flags[$i]}/S26C03R03.bin
done;
# cfg/rate_losslessgeo_lossyatt/ctc-r1.cfg