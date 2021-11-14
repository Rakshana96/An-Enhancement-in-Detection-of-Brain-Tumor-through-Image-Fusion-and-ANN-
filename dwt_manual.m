function [a,h,v,d]=dwt_manual(x,lo_d,lo_h)
% Compute sizes.
shift=[0 0];
lf = length(lo_d);
first=2-shift;
sx=size(x);
last = sx+lf-1;
x = double(x);
    y = wextend('addcol','sym',x,1);
    z = conv2(y,lo_d(:)','valid');
    a = convdown(z,lo_d,first,last); 
    h = convdown(z,lo_h,first,last);
    z = conv2(y,lo_h(:)','valid');
    v = convdown(z,lo_d,first,last);
    d = convdown(z,lo_h,first,last);
end
function y = convdown(x,F,first,last)

y = x(:,2:2:last(2));
y = wextend('addrow','sym',y,1);
y = conv2(y',F(:)','valid');
y = y';
y = y(2:2:last(1),:);
end