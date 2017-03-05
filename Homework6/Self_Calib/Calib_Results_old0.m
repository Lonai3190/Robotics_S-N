% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3153.567132216491245 ; 3160.563108274379829 ];

%-- Principal point:
cc = [ 1934.933101056325540 ; 1554.987828771196746 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.294887131743944 ; -0.638661949011380 ; 0.005328064577387 ; -0.011097964672385 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 19.862215327828043 ; 19.971373455471078 ];

%-- Principal point uncertainty:
cc_error = [ 17.483817948589756 ; 15.198889796705574 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.018539254242632 ; 0.058342578773885 ; 0.002074828706859 ; 0.001889267521745 ; 0.000000000000000 ];

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
omc_1 = [ -3.102412e+00 ; 8.750234e-03 ; 3.198811e-02 ];
Tc_1  = [ -1.223263e+02 ; 1.136940e+02 ; 4.145996e+02 ];
omc_error_1 = [ 5.565663e-03 ; 1.154912e-03 ; 8.110108e-03 ];
Tc_error_1  = [ 2.269178e+00 ; 1.992602e+00 ; 2.492304e+00 ];

%-- Image #2:
omc_2 = [ -2.565051e+00 ; -9.845765e-01 ; 7.250253e-01 ];
Tc_2  = [ -1.338042e+02 ; -2.628607e+01 ; 5.027197e+02 ];
omc_error_2 = [ 5.095490e-03 ; 2.172080e-03 ; 7.208842e-03 ];
Tc_error_2  = [ 2.681471e+00 ; 2.355480e+00 ; 3.013891e+00 ];

%-- Image #3:
omc_3 = [ -1.937788e-01 ; -2.357968e+00 ; 4.498787e-01 ];
Tc_3  = [ 8.348480e-01 ; -1.328389e+02 ; 3.079161e+02 ];
omc_error_3 = [ 3.352047e-03 ; 5.534007e-03 ; 5.799306e-03 ];
Tc_error_3  = [ 1.732148e+00 ; 1.442818e+00 ; 1.846007e+00 ];

%-- Image #4:
omc_4 = [ 6.940139e-02 ; -2.688606e+00 ; -5.125751e-01 ];
Tc_4  = [ 9.948650e+01 ; -7.955035e+01 ; 2.356407e+02 ];
omc_error_4 = [ 2.230210e-03 ; 4.855881e-03 ; 6.333585e-03 ];
Tc_error_4  = [ 1.371285e+00 ; 1.191567e+00 ; 1.672678e+00 ];

%-- Image #5:
omc_5 = [ -7.769163e-02 ; -2.324955e+00 ; 4.510684e-02 ];
Tc_5  = [ -4.125476e+01 ; -1.111335e+02 ; 2.610961e+02 ];
omc_error_5 = [ 3.318838e-03 ; 5.810038e-03 ; 5.664219e-03 ];
Tc_error_5  = [ 1.427555e+00 ; 1.227237e+00 ; 1.798167e+00 ];

