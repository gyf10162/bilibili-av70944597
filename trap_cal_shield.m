function [p_traped] = trap_cal_shield(traps)
%trap_cal_shield 计算有护甲情况下踩到陷阱而失败的概率
%   输入：	traps       陷阱位置的向量
%   输出：	p_traped    玩家踩到陷阱的概率

[~,tmp_p]=trap_CondProb_shield(traps);
% 总的踩到陷阱的概率为第二次踩到陷阱的概率之和
p_traped = sum(tmp_p(2,traps));
end
