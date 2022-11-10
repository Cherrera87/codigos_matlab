close all;clc
surf(peaks)
axis tight
caxis([0 3]) 
cb = colorbar; % Handle al colorbar
colormap(hsv)

% ------------------Generar triangulos en colorbar
s0 = axes;s1 = axes;n = 0.02;
hold(s0,'on');hold(s1,'on')
% Posición
s0.Position = [cb.Position(1) cb.Position(2)+cb.Position(4)-0.002 cb.Position(3) n];
s1.Position = [cb.Position(1) cb.Position(2)-n+0.002 cb.Position(3) n];

% identifico valores extremos del colorbar
cm = colormap;
% Triangulos
fill(s0,[0 0.5 1 0],[0 1 0 0],cm(end,:))
fill(s1,[0 0.5 1 0],[0 1 0 0],cm(1,:))
% Tick en los limites
P0 = plot(s0,[0.05 0.85],[0 0]);
P1 = plot(s1,[0.05 0.85],[0 0]);
P0.Color = cm(end,:);
P1.Color = cm(1,:);
% Quito cosas del axes
s0.Box = 'off';s0.XAxis.Color = 'none';s0.YAxis.Color = 'none';s0.XTickLabel = {};
s1.Box = 'off';s1.XAxis.Color = 'none';s1.YAxis.Color = 'none'; s1.XTickLabel = {};s1.XAxisLocation ='top';
s0.Color = 'none'; s1.Color = 'none';
s1.YDir= 'reverse';

