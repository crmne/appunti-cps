import graph;
import common;

usepackage("palatino");
usepackage("mathpazo");

size(15cm,5.4cm,IgnoreAspect);

// Distribuzione binomiale
real[] binomDistr(int n, real p) {
  real[] distr = new real[n];
  for(int i = 0; i <= n; ++i)
    distr[i] = choose(n, i) * p^i * (1 - p)^(n - i);
  return distr;
}

int  n = 20;
real p = 0.5;

histogram(binomDistr(n,p),fillpen=red,drawpen=black,bars=true,
  legend="$\mathcal{B}(n="+(string)n+",\; p="+(string)p+")$");

xaxis("$k$",Bottom,RightTicks);
yaxis("$\textbf{P}(S_n = k)$",Left,LeftTicks(trailingzero));
attach(scale(0.75)*legend(),n-(n/6),90N);
