%%Parametros previos
for i_=0:5
        dynfile = ['Filtrado_base' num2str(i_)  '.mod'];
        eval(['dynare ' dynfile ';']);
        eval(['AA' num2str(i_) '=oo_;']);
        if i_==0
            save Filters2022 AA0;
        else
            eval(['save Filters2022 AA' num2str(i_) ' -append;'])
        end
        try
            rmdir(dynfile(1:end-4),'s');
            rmdir(['+' dynfile(1:end-4)],'s');
            delete([dynfile(1:end-4), '.log']);
        end
end 
    
%     imprime       = @(x)print( gcf, '-depsc2', [ x]);
%     imprpdf       = @(x)eps2pdf([ x '.eps']);
%     borraeps      = @(x)delete([ x '.eps']);
%     

clear;
load('Filters2022.mat')

 close all; h = plot(repmat(1:100,100,1)); cmap = get(h,'Color'); close all;
timetic = 2002.125:0.25:2023.875;

%% Brecha producto
v2plot = 'y';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
   
         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end

    [P,A] = plot_KF_area(x,cmap{1},timetic);
    set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
%       imprime(['Filtro_' v2plot]);
%     imprpdf(['Filtro_' v2plot]);
%         borraeps(['Filtro_' v2plot]);

 %% Potencial
v2plot = 'DY_eq';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
    x0 = AA0.SmoothedVariables.DY ;% mean

         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end
    [P,A] = plot_KF_area(x,cmap{1},timetic);%hold on;
  %  P1 = plot(timetic,x0,'color',cmap{2},'LineWidth',1.5);
    legend([P],'Crecimiento potencial','Location','Best');
    set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
%     imprime(['Filtro_' v2plot]);
%     imprpdf(['Filtro_' v2plot]);
%     borraeps(['Filtro_' v2plot]);

   %% Tasa natural
v2plot = 'in';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
          x0 = AA0.SmoothedVariables.i-3+3.3702;
         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end
    [P,A] = plot_KF_area(x,cmap{1},timetic); hold on;
    P1 = plot(timetic,x0,'color',cmap{2},'LineWidth',1.5);
    legend([P,P1],'Tasa natural de interés','Tasa de política monetaria','Location','Best');
    set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
    lymy= ylim; ylim([-2 lymy(2)]);
%     imprime(['Filtro_' v2plot]);
%     imprpdf(['Filtro_' v2plot]);
%     borraeps(['Filtro_' v2plot]);
    
       %% Tasa real domestica de equilibrio mn
v2plot = 'Rmn_eq';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
       x0 = AA0.SmoothedVariables.Rmn +6.3;
         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end
    [P,A] = plot_KF_area(x,cmap{1},timetic);
    hold on;
    P1 = plot(timetic,x0,'color',cmap{2},'LineWidth',1.5);
    legend([P,P1],'Tasa real de mercado de equilibrio MN','Tasa real de mercado de MN','Location','Best');
    set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
    lymy= ylim; ylim([-4 lymy(2)]);
%     imprime(['Filtro_' v2plot]);
%     imprpdf(['Filtro_' v2plot]);
%     borraeps(['Filtro_' v2plot]);
    
           %% Tasa real domestica de equilibrio me
v2plot = 'Rme_eq';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
          x0 = AA0.SmoothedVariables.Rme +3.1;

         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end
    [P,A] = plot_KF_area(x,cmap{1},timetic);
    hold on;
   P1 = plot(timetic,x0,'color',cmap{2},'LineWidth',1.5);
    legend([P,P1],'Tasa real de mercado de equilibrio ME','Tasa real de mercado de ME','Location','Best');
     set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
  %  imprime(['Filtro_' v2plot]);
  %  imprpdf(['Filtro_' v2plot]);
  %  borraeps(['Filtro_' v2plot]);
    
               %% Tasa natural externa
v2plot = 'ins';
   figure('Name',['var: ' v2plot],'units','centimeters','position',[1,1,35,15]);
          x0 = AA0.SmoothedVariables.is -2+1.4;

         x = AA0.SmoothedVariables.(v2plot);
    for i_=1:5
        eval(['x = [x AA' num2str(i_) '.SmoothedVariables.' v2plot '];']);
    end
    [P,A] = plot_KF_area(x,cmap{1},timetic);
    hold on;
   P1 = plot(timetic,x0,'color',cmap{2},'LineWidth',1.5);
    legend([P,P1],'Tasa natural externa','Tasa FED','Location','Best');
     set(gca,'FontSize',14,'box','off');
    grid on; axis tight;
%     imprime(['Filtro_' v2plot]);
%     imprpdf(['Filtro_' v2plot]);
%     borraeps(['Filtro_' v2plot]);
%     