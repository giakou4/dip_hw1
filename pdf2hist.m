function h = pdf2hist(d, f)
% function h = histtransform(d, f)
% PDF2HIST 
%
% INPUT:
% d         : vector with sequental intervals
%             [d(1),d(2)],[d(2),d(3)],...,[d(end-1),d(end)] defined as
%             [d(1), d(2), d(3), ..., d(end-1), d(end)]
% f         : function pointer p=f(v), p is the prabability density in v
%
% OUTPUT:
% h         : values of histogram in d
%
% Author    : Nikolaos Giakoumoglou AEM: 9043
% Date      : 24/05/2020

n = length(d);
h = NaN*ones(n-1,1);

for i=1:n-1
    h(i) = feval(f,(d(i+1)+d(i))/2) * (d(i+1)-d(i));
end
h = h/sum(h);

end
