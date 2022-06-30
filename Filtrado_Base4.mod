% ===================================================================================
% MODELO DE PROYECCI�N TRIMESTRAL REDUCIDO
% ===================================================================================
% Banco Central de Reserva del Per�
% Curso de Extensi�n en Econom�a 2022
% ===================================================================================

% &state-variables % Variables ========================================================
var

% Crecimiento del Producto y Potencial
DY        % Crecimiento anualizado del PBI 
DY_eq     % Crecimiento potencial anualizado del PBI
DYs       % Crecimiento anualizado externo
DYs_eq    % Crecimiento potencial anualizado externo

% Inflaci�n
Dpc	      % Inflaci�n subyacente
D4pc      % Inflaci�n subyacente (4 trimestres)
Dpae      % Inflaci�n de alimentos y energ�a
Dp	      % Inflaci�n total
D4p	      % Inflaci�n total (4 trimestres)
Dpsae     % Inflaci�n sin alimentos ni energ�a
D4psae    % Inflaci�n sin alimentos ni energ�a (4 trimestres)
ED4p      % Expectativa de inflaci�n 4 trimestres en adelante
D4pdev    % Desv�o de la inflaci�n respecto a la meta
Dpm       % Inflaci�n importada en S/ 
D4pm      % Inflaci�n importada en S/ (4 trimestres)
Meta      % Meta de inflaci�n

% Tasas de inter�s en moneda nacional
i    	  % Tasa de inter�s de referencia
in        % Drift de la Regla de Taylor
imn		  % Tasa de inter�s interbancaria en S/
Rmn 	  % Tasa de inter�s real dom�stica
Rmn_eq    % Tasa de inter�s natural real en S/
zmn       % Otros determinantes de la tasa de inter�s natural real
rmn       % Brecha de la tasa de inter�s real dom�stica

% Tasas de inter�s en moneda extranjera
ime		  % Tasa de inter�s interbancaria en US$ 
Rme       % Tasa de inter�s real externa expresada en S/
Rme_eq    % Tasa de inter�s natural real externa expresada en S/
zme       % Otros determinantes de la tasa de inter�s natural real externa expresada en S/  
rme       % Brecha de la tasa de inter�s real externa expresada en S/

% Tipo de cambio
Ds        % Depreciaci�n nominal
D4s       % Depreciaci�n nominal (4 trimestres)
ED4s      % Expectativa de depreciaci�n 4 trimestres en adelante
x	      % Prima por riesgo (riesgo pa�s + riesgo cambiario)
x_eq 	  % Prima por riesgo de equilibrio
DQ		  % Depreciaci�n real
q	      % Brecha del tipo de cambio real
DQ_eq     % Depreciaci�n real de equilibrio

% Brecha del producto y sus determinantes
y		  % Brecha del producto
EDy       % Expectativas del crecimiento de la brecha producto  
rmc	      % �ndice de condiciones monetarias reales
t         % Cambio en la Recaudaci�n estructural
g         % Cambio en el Gasto P�blico como porcentaje del potencial 
DTI       % Crecimiento de los t�rminos de intercambio
tau       % Brecha de los t�rminos de intercambio

% Econom�a externa
Dps       % Inflaci�n externa (IPE puro)
D4ps      % Inflaci�n externa (IPE puro, 4 trimestres)
Dpms      % Inflaci�n importada en US$ 
is        % Tasa de inter�s nominal externa de corto plazo
rs        % Brecha de la tasa de inter�s real externa
ys        % Brecha del producto de los socios comerciales
ins       % Drift de la Regla de Taylor externa
Rs        % Tasa de inter�s real externa
Rs_eq     % Tasa de inter�s natural real externa
z;        % Otros determinantes de la tasa de inter�s natural real externa

% &residual-variables % Choques =======================================================
varexo

% Crecimiento del PBI potencial
res_DY_eq

% Inflaci�n
res_Dpc    % Curva de Phillips
res_Dpae   % Inflaci�n no subyacente
res_Dpsae  % Inflaci�n sin alimentos ni energ�a
res_ED4p   % Expectativas de inflaci�n
res_Dpm    % Inflaci�n importada (en soles)
res_Meta   % Meta de inflaci�n

