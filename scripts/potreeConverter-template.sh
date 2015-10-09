#!/bin/bash

docker run -v $(pwd)/datasets/:/data1 -v $(pwd)/public:/data2 -v /tmp:/data3 -w /opt/PotreeConverter/PotreeConverter oscarmartinezrubi/massive-potreeconverter PotreeConverter /data1/LAS12_Sample_withRGB_Quick_Terrain_Modeler.las -o /data2/potree --generate-page pageName
