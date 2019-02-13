;+
;Name: isolate_201925.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/09
;USING INDICES FROM CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION
;REGION, THEN MANUALLY ITERATING THROUGH SPECTRA LOOKING FOR SIGNS OF NI II
;ABSORPTION TO USE FOR ANALYSIS PART OF PROJECT.

;PRO isolate_201925

;restore variables

;rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/all_vars_201925.sav'
;RESTORE, rfname

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

;raster_201925 = N_ELEMENTS(nspectraRast1394_201925[0,0,*]) ;400
;yposition_201925 = N_ELEMENTS(nspectraRast1394_201925[0,*,0]) ;1093
;PRINT, yposition_201925

;cut_ind_ry_201925 = ARRAY_INDICES([raster_201925,yposition_201925], cut_ind_201925, /DIMENSIONS)
;PRINT, SIZE(cut_ind_ry_201925) ;2D,2,7311 where 2 is [raster,ypos]

;cut_ind_r_201925 = REFORM(cut_ind_ry_201925[0,*]) ;1D 7311
;PRINT, SIZE(cut_ind_r_201925)
;cut_ind_y_201925 = REFORM(cut_ind_ry_201925[1,*]) ;1D 7311
;PRINT, SIZE(cut_ind_y_201925)

;pull out all green rectangle UVB pop. indices

;cut_size_201925 = N_ELEMENTS(cut_ind_201925) ;7311
;PRINT, cut_size_201925
;cut_ind_r_s_201925 = N_ELEMENTS(cut_ind_r_201925) ;7311
;PRINT, cut_ind_r_s_201925
;cut_ind_y_s_201925 = N_ELEMENTS(cut_ind_y_201925) ;7311
;PRINT, cut_ind_y_s_201925

;is_absorb_201925 = LONARR(cut_size_201925)

