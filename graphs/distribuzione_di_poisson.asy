import common;

// Distribuzione di Poisson
real[] poissonDistr(real lambda, real min=0.0001) {
  bool go = true;
  real[] distr = new real[];
  for(int i = 0; go; ++i) {
    distr[i] = ((lambda^i)/(factorial(i)))*e^(-lambda);
    if(distr[i] < min) go = false;
  }
  return distr;
}

real lambda = 4;

histogram(poissonDistr(lambda,min=0.001), fillpen=fillpen, drawpen=drawpen, bars=bars,
  legend="$Pois(\lambda="+(string)lambda+")$");

xaxis("$i$",Bottom,RightTicks);
yaxis("$\textbf{P}(X = i)$",Left,LeftTicks(trailingzero));
real xp = truepoint(E).x;
real yp = truepoint(N).y;
attach(scale(0.75)*legend(), (xp - xp/3.5, yp - yp/4),UnFill);
