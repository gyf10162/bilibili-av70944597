function [p_traped] = trap_cal(traps)
%trap_cal �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i=1:5
    [~,tmp_p]=trap_CondProb(traps(1:i-1));
    p_trap(i)=tmp_p(1,traps(i));
end
% �ܵĲȵ�����ĸ���Ϊ
p_traped=sum(p_trap);
end

