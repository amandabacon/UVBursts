;+
;Name: Oiv_isolate_203906.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/10
;USING THE O IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO O IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

PRO Oiv_isolate_203906

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
RESTORE, rfname

;load the data

IRast_203906_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140213_203906/iris_l2_20140213_203906_3800258496_raster_t000_r00000.fits'

SJI1400_203906_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140213_203906/iris_l2_20140213_203906_3800258496_SJI_1400_t000.fits'

;read the data

dataRast_203906_Oiv = IRIS_OBJ(IRast_203906_Oiv)

data1400_203906_Oiv = IRIS_SJI(SJI1400_203906_Oiv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_203906_Oiv->SHOW_LINES
spectraRast1403_203906_Oiv = dataRast_203906_Oiv->GETVAR(3, /LOAD)

images1400_203906_Oiv = data1400_203906_Oiv->GETVAR()

;get spectral information

lambda1403_203906_Oiv = dataRast_203906_Oiv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_203906_Oiv
pxlslitRast_203906_Oiv = dataRast_203906_Oiv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_203906_Oiv

ResX1400_203906_Oiv = data1400_203906_Oiv->GETRESX()
ResY1400_203906_Oiv = data1400_203906_Oiv->GETRESY()

SolarX1400_203906_Oiv = data1400_203906_Oiv->XSCALE()
SolarY1400_203906_Oiv = data1400_203906_Oiv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_203906_Oiv = dataRast_203906_Oiv->GETEXP() ;one 0s exposures--8s
;PRINT, exp_arrRast_203906_Oiv

;get every data point in each lambda, y-pos, and image

cube1403_203906_Oiv = spectraRast1403_203906_Oiv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_203906_Oiv)

;count the number of images of original cube

array1403_203906_Oiv = spectraRast1403_203906_Oiv[0,0,*]

array1400_203906_Oiv = images1400_203906_Oiv[0,0,*]

