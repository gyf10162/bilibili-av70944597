function [p_traped] = trap_cal(traps)
%trap_cal 计算踩到陷阱的概率
%   输入： traps       陷阱位置的向量
%   输出： p_traped    玩家踩到陷阱的概率

% 计算有陷阱情况下玩家经过每一格的概率
[~,tmp_p]=trap_CondProb(traps);
% 总的踩到陷阱的概率为
p_traped = sum(tmp_p(traps));
end
