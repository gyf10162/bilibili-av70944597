%% ���
% ��Ϊ�ӵڶ������忪ʼ�ĸ��ʷֲ���ǰ��ĸ��ʷֲ��й�
% ��ʱֻ�뵽��ٵķ���
% ��ʱ�����ǰ30�����������
max=30;
max_u8=uint8(max);
count=0;
count_exp=nchoosek(max-1,5);
trapsDB=zeros(count_exp,5);
p_test=zeros(1,count_exp);
for i1=uint8(2):max_u8
    for i2=i1+uint8(1):max_u8
        for i3=i2+uint8(1):max_u8
            for i4=i3+uint8(1):max_u8
                for i5=i4+uint8(1):max_u8
                    traps=[i1,i2,i3,i4,i5];
                    count=count+1;
                    p_test(1,count)=trap_cal(traps);
                    trapsDB(count,:)=traps;
                end
            end
        end
    end
end
%% ����
p_test_index=[p_test',(1:length(p_test))'];
p_test_sorted=sortrows(p_test_index,1);
%����ʤ����
ind_traped_min=p_test_sorted(1,2);
p_traped_min=p_test(ind_traped_min);
p_win_max=1-p_traped_min;
disp(trapsDB(ind_traped_min,:));
fprintf('����ʤ����Ϊ%f\n',p_win_max);
%��С��ʤ����
ind_traped_max=p_test_sorted(end,2);
p_traped_max=p_test(ind_traped_max);
p_win_min=1-p_traped_max;
disp(trapsDB(ind_traped_max,:));
fprintf('��С��ʤ����Ϊ%f\n',p_win_min);
