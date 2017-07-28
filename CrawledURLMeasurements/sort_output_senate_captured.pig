myinput = load '/home/hdn11/input_senate_full/' as (srcurl:chararray, dsturl:chararray, date:chararray, text:chararray, type:chararray, datatype:chararray, size:chararray);

ordered_srcurl = ORDER myinput BY srcurl asc, date asc;
--ordered_date = ORDER ordered_dsturl BY date asc;
ordered_srcurl_by_date = filter ordered_srcurl by $2 matches '.*$DATE.*';
ordered_srcurl_by_date_1 = foreach ordered_srcurl_by_date generate $0;
ordered_srcurl_by_date_2 = GROUP ordered_srcurl_by_date_1 BY $0;
ordered_srcurl_by_date_3 = FOREACH ordered_srcurl_by_date_2 GENERATE group,COUNT(ordered_srcurl_by_date_1) as totalcount;
store ordered_srcurl_by_date_3 into '/home/hdn11/senate_captured_$DATE';
