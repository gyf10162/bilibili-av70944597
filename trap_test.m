%% 穷举
% 因为从第二个陷阱开始的概率分布与前面的概率分布有关
% 暂时只想到穷举的方法
% 由于优化了算法，因此直接穷举2到99格的所有组合
Start=2;
End=99;
End_u8=uint8(End);
count=0;
count_exp=nchoosek(End-Start+1,5);
trapsDB=zeros(count_exp,5);
p_test=zeros(1,count_exp);
% 由于骰子面数确定时，玩家到达每一格（无陷阱）的概率是确定的，因此提前计算好概率表
pTable = trap_viatable(100);
for i1 = uint8(Start):End_u8
    for i2 = i1+uint8(1):End_u8
        for i3 = i2+uint8(1):End_u8
            for i4 = i3+uint8(1):End_u8
                for i5 = i4+uint8(1):End_u8
                    traps=[i1,i2,i3,i4,i5];
                    count=count+1;
                    p_test(1,count)=trap_cal(traps,pTable);
                    trapsDB(count,:)=traps;
                end
            end
        end
    end
end
%% 排序
p_test_index=[p_test',(1:length(p_test))'];
p_test_sorted=sortrows(p_test_index,1);
%最大获胜概率
ind_traped_min=p_test_sorted(1,2);
p_traped_min=p_test(ind_traped_min);
p_win_max=1-p_traped_min;
fprintf('最大获胜概率为%.12f\n',p_win_max);
disp 陷阱为:
disp(trapsDB(ind_traped_min,:));
%最小获胜概率
ind_traped_max=p_test_sorted(end,2);
p_traped_max=p_test(ind_traped_max);
p_win_min=1-p_traped_max;
fprintf('最小获胜概率为%.12f\n',p_win_min);
disp 陷阱为:
disp(trapsDB(ind_traped_max,:));
