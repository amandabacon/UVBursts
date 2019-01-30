;+
;Name: Siv_isolate_114951.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/25
;USING THE S IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO S IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

;PRO Siv_isolate_114951

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
RESTORE, rfname

;load the data

IRast_114951_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_114951/iris_l2_20140214_114951_3800263296_raster_t000_r00000.fits'

SJI1400_114951_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_114951/iris_l2_20140214_114951_3800263296_SJI_1400_t000.fits'

;read the data

dataRast_114951_Siv = IRIS_OBJ(IRast_114951_Siv)

data1400_114951_Siv = IRIS_SJI(SJI1400_114951_Siv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_114951_Siv->SHOW_LINES
spectraRast1403_114951_Siv = dataRast_114951_Siv->GETVAR(3, /LOAD)

images1400_114951_Siv = data1400_114951_Siv->GETVAR()

;get spectral information

lambda1403_114951_Siv = dataRast_114951_Siv->GETLAM(3) ;1398.2239-1406.7972
;PRINT, lambda1403_114951_Siv
pxlslitRast_114951_Siv = dataRast_114951_Siv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_114951_Siv

ResX1400_114951_Siv = data1400_114951_Siv->GETRESX()
ResY1400_114951_Siv = data1400_114951_Siv->GETRESY()

SolarX1400_114951_Siv = data1400_114951_Siv->XSCALE()
SolarY1400_114951_Siv = data1400_114951_Siv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_114951_Siv = dataRast_114951_Siv->GETEXP() ;one 0s exposures--30s
;PRINT, exp_arrRast_114951_Siv

;get every data point in each lambda, y-pos, and image

cube1403_114951_Siv = spectraRast1403_114951_Siv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_114951_Siv)

;count the number of images of original cube

array1403_114951_Siv = spectraRast1403_114951_Siv[0,0,*]

array1400_114951_Siv = images1400_114951_Siv[0,0,*]