;TIC
;FOR i = 0, cut_size_201925-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_201925[19:173], REFORM(nspectraRast1394_201925[*,cut_ind_y_201925[i],cut_ind_r_201925[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	PLOTS, [1393.35,1393.35], !Y.CRANGE, COLOR = 170, THICK = 3, LINESTYLE = 1
;	ch = ''
;	PRINT, i
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_201925[i] = 1
;		ind_absorb_201925 = WHERE(is_absorb_201925 EQ 1)
;		UVB_ind_201925 = cut_ind_201925[ind_absorb_201925]
;		ENDIF
;		IF ch EQ 'q' THEN BREAK
;ENDFOR
;PRINT, 'VALUE LEFT OFF: ', i
;TOC ;1.47 hrs

;save new params

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_201925.sav'
;SAVE, UVB_ind_201925, is_absorb_201925, ind_absorb_201925, FILENAME = sfname

;sfname_safe = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_safe_201925.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_safe_201925.sav'
RESTORE, rfname2

;rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_201925.sav'
;RESTORE, rfname3

;===============================================================================

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_201925_UV = N_ELEMENTS(nspectraRast1394_201925[0,0,*]) ;400
yposition_201925_UV = N_ELEMENTS(nspectraRast1394_201925[0,*,0]) ;1093

UVB_ind_ry_201925_UV = ARRAY_INDICES([raster_201925_UV,yposition_201925_UV], UVB_ind_201925, /DIMENSIONS)
PRINT, SIZE(UVB_ind_ry_201925_UV) ;2D,2,660 where 2 is [raster,ypos]

UVB_ind_r_201925_UV = REFORM(UVB_ind_ry_201925_UV[0,*]) ;1D 660
UVB_ind_y_201925_UV = REFORM(UVB_ind_ry_201925_UV[1,*]) ;1D 660

;pull out all grenn rectangle UVB pop. indices

UVB_size_201925_UV = N_ELEMENTS(UVB_ind_201925) ;660
UVB_ind_r_s_201925_UV = N_ELEMENTS(UVB_ind_r_201925_UV) ;660
UVB_ind_y_s_201925_UV = N_ELEMENTS(UVB_ind_y_201925_UV) ;660

;calculate total integrated intensity

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 2.0
inst_unc_Si_201925 = [ABS((REFORM(nspectraRast1394_201925[*,UVB_ind_y_201925_UV,UVB_ind_r_201925_UV]))/(g*dt))+R]^0.5

coeff_arr_201925_UV = DBLARR(4,UVB_size_201925_UV)
sigma_coeff_arr = DBLARR(4,UVB_size_201925_UV)

TIC
FOR i = 0, UVB_size_201925_UV-1 DO BEGIN
	PLOT, lambda1394_201925[19:173], REFORM(nspectraRast1394_201925[*,UVB_ind_y_201925_UV[i],UVB_ind_r_201925_UV[i]]), XRANGE = [1392.2,1395.3], TITLE = 'AR11974_201925_UV Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_201925_UV = MPFITPEAK(lambda1394_201925[19:173], REFORM(nspectraRast1394_201925[*,UVB_ind_y_201925_UV[i],UVB_ind_r_201925_UV[i]]), coeff_201925_UV, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_Si_201925[*,i,i])
	OPLOT, lambda1394_201925[19:173], REFORM(YFIT_201925_UV), COLOR = 170, LINESTYLE = 2, THICK = 5
	coeff_arr_201925_UV[*,i] = coeff_201925_UV
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~2.93 sec

p_int = coeff_arr_201925_UV[0,*,*]
sig_lw = sigma_coeff_arr[2,*,*]
lw = coeff_arr_201925_UV[2,*,*]
sig_p_int = sigma_coeff_arr[0,*,*]

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (need gamma_201925 & wave0_201925)--in rfname2

limit_gamma_201925 = gamma_201925
limit_wave0_201925 = wave0_201925

limit_p_int = coeff_arr_201925_UV[0,*,*]
PRINT, "limit_p_int"
PRINT, N_ELEMENTS(limit_p_int) ;660
PRINT, limit_p_int

limit_sig_p_int = sigma_coeff_arr[0,*,*]
PRINT, "limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int) ;660
PRINT, limit_sig_p_int

limit_lw = coeff_arr_201925_UV[2,*,*]
PRINT, "limit_lw"
PRINT, N_ELEMENTS(limit_lw) ;660
PRINT, limit_lw

limit_sig_lw = sigma_coeff_arr[2,*,*]
PRINT, "limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw) ;660
PRINT, limit_sig_lw

limit_vel_width_201925 = (coeff_arr_201925_UV[2,*,*]/limit_wave0_201925) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_201925"
PRINT, N_ELEMENTS(limit_vel_width_201925) ;660
PRINT, limit_vel_width_201925

PRINT, 'TEST'
test = WHERE((limit_vel_width_201925 GE 0.0) AND (limit_vel_width_201925 LE 50.0), count)
PRINT, limit_vel_width_201925[test]
PRINT, MIN(limit_vel_width_201925[test]) ;40.012747

limit_velocity_201925 = ((coeff_arr_201925_UV[1,*,*]-limit_wave0_201925)/limit_wave0_201925) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_201925"
PRINT, N_ELEMENTS(limit_velocity_201925) ;660
PRINT, limit_velocity_201925

;highest velocity lines--80-1000 km/s
limit_e_dens_201925 = WHERE((limit_vel_width_201925 GE 80) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_201925 LE 1000) AND (limit_lw GE 0) AND (limit_sig_p_int GE 0) AND (limit_sig_lw GE 0) AND (ABS(limit_velocity_201925 LE (limit_gamma_201925/limit_wave0_201925) * 3e5)), COMPLEMENT = not_limit_e_dens_201925, count)
PRINT, "limit_e_dens_201925--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_201925[limit_e_dens_201925])
PRINT, limit_vel_width_201925[limit_e_dens_201925] ;213

PRINT, "limit_e_dens_201925--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_e_dens_201925])
PRINT, limit_p_int[limit_e_dens_201925] ;213

PRINT, "limit_e_dens_201925--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_201925[limit_e_dens_201925])
PRINT, ABS(limit_velocity_201925[limit_e_dens_201925]) ;213

PRINT, "limit_e_dens_201925--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_e_dens_201925])
PRINT, limit_lw[limit_e_dens_201925] ;213

PRINT, "limit_e_dens_201925--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_e_dens_201925])
PRINT, limit_sig_p_int[limit_e_dens_201925] ;213

PRINT, "limit_e_dens_201925--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_e_dens_201925])
PRINT, limit_sig_lw[limit_e_dens_201925] ;213

;70.0-80.0 km/s velocity lines
limit_70_80_e_dens_201925 = WHERE((limit_vel_width_201925 GE 70.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_201925 LE 80.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_201925 LE (limit_gamma_201925/limit_wave0_201925) * 3e5)), COMPLEMENT = not_limit_med_70_80_e_dens_201925, count)
PRINT, "limit_70_80_e_dens_201925--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_201925[limit_70_80_e_dens_201925])
PRINT, limit_vel_width_201925[limit_70_80_e_dens_201925] ;119

PRINT, "limit_70_80_e_dens_201925--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_70_80_e_dens_201925])
PRINT, limit_p_int[limit_70_80_e_dens_201925] ;119

PRINT, "limit_70_80_e_dens_201925--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_201925[limit_70_80_e_dens_201925])
PRINT, ABS(limit_velocity_201925[limit_70_80_e_dens_201925]) ;119

PRINT, "limit_70_80_e_dens_201925--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_70_80_e_dens_201925])
PRINT, limit_lw[limit_70_80_e_dens_201925] ;119

PRINT, "limit_70_80_e_dens_201925--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_70_80_e_dens_201925])
PRINT, limit_sig_p_int[limit_70_80_e_dens_201925] ;119

PRINT, "limit_70_80_e_dens_201925--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_70_80_e_dens_201925])
PRINT, limit_sig_lw[limit_70_80_e_dens_201925] ;119

;60.0-70.0 km/s velocity lines
limit_60_70_e_dens_201925 = WHERE((limit_vel_width_201925 GE 60.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_201925 LE 70.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_201925 LE (limit_gamma_201925/limit_wave0_201925) * 3e5)), COMPLEMENT = not_limit_60_70_e_dens_201925, count)
PRINT, "limit_60_70_e_dens_201925--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_201925[limit_60_70_e_dens_201925])
PRINT, limit_vel_width_201925[limit_60_70_e_dens_201925] ;143

