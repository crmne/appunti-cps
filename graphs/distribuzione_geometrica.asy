import common;

// Distribuzione geometrica
real[] geomDistr(real p, int precision=500) {
  int n = 1;
  for(real d = 1; d > p/precision; d = p*(1-p)^(n-1)) ++n;
  real[] distr = new real[n];
  for(int i = 0; i <= n; ++i)
    distr[i] = p*(1-p)^(i-1);
  distr[0] = 0;
  return distr;
}

real p = 0.2;

histogram(geomDistr(p), fillpen=fillpen, drawpen=drawpen, bars=bars,
  legend='$\mathcal{G}(p='+(string)p+')$');

xaxis("$i$",Bottom,RightTicks);
yaxis("$\textbf{P}(T = i)$",Left,LeftTicks(trailingzero));
real xp = truepoint(E).x;
real yp = truepoint(N).y;
attach(scale(0.75)*legend(), (xp - xp/3.5, yp - yp/4),UnFill);
