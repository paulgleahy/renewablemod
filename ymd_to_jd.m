%% ymd_to_jd.m
% PL 16.05.2017
% helper function for read_cams_radiation.m
% Converts dates from y.m.d format to julian day 
% Uses:
% X datenum_2_jd.m
%
function jd=ymd_to_jd(ymd)

%% pad with zeros if necessary in order to convert to matlab datevec format
n_cols=size(ymd,2);
n_extra_cols=6-n_cols;
extra_zeros=zeros(size(ymd,1),n_extra_cols);
dv=[ymd extra_zeros]; 
dn=datenum(dv);
%[yyyy doy]=datenum_2_jd(dn);
%jd=[yyyy doy];
jd=dn;