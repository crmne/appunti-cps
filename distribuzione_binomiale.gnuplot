set encoding utf8
load 'common.gnuplot'
set title "Distribuzione binomiale (cfr. Normale)"
set terminal pdf enhanced
set output 'distribuzione_binomiale.pdf'
set xlabel "x" 
set ylabel "P(X=x)" 
n = 100
p = 0.5
mu = n*p
sigma = (n*p*(1-p))**0.5
set xrange [ mu-(sigma*5) : mu+(sigma*5) ] noreverse nowriteback
plot binom(rnd(x), n, p) with histeps, normal(x, mu, sigma)
