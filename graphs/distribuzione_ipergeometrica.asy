import graph;
import common;

usepackage("palatino");
usepackage("mathpazo");

size(15cm,5.4cm,IgnoreAspect);

// Distribuzione ipergeometrica
real[] hypergeomDistr(int n, int H, int Nt) {
  int min = max(0, n-(Nt-H));
  int max = min(n,H);
  real[] distr = new real[];
  for(int i = 0; i < min; ++i)
    distr[i] = 0;
  for(int i = min; i <= max; ++i)
    distr[i] = (choose(H, i) * choose(Nt-H, n-i)) / choose(Nt, n);
  return distr;
}

int n = 12;
int H = 10;
int Nt = 20;

histogram(hypergeomDistr(n,H,Nt),fillpen=red,drawpen=black,bars=true,
  legend="$\mathcal{H}(n="+(string)n+",\; H="+(string)H+",\; N="+(string)Nt+")$");

xaxis("$i$",Bottom,RightTicks);
yaxis("$\textbf{P}(X = i)$",Left,LeftTicks(trailingzero));
attach(scale(0.75)*legend(),n-(n/4),90N);
