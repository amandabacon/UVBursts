;+
;Name: Siv_isolate_215426.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/25
;USING THE S IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO S IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

;PRO Siv_isolate_215426

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/iso_vars_215426.sav'
RESTORE, rfname

;load the data

IRast_215426_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_215426/iris_l2_20140216_215426_3800258296_raster_t000_r00000.fits'

SJI1400_215426_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_215426/iris_l2_20140216_215426_3800258296_SJI_1400_t000.fits'

;read the data

dataRast_215426_Siv = IRIS_OBJ(IRast_215426_Siv)

data1400_215426_Siv = IRIS_SJI(SJI1400_215426_Siv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_215426_Siv->SHOW_LINES
spectraRast1403_215426_Siv = dataRast_215426_Siv->GETVAR(3, /LOAD)

images1400_215426_Siv = data1400_215426_Siv->GETVAR()

;get spectral information

lambda1403_215426_Siv = dataRast_215426_Siv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_215426_Siv
pxlslitRast_215426_Siv = dataRast_215426_Siv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_215426_Siv

ResX1400_215426_Siv = data1400_215426_Siv->GETRESX()
ResY1400_215426_Siv = data1400_215426_Siv->GETRESY()

SolarX1400_215426_Siv = data1400_215426_Siv->XSCALE()
SolarY1400_215426_Siv = data1400_215426_Siv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_215426_Siv = dataRast_215426_Siv->GETEXP() ;one 0s exposures--8s
;PRINT, exp_arrRast_215426_Siv

;get every data point in each lambda, y-pos, and image

cube1403_215426_Siv = spectraRast1403_215426_Siv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_215426_Siv)

;count the number of images of original cube

array1403_215426_Siv = spectraRast1403_215426_Siv[0,0,*]

array1400_215426_Siv = images1400_215426_Siv[0,0,*]