% Tasas de inter�s en moneda nacional
res_i      % Regla de pol�tica monetaria
res_in     % Tasa de inter�s nominal neutral
res_imn    % Tasa de inter�s interbancaria en S/
res_zmn    % Otros determinantes de la tasa natural real en S/

% Tasas de inter�s en moneda extranjera
res_ime    % Tasa de inter�s interbancaria en US$ 
res_zme    % Tasa de inter�s real externa expresada en S/ de equilibrio    

% Tipo de cambio
res_Ds     % Paridad descubierta de tasas de inter�s 
res_ED4s   % Expectativas de depreciaci�n cuatro trimestres en adelante
res_x      % Prima por riesgo cambiario
res_x_eq   % Prima de riesgo cambiario de equilibrio
res_DQ_eq  % Depreciaci�n real de equilibrio

% Brecha del producto y sus determinantes
res_y      % Demanda agregada
res_EDy    % Expectativas de crecimiento de la brecha producto
res_t      % Shock de ingreso
res_g      % Shock de gasto
res_DTI    % Crecimiento de los t�rminos de intercambio
res_tau    % Brecha de los t�rminos de intercambio

% Econom�a externa
res_DYs_eq % Crecimiento potencial externo
res_Dps    % Curva de Phillips externa
res_Dpms   % Precio de las importaciones (en d�lares, 4 trimestres)
res_is     % Regla de pol�tica monetaria externa
res_ys     % Demanda agregada externa
res_ins    % Drift de la Regla de Taylor externa
res_z;     % Tasa de inter�s natural real externa

% &parameters % Estado estacionario ===================================================
parameters 

DY_ss      % Crecimiento Potencial del PBI
rho_DY_eq  % Persistencia del crecimiento potencial

Dp_ss	   % Inflaci�n dom�stica
Dps_ss	   % Inflaci�n externa
i_ss       % Tasa de inter�s nominal dom�stica
is_ss      % Tasa de inter�s nominal externa
Ds_ss      % Depreciaci�n nominal
x_ss	   % Prima por riesgo


Rmn_ss     % Tasa de inter�s real dom�stica
Rme_ss     % Tasa de inter�s real externa expresada en S/

Rs_ss
% &coefficients % Coeficientes ========================================================

% Inflaci�n
bm, bsae, by, cy                   % Curva de Phillips
rho_Dpae, bs                       % Inflaci�n no subyacente 
csae                               % Inflaci�n total
cFL, cFc                           % Desv�os de la inflaci�n
rho_ED4p, cp                       % Expectativas de inflaci�n
cmm, cmq                           % Inflaci�n importada en S/. (4 trimestres)
cpms                               % Precio de las importaciones en US$ (4 trimestres)
rho_Dpc, cpsae                     % Inflaci�n sin alimentos ni energ�a

% Tasas de inter�s en moneda nacional
fi, fp, fy, cfy                    % Regla de pol�tica monetaria
rho_in                             % Tasa de inter�s neutral (nominal)
rho_zmn, cY_mn, cR_mn              % Tasa de inter�s natural real dom�stica

% Tasas de inter�s en moneda extranjera
rho_zme, cY_me, cR_me              % Tasa de inter�s real externa de equilibrio (en S/) 

% Tipo de cambio
rho_Ds                             % Paridad descubierta de tasas de inter�s
rho_ED4s                           % Expectativas de depreciaci�n 4 trimestres en adelante
rho_x                              % Prima de riesgo cambiario de equilibrio
rho_DQ                             % Depreciaci�n real de equilibrio, t�rmino de correcci�n                             

% Brecha del producto y sus determinantes
ay, aEy, armc, atau, at, ag, aq, ays,   % Demanda agregada
rho_EDy                                 % Expectativas del crecimiento de la brecha producto 
crmn, crme, chb                         % �ndice de condiciones monetarias reales
rho_DTI, atauc, ataul                   % Crecimiento y brecha de los t�rminos de intercambio
rho_t, rho_g                            % Impulso fiscal

% Econom�a externa
DYs_ss
rho_DYs_eq
bsp, bsy                           % Curva de Phillips externa
fsi, fsp, fsy                      % Regla de pol�tica monetaria externa
rho_ins                            % Tasa natural
asy, asEy, asr                     % Demanda agregada externa
rho_z, cY_s                        % Tasa de inter�s real externa de equilibrio
 
