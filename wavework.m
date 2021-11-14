function [ varargout] = wavework(opcode,type,c,s,n,x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
elements=prod(s,2);
nmax=size(s,1)-2;

switch lower(type(1))
    case 'a'
        nindex=1;
        start=1;
        stop=elements(1);
        ntst=nmax;
    case {'h','v','d'}
        switch type
            case 'h'
                offset=0;
            case 'v'
                offset=1;
            case 'd'
                offset=2;
        end
        nindex=size(s,1)-n;
        start=elements(1)+3*sum(elements(2:nmax-n+1))+offset*elements(nindex)+1;
        stop=start+elements(nindex)-1;
        ntst=n;
    otherwise
        error('type must begin with "a,h,v,d".');
end

switch lower(opcode)
    case{'copy','cut'}
        y=repmat(1,s(nindex,:));
        y(:)=c(start:stop);
        nc=c;
        if strcmpi(opcode(1:3),'cut')
            nc(start:stop)=0;
            varargout={nc,y};
        else
            varargout={y};
        end
    case 'paste'
       if prod(size(x))~=elements(end-ntst)
           error('X is not sized for the requested paste');
       else
           nc=c;
           nc(start:stop)=x(:);
           varargout={nc};
       end
    otherwise
        error('unrecognized opcode.');
end

        
end

