function Y = pointtransform(X, x1, y1, x2, y2)
% function Y = pointtransform(X, x1, y1, x2, y2)
% POINT TRANSFORM performs a point transformation to the image X
%
% INPUT:
% X         : the gray-scale image
% x1        : x-axe coordinates of 1st point
% y1    	: y-axe coordinates of 1st point
% x2        : x-axe coordinates of 2nd point
% y2    	: y-axe coordinates of 2nd point
%
% OUTPUT:
% Y         : the image after the point transformation
%
% Author    : Nikolaos Giakoumoglou AEM: 9043
% Date      : 24/05/2020
[N1,N2] = size(X);
Y = -inf*ones(N1,N2);
for n1=1:N1
    for n2=1:N2
        if X(n1,n2)>=0 && X(n1,n2)<x1 % if X(n1,n2) is in [0,x1)
            Y(n1,n2)=(y1/x1)*X(n1,n2); % Y(n1,n2)=a*X(n1,n2), a=y1/x1
        elseif X(n1,n2)>=x1 && X(n1,n2)<x2 % if X(n1,n2) is in [x1,x2)
            Y(n1,n2)=((y2-y1)/(x2-x1))*X(n1,n2) + (y1-((y2-y1)/(x2-x1))*x1);
            % Y(n1,n2)=a*X(n1,n2)+b, a=(y2-y1)/(x2-x1), b=y1-a*x1
        elseif X(n1,n2)>=x2 && X(n1,n2)<=1 % if X(n1,n2) is in [x2,1]
             Y(n1,n2)=((y2-1)/(x2-1)) + (1-((y2-1)/(x2-1)));
             %Y Y(n1,n2)=a*X(n1,n2)+b, a=(y2-1)/(x2-1), b=1-a
        end
    end
end

end

