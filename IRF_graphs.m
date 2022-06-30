clc; clear; close all;

H=12;
load('IRF_results');
%load('MPTBolsillo_Dynare_results');
losticks = [0 1 4:4:H];


%% Monetary policy shock

figure('Name','Prices to PM','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.D4psae_res_i;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.D4p_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.ED4p_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.D4pm_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('SAE','Total','Expectativas','Importada','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;

figure('Name','Interest rates to PM','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.i_res_i;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.Rmn_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.Rme_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.rmc_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('TPM','Tasa de interés real MN','Tasa de interés real ME','Condiciones monetarias','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;

figure('Name','Output to PM','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.y_res_i;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.EDy_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.DY_res_i;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Brecha producto','Confianza Empresarial','Crecimiento','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Exchange rate to PM','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.Ds_res_i;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
% v2p = oo_.irfs.EDs_res_i;
% P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Depreciación','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;



%% Importada shock
figure('Name','Prices to Imported','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.D4psae_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.D4p_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.ED4p_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.D4pm_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('SAE','Total','Expectativas','Importada','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Interest rates to Imported','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.i_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.Rmn_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.Rme_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.rmc_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('TPM','Tasa de interés real MN','Tasa de interés real ME','Condiciones monetarias','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Output to Imported','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.y_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.EDy_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.DY_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Brecha producto','Confianza Empresarial','Crecimiento','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Exchange rate to Imported','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.Ds_res_Dpms;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
% v2p = oo_.irfs.EDs_res_Dpms;
% P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Depreciación','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;

%% Confianza shock
figure('Name','Prices to Expectations','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.D4psae_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.D4p_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.ED4p_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.D4pm_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('SAE','Total','Expectativas','Importada','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Interest rates to Expectations','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.i_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.Rmn_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.Rme_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.rmc_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('TPM','Tasa de interés real MN','Tasa de interés real ME','Condiciones monetarias','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;



figure('Name','Output to Expectations','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.y_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.EDy_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.DY_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Brecha producto','Confianza Empresarial','Crecimiento','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;



figure('Name','Exchange rate to Expectations','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.Ds_res_EDy;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
% v2p = oo_.irfs.EDs_res_EDy;
% P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Depreciación','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;



%% Risk shock
figure('Name','Prices to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.D4psae_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.D4p_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.ED4p_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.D4pm_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('SAE','Total','Expectativas','Importada','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Interest rates to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.i_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.Rmn_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.Rme_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.rmc_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('TPM','Tasa de interés real MN','Tasa de interés real ME','Condiciones monetarias','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Output to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.y_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.EDy_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.DY_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Brecha producto','Confianza Empresarial','Crecimiento','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Exchange rate to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.Ds_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
% v2p = oo_.irfs.EDs_res_x;
% P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Depreciación','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


load('IRF_sin_hdb_results');
 hdb='0';
figure('Name','Prices to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.D4psae_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.D4p_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.ED4p_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.D4pm_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('SAE','Total','Expectativas','Importada','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Interest rates to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.i_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.Rmn_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.Rme_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.rmc_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('TPM','Tasa de interés real MN','Tasa de interés real ME','Condiciones monetarias','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;


figure('Name','Output to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.y_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
v2p = oo_.irfs.EDy_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
v2p = oo_.irfs.DY_res_x;
P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Brecha producto','Confianza Empresarial','Crecimiento','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;



figure('Name','Exchange rate to risk','Position',[680 258 560*1.1 420*0.9]);
v2p = oo_.irfs.Ds_res_x;
P0 = plot(0:(H-1),v2p(1:H)); hold on; P0.LineWidth = 2;
% v2p = oo_.irfs.EDs_res_x;
% P0 = plot(0:(H-1),v2p(1:H)); P0.LineWidth = 2;
axis tight;
L0 = line([0 H-1],[0 0]);
L0.Color = 'k'; L0.LineWidth = 1;
LL=legend('Depreciación','location','best');
LL.Box = 'off';
set(gca,'FontSize',14,'box','off');
    grid on;
