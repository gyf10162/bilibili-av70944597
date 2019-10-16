function [p_traped] = trap_cal_shield(traps,pTable)
%trap_cal_shield 计算有铠甲情况下踩到陷阱而失败的概率
%   输入：	traps       陷阱位置的向量
%           pTable      从起点到达每一格的概率表，如果没有提供该参数，则会进行计算
%   输出： p_traped    玩家踩到陷阱的概率

traps = sort(traps);    % 确保按从小到大顺序排列
maxTrap = traps(end);   % 最后一个陷阱位置
nTraps = length(traps); % 陷阱的个数
% 如果没有提供概率表，则计算从起点到最后一个陷阱位置的每格概率表
if nargin < 2
    pTable = trap_viatable(maxTrap);
end
lives = 2;              % 命数，为2表示有一个铠甲
pTrap = zeros(lives,nTraps);    % 踩到每一个陷阱的概率，初始化成一个0矩阵
pTrap(1,:) = pTable(traps);     % 行数为踩到陷阱的次数，第一行初始化成无陷阱时到达该格的概率
for i = 1:nTraps
    for k = 1:lives
        for j = i+1:nTraps
            tmp = pTrap(k,i)*pTable(traps(j)-traps(i)+1);
            pTrap(k,j) = pTrap(k,j) - tmp;
            if k~=lives
                pTrap(k+1,j) = pTrap(k+1,j) + tmp;
            end
        end
    end
end
% 总的踩到陷阱的概率为
p_traped = sum(pTrap(lives,:));
end
