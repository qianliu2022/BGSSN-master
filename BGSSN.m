
%%%%%%%%Demo
A = load('sub');
B = load('Bnormal');
A=A';
B=B';
[m,n]=size(A);
[p,q]=size(B);
for i=1:m
    for t=1:n 
        a(t)=A(i,t); 
    end
     for j=1:p
         for k=1:q
         b(k)=B(j,k); 
         end
         w(i,j)=KL(a,b);
     end
end
w(isnan(w)) = 0;
ww=mean(w,2);
R3 = ww;
% addpath('BIC')
R1 = load('Bnormal');
R2 = load('sub');

R=corr(R1',R1');
[m,n]=size(R1)
H=zeros(m,m);%eye函数：生成单位矩阵。ones函数：生成全1矩阵。zeros函数：生成全0矩阵。
E=ones(m,m);
WN=zeros(m,m);
A=((E-R.*R)*(n-1));
v=size(R2,2)
for n=1:v
X=R2(:,n)
G=[R1,X]  
C=corr(G',G');
P=(C-R)./A;
P(isnan(P)) = 0;
P(isinf(-P)) =0;
Q(:,:,n)=P*R3(n);   
WN=WN+Q(:,:,n);
n=n+1
end
WN(WN<0) =0;
WN(logical(eye(size(WN))))=0;
G=WN;
