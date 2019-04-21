;+
;Name: isolate_203906.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/09
;USING INDICES FROM CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION
;REGION, THEN MANUALLY ITERATING THROUGH SPECTRA LOOKING FOR SIGNS OF NI II
;ABSORPTION TO USE FOR ANALYSIS PART OF PROJECT.

;PRO isolate_203906

;restore variables

;rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/all_vars_203906.sav'
;RESTORE, rfname

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

;raster_203906 = N_ELEMENTS(nspectraRast1394_203906[0,0,*]) ;400
;yposition_203906 = N_ELEMENTS(nspectraRast1394_203906[0,*,0]) ;1093
;PRINT, yposition_203906

;cut_ind_ry_203906 = ARRAY_INDICES([raster_203906,yposition_203906], cut_ind_203906, /DIMENSIONS)
;PRINT, SIZE(cut_ind_ry_203906) ;2D 2,5026 where 2 is [raster,ypos]

;cut_ind_r_203906 = REFORM(cut_ind_ry_203906[0,*]) ;1D 5026
;PRINT, SIZE(cut_ind_r_203906)
;cut_ind_y_203906 = REFORM(cut_ind_ry_203906[1,*]) ;1D 5026
;PRINT, SIZE(cut_ind_y_203906)

;pull out all green rectangle UVB pop. indices

;cut_size_203906 = N_ELEMENTS(cut_ind_203906) ;5026
;PRINT, cut_size_203906
;cut_ind_r_s_203906 = N_ELEMENTS(cut_ind_r_203906) ;5026
;PRINT, cut_ind_r_s_203906
;cut_ind_y_s_203906 = N_ELEMENTS(cut_ind_y_203906) ;5026
;PRINT, cut_ind_y_s_203906

;is_absorb_203906 = LONARR(cut_size_203906)

