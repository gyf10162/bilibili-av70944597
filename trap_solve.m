%% ��ʼ
% clear;
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% ���е���
tmp=start;
a=zeros(100,100);
for i=1:100
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:100);    %a(i,j)Ϊ��i���ߵ���j��ĸ���
end
%% �����ߵ�ÿһ��ĸ���
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
%% ��ͼ
bar(p);
%% ����
p_index=[p;1:100]';
p_sorted=sortrows(p_index,1);
% ����󣬿ɼ���������5��Ϊ7,6,12,13,11���Ӵ�С��
% ������С��5��Ϊ2,3,4,8,5����С���󣬲����ǵ�һ��
%% �������
% Ҫ������ʣ����˵�һ������֮�⣬��Ҫ���¼�����������
% ������Ϊ6,7,11,12,13
traps_max=[6,7,8,9,10];
% ��ȵ���һ������ĸ���Ϊp(1,6)
p_trap_max(1)=p(1,6);
% �ȵ��ڶ��������ǰ����û�вȵ���һ������
% ����ȵ��ڶ����������
[a2,p2]=trap_CondProb(traps_max(1:2-1));
p_trap_max(2)=p2(1,traps_max(2));
% �Դ�����
[a3,p3]=trap_CondProb(traps_max(1:3-1));
p_trap_max(3)=p3(1,traps_max(3));
[a4,p4]=trap_CondProb(traps_max(1:4-1));
p_trap_max(4)=p4(1,traps_max(4));
[a5,p5]=trap_CondProb(traps_max(1:5-1));
p_trap_max(5)=p5(1,traps_max(5));
% �ܵĲȵ�����ĸ���Ϊ
p_traped_max=sum(p_trap_max);
% ��С��ʤ����Ϊ
p_win_min=1-p_traped_max;
fprintf('��С��ʤ����Ϊ%f\n',p_win_min);
%% ͬ���������ʤ����
traps_min=[2,3,4,5,8];
p_trap_min(1)=p(1,2);
for i=2:5
    [~,tmp_p]=trap_CondProb(traps_min(1:i-1));
    p_trap_min(i)=tmp_p(1,traps_min(i));
end
% �ܵĲȵ�����ĸ���Ϊ
p_traped_min=sum(p_trap_min);
% ��С��ʤ����Ϊ
p_win_max=1-p_traped_min;
fprintf('����ʤ����Ϊ%f\n',p_win_max);
