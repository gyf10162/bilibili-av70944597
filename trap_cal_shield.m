function [p_traped] = trap_cal_shield(traps,pTable)
%trap_cal_shield ��������������²ȵ������ʧ�ܵĸ���
%   ���룺	traps       ����λ�õ�����
%           pTable      ����㵽��ÿһ��ĸ��ʱ����û���ṩ�ò����������м���
%   ����� p_traped    ��Ҳȵ�����ĸ���

traps = sort(traps);    % ȷ������С����˳������
maxTrap = traps(end);   % ���һ������λ��
nTraps = length(traps); % ����ĸ���
% ���û���ṩ���ʱ���������㵽���һ������λ�õ�ÿ����ʱ�
if nargin < 2
    pTable = trap_viatable(maxTrap);
end
lives = 2;              % ������Ϊ2��ʾ��һ������
pTrap = zeros(lives,nTraps);    % �ȵ�ÿһ������ĸ��ʣ���ʼ����һ��0����
pTrap(1,:) = pTable(traps);     % ����Ϊ�ȵ�����Ĵ�������һ�г�ʼ����������ʱ����ø�ĸ���
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
% �ܵĲȵ�����ĸ���Ϊ
p_traped = sum(pTrap(lives,:));
end
