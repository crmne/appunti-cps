import graph;
import common;

usepackage("palatino");
usepackage("mathpazo");

size(15cm,5.4cm,IgnoreAspect);

// Distribuzione geometrica
real[] geomDistr(int n, real p) {
  real[] distr = new real[n];
  for(int i = 0; i <= n; ++i)
    distr[i] = p*(1-p)^i;
  return distr;
}

int  n = 12;
real p = 0.5;

histogram(geomDistr(n,p),fillpen=red,drawpen=black,bars=true,
  legend="$\mathcal{G}(n="+(string)n+",\; p="+(string)p+")$");

xaxis("$k$",BottomTop,LeftTicks);
yaxis("$\textbf{P}(S_n = k)$",LeftRight,RightTicks(trailingzero));
attach(scale(0.75)*legend(),10E,80N,UnFill);
