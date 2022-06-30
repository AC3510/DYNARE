% ===================================================================================
% MODELO DE PROYECCIÓN TRIMESTRAL REDUCIDO
% ===================================================================================
% Banco Central de Reserva del Perú
% Curso de Extensión en Economía 2022
% ===================================================================================

% &state-variables % Variables ========================================================
var

% Crecimiento del Producto y Potencial
DY        % Crecimiento anualizado del PBI 
DY_eq     % Crecimiento potencial anualizado del PBI
DYs       % Crecimiento anualizado externo
DYs_eq    % Crecimiento potencial anualizado externo

% Inflación
Dpc	      % Inflación subyacente
D4pc      % Inflación subyacente (4 trimestres)
Dpae      % Inflación de alimentos y energía
Dp	      % Inflación total
D4p	      % Inflación total (4 trimestres)
Dpsae     % Inflación sin alimentos ni energía
D4psae    % Inflación sin alimentos ni energía (4 trimestres)
ED4p      % Expectativa de inflación 4 trimestres en adelante
D4pdev    % Desvío de la inflación respecto a la meta
Dpm       % Inflación importada en S/ 
D4pm      % Inflación importada en S/ (4 trimestres)
Meta      % Meta de inflación

% Tasas de interés en moneda nacional
i    	  % Tasa de interés de referencia
in        % Drift de la Regla de Taylor
imn		  % Tasa de interés interbancaria en S/
Rmn 	  % Tasa de interés real doméstica
Rmn_eq    % Tasa de interés natural real en S/
zmn       % Otros determinantes de la tasa de interés natural real
rmn       % Brecha de la tasa de interés real doméstica

% Tasas de interés en moneda extranjera
ime		  % Tasa de interés interbancaria en US$ 
Rme       % Tasa de interés real externa expresada en S/
Rme_eq    % Tasa de interés natural real externa expresada en S/
zme       % Otros determinantes de la tasa de interés natural real externa expresada en S/  
rme       % Brecha de la tasa de interés real externa expresada en S/

% Tipo de cambio
Ds        % Depreciación nominal
D4s       % Depreciación nominal (4 trimestres)
ED4s      % Expectativa de depreciación 4 trimestres en adelante
x	      % Prima por riesgo (riesgo país + riesgo cambiario)
x_eq 	  % Prima por riesgo de equilibrio
DQ		  % Depreciación real
q	      % Brecha del tipo de cambio real
DQ_eq     % Depreciación real de equilibrio

% Brecha del producto y sus determinantes
y		  % Brecha del producto
EDy       % Expectativas del crecimiento de la brecha producto  
rmc	      % Índice de condiciones monetarias reales
t         % Cambio en la Recaudación estructural
g         % Cambio en el Gasto Público como porcentaje del potencial 
DTI       % Crecimiento de los términos de intercambio
tau       % Brecha de los términos de intercambio

% Economía externa
Dps       % Inflación externa (IPE puro)
D4ps      % Inflación externa (IPE puro, 4 trimestres)
Dpms      % Inflación importada en US$ 
is        % Tasa de interés nominal externa de corto plazo
rs        % Brecha de la tasa de interés real externa
ys        % Brecha del producto de los socios comerciales
ins       % Drift de la Regla de Taylor externa
Rs        % Tasa de interés real externa
Rs_eq     % Tasa de interés natural real externa
z;        % Otros determinantes de la tasa de interés natural real externa

% &residual-variables % Choques =======================================================
varexo

% Crecimiento del PBI potencial
res_DY_eq

% Inflación
res_Dpc    % Curva de Phillips
res_Dpae   % Inflación no subyacente
res_Dpsae  % Inflación sin alimentos ni energía
res_ED4p   % Expectativas de inflación
res_Dpm    % Inflación importada (en soles)
res_Meta   % Meta de inflación

% Tasas de interés en moneda nacional
res_i      % Regla de política monetaria
res_in     % Tasa de interés nominal neutral
res_imn    % Tasa de interés interbancaria en S/
res_zmn    % Otros determinantes de la tasa natural real en S/

% Tasas de interés en moneda extranjera
res_ime    % Tasa de interés interbancaria en US$ 
res_zme    % Tasa de interés real externa expresada en S/ de equilibrio    

