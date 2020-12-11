S=50;%number of samples
T = 10^5; %maximal time horizon
theta = zeros(d); %parameters
delta = 1/(2*d); %optimal items have a reward of 1, suboptimal items have a reward of 1-delta, Delta = 1 - d*delta
for i=1:d
    theta(i,i) = 1;
    if (i < d)
        theta(i,i+1) = 1-delta;
    else
        theta(i,1) = 1-delta;
    end
end
G = (theta > 0);  
xstar=eye(d);

%compute E(min(tau,T)) where tau is the first sampling time
for s=1:S
   C(s) = thompson_first_sampling( theta,G,xstar,T );
end

d
E = mean(C)
max_round = max(C)