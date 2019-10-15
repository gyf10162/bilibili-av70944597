function [p_traped] = trap_cal(traps, pTable)
%trap_cal ����ȵ�����ĸ���
%   ���룺 traps       ����λ�õ�����
%           pTable      ����㵽��ÿһ��ĸ��ʱ����û���ṩ�ò����������м���
%   ����� p_traped    ��Ҳȵ�����ĸ���

traps = sort(traps);    % ȷ������С����˳������
maxTrap = traps(end);   % ���һ������λ��
nTraps = length(traps); % ����ĸ���
% ���û���ṩ���ʱ���������㵽���һ������λ�õ�ÿ����ʱ�
if nargin < 2
    pTable = trap_viatable(maxTrap);
end
pTrap = pTable(traps);  % �ȵ�ÿһ������ĸ��ʣ���ʼ����������ʱ����ø�ĸ���
for i = 1:nTraps
    for j = i+1:nTraps
        pTrap(j) = pTrap(j) - pTrap(i)*pTable(traps(j)-traps(i)+1);
    end
end
% �ܵĲȵ�����ĸ���Ϊ
p_traped = sum(pTrap);
end
