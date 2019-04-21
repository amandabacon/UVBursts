;+
;Name: Oiv_isolate_004121.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/10
;USING THE O IV LINE AND THE UVB INDICES AFTER MANUALLY INSPECTING
;SPECTRA FOR NI II ABSORPTION, APPLY TWO ROUNDS OF SGFs TO O IV LINE
;TO GET 4 PARAMETERS, INSTRUMENTAL UNCERTAINTIES, POISSON NOISE, TIIs,
;SNRs, THEN CREATE A HISTOGRAM OF SNR VALUE FREQUENCY. 

;PRO Oiv_isolate_004121

;restore Si IV UVB indices and other variables

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/iso_vars_004121.sav'
RESTORE, rfname

;load the data

IRast_004121_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_004121/iris_l2_20140216_004121_3800263296_raster_t000_r00000.fits'

SJI1400_004121_Oiv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_004121/iris_l2_20140216_004121_3800263296_SJI_1400_t000.fits'

;read the data

dataRast_004121_Oiv = IRIS_OBJ(IRast_004121_Oiv)

data1400_004121_Oiv = IRIS_SJI(SJI1400_004121_Oiv)

;load images/profiles (WANT Si IV 1403 THIS TIME)

dataRast_004121_Oiv->SHOW_LINES
spectraRast1403_004121_Oiv = dataRast_004121_Oiv->GETVAR(3, /LOAD)

images1400_004121_Oiv = data1400_004121_Oiv->GETVAR()

;get spectral information

lambda1403_004121_Oiv = dataRast_004121_Oiv->GETLAM(3) ;1398.2239-1406.7717
;PRINT, lambda1403_004121_Oiv
pxlslitRast_004121_Oiv = dataRast_004121_Oiv->GETNSLIT(3) ;1093
;PRINT, pxlslitRast_004121_Oiv

ResX1400_004121_Oiv = data1400_004121_Oiv->GETRESX()
ResY1400_004121_Oiv = data1400_004121_Oiv->GETRESY()

SolarX1400_004121_Oiv = data1400_004121_Oiv->XSCALE()
SolarY1400_004121_Oiv = data1400_004121_Oiv->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_004121_Oiv = dataRast_004121_Oiv->GETEXP() ;two 0s exposures--30s
;PRINT, exp_arrRast_004121_Oiv

;get every data point in each lambda, y-pos, and image

cube1403_004121_Oiv = spectraRast1403_004121_Oiv[*,*,*] ;SIZE: 3D,337,1093,400, float
;PRINT, SIZE(cube1403_004121_Oiv)

;count the number of images of original cube

array1403_004121_Oiv = spectraRast1403_004121_Oiv[0,0,*]

array1400_004121_Oiv = images1400_004121_Oiv[0,0,*]

