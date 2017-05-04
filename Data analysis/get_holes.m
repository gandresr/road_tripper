%clear
%clc
load('holes.mat');
load('holesOut.mat');
load('nroutes.mat')
wazepotholes(1,:) = [];
% Not in Bogota

c = cellfun(@(x) strcmp(x,'Bogota'), wazepotholes(:,5)); 
data(c ~= 1,:) = [];

n = length(data);
%evalclusters(data, 'kmeans', 'CalinskiHarabasz', 'klist', round(1./(1:0.25:10)*n))
%load('holes.mat');
%%
[IDX,C] = kmeans(data, evals.OptimalK);

holes = {};
for i = 1 : max(IDX)
    % select alerts in cluster i
    streets = wazepotholes(IDX==i, 13);
    street = streets{1};
    % extract minimum date of cluster i
    date = min_date(wazepotholes(IDX == i, 18));
    
    holes{i,1} = i; % ID
    holes{i,2} = holesOut(i,2); % lat
    holes{i,3} = holesOut(i,3); % long
    holes{i,4} = date; % date 
    holes{i,5} = size(h,1); % thumbs up
    holes{i,6} = holesOut(i,4); % accidents
    holes{i,7} = nr(i);
    
    holes{i,8} = street;
end
%%
cell2csv('cluster_data.csv', holes); % COORD AVERAGE | DATE
C_ID = 1:length(IDX);
csvwrite('cluster_id.csv', {C_ID' IDX}); % CLUSTER_ID
