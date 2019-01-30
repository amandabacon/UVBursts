;+
;Name: Oiv_isolate_163205.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/10
;USING THE O IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO O IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

;PRO Oiv_isolate_163205

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_163205.sav'
RESTORE, rfname

;load the data

IRast_163205_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_raster_t000_r00000.fits'

SJI1400_163205_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_SJI_1400_t000.fits'

;read the data

dataRast_163205_Oiv = IRIS_OBJ(IRast_163205_Oiv)

data1400_163205_Oiv = IRIS_SJI(SJI1400_163205_Oiv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_163205_Oiv->SHOW_LINES
spectraRast1403_163205_Oiv = dataRast_163205_Oiv->GETVAR(3, /LOAD)

images1400_163205_Oiv = data1400_163205_Oiv->GETVAR()

;get spectral information

lambda1403_163205_Oiv = dataRast_163205_Oiv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_163205_Oiv
pxlslitRast_163205_Oiv = dataRast_163205_Oiv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_163205_Oiv

ResX1400_163205_Oiv = data1400_163205_Oiv->GETRESX()
ResY1400_163205_Oiv = data1400_163205_Oiv->GETRESY()

SolarX1400_163205_Oiv = data1400_163205_Oiv->XSCALE()
SolarY1400_163205_Oiv = data1400_163205_Oiv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_163205_Oiv = dataRast_163205_Oiv->GETEXP() ;one 0s exposures--8s
;PRINT, exp_arrRast_163205_Oiv

;get every data point in each lambda, y-pos, and image

cube1403_163205_Oiv = spectraRast1403_163205_Oiv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_163205_Oiv)

;count the number of images of original cube

array1403_163205_Oiv = spectraRast1403_163205_Oiv[0,0,*]

array1400_163205_Oiv = images1400_163205_Oiv[0,0,*]