nImages1403_004121_Oiv = N_ELEMENTS(array1403_004121_Oiv) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_004121_Oiv[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_004121_Oiv[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1403_004121_Oiv = N_ELEMENTS(spectraRast1403_004121_Oiv[0,0,*]) ;400 images
;PRINT, n_img1403_004121_Oiv
n_wav1403_004121_Oiv = N_ELEMENTS(spectraRast1403_004121_Oiv[*,0,0]) ;337 wavelengths b/w 1399-1405
;PRINT, n_wav1403_004121_Oiv
n_ypos1403_004121_Oiv = N_ELEMENTS(spectraRast1403_004121_Oiv[0,*,0]) ;1093 y-positions
;PRINT, n_ypos1403_004121_Oiv

;remove overscan by making a tilt and applying a cut, then make a new
;array (cut to include only O IV line--with some minor noise around it)

cut_004121_Oiv = MEAN(MEAN(spectraRast1403_004121_Oiv, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 337, float
;PRINT, SIZE(cut_004121_Oiv)

;PLOT, cut_004121_Oiv

spectra1403_004121_Oiv = cut_004121_Oiv[19:140]

;PLOT, spectra1403_004121_Oiv
;PLOT, lambda1403_004121_Oiv[19:140], spectra1403_004121_Oiv

nspectraRast1403_004121_Oiv = spectraRast1403_004121_Oiv[19:140,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_004121_Oiv = N_ELEMENTS(nspectraRast1403_004121_Oiv[*,0,0]) ;122
PRINT, n_wav_004121_Oiv
n_ypos_004121_Oiv = N_ELEMENTS(nspectraRast1403_004121_Oiv[0,*,0]) ;1093
;PRINT, n_ypos_004121_Oiv
n_img_004121_Oiv = N_ELEMENTS(nspectraRast1403_004121_Oiv[0,0,*]) ;400
;PRINT, n_img_004121_Oiv

;loop for (new) exposure time normalization

FOR i = 0, nImages1403_004121_Oiv-1 DO BEGIN
nspectraRast1403_004121_Oiv[*,*,i] = nspectraRast1403_004121_Oiv[*,*,i]/exp_arrRast_004121_Oiv[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_004121_Oiv = MEAN(MEAN(nspectraRast1403_004121_Oiv, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_004121_Oiv = MPFITPEAK(lambda1403_004121_Oiv[19:140], avg_prof_004121_Oiv, coeff_avg_Oiv)

wave0_004121_Oiv = coeff_avg_Oiv[1] ;1399.5399
PRINT, wave0_004121_Oiv

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
aspr = (ny*ResY1400_004121_Oiv)/(nx*ResX1400_004121_Oiv)
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

raster_004121_Oiv = N_ELEMENTS(nspectraRast1403_004121_Oiv[0,0,*]) ;400
yposition_004121_Oiv = N_ELEMENTS(nspectraRast1403_004121_Oiv[0,*,0]) ;1093
;PRINT, raster_004121_Oiv ;number of raster positions (400-step raster)
;PRINT, yposition_004121_Oiv ;number of y spatial positions along slit

;convert 1D array to 2D normalized to the size of UVB_ind_004121
UVB_ind_ry_004121_Oiv = ARRAY_INDICES([raster_004121_Oiv,yposition_004121_Oiv], UVB_ind_004121, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_004121_Oiv) ;2D,2,471 where 2 is [raster,ypos]
PRINT, UVB_ind_ry_004121_Oiv

UVB_ind_r_004121_Oiv = REFORM(UVB_ind_ry_004121_Oiv[0,*]) ;1D 471
UVB_ind_y_004121_Oiv = REFORM(UVB_ind_ry_004121_Oiv[1,*]) ;1D 471
PRINT, UVB_ind_004121

;pull out all green rectangle UVB pop. indices

UVB_size_004121_Oiv = N_ELEMENTS(UVB_ind_004121) ;471
UVB_ind_r_s_004121_Oiv = N_ELEMENTS(UVB_ind_r_004121_Oiv) ;471
UVB_ind_y_s_004121_Oiv = N_ELEMENTS(UVB_ind_y_004121_Oiv) ;471

;create array to hold coeff paramters from FOR loop

coeff_arr_004121_Oiv = DBLARR(4,UVB_size_004121_Oiv)

;FOR loop with cut array and coeff_arr_004121_Oiv above

TIC
FOR i = 0, UVB_size_004121_Oiv-1 DO BEGIN
	PLOT, lambda1403_004121_Oiv[19:140], REFORM(nspectraRast1403_004121_Oiv[*,UVB_ind_y_004121_Oiv[i],UVB_ind_r_004121_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_004121_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_004121_Oiv = MPFITPEAK(lambda1403_004121_Oiv[19:140], REFORM(nspectraRast1403_004121_Oiv[*,UVB_ind_y_004121_Oiv[i],UVB_ind_r_004121_Oiv[i]]), coeff_004121_Oiv, NTERMS = 4, STATUS = status, ERRMSG = errmsg, ESTIMATES = [5.0,1401.163,0.1,0.0])
	OPLOT, lambda1403_004121_Oiv[19:140], YFIT_004121_Oiv, COLOR = 170, LINESTYLE = 2, THICK = 5
;	WAIT, 0.05 ;chance to see fits
	coeff_arr_004121_Oiv[*,i] = coeff_004121_Oiv
;        test = UVB_ind_004121[i] ;supposed to be the same indices...duh
;        PRINT, test
ENDFOR
TOC ;Time elapsed: ~2.21 sec

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/coeff_arr_004121_Oiv.sav'
SAVE, coeff_004121_Oiv, spectraRast1403_004121_Oiv, nspectraRast1403_004121_Oiv, coeff_arr_004121_Oiv, wave0_004121_Oiv, FILENAME = sfname

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/coeff_arr_004121_Oiv.sav'
RESTORE, rfname2

;calculate instrumental uncertainties to use in another SGF FOR loop

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 30.0
inst_unc_O_004121 = [ABS((REFORM(nspectraRast1403_004121_Oiv[*,UVB_ind_y_004121_Oiv,UVB_ind_r_004121_Oiv]))/(g*dt))+R]^0.5
;PRINT, "instrumental uncertainties"
;PRINT, inst_unc_O_004121
;PRINT, exp_arrRast_004121_Oiv

coeff_arr_004121_Oiv2 = DBLARR(4,UVB_size_004121_Oiv)
sigma_coeff_arr = DBLARR(4,UVB_size_004121_Oiv)

PRINT, SIZE(inst_unc_O_004121) ;3D,122,471

TIC
FOR i = 0, UVB_size_004121_Oiv-1 DO BEGIN
	PLOT, lambda1403_004121_Oiv[19:140], REFORM(nspectraRast1403_004121_Oiv[*,UVB_ind_y_004121_Oiv[i],UVB_ind_r_004121_Oiv[i]]), XRANGE = [1398.2, 1406.8], TITLE = 'AR11974_004121_Oiv Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_004121_Oiv2 = MPFITPEAK(lambda1403_004121_Oiv[19:140], REFORM(nspectraRast1403_004121_Oiv[*,UVB_ind_y_004121_Oiv[i],UVB_ind_r_004121_Oiv[i]]), coeff_004121_Oiv2, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_O_004121[*,i,i], ESTIMATES = [5.0,1401.163,0.1,0.0])
	OPLOT, lambda1403_004121_Oiv[19:140], REFORM(YFIT_004121_Oiv2), COLOR = 170, LINESTYLE = 2, THICK = 5
;	WAIT, 0.05 ;chance to see fits
	coeff_arr_004121_Oiv2[*,i] = coeff_004121_Oiv2
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~2.76 sec

;remove any erroneous fits to Si IV 1403 line

PRINT, SIZE(coeff_arr_004121_Oiv2) ;2D,4,471

;need UVB index numbers from here, when we just get the O IV line

one = coeff_arr_004121_Oiv2[1,*,*]
coeff_arr_004121_Oiv2_clean = WHERE((one GT 1400.6) AND (one LT 1401.6), count, COMPLEMENT = non)

testt = UVB_ind_004121[coeff_arr_004121_Oiv2_clean]
PRINT, testt
PRINT, N_ELEMENTS(testt) ;464---WORKS???!?!?!?

;PRINT, "coeff_arr_004121_Oiv2_clean"
;PRINT, one[coeff_arr_004121_Oiv2_clean]

;PRINT, SIZE(coeff_arr_004121_Oiv2_clean) ;1D,464

zero = coeff_arr_004121_Oiv2[0,*,*] ;peak intensity--est start at 5 (it adjusts to > 5, which is good)
;PRINT, "zero"
;PRINT, zero
sig2 = sigma_coeff_arr[2,*,*] ;uncertainty in line width
;PRINT, "sig2"
;PRINT, sig2
two = coeff_arr_004121_Oiv2[2,*,*] ;line width
;PRINT, "two"
;PRINT, two
sig0 = sigma_coeff_arr[0,*,*] ;uncertainty in peak intensity
;PRINT, "sig0"
;PRINT, sig0

p_int = zero[coeff_arr_004121_Oiv2_clean]
;PRINT, "p_int"
;PRINT, p_int
sig_lw = sig2[coeff_arr_004121_Oiv2_clean]
;PRINT, "sig_lw"
;PRINT, sig_lw
lw = two[coeff_arr_004121_Oiv2_clean]
;PRINT, "lw"
;PRINT, lw
sig_p_int = sig0[coeff_arr_004121_Oiv2_clean]
;PRINT, "sig_p_int"
;PRINT, sig_p_int

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (gamma_004121 & new_peak_min)

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/iso_vars_safe_004121.sav'
RESTORE, rfname2_limit;, /VERBOSE

limit_gamma_004121_Oiv = gamma_004121
limit_wave0_004121_Oiv = wave0_004121_Oiv

limit_p_int_Oiv = zero[coeff_arr_004121_Oiv2_clean]
PRINT, "limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv) ;464
PRINT, limit_p_int_Oiv

limit_sig_p_int_Oiv = sig0[coeff_arr_004121_Oiv2_clean]
PRINT, "limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv) ;464
PRINT, limit_sig_p_int_Oiv

limit_lw_Oiv = two[coeff_arr_004121_Oiv2_clean]
PRINT, "limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv) ;464
PRINT, limit_lw_Oiv

limit_sig_lw_Oiv = sig2[coeff_arr_004121_Oiv2_clean]
PRINT, "limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv) ;464
PRINT, limit_sig_lw_Oiv

limit_vel_width_004121_Oiv = (two[coeff_arr_004121_Oiv2_clean]/limit_wave0_004121_Oiv) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_004121_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv) ;464
PRINT, limit_vel_width_004121_Oiv

PRINT, 'TEST'
test = WHERE((limit_vel_width_004121_Oiv GE 0.0) AND (limit_vel_width_004121_Oiv LE 50.0), count)
PRINT, limit_vel_width_004121_Oiv[test]
PRINT, MIN(limit_vel_width_004121_Oiv[test]) ;4.9296307

limit_velocity_004121_Oiv = ((one[coeff_arr_004121_Oiv2_clean]-limit_wave0_004121_Oiv)/limit_wave0_004121_Oiv) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_004121_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv) ;464
PRINT, limit_velocity_004121_Oiv

;all velocity lines--40-1000 km/s
limit_all_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 40) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 1000) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_all_e_dens_004121, count, /NULL)
PRINT, "limit_all_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_all_e_dens_004121_Oiv] ;36

PRINT, "limit_all_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_all_e_dens_004121_Oiv] ;36

PRINT, "limit_all_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, ABS(limit_velocity_004121_Oiv[limit_all_e_dens_004121_Oiv]) ;36

PRINT, "limit_all_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_all_e_dens_004121_Oiv] ;36

PRINT, "limit_all_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_all_e_dens_004121_Oiv] ;36

PRINT, "limit_all_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_all_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_all_e_dens_004121_Oiv] ;36

;highest velocity lines--80-1000 km/s
limit_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 80) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 1000) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_e_dens_004121, count, /NULL)
PRINT, "limit_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_e_dens_004121_Oiv] ;2

PRINT, "limit_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_e_dens_004121_Oiv] ;2

PRINT, "limit_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_e_dens_004121_Oiv])
PRINT, ABS(limit_velocity_004121_Oiv[limit_e_dens_004121_Oiv]) ;2

PRINT, "limit_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_e_dens_004121_Oiv] ;2

PRINT, "limit_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_e_dens_004121_Oiv] ;2

PRINT, "limit_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_e_dens_004121_Oiv] ;2

;70-80 km/s velocity lines
limit_70_80_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 70) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 80) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_70_80_e_dens_004121, count, /NULL)
PRINT, "limit_70_80_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_70_80_e_dens_004121_Oiv] ;1

