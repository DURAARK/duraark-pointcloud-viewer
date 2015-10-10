#!/bin/bash

if [ !$1 ]; then
  echo ""
  echo "No file provided."
  echo ""
  echo "Usage:"
  echo "    ./scripts/e572potree/Nygade_1001"
  echo ""
  exit -1
fi

echo "Converting $1.e57 ..."

wine ./lastools/bin/e572las.exe -v -i ./datasets/$1.e57 -o ./datasets/$1.laz
docker run -v $(pwd)/datasets/:/data1 -v $(pwd)/public:/data2 -v /tmp:/data3 -w /opt/PotreeConverter/PotreeConverter oscarmartinezrubi/massive-potreeconverter PotreeConverter /data1/$1.laz -o /data2/potree --generate-page

echo ""
echo "Successfully converted $1.e57"
echo ""
