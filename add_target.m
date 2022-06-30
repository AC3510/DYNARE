function add_target(timetic,ot)
    if nargin<2
        ot=2;
    end
    monthlengh = 1/12; 
    if timetic(1)<(2007-monthlengh/2)
        Lu0 = line([timetic(1)        2007-monthlengh/2],ot-[0.5 0.5]); Lu0.Color = 'r';  Lu0.LineStyle = '-.'; Lu0.LineWidth=1;
        Lu1 = line([2007-monthlengh/2 2007-monthlengh/2],ot-[0.5 1]);   Lu1.Color = 'r';  Lu1.LineStyle = '-.'; Lu1.LineWidth=1;
        Lu2 = line([2007-monthlengh/2 timetic(end)],     ot-[1 1]);     Lu2.Color = 'r';  Lu2.LineStyle = '-.'; Lu2.LineWidth=1;
        Mu0 = line([timetic(1)        2007-monthlengh/2],ot+[0.5 0.5]); Mu0.Color = 'r';  Mu0.LineStyle = '-.'; Mu0.LineWidth=1;
        Mu1 = line([2007-monthlengh/2 2007-monthlengh/2],ot+[0.5 0]);   Mu1.Color = 'r';  Mu1.LineStyle = '-.'; Mu1.LineWidth=1;
        Mu2 = line([2007-monthlengh/2 timetic(end)],     ot+[0 0]);     Mu2.Color = 'r';  Mu2.LineStyle = '-.'; Mu2.LineWidth=1;
        Uu0 = line([timetic(1)        2007-monthlengh/2],ot+[1.5 1.5]); Uu0.Color = 'r';  Uu0.LineStyle = '-.'; Uu0.LineWidth=1;
        Uu1 = line([2007-monthlengh/2 2007-monthlengh/2],ot+[1.5 1]);   Uu1.Color = 'r';  Uu1.LineStyle = '-.'; Uu1.LineWidth=1;
        Uu2 = line([2007-monthlengh/2 timetic(end)],     ot+[1 1]);     Uu2.Color = 'r';  Uu2.LineStyle = '-.'; Uu2.LineWidth=1;
    else
        Lu = line([timetic(1)        timetic(end)],     ot-[1 1]);     Lu.Color = 'r';  Lu.LineStyle = '-.'; Lu.LineWidth=1;
        Mu = line([timetic(1)        timetic(end)],     ot+[0 0]);     Mu.Color = 'r';  Mu.LineStyle = '-.'; Mu.LineWidth=1;
        Uu = line([timetic(1)        timetic(end)],     ot+[1 1]);     Uu.Color = 'r';  Uu.LineStyle = '-.'; Uu.LineWidth=1;
    end
end