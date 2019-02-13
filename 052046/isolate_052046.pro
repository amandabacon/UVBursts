;+
;Name: isolate_052046.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/09
;USING INDICES FROM CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION
;REGION, THEN MANUALLY ITERATING THROUGH SPECTRA LOOKING FOR SIGNS OF NI II
;ABSORPTION TO USE FOR ANALYSIS PART OF PROJECT.

;PRO isolate_052046

;restore variables

;rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/all_vars_052046.sav'
;RESTORE, rfname

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

;raster_052046 = N_ELEMENTS(nspectraRast1394_052046[0,0,*]) ;400
;yposition_052046 = N_ELEMENTS(nspectraRast1394_052046[0,*,0]) ;1092
;PRINT, yposition_052046

;cut_ind_ry_052046 = ARRAY_INDICES([raster_052046,yposition_052046], cut_ind_052046, /DIMENSIONS)
;PRINT, SIZE(cut_ind_ry_052046) ;2D,2,25552 where 2 is [raster,ypos]

;cut_ind_r_052046 = REFORM(cut_ind_ry_052046[0,*]) ;1D 25552
;PRINT, SIZE(cut_ind_r_052046)
;cut_ind_y_052046 = REFORM(cut_ind_ry_052046[1,*]) ;1D 25552
;PRINT, SIZE(cut_ind_y_052046)

;pull out all green rectangle UVB pop. indices

;cut_size_052046 = N_ELEMENTS(cut_ind_052046) ;25552
;PRINT, cut_size_052046
;cut_ind_r_s_052046 = N_ELEMENTS(cut_ind_r_052046) ;25552
;PRINT, cut_ind_r_s_052046
;cut_ind_y_s_052046 = N_ELEMENTS(cut_ind_y_052046) ;25552
;PRINT, cut_ind_y_s_052046

;is_absorb_052046 = LONARR(cut_size_052046)