%% Varianzas de los shocks (Provenientes de la estimaci�n)
m_res_DY_eq, m_res_in, m_res_zmn, m_res_zme,
m_res_Dpsae, m_res_Dpae, m_res_ED4p, m_res_Dpm,
m_res_i, m_res_imn, 
m_res_ime, 
m_res_Ds, m_res_ED4s, m_res_x, m_res_DQ_eq,
m_res_y, m_res_EDy,
m_res_Dps, m_res_is, m_res_ys, m_res_ins, m_res_z, m_res_DYs_eq, m_res_Dpms;

load('Coeficientes.mat');

set_param_value('m_res_DY_eq',CC.res_DY_eq);
set_param_value('m_res_in',CC.res_in);
set_param_value('m_res_zmn',CC.res_zmn);
set_param_value('m_res_zme',CC.res_zme);

set_param_value('m_res_Dpsae',CC.res_Dpsae);
set_param_value('m_res_Dpae',CC.res_Dpae);
set_param_value('m_res_ED4p',CC.res_ED4p);
set_param_value('m_res_Dpm',CC.res_Dpm);

set_param_value('m_res_i',CC.res_i);
set_param_value('m_res_imn',CC.res_imn);
set_param_value('m_res_ime',CC.res_ime);

set_param_value('m_res_Ds',CC.res_Ds);
set_param_value('m_res_ED4s',CC.res_ED4s);
set_param_value('m_res_x',CC.res_x);
set_param_value('m_res_DQ_eq',CC.res_DQ_eq);

set_param_value('m_res_y',CC.res_y);
set_param_value('m_res_EDy',CC.res_EDy);

set_param_value('m_res_Dps',CC.res_Dps);
set_param_value('m_res_is',CC.res_is);
set_param_value('m_res_ys',CC.res_ys);
set_param_value('m_res_ins',CC.res_ins);
set_param_value('m_res_z',CC.res_z);
set_param_value('m_res_DYs_eq',CC.res_DYs_eq);
set_param_value('m_res_Dpms',CC.res_Dpms);

%% CALIBRACI�N BASE 
%% ESTADO ESTACIONARIO
DY_ss = 6; DYs_ss = 2.2; Dp_ss = 2.0; Dps_ss = 2.0; i_ss  = 3.0; is_ss = 1.4; Rs_ss  = -1.1;
Ds_ss = 0.0; x_ss = i_ss - (is_ss + Ds_ss); Rmn_ss = 7.75; Rme_ss = 3.5;
cFL = 1; cFc = 0; rho_Dpc = 0; cpsae = 0.8845; chb =1;
%% Parametros

% Crecimiento potencial:        DY_eq = (1 - rho_DY_eq)*DY_ss + rho_DY_eq*DY_eq{-1} + res_DY_eq;
rho_DY_eq = 0.99;

% Curva de Phillips:            Dpsae = bm*D4pm + (1-bm)*(bsae*Dpsae(-1) + (1 - bsae)*ED4p) +  by*(cy*y + (1 - cy)*y(-1)) + res_Dpsae;
set_param_value('bm',CC.bm);
set_param_value('bsae',CC.bsae);
by=0.25;
cy = 0.0;

% Inflaci�n no subyacente:      Dpae = (1 - rho_Dpae)*( bs*Dpsae + (1 - bs)*Dpm )+ rho_Dpae*Dpae(-1) + res_Dpae;
rho_Dpae = 0;
set_param_value('bs',CC.bs);

% Inflaci�n total:              Dp = csae*Dpsae + (1 - csae)*Dpae;
csae = 0.55274; 
 
% Expectativas de inflaci�n:    ED4p = rho_ED4p*ED4p(-1) + (1 - rho_ED4p)*( (1 - cp)*D4psae(+4) + cp*D4p(-1) ) + res_ED4p;
set_param_value('rho_ED4p',CC.rho_ED4p);
set_param_value('cp',CC.cp);

