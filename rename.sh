#!/bin/bash

num=1;
dir="app/assets/images/spade"

cd $dir
for file in *.png
do
    mv "${file}" "${num}.png"
	num=`expr ${num} + 1`;
done