PRINT, "limit_70_80_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_70_80_e_dens_004121_Oiv] ;1

PRINT, "limit_70_80_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, ABS(limit_velocity_004121_Oiv[limit_70_80_e_dens_004121_Oiv]) ;1

PRINT, "limit_70_80_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_70_80_e_dens_004121_Oiv] ;1

PRINT, "limit_70_80_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_70_80_e_dens_004121_Oiv] ;1

PRINT, "limit_70_80_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_70_80_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_70_80_e_dens_004121_Oiv] ;1

;60-70 km/s velocity lines
limit_60_70_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 60) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 70) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_60_70_e_dens_004121, count, /NULL)
PRINT, "limit_60_70_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

PRINT, "limit_60_70_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

;remove ABS()
PRINT, "limit_60_70_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_velocity_004121_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

PRINT, "limit_60_70_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

PRINT, "limit_60_70_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

PRINT, "limit_60_70_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv] ;0

;50-60 km/s velocity lines
limit_50_60_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 50) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 60) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_50_60_e_dens_004121, count, /NULL)
PRINT, "limit_50_60_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_50_60_e_dens_004121_Oiv] ;10

PRINT, "limit_50_60_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_50_60_e_dens_004121_Oiv] ;10

PRINT, "limit_50_60_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, ABS(limit_velocity_004121_Oiv[limit_50_60_e_dens_004121_Oiv]) ;10

