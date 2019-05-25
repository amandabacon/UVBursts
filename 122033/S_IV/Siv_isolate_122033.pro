;+
;Name: Siv_isolate_122033.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/25
;USING THE S IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO S IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

PRO Siv_isolate_122033

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/iso_vars_122033.sav'
RESTORE, rfname

;load the data

IRast_122033_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_122033/iris_l2_20140215_122033_3800263296_raster_t000_r00000.fits'

SJI1400_122033_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_122033/iris_l2_20140215_122033_3800263296_SJI_1400_t000.fits'

;read the data

dataRast_122033_Siv = IRIS_OBJ(IRast_122033_Siv)

data1400_122033_Siv = IRIS_SJI(SJI1400_122033_Siv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_122033_Siv->SHOW_LINES
spectraRast1403_122033_Siv = dataRast_122033_Siv->GETVAR(3, /LOAD)

images1400_122033_Siv = data1400_122033_Siv->GETVAR()

;get spectral information

lambda1403_122033_Siv = dataRast_122033_Siv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_122033_Siv
pxlslitRast_122033_Siv = dataRast_122033_Siv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_122033_Siv

ResX1400_122033_Siv = data1400_122033_Siv->GETRESX()
ResY1400_122033_Siv = data1400_122033_Siv->GETRESY()

SolarX1400_122033_Siv = data1400_122033_Siv->XSCALE()
SolarY1400_122033_Siv = data1400_122033_Siv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_122033_Siv = dataRast_122033_Siv->GETEXP() ;two 0s exposures--30s
;PRINT, exp_arrRast_122033_Siv

;get every data point in each lambda, y-pos, and image

cube1403_122033_Siv = spectraRast1403_122033_Siv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_122033_Siv)

;count the number of images of original cube

array1403_122033_Siv = spectraRast1403_122033_Siv[0,0,*]

array1400_122033_Siv = images1400_122033_Siv[0,0,*]

