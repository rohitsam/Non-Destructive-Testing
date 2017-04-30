Fs = 80000;
rtime = 1;
samples = Fs*rtime;
bitdepth = 16;

steps = 1/(Fs*rtime);
time = [0:steps:rtime];
time1 = time(1:samples);
recObj = audiorecorder(Fs,bitdepth,1); 
disp('Start HITTING.')  
recordblocking(recObj,rtime);
disp('End TEST');
play(recObj);  
data = getaudiodata(recObj);
fouriert = abs(fft(data));
fouriert = fouriert(1:20000);
%signature = audioread('r&d.wav');
figure;
subplot(2,1,1);
plot(time1,data);
subplot(2,1,2);
plot(fouriert);
hold on;