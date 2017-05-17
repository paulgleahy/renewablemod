function [data textdata time num_data_rows num_header_rows]=import_seai_meteo_data(filetoread)
%% import_seai_meteo_data.m
% PL : Imports meteo or generatoin data in the format used by the SEAI microgrid study,
% 2011-12.
% See: McCarthy, M. A Report on Micro-Generation in Ireland Sustainable
% Energy Authority of Ireland, 2011 for details of the study. 
%%
% Input argument:
% filetoread    string  file name +path of file to read data from
%
% Output arguments:
% data          double  array containing numeric data from file
% textdata      cell    array containing text read from file
% time          double  vector containing timebase calculated from values
% in file (matlab datenum format)
% num_data_rows
% num_header_rows
%% 
% Example:


%%
num_header_rows=4; % these files contain 4 rows of text header information
%[newData1.data newData1.textdata] = importdata(fileToRead1);
[newData1] = importdata(filetoread);
num_data_rows=size((newData1.data),1);


%% generate the timebase vector as a vector of Matlab datenumbers
time=zeros(num_data_rows,1)+NaN;
for i_t=1:num_data_rows;
    curr_time_string=newData1.textdata{i_t+num_header_rows,1};
    curr_time_string=strrep(curr_time_string,'"',''); % remove " characters from timestamps
    time(i_t)=datenum(curr_time_string,'yyyy-mm-dd HH:MM:SS');
end
%% create return variables
data=newData1.data;
textdata=newData1.textdata;