% Inflaci�n importada en S/:   Dpm  = cmm*Dpm(-1) + (1 - cmm)*D4pm(+4) + cmq*( q + q(-1) )/2 + res_Dpm;        
set_param_value('cmm',CC.cmm);
set_param_value('cmq',CC.cmq);

% Regla de pol�tica monetaria:  i = fi*i(-1) + (1 - fi)*( in + fp*D4pdev + fy*( cfy*y + (1 - cfy)*y(-1) ) ) + res_i;
fi = 0.70; fp = 1.50; fy = 0.50; cfy = 0.50;

% Tasa de inter�s nominal neutral in = (1 - rho_in)*i_ss + rho_in*in(-1) + res_in;
rho_in = 0.95;
set_param_value('rho_zmn',CC.rho_zmn);
set_param_value('rho_zme',CC.rho_zme);
set_param_value('cY_mn',CC.cY_mn);
set_param_value('cY_me',CC.cY_me);
set_param_value('cR_mn',CC.cR_mn);
set_param_value('cR_me',CC.cR_me);

% PDI:                          Ds = rho_Ds*Ds(+1) + (1 + rho_Ds)*( ime + x - imn) +  res_Ds;
set_param_value('rho_Ds',CC.rho_Ds);
 
% Expectativas de depreciaci�n: ED4s = rho_ED4s*ED4s(-1) + (1 - rho_ED4s)*D4s(+4) + res_ED4s; 
set_param_value('rho_ED4s',CC.rho_ED4s);

% Prima de riesgo cambiario:    x = (1 - rho_x)*x_ss + rho_x*x(-1)+ res_x;
set_param_value('rho_x',CC.rho_x);

% Brecha del tipo de cambio real: q = (1/(4+rho_DQ))*(4*q(-1) + Dpe + Ds - Dp - res_DQ_eq);
set_param_value('rho_DQ',CC.rho_DQ);

% Demanda agregada:             y = ay*y(-1) + aEy*(y(-1) + EDy) + armc*rmc(-1) - at*t + ag*g + aq*(q/sq) + atau*(tau/stau)+ ays*ys + res_y;
set_param_value('ay',CC.ay);
set_param_value('aEy',CC.aEy);
armc=0.3;
set_param_value('atau',CC.atau);
set_param_value('ays',CC.ays);
set_param_value('aq',CC.aq);
set_param_value('ag',CC.ag);
set_param_value('at',CC.at);

% Confianza empresarial:        EDy = rho_EDy*EDy(-1) + (1 - rho_EDy)*( y(+1) - y(-1) ) + res_Ey;  
set_param_value('rho_EDy',CC.rho_EDy);

% Condiciones monetarias:       rmc = -( crmn*rmn + crme*rme + chb*( x - x_eq ) );
crmn = 0.60; crme = 1 - crmn; 
 
% Impulso de TI:                tau = (ataul + atauc)*tau(-1) - ataul*atauc*tau(-2) + (ataul - atauc)*DTI/4+res_tau;
atauc = 1 - 2/(2 + 1); ataul = 1 - 2/(8 + 1);% ataul = 1 - 2/(20 + 1); 

% Impulso fiscal:               phi = Ddef + cphi*( y - y(-1) );
//cphi = 0.2760;

% Cambios en los gastos fiscales estructurales: t = rho_t*t(-1) + res_t;
set_param_value('rho_t',CC.rho_t);

% Cambios en los gastos fiscales estructurales: g = rho_g*g(-1) + res_g;
set_param_value('rho_g',CC.rho_g);

% Curva de Phillips externa:    Dps = bsp*4ps(-1) + (1 - bsp)*D4ps(+4) +  bsy*ys(-1) + res_Dps;  
set_param_value('bsp',CC.bsp);
set_param_value('bsy',CC.bsy);

% D�lar canasta:                Dusc = rho_Dusc*Dusc{-1} + res_Dusc;
% rho_Dusc = 0; 

% Inflaci�n importada en US$    Dpms = (1 - cpms)*Dpe + cpms*Dpe{-1} + res_Dpms; 
cpms = 0.2;

% Regla de pol�tica externa:    is  = fsi*is{-1} + (1 - fsi)*(is_ss + fsp*(D4ps{+4} - Dps_ss) + fsy*ys) + res_is;
fsi = 0.70; fsp = 1.5; fsy = 0.5;

