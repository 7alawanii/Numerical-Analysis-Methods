function[Xna,etime] = BeirgeVeita(array,funct,iter)
data = array ;
data;
tol = cell2mat(data(6));
i1 = cell2mat(data(4));
%f=inline(funct,'x');
%func = '@(x)';
    %test_funct = 'x.^4-2.*x.^3-4.*x.^2+4.*x+4'
 %   func = strcat(func,funct);
    a = sym2poly(sym(funct));
%cf = coeffs(f,'All');
Xna = [];

tic;
for i=0 : iter-1
    b = [];
b=[b a(1)];
c = [];

c=[c a(1)];
    for i2=0 : length(a)-2 
        i2;
        bv=b(i2+1);
        av=a(i2+2);
        bn=0;
        i1;
        bn = av + bv*i1;
        b=[b bn];
         bv2=b(i2+2);
         cv=c(i2+1);
        cx = bv2 + cv*i1;
        
        c=[c cx];
        
        
       
    end
    i;
    a;
    b;
    c;
    Xnn = i1 - b(end)/c(end-1);
    Xna = [Xna Xnn];
    
    if(abs(Xnn-i1)<tol)
        break;
    end
    
    R=[];
    R=[R abs(Xnn-i1)];
    er=[];
    er=[er ((abs(Xnn-i1)/Xnn)*100)];
    i1 = Xnn;
    fig=figure
    data={a(1),b(1),c(1)};
        for i = 2:length(a)
            if(i== length(c))
                
            data=[data;{a(i),b(i),'--------'}];
            else
            data=[data;{a(i),b(i),c(i)}];
            end
        end
        
    t=uitable(fig,'Data',data,'Position',[20 20 262 204])
    
    dim=[.2 .5 .3 .3];
    str={'Absolute Error = ';'Relative Error = '}
    str2={num2str(R(end)); num2str(Xnn(end))}
    str3=strcat(str,str2)
    annotation('textbox',dim,'String',str3 )
end

etime=toc;
i
    
end