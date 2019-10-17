function [p] = trap_viatable(Size)
%trap_viatable 计算无陷阱情况下经过每一格的概率
%   输入： size    要计算的格数
%   输出： p       经过每一格的概率

%% 开始
start = [1,zeros(1,Size-1)];
b = [0,1,1,1,1,1,1]/6;
%% 进行迭代
tmp=start;
a=zeros(Size,Size);
for i=1:Size
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:Size);    %a(i,j)为第i次走到第j格的概率
end
%% 计算走到每一格的概率
p=zeros(1,Size);
for j=1:Size
    p(1,j)=sum(a(:,j));
end
end
