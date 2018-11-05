%% ----------Initialization------------


load('Label.mat'); %Load labels of test set as teCatAll. Make sure Label.mat matches the label of your test set



te_n_I = size(teCatAll,1);
te_n_T = size(teCatAll,1);
teImgCat = teCatAll;
teTxtCat = teCatAll;

%% -------------------Search Task Definition(Wikipedia)-----------------------
I_te = importdata('img_prob/feature.txt'); %Load Img shared representation
T_te = importdata('txt_prob/feature.txt'); %Load Txt shared representation




disp('Test');
D = pdist2(I_te, T_te, 'cosine');
Z = -D;

% %Image->Text
QryonTestBi(Z, teImgCat, teTxtCat);
% %Text->Image
QryonTestBi(Z', teTxtCat, teImgCat);


