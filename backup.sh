#!/bin/bash
echo "Backing up \"$RESOURCE_NAME\" at `date +%Y/%m/%d\ %H:%M:%S`"

TIME=$(date +%Y-%m-%d_%H-%M-%S)
cd $RESOURCE_PATH
tar -zcf $RESOURCE_NAME-${TIME}.tar.gz $RESOURCE_NAME
mega-put -c $RESOURCE_NAME-${TIME}.tar.gz $MEGA_RESOURCE_PATH
rm -rf $RESOURCE_NAME-${TIME}.tar.gz
