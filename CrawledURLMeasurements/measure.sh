#!/bin/bash
index=0
temp1=""
temp2=""

#for year in {2010..2013}
#do
#for month in {01..12}
#do
#pig -x local -param DATE=$year$month sort_output_ows_actual.pig
#pig -x local -param DATE=$year$month sort_output_ows_captured.pig
#done
#done

#for year in {2010..2013}
#do
#for month in {01..12}
#do
#pig -x local -param DATE=$year$month sort_output_house_actual.pig
#pig -x local -param DATE=$year$month sort_output_house_captured.pig
#done
#done

for year in {2010..2013}
do
for month in {01..12}
do
pig -x local -param DATE=$year$month sort_output_senate_actual.pig
pig -x local -param DATE=$year$month sort_output_senate_captured.pig
done
done


#echo "OWS:"
#for year in {2010..2013}
#do
#for month in {01..12}
#do
#echo $year$month
#./measure_url_completeness /home/hdn11/ows_captured_$year$month/part-r-00000 /home/hdn11/ows_actual_$year$month/part-r-00000 /home/hdn11/Result.xt
#done
#done

echo "House:"
for year in {2010..2013}
do
for month in {01..12}
do
echo $year$month
./measure_url_completeness /home/hdn11/house_captured_$year$month/part-r-00000 /home/hdn11/house_actual_$year$month/part-r-00000 /home/hdn11/Result.xt
done
done

echo "Senate:"
for year in {2010..2013}
do
for month in {01..12}
do
echo $year$month
./measure_url_completeness /home/hdn11/senate_captured_$year$month/part-r-00000 /home/hdn11/senate_actual_$year$month/part-r-00000 /home/hdn11/Result.xt
done
done

#pig -x local /home/hai/Projects/HistoryCrawl/Code/senate_phase1.pig
