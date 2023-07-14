cols_no=8;
rows_no=16;
% cols_no=2;
% rows_no=4;

d1_golden = fopen('d1.txt','w');
d2_golden = fopen('d2.txt','w');
vk1_golden = fopen('vk1.txt','w');
d3_golden = fopen('d3.txt','w');
tk_golden = fopen('tk.txt','w');
d4_golden = fopen('d4.txt','w');
d5_golden = fopen('d5.txt','w');
tri_real = fopen('tri_real.txt','w');
tri_ieee754 = fopen('tri_ieee754.txt','w');

A = single(zeros(cols_no, rows_no));
x = 1:rows_no;
vk = 1:rows_no;
yj = 1:rows_no;
yjp = 1:rows_no;
tri = 1:rows_no;
d1 = single(0.0);
d2 = single(0.0);
d3 = single(0.0);
tk = single(0.0);
d4 = single(0.0);
d5 = single(0.0);

dmx_ieee754_word = fopen('dmx_ieee754_word.txt','r');
% Setup matrix
for a = 1:cols_no
  for b = 1:rows_no
    tempFloat = typecast(uint32(hex2dec(fgetl(dmx_ieee754_word))),'single');
    A(a,b) = single(tempFloat);
  end 
end
A
for k = 1:cols_no % external loop
  % reflector and tk
  for i = k :rows_no
     x(i) = single(A(k,i));
     vk(i) = single(A(k,i));
  end

  for i = k:rows_no
    d1  = single(dot(x(i),x(i)) + d1);
  end
  d1
  fprintf(d1_golden,num2hex(single(d1)));
  fprintf(d1_golden,' \n');

  d2 = single(sqrt(d1))
  d2
  fprintf(d2_golden,num2hex(single(d2)));
  fprintf(d2_golden,' \n');
  
  if single(x(k)) < 0
      vk(k) = single(x(k) + -d2);
  else
      vk(k) = single(x(k) + d2);
  end
  vk(k)
  fprintf(vk1_golden,num2hex(single(vk(k))));
  fprintf(vk1_golden,' \n');
    
  for i = k:rows_no    
    d3  = single(dot(vk(i),vk(i))+d3);
  end
  d3
  fprintf(d3_golden,num2hex(single(d3)));
  fprintf(d3_golden,' \n');
    
  tk = single(-2 / d3);
  tk
  fprintf(tk_golden,num2hex(single(tk)));
  fprintf(tk_golden,' \n');

  % trailing loop
  for j = k:cols_no
    for i = k :rows_no
       yj(i) = A(j,i);
    end
    
    for i = k:rows_no
      d4  = single(dot(yj(i),vk(i)) + d4);
    end
    d4
    fprintf(d4_golden,num2hex(single(d4)));
    fprintf(d4_golden,' \n');

    d5 =single(d4*tk);
    d5
    fprintf(d5_golden,num2hex(single(d5)));
    fprintf(d5_golden,' \n');
    
    for i = k:rows_no
      yjp(i)  = single(d5*vk(i)+yj(i));
    end
    yjp

    for i = k:rows_no
      A(j,i) =single(yjp(i));
    end 
    d4 = single(0.0);
  end % trailing loop end
  d1 = single(0.0);
  d3 = single(0.0);
end % external loop end

for a = 1:cols_no
  for b = 1:rows_no
    tri(b) = single(A(a,b));
    fprintf(tri_real,'%f ',single(tri(b)));
    fprintf(tri_ieee754,num2hex(single(tri(b))));
  end
  fprintf(tri_real,' \n');
  fprintf(tri_ieee754,' \n');
end

fclose(dmx_ieee754_word);
fclose(d1_golden);
fclose(d2_golden);
fclose(vk1_golden);
fclose(d3_golden);
fclose(tk_golden);
fclose(d4_golden);
fclose(d5_golden);
fclose(tri_real);
fclose(tri_ieee754);