PRINT, "limit_50_60_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_50_60_e_dens_004121_Oiv] ;10

PRINT, "limit_50_60_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_50_60_e_dens_004121_Oiv] ;10

PRINT, "limit_50_60_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_50_60_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_50_60_e_dens_004121_Oiv] ;10

;40-50 km/s velocity lines
limit_40_50_e_dens_004121_Oiv = WHERE((limit_vel_width_004121_Oiv GE 40) AND (limit_p_int_Oiv GE new_peak_min) AND (limit_vel_width_004121_Oiv LE 50) AND (limit_lw_Oiv GE 0) AND (limit_sig_p_int_Oiv GE 0) AND (limit_sig_lw_Oiv GE 0) AND (ABS(limit_velocity_004121_Oiv LE (limit_gamma_004121_Oiv/limit_wave0_004121_Oiv) * 3e5)), COMPLEMENT = not_limit_Oiv_40_50_e_dens_004121, count, /NULL)
PRINT, "limit_40_50_e_dens_004121_Oiv--limit_vel_width_Oiv"
PRINT, N_ELEMENTS(limit_vel_width_004121_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, limit_vel_width_004121_Oiv[limit_40_50_e_dens_004121_Oiv] ;23

PRINT, "limit_40_50_e_dens_004121_Oiv--limit_p_int_Oiv"
PRINT, N_ELEMENTS(limit_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, limit_p_int_Oiv[limit_40_50_e_dens_004121_Oiv] ;23

PRINT, "limit_40_50_e_dens_004121_Oiv--limit_velocity_Oiv"
PRINT, N_ELEMENTS(limit_velocity_004121_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, ABS(limit_velocity_004121_Oiv[limit_40_50_e_dens_004121_Oiv]) ;23

PRINT, "limit_40_50_e_dens_004121_Oiv--limit_lw_Oiv"
PRINT, N_ELEMENTS(limit_lw_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, limit_lw_Oiv[limit_40_50_e_dens_004121_Oiv] ;23

PRINT, "limit_40_50_e_dens_004121_Oiv--limit_sig_p_int_Oiv"
PRINT, N_ELEMENTS(limit_sig_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, limit_sig_p_int_Oiv[limit_40_50_e_dens_004121_Oiv] ;23

PRINT, "limit_40_50_e_dens_004121_Oiv--limit_sig_lw_Oiv"
PRINT, N_ELEMENTS(limit_sig_lw_Oiv[limit_40_50_e_dens_004121_Oiv])
PRINT, limit_sig_lw_Oiv[limit_40_50_e_dens_004121_Oiv] ;23

;calculate total integrated intensity (TII) 80-1000 km/s

;limit_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_e_dens_004121_Oiv]*limit_lw_Oiv[limit_e_dens_004121_Oiv]) ;total integrated intensity 
;PRINT, "limit_It_O_004121"
;PRINT, limit_It_O_004121

;calculate integrated intensity uncertainty 80-1000 km/s

;limit_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_e_dens_004121_Oiv])^2)]^0.5
;PRINT, "limit_int_int_unc_O_004121"
;PRINT, limit_int_int_unc_O_004121

;PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR 80-1000 km/s

;limit_SNR_0_O_004121 = (limit_It_O_004121/limit_int_int_unc_O_004121)
;PRINT, "limit_SNR_0_O_004121"
;PRINT, limit_SNR_0_O_004121

;PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement 80-1000 km/s

;neg = -0.5
;limit_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_e_dens_004121_Oiv])^2))^neg
;PRINT, "limit_SNR_O_004121"
;PRINT, limit_SNR_O_004121

;PRINT, SIZE(limit_SNR_O_004121) ;2
;limit_SNR2_O_004121 = WHERE((limit_SNR_O_004121 LT 100), count) ;removes infinity
;PRINT, SIZE(limit_SNR_O_004121[limit_SNR2_O_004121]) ;2

;calculate total integrated intensity (TII) 70-80 km/s

;limit_70_80_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_70_80_e_dens_004121_Oiv]*limit_lw_Oiv[limit_70_80_e_dens_004121_Oiv]) ;total integrated intensity 
;PRINT, "limit_70_80_It_O_004121"
;PRINT, limit_70_80_It_O_004121

;calculate integrated intensity uncertainty 70-80 km/s

;limit_70_80_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_70_80_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_70_80_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])^2)]^0.5
;PRINT, "limit_70_80_int_int_unc_O_004121"
;PRINT, limit_70_80_int_int_unc_O_004121

;PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR 70-80 km/s

;limit_70_80_SNR_0_O_004121 = (limit_70_80_It_O_004121/limit_70_80_int_int_unc_O_004121)
;PRINT, "limit_70_80_SNR_0_O_004121"
;PRINT, limit_70_80_SNR_0_O_004121

;PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement 70-80 km/s

;neg = -0.5
;limit_70_80_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_70_80_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_70_80_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_70_80_e_dens_004121_Oiv])^2))^neg
;PRINT, "limit_70_80_SNR_O_004121"
;PRINT, limit_70_80_SNR_O_004121

;PRINT, SIZE(limit_70_80_SNR_O_004121) ;1
;limit_70_80_SNR2_O_004121 = WHERE((limit_70_80_SNR_O_004121 LT 100), count) ;removes infinity
;PRINT, SIZE(limit_70_80_SNR_O_004121[limit_70_80_SNR2_O_004121]) ;1

;===============================================================================
;Quartile Work

BP = CREATEBOXPLOTDATA(limit_vel_width_004121_Oiv)
PRINT, 'BOXPLOT'
PRINT, BP ;0 = min, 1 = lower quartile, 2 = median, 3 = upper quartile, 4 = max 

PRINT, 'Median'
PRINT, 0.5*(N_ELEMENTS(limit_vel_width_004121_Oiv)+1)
PRINT, ((limit_vel_width_004121_Oiv[230]+limit_vel_width_004121_Oiv[231])/2)

