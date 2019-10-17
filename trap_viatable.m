function [p] = trap_viatable(Size)
%trap_viatable ��������������¾���ÿһ��ĸ���
%   ���룺 size    Ҫ����ĸ���
%   ����� p       ����ÿһ��ĸ���

%% ��ʼ
start = [1,zeros(1,Size-1)];
b = [0,1,1,1,1,1,1]/6;
%% ���е���
tmp=start;
a=zeros(Size,Size);
for i=1:Size
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:Size);    %a(i,j)Ϊ��i���ߵ���j��ĸ���
end
%% �����ߵ�ÿһ��ĸ���
p=zeros(1,Size);
for j=1:Size
    p(1,j)=sum(a(:,j));
end
end
