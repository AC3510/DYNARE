% ===================================================================================
% Banco Central de Reserva del Perú
% Curso de Extensión en Economía 2022
% ===================================================================================
% Autor: Gerson Cornejo
%%Parametros previos

for i_=0:4 
        dynfile = ['ConditionalForecast' num2str(i_)  '.mod'];
        eval(['dynare ' dynfile ';']);
        eval(['AA' num2str(i_) '=oo_;']);
        if i_==0
            save ConditionalForecast2022 AA0;
        else
            eval(['save ConditionalForecast2022 AA' num2str(i_) ' -append;'])
        end
        try
            rmdir(dynfile(1:end-4),'s');
            rmdir(['+' dynfile(1:end-4)],'s');
            delete([dynfile(1:end-4), '.log']);
        end
end 

    clear;
    load('ConditionalForecast2022.mat')
    load('Data_ConditionalForecast_Riesgo2.mat')
    h = plot(repmat(1:100,100,1)); cmap = get(h,'Color'); close all;
    timetic = 2002.125:0.25:2023.875;
    timeticplot= 2019.125:0.25:2023.875;
    H=find(timetic==timeticplot(1));
    
    periods=9;
    

         
         %% Grafico sin bandas de confianza
         var2plot     = {'y' 'Dpsae' 'Ds' 'Dp' 'ED4p' 'i' 'EDy' 'x'};
         var2plotname = {'Brecha' 'SAE' 'TC' 'Inf. Tot' 'Exp. \Delta_{12}IPC' 'TPM' 'Confianza' 'PrimaxRiesgo'};
         T=80;
         F=8+1;
         TF=T+F-1;
         rngo=H:T;
         n=size(var2plot,2);
         cplotdata=cell(n,1);
         cplotdata{1,1}=nan(5,size(timeticplot,2));
         cplotdata{1,1}(1,1:T-H+1)=RB.([var2plot{1}])(rngo)';
         
         for ii=1:n
           cplotdata{ii,1}=nan(5,size(timeticplot,2));
           % record actual sample values
           cplotdata{ii,1}(1,1:T-H+1)=RB.([var2plot{ii}])(rngo)';
           % copy the last point of the actual sample for the forecast part of the matrix (required to have a clean plot)
           cplotdata{ii,1}(:,T-H+1)=repmat(RB.([var2plot{ii}])(T),5,1);
           % record forecast, lower bound
           cplotdata{ii,1}(1,T-H+1:TF-H+1)=AA0.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata{ii,1}(2,T-H+1:TF-H+1)=AA1.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata{ii,1}(3,T-H+1:TF-H+1)=AA2.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata{ii,1}(4,T-H+1:TF-H+1)=AA3.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata{ii,1}(5,T-H+1:TF-H+1)=AA4.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
         end

         
 %        v2plot = 'y';
         for i_=1:n 
         figure(i_);
         set(figure(i_),'Color',[0.9 0.9 0.9]);
         set(figure(i_),'Name',['CF_var: ' var2plotname{i_}],'units','centimeters','position',[1,1,35,15]);
         hold on
         
 %        eval(['x' num2str(i_) '= [AA' num2str(i_) '.conditional_forecast.cond.Mean.' v2plot '];']);
         plot(timeticplot',cplotdata{i_,1}(1,:),'Color',[0 0 0],'LineWidth',2); axis tight; hold on;
         plot(timeticplot',cplotdata{i_,1}(2,:),'Color',[0.4 0.4 1],'LineWidth',2); axis tight; hold on;
         plot(timeticplot',cplotdata{i_,1}(3,:),'Color','r','LineWidth',2, 'LineStyle','--'); axis tight; hold on;
         plot(timeticplot',cplotdata{i_,1}(4,:),'Color','k','LineWidth',2, 'LineStyle',':'); axis tight; hold on;
         plot(timeticplot',cplotdata{i_,1}(5,:),'Color','#77AC30','LineWidth',2, 'LineStyle','-.'); axis tight; hold on;
         set(gca,'XGrid','on');
         set(gca,'YGrid','on');
         set(gca,'FontSize',14);
         add_mid(timeticplot,0,'k');
         xline = max(timeticplot);
         xline1_=find(timeticplot==xline)-5;
         xline2_=find(timeticplot==xline);
         for jj=1:5
             yline=cplotdata{i_,1}(jj,xline1_);
             zline=cplotdata{i_,1}(jj,xline2_);
             text(timeticplot(xline1_),yline,['22Q4. ' num2str(yline,'%1.1f')],'color',[0.4 0.4 1],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
             text(timeticplot(xline2_),zline,['23Q4. ' num2str(zline,'%1.1f')],'color',[0 0 0],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
         end
            if i_== 2;
                add_target(timeticplot);
            elseif i_==4;
                add_target(timeticplot);
            elseif i_==5;
                add_target(timeticplot);
            end
         limy = [min(min(cplotdata{i_,1})) max(max(cplotdata{i_,1}))];
         ylim(limy);
         addshade(timeticplot([T-H+1 TF-H+1]),ylim,'b');
         legend('Escenario Base' ,'Hawkish','Dovish','Tasa Constante','Propuesta','Location','best'); 
         saveas(gcf,['CF_var_' var2plot{i_} '.png'])
         end
         
         
         
         %% Escenario de Riesgo - Choque externo de commodities

         %%Parametros previos
        for i_=0:4
                dynfile = ['ConditionalForecastRiesgo' num2str(i_)  '.mod'];
                eval(['dynare ' dynfile ';']);
                eval(['BB' num2str(i_) '=oo_;']);
                if i_==0
                    save ConditionalForecastRiesgo2022 BB0;
                else
                    eval(['save ConditionalForecastRiesgo2022 BB' num2str(i_) ' -append;'])
                end
                try
                    rmdir(dynfile(1:end-4),'s');
                    rmdir(['+' dynfile(1:end-4)],'s');
                    delete([dynfile(1:end-4), '.log']);
                end
        end 
         
         load('ConditionalForecastRiesgo2022.mat')
         cplotdata2{1,1}=nan(5,size(timeticplot,2));
         cplotdata2{1,1}(1,1:T-H+1)=RB.([var2plot{1}])(rngo)';
         
         for ii=1:n
           cplotdata2{ii,1}=nan(5,size(timeticplot,2));
           % record actual sample values
           cplotdata2{ii,1}(1,1:T-H+1)=RB.([var2plot{ii}])(rngo)';
           % copy the last point of the actual sample for the forecast part of the matrix (required to have a clean plot)
           cplotdata2{ii,1}(:,T-H+1)=repmat(RB.([var2plot{ii}])(T),5,1);
           % record forecast, lower bound
           cplotdata2{ii,1}(1,T-H+1:TF-H+1)=BB0.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata2{ii,1}(2,T-H+1:TF-H+1)=BB1.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata2{ii,1}(3,T-H+1:TF-H+1)=BB2.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata2{ii,1}(4,T-H+1:TF-H+1)=BB3.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
           cplotdata2{ii,1}(5,T-H+1:TF-H+1)=BB4.conditional_forecast.cond.Mean.([var2plot{ii}])(1:F,:);
         end
                  
                
 %        v2plot = 'y';
         for i_=1:n 
         figure(i_+n);
         set(figure(i_+n),'Color',[0.9 0.9 0.9]);
         set(figure(i_+n),'Name',['CF_var_ser: ' var2plotname{i_}],'units','centimeters','position',[1,1,35,15]);
         hold on
         
 %        eval(['x' num2str(i_) '= [AA' num2str(i_) '.conditional_forecast.cond.Mean.' v2plot '];']);
         plot(timeticplot',cplotdata2{i_,1}(1,:),'Color',[0 0 0],'LineWidth',2); axis tight; hold on;
         plot(timeticplot',cplotdata2{i_,1}(2,:),'Color',[0.4 0.4 1],'LineWidth',2); axis tight; hold on;
         plot(timeticplot',cplotdata2{i_,1}(3,:),'Color','r','LineWidth',2, 'LineStyle','--'); axis tight; hold on;
         plot(timeticplot',cplotdata2{i_,1}(4,:),'Color','k','LineWidth',2, 'LineStyle',':'); axis tight; hold on;
         plot(timeticplot',cplotdata2{i_,1}(5,:),'Color','#77AC30','LineWidth',2, 'LineStyle','-.'); axis tight; hold on;
         add_mid(timeticplot,0,'k');
         xline = max(timeticplot);
         xline1_=find(timeticplot==xline)-4;
         xline2_=find(timeticplot==xline);
         for jj=1:5
             yline=cplotdata2{i_,1}(jj,xline1_);
             zline=cplotdata2{i_,1}(jj,xline2_);
             text(timeticplot(xline1_),yline,['22Q4. ' num2str(yline,'%1.1f')],'color',[0.4 0.4 1],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
             text(timeticplot(xline2_),zline,['23Q4. ' num2str(zline,'%1.1f')],'color',[0 0 0],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
         end
            if i_== 2;
                add_target(timeticplot);
            elseif i_==4;
                add_target(timeticplot);
            elseif i_==5;
                add_target(timeticplot);
            end
         limy = [min(min(cplotdata2{i_,1})) max(max(cplotdata2{i_,1}))];
         ylim(limy);
         addshade(timeticplot([T-H+1 TF-H+1]),ylim,'b');
         legend('Escenario Base' ,'Hawkish','Dovish','Tasa Constante','Propuesta','Location','best'); 
         set(gca,'XGrid','on');
         set(gca,'YGrid','on');
         set(gca,'FontSize',14);
         saveas(gcf,['CF_var_ser' var2plot{i_} '.png'])
         end
         
          %% Comparación Base-Escenario Riesgo
         shock2plot     = {'Dpae' 'Dpms' 'tau' 'Dps' 'y' 'Dpsae' 'Ds' 'Dp' 'ED4p'};
         shock2plotname = {'AE' 'IPC Impor' 'Impulso TI' 'Inf. Ex' 'Brecha' 'SAE' 'TC' 'Inf. Tot' 'Exp. Inf'};
         m=size(shock2plot     ,2);
          
         
         cplotdata3=cell(m,1);
         cplotdata3{1,1}=nan(2,size(timeticplot,2));
         cplotdata3{1,1}(1,1:T-H+1)=RB.([shock2plot{1}])(rngo)';
         
         for ii=1:m
           cplotdata3{ii,1}=nan(2,size(timeticplot,2));
           % record actual sample values
           cplotdata3{ii,1}(1,1:T-H+1)=RB.([shock2plot{ii}])(rngo)';
           % copy the last point of the actual sample for the forecast part of the matrix (required to have a clean plot)
           cplotdata3{ii,1}(:,T-H+1)=repmat(RB.([shock2plot{ii}])(T),2,1);
           % record forecast, lower bound
           cplotdata3{ii,1}(1,T-H+1:TF-H+1)=AA0.conditional_forecast.cond.Mean.([shock2plot{ii}])(1:F,:);
           cplotdata3{ii,1}(2,T-H+1:TF-H+1)=BB0.conditional_forecast.cond.Mean.([shock2plot{ii}])(1:F,:);
         end
         
         
         
         for i_=1:m
         figure(i_+(2*n));
         set(figure(i_+(2*n)),'Color',[0.9 0.9 0.9]);
         set(figure(i_+(2*n)),'Name',['Base-Riesgo: ' shock2plotname{i_}],'units','centimeters','position',[1,1,35,15]);
         hold on
         
 %        eval(['x' num2str(i_) '= [AA' num2str(i_) '.conditional_forecast.cond.Mean.' v2plot '];']);
         plot(timeticplot',cplotdata3{i_,1}(1,:),'Color',[0 0 0],'LineWidth',2); axis tight; hold on;
         plot(timeticplot',cplotdata3{i_,1}(2,:),'Color','r','LineWidth',2, 'LineStyle','--'); axis tight; hold on;
         add_mid(timeticplot,0,'k');
         xline = max(timeticplot);
         xline1_=find(timeticplot==xline)-4;
         xline2_=find(timeticplot==xline);
         for jj=1:2
             yline=cplotdata3{i_,1}(jj,xline1_);
             zline=cplotdata3{i_,1}(jj,xline2_);
             text(timeticplot(xline1_),yline,['22Q4. ' num2str(yline,'%1.1f')],'color',[0.4 0.4 1],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
             text(timeticplot(xline2_),zline,['23Q4. ' num2str(zline,'%1.1f')],'color',[0 0 0],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
         end
         limy = [min(min(cplotdata3{i_,1})) max(max(cplotdata3{i_,1}))];
         ylim(limy);
         addshade(timeticplot([T-H+1 TF-H+1]),ylim,'b');
         legend('Escenario Base' ,'Choque Externo Real','Location','best'); 
         set(gca,'XGrid','on');
         set(gca,'YGrid','on');
         set(gca,'FontSize',14);
         saveas(gcf,['BR_' shock2plot{i_} '.png'])
         end
     
         
         for i_=1:n 
         figure(i_+(2*n+m));
         set(figure(i_+(2*n+m)),'Color',[0.9 0.9 0.9]);
         set(figure(i_+(2*n+m)),'Name',['CF_var: ' var2plotname{i_}],'units','centimeters','position',[1,1,35,15]);
         hold on
         
 %        eval(['x' num2str(i_) '= [AA' num2str(i_) '.conditional_forecast.cond.Mean.' v2plot '];']);
         plot(timeticplot',cplotdata{i_,1}(1,:),'Color',[0 0 0],'LineWidth',2); axis tight; hold on;
         xline = max(timeticplot);
         xline1_=find(timeticplot==xline)-4;
         xline2_=find(timeticplot==xline);
         for jj=1:1
             yline=cplotdata{i_,1}(jj,xline1_);
             zline=cplotdata{i_,1}(jj,xline2_);
             text(timeticplot(xline1_),yline,['22Q4. ' num2str(yline,'%1.1f')],'color',[0.4 0.4 1],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
             text(timeticplot(xline2_),zline,['23Q4. ' num2str(zline,'%1.1f')],'color',[0 0 0],'FontSize',14,'HorizontalAlignment','c','VerticalAlignment','bottom');
         end
 %        plot(timeticplot',cplotdata{i_,1}(2,:),'Color',[0.4 0.4 1],'LineWidth',2); axis tight; hold on;
 %        plot(timeticplot',cplotdata{i_,1}(3,:),'Color','r','LineWidth',2, 'LineStyle','--'); axis tight; hold on;
 %        plot(timeticplot',cplotdata{i_,1}(4,:),'Color','k','LineWidth',2, 'LineStyle',':'); axis tight; hold on;
         set(gca,'XGrid','on');
         set(gca,'YGrid','on');
         set(gca,'FontSize',14);
         add_mid(timeticplot,0,'k');
            if i_== 2;
                add_target(timeticplot);
            elseif i_==4;
                add_target(timeticplot);
            elseif i_==5;
                add_target(timeticplot);
            end
         limy = [(min(cplotdata{i_,1}(1,:))) (max(cplotdata{i_,1}(1,:)))];
         ylim(limy);
         addshade(timeticplot([T-H+1 TF-H+1]),ylim,'b');
         legend('Escenario Base','Location','best'); 
         saveas(gcf,['CFBase_var_' var2plot{i_} '.png'])
         end
         
         
         
%%Brecha Producto
% v2plot = 'y';
%    figure('Name',['CF_var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
%    
%          for i_=0:2  
%          eval(['x = [AA' num2str(i_) '.conditional_forecast.cond.Mean.' v2plot '];']);
%          eval(['z = [AA' num2str(i_) '.conditional_forecast.cond.ci.' v2plot '];']);
% %          x = AA0.conditional_forecast.cond.Mean.(v2plot)' ;
% %          z=  AA0.conditional_forecast.cond.ci.(v2plot);
%          plot(timetic',x(1:periods,:)','Color',cmap{i_+1},'LineWidth',2); axis tight; hold on;
%          upp=z(2,:)';
%          down=z(1,:)';
%          plot(timetic',[upp(1:periods,:) down(1:periods,:)],'Color',cmap{i_+1}); axis tight; hold on;
%          A=area(timetic',[upp(1:periods,:) down(1:periods,:)-upp(1:periods,:)]);
%          A(1).FaceColor='none'; A(1).EdgeColor='none';
%          A(2).FaceColor=cmap{i_+1}; A(2).EdgeColor='none'; A(2).FaceAlpha=0.1;
%          legend('IC 90%','PC media','Ejecutado','Location','southeast'); 
%          
%          end
