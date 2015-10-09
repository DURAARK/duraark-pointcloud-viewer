#!/bin/bash

echo "docker run -p 5016:5016 --rm --name duraark-pointcloud-viewer local/duraark-pointcloud-viewer"
docker run -p 5016:5016 --rm --name duraark-pointcloud-viewer local/duraark-pointcloud-viewer