% Tipo de cambio
res_Ds     % Paridad descubierta de tasas de interés 
res_ED4s   % Expectativas de depreciación cuatro trimestres en adelante
res_x      % Prima por riesgo cambiario
res_x_eq   % Prima de riesgo cambiario de equilibrio
res_DQ_eq  % Depreciación real de equilibrio

% Brecha del producto y sus determinantes
res_y      % Demanda agregada
res_EDy    % Expectativas de crecimiento de la brecha producto
res_t      % Shock de ingreso
res_g      % Shock de gasto
res_DTI    % Crecimiento de los términos de intercambio
res_tau    % Brecha de los términos de intercambio

% Economía externa
res_DYs_eq % Crecimiento potencial externo
res_Dps    % Curva de Phillips externa
res_Dpms   % Precio de las importaciones (en dólares, 4 trimestres)
res_is     % Regla de política monetaria externa
res_ys     % Demanda agregada externa
res_ins    % Drift de la Regla de Taylor externa
res_z;     % Tasa de interés natural real externa

% &parameters % Estado estacionario ===================================================
parameters 

DY_ss      % Crecimiento Potencial del PBI
rho_DY_eq  % Persistencia del crecimiento potencial

Dp_ss	   % Inflación doméstica
Dps_ss	   % Inflación externa
i_ss       % Tasa de interés nominal doméstica
is_ss      % Tasa de interés nominal externa
Ds_ss      % Depreciación nominal
x_ss	   % Prima por riesgo


Rmn_ss     % Tasa de interés real doméstica
Rme_ss     % Tasa de interés real externa expresada en S/

Rs_ss
% &coefficients % Coeficientes ========================================================

% Inflación
bm, bsae, by, cy                   % Curva de Phillips
rho_Dpae, bs                       % Inflación no subyacente 
csae                               % Inflación total
cFL, cFc                           % Desvíos de la inflación
rho_ED4p, cp                       % Expectativas de inflación
cmm, cmq                           % Inflación importada en S/. (4 trimestres)
cpms                               % Precio de las importaciones en US$ (4 trimestres)
rho_Dpc, cpsae                     % Inflación sin alimentos ni energía

% Tasas de interés en moneda nacional
fi, fp, fy, cfy                    % Regla de política monetaria
rho_in                             % Tasa de interés neutral (nominal)
rho_zmn, cY_mn, cR_mn              % Tasa de interés natural real doméstica

% Tasas de interés en moneda extranjera
rho_zme, cY_me, cR_me              % Tasa de interés real externa de equilibrio (en S/) 

% Tipo de cambio
rho_Ds                             % Paridad descubierta de tasas de interés
rho_ED4s                           % Expectativas de depreciación 4 trimestres en adelante
rho_x                              % Prima de riesgo cambiario de equilibrio
rho_DQ                             % Depreciación real de equilibrio, término de corrección                             

% Brecha del producto y sus determinantes
ay, aEy, armc, atau, at, ag, aq, ays,   % Demanda agregada
rho_EDy                                 % Expectativas del crecimiento de la brecha producto 
crmn, crme, chb                         % Índice de condiciones monetarias reales
rho_DTI, atauc, ataul                   % Crecimiento y brecha de los términos de intercambio
rho_t, rho_g                            % Impulso fiscal

% Economía externa
DYs_ss
rho_DYs_eq
bsp, bsy                           % Curva de Phillips externa
fsi, fsp, fsy                      % Regla de política monetaria externa
rho_ins                            % Tasa natural
asy, asEy, asr                     % Demanda agregada externa
rho_z, cY_s                        % Tasa de interés real externa de equilibrio
 
%% Varianzas de los shocks (Provenientes de la estimación)
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

%% CALIBRACIÓN BASE 
%% ESTADO ESTACIONARIO
DY_ss = 5.3; DYs_ss = 2.1; Dp_ss = 2.0; Dps_ss = 2.0; i_ss  = 4.0; is_ss = 3.0; Rs_ss  = 1.0;
Ds_ss = 0.0; x_ss = i_ss - (is_ss + Ds_ss); Rmn_ss = 2.0; Rme_ss = 1.0;
cFL = 1; cFc = 0; rho_Dpc = 0; cpsae = 0.8845; chb =0;
%% Parametros