nImages1403_203906_Oiv = N_ELEMENTS(array1403_203906_Oiv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_203906_Oiv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_203906_Oiv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_203906_Oiv = N_ELEMENTS(spectraRast1403_203906_Oiv[0,0,*]) ;400 images
;PRINT, n_img1403_203906_Oiv
n_wav1403_203906_Oiv = N_ELEMENTS(spectraRast1403_203906_Oiv[*,0,0]) ;377 wavelengths b/w 1399-1405
;PRINT, n_wav1403_203906_Oiv
n_ypos1403_203906_Oiv = N_ELEMENTS(spectraRast1403_203906_Oiv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_203906_Oiv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only O IV line)

cut_203906_Oiv = MEAN(MEAN(spectraRast1403_203906_Oiv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 377, float
;PRINT, SIZE(cut_203906_Oiv)

;PLOT, cut_203906_Oiv

spectra1403_203906_Oiv = cut_203906_Oiv[19:135]

;PLOT, spectra1403_203906_Oiv
;PLOT, lambda1403_203906_Oiv[19:135], spectra1403_203906_Oiv

nspectraRast1403_203906_Oiv = spectraRast1403_203906_Oiv[19:135,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_203906_Oiv = N_ELEMENTS(nspectraRast1403_203906_Oiv[*,0,0]) ;117
PRINT, n_wav_203906_Oiv
n_ypos_203906_Oiv = N_ELEMENTS(nspectraRast1403_203906_Oiv[0,*,0]) ;1093
;PRINT, n_ypos_203906_Oiv
n_img_203906_Oiv = N_ELEMENTS(nspectraRast1403_203906_Oiv[0,0,*]) ;400
;PRINT, n_img_203906_Oiv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_203906_Oiv-1 DO BEGIN
nspectraRast1403_203906_Oiv[*,*,i] = nspectraRast1403_203906_Oiv[*,*,i]/exp_arrRast_203906_Oiv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_203906_Oiv = MEAN(MEAN(nspectraRast1403_203906_Oiv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_203906_Oiv = MPFITPEAK(lambda1403_203906_Oiv[19:135], avg_prof_203906_Oiv, coeff_avg_Oiv)

wave0_203906_Oiv = coeff_avg_Oiv[1] ;1401.1859
PRINT, wave0_203906_Oiv

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
aspr = (ny*ResY1400_203906_Oiv)/(nx*ResX1400_203906_Oiv)
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

raster_203906_Oiv = N_ELEMENTS(nspectraRast1403_203906_Oiv[0,0,*]) ;400
yposition_203906_Oiv = N_ELEMENTS(nspectraRast1403_203906_Oiv[0,*,0]) ;1093
;PRINT, yposition_203906_Oiv

UVB_ind_ry_203906_Oiv = ARRAY_INDICES([raster_203906_Oiv,yposition_203906_Oiv], UVB_ind_203906, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_203906_Oiv) ;2D,2,1235 where 2 is [raster,ypos]

UVB_ind_r_203906_Oiv = REFORM(UVB_ind_ry_203906_Oiv[0,*]) ;1D 1235
UVB_ind_y_203906_Oiv = REFORM(UVB_ind_ry_203906_Oiv[1,*]) ;1D 1235

;pull out all green rectangle UVB pop. indices

UVB_size_203906_Oiv = N_ELEMENTS(UVB_ind_203906) ;1235
UVB_ind_r_s_203906_Oiv = N_ELEMENTS(UVB_ind_r_203906_Oiv) ;1235
UVB_ind_y_s_203906_Oiv = N_ELEMENTS(UVB_ind_y_203906_Oiv) ;1235

;create array to hold coeff paramters from FOR loop

coeff_arr_203906_Oiv = DBLARR(4,UVB_size_203906_Oiv)

;FOR loop with cut array and coeff_arr_203906_Oiv above

TIC
FOR i = 0, UVB_size_203906_Oiv-1 DO BEGIN
	PLOT, lambda1403_203906_Oiv[19:135], REFORM(nspectraRast1403_203906_Oiv[*,UVB_ind_y_203906_Oiv[i],UVB_ind_r_203906_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_203906_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_203906_Oiv = MPFITPEAK(lambda1403_203906_Oiv[19:135], REFORM(nspectraRast1403_203906_Oiv[*,UVB_ind_y_203906_Oiv[i],UVB_ind_r_203906_Oiv[i]]), coeff_203906_Oiv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1401.163,0.1,0.0])
	OPLOT, lambda1403_203906_Oiv[19:135], YFIT_203906_Oiv, COLOR = 170, LINESTYLE = 2, THICK = 5
;	WAIT, 0.05 ;chance to see fits
	coeff_arr_203906_Oiv[*,i] = coeff_203906_Oiv
ENDFOR
TOC ;Time elapsed: ~10.72 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/coeff_arr_203906_Oiv.sav'
SAVE, coeff_203906_Oiv, spectraRast1403_203906_Oiv, nspectraRast1403_203906_Oiv, coeff_arr_203906_Oiv, wave0_203906_Oiv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/coeff_arr_203906_Oiv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_O_203906 = [ABS((REFORM(nspectraRast1403_203906_Oiv[*,UVB_ind_y_203906_Oiv,UVB_ind_r_203906_Oiv]))/(g*dt))+R]^0.5
;PRINT, inst_unc
;PRINT, exp_arrRast_203906_Oiv

coeff_arr_203906_Oiv2 = DBLARR(4,UVB_size_203906_Oiv)
sigma_coeff_arr = DBLARR(4,UVB_size_203906_Oiv)

PRINT, SIZE(inst_unc_O_203906) ;3D,117,1235

TIC
FOR i = 0, UVB_size_203906_Oiv-1 DO BEGIN
	PLOT, lambda1403_203906_Oiv[19:135], REFORM(nspectraRast1403_203906_Oiv[*,UVB_ind_y_203906_Oiv[i],UVB_ind_r_203906_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_203906_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_203906_Oiv2 = MPFITPEAK(lambda1403_203906_Oiv[19:135], REFORM(nspectraRast1403_203906_Oiv[*,UVB_ind_y_203906_Oiv[i],UVB_ind_r_203906_Oiv[i]]), coeff_203906_Oiv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_O_203906[*,i,i], ESTIMATES = [5.0,1401.163,0.1,0.0])
	OPLOT, lambda1403_203906_Oiv[19:135], REFORM(YFIT_203906_Oiv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;	WAIT, 0.05 ;chance to see fits
	coeff_arr_203906_Oiv2[*,i] = coeff_203906_Oiv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~10.86 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_203906_Oiv2) ;2D,4,1235

one = coeff_arr_203906_Oiv2[1,*,*]
coeff_arr_203906_Oiv2_clean = WHERE((one GT 1400.6) AND (one LT 1401.6), count, COMPLEMENT = non)

;get UVB indices for O IV

UVB_ind_Oiv_203906 = UVB_ind_203906[coeff_arr_203906_Oiv2_clean]
PRINT, UVB_ind_Oiv_203906
PRINT, N_ELEMENTS(UVB_ind_Oiv_203906) ;1157

PRINT, SIZE(coeff_arr_203906_Oiv2_clean) ;1D,1157

zero = coeff_arr_203906_Oiv2[0,*,*]
sig2 = sigma_coeff_arr[2,*,*]
two = coeff_arr_203906_Oiv2[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int_203906_Oiv = zero[coeff_arr_203906_Oiv2_clean]
sig_lw_203906_Oiv = sig2[coeff_arr_203906_Oiv2_clean]
lw_203906_Oiv = two[coeff_arr_203906_Oiv2_clean]
sig_p_int_203906_Oiv = sig0[coeff_arr_203906_Oiv2_clean]

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (gamma_203906 & new_peak_min)

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_safe_203906.sav'
RESTORE, rfname2_limit;, /VERBOSE

limit_gamma_203906_Oiv = gamma_203906
limit_wave0_203906_Oiv = wave0_203906_Oiv

limit_p_int_Oiv = zero[coeff_arr_203906_Oiv2_clean]
PRINT, "limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv) ;1157
PRINT, limit_p_int_Oiv

limit_sig_p_int_Oiv = sig0[coeff_arr_203906_Oiv2_clean]
PRINT, "limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv) ;1157
PRINT, limit_sig_p_int_Oiv

limit_lw_Oiv = two[coeff_arr_203906_Oiv2_clean]
PRINT, "limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv) ;1157
PRINT, limit_lw_Oiv

limit_sig_lw_Oiv = sig2[coeff_arr_203906_Oiv2_clean]
PRINT, "limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv) ;1157
PRINT, limit_sig_lw_Oiv

limit_vel_width_203906_Oiv = (two[coeff_arr_203906_Oiv2_clean]/limit_wave0_203906_Oiv) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_203906_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv) ;1157
PRINT, limit_vel_width_203906_Oiv

PRINT, 'TEST'
test = WHERE((limit_vel_width_203906_Oiv GE 0.0) AND (limit_vel_width_203906_Oiv LE 50.0), count)
PRINT, limit_vel_width_203906_Oiv[test]
PRINT, MIN(limit_vel_width_203906_Oiv[test]) ;0.70093110

limit_velocity_203906_Oiv = ((one[coeff_arr_203906_Oiv2_clean]-limit_wave0_203906_Oiv)/limit_wave0_203906_Oiv) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_203906_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv) ;1157
PRINT, limit_velocity_203906_Oiv

;all velocity lines--40-1000 km/s
limit_all_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 40) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 1000) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_all_e_dens_203906, count, /NULL)
PRINT, "limit_all_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_all_e_dens_203906_Oiv] ;35

PRINT, "limit_all_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_all_e_dens_203906_Oiv] ;35

PRINT, "limit_all_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_all_e_dens_203906_Oiv]) ;35

PRINT, "limit_all_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_all_e_dens_203906_Oiv] ;35

PRINT, "limit_all_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_all_e_dens_203906_Oiv] ;35

PRINT, "limit_all_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_all_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_all_e_dens_203906_Oiv] ;35

;highest velocity lines--80-1000 km/s
limit_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 80) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 1000) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_e_dens_203906, count, /NULL)
PRINT, "limit_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_e_dens_203906_Oiv] ;7

PRINT, "limit_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_e_dens_203906_Oiv] ;7

PRINT, "limit_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_e_dens_203906_Oiv]) ;7

PRINT, "limit_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_e_dens_203906_Oiv] ;7

PRINT, "limit_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_e_dens_203906_Oiv] ;7

PRINT, "limit_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_e_dens_203906_Oiv] ;7

;70-80 km/s velocity lines
limit_70_80_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 70) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 80) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_70_80_e_dens_203906, count, /NULL)
PRINT, "limit_70_80_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_70_80_e_dens_203906_Oiv] ;3

