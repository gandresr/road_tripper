function [mdate, ds] = min_date(dates)

datesSerial = [];
for i = 1 : length(dates)
    date = dates{i};
    index = 0;
    
    d1 = strsplit(date, ' ');
    ymd = strsplit(d1{1},'-');
    hms = strsplit(d1{2},':');
    
    year = str2num(ymd{1}); % year
    month = str2num(ymd{2}); % month
    day  = str2num(ymd{3}); % day
    
    days = str2num(hms{1})/24 + str2num(hms{2})/(24*60) + str2num(hms{3})/(24*60*60); % hours
    
    ds = datenum(datetime(year, month, day) + days);
    datesSerial = [datesSerial ds];
end   
ds = datesSerial;
mdate = datestr(min(datesSerial)); % min date of the cluster
end