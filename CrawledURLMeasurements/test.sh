#!/bin/bash
echo "sandy"
for year in {2010..2013}
do
for i in {01..12}
do
date=$year$i
echo $date
done
done
