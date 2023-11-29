fulldata=load('fulldata.txt'); %% Importing data

clear data1;
data1=[];
ch=60;
ch2=130;
for i=1:645:50000
      data1=[data1 transpose(fulldata(i+ch:i+ch2))];
end

clear data2;
data2=[];
ch=215;
ch2=285;
for i=1:645:50000
      data2=[data2 transpose(fulldata(i+ch:i+ch2))];
end


clear data3;
data3=[];
ch=380;
ch2=450;
for i=1:645:50000
      data3=[data3 transpose(fulldata(i+ch:i+ch2))];
      
end

clear data4;
data4=[];
ch=540;
ch2=610;
for i=1:645:50000
      data4=[data4 transpose(fulldata(i+ch:i+ch2))];
end

downsampled=[]; 
downsampled2=[];
downsampled3=[];
downsampled4=[];

for i=1:79 % Taking a single point from each multiplexed dataset
downsampled =[downsampled mean(data1(70*(i-1)+1:i*70))]; 
downsampled2 =[downsampled2 mean(data2(70*(i-1)+1:i*70))];
downsampled3 =[downsampled3 mean(data3(70*(i-1)+1:i*70))];
downsampled4 =[downsampled4 mean(data4(70*(i-1)+1:i*70))];
end