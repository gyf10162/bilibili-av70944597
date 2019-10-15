function [p] = trap_viatable(size)
%trap_viatable ��������������¾���ÿһ��ĸ���
%   ���룺 size    Ҫ����ĸ���
%   ����� p       ����ÿһ��ĸ���

%% ��ʼ
start = [1,zeros(1,size-1)];
b = [0,1,1,1,1,1,1]/6;
%% ���е���
tmp=start;
a=zeros(size,size);
for i=1:size
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:size);    %a(i,j)Ϊ��i���ߵ���j��ĸ���
end
%% �����ߵ�ÿһ��ĸ���
p=zeros(1,size);
for j=1:size
    p(1,j)=sum(a(:,j));
end
end
