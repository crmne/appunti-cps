import graph;
import common;

usepackage("palatino");
usepackage("mathpazo");

size(15cm,5.4cm,IgnoreAspect);

// Distribuzione geometrica
real[] geomDistr(real p) {
  int n = 1;
  for(real d = 1; d > p/500; d = p*(1-p)^(n-1)) ++n;
  real[] distr = new real[n];
  for(int i = 0; i <= n; ++i)
    distr[i] = p*(1-p)^(i-1);
  distr[0] = 0;
  return distr;
}

real p = 0.2;

histogram(geomDistr(p),fillpen=lightgray,drawpen=black,bars=true,
  legend="$\mathcal{G}(p="+(string)p+")$");

xaxis("$i$",Bottom,RightTicks);
yaxis("$\textbf{P}(T = i)$",Left,LeftTicks(trailingzero));
attach(scale(0.75)*legend(),25E,90N);
