import common;

// Distribuzione binomiale
real[] binomDistr(int n, real p) {
  real[] distr = new real[n];
  for(int i = 0; i <= n; ++i)
    distr[i] = choose(n, i) * p^i * (1 - p)^(n - i);
  return distr;
}

int  n = 20;
real p = 0.5;

histogram(binomDistr(n,p), fillpen=fillpen, drawpen=drawpen, bars=bars,
  legend="$\mathcal{B}(n="+(string)n+",\; p="+(string)p+")$");

xaxis("$k$",Bottom,RightTicks);
yaxis("$\textbf{P}(S_n = k)$",Left,LeftTicks(trailingzero));
real xp = truepoint(E).x;
real yp = truepoint(N).y;
attach(scale(0.75)*legend(), (xp - xp/3.5, yp - yp/4),UnFill);