nImages1403_114951_Siv = N_ELEMENTS(array1403_114951_Siv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_114951_Siv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_114951_Siv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_114951_Siv = N_ELEMENTS(spectraRast1403_114951_Siv[0,0,*]) ;400 images
;PRINT, n_img1403_114951_Siv
n_wav1403_114951_Siv = N_ELEMENTS(spectraRast1403_114951_Siv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_114951_Siv
n_ypos1403_114951_Siv = N_ELEMENTS(spectraRast1403_114951_Siv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_114951_Siv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only S IV line)

cut_114951_Siv = MEAN(MEAN(spectraRast1403_114951_Siv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_114951_Siv)

;PLOT, cut_114951_Siv

spectra1403_114951_Siv = cut_114951_Siv[210:320]

;PLOT, spectra1403_114951_Siv
;PLOT, lambda1403_114951_Siv[210:320], spectra1403_114951_Siv

nspectraRast1403_114951_Siv = spectraRast1403_114951_Siv[210:320,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_114951_Siv = N_ELEMENTS(nspectraRast1403_114951_Siv[*,0,0]) ;111
PRINT, n_wav_114951_Siv
n_ypos_114951_Siv = N_ELEMENTS(nspectraRast1403_114951_Siv[0,*,0]) ;1093
;PRINT, n_ypos_114951_Siv
n_img_114951_Siv = N_ELEMENTS(nspectraRast1403_114951_Siv[0,0,*]) ;400
;PRINT, n_img_114951_Siv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_114951_Siv-1 DO BEGIN
nspectraRast1403_114951_Siv[*,*,i] = nspectraRast1403_114951_Siv[*,*,i]/exp_arrRast_114951_Siv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_114951_Siv = MEAN(MEAN(nspectraRast1403_114951_Siv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_114951_Siv = MPFITPEAK(lambda1403_114951_Siv[210:320], avg_prof_114951_Siv, coeff_avg_Siv)

wave0_114951_Siv = coeff_avg_Siv[1] ;1406.3827
PRINT, wave0_114951_Siv

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
aspr = (ny*ResY1400_114951_Siv)/(nx*ResX1400_114951_Siv)
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

raster_114951_Siv = N_ELEMENTS(nspectraRast1403_114951_Siv[0,0,*]) ;400
yposition_114951_Siv = N_ELEMENTS(nspectraRast1403_114951_Siv[0,*,0]) ;1093
;PRINT, yposition_114951_Siv

UVB_ind_ry_114951_Siv = ARRAY_INDICES([raster_114951_Siv,yposition_114951_Siv], UVB_ind_114951, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_114951_Siv) ;2D,2,1070 where 2 is [raster,ypos]

UVB_ind_r_114951_Siv = REFORM(UVB_ind_ry_114951_Siv[0,*]) ;1D 1070
UVB_ind_y_114951_Siv = REFORM(UVB_ind_ry_114951_Siv[1,*]) ;1D 1070

;pull out all green rectangle UVB pop. indices

UVB_size_114951_Siv = N_ELEMENTS(UVB_ind_114951) ;1070
UVB_ind_r_s_114951_Siv = N_ELEMENTS(UVB_ind_r_114951_Siv) ;1070
UVB_ind_y_s_114951_Siv = N_ELEMENTS(UVB_ind_y_114951_Siv) ;1070

;create array to hold coeff paramters from FOR loop

coeff_arr_114951_Siv = DBLARR(4,UVB_size_114951_Siv)

;FOR loop with cut array and coeff_arr_114951_Siv above

TIC
FOR i = 0, UVB_size_114951_Siv-1 DO BEGIN
	PLOT, lambda1403_114951_Siv[210:320], REFORM(nspectraRast1403_114951_Siv[*,UVB_ind_y_114951_Siv[i],UVB_ind_r_114951_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_114951_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_114951_Siv = MPFITPEAK(lambda1403_114951_Siv[210:320], REFORM(nspectraRast1403_114951_Siv[*,UVB_ind_y_114951_Siv[i],UVB_ind_r_114951_Siv[i]]), coeff_114951_Siv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_114951_Siv[210:320], YFIT_114951_Siv, COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_114951_Siv[*,i] = coeff_114951_Siv
ENDFOR
TOC ;Time elapsed: ~25.35 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/coeff_arr_114951_Siv.sav'
SAVE, coeff_114951_Siv, spectraRast1403_114951_Siv, nspectraRast1403_114951_Siv, coeff_arr_114951_Siv, wave0_114951_Siv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/coeff_arr_114951_Siv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 30.0
inst_unc_S_114951 = [ABS((REFORM(nspectraRast1403_114951_Siv[*,UVB_ind_y_114951_Siv,UVB_ind_r_114951_Siv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_114951_Siv

coeff_arr_114951_Siv2 = DBLARR(4,UVB_size_114951_Siv)
sigma_coeff_arr = DBLARR(4,UVB_size_114951_Siv)

PRINT, SIZE(inst_unc_S_114951) ;3D,111,1070

TIC
FOR i = 0, UVB_size_114951_Siv-1 DO BEGIN
	PLOT, lambda1403_114951_Siv[210:320], REFORM(nspectraRast1403_114951_Siv[*,UVB_ind_y_114951_Siv[i],UVB_ind_r_114951_Siv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_114951_Siv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_114951_Siv2 = MPFITPEAK(lambda1403_114951_Siv[210:320], REFORM(nspectraRast1403_114951_Siv[*,UVB_ind_y_114951_Siv[i],UVB_ind_r_114951_Siv[i]]), coeff_114951_Siv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_S_114951[*,i,i], ESTIMATES = [5.0,1404.83,0.1,0.0])
        OPLOT, lambda1403_114951_Siv[210:320], REFORM(YFIT_114951_Siv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_114951_Siv2[*,i] = coeff_114951_Siv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~2.76 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_114951_Siv2) ;2D,4,1070

one = coeff_arr_114951_Siv2[1,*,*]
coeff_arr_114951_Siv2_clean = WHERE((one GT 1404.0) AND (one LT 1404.9), count, COMPLEMENT = non)

PRINT, SIZE(coeff_arr_114951_Siv2_clean) ;1D,759

zero = coeff_arr_114951_Siv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_114951_Siv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int = zero[coeff_arr_114951_Siv2_clean]
sig_lw = sig2[coeff_arr_114951_Siv2_clean]
lw = two[coeff_arr_114951_Siv2_clean]
sig_p_int = sig0[coeff_arr_114951_Siv2_clean]

;calculate total integrated intensity (TII)

It_S_114951 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 

PRINT, 'integrated intensity uncertainty'

;calculate integrated intensity uncertainty

int_int_unc_S_114951 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_S_114951

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_S_114951 = (It_S_114951/int_int_unc_S_114951)
PRINT, SNR_0_S_114951

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_S_114951 = (((sig_p_int)^2/(p_int)^2)+((sig_lw)^2/(lw)^2))^neg
PRINT, SNR_S_114951

PRINT, SIZE(SNR_S_114951) ;756
SNR2_S_114951 = WHERE((SNR_S_114951 LT 100), count) ;removes infinity
PRINT, SIZE(SNR_S_114951[SNR2_S_114951]) ;752

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_S_114951[SNR2_S_114951], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_114951"
OPLOT, HISTOGRAM(SNR_S_114951[SNR2_S_114951], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_S_114951[SNR2_S_114951], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_114951", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/histogram_114951.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/histogram_114951.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_S_114951[SNR2_S_114951], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_S_114951[SNR2_S_114951])
PRINT, 'MAX: ', MAX(SNR_S_114951[SNR2_S_114951])
PRINT, 'MODE: ', WHERE(SNR_S_114951[SNR2_S_114951] EQ MAX(SNR_S_114951[SNR2_S_114951]), count) + MIN(SNR_S_114951[SNR2_S_114951])
PRINT, 'MEDIAN: ', MEDIAN(SNR_S_114951[SNR2_S_114951])

MOM = MOMENT(SNR_S_114951[SNR2_S_114951])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/sigma_coeff_arr_114951_Siv.sav'
SAVE, coeff_114951_Siv2, inst_unc_S_114951, sigma_coeff, sigma_coeff_arr, coeff_arr_114951_Siv2, It_S_114951, int_int_unc_S_114951, SNR_0_S_114951, SNR_S_114951, SNR2_S_114951, FILENAME = sfname2

OBJ_DESTROY, dataRast_114951_Siv
OBJ_DESTROY, data1400_114951_Siv

END
