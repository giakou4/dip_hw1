% Load image and convert it to gray-scale
close all; clear all; clc;
X = imread('lena.bmp');
X = rgb2gray(X);
X = double(X)/255;
figno = 1;
% Show the histogram of intensity values
[hn, hx] = hist(X(:), 0:1/255:1);
figure(figno); figno = figno + 1;
bar(hx, hn);
title('Histogram of Initial Image X [9043]');

% Show the image
figure(figno); figno = figno+1;
imshow(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% 1 Point Transforms %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Call to function pointtransform %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running pointtransform Case 1')
% Initialize parameters
x1 = 0.1961; y1 = 0.0392; x2 = 0.8039; y2 = 0.9608;
Y = pointtransform(X,x1,y1,x2,y2);

figure(figno); figno = figno + 1;
plot([0;x1;x2;1],[0;y1;y2;1],'LineWidth',2); grid on;
title('Case 1 Points [9043]'); xlabel('Input'); ylabel('Output');

[hn, hy] = hist(Y(:), 0:1/255:1);
figure(figno); figno = figno + 1;
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 1 [9043]');

figure(figno); figno = figno+1;
imshow(Y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running pointtransform Case 1');
% Initialize parameters
x1 = 0.5; y1 = 0; x2 = 0.5; y2 = 1;
Y = pointtransform(X,x1,y1,x2,y2);

figure(figno); figno = figno + 1;
plot([0;x1;x2;1],[0;y1;y2;1],'LineWidth',2); grid on;
title('Case 1 Points [9043]'); xlabel('Input'); ylabel('Output');

[hn, hy] = hist(Y(:), 0:1/255:1);
figure(figno); figno = figno + 1;
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 2 [9043]');

figure(figno)
figno = figno+1;
imshow(Y)

pause();
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% 2 Histogram Transforms %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% 2.1 Call to function histtransform %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
disp('Running histtransform Case 1');
% Initialize parameters
L = 10;
v = linspace (0, 1, L);
h = ones([1, L]) / L;

%Plot  v-h
figure(figno); figno = figno + 1;
plot(v,h,'--o');
xlabel('intensity v'); ylabel('histogram (%) h');  ylim([0 1]);
title('Histogram(%) vs Intensity Case 1 [9043]');

% Run HISTTRANSFORM
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 1 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 1 [9043]')

% Plot simulated vs analytic histograms
figure(figno); figno = figno+1;
[Nx, Xx] = hist(Y(:),10);
plot(Xx,Nx/sum(Nx),'.-k');
hold on
plot(Xx',h,'c')
legend('simulated','analytic');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running histtransform Case 2')
% Initialize parameters
L = 20;
v = linspace (0, 1, L);
h = ones([1, L]) / L;

%Plot  v-h
figure(figno); figno = figno + 1;
plot(v,h,'--o');
xlabel('intensity v'); ylabel('histogram (%) h'); ylim([0 1]);
title('Histogram(%) vs Intensity Case 2 [9043]');

% Run HISTTRANSFORM
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 2 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 2 [9043]')

% Plot simulated vs analytic histograms
figure(figno); figno = figno+1;
[Nx, Xx] = hist(Y(:),20);
plot(Xx,Nx/sum(Nx),'.-k');
hold on
plot(Xx',h,'c')
legend('simulated','analytic');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Running histtransform Case 3')
% Initialize parameters
L = 10;
v = linspace (0, 1, L);
h = normpdf(v, 0.5) / sum(normpdf(v, 0.5));

%Plot  v-h
figure(figno); figno = figno + 1;
plot(v,h,'--o');
xlabel('intensity v'); ylabel('histogram (%) h');  ylim([0 0.2]);
title('Histogram(%) vs Intensity Case 3 [9043]');

% Run HISTTRANSFORM
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 3 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 3 [9043]')

% Plot simulated vs analytic histograms
figure(figno); figno = figno+1;
[Nx, Xx] = hist(Y(:),10);
ypdf = normpdf(Xx, 0.5,1);
ypdf = ypdf/sum(ypdf);
plot(Xx,Nx/sum(Nx),'.-k');
hold on
plot(Xx',ypdf,'c')
legend('simulated','analytic');

pause();
%%%%%%%%%%%%%%%%%%%%%%% 2.3 Transform based on pdf %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Case 1 - Uniform distribution in [0,1]
disp('Running pdf2hist Case 1')
f = @(v) 1;
d = 0:0.01:1;
v = d;
h = pdf2hist(d, f);
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 1 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 1 [9043]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Uniform distribution in [0,2]
disp('Running pdf2hist Case 2');
f = @(v) 0.5;
d = 0:0.01:2;
v = d;
h = pdf2hist(d, f);
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 2 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 2 [9043]')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Case 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Case 3 - Normal(Gaussian) distribution with mean 0.5 and variance 0.1
disp('Running pdf2hist Case 3')
f = @(v) (1/(0.1*sqrt(2*pi)))*exp(-0.5*(((v-0.5)/0.1).^2));
d = 0:0.01:1;
v = d;
h = pdf2hist(d, f);
Y = histtransform(X, h, v);

% Plot histogram of transformed image Y
figure(figno); figno = figno + 1;
[hn, hy] = hist(Y(:), 0:1/255:1);
bar(hy, hn);
title('Histogram of Image after Point Transform - Case 3 [9043]');

% Show transformed image Y
figure(figno); figno = figno+1;
imshow(Y)
title('Image after Histogram Transform - Case 3 [9043]')