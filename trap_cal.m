function [p_traped] = trap_cal(traps)
%trap_cal 此处显示有关此函数的摘要
%   此处显示详细说明
for i=1:5
    [~,tmp_p]=trap_CondProb(traps(1:i-1));
    p_trap(i)=tmp_p(1,traps(i));
end
% 总的踩到陷阱的概率为
p_traped=sum(p_trap);
end