PRINT, "limit_60_70_e_dens_201925--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_60_70_e_dens_201925])
PRINT, limit_p_int[limit_60_70_e_dens_201925] ;143

PRINT, "limit_60_70_e_dens_201925--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_201925[limit_60_70_e_dens_201925])
PRINT, ABS(limit_velocity_201925[limit_60_70_e_dens_201925]) ;143

PRINT, "limit_60_70_e_dens_201925--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_60_70_e_dens_201925])
PRINT, limit_lw[limit_60_70_e_dens_201925] ;143

PRINT, "limit_60_70_e_dens_201925--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_60_70_e_dens_201925])
PRINT, limit_sig_p_int[limit_60_70_e_dens_201925] ;143

PRINT, "limit_60_70_e_dens_201925--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_60_70_e_dens_201925])
PRINT, limit_sig_lw[limit_60_70_e_dens_201925] ;143

;50.0-60.0 km/s velocity lines
limit_50_60_e_dens_201925 = WHERE((limit_vel_width_201925 GE 50.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_201925 LE 60.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_201925 LE (limit_gamma_201925/limit_wave0_201925) * 3e5)), COMPLEMENT = not_limit_50_60_e_dens_201925, count)
PRINT, "limit_50_60_e_dens_201925--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_201925[limit_50_60_e_dens_201925])
PRINT, limit_vel_width_201925[limit_50_60_e_dens_201925] ;123

