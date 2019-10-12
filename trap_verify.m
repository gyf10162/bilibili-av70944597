% 验证算法正确
pass = 0;
fail = 0;
n=1000000;
traps = [2,3,4,8,9];
for i=1:n
    pos = 1;
    while pos<100
        pos=pos+randi(6);
        if any(pos==traps)
            fail=fail+1;
            break;
        end
    end
    if pos>=100
        pass = pass+1;
    end
end
passrate = pass/n
