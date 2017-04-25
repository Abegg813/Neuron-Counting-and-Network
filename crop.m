% trying to crop some images...
I = imread('treetest.jpg');
x = size(I,2);
y = size(I,1);
%%
% cropping
xsec = 3;
ysec = 7;
xsize = floor(x/xsec);
ysize = floor(y/ysec);
for j = 1:ysec
    if j == ysec % for the last horizonal section:
        for i = 1:xsec
            if i == xsec % for the last horizonal section:
                cropped = imcrop(I,[(i-1)*xsize+1,(j-1)*ysize+1,xsize+(x-(xsec*xsize))-1,ysize+(y-(ysec*ysize))-1]);
                imwrite(cropped,strcat('treetest_y',num2str(j),'_x',num2str(i),'.png'));
                break
                % the last section will be a few pixels larger because initailly, the sections
                % were created with floor division (rounded down) to avoid exceeding the image borders
            else
                cropped = imcrop(I,[(i-1)*xsize+1,(j-1)*ysize+1,xsize-1,ysize+(y-(ysec*ysize))-1]);
                imwrite(cropped,strcat('treetest_y',num2str(j),'_x',num2str(i),'.png'));
            end
        end
    else
        for i = 1:xsec
            if i == xsec % for the last horizonal section:
                cropped = imcrop(I,[(i-1)*xsize,(j-1)*ysize,xsize+(x-(xsec*xsize))-1,ysize]);
                imwrite(cropped,strcat('treetest_y',num2str(j),'_x',num2str(i),'.png'));
                break
                % the last section will be a few pixels larger because initailly, the sections
                % were created with floor division (rounded down) to avoid exceeding the image borders
            else
                cropped = imcrop(I,[(i-1)*xsize+1,(j-1)*ysize+1,xsize-1,ysize-1]);
                imwrite(cropped,strcat('treetest_y',num2str(j),'_x',num2str(i),'.png'));
            end
        end
    end
end