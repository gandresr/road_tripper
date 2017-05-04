missing=holes(holesOut(:,1)==0,:);
holesP1=holes(holesOut(:,5)==1,:);
holesP30=holes(holesOut(:,5)==30,:);

figure;hold on;
for i=1:50
    plot(vorvx{1,i}(:,2),vorvx{1,i}(:,1),'r','LineWidth',3)          
end
plot(holesP1(:,3)+74,holesP1(:,2),'kx');
plot(holesP30(:,3)+74,holesP30(:,2),'bx');