nImages1403_122033_Siv = N_ELEMENTS(array1403_122033_Siv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_122033_Siv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_122033_Siv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_122033_Siv = N_ELEMENTS(spectraRast1403_122033_Siv[0,0,*]) ;400 images
;PRINT, n_img1403_122033_Siv
n_wav1403_122033_Siv = N_ELEMENTS(spectraRast1403_122033_Siv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_122033_Siv
n_ypos1403_122033_Siv = N_ELEMENTS(spectraRast1403_122033_Siv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_122033_Siv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only S IV line)

cut_122033_Siv = MEAN(MEAN(spectraRast1403_122033_Siv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_122033_Siv)

;PLOT, cut_122033_Siv

spectra1403_122033_Siv = cut_122033_Siv[210:320]

;PLOT, spectra1403_122033_Siv
;PLOT, lambda1403_122033_Siv[210:320], spectra1403_122033_Siv

nspectraRast1403_122033_Siv = spectraRast1403_122033_Siv[210:320,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_122033_Siv = N_ELEMENTS(nspectraRast1403_122033_Siv[*,0,0]) ;111
PRINT, n_wav_122033_Siv
n_ypos_122033_Siv = N_ELEMENTS(nspectraRast1403_122033_Siv[0,*,0]) ;1093
;PRINT, n_ypos_122033_Siv
n_img_122033_Siv = N_ELEMENTS(nspectraRast1403_122033_Siv[0,0,*]) ;400
;PRINT, n_img_122033_Siv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_122033_Siv-1 DO BEGIN
nspectraRast1403_122033_Siv[*,*,i] = nspectraRast1403_122033_Siv[*,*,i]/exp_arrRast_122033_Siv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_122033_Siv = MEAN(MEAN(nspectraRast1403_122033_Siv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_122033_Siv = MPFITPEAK(lambda1403_122033_Siv[210:320], avg_prof_122033_Siv, coeff_avg_Siv)

wave0_122033_Siv = coeff_avg_Siv[1] ;1406.3827
PRINT, wave0_122033_Siv

;********GUIDANCE FROM CHAD********
;Instead of assigning hard-coded
;window size info, assign to vars.
;Again, tranform from integer to
;decimal by using 'D'
wsx = 900D
wsy = 700D
;**********************************

WINDOW, XSIZE = wsx, YSIZE = wsy

;********GUIDANCE FROM CHAD********
;Aspect ratio (AR): ratio of w to h of img
;or screen.
;AR uses the number of pixels and resolution
;of the plot.
aspr = (ny*ResY1400_122033_Siv)/(nx*ResX1400_122033_Siv)
aspw = wsy/wsx

;Number of rows and columns on plotting window
;(want in decimal form).
nr = 1.0
nc = 1.0

;Choose x0 and calc. y0, dx, and dy using:
x0 = 0.2
y0 = 0.5*(1.0-((aspr/aspw)*(nr/nc)*(1.0-(2.0*x0))))
dx = (1.0/nc)*(1.0-(2.0*x0))
dy = (1.0/nr)*(1.0-(2.0*y0))

;Print values
;PRINT, aspr, aspw, x0, y0, dx, dy

;STOP
;**********************************

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_122033_Siv = N_ELEMENTS(nspectraRast1403_122033_Siv[0,0,*]) ;400
yposition_122033_Siv = N_ELEMENTS(nspectraRast1403_122033_Siv[0,*,0]) ;1093
;PRINT, yposition_122033_Siv

UVB_ind_ry_122033_Siv = ARRAY_INDICES([raster_122033_Siv,yposition_122033_Siv], UVB_ind_122033, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_122033_Siv) ;2D,2,963 where 2 is [raster,ypos]

UVB_ind_r_122033_Siv = REFORM(UVB_ind_ry_122033_Siv[0,*]) ;1D 963
UVB_ind_y_122033_Siv = REFORM(UVB_ind_ry_122033_Siv[1,*]) ;1D 963

;pull out all green rectangle UVB pop. indices

UVB_size_122033_Siv = N_ELEMENTS(UVB_ind_122033) ;963
UVB_ind_r_s_122033_Siv = N_ELEMENTS(UVB_ind_r_122033_Siv) ;963
UVB_ind_y_s_122033_Siv = N_ELEMENTS(UVB_ind_y_122033_Siv) ;963

;create array to hold coeff paramters from FOR loop

coeff_arr_122033_Siv = DBLARR(4,UVB_size_122033_Siv)

;FOR loop with cut array and coeff_arr_122033_Siv above

TIC
FOR i = 0, UVB_size_122033_Siv-1 DO BEGIN
	PLOT, lambda1403_122033_Siv[210:320], REFORM(nspectraRast1403_122033_Siv[*,UVB_ind_y_122033_Siv[i],UVB_ind_r_122033_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_122033_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_122033_Siv = MPFITPEAK(lambda1403_122033_Siv[210:320], REFORM(nspectraRast1403_122033_Siv[*,UVB_ind_y_122033_Siv[i],UVB_ind_r_122033_Siv[i]]), coeff_122033_Siv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_122033_Siv[210:320], YFIT_122033_Siv, COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_122033_Siv[*,i] = coeff_122033_Siv
ENDFOR
TOC ;Time elapsed: ~2.21 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/coeff_arr_122033_Siv.sav'
SAVE, coeff_122033_Siv, spectraRast1403_122033_Siv, nspectraRast1403_122033_Siv, coeff_arr_122033_Siv, wave0_122033_Siv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/coeff_arr_122033_Siv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 30.0
inst_unc_S_122033 = [ABS((REFORM(nspectraRast1403_122033_Siv[*,UVB_ind_y_122033_Siv,UVB_ind_r_122033_Siv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_122033_Siv

coeff_arr_122033_Siv2 = DBLARR(4,UVB_size_122033_Siv)
sigma_coeff_arr = DBLARR(4,UVB_size_122033_Siv)

PRINT, SIZE(inst_unc_S_122033) ;3D,111,963

TIC
FOR i = 0, UVB_size_122033_Siv-1 DO BEGIN
	PLOT, lambda1403_122033_Siv[210:320], REFORM(nspectraRast1403_122033_Siv[*,UVB_ind_y_122033_Siv[i],UVB_ind_r_122033_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_122033_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_122033_Siv2 = MPFITPEAK(lambda1403_122033_Siv[210:320], REFORM(nspectraRast1403_122033_Siv[*,UVB_ind_y_122033_Siv[i],UVB_ind_r_122033_Siv[i]]), coeff_122033_Siv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_S_122033[*,i,i], ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_122033_Siv[210:320], REFORM(YFIT_122033_Siv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_122033_Siv2[*,i] = coeff_122033_Siv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~9.51 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_122033_Siv2) ;2D,4,963

one = coeff_arr_122033_Siv2[1,*,*]
coeff_arr_122033_Siv2_clean = WHERE((one GT 1404.0) AND (one LT 1404.9), count, COMPLEMENT = non)

;get UVB indices for S IV

UVB_ind_Siv_122033 = UVB_ind_122033[coeff_arr_122033_Siv2_clean]
PRINT, UVB_ind_Siv_122033
PRINT, N_ELEMENTS(UVB_ind_Siv_122033) ;849

PRINT, SIZE(coeff_arr_122033_Siv2_clean) ;1D,849

zero = coeff_arr_122033_Siv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_122033_Siv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int_122033_Siv = zero[coeff_arr_122033_Siv2_clean]
sig_lw_122033_Siv = sig2[coeff_arr_122033_Siv2_clean]
lw_122033_Siv = two[coeff_arr_122033_Siv2_clean]
sig_p_int_122033_Siv = sig0[coeff_arr_122033_Siv2_clean]
;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (gamma_122033 & new_peak_min)

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/iso_vars_safe_122033.sav'
RESTORE, rfname2_limit;, /VERBOSE

limit_gamma_122033_Siv = gamma_122033
limit_wave0_122033_Siv = wave0_122033_Siv

limit_p_int_Siv = zero[coeff_arr_122033_Siv2_clean]
PRINT, "limit_p_int_Siv"
PRINT, N_ELEMENTS(limit_p_int_Siv) ;849
PRINT, limit_p_int_Siv

limit_sig_p_int_Siv = sig0[coeff_arr_122033_Siv2_clean]
PRINT, "limit_sig_p_int_Siv"
PRINT, N_ELEMENTS(limit_sig_p_int_Siv) ;849
PRINT, limit_sig_p_int_Siv

limit_lw_Siv = two[coeff_arr_122033_Siv2_clean]
PRINT, "limit_lw_Siv"
PRINT, N_ELEMENTS(limit_lw_Siv) ;849
PRINT, limit_lw_Siv

limit_sig_lw_Siv = sig2[coeff_arr_122033_Siv2_clean]
PRINT, "limit_sig_lw_Siv"
PRINT, N_ELEMENTS(limit_sig_lw_Siv) ;849
PRINT, limit_sig_lw_Siv

limit_vel_width_122033_Siv = (two[coeff_arr_122033_Siv2_clean]/limit_wave0_122033_Siv) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_122033_Siv"
PRINT, N_ELEMENTS(limit_vel_width_122033_Siv) ;849
PRINT, limit_vel_width_122033_Siv

limit_velocity_122033_Siv = ((one[coeff_arr_122033_Siv2_clean]-limit_wave0_122033_Siv)/limit_wave0_122033_Siv) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_122033_Siv"
PRINT, N_ELEMENTS(limit_velocity_122033_Siv) ;849
PRINT, limit_velocity_122033_Siv

;calculate total integrated intensity (TII)

It_S_122033 = (sqrt(2.0*!dpi)*p_int_122033_Siv*lw_122033_Siv) ;total integrated intensity 
PRINT, "It_S_122033"
PRINT, It_S_122033
PRINT, SIZE(It_S_122033) ;1D,849

;calculate integrated intensity uncertainty

int_int_unc_S_122033 = [2.0*!dpi*((p_int_122033_Siv)^2*(sig_lw_122033_Siv)^2+(lw_122033_Siv)^2*(sig_p_int_122033_Siv)^2)]^0.5
PRINT, "int_int_unc_S_122033"
PRINT, int_int_unc_S_122033
PRINT, SIZE(int_int_unc_S_122033) ;1D,849

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_S_122033 = (It_S_122033/int_int_unc_S_122033)
PRINT, SNR_0_S_122033

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_S_122033 = (((sig_p_int_122033_Siv)^2/(p_int_122033_Siv)^2)+((sig_lw_122033_Siv)^2/(lw_122033_Siv)^2))^neg
PRINT, SNR_S_122033

PRINT, SIZE(SNR_S_122033) ;849
SNR2_S_122033 = WHERE((SNR_S_122033 LT 10000), count) ;removes infinity
PRINT, SIZE(SNR_S_122033[SNR2_S_122033]) ;844

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_S_122033[SNR2_S_122033], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_122033"
OPLOT, HISTOGRAM(SNR_S_122033[SNR2_S_122033], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_S_122033[SNR2_S_122033], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_122033", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/histogram_122033.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/histogram_122033.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_S_122033[SNR2_S_122033], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_S_122033[SNR2_S_122033])
PRINT, 'MAX: ', MAX(SNR_S_122033[SNR2_S_122033])
PRINT, 'MODE: ', WHERE(SNR_S_122033[SNR2_S_122033] EQ MAX(SNR_S_122033[SNR2_S_122033]), count) + MIN(SNR_S_122033[SNR2_S_122033])
PRINT, 'MEDIAN: ', MEDIAN(SNR_S_122033[SNR2_S_122033])

MOM = MOMENT(SNR_S_122033[SNR2_S_122033])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/sigma_coeff_arr_122033_Siv.sav'
SAVE, coeff_122033_Siv2, inst_unc_S_122033, sigma_coeff, sigma_coeff_arr, coeff_arr_122033_Siv2, It_S_122033, int_int_unc_S_122033, SNR_0_S_122033, SNR_S_122033, SNR2_S_122033, limit_vel_width_122033_Siv, limit_velocity_122033_Siv, p_int_122033_Siv, sig_lw_122033_Siv, lw_122033_Siv, sig_p_int_122033_Siv, UVB_ind_Siv_122033, FILENAME = sfname2

OBJ_DESTROY, dataRast_122033_Siv
OBJ_DESTROY, data1400_122033_Siv

END
