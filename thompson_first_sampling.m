function C = thompson_first_sampling( theta,G,xstar,T )
%sample the first time TS samples decision xstar between 1 and T
d = size(theta,1); 
S = theta*0;
 n = theta*0;
 %R = 0;
 C = 0;
 for t=1:T
       %sample distribution is Beta( 1 + number of successes, 1  + number of failures) )
       V = betarnd( 1 + S, 1 + n - S);
       %maximize indice to find the best decision
       [a,b]=munkres(-V.*G);U = eye(d);x_t = U(a,:);x_t = G.*x_t;
       %rewards
       Z_t = 0 + (rand(size(theta)) < theta);   
       %update statistics
       n = n + x_t;
       S = S + (x_t .* Z_t);
       %compute regret
       %R = R + rmax - sum(sum(theta.*x_t));
       C = C + 1;
       %Rt(t) = R;
       if (norm(x_t-xstar) == 0)
            break;
       else
           %x_t
       end
 end