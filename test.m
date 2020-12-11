clear variables;
close all;

r = [];
dvec = 3:6
for d=dvec
    test_matching;
    r = [r E];
end
semilogy(dvec,log(r));
xlabel('Dimension d');ylabel('Expected first sampling time of the optimal decision');