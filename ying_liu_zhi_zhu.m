close all
clear all
clc

%% ����Ƶ��֡ת����ͼƬ
% v = VideoReader('Ӱ��֮����ԭ�棩.mp4');
% 
% i = 1;
% while hasFrame(v)
%     video = readFrame(v);
% %     imwrite(video,['.\result\',num2str(i),'.bmp']);
%     imwrite(video,['.\result\',num2str(i,'%03d'),'.bmp']);
% %     imwrite(video,'.\result\1.bmp');
% i = i+1;
% end


%% ��ʼ��ı��ݣ�
% % implay('Ӱ��֮����ԭ�棩.mp4')  % ͬʱ����ԭ��Ƶ��Ч����̫��

path = '.\result\';%ע���ļ���·����ѡȡ��ע����ļ�������Ҫ����ͼƬ���Է������ɶ���Ч��
dir1 = dir([path '*.bmp']);
for i = 1:length(dir1)
    disp(i);
    img = imread([path dir1(i).name]);
    img = rgb2gray(img);
    detection = edge(img,'canny');%���ӱ�Ե���,roberts,sobel,log�������ӵ�Ч��������canny
    
    set(gcf,'NumberTitle','off','Name','Ӱ��֮��');
    [x,y] = find(detection ==1);
    scatter(y,-x,'.');%���
    
    [m,n] = size(img);
    axis([0 n -m 0]); 
    axis equal
    pause(0.02);
end