% Crecimiento potencial:        DY_eq = (1 - rho_DY_eq)*DY_ss + rho_DY_eq*DY_eq{-1} + res_DY_eq;
rho_DY_eq = 0.99;

% Curva de Phillips:            Dpsae = bm*D4pm + (1-bm)*(bsae*Dpsae(-1) + (1 - bsae)*ED4p) +  by*(cy*y + (1 - cy)*y(-1)) + res_Dpsae;
set_param_value('bm',CC.bm);
set_param_value('bsae',CC.bsae);
set_param_value('by',CC.by);
cy = 0.0;

% Inflación no subyacente:      Dpae = (1 - rho_Dpae)*( bs*Dpsae + (1 - bs)*Dpm )+ rho_Dpae*Dpae(-1) + res_Dpae;
rho_Dpae = 0;
set_param_value('bs',CC.bs);

% Inflación total:              Dp = csae*Dpsae + (1 - csae)*Dpae;
csae = 0.56397; 
 
% Expectativas de inflación:    ED4p = rho_ED4p*ED4p(-1) + (1 - rho_ED4p)*( (1 - cp)*D4psae(+4) + cp*D4p(-1) ) + res_ED4p;
set_param_value('rho_ED4p',CC.rho_ED4p);
set_param_value('cp',CC.cp);

% Inflación importada en S/:   Dpm  = cmm*Dpm(-1) + (1 - cmm)*D4pm(+4) + cmq*( q + q(-1) )/2 + res_Dpm;        
set_param_value('cmm',CC.cmm);
set_param_value('cmq',CC.cmq);

% Regla de política monetaria:  i = fi*i(-1) + (1 - fi)*( in + fp*D4pdev + fy*( cfy*y + (1 - cfy)*y(-1) ) ) + res_i;
fi = 0.70; fp = 1.50; fy = 0.50; cfy = 0.50;

% Tasa de interés nominal neutral in = (1 - rho_in)*i_ss + rho_in*in(-1) + res_in;
rho_in = 0.95;
set_param_value('rho_zmn',CC.rho_zmn);
set_param_value('rho_zme',CC.rho_zme);
set_param_value('cY_mn',CC.cY_mn);
set_param_value('cY_me',CC.cY_me);
set_param_value('cR_mn',CC.cR_mn);
set_param_value('cR_me',CC.cR_me);

% PDI:                          Ds = rho_Ds*Ds(+1) + (1 + rho_Ds)*( ime + x - imn) +  res_Ds;
set_param_value('rho_Ds',CC.rho_Ds);
 
% Expectativas de depreciación: ED4s = rho_ED4s*ED4s(-1) + (1 - rho_ED4s)*D4s(+4) + res_ED4s; 
set_param_value('rho_ED4s',CC.rho_ED4s);

% Prima de riesgo cambiario:    x = (1 - rho_x)*x_ss + rho_x*x(-1)+ res_x;
set_param_value('rho_x',CC.rho_x);

% Brecha del tipo de cambio real: q = (1/(4+rho_DQ))*(4*q(-1) + Dpe + Ds - Dp - res_DQ_eq);
set_param_value('rho_DQ',CC.rho_DQ);

% Demanda agregada:             y = ay*y(-1) + aEy*(y(-1) + EDy) + armc*rmc(-1) - at*t + ag*g + aq*(q/sq) + atau*(tau/stau)+ ays*ys + res_y;
set_param_value('ay',CC.ay);
set_param_value('aEy',CC.aEy);
set_param_value('armc',CC.armc);
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

% Inflación importada en US$    Dpms = (1 - cpms)*Dpe + cpms*Dpe{-1} + res_Dpms; 
cpms = 0.2;

% Regla de política externa:    is  = fsi*is{-1} + (1 - fsi)*(is_ss + fsp*(D4ps{+4} - Dps_ss) + fsy*ys) + res_is;
fsi = 0.70; fsp = 1.5; fsy = 0.5;

% Tasa Natural: ins = (1-rho_ins)*is_ss + rho_ins*ins(-1) + res_ins;
rho_ins = 0.95;

% Demanda agregada externa:     ys = asEy*ys(+1) + asy*ys(-1) - asr*rs(-1) + res_ys; 
rho_DYs_eq = 0.99;

