function [p_traped] = trap_cal_shield(traps)
%trap_cal_shield �����л�������²ȵ������ʧ�ܵĸ���
%   ���룺	traps       ����λ�õ�����
%   �����	p_traped    ��Ҳȵ�����ĸ���

[~,tmp_p]=trap_CondProb_shield(traps);
% �ܵĲȵ�����ĸ���Ϊ�ڶ��βȵ�����ĸ���֮��
p_traped = sum(tmp_p(2,traps));
end
