clear all;
clc;
Excel = 'ProyeccionesCondicionadas.xlsx';

% Escenario Base (Regla de Taylor)
% Carga proyecciones condicionadas
load('ConditionalForecast0_results.mat');
AA = oo_.conditional_forecast.cond.Mean;

list = {'i' 'Dpsae' 'Dpae' 'Dp' 'Dpm' 'ED4p' 'Ds' 'y' 'DY_eq'};

for ii = 1:numel(list)
    output(:,ii) = AA.(list{ii})(1:9);
end

xlswrite(Excel,output,'ConditionalForecast0','B3');


% Escenario 1 (Hawkish)
% Carga proyecciones condicionadas
load('ConditionalForecast1_results.mat');
AA = oo_.conditional_forecast.cond.Mean;

list = {'i' 'Dpsae' 'Dpae' 'Dp' 'Dpm' 'ED4p' 'Ds' 'y' 'DY_eq'};

for ii = 1:numel(list)
    output(:,ii) = AA.(list{ii})(1:9);
end

xlswrite(Excel,output,'ConditionalForecast1','B3');


% Escenario 2 (Dovish)
% Carga proyecciones condicionadas
load('ConditionalForecast2_results.mat');
AA = oo_.conditional_forecast.cond.Mean;

list = {'i' 'Dpsae' 'Dpae' 'Dp' 'Dpm' 'ED4p' 'Ds' 'y' 'DY_eq'};

for ii = 1:numel(list)
    output(:,ii) = AA.(list{ii})(1:9);
end

xlswrite(Excel,output,'ConditionalForecast2','B3');


% Escenario 3 (Tasa Constante)
% Carga proyecciones condicionadas
load('ConditionalForecast3_results.mat');
AA = oo_.conditional_forecast.cond.Mean;

list = {'i' 'Dpsae' 'Dpae' 'Dp' 'Dpm' 'ED4p' 'Ds' 'y' 'DY_eq'};

for ii = 1:numel(list)
    output(:,ii) = AA.(list{ii})(1:9);
end

xlswrite(Excel,output,'ConditionalForecast3','B3');


% Escenario 4 (Propuesta)
% Carga proyecciones condicionadas
load('ConditionalForecast4_results.mat');
AA = oo_.conditional_forecast.cond.Mean;

list = {'i' 'Dpsae' 'Dpae' 'Dp' 'Dpm' 'ED4p' 'Ds' 'y' 'DY_eq'};

for ii = 1:numel(list)
    output(:,ii) = AA.(list{ii})(1:9);
end

xlswrite(Excel,output,'ConditionalForecast4','B3');


%%
% Carga brecha del producto filtrada (hasta punto inicial)
% load('Filtrado_Base_satelite_results.mat');
% BB = oo_.SmoothedVariables;
% y = BB.y(1:80);
% DY_eq = BB.DY_eq(1:80);
% 
% %Output para hoja de Base Datos desde 2002
% 
% R=loadR('2202','Alt2');
% 
% output2=[R.i(qq(2002,1):qq(2021,4)) R.IPCsae(qq(2002,1):qq(2021,4))  R.IPCae(qq(2002,1):qq(2021,4)) R.IPC(qq(2002,1):qq(2021,4)) ];
% 
%  TC=R.TC(qq(2002,1):qq(2021,4));
% yy=[y DY_eq];
% 
% output3=[R.Dpsae(qq(2002,1):qq(2021,4))    R.Dpae(qq(2002,1):qq(2021,4))  R.Dp(qq(2002,1):qq(2021,4)) R.Dpm(qq(2002,1):qq(2021,4)) R.ED4p(qq(2002,1):qq(2021,4)) R.Ds(qq(2002,1):qq(2021,4)) R.D4psae(qq(2002,1):qq(2021,4)) ];
% 
% precios4trim=[R.D4p(qq(2002,1):qq(2021,4)) R.D4pm(qq(2002,1):qq(2021,4))];
% 
%  xlswrite(Excel,output2,'Data_Graphs','B3');
%   xlswrite(Excel,TC,'Data_Graphs','G3');
%   xlswrite(Excel,yy,'Data_Graphs','K3');
%  xlswrite(Excel,output3,'Data_Graphs','M3');
%  xlswrite(Excel,precios4trim,'Data_Graphs','U3');
% 
%  
%  fprintf('Datos copiados a <a href="matlab:winopen(''%s'')">%s</a>\n', Excel, Excel);
% 
% 
% save('Output_CF.mat', 'output')
% clear all;
% load('Output_CF.mat');