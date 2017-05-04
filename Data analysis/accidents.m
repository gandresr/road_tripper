clear
clc
load('accidentes.mat')
%%
fechas = accidentes(:,18);
long = cell2mat(accidentes(:,14));
lat = cell2mat(accidentes(:,15));
[~, dates] = min_date(fechas);
% Clustering by date, long, lat
dates = [long lat dates'];
[IDX, C] = kmeans(dates,round(30000*8/(360)));

for i = 1 : max(IDX)
    acc = dates(IDX == i,:);
    date_acc = min(acc(:,3));
    long = mean(acc(:,1));
    lat = mean(acc(:,2));
end