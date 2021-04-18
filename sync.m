clc;
clear all;
close all;

path = strcat('/home/shivangi/Desktop/sem/sem7/gamma_DC/project/data0');
cd(path);
m=3;
p=0;
g=2;

for j = 0:(m-1)   
     s = ['load Ms_' int2str(j) ';'];    
     eval(s); 
end
for j = 0:1:(m-1)   
     s = ['load Md_' int2str(j) ';'];    
     eval(s); 
end
for j = 0:(g-1)   
     s = ['load Gs_' int2str(j) ';'];    
     eval(s); 
end
for j = 0:(g-1)   
     s = ['load Gd_' int2str(j) ';'];    
     eval(s); 
end

load Ttt;

Msl= zeros(1,m);
Mdl= zeros(1,m);
Gsl= zeros(1,g);
Gdl= zeros(1,g);

for j = 0:(m-1)   
    t= ['Msl(1,j+1)=length(Ms_' int2str(j)  ');'];    
    eval(t); 
end
for j = 0:(m-1)   
    t= ['Mdl(1,j+1)=length(Md_' int2str(j)  ');'];    
    eval(t); 
end
for j = 0:(g-1)   
    t= ['Gsl(1,j+1)=length(Gs_' int2str(j)  ');'];    
    eval(t); 
end
for j = 0:(g-1)   
    t= ['Gdl(1,j+1)=length(Gd_' int2str(j)  ');'];    
    eval(t); 
end

MS= max(Msl);
MD= max(Mdl);
GS= max(Gsl);
GD= max(Gdl);
syncms = zeros(m,MS);
syncmd = zeros(m,MD);
syncgs = zeros(g,GS);
syncgd = zeros(g,GD);

 
for i= 1:m
     for j= 1:Msl(i)
         t= ['syncms(i,j)=(Ms_' int2str(i-1)  '(j));'];    
         eval(t); 
     end
 end
  
for i= 1:m
     for j= 1:Mdl(i)
         t= ['syncmd(i,j)=(Md_' int2str(i-1)  '(j));'];    
         eval(t); 
     end
 end
 
  
for i= 1:g
     for j= 1:Gsl(i)
         t= ['syncgs(i,j)=(Gs_' int2str(i-1)  '(j));'];    
         eval(t); 
     end
 end
 
  
for i= 1:g
     for j= 1:Gdl(i)
         t= ['syncgd(i,j)=(Gd_' int2str(i-1)  '(j));'];    
         eval(t); 
     end
 end
 
 
 