set_param_value('asEy',CC.asEy);
set_param_value('asy',CC.asy);
set_param_value('asr',CC.asr);

rho_DTI  = 0;

% Tasa de interés real externa de equilibrio: Rs_eq = (1-rho_Rs_eq)*(ins - is_ss + Rs_ss) + rho_Rs_eq*Rs_eq(-1) + res_Rs_eq;
set_param_value('rho_z',CC.rho_z); 
set_param_value('cY_s',CC.cY_s);
 
% &state-equations % Ecuaciones =======================================================
model;

% Ecuación de Medida
DY = 4*(y - y(-1)) + DY_eq; 

% Crecimiento potencial
DY_eq = (1 - rho_DY_eq)*DY_ss + rho_DY_eq*DY_eq(-1) + res_DY_eq;

% ------------------------------------------------------------------------------
% Inflación
% ------------------------------------------------------------------------------

% Curva de Phillips
Dpsae = bm*D4pm + (1 - bm)*(bsae*Dpsae(-1) + (1 - bsae)*ED4p) +  by*(cy*y + (1 - cy)*y(-1)) + res_Dpsae;

% Inflación SAE (4 trimestres)
D4psae = (Dpsae + Dpsae(-1) + Dpsae(-2) + Dpsae(-3))/4;

% Inflación alimentos y energía
Dpae = (1 - rho_Dpae)*( bs*Dpsae + (1 - bs)*Dpm )+ rho_Dpae*Dpae(-1) + res_Dpae;

% Inflación total
Dp = csae*Dpsae + (1 - csae)*Dpae;

% Inflación total (4 trimestres)
D4p = (Dp + Dp(-1) + Dp(-2) + Dp(-3))/4;

% Inflación subyacente
Dpc = (1 - rho_Dpc)*( cpsae*Dpsae + (1 - cpsae)*Dpae ) + rho_Dpc*Dpc(-1) + res_Dpc;

% Inflación subyacente (4 trimestres)
D4pc = (Dpc + Dpc(-1) + Dpc(-2) + Dpc(-3))/4;

% Expectativas de inflación
ED4p = rho_ED4p*ED4p(-1) + (1 - rho_ED4p)*((1 - cp)*D4psae(+4) + cp*D4p(-1)) + res_ED4p;

% Desvíos de la inflación
D4pdev = cFL*( cFc*D4pc(+4) + (1 - cFc)*D4psae(+4) ) + (1 - cFL)*( cFc*Dpc + (1 - cFc)*Dpsae ) - Meta;

% Inflación importada en S/. (Curva de Phillips importada)
Dpm = cmm*Dpm(-1) + (1 - cmm)*D4pm(+4) + cmq*( Dpms(-1) + Ds(-1) - Dpm(-1) )+  res_Dpm;

% Inflación importada en S/ (4 trimestres)
D4pm = (Dpm + Dpm(-1) + Dpm(-2) + Dpm(-3))/4;

% Meta de inflación
Meta = 0.5*Dp_ss + 0.5*Meta(-1) + res_Meta;

% --------------------------------------------------------------------------------------------------
% Tasas de interés en moneda nacional
% --------------------------------------------------------------------------------------------------

% Regla de política monetaria
i = fi*i(-1) + (1 - fi)*( in + fp*D4pdev + fy*( cfy*y + (1 - cfy)*y(-1) ) ) + res_i;

% Drift de la Regla de Taylor
in = (1 - rho_in)*i_ss + rho_in*in(-1) + res_in;

% Tasa de interés interbancaria en S/
imn = i + res_imn;

% Tasa de interés real doméstica
Rmn = imn - ED4p;

% Tasa de interés real doméstica de equilibrio
Rmn_eq = zmn + cY_mn*(DY_eq(+1)-DY_ss) + cR_mn*(DYs_eq(+1)-DYs_ss);
zmn = (1-rho_zmn)*Rmn_ss + rho_zmn*zmn(-1) + res_zmn;

% Brecha de la tasa de interés real doméstica
rmn = Rmn - Rmn_eq;

% --------------------------------------------------------------------------------------------------
% Tasas de interés en moneda extranjera
% --------------------------------------------------------------------------------------------------

