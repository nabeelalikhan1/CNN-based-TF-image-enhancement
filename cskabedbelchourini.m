function g=cskabedbelchourini(N,C,D, D1)
x=(-.5+1/N:1/N:.5-1/N);
y=x;
g=zeros(N);
for ii=1:length(x)
    for jj=1:length(y)
        if (x(ii).^2/D.^2+ y(jj).^2/D1^2)<1
        g(ii,jj)=exp(2*C)*exp(C*D^2*(1/(x(ii).^2-D.^2)+1/(y(jj).^2-D1.^2)));
        end
       
    end
end
g=g/norm(g);