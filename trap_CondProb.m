function [a,p] = trap_CondProb(traps)
%trap_CondProb ���������������µĸ���
%   ���룺 traps	����λ�õ�����
%   ����� a       ��i�е�j�б�ʾ��i���ߵ���j��ĸ���
%           p       ��j�б�ʾ��Ҿ�����j��ĸ���
%% ��ʼ
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% ���е���
tmp=start;
a=zeros(100,100);
for i=1:100
    for ig=traps
        tmp(ig)=0; % �����ھ��֮ǰ��������Ľ�������ȵ�����ĸ���
    end
    tmp=conv(tmp,b);
    a(i,:)=tmp(1,1:100);    %a(i,j)Ϊ��i���ߵ���j��ĸ���
end
%% �����ߵ�ÿһ��ĸ���
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
end
