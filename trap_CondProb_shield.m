function [a,p] = trap_CondProb_shield(traps)
%trap_CondProb_shield 在有护甲情况下的概率
%   这种情况比较复杂，是一个二维的随机过程
%   输入：	traps	陷阱位置的向量
%   输出：	a       第i行第j列表示第i次走到第j格的概率
%   		p       第j列表示玩家经过第j格的概率
%% 开始
start = [1,zeros(1,99);zeros(1,100)];
b = [0,1,1,1,1,1,1]/6;  
%% 进行迭代
tmp=start;
a=zeros(100,100,2);
for i=1:100
    % 清零在卷积之前，则卷积后的结果包含踩到陷阱的概率
    tmp(2,traps)=tmp(1,traps); % 损失0个护甲时踩到陷阱，则变成损失1个护甲
    tmp(1,traps)=0;
    % 先计算损失0个护甲的情况
    tmp_cv(1,1:size(tmp,2)+length(b)-1)=conv(tmp(1,:),b);
    a(i,:,1)=tmp_cv(1,1:100);    %a(i,j,k)为第i次走到第j格的概率，且损失了k-1个护甲
    % 再计算损失1个护甲的情况
    tmp_cv(2,:)=conv(tmp(2,:),b);
    a(i,:,2)=tmp_cv(2,1:100);    %a(i,j,k)为第i次走到第j格的概率，且损失了k-1个护甲
    tmp=tmp_cv;
end
%% 计算走到每一格的概率
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j,1));
    p(2,j)=sum(a(:,j,2));
end
end