% Tasa de interés interbancaria en US$ 
ime = is + res_ime;

% Tasa de interés real externa expresada en S/
Rme = ime - ED4p + ED4s;

% Tasa de interés real externa expresada en S/ de equilibrio
Rme_eq = zme + cY_me*(DY_eq(+1)-DY_ss) + cR_me*(DYs_eq(+1)-DYs_ss);
zme = (1-rho_zme)*Rme_ss + rho_zme*zme(-1) + res_zme;

% Brecha de la tasa de interés real externa expresada en S/
rme = Rme - Rme_eq;

% --------------------------------------------------------------------------------------------------
% Tipo de cambio
% --------------------------------------------------------------------------------------------------

% Paridad descubierta de tasas de interés modificada
Ds = rho_Ds*Ds(+1) + (1 + rho_Ds)*( ime + x - imn + res_Ds );

% Depreciación nominal (4 trimestres)
D4s = (Ds + Ds(-1) + Ds(-2) + Ds(-3))/4;

% Expectativas de depreciación 4 trimestres en adelante
ED4s = rho_ED4s*ED4s(-1) + (1 - rho_ED4s)*(rho_Ds*D4s(+4) - (Ds - 5*Ds_ss)/4)/(1 + rho_Ds) + res_ED4s;

% Prima por riesgo cambiario
x = x_eq + res_x;

% Prima por riesgo cambiario de equilibrio
x_eq = (1 - rho_x)*x_ss + rho_x*x_eq(-1) + res_x_eq;

% Depreciación real
DQ = Dps + Ds - Dp;

% Brecha del tipo de cambio real
q = q(-1) + (DQ - DQ_eq)/4;

% Depreciación real de equilibrio
DQ_eq = rho_DQ*q + res_DQ_eq;

% --------------------------------------------------------------------------------------------------
% Brecha del producto y sus determinantes
% --------------------------------------------------------------------------------------------------

% Demanda agregada
y = ay*y(-1) + aEy*(y(-1) + EDy) + armc*rmc(-1) - at*t + ag*g + aq*q + atau*tau+ ays*ys + res_y;

% Expectativas de crecimiento de la brecha producto
EDy = rho_EDy*EDy(-1) + (1 - rho_EDy)*(y(+1) - y(-1)) + res_EDy;

% Índice de condiciones monetarias reales
rmc = -( crmn*rmn + crme*rme + chb*( x - x_eq ) );

% Cambio en los ingresos estructurales
t = rho_t*t(-1) + res_t;

% Cambio en el gasto público
g = rho_g*g(-1) + res_g;

% Crecimiento anualizado de los términos de intercambio
DTI = rho_DTI*DTI(-1) + res_DTI;

% Impulso de los términos de intercambio
tau = (ataul + atauc)*tau(-1) - ataul*atauc*tau(-2) + (ataul - atauc)*DTI/4 + res_tau;

% --------------------------------------------------------------------------------------------------
% Economía externa
% --------------------------------------------------------------------------------------------------

% Curva de Phillips externa
Dps = bsp*Dps(-1) + (1 - bsp)*D4ps(+4) + bsy*ys(-1) + res_Dps;

% Inflación externa (IPE puro, 4 trimestres) 
D4ps = (Dps + Dps(-1) + Dps(-2) + Dps(-3))/4;

% Inflación importada en US$
Dpms = (1 - cpms)*Dps + cpms*Dps(-1) + res_Dpms;

% Regla de política monetaria (Libor en US$ a 3 meses)
is = fsi*is(-1) + (1 - fsi)*(ins + fsp*(D4ps(+4) - Dps_ss) + fsy*ys) + res_is;

% Drift de Regla de Taylor externa
ins = (1-rho_ins)*is_ss + rho_ins*ins(-1) + res_ins;

% Tasa de interés real externa 
Rs = is - D4ps(+4);

% Tasa de interés real externa de equilibrio
Rs_eq = z + cY_s*(DYs_eq(+1)-DYs_ss);
z = (1-rho_z)*Rs_ss + rho_z*z(-1) + res_z;

% Brecha de la tasa de interés real externa
rs = Rs - Rs_eq;

% Ecuación de medida

DYs = 4*(ys-ys(-1)) + DYs_eq;