PRINT, "limit_70_80_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_70_80_e_dens_203906_Oiv] ;3

PRINT, "limit_70_80_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_70_80_e_dens_203906_Oiv]) ;3

PRINT, "limit_70_80_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_70_80_e_dens_203906_Oiv] ;3

PRINT, "limit_70_80_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_70_80_e_dens_203906_Oiv] ;3

PRINT, "limit_70_80_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_70_80_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_70_80_e_dens_203906_Oiv] ;3

;60-70 km/s velocity lines
limit_60_70_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 60) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 70) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_60_70_e_dens_203906, count, /NULL)
PRINT, "limit_60_70_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_60_70_e_dens_203906_Oiv] ;4

PRINT, "limit_60_70_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_60_70_e_dens_203906_Oiv] ;4

PRINT, "limit_60_70_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_60_70_e_dens_203906_Oiv]) ;4

PRINT, "limit_60_70_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_60_70_e_dens_203906_Oiv] ;4

PRINT, "limit_60_70_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_60_70_e_dens_203906_Oiv] ;4

PRINT, "limit_60_70_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_60_70_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_60_70_e_dens_203906_Oiv] ;4

;50-60 km/s velocity lines
limit_50_60_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 50) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 60) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_50_60_e_dens_203906, count, /NULL)
PRINT, "limit_50_60_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_50_60_e_dens_203906_Oiv] ;3

