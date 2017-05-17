%% jd_to_ymd.m
% PL 16.05.2017
% helper function for read_cams_radiation.m
% Converts list of dates from julian day number to ymd format 
%
% Uses:
% datenum_2_jd.m
%
% input argument 'jd' is assumed to be a vector of matlab datenumbers. 
function ymd = jd_to_ymd(jd)

ymd=datevec(jd);
ymd=ymd(:,1:4); % truncate to first 4  columns (y, m , d, X) for compatibility with read_cams_radiation_csv.m, line 112