% Crecimiento potencial de los socios comerciales
DYs_eq = (1 - rho_DYs_eq)*DYs_ss + rho_DYs_eq*DYs_eq(-1) + res_DYs_eq;

% Demanda agregada externa
ys = asEy*ys(+1) + asy*ys(-1) - asr*rs(-1) + res_ys; 

end;

load('Histval_Data_new.mat');
histval;
DY(0)      = RR.DY(80);
DY_eq(0)   = RR.DY_eq(80); 
DYs(0)     = RR.DYs(80); 
DYs_eq(0)  = RR.DYs_eq(80); 

% Inflación
Dpae(0)    =  RR.Dpae(80);
Dp(0)	   =  RR.Dp(80);
Dpsae(0)   =  RR.Dpsae(80);
ED4p(0)    =  RR.ED4p(80);
Dpm(0)     =  RR.Dpm(80); 

% Tasas de interés en moneda nacional
i(0)    	=  RR.i(80);
in(0)       =  RR.in(80);
imn(0)		=  RR.imn(80);
zmn(0)      =  RR.zmn(80);

% Tasas de interés en moneda extranjera
ime(0)		=  RR.ime(80);
zme(0)      =  RR.zme(80);  

% Tipo de cambio
Ds(0)      =  RR.Ds(80);
ED4s(0)    =  RR.ED4s(80);
x(0)       =  RR.x(80);
x_eq(0)    =  RR.x_eq(80);
q(0)	   =  RR.q(80);
DQ_eq(0)   =  RR.DQ_eq(80);

% Brecha del producto y sus determinantes
y(0)	   =  RR.y(80);
EDy(0)     =  RR.EDy(80);  
t(0)       =  RR.t(80); 
g(0)       =  RR.g(80); 
DTI(0)     =  RR.DTI(80);
tau(0)     =  RR.tau(80);

% Economía externa
Dps(0)     =  RR.Dps(80); 
Dpms(0)    =  RR.Dpms(80); 
is(0)      =  RR.is(80);
ys(0)      =  RR.ys(80);
ins(0)     =  RR.ins(80); 
z(0)       =  RR.z(80);
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

steady;
check;
stoch_simul(order=1, periods=1000, noprint, nograph);

% Proyecciones condicionadas a las siguientes trayectorias:
conditional_forecast_paths;

var i;
periods 1,2,3,4,5,6,7,8; 
values 3.7500 , 4.2500 , 4.5000 , 4.7500 , 5.2500 , 5.5000 ,  5.5500 , 5.5000 ; %Hawkish
%values 3.0000 , 3.5000 , 3.5000 , 3.7500 , 3.7500 , 3.5000 ,  3.5000 , 3.3000; %Dovish
%values 2.1298 , 2.1298 , 2.1298 , 2.1298, 2.1298 , 2.1298 , 2.1298 , 2.1298 ; %Tasa Constante
%values 2.5000 , 2.7500 , 3.0000 , 3.2500 , 3.5000 , 3.7500 , 4.0000 , 4.2500 ; %Propuesta

var Dpae;
periods 1,2,3,4,5,6,7,8; 
values 4.6711  , 1.7457 ,   2.7042  ,  4.9619  ,  3.1338 ,  1.4192 ,   2.0724 ,   3.4085;

var x;
periods 1,2,3,4,5,6,7,8; 
values  1.8392  ,  1.8392  ,  1.8392 ,   1.8392 ,   1.8392  ,  1.8392 ,   1.8392, 1.8392;

var DTI;
periods 1,2,3,4,5,6,7,8; 
values -43.5035  , -0.9273 ,  3.5515 ,  3.6169 ,  0.9218,   1.2743 ,  1.1855 , 1.7441;

var tau;
periods 1,2,3,4,5,6,7,8; 
values -2.5610 ,  -4.1677  , -3.5790 ,  -2.5014 ,  -1.7495 ,  -1.1547 ,  -0.6984, -0.2846;

var Dpms;
periods 1,2,3,4,5,6,7,8; 
values 11.4561 ,  0.6965 ,  -3.4954 ,  -3.5127 ,  -1.1020 ,  -2.2804 ,  -1.6380, -1.6165;

