close all; clear all; clc
% -----------------  Datos a graficar
x = [0:10];

y1 = rand(length(x),1);
y2 = 5*rand(length(x),1);
y3 = 0.6*sin(x);
y4 = 10*cos(x);
y5 = 50*x.^0.1;

% ------------------- Figura
f1 = figure(1);
s(1) = subplot(2,2,[1]); % Genero el axes, correspondiente al tamaño que queremos
% Este se puede modificar cambiando s(1).Position 
% Creo los axes para cada plot que sobrepondré, es este caso son 5
for ii = 2:5
    s(ii) = axes;
end

% -------------------- Grafico (el color que le asigne a cada plot, automáticamente se pondrá en el eje vertical)  
P(1) = plot(s(1),x,y1,'k');
P(2)  = plot(s(2),x,y2,'r');
P(3)=plot(s(3),x,y3,'b');
P(4) = plot(s(4),x,y4,'g');
P(5) = plot(s(5),x,y5,'m');

% Le quito el color a los axis, y le digo que los quiero a la derecha (o donde se quiera, habría que modificarlo)
for ii = 2:5   
    s(ii).Position = s(1).Position;
    s(ii).YAxisLocation = 'right';
    s(ii).XAxis.Color ='none';
    s(ii).YAxis.Color ='none';
    s(ii).Color = 'none';    
end

% Copio información de los ejes, y coloco los nuevos con un delta en x
s1(1) =s(1);
delta = 0.05;
cnt = 0;
for ii = 2:5
    s1(ii) = axes;
    s1(ii).YLim = s(ii).YLim;
    s1(ii).YTick = s(ii).YTick;
    s1(ii).YAxisLocation = s(ii).YAxisLocation;
    s1(ii).Color = 'none';
    s1(ii).Position = s(ii).Position;
    s1(ii).XAxis.Color ='none';
    s1(ii).YAxis.Color = P(ii).Color;
    s1(ii).Position(3) = s1(ii).Position(3) +cnt*delta;
    cnt = cnt+1;
end
% Las etiquetas y lo que se quiera, se pone con respecto a s1