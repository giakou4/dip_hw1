function Y = histtransform(X, h, v)
% function Y = histtransform(X, h, v)
% HISTTRANSFORM takes an image X and transforms its histogram so as it
% conists of specific values 0<=v<=1 at a percentage defined from h so as
% sum(h)=1
%
% INPUT:
% X         : the gray-scale image
% h         : vector of the percenetage of pixels assigned to values v
% v         : vector of the transformed values of pixels
%
% OUTPUT:
% Y         : image after the histogram transformation
%
% Author    : Nikolaos Giakoumoglou AEM: 9043
% Date      : 24/05/2020

%{
if sum(h)~=1
    disp('Wrong input h. Sum must be equal to 1');
    Y = X; return;
end
flag = find(h<0);
if flag~=0
    disp('Negative input h');
    Y = X; return;
end
clear flag;
%}

[N1,N2] = size(X);
N = N1*N2;
Y = NaN*ones(N1,N2);

j=1;
cumsumh=cumsum(h);
for i=1:N %for each pixel
    [row,col]=find(X==min(X(:))); %find the index/indexes of the minimum
    Y(row(1),col(1)) = v(j); % assign only 1 of the minimum to the new image
                             % as the v(j) value, j=1,2,3,...,length(j)
    X(row(1),col(1)) = inf; % make the initial image's value inf so we wont
                            % use it twice
    if (cumsumh(j)*N<i) % if we exceed the h(j), increase j by one
        j = j + 1;
    end
    % no need to check if we exceed length(j), since sum of h is equal to 1
    % and we repeat the iteration exactly N times = number of pixels
end  

end