PRINT, "limit_50_60_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_50_60_e_dens_203906_Oiv] ;3

PRINT, "limit_50_60_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_50_60_e_dens_203906_Oiv]) ;3

PRINT, "limit_50_60_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_50_60_e_dens_203906_Oiv] ;3

PRINT, "limit_50_60_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_50_60_e_dens_203906_Oiv] ;3

PRINT, "limit_50_60_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_50_60_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_50_60_e_dens_203906_Oiv] ;3

;40-50 km/s velocity lines
limit_40_50_e_dens_203906_Oiv = WHERE((limit_vel_width_203906_Oiv GE 40) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_203906_Oiv LE 50) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_203906_Oiv LE (limit_gamma_203906_Oiv/limit_wave0_203906_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_40_50_e_dens_203906, count, /NULL)
PRINT, "limit_40_50_e_dens_203906_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_203906_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, limit_vel_width_203906_Oiv[limit_40_50_e_dens_203906_Oiv] ;18

PRINT, "limit_40_50_e_dens_203906_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, limit_p_int_Oiv[limit_40_50_e_dens_203906_Oiv] ;18

PRINT, "limit_40_50_e_dens_203906_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_203906_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, ABS(limit_velocity_203906_Oiv[limit_40_50_e_dens_203906_Oiv]) ;18

PRINT, "limit_40_50_e_dens_203906_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, limit_lw_Oiv[limit_40_50_e_dens_203906_Oiv] ;18

PRINT, "limit_40_50_e_dens_203906_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_40_50_e_dens_203906_Oiv] ;18

PRINT, "limit_40_50_e_dens_203906_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_40_50_e_dens_203906_Oiv])
PRINT, limit_sig_lw_Oiv[limit_40_50_e_dens_203906_Oiv] ;18

;save parameters from FOR loop

;moved to other file
;sfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/limit_sigma_coeff_arr_203906_Oiv.sav'
;SAVE, limit_all_e_dens_203906_Oiv, limit_e_dens_203906_Oiv, limit_70_80_e_dens_203906_Oiv, limit_60_70_e_dens_203906_Oiv, limit_50_60_e_dens_203906_Oiv, limit_40_50_e_dens_052046_Oiv, limit_vel_width_203906_Oiv, limit_velocity_203906_Oiv, p_int, sig_lw, lw, sig_p_int, UVB_ind_Oiv_203906, FILENAME = sfname2_limit