nImages1403_163205_Oiv = N_ELEMENTS(array1403_163205_Oiv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_163205_Oiv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_163205_Oiv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_163205_Oiv = N_ELEMENTS(spectraRast1403_163205_Oiv[0,0,*]) ;400 images
;PRINT, n_img1403_163205_Oiv
n_wav1403_163205_Oiv = N_ELEMENTS(spectraRast1403_163205_Oiv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_163205_Oiv
n_ypos1403_163205_Oiv = N_ELEMENTS(spectraRast1403_163205_Oiv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_163205_Oiv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only O IV line)

cut_163205_Oiv = MEAN(MEAN(spectraRast1403_163205_Oiv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_163205_Oiv)

;PLOT, cut_163205_Oiv

spectra1403_163205_Oiv = cut_163205_Oiv[19:153]

;PLOT, spectra1403_163205_Oiv
;PLOT, lambda1403_163205_Oiv[19:153], spectra1403_163205_Oiv

nspectraRast1403_163205_Oiv = spectraRast1403_163205_Oiv[19:153,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_163205_Oiv = N_ELEMENTS(nspectraRast1403_163205_Oiv[*,0,0]) ;132
PRINT, n_wav_163205_Oiv
n_ypos_163205_Oiv = N_ELEMENTS(nspectraRast1403_163205_Oiv[0,*,0]) ;1093
;PRINT, n_ypos_163205_Oiv
n_img_163205_Oiv = N_ELEMENTS(nspectraRast1403_163205_Oiv[0,0,*]) ;400
;PRINT, n_img_163205_Oiv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_163205_Oiv-1 DO BEGIN
nspectraRast1403_163205_Oiv[*,*,i] = nspectraRast1403_163205_Oiv[*,*,i]/exp_arrRast_163205_Oiv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_163205_Oiv = MEAN(MEAN(nspectraRast1403_163205_Oiv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_163205_Oiv = MPFITPEAK(lambda1403_163205_Oiv[19:153], avg_prof_163205_Oiv, coeff_avg_Oiv)

wave0_163205_Oiv = coeff_avg_Oiv[1] ;1401.1722
PRINT, wave0_163205_Oiv

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
aspr = (ny*ResY1400_163205_Oiv)/(nx*ResX1400_163205_Oiv)
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

raster_163205_Oiv = N_ELEMENTS(nspectraRast1403_163205_Oiv[0,0,*]) ;400
yposition_163205_Oiv = N_ELEMENTS(nspectraRast1403_163205_Oiv[0,*,0]) ;1093
;PRINT, yposition_163205_Oiv

UVB_ind_ry_163205_Oiv = ARRAY_INDICES([raster_163205_Oiv,yposition_163205_Oiv], UVB_ind_163205, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_163205_Oiv) ;2D 2,522 where 2 is [raster,ypos]

UVB_ind_r_163205_Oiv = REFORM(UVB_ind_ry_163205_Oiv[0,*]) ;1D 522
UVB_ind_y_163205_Oiv = REFORM(UVB_ind_ry_163205_Oiv[1,*]) ;1D 522

;pull out all green rectangle UVB pop. indices

UVB_size_163205_Oiv = N_ELEMENTS(UVB_ind_163205) ;522
UVB_ind_r_s_163205_Oiv = N_ELEMENTS(UVB_ind_r_163205_Oiv) ;522
UVB_ind_y_s_163205_Oiv = N_ELEMENTS(UVB_ind_y_163205_Oiv) ;522

;create array to hold coeff paramters from FOR loop

coeff_arr_163205_Oiv = DBLARR(4,UVB_size_163205_Oiv)

;FOR loop with cut array and coeff_arr_163205_Oiv above

TIC
FOR i = 0, UVB_size_163205_Oiv-1 DO BEGIN
	PLOT, lambda1403_163205_Oiv[19:153], REFORM(nspectraRast1403_163205_Oiv[*,UVB_ind_y_163205_Oiv[i],UVB_ind_r_163205_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_163205_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_163205_Oiv = MPFITPEAK(lambda1403_163205_Oiv[19:153], REFORM(nspectraRast1403_163205_Oiv[*,UVB_ind_y_163205_Oiv[i],UVB_ind_r_163205_Oiv[i]]), coeff_163205_Oiv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1401.163,0.1,0.0])
        OPLOT, lambda1403_163205_Oiv[19:153], YFIT_163205_Oiv, COLOR = 170, LINESTYLE = 2, THICK = 5
;        WAIT, 0.05 ;chance to see fits
	coeff_arr_163205_Oiv[*,i] = coeff_163205_Oiv
ENDFOR
TOC ;Time elapsed: ~5.22 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/coeff_arr_163205_Oiv.sav'
SAVE, coeff_163205_Oiv, spectraRast1403_163205_Oiv, nspectraRast1403_163205_Oiv, coeff_arr_163205_Oiv, wave0_163205_Oiv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/coeff_arr_163205_Oiv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_O_163205 = [ABS((REFORM(nspectraRast1403_163205_Oiv[*,UVB_ind_y_163205_Oiv,UVB_ind_r_163205_Oiv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_163205_Oiv

coeff_arr_163205_Oiv2 = DBLARR(4,UVB_size_163205_Oiv)
sigma_coeff_arr = DBLARR(4,UVB_size_163205_Oiv)

PRINT, SIZE(inst_unc_O_163205) ;3D,135,522

TIC
FOR i = 0, UVB_size_163205_Oiv-1 DO BEGIN
	PLOT, lambda1403_163205_Oiv[19:153], REFORM(nspectraRast1403_163205_Oiv[*,UVB_ind_y_163205_Oiv[i],UVB_ind_r_163205_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_163205_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_163205_Oiv2 = MPFITPEAK(lambda1403_163205_Oiv[19:153], REFORM(nspectraRast1403_163205_Oiv[*,UVB_ind_y_163205_Oiv[i],UVB_ind_r_163205_Oiv[i]]), coeff_163205_Oiv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_O_163205[*,i,i], ESTIMATES = [5.0,1401.163,0.1,0.0])
        OPLOT, lambda1403_163205_Oiv[19:153], REFORM(YFIT_163205_Oiv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;       WAIT, 0.05 ;chance to see fits
	coeff_arr_163205_Oiv2[*,i] = coeff_163205_Oiv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~5.50 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_163205_Oiv2) ;2D,4,522

one = coeff_arr_163205_Oiv2[1,*,*]
coeff_arr_163205_Oiv2_clean = WHERE((one GT 1400.6) AND (one LT 1401.6), count, COMPLEMENT = non)

PRINT, SIZE(coeff_arr_163205_Oiv2_clean) ;1D,486

zero = coeff_arr_163205_Oiv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_163205_Oiv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int = zero[coeff_arr_163205_Oiv2_clean]
sig_lw = sig2[coeff_arr_163205_Oiv2_clean]
lw = two[coeff_arr_163205_Oiv2_clean]
sig_p_int = sig0[coeff_arr_163205_Oiv2_clean]

;calculate total integrated intensity (TII)

It_O_163205 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 

PRINT, 'integrated intensity uncertainty'

;calculate integrated intensity uncertainty

int_int_unc_O_163205 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_O_163205

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_O_163205 = (It_O_163205/int_int_unc_O_163205)
PRINT, SNR_0_O_163205

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_O_163205 = (((sig_p_int)^2/(p_int)^2)+((sig_lw)^2/(lw)^2))^neg
PRINT, SNR_O_163205

PRINT, SIZE(SNR_O_163205) ;486
SNR2_O_163205 = WHERE((SNR_O_163205 LT 100), count) ;removes infinity
PRINT, SIZE(SNR_O_163205[SNR2_O_163205]) ;483

SNR_IN = WHERE((SNR_O_163205 GT 100), count)
PRINT, SIZE(SNR_O_163205[SNR_IN])

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_O_163205[SNR2_O_163205], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_163205"
OPLOT, HISTOGRAM(SNR_O_163205[SNR2_O_163205], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_O_163205[SNR2_O_163205], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_163205", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/histogram_163205.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/histogram_163205.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_O_163205[SNR2_O_163205], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_O_163205[SNR2_O_163205])
PRINT, 'MAX: ', MAX(SNR_O_163205[SNR2_O_163205])
PRINT, 'MODE: ', WHERE(SNR_O_163205[SNR2_O_163205] EQ MAX(SNR_O_163205[SNR2_O_163205]), count) + MIN(SNR_O_163205[SNR2_O_163205])
PRINT, 'MEDIAN: ', MEDIAN(SNR_O_163205[SNR2_O_163205])

MOM = MOMENT(SNR_O_163205[SNR2_O_163205])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
SAVE, coeff_163205_Oiv2, inst_unc_O_163205, sigma_coeff, sigma_coeff_arr, coeff_arr_163205_Oiv2, It_O_163205, int_int_unc_O_163205, SNR_0_O_163205, SNR_O_163205, SNR2_O_163205, FILENAME = sfname2

OBJ_DESTROY, dataRast_163205_Oiv
OBJ_DESTROY, data1400_163205_Oiv

END
