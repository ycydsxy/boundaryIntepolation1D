function [ BC_2 ] = boundaryIntepolation1D(oldBC,r01,R1,r02,R2 )
% 1ά�߽��Ƶ�
%   oldBC:�ɱ߽�,[rr pt tt ca cr cu]
%   r01:�ɱ߽���챰뾶
%   R1:�ɱ߽��ϻ�뾶
%   r02:�±߽���챰뾶
%   R2:�±߽��ϻ�뾶

n=30;% ����ȡ����
gamma=1.4;
R=287;
Cp=gamma*R/(gamma-1);

delta_r1=(R1-r01)/(n-1);
delta_r2=(R2-r02)/(n-1);
r1=zeros(n,1);
r2=zeros(n,1);
for i=1:n
   r1(i)=r01+delta_r1*(i-1);
   r2(i)=r02+delta_r2*(i-1);
end

BC_1=zeros(n,10);% [rr pt tt ca cr cu V^2 p T rho]
BC_2=zeros(n,10);% [rr pt tt ca cr cu V^2 p T rho]
BC_1(:,1)=r1;
BC_2(:,1)=r2;

for i=2:6
    BC_1(:,i)=interp1(oldBC(:,1),oldBC(:,i),BC_1(:,1),'linear','extrap');
end
BC_1(:,7)=BC_1(:,4).^2+BC_1(:,5).^2+BC_1(:,6).^2;
BC_1(:,9)=BC_1(:,3)-BC_1(:,7)/2/Cp;
BC_1(:,8)=BC_1(:,2).*(BC_1(:,9)./BC_1(:,3)).^(gamma/(gamma-1));
BC_1(:,10)=BC_1(:,8)/R./BC_1(:,9);

BC_2(:,6)=BC_1(:,6).*BC_1(:,1)./BC_2(:,1);%��Cu �������
BC_2(:,5)=0;% ��Cr ��Cr=0
BC_2(:,2)=BC_1(:,2);%��pt ��ѹ���
BC_2(:,3)=BC_1(:,3);%��tt �������

for i=1:n % ��Ca
    fun=@(x)BC_1(i,10)*delta_r1*BC_1(i,1)*BC_1(i,4)/delta_r2/BC_2(i,1)/x...
        - BC_2(i,2)/R/BC_2(i,3)^(gamma/(gamma-1))*(BC_2(i,3)-(x^2+BC_2(i,6)^2)/2/Cp)^(1/(gamma-1));
    [BC_2(i,4),fval]=fsolve(fun,BC_1(i,4));
    disp(fval);
end

BC_2(:,7)=BC_2(:,4).^2+BC_2(:,5).^2+BC_2(:,6).^2;
BC_2(:,9)=BC_2(:,3)-BC_2(:,7)/2/Cp;
BC_2(:,8)=BC_2(:,2).*(BC_2(:,9)./BC_2(:,3)).^(gamma/(gamma-1));
BC_2(:,10)=BC_2(:,8)/R./BC_2(:,9);

end

