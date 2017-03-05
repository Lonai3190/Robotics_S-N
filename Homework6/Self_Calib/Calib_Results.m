% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3170.749029948009593 ; 3180.651064710907576 ];

%-- Principal point:
cc = [ 1947.269457167586552 ; 1562.650762640957055 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.298682206372077 ; -0.653179689032224 ; 0.006494606491286 ; -0.007295585330810 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 2.991816017366869 ; 3.021074290753300 ];

%-- Principal point uncertainty:
cc_error = [ 2.667031037786646 ; 2.259519340973244 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002793608507500 ; 0.008918252970951 ; 0.000311569444089 ; 0.000291185438543 ; 0.000000000000000 ];

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
omc_1 = [ -3.099019e+00 ; 8.548356e-03 ; 1.905781e-02 ];
Tc_1  = [ -1.239980e+02 ; 1.126871e+02 ; 4.164462e+02 ];
omc_error_1 = [ 8.388418e-04 ; 1.737392e-04 ; 1.223483e-03 ];
Tc_error_1  = [ 3.465239e-01 ; 2.959612e-01 ; 3.790068e-01 ];

%-- Image #2:
omc_2 = [ -2.565180e+00 ; -9.854959e-01 ; 7.176261e-01 ];
Tc_2  = [ -1.357942e+02 ; -2.747347e+01 ; 5.047309e+02 ];
omc_error_2 = [ 7.701781e-04 ; 3.238092e-04 ; 1.093251e-03 ];
Tc_error_2  = [ 4.088317e-01 ; 3.499821e-01 ; 4.586048e-01 ];

%-- Image #3:
omc_3 = [ -1.925191e-01 ; -2.363371e+00 ; 4.493682e-01 ];
Tc_3  = [ -6.584420e-02 ; -1.334619e+02 ; 3.096048e+02 ];
omc_error_3 = [ 4.992398e-04 ; 8.451959e-04 ; 8.808835e-04 ];
Tc_error_3  = [ 2.646944e-01 ; 2.148676e-01 ; 2.793028e-01 ];

%-- Image #4:
omc_4 = [ 7.081381e-02 ; -2.691475e+00 ; -5.199949e-01 ];
Tc_4  = [ 9.845464e+01 ; -8.003344e+01 ; 2.375045e+02 ];
omc_error_4 = [ 3.359881e-04 ; 7.397471e-04 ; 9.557294e-04 ];
Tc_error_4  = [ 2.095764e-01 ; 1.761911e-01 ; 2.547773e-01 ];

%-- Image #5:
omc_5 = [ -7.498753e-02 ; -2.328286e+00 ; 4.333572e-02 ];
Tc_5  = [ -4.210939e+01 ; -1.117716e+02 ; 2.622669e+02 ];
omc_error_5 = [ 4.914468e-04 ; 8.865332e-04 ; 8.608911e-04 ];
Tc_error_5  = [ 2.182333e-01 ; 1.822434e-01 ; 2.729950e-01 ];

