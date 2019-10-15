function [p] = trap_viatable(size)
%trap_viatable 计算无陷阱情况下经过每一格的概率
%   输入： size    要计算的格数
%   输出： p       经过每一格的概率

%% 开始
start = [1,zeros(1,size-1)];
b = [0,1,1,1,1,1,1]/6;
%% 进行迭代
tmp=start;
a=zeros(size,size);
for i=1:size
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:size);    %a(i,j)为第i次走到第j格的概率
end
%% 计算走到每一格的概率
p=zeros(1,size);
for j=1:size
    p(1,j)=sum(a(:,j));
end
end