var g;
periods 1,2,3,4,5,6,7,8; 
values -0.5675 ,  -0.4151 ,  -0.5799 ,  -0.1020 ,   0.4100 ,   0.0583 ,  -0.5252 , -1.4409;

var t;
periods 1,2,3,4,5,6,7,8; 
values  0.3780 ,   0.3123 ,  -2.4371 ,  -0.5032 ,  -0.0792 ,  -0.1842 ,   0.0802  , 0.1098;

var EDy;
periods 1,2,3,4,5,6,7,8; 
values -1.7458 ,  -1.3534 ,  -0.8068 ,  -0.4284 ,  -0.1215  ,  0.1120  ,  0.2284 , 0.2772;

var ED4s;
periods 1,2,3,4,5,6,7,8; 
values 1.6868  ,  1.5556  ,  1.4265 ,   1.2976 ,   1.1833   , 1.0663 ,   0.9580 ,  0.8440;

var Dps;
periods 1,2,3,4,5,6,7,8; 
values  5.6490  , -3.3273  ,  6.7511 ,   8.4799  ,  8.3425  , -6.6871   , 3.5081  ,  5.6944;

var is;
periods 1,2,3,4,5,6,7,8; 
values  0.4498  ,  0.8665 ,   1.1998 ,   1.4498  ,  1.6998  ,  1.9498 ,   2.1165  ,  2.1998;

var ins;
periods 1,2,3,4,5,6,7,8; 
values 2.6396 ,   3.4229 ,   3.4602 ,   3.7083 ,   4.2980 ,   5.1384  ,   5.0502,  4.9042;

var ys;
periods 1,2,3,4,5,6,7,8; 
values  -2.5609 ,   -2.4675 ,   -2.3749 ,   -2.2381 ,   -2.4773  , -2.8209 ,  -3.1918  ,  -3.5770;

var DYs_eq;
periods 1,2,3,4,5,6,7,8; 
values 2.9186  ,  3.4772  ,  3.4802 ,   3.3035 ,   3.3074 ,   3.7251 ,   3.8341  ,  3.8914;

var z;
periods 1,2,3,4,5,6,7,8; 
values  -0.7184 ,  -0.6716 ,  -0.7318,   -0.8976,   -1.0294,   -1.0876 ,  -1.1673 ,  -1.1444;

var DY_eq;
periods 1,2,3,4,5,6,7,8; 
 values 3.3681 ,   4.7311 ,   4.5385 ,   3.7871 ,   5.2199 ,   3.9283 ,   3.0159 ,   3.5451;

var in;
periods 1,2,3,4,5,6,7,8; 
values  3.6239 ,   3.8946 ,   4.0766 ,   4.1896 ,   4.2721 ,   4.3046 ,   4.3065 ,   4.2981;

var zmn;
periods 1,2,3,4,5,6,7,8; 
values -0.1324 ,   0.6478 ,   1.3040 ,   1.7429 ,   2.0022 ,   2.1351 ,   2.2055 ,   2.1088;

var zme;
periods 1,2,3,4,5,6,7,8; 
values  -1.8911 ,  -1.2582 ,  -0.7251 ,  -0.3740 ,  -0.1699 ,  -0.0688 ,  -0.0120 ,  -0.0952;

var x_eq;
periods 1,2,3,4,5,6,7,8; 
values  0.1895  ,  0.5473 ,   0.8725  ,  1.0966 ,   1.2344 ,   1.3323 ,   1.4304 ,   1.4975;

var DQ_eq;
periods 1,2,3,4,5,6,7,8; 
values  4.7866  ,  2.1455 ,   1.9206  ,  2.0685 ,   2.3127 ,   0.0338 ,  -0.0036 ,   0.4137;
end;


conditional_forecast(parameter_set = calibration, controlled_varexo = (res_i, res_Dpae, res_x, res_DTI, res_tau, res_Dpms, res_g, res_t, res_EDy, res_ED4s, res_Dps, res_is, res_ins, res_ys, res_DYs_eq, res_z, res_DY_eq, res_in, res_zmn, res_zme, res_x_eq, res_DQ_eq), replic = 5000, conf_sig = 0.99);
%plot_conditional_forecast (periods = 8) Dpsae y Ds ED4p D4p Rmn;