% Tasa Natural: ins = (1-rho_ins)*is_ss + rho_ins*ins(-1) + res_ins;
rho_ins = 0.95;

% Demanda agregada externa:     ys = asEy*ys(+1) + asy*ys(-1) - asr*rs(-1) + res_ys; 
rho_DYs_eq = 0.99;

set_param_value('asEy',CC.asEy);
set_param_value('asy',CC.asy);
set_param_value('asr',CC.asr);

rho_DTI  = 0;

% Tasa de inter�s real externa de equilibrio: Rs_eq = (1-rho_Rs_eq)*(ins - is_ss + Rs_ss) + rho_Rs_eq*Rs_eq(-1) + res_Rs_eq;
set_param_value('rho_z',CC.rho_z); 
set_param_value('cY_s',CC.cY_s);
 
% &state-equations % Ecuaciones =======================================================
model;

% Ecuaci�n de Medida
DY = 4*(y - y(-1)) + DY_eq; 

% Crecimiento potencial
DY_eq = (1 - rho_DY_eq)*DY_ss + rho_DY_eq*DY_eq(-1) + res_DY_eq;

% ------------------------------------------------------------------------------
% Inflaci�n
% ------------------------------------------------------------------------------

% Curva de Phillips
Dpsae = bm*D4pm + (1 - bm)*(bsae*Dpsae(-1) + (1 - bsae)*ED4p) +  by*(cy*y + (1 - cy)*y(-1)) + res_Dpsae;

% Inflaci�n SAE (4 trimestres)
D4psae = (Dpsae + Dpsae(-1) + Dpsae(-2) + Dpsae(-3))/4;

% Inflaci�n alimentos y energ�a
Dpae = (1 - rho_Dpae)*( bs*Dpsae + (1 - bs)*Dpm )+ rho_Dpae*Dpae(-1) + res_Dpae;

% Inflaci�n total
Dp = csae*Dpsae + (1 - csae)*Dpae;

% Inflaci�n total (4 trimestres)
D4p = (Dp + Dp(-1) + Dp(-2) + Dp(-3))/4;

% Inflaci�n subyacente
Dpc = (1 - rho_Dpc)*( cpsae*Dpsae + (1 - cpsae)*Dpae ) + rho_Dpc*Dpc(-1) + res_Dpc;

% Inflaci�n subyacente (4 trimestres)
D4pc = (Dpc + Dpc(-1) + Dpc(-2) + Dpc(-3))/4;

% Expectativas de inflaci�n
ED4p = rho_ED4p*ED4p(-1) + (1 - rho_ED4p)*((1 - cp)*D4psae(+4) + cp*D4p(-1)) + res_ED4p;

% Desv�os de la inflaci�n
D4pdev = cFL*( cFc*D4pc(+4) + (1 - cFc)*D4psae(+4) ) + (1 - cFL)*( cFc*Dpc + (1 - cFc)*Dpsae ) - Meta;

% Inflaci�n importada en S/. (Curva de Phillips importada)
Dpm = cmm*Dpm(-1) + (1 - cmm)*D4pm(+4) + cmq*( Dpms(-1) + Ds(-1) - Dpm(-1) )+  res_Dpm;

% Inflaci�n importada en S/ (4 trimestres)
D4pm = (Dpm + Dpm(-1) + Dpm(-2) + Dpm(-3))/4;

% Meta de inflaci�n
Meta = 0.5*Dp_ss + 0.5*Meta(-1) + res_Meta;

% --------------------------------------------------------------------------------------------------
% Tasas de inter�s en moneda nacional
% --------------------------------------------------------------------------------------------------

% Regla de pol�tica monetaria
i = fi*i(-1) + (1 - fi)*( in + fp*D4pdev + fy*( cfy*y + (1 - cfy)*y(-1) ) ) + res_i;

% Drift de la Regla de Taylor
in = (1 - rho_in)*i_ss + rho_in*in(-1) + res_in;

% Tasa de inter�s interbancaria en S/
imn = i + res_imn;

% Tasa de inter�s real dom�stica
Rmn = imn - ED4p;

