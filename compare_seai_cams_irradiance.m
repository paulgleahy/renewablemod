%% compare_seai_cams_irradiance.m
% PL 16.05.2017
% 
% Compare solar irradiance from an SEAI microgrid test site and from the
% CAMS solar database
% 
%% define period of comparison
dv_start=   [2011 7 1 0 0 0]; % few days in july 2011
dv_end=     [2011 7 5 0 0 0 ];
dn_start=datenum(dv_start);
dn_end=datenum(dv_end);

%% define site characteristics
site.name='Dundalk';
site.id='DL300';
site.seai_id='19746753';
site.latitude=54.0;
site.longitude=-6.4;

%% import seai data
seai_path_name='D:\data\energy\seai_small_wind\';
%pv_file_name='CR800-OBE-DL300_PV_Power_jan2012.dat';
pv_file_name='CR800-OBE-DL300_PV_Power_july2011.dat';
filetoread=fullfile(seai_path_name,pv_file_name);
[data textdata time num_data_rows num_header_rows]=import_seai_meteo_data(filetoread);
% final column is global irradiance in W/m-2 

%% import cams data
cams_path_name='D:\data\energy\seai_small_wind\CAMS\DL300\';
cams_file_name='irradiation-d43cab18-3a1c-11e7-888f-f263d2606a89.csv'; % july 2011
%cams_file_name='irradiation-aa43f488-3a35-11e7-888f-f263d2606a89.csv'; % jan 2012

camsfiletoread=fullfile(cams_path_name,cams_file_name);
geopoint_cams=[site.latitude site.longitude 0];
camsdata=read_cams_radiation_csv(camsfiletoread, geopoint_cams, [2011 182], [2011 213], 15, 'UT', 0)

%% convert cams timebase to datenumbers
cams_dn=datenum(camsdata.ymdhms);

%% plot seai data
figure(1);
clf;
set(gcf,'name','irradiance data');

%subplot(2,1,1);
plot(time,data(:,8),'b-+');
xlim([dn_start dn_end]);

%subplot(2,1,2);
hold on;
plot(cams_dn,camsdata.GHI,'g-s');
relabel_x_axis_with_dates(gca, 5,'dd/mm/yyyy HH:MM');
ylabel('GHI, Wh/m2 (15 minute)');
xlim([dn_start dn_end]);
loc_str=[site.name,' Lat,long ',num2str(site.latitude),',',num2str(site.longitude)];
title_str=['CAMS and SEAI global horiz. irradiance ',loc_str];
title(title_str);
legend({'SEAI','CAMS'});


%% export fig
ds_start=datestr(dv_start);
fig_file_string=strcat('irradiance_',site.name,'_',ds_start,'.png');
saveas(gcf, fig_file_string, 'png');