rng('default')  % For reproducibility
im = load('Sameiro_Trees.mat');
data = im.hsi;
[x,y,z] = size(data);

% Reshape
rdata = reshape(data,[x*y,z]);

% Finding index value, kmeans
num = svd(rdata);
% plot(num);
% [n] = index(num);

cl = kmeans(rdata,4);

% Reshape
sdata = reshape(cl,[x,y]);

mean1 = mean(rdata(cl==1,:));
mean2 = mean(rdata(cl==2,:));
mean3 = mean(rdata(cl==3,:));

figure
x=1:33;
plot(x,mean1,x,mean2,x,mean3);


var1 = var(rdata(cl==1,:));
var2 = var(rdata(cl==2,:));
var3 = var(rdata(cl==3,:));

figure
x=1:33;
plot(x,var1,x,var2,x,var3);


% Output
figure
c = jet(4);
cmap = colormap(c);
imshow(sdata,cmap);



% prùmìr + roptyl spektra

% function [n] = index(x)
%     mean = sum(x)/length(x);
%     N = [];
%     for i = 1:(length(x)-1)
%         if ((x(i)-x(i+1))>mean)
%             N = [N; i+1];
%         end
%     end
%     n=N;
% end


% 
% function [n] = display(x)
%    
% end