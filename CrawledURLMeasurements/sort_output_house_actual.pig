SET DEFAULT_PARALLEL 400;
SET pig.exec.reducers.max 4000;

myinput = load '/home/hdn11/input_house_full/' as (srcurl:chararray, dsturl:chararray, date:chararray, text:chararray, type:chararray, datatype:chararray, size:chararray);

ordered_dsturl = ORDER myinput BY dsturl asc, date asc;
--ordered_date = ORDER ordered_dsturl BY date asc;
ordered_dsturl_by_date = filter ordered_dsturl by $2 matches '.*$DATE.*';
ordered_dsturl_by_date_1 = foreach ordered_dsturl_by_date generate $1;
ordered_dsturl_by_date_2 = GROUP ordered_dsturl_by_date_1 BY $0;
ordered_dsturl_by_date_3 = FOREACH ordered_dsturl_by_date_2 GENERATE group,COUNT(ordered_dsturl_by_date_1) as totalcount;
store ordered_dsturl_by_date_3 into '/home/hdn11/house_actual_$DATE';
