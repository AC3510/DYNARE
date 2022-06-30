function [P,A] = plot_KF_area(x,c,rg)

med  = mean(x,2);
MT   = x;

MTE = quantile(MT,[0.05 0.95],2); % smoothers with quantile
% MTE = [min(MT,[],2) max(MT,[],2)];
upp = MTE(:,2);
dow = MTE(:,1);

P=plot(rg,med); axis tight; hold on;
P.Color=c;
P.LineWidth=2;
P.Marker='*';
xt = xticks; xl = xticklabels; xl=xlim; yl=ylim;

P0=plot(rg,upp); axis tight; hold on;
P0.Color=c;
P0.LineWidth=1.5;
P0.LineStyle='--';

P0=plot(rg,dow); axis tight; hold on;
P0.Color=c;
P0.LineWidth=1.5;
P0.LineStyle='--';

areas = [dow upp];
A=area(rg,[areas(:,1) areas(:,2)-areas(:,1)]);
A(1).FaceColor='none'; A(1).EdgeColor='none';
A(2).FaceColor=c; A(2).EdgeColor='none'; A(2).FaceAlpha=0.1;

end