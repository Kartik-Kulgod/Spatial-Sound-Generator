%load a 44.1 kHz single channel sound sample
[x,Fs] = audioread('SoftGuitar-44p1_mono-10mins.ogg');
x = x(1000000:1700000);
cd IMreverbs\  
[h,Fs] = audioread('Large Long Echo Hall.wav'); 
%Impulse response must also have the same sampling rate
h_left = h(:,1);
h_right = h(:,2);
y_left = conv(x,h_left);%h_left can be directly replaced by h(:,1)
y_right = conv(x,h_right);%h_right can be directly replaced by h(:,2)
y = [y_left,y_right];
y = y/max(abs(y));
sound(y,Fs) %Enjoy!!