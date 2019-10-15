function [p_traped] = trap_cal(traps, pTable)
%trap_cal 计算踩到陷阱的概率
%   输入： traps       陷阱位置的向量
%           pTable      从起点到达每一格的概率表，如果没有提供该参数，则会进行计算
%   输出： p_traped    玩家踩到陷阱的概率

traps = sort(traps);    % 确保按从小到大顺序排列
maxTrap = traps(end);   % 最后一个陷阱位置
nTraps = length(traps); % 陷阱的个数
% 如果没有提供概率表，则计算从起点到最后一个陷阱位置的每格概率表
if nargin < 2
    pTable = trap_viatable(maxTrap);
end
pTrap = pTable(traps);  % 踩到每一个陷阱的概率，初始化成无陷阱时到达该格的概率
for i = 1:nTraps
    for j = i+1:nTraps
        pTrap(j) = pTrap(j) - pTrap(i)*pTable(traps(j)-traps(i)+1);
    end
end
% 总的踩到陷阱的概率为
p_traped = sum(pTrap);
end
