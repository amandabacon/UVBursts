;+
;Name: Siv_isolate_163205.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/25
;USING THE S IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO S IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

PRO Siv_isolate_163205

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_163205.sav'
RESTORE, rfname

;load the data

IRast_163205_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_raster_t000_r00000.fits'

SJI1400_163205_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_SJI_1400_t000.fits'

;read the data

dataRast_163205_Siv = IRIS_OBJ(IRast_163205_Siv)

data1400_163205_Siv = IRIS_SJI(SJI1400_163205_Siv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_163205_Siv->SHOW_LINES
spectraRast1403_163205_Siv = dataRast_163205_Siv->GETVAR(3, /LOAD)

images1400_163205_Siv = data1400_163205_Siv->GETVAR()

;get spectral information

lambda1403_163205_Siv = dataRast_163205_Siv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_163205_Siv
pxlslitRast_163205_Siv = dataRast_163205_Siv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_163205_Siv

ResX1400_163205_Siv = data1400_163205_Siv->GETRESX()
ResY1400_163205_Siv = data1400_163205_Siv->GETRESY()

SolarX1400_163205_Siv = data1400_163205_Siv->XSCALE()
SolarY1400_163205_Siv = data1400_163205_Siv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_163205_Siv = dataRast_163205_Siv->GETEXP() ;one 0s exposures--8s
;PRINT, exp_arrRast_163205_Siv

;get every data point in each lambda, y-pos, and image

cube1403_163205_Siv = spectraRast1403_163205_Siv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_163205_Siv)

;count the number of images of original cube

array1403_163205_Siv = spectraRast1403_163205_Siv[0,0,*]

array1400_163205_Siv = images1400_163205_Siv[0,0,*]

