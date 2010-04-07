private import graph;
private import stats;

// Prende in input un array di dati e plotta il grafico centrando le barre
void histogram(picture pic=currentpicture, real[] data,
  real low=-infinity, pen fillpen=nullpen,
  pen drawpen=nullpen, bool bars=false,
  Label legend="", real markersize=legendmarkersize)
{
  if((fillpen == nullpen || bars == true) && drawpen == nullpen)
    drawpen=currentpen;
  bool[] valid = data > 0;
  real m=min(valid ? data : null);
  real M=max(valid ? data : null);
  bounds my=autoscale(pic.scale.y.scale.T(m),pic.scale.y.T(M),
    pic.scale.y.scale);
  if(low == -infinity) low=pic.scale.y.scale.Tinv(my.min);
  real last=low;
  int n=data.length;
  real a = - 0.5;
  real b = n - 0.5;
  real[] bins = a+sequence(n+1)*((b-a)/n);
  begingroup(pic);
  for(int i=0; i < n; ++i) {
    if(valid[i]) {
      real c=data[i];
      pair b=Scale(pic,(bins[i+1],c));
      pair a=Scale(pic,(bins[i],low));
      if(fillpen != nullpen) {
        fill(pic,box(a,b),fillpen);
        if(!bars) draw(pic,b--(b.x,a.y),fillpen);
      }
      if(!bars)
        draw(pic,halfbox(Scale(pic,(bins[i],last)),b),drawpen);
      else draw(pic,topbox(a,b),drawpen);
      last=c;
    } else {
      if(!bars && last != low) {
        draw(pic,Scale(pic,(bins[i],last))--Scale(pic,(bins[i],low)),drawpen);
        last=low;
      }
    }
  }
  if(!bars && last != low)
    draw(pic,Scale(pic,(bins[n],last))--Scale(pic,(bins[n],low)),drawpen);
  endgroup(pic);
  if(legend.s != "") {
    marker m=marker(scale(markersize)*shift((-0.5,-0.5))*unitsquare,
      drawpen,fillpen == nullpen ? Draw :
    (drawpen == nullpen ? Fill(fillpen) : FillDraw(fillpen)));
    legend.p(drawpen);
    pic.legend.push(Legend(legend.s,legend.p,invisible,m.f));
  }
}
