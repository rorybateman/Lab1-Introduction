
load clown.mat
imgdata = clown;
imshow(imgdata)

%y = Rotate_for(imgdata,0.8);
%imshow(y)
In = imgdata;
th = 0.8;

% defining the size of the matrix
[rows, cols] = size(In);
% defining the centre point of the matrix
Yc = rows/2;
Xc = cols/2;
% defining the difference between the target and the centre position
Ys = 1;
Xs = 1;
Dy = Ys - Yc;
Dx = Xs - Xc;
delta = [Dx;Dy];
% defining the transision matrix
trig = [cos(th) sin(th); -sin(th) cos(th)];
% defining the centre matrix
cent = [Xc;Yc];
% creating th empty frame
empt_frame = zeros(200,320);
i = 1;
x = 1;
for i = 1:rows
    for x = 1:cols
        Ys = i;
        Xs = x;
        Dy = Ys - Yc;
        Dx = Xs - Xc;
        delta = [Dx;Dy];
        pixel = round(trig*delta + cent);
        if pixel(1,1)*pixel(2,1) <= 0
            empt_frame(i,x) = 0;
        else
            empt_frame(i,x) = In(pixel);
        end
    end
end