;TIC
;FOR i = 0, cut_size_203906-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_203906[19:139], REFORM(nspectraRast1394_203906[*,cut_ind_y_203906[i],cut_ind_r_203906[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	PLOTS, [1393.35,1393.35], !Y.CRANGE, COLOR = 170, THICK = 3, LINESTYLE = 1
;	ch = ''
;	PRINT, i
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_203906[i] = 1
;		ind_absorb_203906 = WHERE(is_absorb_203906 EQ 1)
;		UVB_ind_203906 = cut_ind_203906[ind_absorb_203906]
;		ENDIF
;		IF ch EQ 'q' THEN BREAK
;ENDFOR
;PRINT, 'VALUE LEFT OFF: ', i
;TOC ;1.41 hrs

;save new params

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
;SAVE, UVB_ind_203906, is_absorb_203906, ind_absorb_203906, FILENAME = sfname

;sfname_safe = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_safe_203906.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_safe_203906.sav'
RESTORE, rfname2

;rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
;RESTORE, rfname3

;===============================================================================

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_203906_UV = N_ELEMENTS(nspectraRast1394_203906[0,0,*]) ;400
yposition_203906_UV = N_ELEMENTS(nspectraRast1394_203906[0,*,0]) ;1093

UVB_ind_ry_203906_UV = ARRAY_INDICES([raster_203906_UV,yposition_203906_UV], UVB_ind_203906, /DIMENSIONS)
PRINT, SIZE(UVB_ind_ry_203906_UV) ;2D 2,1235 where 2 is [raster,ypos]

UVB_ind_r_203906_UV = REFORM(UVB_ind_ry_203906_UV[0,*]) ;1D 1235
UVB_ind_y_203906_UV = REFORM(UVB_ind_ry_203906_UV[1,*]) ;1D 1235

;pull out all green rectangle UVB pop. indices

UVB_size_203906_UV = N_ELEMENTS(UVB_ind_203906) ;1235
UVB_ind_r_s_203906_UV = N_ELEMENTS(UVB_ind_r_203906_UV) ;1235
UVB_ind_y_s_203906_UV = N_ELEMENTS(UVB_ind_y_203906_UV) ;1235

;calculate total integrated intensity

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 8.0
inst_unc_Si_203906 = [ABS((REFORM(nspectraRast1394_203906[*,UVB_ind_y_203906_UV,UVB_ind_r_203906_UV]))/(g*dt))+R]^0.5

coeff_arr_203906_UV = DBLARR(4,UVB_size_203906_UV)
sigma_coeff_arr = DBLARR(4,UVB_size_203906_UV)

TIC
FOR i = 0, UVB_size_203906_UV-1 DO BEGIN
	PLOT, lambda1394_203906[19:139], REFORM(nspectraRast1394_203906[*,UVB_ind_y_203906_UV[i],UVB_ind_r_203906_UV[i]]), XRANGE = [1392.2,1395.3], TITLE = 'AR11974_203906_UV Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_203906_UV = MPFITPEAK(lambda1394_203906[19:139], REFORM(nspectraRast1394_203906[*,UVB_ind_y_203906_UV[i],UVB_ind_r_203906_UV[i]]), coeff_203906_UV, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_Si_203906[*,i,i])
	OPLOT, lambda1394_203906[19:139], REFORM(YFIT_203906_UV), COLOR = 170, LINESTYLE = 2, THICK = 5
	coeff_arr_203906_UV[*,i] = coeff_203906_UV
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~4.6 sec

one = coeff_arr_203906_UV[1,*,*]
PRINT, N_ELEMENTS(one) ;1235
coeff_arr_203906_UV_clean = WHERE((one GT 1393.0) AND (one LT 1394.5), count, COMPLEMENT = non)
PRINT, N_ELEMENTS(coeff_arr_203906_UV_clean) ;1235

;old--below for concatenating arrays in master_table.pro
;p_int = coeff_arr_203906_UV[0,*,*]
;sig_lw = sigma_coeff_arr[2,*,*]
;lw = coeff_arr_203906_UV[2,*,*]
;sig_p_int = sigma_coeff_arr[0,*,*]

zero = coeff_arr_203906_UV[0,*,*] 
sig2 = sigma_coeff_arr[2,*,*] 
two = coeff_arr_203906_UV[2,*,*]
sig0 = sigma_coeff_arr[0,*,*]

p_int = zero[coeff_arr_203906_UV_clean]
sig_lw = sig2[coeff_arr_203906_UV_clean]
lw = two[coeff_arr_203906_UV_clean]
sig_p_int = sig0[coeff_arr_203906_UV_clean]

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (need gamma_203906 & wave0_203906)--in rfname2

limit_gamma_203906 = gamma_203906
limit_wave0_203906 = wave0_203906

limit_p_int = coeff_arr_203906_UV[0,*,*]
PRINT, "limit_p_int"
PRINT, N_ELEMENTS(limit_p_int) ;1235
PRINT, limit_p_int

limit_sig_p_int = sigma_coeff_arr[0,*,*]
PRINT, "limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int) ;1235
PRINT, limit_sig_p_int

limit_lw = coeff_arr_203906_UV[2,*,*]
PRINT, "limit_lw"
PRINT, N_ELEMENTS(limit_lw) ;1235
PRINT, limit_lw

limit_sig_lw = sigma_coeff_arr[2,*,*]
PRINT, "limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw) ;1235
PRINT, limit_sig_lw

limit_vel_width_203906 = (two[coeff_arr_203906_UV_clean]/limit_wave0_203906) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_203906"
PRINT, N_ELEMENTS(limit_vel_width_203906) ;1235
PRINT, limit_vel_width_203906

PRINT, 'TEST'
test = WHERE((limit_vel_width_203906 GE 0.0) AND (limit_vel_width_203906 LT 50.0), count)
PRINT, limit_vel_width_203906[test]
PRINT, MIN(limit_vel_width_203906[test]) ;none????

limit_velocity_203906 = ((one[coeff_arr_203906_UV_clean]-limit_wave0_203906)/limit_wave0_203906) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_203906"
PRINT, N_ELEMENTS(limit_velocity_203906) ;1235
PRINT, limit_velocity_203906

;all velocity lines--40-1000 km/s
limit_all_e_dens_203906 = WHERE((limit_vel_width_203906 GE 40) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 1000) AND (limit_lw GE 0) AND (limit_sig_p_int GE 0) AND (limit_sig_lw GE 0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_all_e_dens_203906, count, /NULL)
PRINT, "limit_all_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_all_e_dens_203906])
PRINT, limit_vel_width_203906[limit_all_e_dens_203906] ;1235

PRINT, "limit_all_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_all_e_dens_203906])
PRINT, limit_p_int[limit_all_e_dens_203906] ;1235

PRINT, "limit_all_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_all_e_dens_203906])
PRINT, ABS(limit_velocity_203906[limit_all_e_dens_203906]) ;1235

PRINT, "limit_all_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_all_e_dens_203906])
PRINT, limit_lw[limit_all_e_dens_203906] ;1235

PRINT, "limit_all_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_all_e_dens_203906])
PRINT, limit_sig_p_int[limit_all_e_dens_203906] ;1235

PRINT, "limit_all_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_all_e_dens_203906])
PRINT, limit_sig_lw[limit_all_e_dens_203906] ;1235

;highest velocity lines--80-1000 km/s
limit_e_dens_203906 = WHERE((limit_vel_width_203906 GE 80) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 1000) AND (limit_lw GE 0) AND (limit_sig_p_int GE 0) AND (limit_sig_lw GE 0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_e_dens_203906, count, /NULL)
PRINT, "limit_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_e_dens_203906])
PRINT, limit_vel_width_203906[limit_e_dens_203906] ;562

PRINT, "limit_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_e_dens_203906])
PRINT, limit_p_int[limit_e_dens_203906] ;562

PRINT, "limit_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_e_dens_203906])
PRINT, ABS(limit_velocity_203906[limit_e_dens_203906]) ;562

PRINT, "limit_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_e_dens_203906])
PRINT, limit_lw[limit_e_dens_203906] ;562

PRINT, "limit_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_e_dens_203906])
PRINT, limit_sig_p_int[limit_e_dens_203906] ;562

PRINT, "limit_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_e_dens_203906])
PRINT, limit_sig_lw[limit_e_dens_203906] ;562

;70.0-80.0 km/s velocity lines
limit_70_80_e_dens_203906 = WHERE((limit_vel_width_203906 GE 70.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 80.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_med_70_80_e_dens_203906, count, /NULL)
PRINT, "limit_70_80_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_70_80_e_dens_203906])
PRINT, limit_vel_width_203906[limit_70_80_e_dens_203906] ;234

PRINT, "limit_70_80_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_70_80_e_dens_203906])
PRINT, limit_p_int[limit_70_80_e_dens_203906] ;234

PRINT, "limit_70_80_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_70_80_e_dens_203906])
PRINT, ABS(limit_velocity_203906[limit_70_80_e_dens_203906]) ;234

PRINT, "limit_70_80_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_70_80_e_dens_203906])
PRINT, limit_lw[limit_70_80_e_dens_203906] ;234

PRINT, "limit_70_80_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_70_80_e_dens_203906])
PRINT, limit_sig_p_int[limit_70_80_e_dens_203906] ;234

PRINT, "limit_70_80_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_70_80_e_dens_203906])
PRINT, limit_sig_lw[limit_70_80_e_dens_203906] ;234

;60.0-70.0 km/s velocity lines
limit_60_70_e_dens_203906 = WHERE((limit_vel_width_203906 GE 60.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 70.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_60_70_e_dens_203906, count, /NULL)
PRINT, "limit_60_70_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_60_70_e_dens_203906])
PRINT, limit_vel_width_203906[limit_60_70_e_dens_203906] ;302

PRINT, "limit_60_70_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_60_70_e_dens_203906])
PRINT, limit_p_int[limit_60_70_e_dens_203906] ;302

PRINT, "limit_60_70_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_60_70_e_dens_203906])
PRINT, ABS(limit_velocity_203906[limit_60_70_e_dens_203906]) ;302

PRINT, "limit_60_70_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_60_70_e_dens_203906])
PRINT, limit_lw[limit_60_70_e_dens_203906] ;302

PRINT, "limit_60_70_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_60_70_e_dens_203906])
PRINT, limit_sig_p_int[limit_60_70_e_dens_203906] ;302

PRINT, "limit_60_70_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_60_70_e_dens_203906])
PRINT, limit_sig_lw[limit_60_70_e_dens_203906] ;302

;50.0-60.0 km/s velocity lines
limit_50_60_e_dens_203906 = WHERE((limit_vel_width_203906 GE 50.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 60.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_50_60_e_dens_203906, count, /NULL)
PRINT, "limit_50_60_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_50_60_e_dens_203906])
PRINT, limit_vel_width_203906[limit_50_60_e_dens_203906] ;137

PRINT, "limit_50_60_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_50_60_e_dens_203906])
PRINT, limit_p_int[limit_50_60_e_dens_203906] ;137

PRINT, "limit_50_60_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_50_60_e_dens_203906])
PRINT, ABS(limit_velocity_203906[limit_50_60_e_dens_203906]) ;137

PRINT, "limit_50_60_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_50_60_e_dens_203906])
PRINT, limit_lw[limit_50_60_e_dens_203906] ;137

PRINT, "limit_50_60_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_50_60_e_dens_203906])
PRINT, limit_sig_p_int[limit_50_60_e_dens_203906] ;137

PRINT, "limit_50_60_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_50_60_e_dens_203906])
PRINT, limit_sig_lw[limit_50_60_e_dens_203906] ;137

;40.0-50.0 km/s velocity lines
limit_40_50_e_dens_203906 = WHERE((limit_vel_width_203906 GE 40.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_203906 LT 50.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_203906 LE (limit_gamma_203906/limit_wave0_203906) * 3e5)), COMPLEMENT = not_limit_40_50_e_dens_203906, count, /NULL)
PRINT, "limit_40_50_e_dens_203906--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_203906[limit_40_50_e_dens_203906])
PRINT, limit_vel_width_203906[limit_40_50_e_dens_203906] ;0

PRINT, "limit_40_50_e_dens_203906--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_40_50_e_dens_203906])
PRINT, limit_p_int[limit_40_50_e_dens_203906] ;0

;REMOVE ABS() B/C NULL
PRINT, "limit_40_50_e_dens_203906--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_203906[limit_40_50_e_dens_203906])
PRINT, limit_velocity_203906[limit_40_50_e_dens_203906] ;0

PRINT, "limit_40_50_e_dens_203906--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_40_50_e_dens_203906])
PRINT, limit_lw[limit_40_50_e_dens_203906] ;0

PRINT, "limit_40_50_e_dens_203906--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_40_50_e_dens_203906])
PRINT, limit_sig_p_int[limit_40_50_e_dens_203906] ;0

PRINT, "limit_40_50_e_dens_203906--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_40_50_e_dens_203906])
PRINT, limit_sig_lw[limit_40_50_e_dens_203906] ;0

;calculate total integrated intensity 80-1000 km/s

;limit_It_Si_203906 = (sqrt(2.0*!dpi)*limit_p_int[limit_e_dens_203906]*limit_lw[limit_e_dens_203906]) ;total integrated intensity 
;PRINT, "limit_It_Si_203906"
;PRINT, limit_It_Si_203906

;PRINT, 'integrated intensity uncertainty'

;calculate integrated intensity uncertainty 80-1000 km/s

;limit_int_int_unc_Si_203906 = [2.0*!dpi*((limit_p_int[limit_e_dens_203906])^2*(limit_sig_lw[limit_e_dens_203906])^2+(limit_lw[limit_e_dens_203906])^2*(limit_sig_p_int[limit_e_dens_203906])^2)]^0.5
;PRINT, "limit_int_int_unc_Si_203906"
;PRINT, limit_int_int_unc_Si_203906

;calculate total integrated intensity 70-80 km/s

;limit_70_80_It_Si_203906 = (sqrt(2.0*!dpi)*limit_p_int[limit_70_80_e_dens_203906]*limit_lw[limit_70_80_e_dens_203906]) ;total integrated intensity 
;PRINT, "limit_70_80_It_Si_203906"
;PRINT, limit_70_80_It_Si_203906

;calculate integrated intensity uncertainty 70-80 km/s

;limit_70_80_int_int_unc_Si_203906 = [2.0*!dpi*((limit_p_int[limit_70_80_e_dens_203906])^2*(limit_sig_lw[limit_70_80_e_dens_203906])^2+(limit_lw[limit_70_80_e_dens_203906])^2*(limit_sig_p_int[limit_70_80_e_dens_203906])^2)]^0.5
;PRINT, "limit_70_80_int_int_unc_Si_203906"
;PRINT, limit_70_80_int_int_unc_Si_203906

;calculate total integrated intensity 60-70 km/s

;limit_60_70_It_Si_203906 = (sqrt(2.0*!dpi)*limit_p_int[limit_60_70_e_dens_203906]*limit_lw[limit_60_70_e_dens_203906]) ;total integrated intensity 
;PRINT, "limit_60_70_It_Si_203906"
;PRINT, limit_60_70_It_Si_203906

;calculate integrated intensity uncertainty 60-70 km/s

;limit_60_70_int_int_unc_Si_203906 = [2.0*!dpi*((limit_p_int[limit_60_70_e_dens_203906])^2*(limit_sig_lw[limit_60_70_e_dens_203906])^2+(limit_lw[limit_60_70_e_dens_203906])^2*(limit_sig_p_int[limit_60_70_e_dens_203906])^2)]^0.5
;PRINT, "limit_60_70_int_int_unc_Si_203906"
;PRINT, limit_60_70_int_int_unc_Si_203906

;calculate total integrated intensity 50-60 km/s

;limit_50_60_It_Si_203906 = (sqrt(2.0*!dpi)*limit_p_int[limit_50_60_e_dens_203906]*limit_lw[limit_50_60_e_dens_203906]) ;total integrated intensity 
;PRINT, "limit_50_60_It_Si_203906"
;PRINT, limit_50_60_It_Si_203906

;calculate integrated intensity uncertainty 50-60 km/s

;limit_50_60_int_int_unc_Si_203906 = [2.0*!dpi*((limit_p_int[limit_50_60_e_dens_203906])^2*(limit_sig_lw[limit_50_60_e_dens_203906])^2+(limit_lw[limit_50_60_e_dens_203906])^2*(limit_sig_p_int[limit_50_60_e_dens_203906])^2)]^0.5
;PRINT, "limit_50_60_int_int_unc_Si_203906"
;PRINT, limit_50_60_int_int_unc_Si_203906

;calculate total integrated intensity 40-50 km/s

;limit_40_50_It_Si_203906 = (sqrt(2.0*!dpi)*limit_p_int[limit_40_50_e_dens_203906]*limit_lw[limit_40_50_e_dens_203906]) ;total integrated intensity 
;PRINT, "limit_40_50_It_Si_203906"
;PRINT, limit_40_50_It_Si_203906

;calculate integrated intensity uncertainty 40-50 km/s

;limit_40_50_int_int_unc_Si_203906 = [2.0*!dpi*((limit_p_int[limit_40_50_e_dens_203906])^2*(limit_sig_lw[limit_40_50_e_dens_203906])^2+(limit_lw[limit_40_50_e_dens_203906])^2*(limit_sig_p_int[limit_40_50_e_dens_203906])^2)]^0.5
;PRINT, "limit_40_50_int_int_unc_Si_203906"
;PRINT, limit_40_50_int_int_unc_Si_203906

;save parameters from FOR loop

sfname_UV_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/limit_IT_UV_203906.sav'
SAVE, limit_all_e_dens_203906, limit_e_dens_203906, limit_70_80_e_dens_203906, limit_60_70_e_dens_203906, limit_50_60_e_dens_203906, limit_40_50_e_dens_203906, limit_vel_width_203906, limit_velocity_203906, p_int, sig_lw, lw, sig_p_int, FILENAME = sfname_UV_limit

;limit_e_dens_203906, limit_It_Si_203906, limit_int_int_unc_Si_203906, limit_70_80_e_dens_203906, limit_70_80_It_Si_203906, limit_70_80_int_int_unc_Si_203906, limit_60_70_e_dens_203906, limit_60_70_It_Si_203906, limit_60_70_int_int_unc_Si_203906, limit_50_60_e_dens_203906, limit_50_60_It_Si_203906, limit_50_60_int_int_unc_Si_203906, limit_40_50_e_dens_203906, limit_40_50_It_Si_203906, limit_40_50_int_int_unc_Si_203906

;===============================================================================
;calculate total integrated intensity

It_Si_203906 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, "It_Si_203906"
PRINT, It_Si_203906
PRINT, SIZE(It_Si_203906) ;1D,1235

;calculate integrated intensity uncertainty

int_int_unc_Si_203906 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, "int_int_unc_Si_203906"
PRINT, int_int_unc_Si_203906
PRINT, SIZE(int_int_unc_Si_203906) ;1D,1235

;save parameters from FOR loop

sfname_UV = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
SAVE, coeff_203906_UV, inst_unc_Si_203906, sigma_coeff, sigma_coeff_arr, coeff_arr_203906_UV, It_Si_203906, int_int_unc_Si_203906, FILENAME = sfname_UV

;===============================================================================

;for pres

;raster_pres = N_ELEMENTS(nspectraRast1394_203906[0,0,*])
;yposition_pres = N_ELEMENTS(nspectraRast1394_203906[0,*,0])

;pres = ARRAY_INDICES([raster_pres,yposition_pres], UVB_ind_203906, /DIMENSIONS)

;pres_r = REFORM(pres[0,*])
;pres_y = REFORM(pres[1,*])

;420, 424, 429, 430, 431
;prof = REFORM(nspectraRast1394_203906[*,pres_y[431],pres_r[431]])

;WINDOW, XSIZE = 900, YSIZE = 700
;PLOT, lambda1394_203906[19:139], prof, TITLE = 'AR11974_203906 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/annotate_203906.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_203906[19:139], avg_fit_203906, COLOR = 255, THICK = 4

;save as png

;TVLCT, [[255], [255], [255]], 2
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;PLOT, lambda1394_203906[19:139], prof, TITLE = 'AR11974_203906 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45, COLOR = 2

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/annotate_203906.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_203906[19:139], avg_fit_203906, COLOR = 255, THICK = 4

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/funky_203906.png', screenshot

;save as ps

;!P.FONT = 1 ;true font option

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/funky_203906.eps', /ENCAPSULATED

;TVLCT, [[0], [0], [0]], 1
;PLOT, lambda1394_203906[19:139], prof, TITLE = 'AR11974_203906 Si IV 1393.8 '+STRING("305B)+' Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, COLOR = 1, XTHICK = 10, YTHICK = 10

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_203906[19:139], avg_fit_203906, COLOR = 255, THICK = 4

;DEVICE, /CLOSE

;===============================================================================

;byte-scaling and saturation

sort_c_203906 = coeff_arr_203906[SORT(coeff_arr_203906)]
sort_c_203906 = sort_c_203906[WHERE(FINITE(sort_c_203906) OR (sort_c_203906 NE -200))]
n_sort_c_203906 = N_ELEMENTS(sort_c_203906)

;despike

coeff_arr_203906_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_203906[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(byte_scale_203906[UVB_ind_203906]) ;1D 1235

byte_scale_203906[UVB_ind_203906] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;===============================================================================
PRINT, '80-1000 km/s velocity'

;BYTSCL() TO SHOW UVB OVERPLOT IN BLUE 80-1000 km/s

limit_byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(limit_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_e_dens_203906]]]) ;1D 562

;DON'T DO THE COMMENTED OUT SECTION. THIS IS USING AN INDEX OF
;PEAK INTENSITY AND OUR coeff_arr_004121_clean IS ALREADY OF PEAK
;INTENSITY. THE UNCOMMENTED ONE MATCHES THE ONE CREATED IN
;master_table.pro FOR CHECKING PURSPOSES.
;limit_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_e_dens_203906]]] = 255
limit_byte_scale_203906[UVB_ind_203906[limit_e_dens_203906]] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 127
bv[255] = 80

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(limit_byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(limit_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;-------------------------------------------------------------------------------

PRINT, '70-80 km/s velocity'

;BYTSCL() TO SHOW UVB OVERPLOT IN BLUE 70-80 km/s

limit_70_80_byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(limit_70_80_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_70_80_e_dens_203906]]]) ;1D 234

