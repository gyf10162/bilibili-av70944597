function [a,p] = trap_CondProb(traps)
%trap_CondProb 计算有陷阱条件下的概率
%   输入： traps	陷阱位置的向量
%   输出： a       第i行第j列表示第i次走到第j格的概率
%           p       第j列表示玩家经过第j格的概率
%% 开始
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% 进行迭代
tmp=start;
a=zeros(100,100);
for i=1:100
    for ig=traps
        tmp(ig)=0; % 清零在卷积之前，则卷积后的结果包含踩到陷阱的概率
    end
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:100);    %a(i,j)为第i次走到第j格的概率
end
%% 计算走到每一格的概率
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
end
