import common;

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

histogram(hypergeomDistr(n,H,Nt), fillpen=fillpen, drawpen=drawpen, bars=bars,
  legend="$\mathcal{HG}(n="+(string)n+",\; H="+(string)H+",\; N="+(string)Nt+")$");

xaxis("$k$",Bottom,RightTicks);
yaxis("$\textbf{P}(X = k)$",Left,LeftTicks(trailingzero));
real xp = truepoint(E).x;
real yp = truepoint(N).y;
attach(scale(0.75)*legend(), (xp - xp/3.5, yp - yp/5.5),UnFill);