PRINT, 'Lower'
PRINT, 0.25*(N_ELEMENTS(limit_vel_width_004121_Oiv)+1)
PRINT, limit_vel_width_004121_Oiv[116.250]
PRINT, ((limit_vel_width_004121_Oiv[212]+limit_vel_width_004121_Oiv[213])/2)

PRINT, 'Upper'
PRINT, 0.75*(N_ELEMENTS(limit_vel_width_004121_Oiv)+1)
PRINT, limit_vel_width_004121_Oiv[348.750]
PRINT, ((limit_vel_width_004121_Oiv[347]+limit_vel_width_004121_Oiv[348])/2)
;===============================================================================
;calculate total integrated intensity (TII) 60-70 km/s

;-------------------------------------------------------------------------------
;don't use this code b/c NULL will stop program
;limit_60_70_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]*limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv]) ;total integrated intensity 
;PRINT, "limit_60_70_It_O_004121"
;PRINT, limit_60_70_It_O_004121
;-------------------------------------------------------------------------------

;IF N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) EQ 0 THEN BEGIN
;   PRINT, 'FAILED'
;   CATCH, error_status
;   IF error_status NE 0 THEN BEGIN
;      PRINT, 'Error Index: ', error_status
;      PRINT, 'Error Message: ', !ERROR_STATE.MSG
;      CATCH, /CANCEL
;   ENDIF
;ENDIF

;IF N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) NE 0 THEN BEGIN
;   limit_60_70_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]*limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv]) ;total integrated intensity
;   PRINT, 'complete'
;ENDIF
   
;calculate integrated intensity uncertainty 60-70 km/s

;-------------------------------------------------------------------------------
;don't use this code b/c NULL will stop program
;limit_60_70_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2)]^0.5
;PRINT, "limit_60_70_int_int_unc_O_004121"
;PRINT, limit_60_70_int_int_unc_O_004121
;-------------------------------------------------------------------------------

;IF N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) EQ 0 THEN BEGIN
;   PRINT, 'FAILED'
;   CATCH, error_status
;   IF error_status NE 0 THEN BEGIN
;      CATCH, /CANCEL
;   ENDIF
;ENDIF

;IF N_ELEMENTS(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) NE 0 THEN BEGIN
;   limit_60_70_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2)]^0.5
;   PRINT, 'complete'
;ENDIF

;PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR 60-70 km/s

;-------------------------------------------------------------------------------
;don't use this code b/c NULL will stop program
;limit_60_70_SNR_0_O_004121 = (limit_60_70_It_O_004121/limit_60_70_int_int_unc_O_004121)
;PRINT, "limit_60_70_SNR_0_O_004121"
;PRINT, limit_60_70_SNR_0_O_004121
;-------------------------------------------------------------------------------

;IF N_ELEMENTS(limit_60_70_It_O_004121) EQ 0 THEN BEGIN
;   PRINT, 'FAILED'
;   CATCH, error_status
;   IF error_status NE 0 THEN BEGIN
;      CATCH, /CANCEL
;   ENDIF
;ENDIF

;IF N_ELEMENTS(limit_60_70_It_O_004121) NE 0 THEN BEGIN
;   limit_60_70_SNR_0_O_004121 = (limit_60_70_It_O_004121/limit_60_70_int_int_unc_O_004121)
;   PRINT, 'complete'
;ENDIF

;PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement 60-70 km/s

;neg = -0.5
;-------------------------------------------------------------------------------
;don't use this code b/c NULL will stop program
;limit_60_70_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2))^neg
;PRINT, "limit_60_70_SNR_O_004121"
;PRINT, limit_60_70_SNR_O_004121
;-------------------------------------------------------------------------------

;IF N_ELEMENTS(limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) EQ 0 THEN BEGIN
;   PRINT, 'FAILED'
;   CATCH, error_status
;   IF error_status NE 0 THEN BEGIN
;      CATCH, /CANCEL
;   ENDIF
;ENDIF

;IF N_ELEMENTS(limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv]) NE 0 THEN BEGIN
;   limit_60_70_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_60_70_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_60_70_e_dens_004121_Oiv])^2))^neg
;   PRINT, 'complete'
;ENDIF

;-------------------------------------------------------------------------------
;don't use this code b/c NULL will stop program
;PRINT, SIZE(limit_60_70_SNR_O_004121) ;1
;limit_60_70_SNR2_O_004121 = WHERE((limit_60_70_SNR_O_004121 LT 100), count) ;removes infinity
;PRINT, SIZE(limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121]) ;1
;-------------------------------------------------------------------------------

;IF N_ELEMENTS(limit_60_70_SNR_O_004121) EQ 0 THEN BEGIN
;   PRINT, 'ZERO'
;   CATCH, error_status
;   IF error_status NE 0 THEN BEGIN
;      CATCH, /CANCEL
;   ENDIF
;ENDIF

