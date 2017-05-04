load('holes.mat');
holesOut=zeros(length(holes),5);
for j=1:length(holes)
    for i=1:50       
        isP=inpolygon(holes(j,2),holes(j,3),vorvx{1,i}(:,1), vorvx{1,i}(:,2)-74); 
        if(isP==1)
            holesOut(j,:)=[holes(j,:) outJam(i,1) i];
            break;
        end
    end
end

