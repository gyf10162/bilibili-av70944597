% ��֤�㷨��ȷ�������ף�
pass = 0;
fail = 0;
n=1000000;
traps = [2,3,4,5,6];
for i=1:n
    pos = 1;
    shield=1;
    while pos<100
        pos=pos+randi(6);
        if any(pos==traps)
            if shield>0
                shield=shield-1;
            else
                fail=fail+1;
                break;
            end
        end
    end
    if pos>=100
        pass = pass+1;
    end
end
passrate = pass/n;
fprintf('��ʤ����Ϊ%f\n',passrate);