% Tasa de inter�s real dom�stica de equilibrio
Rmn_eq = zmn + cY_mn*(DY_eq(+1)-DY_ss) + cR_mn*(DYs_eq(+1)-DYs_ss);
zmn = (1-rho_zmn)*Rmn_ss + rho_zmn*zmn(-1) + res_zmn;

% Brecha de la tasa de inter�s real dom�stica
rmn = Rmn - Rmn_eq;

% --------------------------------------------------------------------------------------------------
% Tasas de inter�s en moneda extranjera
% --------------------------------------------------------------------------------------------------

% Tasa de inter�s interbancaria en US$ 
ime = is + res_ime;

% Tasa de inter�s real externa expresada en S/
Rme = ime - ED4p + ED4s;

% Tasa de inter�s real externa expresada en S/ de equilibrio
Rme_eq = zme + cY_me*(DY_eq(+1)-DY_ss) + cR_me*(DYs_eq(+1)-DYs_ss);
zme = (1-rho_zme)*Rme_ss + rho_zme*zme(-1) + res_zme;

% Brecha de la tasa de inter�s real externa expresada en S/
rme = Rme - Rme_eq;

% --------------------------------------------------------------------------------------------------
% Tipo de cambio
% --------------------------------------------------------------------------------------------------

% Paridad descubierta de tasas de inter�s modificada
Ds = rho_Ds*Ds(+1) + (1 + rho_Ds)*( ime + x - imn + res_Ds );

% Depreciaci�n nominal (4 trimestres)
D4s = (Ds + Ds(-1) + Ds(-2) + Ds(-3))/4;

% Expectativas de depreciaci�n 4 trimestres en adelante
ED4s = rho_ED4s*ED4s(-1) + (1 - rho_ED4s)*(rho_Ds*D4s(+4) - (Ds - 5*Ds_ss)/4)/(1 + rho_Ds) + res_ED4s;

% Prima por riesgo cambiario
x = x_eq + res_x;

% Prima por riesgo cambiario de equilibrio
x_eq = (1 - rho_x)*x_ss + rho_x*x_eq(-1) + res_x_eq;

% Depreciaci�n real
DQ = Dps + Ds - Dp;

% Brecha del tipo de cambio real
q = q(-1) + (DQ - DQ_eq)/4;

% Depreciaci�n real de equilibrio
DQ_eq = rho_DQ*q + res_DQ_eq;

% --------------------------------------------------------------------------------------------------
% Brecha del producto y sus determinantes
% --------------------------------------------------------------------------------------------------

% Demanda agregada
y = ay*y(-1) + aEy*(y(-1) + EDy) + armc*rmc(-1) - at*t + ag*g + aq*q + atau*tau+ ays*ys + res_y;

% Expectativas de crecimiento de la brecha producto
EDy = rho_EDy*EDy(-1) + (1 - rho_EDy)*(y(+1) - y(-1)) + res_EDy;

% �ndice de condiciones monetarias reales
rmc = -( crmn*rmn + crme*rme + chb*( x - x_eq ) );

% Cambio en los ingresos estructurales
t = rho_t*t(-1) + res_t;

% Cambio en el gasto p�blico
g = rho_g*g(-1) + res_g;

% Crecimiento anualizado de los t�rminos de intercambio
DTI = rho_DTI*DTI(-1) + res_DTI;

% Impulso de los t�rminos de intercambio
tau = (ataul + atauc)*tau(-1) - ataul*atauc*tau(-2) + (ataul - atauc)*DTI/4 + res_tau;

% --------------------------------------------------------------------------------------------------
% Econom�a externa
% --------------------------------------------------------------------------------------------------

% Curva de Phillips externa
Dps = bsp*Dps(-1) + (1 - bsp)*D4ps(+4) + bsy*ys(-1) + res_Dps;

% Inflaci�n externa (IPE puro, 4 trimestres) 
D4ps = (Dps + Dps(-1) + Dps(-2) + Dps(-3))/4;

% Inflaci�n importada en US$
Dpms = (1 - cpms)*Dps + cpms*Dps(-1) + res_Dpms;

% Regla de pol�tica monetaria (Libor en US$ a 3 meses)
is = fsi*is(-1) + (1 - fsi)*(ins + fsp*(D4ps(+4) - Dps_ss) + fsy*ys) + res_is;