PRINT, "limit_50_60_e_dens_201925--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_50_60_e_dens_201925])
PRINT, limit_p_int[limit_50_60_e_dens_201925] ;123

PRINT, "limit_50_60_e_dens_201925--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_201925[limit_50_60_e_dens_201925])
PRINT, ABS(limit_velocity_201925[limit_50_60_e_dens_201925]) ;123

PRINT, "limit_50_60_e_dens_201925--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_50_60_e_dens_201925])
PRINT, limit_lw[limit_50_60_e_dens_201925] ;123

PRINT, "limit_50_60_e_dens_201925--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_50_60_e_dens_201925])
PRINT, limit_sig_p_int[limit_50_60_e_dens_201925] ;123

PRINT, "limit_50_60_e_dens_201925--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_50_60_e_dens_201925])
PRINT, limit_sig_lw[limit_50_60_e_dens_201925] ;123

;40.0-50.0 km/s velocity lines
limit_40_50_e_dens_201925 = WHERE((limit_vel_width_201925 GE 40.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_201925 LE 50.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_201925 LE (limit_gamma_201925/limit_wave0_201925) * 3e5)), COMPLEMENT = not_limit_40_50_e_dens_201925, count)
PRINT, "limit_40_50_e_dens_201925--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_201925[limit_40_50_e_dens_201925])
PRINT, limit_vel_width_201925[limit_40_50_e_dens_201925] ;62

PRINT, "limit_40_50_e_dens_201925--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_40_50_e_dens_201925])
PRINT, limit_p_int[limit_40_50_e_dens_201925] ;62

PRINT, "limit_40_50_e_dens_201925--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_201925[limit_40_50_e_dens_201925])
PRINT, ABS(limit_velocity_201925[limit_40_50_e_dens_201925]) ;62

PRINT, "limit_40_50_e_dens_201925--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_40_50_e_dens_201925])
PRINT, limit_lw[limit_40_50_e_dens_201925] ;62

PRINT, "limit_40_50_e_dens_201925--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_40_50_e_dens_201925])
PRINT, limit_sig_p_int[limit_40_50_e_dens_201925] ;62

PRINT, "limit_40_50_e_dens_201925--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_40_50_e_dens_201925])
PRINT, limit_sig_lw[limit_40_50_e_dens_201925] ;62

;calculate total integrated intensity 80-1000 km/s

limit_It_Si_201925 = (sqrt(2.0*!dpi)*limit_p_int[limit_e_dens_201925]*limit_lw[limit_e_dens_201925]) ;total integrated intensity 
PRINT, "limit_It_Si_201925"
PRINT, limit_It_Si_201925

;calculate integrated intensity uncertainty 80-1000 km/s

limit_int_int_unc_Si_201925 = [2.0*!dpi*((limit_p_int[limit_e_dens_201925])^2*(limit_sig_lw[limit_e_dens_201925])^2+(limit_lw[limit_e_dens_201925])^2*(limit_sig_p_int[limit_e_dens_201925])^2)]^0.5
PRINT, "limit_int_int_unc_Si_201925"
PRINT, limit_int_int_unc_Si_201925

;calculate total integrated intensity 70-80 km/s

limit_70_80_It_Si_201925 = (sqrt(2.0*!dpi)*limit_p_int[limit_70_80_e_dens_201925]*limit_lw[limit_70_80_e_dens_201925]) ;total integrated intensity 
PRINT, "limit_70_80_It_Si_201925"
PRINT, limit_70_80_It_Si_201925

;calculate integrated intensity uncertainty 70-80 km/s

