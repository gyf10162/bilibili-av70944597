function [a,p] = trap_CondProb(ignore)
%trap_CondProb 计算条件概率
%   此处显示详细说明
%% 开始
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% 进行迭代
tmp=start;
a=zeros(100,100);
for i=1:100
    tmp=conv(tmp,b);
    for ig=ignore
        if(tmp(ig)>0)
            tmp(ig)=0;
        end
    end
    a(i,:)=tmp(1,1:100);    %a(i,j)为第i次走到第j格的概率
end
%% 计算走到每一格的概率
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
end