;DON'T DO THE COMMENTED OUT SECTION. THIS IS USING AN INDEX OF
;PEAK INTENSITY AND OUR coeff_arr_004121_clean IS ALREADY OF PEAK
;INTENSITY. THE UNCOMMENTED ONE MATCHES THE ONE CREATED IN
;master_table.pro FOR CHECKING PURSPOSES.
;limit_70_80_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_70_80_e_dens_203906]]] = 255
limit_70_80_byte_scale_203906[UVB_ind_203906[limit_70_80_e_dens_203906]] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 255

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(limit_70_80_byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(limit_70_80_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;-------------------------------------------------------------------------------

PRINT, '60-70 km/s velocity'

;BYTSCL() TO SHOW UVB OVERPLOT IN BLUE 60-70 km/s

limit_60_70_byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(limit_60_70_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_60_70_e_dens_203906]]]) ;1D 302

;DON'T DO THE COMMENTED OUT SECTION. THIS IS USING AN INDEX OF
;PEAK INTENSITY AND OUR coeff_arr_004121_clean IS ALREADY OF PEAK
;INTENSITY. THE UNCOMMENTED ONE MATCHES THE ONE CREATED IN
;master_table.pro FOR CHECKING PURSPOSES.
;limit_60_70_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_60_70_e_dens_203906]]] = 255
limit_60_70_byte_scale_203906[UVB_ind_203906[limit_60_70_e_dens_203906]] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 138
gv[255] = 43
bv[255] = 226

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(limit_60_70_byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(limit_60_70_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;-------------------------------------------------------------------------------

PRINT, '50-60 km/s velocity'

;BYTSCL() TO SHOW UVB OVERPLOT IN BLUE 50-60 km/s

limit_50_60_byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(limit_50_60_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_50_60_e_dens_203906]]]) ;1D 137

