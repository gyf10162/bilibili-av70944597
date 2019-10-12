%% 开始
% clear;
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% 进行迭代
tmp=start;
a=zeros(100,100);
for i=1:100
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:100);    %a(i,j)为第i次走到第j格的概率
end
%% 计算走到每一格的概率
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
%% 绘图
bar(p);
%% 排序
p_index=[p;1:100]';
p_sorted=sortrows(p_index,1);
% 排序后，可见概率最大的5格为7,6,12,13,11（从大到小）
% 概率最小的5格为2,3,4,8,5（从小到大，不考虑第一格）
%% 计算概率
% 要计算概率，除了第一个陷阱之外，需要重新计算条件概率
% 设陷阱为6,7,11,12,13
traps_max=[6,7,8,9,10];
% 则踩到第一个陷阱的概率为p(1,6)
p_trap_max(1)=p(1,6);
% 踩到第二个陷阱的前提是没有踩到第一个陷阱
% 计算踩到第二个陷阱概率
[a2,p2]=trap_CondProb(traps_max(1:2-1));
p_trap_max(2)=p2(1,traps_max(2));
% 以此类推
[a3,p3]=trap_CondProb(traps_max(1:3-1));
p_trap_max(3)=p3(1,traps_max(3));
[a4,p4]=trap_CondProb(traps_max(1:4-1));
p_trap_max(4)=p4(1,traps_max(4));
[a5,p5]=trap_CondProb(traps_max(1:5-1));
p_trap_max(5)=p5(1,traps_max(5));
% 总的踩到陷阱的概率为
p_traped_max=sum(p_trap_max);
% 最小获胜概率为
p_win_min=1-p_traped_max;
fprintf('最小获胜概率为%f\n',p_win_min);
%% 同理计算最大获胜概率
traps_min=[2,3,4,5,8];
p_trap_min(1)=p(1,2);
for i=2:5
    [~,tmp_p]=trap_CondProb(traps_min(1:i-1));
    p_trap_min(i)=tmp_p(1,traps_min(i));
end
% 总的踩到陷阱的概率为
p_traped_min=sum(p_trap_min);
% 最小获胜概率为
p_win_max=1-p_traped_min;
fprintf('最大获胜概率为%f\n',p_win_max);