;limit_e_dens_203906_Oiv, limit_It_O_203906, limit_int_int_unc_O_203906, limit_SNR_0_O_203906, limit_SNR_O_203906, limit_SNR2_O_203906, limit_70_80_e_dens_203906_Oiv, limit_70_80_It_O_203906, limit_70_80_int_int_unc_O_203906, limit_70_80_SNR_0_O_203906, limit_70_80_SNR_O_203906, limit_70_80_SNR2_O_203906,limit_60_70_e_dens_203906_Oiv, limit_60_70_It_O_203906, limit_60_70_int_int_unc_O_203906, limit_60_70_SNR_0_O_203906, limit_60_70_SNR_O_203906, limit_60_70_SNR2_O_203906,limit_50_60_e_dens_203906_Oiv, limit_50_60_It_O_203906, limit_50_60_int_int_unc_O_203906, limit_50_60_SNR_0_O_203906, limit_50_60_SNR_O_203906, limit_50_60_SNR2_O_203906, limit_40_50_e_dens_203906_Oiv, limit_40_50_It_O_203906, limit_40_50_int_int_unc_O_203906, limit_40_50_SNR_0_O_203906, limit_40_50_SNR_O_203906, limit_40_50_SNR2_O_203906

;===============================================================================
;calculate total integrated intensity (TII)

It_O_203906 = (sqrt(2.0*!dpi)*p_int_203906_Oiv*lw_203906_Oiv) ;total integrated intensity 
PRINT, "It_O_203906"
PRINT, It_O_203906
PRINT, SIZE(It_O_203906) ;1D,1157

;calculate integrated intensity uncertainty

int_int_unc_O_203906 = [2.0*!dpi*((p_int_203906_Oiv)^2*(sig_lw_203906_Oiv)^2+(lw_203906_Oiv)^2*(sig_p_int_203906_Oiv)^2)]^0.5
PRINT, "int_int_unc_O_203906"
PRINT, int_int_unc_O_203906
PRINT, SIZE(int_int_unc_O_203906) ;1D,1157

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_O_203906 = (It_O_203906/int_int_unc_O_203906)
PRINT, SNR_0_O_203906

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_O_203906 = (((sig_p_int_203906_Oiv)^2/(p_int_203906_Oiv)^2)+((sig_lw_203906_Oiv)^2/(lw_203906_Oiv)^2))^neg
PRINT, SNR_O_203906

PRINT, SIZE(SNR_O_203906) ;1157
SNR2_O_203906 = WHERE((SNR_O_203906 LT 10000), count) ;removes infinity
PRINT, SIZE(SNR_O_203906[SNR2_O_203906]) ;1157

SNR_IN = WHERE((SNR_O_203906 GT 100), count)
PRINT, SIZE(SNR_O_203906[SNR_IN])

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_O_203906[SNR2_O_203906], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_203906"
OPLOT, HISTOGRAM(SNR_O_203906[SNR2_O_203906], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_O_203906[SNR2_O_203906], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_203906", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/histogram_203906.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/histogram_203906.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_O_203906[SNR2_O_203906], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_O_203906[SNR2_O_203906])
PRINT, 'MAX: ', MAX(SNR_O_203906[SNR2_O_203906])
PRINT, 'MODE: ', WHERE(SNR_O_203906[SNR2_O_203906] EQ MAX(SNR_O_203906[SNR2_O_203906]), count) + MIN(SNR_O_203906[SNR2_O_203906])
PRINT, 'MEDIAN: ', MEDIAN(SNR_O_203906[SNR2_O_203906])

MOM = MOMENT(SNR_O_203906[SNR2_O_203906])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
SAVE, coeff_203906_Oiv2, inst_unc_O_203906, sigma_coeff, sigma_coeff_arr, coeff_arr_203906_Oiv2, It_O_203906, int_int_unc_O_203906, SNR_0_O_203906, SNR_O_203906, SNR2_O_203906, limit_vel_width_203906_Oiv, limit_velocity_203906_Oiv, p_int_203906_Oiv, sig_lw_203906_Oiv, lw_203906_Oiv, sig_p_int_203906_Oiv, UVB_ind_Oiv_203906, FILENAME = sfname2

OBJ_DESTROY, dataRast_203906_Oiv
OBJ_DESTROY, data1400_203906_Oiv

END
