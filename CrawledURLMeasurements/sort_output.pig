output = load 'input/part-r-00000' as (srcurl:chararray, dsturl:chararray, date:chararray, text:chararray, type:chararray, datatype:chararray, size:chararray);

ordered_dsturl = ORDER output BY dsturl asc;
ordered_date = ORDER ordered_dsturl BY date asc;

store myurl4 into 'my_sorted_output'