limit_70_80_int_int_unc_Si_201925 = [2.0*!dpi*((limit_p_int[limit_70_80_e_dens_201925])^2*(limit_sig_lw[limit_70_80_e_dens_201925])^2+(limit_lw[limit_70_80_e_dens_201925])^2*(limit_sig_p_int[limit_70_80_e_dens_201925])^2)]^0.5
PRINT, "limit_70_80_int_int_unc_Si_201925"
PRINT, limit_70_80_int_int_unc_Si_201925

;calculate total integrated intensity 60-70 km/s

limit_60_70_It_Si_201925 = (sqrt(2.0*!dpi)*limit_p_int[limit_60_70_e_dens_201925]*limit_lw[limit_60_70_e_dens_201925]) ;total integrated intensity 
PRINT, "limit_60_70_It_Si_201925"
PRINT, limit_60_70_It_Si_201925

;calculate integrated intensity uncertainty 60-70 km/s

limit_60_70_int_int_unc_Si_201925 = [2.0*!dpi*((limit_p_int[limit_60_70_e_dens_201925])^2*(limit_sig_lw[limit_60_70_e_dens_201925])^2+(limit_lw[limit_60_70_e_dens_201925])^2*(limit_sig_p_int[limit_60_70_e_dens_201925])^2)]^0.5
PRINT, "limit_60_70_int_int_unc_Si_201925"
PRINT, limit_60_70_int_int_unc_Si_201925

;calculate total integrated intensity 50-60 km/s

limit_50_60_It_Si_201925 = (sqrt(2.0*!dpi)*limit_p_int[limit_50_60_e_dens_201925]*limit_lw[limit_50_60_e_dens_201925]) ;total integrated intensity 
PRINT, "limit_50_60_It_Si_201925"
PRINT, limit_50_60_It_Si_201925

;calculate integrated intensity uncertainty 50-60 km/s

limit_50_60_int_int_unc_Si_201925 = [2.0*!dpi*((limit_p_int[limit_50_60_e_dens_201925])^2*(limit_sig_lw[limit_50_60_e_dens_201925])^2+(limit_lw[limit_50_60_e_dens_201925])^2*(limit_sig_p_int[limit_50_60_e_dens_201925])^2)]^0.5
PRINT, "limit_50_60_int_int_unc_Si_201925"
PRINT, limit_50_60_int_int_unc_Si_201925

;calculate total integrated intensity 40-50 km/s

limit_40_50_It_Si_201925 = (sqrt(2.0*!dpi)*limit_p_int[limit_40_50_e_dens_201925]*limit_lw[limit_40_50_e_dens_201925]) ;total integrated intensity 
PRINT, "limit_40_50_It_Si_201925"
PRINT, limit_40_50_It_Si_201925

;calculate integrated intensity uncertainty 40-50 km/s

limit_40_50_int_int_unc_Si_201925 = [2.0*!dpi*((limit_p_int[limit_40_50_e_dens_201925])^2*(limit_sig_lw[limit_40_50_e_dens_201925])^2+(limit_lw[limit_40_50_e_dens_201925])^2*(limit_sig_p_int[limit_40_50_e_dens_201925])^2)]^0.5
PRINT, "limit_40_50_int_int_unc_Si_201925"
PRINT, limit_40_50_int_int_unc_Si_201925

;save parameters from FOR loop

sfname_UV_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/limit_IT_UV_201925.sav'
SAVE, limit_e_dens_201925, limit_It_Si_201925, limit_int_int_unc_Si_201925, limit_70_80_e_dens_201925, limit_70_80_It_Si_201925, limit_70_80_int_int_unc_Si_201925, limit_60_70_e_dens_201925, limit_60_70_It_Si_201925, limit_60_70_int_int_unc_Si_201925, limit_50_60_e_dens_201925, limit_50_60_It_Si_201925, limit_50_60_int_int_unc_Si_201925, limit_40_50_e_dens_201925, limit_40_50_It_Si_201925, limit_40_50_int_int_unc_Si_201925, FILENAME = sfname_UV_limit