% Drift de Regla de Taylor externa
ins = (1-rho_ins)*is_ss + rho_ins*ins(-1) + res_ins;

% Tasa de inter�s real externa 
Rs = is - D4ps(+4);

% Tasa de inter�s real externa de equilibrio
Rs_eq = z + cY_s*(DYs_eq(+1)-DYs_ss);
z = (1-rho_z)*Rs_ss + rho_z*z(-1) + res_z;

% Brecha de la tasa de inter�s real externa
rs = Rs - Rs_eq;

% Ecuaci�n de medida

DYs = 4*(ys-ys(-1)) + DYs_eq;

% Crecimiento potencial de los socios comerciales
DYs_eq = (1 - rho_DYs_eq)*DYs_ss + rho_DYs_eq*DYs_eq(-1) + res_DYs_eq;

% Demanda agregada externa
ys = asEy*ys(+1) + asy*ys(-1) - asr*rs(-1) + res_ys; 

end;

shocks; 
var	res_DY_eq   = m_res_DY_eq;

var	res_Dpc;     stderr 0.99;
var	res_Dpsae   = m_res_Dpsae;
var	res_Dpae    = m_res_Dpae;
var	res_ED4p    = m_res_ED4p;
var	res_Dpm     = m_res_Dpm;
var	res_i       = m_res_i;
var	res_in      = m_res_in;

var	res_imn     = m_res_imn;
var	res_zmn     = m_res_zmn;

var	res_ime     = m_res_ime;
var	res_zme     = m_res_zme;

var	res_Ds      = m_res_Ds;
var	res_ED4s    = m_res_ED4s;
var	res_x       = m_res_x;
var res_x_eq;    stderr 0.65;
var	res_DQ_eq   = m_res_DQ_eq; 

var	res_y       = m_res_y; 
var	res_EDy     = m_res_EDy;
var	res_t;       stderr 0.91;
var	res_g;       stderr 1.25;
var	res_DTI;     stderr	19.03;
var res_tau;     stderr 0.3446;

var	res_Dps    = m_res_Dps;
var	res_is     = m_res_is;
var	res_ys     = m_res_ys;
var res_ins    = m_res_ins; 
var res_z      = m_res_z; 
var res_DYs_eq = m_res_DYs_eq; 
var	res_Dpms   = m_res_Dpms;

end;

%% Variables observables

varobs

DY   , % Crecimiento trimestral anualizado del PBI
%y    , % Brecha del producto
%DY_eq, % Crecimiento potencial anualizado
Dpsae, % Inflaci�n trimestral SAE
%Dpae , % Inflaci�n trimestral AE 
%Dpm  , % Inflaci�n importada en S/.
ED4p , % Expectativa de inflaci�n 4 trimestres en adelante
i    , % Tasa de inter�s de referencia
%imn  , % Tasa de inter�s interbancaria en S/.
%ime  , % Tasa de inter�s interbancaria en US$
%Ds   , % Depreciaci�n nominal
%x    , % Prima por riesgo (riesgo pa�s + riesgo cambiario)
%ED4s , % Expectativa de depreciaci�n 4 trimestres en adelante
DTI  , % Crecimiento de los t�rminos de intercambio
EDy  ; % Expectativas del crecimiento de la brecha producto (Confianza empresarial)
%Dpms , % Inflaci�n importada en US$ (Deflactor de los t�rminos de intercambio)
%tau  , % Impulso de los t�rminos de intercambio
%g    , % Impulso del gasto p�blico
%t    , % Impulso de los impuestos

%%%% Variables externas
%Dps     ,   % Inflaci�n externa
%is      ,   % Tasa de inter�s nominal externa de corto plazo
%ins     ,   % Drift de Regla de Taylor externa
%DYs     ,   % Crecimiento del PBI externo
%ys      ,   % Brecha del producto externa
%DYs_eq  ,   % Crecimiento potencial del PBI externo
%Rs_eq   ,   % Tasa natural real externa
%z       ;   % Otros determinantes de la tasa natural real externa

steady  ;
check   ;
    
calib_smoother(datafile=Data_Filtrado, filtered_vars);
%stoch_simul(order=1, irf_shocks=( res_i) , irf=12);

