function [p_traped] = trap_cal(traps)
%trap_cal ����ȵ�����ĸ���
%   ���룺 traps       ����λ�õ�����
%   ����� p_traped    ��Ҳȵ�����ĸ���

% �����������������Ҿ���ÿһ��ĸ���
[~,tmp_p]=trap_CondProb(traps);
% �ܵĲȵ�����ĸ���Ϊ
p_traped = sum(tmp_p(traps));
end