;DON'T DO THE COMMENTED OUT SECTION. THIS IS USING AN INDEX OF
;PEAK INTENSITY AND OUR coeff_arr_004121_clean IS ALREADY OF PEAK
;INTENSITY. THE UNCOMMENTED ONE MATCHES THE ONE CREATED IN
;master_table.pro FOR CHECKING PURSPOSES.
;limit_50_60_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_50_60_e_dens_203906]]] = 255
limit_50_60_byte_scale_203906[UVB_ind_203906[limit_50_60_e_dens_203906]] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 165
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(limit_50_60_byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(limit_50_60_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;-------------------------------------------------------------------------------

PRINT, '40-50 km/s velocity'

;BYTSCL() TO SHOW UVB OVERPLOT IN BLUE 40-50 km/s

limit_40_50_byte_scale_203906 = BYTSCL(coeff_arr_203906_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(limit_40_50_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_40_50_e_dens_203906]]]) ;1D 0

;DON'T DO THE COMMENTED OUT SECTION. THIS IS USING AN INDEX OF
;PEAK INTENSITY AND OUR coeff_arr_004121_clean IS ALREADY OF PEAK
;INTENSITY. THE UNCOMMENTED ONE MATCHES THE ONE CREATED IN
;master_table.pro FOR CHECKING PURSPOSES.
;limit_40_50_byte_scale_203906[UVB_ind_203906[limit_p_int[limit_40_50_e_dens_203906]]] = 255
limit_40_50_byte_scale_203906[UVB_ind_203906[limit_40_50_e_dens_203906]] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 105
bv[255] = 180

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(limit_40_50_byte_scale_203906)) ;2D 400,1093

