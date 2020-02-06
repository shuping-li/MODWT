clc;clear all;close all;

s=xlsread('黄坡水站数据_extrapolated(2h)','period');
rs3=zeros(size(s));rd1=zeros(size(s));rd2=zeros(size(s));rd3=zeros(size(s));
for i=3:size(s,2)   %omit columns of rank and date
    ss=s(:,i);
    w=ndwt(ss,3,'sym8');
    s3=indwt(w,'a',3);rs3(:,i)=s3;
    d1=indwt(w,'d',1);rd1(:,i)=d1;
    d2=indwt(w,'d',2);rd2(:,i)=d2;
    d3=indwt(w,'d',3);rd3(:,i)=d3;
    if i==3
        figure(3)
        subplot(511);plot(ss);ylabel('原始数据');
        subplot(512);plot(s3);ylabel('S3');
        subplot(513);plot(d1);ylabel('D1');
        subplot(514);plot(d2);ylabel('D2');
        subplot(515);plot(d3);ylabel('D3');
    end    
end
 xlswrite('黄坡水站数据_extrapolated(2h)', rs3,'s3');  
 xlswrite('黄坡水站数据_extrapolated(2h)', rd1,'d1'); 
 xlswrite('黄坡水站数据_extrapolated(2h)', rd2,'d2');  
 xlswrite('黄坡水站数据_extrapolated(2h)', rd3,'d3');