;IF N_ELEMENTS(limit_60_70_SNR_O_004121) NE 0 THEN BEGIN
;   PRINT, SIZE(limit_60_70_SNR_O_004121)
;   limit_60_70_SNR2_O_004121 = WHERE((limit_60_70_SNR_O_004121 LT 100), count) ;removes infinity
;   PRINT, SIZE(limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121])
;   PRINT, 'complete'
;ENDIF

;calculate total integrated intensity (TII) 50-60 km/s

;limit_50_60_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_50_60_e_dens_004121_Oiv]*limit_lw_Oiv[limit_50_60_e_dens_004121_Oiv]) ;total integrated intensity 
;PRINT, "limit_50_60_It_O_004121"
;PRINT, limit_50_60_It_O_004121

;calculate integrated intensity uncertainty 50-60 km/s

;limit_50_60_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_50_60_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_50_60_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])^2)]^0.5
;PRINT, "limit_50_60_int_int_unc_O_004121"
;PRINT, limit_50_60_int_int_unc_O_004121

;PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR 50-60 km/s

;limit_50_60_SNR_0_O_004121 = (limit_50_60_It_O_004121/limit_50_60_int_int_unc_O_004121)
;PRINT, "limit_50_60_SNR_0_O_004121"
;PRINT, limit_50_60_SNR_0_O_004121

;PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement 50-60 km/s

;neg = -0.5
;limit_50_60_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_50_60_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_50_60_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_50_60_e_dens_004121_Oiv])^2))^neg
;PRINT, "limit_50_60_SNR_O_004121"
;PRINT, limit_50_60_SNR_O_004121

;PRINT, SIZE(limit_50_60_SNR_O_004121) ;10
;limit_50_60_SNR2_O_004121 = WHERE((limit_50_60_SNR_O_004121 LT 100), count) ;removes infinity
;PRINT, SIZE(limit_50_60_SNR_O_004121[limit_50_60_SNR2_O_004121]) ;10

;calculate total integrated intensity (TII) 40-50 km/s

;limit_40_50_It_O_004121 = (sqrt(2.0*!dpi)*limit_p_int_Oiv[limit_40_50_e_dens_004121_Oiv]*limit_lw_Oiv[limit_40_50_e_dens_004121_Oiv]) ;total integrated intensity 
;PRINT, "limit_40_50_It_O_004121"
;PRINT, limit_40_50_It_O_004121

;calculate integrated intensity uncertainty 40-50 km/s

;limit_40_50_int_int_unc_O_004121 = [2.0*!dpi*((limit_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])^2*(limit_sig_lw_Oiv[limit_40_50_e_dens_004121_Oiv])^2+(limit_lw_Oiv[limit_40_50_e_dens_004121_Oiv])^2*(limit_sig_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])^2)]^0.5
;PRINT, "limit_40_50_int_int_unc_O_004121"
;PRINT, limit_40_50_int_int_unc_O_004121

;PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR 40-50 km/s

;limit_40_50_SNR_0_O_004121 = (limit_40_50_It_O_004121/limit_40_50_int_int_unc_O_004121)
;PRINT, "limit_40_50_SNR_0_O_004121"
;PRINT, limit_40_50_SNR_0_O_004121

;PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement 40-50 km/s

;neg = -0.5
;limit_40_50_SNR_O_004121 = (((limit_sig_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])^2/(limit_p_int_Oiv[limit_40_50_e_dens_004121_Oiv])^2)+((limit_sig_lw_Oiv[limit_40_50_e_dens_004121_Oiv])^2/(limit_lw_Oiv[limit_40_50_e_dens_004121_Oiv])^2))^neg
;PRINT, "limit_40_50_SNR_O_004121"
;PRINT, limit_40_50_SNR_O_004121

;PRINT, SIZE(limit_40_50_SNR_O_004121) ;23
;limit_40_50_SNR2_O_004121 = WHERE((limit_40_50_SNR_O_004121 LT 100), count) ;removes infinity
;PRINT, SIZE(limit_40_50_SNR_O_004121[limit_40_50_SNR2_O_004121]) ;23

;save parameters from FOR loop

;sav = [limit_60_70_e_dens_004121_Oiv, limit_60_70_It_O_004121, limit_60_70_int_int_unc_O_004121, limit_60_70_SNR_0_O_004121, limit_60_70_SNR_O_004121, limit_60_70_SNR2_O_004121]

