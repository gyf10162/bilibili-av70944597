function [a,p] = trap_CondProb(ignore)
%trap_CondProb ������������
%   �˴���ʾ��ϸ˵��
%% ��ʼ
start = [1,zeros(1,99)];
b = [0,1,1,1,1,1,1]/6;  
%% ���е���
tmp=start;
a=zeros(100,100);
for i=1:100
    tmp=conv(tmp,b);
    for ig=ignore
        if(tmp(ig)>0)
            tmp(ig)=0;
        end
    end
    a(i,:)=tmp(1,1:100);    %a(i,j)Ϊ��i���ߵ���j��ĸ���
end
%% �����ߵ�ÿһ��ĸ���
p=zeros(1,100);
for j=1:100
    p(1,j)=sum(a(:,j));
end
end