nImages1403_215426_Siv = N_ELEMENTS(array1403_215426_Siv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_215426_Siv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_215426_Siv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_215426_Siv = N_ELEMENTS(spectraRast1403_215426_Siv[0,0,*]) ;400 images
;PRINT, n_img1403_215426_Siv
n_wav1403_215426_Siv = N_ELEMENTS(spectraRast1403_215426_Siv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_215426_Siv
n_ypos1403_215426_Siv = N_ELEMENTS(spectraRast1403_215426_Siv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_215426_Siv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only S IV line)

cut_215426_Siv = MEAN(MEAN(spectraRast1403_215426_Siv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_215426_Siv)

;PLOT, cut_215426_Siv

spectra1403_215426_Siv = cut_215426_Siv[210:320]

;PLOT, spectra1403_215426_Siv
;PLOT, lambda1403_215426_Siv[210:320], spectra1403_215426_Siv

nspectraRast1403_215426_Siv = spectraRast1403_215426_Siv[210:320,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_215426_Siv = N_ELEMENTS(nspectraRast1403_215426_Siv[*,0,0]) ;111
PRINT, n_wav_215426_Siv
n_ypos_215426_Siv = N_ELEMENTS(nspectraRast1403_215426_Siv[0,*,0]) ;1093
;PRINT, n_ypos_215426_Siv
n_img_215426_Siv = N_ELEMENTS(nspectraRast1403_215426_Siv[0,0,*]) ;400
;PRINT, n_img_215426_Siv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_215426_Siv-1 DO BEGIN
nspectraRast1403_215426_Siv[*,*,i] = nspectraRast1403_215426_Siv[*,*,i]/exp_arrRast_215426_Siv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_215426_Siv = MEAN(MEAN(nspectraRast1403_215426_Siv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_215426_Siv = MPFITPEAK(lambda1403_215426_Siv[210:320], avg_prof_215426_Siv, coeff_avg_Siv)

wave0_215426_Siv = coeff_avg_Siv[1] ;1406.3766
PRINT, wave0_215426_Siv

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
aspr = (ny*ResY1400_215426_Siv)/(nx*ResX1400_215426_Siv)
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

raster_215426_Siv = N_ELEMENTS(nspectraRast1403_215426_Siv[0,0,*]) ;400
yposition_215426_Siv = N_ELEMENTS(nspectraRast1403_215426_Siv[0,*,0]) ;1093
;PRINT, yposition_215426_Siv

UVB_ind_ry_215426_Siv = ARRAY_INDICES([raster_215426_Siv,yposition_215426_Siv], UVB_ind_215426, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_215426_Siv) ;2D,2,196 where 2 is [raster,ypos]

UVB_ind_r_215426_Siv = REFORM(UVB_ind_ry_215426_Siv[0,*]) ;1D 196
UVB_ind_y_215426_Siv = REFORM(UVB_ind_ry_215426_Siv[1,*]) ;1D 196

;pull out all green rectangle UVB pop. indices

UVB_size_215426_Siv = N_ELEMENTS(UVB_ind_215426) ;196
UVB_ind_r_s_215426_Siv = N_ELEMENTS(UVB_ind_r_215426_Siv) ;196
UVB_ind_y_s_215426_Siv = N_ELEMENTS(UVB_ind_y_215426_Siv) ;196

;create array to hold coeff paramters from FOR loop

coeff_arr_215426_Siv = DBLARR(4,UVB_size_215426_Siv)

;FOR loop with cut array and coeff_arr_215426_Siv above

TIC
FOR i = 0, UVB_size_215426_Siv-1 DO BEGIN
	PLOT, lambda1403_215426_Siv[210:320], REFORM(nspectraRast1403_215426_Siv[*,UVB_ind_y_215426_Siv[i],UVB_ind_r_215426_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_215426_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_215426_Siv = MPFITPEAK(lambda1403_215426_Siv[210:320], REFORM(nspectraRast1403_215426_Siv[*,UVB_ind_y_215426_Siv[i],UVB_ind_r_215426_Siv[i]]), coeff_215426_Siv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_215426_Siv[210:320], YFIT_215426_Siv, COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_215426_Siv[*,i] = coeff_215426_Siv
ENDFOR
TOC ;Time elapsed: ~2.21 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/coeff_arr_215426_Siv.sav'
SAVE, coeff_215426_Siv, spectraRast1403_215426_Siv, nspectraRast1403_215426_Siv, coeff_arr_215426_Siv, wave0_215426_Siv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/coeff_arr_215426_Siv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_S_215426 = [ABS((REFORM(nspectraRast1403_215426_Siv[*,UVB_ind_y_215426_Siv,UVB_ind_r_215426_Siv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_215426_Siv

coeff_arr_215426_Siv2 = DBLARR(4,UVB_size_215426_Siv)
sigma_coeff_arr = DBLARR(4,UVB_size_215426_Siv)

PRINT, SIZE(inst_unc_S_215426) ;3D,111,1235

TIC
FOR i = 0, UVB_size_215426_Siv-1 DO BEGIN
	PLOT, lambda1403_215426_Siv[210:320], REFORM(nspectraRast1403_215426_Siv[*,UVB_ind_y_215426_Siv[i],UVB_ind_r_215426_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_215426_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_215426_Siv2 = MPFITPEAK(lambda1403_215426_Siv[210:320], REFORM(nspectraRast1403_215426_Siv[*,UVB_ind_y_215426_Siv[i],UVB_ind_r_215426_Siv[i]]), coeff_215426_Siv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_S_215426[*,i,i], ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_215426_Siv[210:320], REFORM(YFIT_215426_Siv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_215426_Siv2[*,i] = coeff_215426_Siv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~2.16 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_215426_Siv2) ;2D,4,196

one = coeff_arr_215426_Siv2[1,*,*]
coeff_arr_215426_Siv2_clean = WHERE((one GT 1404.0) AND (one LT 1404.9), count, COMPLEMENT = non)

PRINT, SIZE(coeff_arr_215426_Siv2_clean) ;1D,158

zero = coeff_arr_215426_Siv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_215426_Siv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int = zero[coeff_arr_215426_Siv2_clean]
sig_lw = sig2[coeff_arr_215426_Siv2_clean]
lw = two[coeff_arr_215426_Siv2_clean]
sig_p_int = sig0[coeff_arr_215426_Siv2_clean]
;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (gamma_215426 & new_peak_min)

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/iso_vars_safe_215426.sav'
RESTORE, rfname2_limit;, /VERBOSE

limit_gamma_215426_Siv = gamma_215426
limit_wave0_215426_Siv = wave0_215426_Siv

limit_p_int_Siv = zero[coeff_arr_215426_Siv2_clean]
PRINT, "limit_p_int_Siv"
PRINT, N_ELEMENTS(limit_p_int_Siv) ;158
PRINT, limit_p_int_Siv

limit_sig_p_int_Siv = sig0[coeff_arr_215426_Siv2_clean]
PRINT, "limit_sig_p_int_Siv"
PRINT, N_ELEMENTS(limit_sig_p_int_Siv) ;158
PRINT, limit_sig_p_int_Siv

limit_lw_Siv = two[coeff_arr_215426_Siv2_clean]
PRINT, "limit_lw_Siv"
PRINT, N_ELEMENTS(limit_lw_Siv) ;158
PRINT, limit_lw_Siv

limit_sig_lw_Siv = sig2[coeff_arr_215426_Siv2_clean]
PRINT, "limit_sig_lw_Siv"
PRINT, N_ELEMENTS(limit_sig_lw_Siv) ;158
PRINT, limit_sig_lw_Siv

limit_vel_width_215426_Siv = (two[coeff_arr_215426_Siv2_clean]/limit_wave0_215426_Siv) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_215426_Siv"
PRINT, N_ELEMENTS(limit_vel_width_215426_Siv) ;158
PRINT, limit_vel_width_215426_Siv

limit_velocity_215426_Siv = ((one[coeff_arr_215426_Siv2_clean]-limit_wave0_215426_Siv)/limit_wave0_215426_Siv) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_215426_Siv"
PRINT, N_ELEMENTS(limit_velocity_215426_Siv) ;158
PRINT, limit_velocity_215426_Siv

;calculate total integrated intensity (TII)

It_S_215426 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, "It_S_215426"
PRINT, It_S_215426
PRINT, SIZE(It_S_215426) ;1D,158

;calculate integrated intensity uncertainty

int_int_unc_S_215426 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, "int_int_unc_S_215426"
PRINT, int_int_unc_S_215426
PRINT, SIZE(int_int_unc_S_215426) ;1D,158

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_S_215426 = (It_S_215426/int_int_unc_S_215426)
PRINT, SNR_0_S_215426

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_S_215426 = (((sig_p_int)^2/(p_int)^2)+((sig_lw)^2/(lw)^2))^neg
PRINT, SNR_S_215426

PRINT, SIZE(SNR_S_215426) ;158
SNR2_S_215426 = WHERE((SNR_S_215426 LT 100), count) ;removes infinity
PRINT, SIZE(SNR_S_215426[SNR2_S_215426]) ;157

SNR_IN = WHERE((SNR_S_215426 GT 100), count)
PRINT, SIZE(SNR_S_215426[SNR_IN])

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_S_215426[SNR2_S_215426], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_215426"
OPLOT, HISTOGRAM(SNR_S_215426[SNR2_S_215426], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_S_215426[SNR2_S_215426], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_215426", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/histogram_215426.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/histogram_215426.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_S_215426[SNR2_S_215426], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_S_215426[SNR2_S_215426])
PRINT, 'MAX: ', MAX(SNR_S_215426[SNR2_S_215426])
PRINT, 'MODE: ', WHERE(SNR_S_215426[SNR2_S_215426] EQ MAX(SNR_S_215426[SNR2_S_215426]), count) + MIN(SNR_S_215426[SNR2_S_215426])
PRINT, 'MEDIAN: ', MEDIAN(SNR_S_215426[SNR2_S_215426])

MOM = MOMENT(SNR_S_215426[SNR2_S_215426])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/sigma_coeff_arr_215426_Siv.sav'
SAVE, coeff_215426_Siv2, inst_unc_S_215426, sigma_coeff, sigma_coeff_arr, coeff_arr_215426_Siv2, It_S_215426, int_int_unc_S_215426, SNR_0_S_215426, SNR_S_215426, SNR2_S_215426, limit_vel_width_215426_Siv, limit_velocity_215426_Siv, p_int, sig_lw, lw, sig_p_int, FILENAME = sfname2

OBJ_DESTROY, dataRast_215426_Siv
OBJ_DESTROY, data1400_215426_Siv

END
