%
%Copyright 2013 Gabriel Rodríguez Rodríguez.
%
%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.
%
%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
%GNU General Public License for more details.
%
%You should have received a copy of the GNU General Public License
%along with this program. If not, see <http://www.gnu.org/licenses/>.

function [ output_args ] = createVideo( images, fps )
%CREATEVIDEO Summary of this function goes here
%   Detailed explanation goes here

n = size(images,1);

[FileName,PathName,FilterIndex] = uiputfile('*.avi','Choose name for the time-lapse video','*.avi')

videoFile = fullfile(PathName,FileName);

outputVideo = VideoWriter(videoFile);
outputVideo.FrameRate=fps
outputVideo.open;

h = waitbar(0,'Creating video from pictures');
for i=1:n
   I = imread(images(i,:));
   outputVideo.writeVideo(I);
   %clear I
   waitbar(i/n)
end

outputVideo.close;
close(h)

end

