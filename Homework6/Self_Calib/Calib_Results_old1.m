% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3172.181449263937793 ; 3182.097435466794195 ];

%-- Principal point:
cc = [ 1945.545287024375284 ; 1562.857230904406151 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.296012685362280 ; -0.647423340390413 ; 0.006434180606379 ; -0.007329504019910 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 14.110609816960306 ; 14.249322403186227 ];

%-- Principal point uncertainty:
cc_error = [ 12.608679030422559 ; 10.701584730126234 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.013162463384450 ; 0.041981082146776 ; 0.001472206890859 ; 0.001371300120321 ; 0.000000000000000 ];

%-- Image size:
nx = 4032;
ny = 3024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 5;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -3.099265e+00 ; 8.672123e-03 ; 1.911856e-02 ];
Tc_1  = [ -1.237685e+02 ; 1.126762e+02 ; 4.165057e+02 ];
omc_error_1 = [ 3.961579e-03 ; 8.187595e-04 ; 5.770698e-03 ];
Tc_error_1  = [ 1.637930e+00 ; 1.401440e+00 ; 1.787546e+00 ];

%-- Image #2:
omc_2 = [ -2.564857e+00 ; -9.854163e-01 ; 7.182701e-01 ];
Tc_2  = [ -1.355311e+02 ; -2.750647e+01 ; 5.048967e+02 ];
omc_error_2 = [ 3.642038e-03 ; 1.529680e-03 ; 5.166915e-03 ];
Tc_error_2  = [ 1.933173e+00 ; 1.657599e+00 ; 2.163405e+00 ];

%-- Image #3:
omc_3 = [ -1.922749e-01 ; -2.362970e+00 ; 4.495216e-01 ];
Tc_3  = [ 1.211801e-01 ; -1.334649e+02 ; 3.096352e+02 ];
omc_error_3 = [ 2.360818e-03 ; 3.993300e-03 ; 4.165915e-03 ];
Tc_error_3  = [ 1.250991e+00 ; 1.017478e+00 ; 1.317401e+00 ];

%-- Image #4:
omc_4 = [ 7.070688e-02 ; -2.691150e+00 ; -5.200439e-01 ];
Tc_4  = [ 9.859290e+01 ; -8.004551e+01 ; 2.375451e+02 ];
omc_error_4 = [ 1.588052e-03 ; 3.495431e-03 ; 4.517995e-03 ];
Tc_error_4  = [ 9.905513e-01 ; 8.345297e-01 ; 1.200845e+00 ];

%-- Image #5:
omc_5 = [ -7.499521e-02 ; -2.327890e+00 ; 4.336278e-02 ];
Tc_5  = [ -4.196620e+01 ; -1.117876e+02 ; 2.623162e+02 ];
omc_error_5 = [ 2.325472e-03 ; 4.187694e-03 ; 4.069888e-03 ];
Tc_error_5  = [ 1.031620e+00 ; 8.631067e-01 ; 1.287715e+00 ];