PLOT_IMAGE, REFORM(limit_40_50_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;===============================================================================

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2

;EIS_COLORS, /INTENSITY

;TVLCT, rv, gv, bv, /GET
;rv[255] = 255
;gv[255] = 0
;bv[255] = 0

;TVLCT, rv, gv, bv

;PLOT_IMAGE, REFORM(byte_scale_203906), ORIGIN = [Solarx1400_203906[0], SolarY1400_203906[0]], SCALE = [resx1400_203906, resy1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;TVLCT, [[255], [255], [255]], 1

;COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4, COLOR = 1

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_UVB_203906.png', screenshot

;save as ps

!P.FONT = 1

;normal
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_203906), ORIGIN = [solarx1400_203906[0], solary1400_203906[0]], SCALE = [resx1400_203906, resy1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;-------------------------------------------------------------------------------

;80-1000 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_80_1000_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(limit_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;-------------------------------------------------------------------------------

;70-80 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_70_80_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(limit_70_80_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;-------------------------------------------------------------------------------

;60-70 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_60_70_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(limit_60_70_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;-------------------------------------------------------------------------------

;50-60 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_50_60_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(limit_50_60_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;-------------------------------------------------------------------------------

;40-50 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_40_50_UVB_203906.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(limit_40_50_byte_scale_203906), ORIGIN = [SolarX1400_203906[0], SolarY1400_203906[0]], SCALE = [ResX1400_203906, ResY1400_203906], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

;562+234+302+137+0=1235 (all UVBs)

OBJ_DESTROY, dataRast_203906
OBJ_DESTROY, data1400_203906

END
