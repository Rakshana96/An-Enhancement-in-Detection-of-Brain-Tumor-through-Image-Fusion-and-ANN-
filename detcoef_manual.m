function [h,v,d] = detcoef_manual(c,s,n)
k     = size(s,1)-n;
first = (s(1,1)*s(1,2) + 3*sum(s(2:k-1,1).*s(2:k-1,2)))+1;
add   = s(k,1)*s(k,2);
    last = first+add-1;
    h = reshape(c(first:last),s(k,:));
    first = first+add;
    last = first+add-1;
    v = reshape(c(first:last),s(k,:));
    first = first+add;
    last = first+add-1;
    d = reshape(c(first:last),s(k,:));
end













