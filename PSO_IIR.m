function[Pg,Fbest] =PSO_IIR(fun,boundaries)

D=size(boundaries,1);
M=1e3;
N=40;
V=zeros(N,D);
C1=2.5;
C2=2.5;
W=0.7;

Aleatorios=rand(N,D);
P=nan(size(Aleatorios));
for n=1:N
    P(n,:)=boundaries(:,1)' + (boundaries(:,2)-boundaries(:,1))'.*Aleatorios(n,:);
end


F=nan(N,1);
for n=1:N
    F(n)=fun(P(n,:));
end

Pgi=P;  
[Fbest,g]=min(F);
Pg=P(g,:);

for m=1:M
    for n=1:N
        V(n,:)=W*(V(n,:)+C1*rand(1,D).*(Pg-P(n,:))+...
            C2*rand(1,D).*(Pgi(n,:)-P(n,:)));
        P(n,:)=P(n,:)+V(n,:);
    end

    F=nan(N,1);
for n=1:N
    F(n)=fun(P(n,:));
end

[Fbest,g]=min(F);
Pg=P(g,:);


for n=1:N
    if fun(Pgi(n,:)) > F(n)
        Pgi(n,:)=P(n,:);
    end
end
    
end;



