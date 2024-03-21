% LFPpower_active=abs(WT(amplifier__data(:,2),600,1:40,'Gabor')); %   Extract LFP power within 1:40 Hz range (channel 1 or 2)
% LFPpower_passive=abs(WT(amplifier__data(:,1),600,1:40,'Gabor')); %   Extract LFP power within 1:40 Hz range (channel 1 or 2)


for i=1:40;
    LFPaveragepower_passive(i)=mean(LFPpower_passive(:,i)); %   Average LFP power within 1:40 Hz range
    LFPaveragepower_active(i)=mean(LFPpower_active(:,i)); %   Average LFP power within 1:40 Hz range

end


figure
plot(1:40,LFPaveragepower_passive)
figure
plot(1:40,LFPaveragepower_active,"r")  %  Plot mean power in a.u. within 1:40 Hz range, 
                                   % later normalized to a peak value of 20 a.u..