;===============================================================================
;calculate total integrated intensity

It_Si_201925 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, It_Si_201925

;calculate integrated intensity uncertainty

int_int_unc_Si_201925 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_Si_201925

;save parameters from FOR loop

sfname_UV = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
SAVE, coeff_201925_UV, inst_unc_Si_201925, sigma_coeff, sigma_coeff_arr, coeff_arr_201925_UV, It_Si_201925, int_int_unc_Si_201925, FILENAME = sfname_UV

;===============================================================================

;for pres

;raster_pres = N_ELEMENTS(nspectraRast1394_201925[0,0,*])
;yposition_pres = N_ELEMENTS(nspectraRast1394_201925[0,*,0])

;pres = ARRAY_INDICES([raster_pres,yposition_pres], UVB_ind_201925, /DIMENSIONS)

;pres_r = REFORM(pres[0,*])
;pres_y = REFORM(pres[1,*])

;420, 424, 429, 430, 431
;prof = REFORM(nspectraRast1394_201925[*,pres_y[431],pres_r[431]])

;WINDOW, XSIZE = 900, YSIZE = 700
;PLOT, lambda1394_201925[19:173], prof, TITLE = 'AR11974_201925 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/annotate_201925.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_201925[19:173], avg_fit_201925, COLOR = 255, THICK = 4

;save as png

;TVLCT, [[255], [255], [255]], 2
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;PLOT, lambda1394_201925[19:173], prof, TITLE = 'AR11974_201925 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45, COLOR = 2

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/annotate_201925.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_201925[19:173], avg_fit_201925, COLOR = 255, THICK = 4

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/funky_201925.png', screenshot

;save as ps

;!P.FONT = 1 ;true font option

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/funky_201925.eps', /ENCAPSULATED

;TVLCT, [[0], [0], [0]], 1
;PLOT, lambda1394_201925[19:173], prof, TITLE = 'AR11974_201925 Si IV 1393.8 '+STRING("305B)+' Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, COLOR = 1, XTHICK = 10, YTHICK = 10

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_201925[19:173], avg_fit_201925, COLOR = 255, THICK = 4

;DEVICE, /CLOSE

;===============================================================================

;byte-scaling and saturation

sort_c_201925 = coeff_arr_201925[SORT(coeff_arr_201925)]
sort_c_201925 = sort_c_201925[WHERE(FINITE(sort_c_201925) OR (sort_c_201925 NE -200))]
n_sort_c_201925 = N_ELEMENTS(sort_c_201925)

;despike

coeff_arr_201925_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_201925[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_201925 = BYTSCL(coeff_arr_201925_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(byte_scale_201925[UVB_ind_201925]) ;1D 660

byte_scale_201925[UVB_ind_201925] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(byte_scale_201925)) ;2D,400,1093

PLOT_IMAGE, REFORM(byte_scale_201925), ORIGIN = [SolarX1400_201925[0], SolarY1400_201925[0]], SCALE = [ResX1400_201925, ResY1400_201925], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2

;EIS_COLORS, /INTENSITY

;TVLCT, rv, gv, bv, /GET
;rv[255] = 255
;gv[255] = 0
;bv[255] = 0

;TVLCT, rv, gv, bv

;PLOT_IMAGE, REFORM(byte_scale_201925), ORIGIN = [Solarx1400_201925[0], SolarY1400_201925[0]], SCALE = [resx1400_201925, resy1400_201925], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;TVLCT, [[255], [255], [255]], 1

;COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4, COLOR = 1

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/intensity_UVB_201925.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/intensity_UVB_201925.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_201925), ORIGIN = [solarx1400_201925[0], solary1400_201925[0]], SCALE = [resx1400_201925, resy1400_201925], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

OBJ_DESTROY, dataRast_201925
OBJ_DESTROY, data1400_201925

END
