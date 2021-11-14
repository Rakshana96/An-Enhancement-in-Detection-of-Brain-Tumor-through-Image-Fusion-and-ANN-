function out = hysteresis(in1,in2)
out = in2; count = 1; k=0;
MAXITERATION = 200;
while ( ( count ~= 0 ) && ( k < MAXITERATION ) )
count = 0;
for i=2:(size(out,1)-1)
for j=2:(size(out,2)-1)
if ( out(i,j) > 0 )
if ( in1(i-1,j) > 0 )
out(i-1,j) = 255; count = count + 1;
end
if ( in1(i+1,j) > 0 )
out(i+1,j) = 255; count = count + 1;
end
if ( in1(i,j-1) > 0 )
out(i,j-1) = 255; count = count + 1;
end
if ( in1(i,j+1) > 0 )
out(i,j+1) = 255; count = count + 1;
end
end
end
end
k = k + 1;
end