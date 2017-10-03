clear all

JpegFilesDirPath = '/Users/ronan/Desktop/head/';
ImgList = dir([JpegFilesDirPath '*.jpg']);
AviFilePath= '/Users/ronan/Desktop/head/Movie';

AviFileObj = VideoWriter(AviFilePath);
AviFileObj.FrameRate = 25;
% AviFileObj.Quality = 100;

% Open file
open(AviFileObj);

ConvertFrameNum = length(ImgList);

tic;
for k = 1 : ConvertFrameNum
	JpegImg = imread([JpegFilesDirPath ImgList(k).name]);
	Mov = im2frame(JpegImg);
    if rem(k, 25) == 0
        disp([num2str(k) ' frames processed...'])
    end
	writeVideo(AviFileObj, Mov);
end;
toc;

% Close file
close(AviFileObj);

% export video into local file
% v = VideoWriter('newfile1.avi');
% v.FrameRate = 1.5/step*vid.FrameRate;
% open(v);
% writeVideo(v, F);
% close(v);