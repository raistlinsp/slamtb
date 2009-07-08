function drawIdpPnt(MapFig, Lmk, color)

% DRAWIDPLMK  Draw inverse-depth point landmark in MapFig.

global Map



posOffset = [0;0;.2];

ran = Lmk.state.r;

% the ellipse
[X,Y,Z] = idp3elli(Map.x(ran), Map.P(ran,ran), 3, 10) ;
set(MapFig.Lmk(Lmk.lmk).ellipse(1),...
    'xdata',   X,...
    'ydata',   Y,...
    'zdata',   Z,...
    'color',   color,...
    'visible', 'on');

% the mean:
x = idp2p(Map.x(ran));
set(MapFig.Lmk(Lmk.lmk).mean,...
    'xdata',   x(1),...
    'ydata',   x(2),...
    'zdata',   x(3),...
    'color',   satColor(color),...
    'visible', 'on');

% the label
set(MapFig.Lmk(Lmk.lmk).label,...
    'position', x + posOffset,...
    'string',   num2str(Lmk.id),...
    'visible',  'on');