;IF sav NE 0 THEN BEGIN
sfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/limit_sigma_coeff_arr_004121_Oiv.sav'
SAVE, limit_all_e_dens_004121_Oiv, limit_e_dens_004121_Oiv, limit_70_80_e_dens_004121_Oiv, limit_60_70_e_dens_004121_Oiv, limit_50_60_e_dens_004121_Oiv, limit_40_50_e_dens_004121_Oiv, limit_vel_width_004121_Oiv, limit_velocity_004121_Oiv, p_int, sig_lw, lw, sig_p_int, testt, FILENAME = sfname2_limit

;limit_It_O_004121, limit_int_int_unc_O_004121, limit_SNR_0_O_004121, limit_SNR_O_004121, limit_SNR2_O_004121, limit_70_80_It_O_004121, limit_70_80_int_int_unc_O_004121, limit_70_80_SNR_0_O_004121, limit_70_80_SNR_O_004121, limit_70_80_SNR2_O_004121, limit_60_70_It_O_004121, limit_60_70_int_int_unc_O_004121, limit_60_70_SNR_0_O_004121, limit_60_70_SNR_O_004121, limit_60_70_SNR2_O_004121, limit_50_60_It_O_004121, limit_50_60_int_int_unc_O_004121, limit_50_60_SNR_0_O_004121, limit_50_60_SNR_O_004121, limit_50_60_SNR2_O_004121, limit_40_50_It_O_004121, limit_40_50_int_int_unc_O_004121, limit_40_50_SNR_0_O_004121, limit_40_50_SNR_O_004121, limit_40_50_SNR2_O_004121,
;ENDIF

;PRINT, 'CONTINUE'

;===============================================================================
;calculate total integrated intensity (TII)

It_O_004121 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, "It_O_004121"
PRINT, It_O_004121
PRINT, SIZE(It_O_004121) ;1D,464

;calculate integrated intensity uncertainty

int_int_unc_O_004121 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, "int_int_unc_O_004121"
PRINT, int_int_unc_O_004121
PRINT, SIZE(int_int_unc_O_004121) ;1D,464

PRINT, 'SNR by dividing total integrated intensity by uncertainty'

;calculate SNR

SNR_0_O_004121 = (It_O_004121/int_int_unc_O_004121)
PRINT, SNR_0_O_004121

PRINT, 'SNR rearrangement'

;calculate SNR after rearrangement

neg = -0.5
SNR_O_004121 = (((sig_p_int)^2/(p_int)^2)+((sig_lw)^2/(lw)^2))^neg
PRINT, SNR_O_004121

PRINT, SIZE(SNR_O_004121) ;1D,464
SNR2_O_004121 = WHERE((SNR_O_004121 LT 100), count) ;removes infinity
PRINT, SIZE(SNR_O_004121[SNR2_O_004121]) ;1D,464

;make histogram of SNRs and frequencies at which they occur

SNR_hist = HISTOGRAM(SNR_O_004121[SNR2_O_004121], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_004121"
OPLOT, HISTOGRAM(SNR_O_004121[SNR2_O_004121], BINSIZE = 0.5), COLOR = 150

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(SNR_O_004121[SNR2_O_004121], BINSIZE = 0.5, LOCATION = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Histogram of Signal-to-Noise of AR11974_004121", XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/histogram_004121.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/histogram_004121.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(SNR_O_004121[SNR2_O_004121], BINSIZE = 0.5, LOCATION = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, THICK = 4

DEVICE, /CLOSE

;other useful information from the SNR calculations

PRINT, 'MIN: ', MIN(SNR_O_004121[SNR2_O_004121])
PRINT, 'MAX: ', MAX(SNR_O_004121[SNR2_O_004121])
PRINT, 'MODE: ', WHERE(SNR_O_004121[SNR2_O_004121] EQ MAX(SNR_O_004121[SNR2_O_004121]), count) + MIN(SNR_O_004121[SNR2_O_004121])
PRINT, 'MEDIAN: ', MEDIAN(SNR_O_004121[SNR2_O_004121])

MOM = MOMENT(SNR_O_004121[SNR2_O_004121])
PRINT, 'MEAN: ', MOM[0] & PRINT, 'VARIANCE: ', MOM[1] & PRINT, 'SKEWNESS: ', MOM[2] & PRINT, 'KURTOSIS: ', MOM[3]

;save parameters from FOR loop

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
SAVE, coeff_004121_Oiv2, inst_unc_O_004121, sigma_coeff, sigma_coeff_arr, coeff_arr_004121_Oiv2, It_O_004121, int_int_unc_O_004121, SNR_0_O_004121, SNR_O_004121, SNR2_O_004121, FILENAME = sfname2

OBJ_DESTROY, dataRast_004121_Oiv
OBJ_DESTROY, data1400_004121_Oiv

END
