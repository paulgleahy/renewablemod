%% PL 16.05.2017
% helper function for read_cams_radiation.
% convert dates: yd to ymd
% assumptions: 
% (1) dates are already sorted in ascending chronological order.
% (2) all dates fall within the same year.
%
function ymd=yd_to_ymd(yd)
yyyy=yd(:,1);
doy=yd(:,2);

%% convert to matlab datenumbers for easier processing
dv0=[yyyy(1) 1 1 0 0 0]; % 1st day of 1st year in input argument
dn0=datenum(dv0);

dn_all=dn0-1+doy; % subtract offset of one day (1st jan = day 1);

dv_all=datevec(dn_all);
ymd=dv_all(:,[1 2 3]);