nImages1403_163205_Siv = N_ELEMENTS(array1403_163205_Siv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_163205_Siv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_163205_Siv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_163205_Siv = N_ELEMENTS(spectraRast1403_163205_Siv[0,0,*]) ;400 images
;PRINT, n_img1403_163205_Siv
n_wav1403_163205_Siv = N_ELEMENTS(spectraRast1403_163205_Siv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_163205_Siv
n_ypos1403_163205_Siv = N_ELEMENTS(spectraRast1403_163205_Siv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_163205_Siv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only S IV line)

cut_163205_Siv = MEAN(MEAN(spectraRast1403_163205_Siv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_163205_Siv)

;PLOT, cut_163205_Siv

spectra1403_163205_Siv = cut_163205_Siv[215:320]

;PLOT, spectra1403_163205_Siv
;PLOT, lambda1403_163205_Siv[215:320], spectra1403_163205_Siv

nspectraRast1403_163205_Siv = spectraRast1403_163205_Siv[215:320,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_163205_Siv = N_ELEMENTS(nspectraRast1403_163205_Siv[*,0,0]) ;106
PRINT, n_wav_163205_Siv
n_ypos_163205_Siv = N_ELEMENTS(nspectraRast1403_163205_Siv[0,*,0]) ;1093
;PRINT, n_ypos_163205_Siv
n_img_163205_Siv = N_ELEMENTS(nspectraRast1403_163205_Siv[0,0,*]) ;400
;PRINT, n_img_163205_Siv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_163205_Siv-1 DO BEGIN
nspectraRast1403_163205_Siv[*,*,i] = nspectraRast1403_163205_Siv[*,*,i]/exp_arrRast_163205_Siv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_163205_Siv = MEAN(MEAN(nspectraRast1403_163205_Siv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_163205_Siv = MPFITPEAK(lambda1403_163205_Siv[215:320], avg_prof_163205_Siv, coeff_avg_Siv)

wave0_163205_Siv = coeff_avg_Siv[1] ;1406.3775
PRINT, wave0_163205_Siv

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
aspr = (ny*ResY1400_163205_Siv)/(nx*ResX1400_163205_Siv)
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

raster_163205_Siv = N_ELEMENTS(nspectraRast1403_163205_Siv[0,0,*]) ;400
yposition_163205_Siv = N_ELEMENTS(nspectraRast1403_163205_Siv[0,*,0]) ;1093
;PRINT, yposition_163205_Siv

UVB_ind_ry_163205_Siv = ARRAY_INDICES([raster_163205_Siv,yposition_163205_Siv], UVB_ind_163205, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_163205_Siv) ;2D,2,522 where 2 is [raster,ypos]

UVB_ind_r_163205_Siv = REFORM(UVB_ind_ry_163205_Siv[0,*]) ;1D 522
UVB_ind_y_163205_Siv = REFORM(UVB_ind_ry_163205_Siv[1,*]) ;1D 522

;pull out all green rectangle UVB pop. indices

UVB_size_163205_Siv = N_ELEMENTS(UVB_ind_163205) ;522
UVB_ind_r_s_163205_Siv = N_ELEMENTS(UVB_ind_r_163205_Siv) ;522
UVB_ind_y_s_163205_Siv = N_ELEMENTS(UVB_ind_y_163205_Siv) ;522

;create array to hold coeff paramters from FOR loop

coeff_arr_163205_Siv = DBLARR(4,UVB_size_163205_Siv)

;FOR loop with cut array and coeff_arr_163205_Siv above

TIC
FOR i = 0, UVB_size_163205_Siv-1 DO BEGIN
	PLOT, lambda1403_163205_Siv[215:320], REFORM(nspectraRast1403_163205_Siv[*,UVB_ind_y_163205_Siv[i],UVB_ind_r_163205_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_163205_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_163205_Siv = MPFITPEAK(lambda1403_163205_Siv[215:320], REFORM(nspectraRast1403_163205_Siv[*,UVB_ind_y_163205_Siv[i],UVB_ind_r_163205_Siv[i]]), coeff_163205_Siv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_163205_Siv[215:320], YFIT_163205_Siv, COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_163205_Siv[*,i] = coeff_163205_Siv
ENDFOR
TOC ;Time elapsed: ~6.27 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/coeff_arr_163205_Siv.sav'
SAVE, coeff_163205_Siv, spectraRast1403_163205_Siv, nspectraRast1403_163205_Siv, coeff_arr_163205_Siv, wave0_163205_Siv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/coeff_arr_163205_Siv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_S_163205 = [ABS((REFORM(nspectraRast1403_163205_Siv[*,UVB_ind_y_163205_Siv,UVB_ind_r_163205_Siv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_163205_Siv

coeff_arr_163205_Siv2 = DBLARR(4,UVB_size_163205_Siv)
sigma_coeff_arr = DBLARR(4,UVB_size_163205_Siv)

PRINT, SIZE(inst_unc_S_163205) ;3D,106,522

TIC
FOR i = 0, UVB_size_163205_Siv-1 DO BEGIN
	PLOT, lambda1403_163205_Siv[215:320], REFORM(nspectraRast1403_163205_Siv[*,UVB_ind_y_163205_Siv[i],UVB_ind_r_163205_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_163205_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_163205_Siv2 = MPFITPEAK(lambda1403_163205_Siv[215:320], REFORM(nspectraRast1403_163205_Siv[*,UVB_ind_y_163205_Siv[i],UVB_ind_r_163205_Siv[i]]), coeff_163205_Siv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_S_163205[*,i,i], ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_163205_Siv[215:320], REFORM(YFIT_163205_Siv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_163205_Siv2[*,i] = coeff_163205_Siv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~2.76 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_163205_Siv2) ;2D,4,522

one = coeff_arr_163205_Siv2[1,*,*]
coeff_arr_163205_Siv2_clean = WHERE((one GT 1404.0) AND (one LT 1404.9), count, COMPLEMENT = non)

;get UVB indices for S IV

UVB_ind_Siv_163205 = UVB_ind_163205[coeff_arr_163205_Siv2_clean]
PRINT, UVB_ind_Siv_163205
PRINT, N_ELEMENTS(UVB_ind_Siv_163205) ;411

PRINT, SIZE(coeff_arr_163205_Siv2_clean) ;1D,411

zero = coeff_arr_163205_Siv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_163205_Siv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int_163205_Siv = zero[coeff_arr_163205_Siv2_clean]
sig_lw_163205_Siv = sig2[coeff_arr_163205_Siv2_clean]
lw_163205_Siv = two[coeff_arr_163205_Siv2_clean]
sig_p_int_163205_Siv = sig0[coeff_arr_163205_Siv2_clean]
;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (gamma_163205 & new_peak_min)

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_safe_163205.sav'
RESTORE, rfname2_limit;, /VERBOSE

limit_gamma_163205_Siv = gamma_163205
limit_wave0_163205_Siv = wave0_163205_Siv

limit_p_int_Siv = zero[coeff_arr_163205_Siv2_clean]
PRINT, "limit_p_int_Siv"
PRINT, N_ELEMENTS(limit_p_int_Siv) ;411
PRINT, limit_p_int_Siv

limit_sig_p_int_Siv = sig0[coeff_arr_163205_Siv2_clean]
PRINT, "limit_sig_p_int_Siv"
PRINT, N_ELEMENTS(limit_sig_p_int_Siv) ;411
PRINT, limit_sig_p_int_Siv

limit_lw_Siv = two[coeff_arr_163205_Siv2_clean]
PRINT, "limit_lw_Siv"
PRINT, N_ELEMENTS(limit_lw_Siv) ;411
PRINT, limit_lw_Siv

limit_sig_lw_Siv = sig2[coeff_arr_163205_Siv2_clean]
PRINT, "limit_sig_lw_Siv"
PRINT, N_ELEMENTS(limit_sig_lw_Siv) ;411
PRINT, limit_sig_lw_Siv

limit_vel_width_163205_Siv = (two[coeff_arr_163205_Siv2_clean]/limit_wave0_163205_Siv) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_163205_Siv"
PRINT, N_ELEMENTS(limit_vel_width_163205_Siv) ;411
PRINT, limit_vel_width_163205_Siv

limit_velocity_163205_Siv = ((one[coeff_arr_163205_Siv2_clean]-limit_wave0_163205_Siv)/limit_wave0_163205_Siv) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_163205_Siv"
PRINT, N_ELEMENTS(limit_velocity_163205_Siv) ;411
PRINT, limit_velocity_163205_Siv

;calculate total integrated intensity (TII)

It_S_163205 = (sqrt(2.0*!dpi)*p_int_163205_Siv*lw_163205_Siv) ;total integrated intensity 
PRINT, "It_S_163205"
PRINT, It_S_163205
PRINT, SIZE(It_S_163205) ;1D,411

;calculate integrated intensity uncertainty

int_int_unc_S_163205 = [2.0*!dpi*((p_int_163205_Siv)^2*(sig_lw_163205_Siv)^2+(lw_163205_Siv)^2*(sig_p_int_163205_Siv)^2)]^0.5
PRINT, "int_int_unc_S_163205"
PRINT, int_int_unc_S_163205
PRINT, SIZE(int_int_unc_S_163205) ;1D,411

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_S_163205 = (It_S_163205/int_int_unc_S_163205)
PRINT, SNR_0_S_163205

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_S_163205 = (((sig_p_int_163205_Siv)^2/(p_int_163205_Siv)^2)+((sig_lw_163205_Siv)^2/(lw_163205_Siv)^2))^neg
PRINT, SNR_S_163205

PRINT, SIZE(SNR_S_163205) ;411
SNR2_S_163205 = WHERE((SNR_S_163205 LT 10000), count) ;removes infinity
PRINT, SIZE(SNR_S_163205[SNR2_S_163205]) ;408

SNR_IN = WHERE((SNR_S_163205 GT 100), count)
PRINT, SIZE(SNR_S_163205[SNR_IN])

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_S_163205[SNR2_S_163205], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_163205"
OPLOT, HISTOGRAM(SNR_S_163205[SNR2_S_163205], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_S_163205[SNR2_S_163205], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_163205", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/histogram_163205.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/histogram_163205.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_S_163205[SNR2_S_163205], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_S_163205[SNR2_S_163205])
PRINT, 'MAX: ', MAX(SNR_S_163205[SNR2_S_163205])
PRINT, 'MODE: ', WHERE(SNR_S_163205[SNR2_S_163205] EQ MAX(SNR_S_163205[SNR2_S_163205]), count) + MIN(SNR_S_163205[SNR2_S_163205])
PRINT, 'MEDIAN: ', MEDIAN(SNR_S_163205[SNR2_S_163205])

MOM = MOMENT(SNR_S_163205[SNR2_S_163205])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/sigma_coeff_arr_163205_Siv.sav'
SAVE, coeff_163205_Siv2, inst_unc_S_163205, sigma_coeff, sigma_coeff_arr, coeff_arr_163205_Siv2, It_S_163205, int_int_unc_S_163205, SNR_0_S_163205, SNR_S_163205, SNR2_S_163205, limit_vel_width_163205_Siv, limit_velocity_163205_Siv, p_int_163205_Siv, sig_lw_163205_Siv, lw_163205_Siv, sig_p_int_163205_Siv, UVB_ind_Siv_163205, FILENAME = sfname2

OBJ_DESTROY, dataRast_163205_Siv
OBJ_DESTROY, data1400_163205_Siv

END