;TIC
;FOR i = 0, cut_size_052046-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_052046[20:170], REFORM(nspectraRast1394_052046[*,cut_ind_y_052046[i],cut_ind_r_052046[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	PLOTS, [1393.35,1393.35], !Y.CRANGE, COLOR = 170, THICK = 3, LINESTYLE = 1
;	ch = ''
;	PRINT, i
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_052046[i] = 1
;		ind_absorb_052046 = WHERE(is_absorb_052046 EQ 1)
;		UVB_ind_052046 = cut_ind_052046[ind_absorb_052046]
;		ENDIF
;		sfname_test = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/test.sav'
;		SAVE, UVB_ind_052046, is_absorb_052046, ind_absorb_052046, FILENAME = sfname_test
;		IF ch EQ 'q' THEN BREAK
;ENDFOR
;PRINT, 'VALUE LEFT OFF: ', i
;TOC ; 5.57 hrs 7:13-12:48

;save new params

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_052046.sav'
;SAVE, UVB_ind_052046, is_absorb_052046, ind_absorb_052046, FILENAME = sfname

;sfname_safe = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_safe_052046.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_safe_052046.sav'
RESTORE, rfname2

;rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_052046.sav'
;RESTORE, rfname3

;===============================================================================
;getting mysterious absorption feature

;UVB_ind_ry = ARRAY_INDICES([raster_052046,yposition_052046], UVB_ind_052046, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry) ;2D,2,2534

;UVB_ind_r = REFORM(UVB_ind_ry[0,*]) ;1D 2534
;UVB_ind_y = REFORM(UVB_ind_ry[1,*]) ;1D 2534

;UVB_cut_size = N_ELEMENTS(UVB_ind_052046) ;2534

;is_absorb_clean = LONARR(UVB_cut_size)

;TIC
;FOR i = 0, UVB_cut_size-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_052046[20:170], REFORM(nspectraRast1394_052046[*,UVB_ind_y[i],UVB_ind_r[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	PLOTS, [1393.35,1393.35], !Y.CRANGE, COLOR = 170, THICK = 3, LINESTYLE = 1
;	ch = ''
;	PRINT, i
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_clean[i] = 1
;		ind_absorb_clean = WHERE(is_absorb_clean EQ 1)
;		UVB_ind_clean = UVB_ind_052046[ind_absorb_clean]
;		ENDIF
;ENDFOR
;TOC

;save new params

;sfname_safe_clean = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_safe_clean.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe_clean

;rfname_clean = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_safe_clean.sav'
;RESTORE, rfname_clean

;===============================================================================

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_052046_UV = N_ELEMENTS(nspectraRast1394_052046[0,0,*]) ;400
yposition_052046_UV = N_ELEMENTS(nspectraRast1394_052046[0,*,0]) ;1092

UVB_ind_ry_052046_UV = ARRAY_INDICES([raster_052046_UV,yposition_052046_UV], UVB_ind_052046, /DIMENSIONS)
PRINT, SIZE(UVB_ind_ry_052046_UV) ;2D,2,2811 where 2 is [raster,ypos]

UVB_ind_r_052046_UV = REFORM(UVB_ind_ry_052046_UV[0,*]) ;1D 2811
UVB_ind_y_052046_UV = REFORM(UVB_ind_ry_052046_UV[1,*]) ;1D 2811

;pull out all green rectangle UVB pop. indices

UVB_size_052046_UV = N_ELEMENTS(UVB_ind_052046) ;2811
UVB_ind_r_s_052046_UV = N_ELEMENTS(UVB_ind_r_052046_UV) ;2811
UVB_ind_y_s_052046_UV = N_ELEMENTS(UVB_ind_y_052046_UV) ;2811

;calculate total integrated intensity

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_Si_052046 = [ABS((REFORM(nspectraRast1394_052046[*,UVB_ind_y_052046_UV,UVB_ind_r_052046_UV]))/(g*dt))+R]^0.5

coeff_arr_052046_UV = DBLARR(4,UVB_size_052046_UV)
sigma_coeff_arr = DBLARR(4,UVB_size_052046_UV)

TIC
FOR i = 0, UVB_size_052046_UV-1 DO BEGIN
	PLOT, lambda1394_052046[20:170], REFORM(nspectraRast1394_052046[*,UVB_ind_y_052046_UV[i],UVB_ind_r_052046_UV[i]]), XRANGE = [1392.2,1395.3], TITLE = 'AR11974_052046_UV Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
;		CATCH, Error_status
;		IF Error_status NE 0 THEN BEGIN
;		PRINT, 'ERROR INDEX: ', Error_status
;		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
;		ENDIF
	YFIT_052046_UV = MPFITPEAK(lambda1394_052046[20:170], REFORM(nspectraRast1394_052046[*,UVB_ind_y_052046_UV[i],UVB_ind_r_052046_UV[i]]), coeff_052046_UV, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_Si_052046[*,i,i], STATUS = status, ERRMSG = errmsg)
;		IF STATUS LE 0 THEN message, errmsg
	OPLOT, lambda1394_052046[20:170], REFORM(YFIT_052046_UV), COLOR = 170, LINESTYLE = 2, THICK = 5
	coeff_arr_052046_UV[*,i] = coeff_052046_UV
	sigma_coeff_arr[*,i] = sigma_coeff 
;		CATCH, Error_status
;		IF Error_status NE 0 THEN BEGIN
;		PRINT, 'ERROR INDEX: ', Error_status
;		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
;		ENDIF 
ENDFOR
TOC ;Time elapsed: ~17.36 sec

p_int = coeff_arr_052046_UV[0,*,*]
sig_lw = sigma_coeff_arr[2,*,*]
lw = coeff_arr_052046_UV[2,*,*]
sig_p_int = sigma_coeff_arr[0,*,*]

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (need gamma_052046 & wave0_052046)--in rfname2

limit_gamma_052046 = gamma_052046
limit_wave0_052046 = wave0_052046

limit_p_int = coeff_arr_052046_UV[0,*,*]
PRINT, "limit_p_int"
PRINT, N_ELEMENTS(limit_p_int) ;2811
PRINT, limit_p_int

limit_sig_p_int = sigma_coeff_arr[0,*,*]
PRINT, "limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int) ;2811
PRINT, limit_sig_p_int

limit_lw = coeff_arr_052046_UV[2,*,*]
PRINT, "limit_lw"
PRINT, N_ELEMENTS(limit_lw) ;2811
PRINT, limit_lw

limit_sig_lw = sigma_coeff_arr[2,*,*]
PRINT, "limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw) ;2811
PRINT, limit_sig_lw

limit_vel_width_052046 = (coeff_arr_052046_UV[2,*,*]/limit_wave0_052046) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_052046"
PRINT, N_ELEMENTS(limit_vel_width_052046) ;2811
PRINT, limit_vel_width_052046

PRINT, 'TEST'
test = WHERE((limit_vel_width_052046 GE 0.0) AND (limit_vel_width_052046 LE 50.0), count)
PRINT, limit_vel_width_052046[test]
PRINT, MIN(limit_vel_width_052046[test]) ;40.041246

limit_velocity_052046 = ((coeff_arr_052046_UV[1,*,*]-limit_wave0_052046)/limit_wave0_052046) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_052046"
PRINT, N_ELEMENTS(limit_velocity_052046) ;2811
PRINT, limit_velocity_052046

;highest velocity lines--80-1000 km/s
limit_e_dens_052046 = WHERE((limit_vel_width_052046 GE 80) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_052046 LE 1000) AND (limit_lw GE 0) AND (limit_sig_p_int GE 0) AND (limit_sig_lw GE 0) AND (ABS(limit_velocity_052046 LE (limit_gamma_052046/limit_wave0_052046) * 3e5)), COMPLEMENT = not_limit_e_dens_052046, count)
PRINT, "limit_e_dens_052046--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_052046[limit_e_dens_052046])
PRINT, limit_vel_width_052046[limit_e_dens_052046] ;539

PRINT, "limit_e_dens_052046--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_e_dens_052046])
PRINT, limit_p_int[limit_e_dens_052046] ;539

PRINT, "limit_e_dens_052046--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_052046[limit_e_dens_052046])
PRINT, ABS(limit_velocity_052046[limit_e_dens_052046]) ;539

PRINT, "limit_e_dens_052046--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_e_dens_052046])
PRINT, limit_lw[limit_e_dens_052046] ;539

PRINT, "limit_e_dens_052046--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_e_dens_052046])
PRINT, limit_sig_p_int[limit_e_dens_052046] ;539

PRINT, "limit_e_dens_052046--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_e_dens_052046])
PRINT, limit_sig_lw[limit_e_dens_052046] ;539

;70.0-80.0 km/s velocity lines
limit_70_80_e_dens_052046 = WHERE((limit_vel_width_052046 GE 70.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_052046 LE 80.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_052046 LE (limit_gamma_052046/limit_wave0_052046) * 3e5)), COMPLEMENT = not_limit_med_70_80_e_dens_052046, count)
PRINT, "limit_70_80_e_dens_052046--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_052046[limit_70_80_e_dens_052046])
PRINT, limit_vel_width_052046[limit_70_80_e_dens_052046] ;308

PRINT, "limit_70_80_e_dens_052046--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_70_80_e_dens_052046])
PRINT, limit_p_int[limit_70_80_e_dens_052046] ;308

PRINT, "limit_70_80_e_dens_052046--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_052046[limit_70_80_e_dens_052046])
PRINT, ABS(limit_velocity_052046[limit_70_80_e_dens_052046]) ;308

PRINT, "limit_70_80_e_dens_052046--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_70_80_e_dens_052046])
PRINT, limit_lw[limit_70_80_e_dens_052046] ;308

PRINT, "limit_70_80_e_dens_052046--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_70_80_e_dens_052046])
PRINT, limit_sig_p_int[limit_70_80_e_dens_052046] ;308

PRINT, "limit_70_80_e_dens_052046--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_70_80_e_dens_052046])
PRINT, limit_sig_lw[limit_70_80_e_dens_052046] ;308

;60.0-70.0 km/s velocity lines
limit_60_70_e_dens_052046 = WHERE((limit_vel_width_052046 GE 60.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_052046 LE 70.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_052046 LE (limit_gamma_052046/limit_wave0_052046) * 3e5)), COMPLEMENT = not_limit_60_70_e_dens_052046, count)
PRINT, "limit_60_70_e_dens_052046--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_052046[limit_60_70_e_dens_052046])
PRINT, limit_vel_width_052046[limit_60_70_e_dens_052046] ;496

PRINT, "limit_60_70_e_dens_052046--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_60_70_e_dens_052046])
PRINT, limit_p_int[limit_60_70_e_dens_052046] ;496

PRINT, "limit_60_70_e_dens_052046--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_052046[limit_60_70_e_dens_052046])
PRINT, ABS(limit_velocity_052046[limit_60_70_e_dens_052046]) ;496

PRINT, "limit_60_70_e_dens_052046--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_60_70_e_dens_052046])
PRINT, limit_lw[limit_60_70_e_dens_052046] ;496

PRINT, "limit_60_70_e_dens_052046--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_60_70_e_dens_052046])
PRINT, limit_sig_p_int[limit_60_70_e_dens_052046] ;496

PRINT, "limit_60_70_e_dens_052046--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_60_70_e_dens_052046])
PRINT, limit_sig_lw[limit_60_70_e_dens_052046] ;496

;50.0-60.0 km/s velocity lines
limit_50_60_e_dens_052046 = WHERE((limit_vel_width_052046 GE 50.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_052046 LE 60.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_052046 LE (limit_gamma_052046/limit_wave0_052046) * 3e5)), COMPLEMENT = not_limit_50_60_e_dens_052046, count)
PRINT, "limit_50_60_e_dens_052046--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_052046[limit_50_60_e_dens_052046])
PRINT, limit_vel_width_052046[limit_50_60_e_dens_052046] ;706

PRINT, "limit_50_60_e_dens_052046--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_50_60_e_dens_052046])
PRINT, limit_p_int[limit_50_60_e_dens_052046] ;706

PRINT, "limit_50_60_e_dens_052046--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_052046[limit_50_60_e_dens_052046])
PRINT, ABS(limit_velocity_052046[limit_50_60_e_dens_052046]) ;706

PRINT, "limit_50_60_e_dens_052046--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_50_60_e_dens_052046])
PRINT, limit_lw[limit_50_60_e_dens_052046] ;706

PRINT, "limit_50_60_e_dens_052046--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_50_60_e_dens_052046])
PRINT, limit_sig_p_int[limit_50_60_e_dens_052046] ;706

PRINT, "limit_50_60_e_dens_052046--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_50_60_e_dens_052046])
PRINT, limit_sig_lw[limit_50_60_e_dens_052046] ;706

;40.0-50.0 km/s velocity lines
limit_40_50_e_dens_052046 = WHERE((limit_vel_width_052046 GE 40.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_052046 LE 50.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_052046 LE (limit_gamma_052046/limit_wave0_052046) * 3e5)), COMPLEMENT = not_limit_40_50_e_dens_052046, count)
PRINT, "limit_40_50_e_dens_052046--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_052046[limit_40_50_e_dens_052046])
PRINT, limit_vel_width_052046[limit_40_50_e_dens_052046] ;762

PRINT, "limit_40_50_e_dens_052046--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_40_50_e_dens_052046])
PRINT, limit_p_int[limit_40_50_e_dens_052046] ;762

PRINT, "limit_40_50_e_dens_052046--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_052046[limit_40_50_e_dens_052046])
PRINT, ABS(limit_velocity_052046[limit_40_50_e_dens_052046]) ;762

PRINT, "limit_40_50_e_dens_052046--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_40_50_e_dens_052046])
PRINT, limit_lw[limit_40_50_e_dens_052046] ;762

PRINT, "limit_40_50_e_dens_052046--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_40_50_e_dens_052046])
PRINT, limit_sig_p_int[limit_40_50_e_dens_052046] ;762

PRINT, "limit_40_50_e_dens_052046--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_40_50_e_dens_052046])
PRINT, limit_sig_lw[limit_40_50_e_dens_052046] ;762

;calculate total integrated intensity 80-1000 km/s

limit_It_Si_052046 = (sqrt(2.0*!dpi)*limit_p_int[limit_e_dens_052046]*limit_lw[limit_e_dens_052046]) ;total integrated intensity 
PRINT, "limit_It_Si_052046"
PRINT, limit_It_Si_052046

;calculate integrated intensity uncertainty 80-1000 km/s

limit_int_int_unc_Si_052046 = [2.0*!dpi*((limit_p_int[limit_e_dens_052046])^2*(limit_sig_lw[limit_e_dens_052046])^2+(limit_lw[limit_e_dens_052046])^2*(limit_sig_p_int[limit_e_dens_052046])^2)]^0.5
PRINT, "limit_int_int_unc_Si_052046"
PRINT, limit_int_int_unc_Si_052046

;calculate total integrated intensity 70-80 km/s

limit_70_80_It_Si_052046 = (sqrt(2.0*!dpi)*limit_p_int[limit_70_80_e_dens_052046]*limit_lw[limit_70_80_e_dens_052046]) ;total integrated intensity 
PRINT, "limit_70_80_It_Si_052046"
PRINT, limit_70_80_It_Si_052046

;calculate integrated intensity uncertainty 70-80 km/s

limit_70_80_int_int_unc_Si_052046 = [2.0*!dpi*((limit_p_int[limit_70_80_e_dens_052046])^2*(limit_sig_lw[limit_70_80_e_dens_052046])^2+(limit_lw[limit_70_80_e_dens_052046])^2*(limit_sig_p_int[limit_70_80_e_dens_052046])^2)]^0.5
PRINT, "limit_70_80_int_int_unc_Si_052046"
PRINT, limit_70_80_int_int_unc_Si_052046

;calculate total integrated intensity 60-70 km/s

limit_60_70_It_Si_052046 = (sqrt(2.0*!dpi)*limit_p_int[limit_60_70_e_dens_052046]*limit_lw[limit_60_70_e_dens_052046]) ;total integrated intensity 
PRINT, "limit_60_70_It_Si_052046"
PRINT, limit_60_70_It_Si_052046

;calculate integrated intensity uncertainty 60-70 km/s

limit_60_70_int_int_unc_Si_052046 = [2.0*!dpi*((limit_p_int[limit_60_70_e_dens_052046])^2*(limit_sig_lw[limit_60_70_e_dens_052046])^2+(limit_lw[limit_60_70_e_dens_052046])^2*(limit_sig_p_int[limit_60_70_e_dens_052046])^2)]^0.5
PRINT, "limit_60_70_int_int_unc_Si_052046"
PRINT, limit_60_70_int_int_unc_Si_052046

;calculate total integrated intensity 50-60 km/s

limit_50_60_It_Si_052046 = (sqrt(2.0*!dpi)*limit_p_int[limit_50_60_e_dens_052046]*limit_lw[limit_50_60_e_dens_052046]) ;total integrated intensity 
PRINT, "limit_50_60_It_Si_052046"
PRINT, limit_50_60_It_Si_052046

;calculate integrated intensity uncertainty 50-60 km/s

limit_50_60_int_int_unc_Si_052046 = [2.0*!dpi*((limit_p_int[limit_50_60_e_dens_052046])^2*(limit_sig_lw[limit_50_60_e_dens_052046])^2+(limit_lw[limit_50_60_e_dens_052046])^2*(limit_sig_p_int[limit_50_60_e_dens_052046])^2)]^0.5
PRINT, "limit_50_60_int_int_unc_Si_052046"
PRINT, limit_50_60_int_int_unc_Si_052046

;calculate total integrated intensity 40-50 km/s

limit_40_50_It_Si_052046 = (sqrt(2.0*!dpi)*limit_p_int[limit_40_50_e_dens_052046]*limit_lw[limit_40_50_e_dens_052046]) ;total integrated intensity 
PRINT, "limit_40_50_It_Si_052046"
PRINT, limit_40_50_It_Si_052046

;calculate integrated intensity uncertainty 40-50 km/s

limit_40_50_int_int_unc_Si_052046 = [2.0*!dpi*((limit_p_int[limit_40_50_e_dens_052046])^2*(limit_sig_lw[limit_40_50_e_dens_052046])^2+(limit_lw[limit_40_50_e_dens_052046])^2*(limit_sig_p_int[limit_40_50_e_dens_052046])^2)]^0.5
PRINT, "limit_40_50_int_int_unc_Si_052046"
PRINT, limit_40_50_int_int_unc_Si_052046

;save parameters from FOR loop

sfname_UV_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/limit_IT_UV_052046.sav'
SAVE, limit_e_dens_052046, limit_It_Si_052046, limit_int_int_unc_Si_052046, limit_70_80_e_dens_052046, limit_70_80_It_Si_052046, limit_70_80_int_int_unc_Si_052046, limit_60_70_e_dens_052046, limit_60_70_It_Si_052046, limit_60_70_int_int_unc_Si_052046, limit_50_60_e_dens_052046, limit_50_60_It_Si_052046, limit_50_60_int_int_unc_Si_052046, limit_40_50_e_dens_052046, limit_40_50_It_Si_052046, limit_40_50_int_int_unc_Si_052046, FILENAME = sfname_UV_limit

;===============================================================================
;calculate total integrated intensity

It_Si_052046 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, It_Si_052046

;calculate integrated intensity uncertainty

int_int_unc_Si_052046 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_Si_052046

;save parameters from FOR loop

sfname_UV = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
SAVE, coeff_052046_UV, inst_unc_Si_052046, sigma_coeff, sigma_coeff_arr, coeff_arr_052046_UV, It_Si_052046, int_int_unc_Si_052046, FILENAME = sfname_UV

;===============================================================================

;for pres

;raster_pres = N_ELEMENTS(nspectraRast1394_052046[0,0,*])
;yposition_pres = N_ELEMENTS(nspectraRast1394_052046[0,*,0])

;pres = ARRAY_INDICES([raster_pres,yposition_pres], UVB_ind_052046, /DIMENSIONS)

;pres_r = REFORM(pres[0,*])
;pres_y = REFORM(pres[1,*])

;420, 424, 429, 430, 431
;prof = REFORM(nspectraRast1394_052046[*,pres_y[431],pres_r[431]])

;WINDOW, XSIZE = 900, YSIZE = 700
;PLOT, lambda1394_052046[20:170], prof, TITLE = 'AR11974_052046 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/annotate_052046.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_052046[20:170], avg_fit_052046, COLOR = 255, THICK = 4

;save as png

;TVLCT, [[255], [255], [255]], 2
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;PLOT, lambda1394_052046[20:170], prof, TITLE = 'AR11974_052046 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45, COLOR = 2

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/annotate_052046.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_052046[20:170], avg_fit_052046, COLOR = 255, THICK = 4

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/funky_052046.png', screenshot

;save as ps

;!P.FONT = 1 ;true font option

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/funky_052046.eps', /ENCAPSULATED

;TVLCT, [[0], [0], [0]], 1
;PLOT, lambda1394_052046[20:170], prof, TITLE = 'AR11974_052046 Si IV 1393.8 '+STRING("305B)+' Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, COLOR = 1, XTHICK = 10, YTHICK = 10

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_052046[20:170], avg_fit_052046, COLOR = 255, THICK = 4

;DEVICE, /CLOSE

;===============================================================================

;byte-scaling and saturation

sort_c_052046 = coeff_arr_052046[SORT(coeff_arr_052046)]
sort_c_052046 = sort_c_052046[WHERE(FINITE(sort_c_052046) OR (sort_c_052046 NE -200))]
n_sort_c_052046 = N_ELEMENTS(sort_c_052046)

;despike

coeff_arr_052046_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_052046[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_052046 = BYTSCL(coeff_arr_052046_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(byte_scale_052046[UVB_ind_052046]) ;1D 2811

byte_scale_052046[UVB_ind_052046] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(byte_scale_052046)) ;2D,400,1092

PLOT_IMAGE, REFORM(byte_scale_052046), ORIGIN = [SolarX1400_052046[0], SolarY1400_052046[0]], SCALE = [ResX1400_052046, ResY1400_052046], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

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

;PLOT_IMAGE, REFORM(byte_scale_052046), ORIGIN = [Solarx1400_052046[0], SolarY1400_052046[0]], SCALE = [resx1400_052046, resy1400_052046], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;TVLCT, [[255], [255], [255]], 1

;COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4, COLOR = 1

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/intensity_UVB_052046.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/intensity_UVB_052046.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_052046), ORIGIN = [solarx1400_052046[0], solary1400_052046[0]], SCALE = [resx1400_052046, resy1400_052046], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

OBJ_DESTROY, dataRast_052046
OBJ_DESTROY, data1400_052046

END
