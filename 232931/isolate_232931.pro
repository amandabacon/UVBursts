;+
;Name: isolate_232931.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/09
;USING INDICES FROM CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION
;REGION, THEN MANUALLY ITERATING THROUGH SPECTRA LOOKING FOR SIGNS OF NI II
;ABSORPTION TO USE FOR ANALYSIS PART OF PROJECT.

;PRO isolate_232931

;restore variables

;rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/all_vars_232931.sav'
;RESTORE, rfname

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

;raster_232931 = N_ELEMENTS(nspectraRast1394_232931[0,0,*]) ;400
;yposition_232931 = N_ELEMENTS(nspectraRast1394_232931[0,*,0]) ;1093
;PRINT, yposition_232931

;cut_ind_ry_232931 = ARRAY_INDICES([raster_232931,yposition_232931], cut_ind_232931, /DIMENSIONS)
;PRINT, SIZE(cut_ind_ry_232931) ;2D,2,5256 where 2 is [raster,ypos]

;cut_ind_r_232931 = REFORM(cut_ind_ry_232931[0,*]) ;1D 5256
;PRINT, SIZE(cut_ind_r_232931)
;cut_ind_y_232931 = REFORM(cut_ind_ry_232931[1,*]) ;1D 5256
;PRINT, SIZE(cut_ind_y_232931)

;pull out all green rectangle UVB pop. indices

;cut_size_232931 = N_ELEMENTS(cut_ind_232931) ;5256
;PRINT, cut_size_232931
;cut_ind_r_s_232931 = N_ELEMENTS(cut_ind_r_232931) ;5256
;PRINT, cut_ind_r_s_232931
;cut_ind_y_s_232931 = N_ELEMENTS(cut_ind_y_232931) ;5256
;PRINT, cut_ind_y_s_232931

;is_absorb_232931 = LONARR(cut_size_232931)

;TIC
;FOR i = 0, cut_size_232931-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_232931[19:174], REFORM(nspectraRast1394_232931[*,cut_ind_y_232931[i],cut_ind_r_232931[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	PLOTS, [1393.35,1393.35], !Y.CRANGE, COLOR = 170, THICK = 3, LINESTYLE = 1
;	ch = ''
;	PRINT, i
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_232931[i] = 1
;		ind_absorb_232931 = WHERE(is_absorb_232931 EQ 1)
;		UVB_ind_232931 = cut_ind_232931[ind_absorb_232931]
;		ENDIF
;		IF ch EQ 'q' THEN BREAK
;ENDFOR
;PRINT, 'VALUE LEFT OFF: ', i
;TOC ;1.19 hrs

;save new params

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_232931.sav'
;SAVE, UVB_ind_232931, is_absorb_232931, ind_absorb_232931, FILENAME = sfname

;sfname_safe = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_safe_232931.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_safe_232931.sav'
RESTORE, rfname2

;rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_232931.sav'
;RESTORE, rfname3

;===============================================================================

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_232931_UV = N_ELEMENTS(nspectraRast1394_232931[0,0,*]) ;400
yposition_232931_UV = N_ELEMENTS(nspectraRast1394_232931[0,*,0]) ;1093

UVB_ind_ry_232931_UV = ARRAY_INDICES([raster_232931_UV,yposition_232931_UV], UVB_ind_232931, /DIMENSIONS)
PRINT, SIZE(UVB_ind_ry_232931_UV) ;2D,2,228 where 2 is [raster,ypos]

UVB_ind_r_232931_UV = REFORM(UVB_ind_ry_232931_UV[0,*]) ;1D 228
UVB_ind_y_232931_UV = REFORM(UVB_ind_ry_232931_UV[1,*]) ;1D 228

;pull out all green rectangle UVB pop. indices

UVB_size_232931_UV = N_ELEMENTS(UVB_ind_232931) ;228
UVB_ind_r_s_232931_UV = N_ELEMENTS(UVB_ind_r_232931_UV) ;228
UVB_ind_y_s_232931_UV = N_ELEMENTS(UVB_ind_y_232931_UV) ;228

;calculate total integrated intensity

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 30.0
inst_unc_Si_232931 = [ABS((REFORM(nspectraRast1394_232931[*,UVB_ind_y_232931_UV,UVB_ind_r_232931_UV]))/(g*dt))+R]^0.5

coeff_arr_232931_UV = DBLARR(4,UVB_size_232931_UV)
sigma_coeff_arr = DBLARR(4,UVB_size_232931_UV)

TIC
FOR i = 0, UVB_size_232931_UV-1 DO BEGIN
	PLOT, lambda1394_232931[19:174], REFORM(nspectraRast1394_232931[*,UVB_ind_y_232931_UV[i],UVB_ind_r_232931_UV[i]]), XRANGE = [1392.2,1395.3], TITLE = 'AR11974_232931_UV Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_232931_UV = MPFITPEAK(lambda1394_232931[19:174], REFORM(nspectraRast1394_232931[*,UVB_ind_y_232931_UV[i],UVB_ind_r_232931_UV[i]]), coeff_232931_UV, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_Si_232931[*,i,i])
	OPLOT, lambda1394_232931[19:174], REFORM(YFIT_232931_UV), COLOR = 170, LINESTYLE = 2, THICK = 5
	coeff_arr_232931_UV[*,i] = coeff_232931_UV
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~0.92 sec

p_int = coeff_arr_232931_UV[0,*,*]
sig_lw = sigma_coeff_arr[2,*,*]
lw = coeff_arr_232931_UV[2,*,*]
sig_p_int = sigma_coeff_arr[0,*,*]

;===============================================================================
;introduce limit to parameter values to see how they contribute to
;electron density
;from detection_obs#.pro (need gamma_232931 & wave0_232931)--in rfname2

limit_gamma_232931 = gamma_232931
limit_wave0_232931 = wave0_232931

limit_p_int = coeff_arr_232931_UV[0,*,*]
PRINT, "limit_p_int"
PRINT, N_ELEMENTS(limit_p_int) ;228
PRINT, limit_p_int

limit_sig_p_int = sigma_coeff_arr[0,*,*]
PRINT, "limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int) ;228
PRINT, limit_sig_p_int

limit_lw = coeff_arr_232931_UV[2,*,*]
PRINT, "limit_lw"
PRINT, N_ELEMENTS(limit_lw) ;228
PRINT, limit_lw

limit_sig_lw = sigma_coeff_arr[2,*,*]
PRINT, "limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw) ;228
PRINT, limit_sig_lw

limit_vel_width_232931 = (coeff_arr_232931_UV[2,*,*]/limit_wave0_232931) * 3e5 * sqrt(2) ;exponential line width--km*s^-1
PRINT, "limit_vel_width_232931"
PRINT, N_ELEMENTS(limit_vel_width_232931) ;228
PRINT, limit_vel_width_232931

limit_velocity_232931 = ((coeff_arr_232931_UV[1,*,*]-limit_wave0_232931)/limit_wave0_232931) * 3e5 ;doppler shift--km*s^-1, pos-away, neg-toward
PRINT, "limit_velocity_232931"
PRINT, N_ELEMENTS(limit_velocity_232931) ;228
PRINT, limit_velocity_232931

;highest velocity lines--80-1000 km/s
limit_e_dens_232931 = WHERE((limit_vel_width_232931 GE 80) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_232931 LE 1000) AND (limit_lw GE 0) AND (limit_sig_p_int GE 0) AND (limit_sig_lw GE 0) AND (ABS(limit_velocity_232931 LE (limit_gamma_232931/limit_wave0_232931) * 3e5)), COMPLEMENT = not_limit_e_dens_232931, count)
PRINT, "limit_e_dens_232931--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_232931[limit_e_dens_232931])
PRINT, limit_vel_width_232931[limit_e_dens_232931] ;2

PRINT, "limit_e_dens_232931--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_e_dens_232931])
PRINT, limit_p_int[limit_e_dens_232931] ;2

PRINT, "limit_e_dens_232931--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_232931[limit_e_dens_232931])
PRINT, ABS(limit_velocity_232931[limit_e_dens_232931]) ;2

PRINT, "limit_e_dens_232931--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_e_dens_232931])
PRINT, limit_lw[limit_e_dens_232931] ;2

PRINT, "limit_e_dens_232931--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_e_dens_232931])
PRINT, limit_sig_p_int[limit_e_dens_232931] ;2

PRINT, "limit_e_dens_232931--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_e_dens_232931])
PRINT, limit_sig_lw[limit_e_dens_232931] ;2

;70.0-80.0 km/s velocity lines
limit_70_80_e_dens_232931 = WHERE((limit_vel_width_232931 GE 70.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_232931 LE 80.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_232931 LE (limit_gamma_232931/limit_wave0_232931) * 3e5)), COMPLEMENT = not_limit_med_70_80_e_dens_232931, count)
PRINT, "limit_70_80_e_dens_232931--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_232931[limit_70_80_e_dens_232931])
PRINT, limit_vel_width_232931[limit_70_80_e_dens_232931] ;18

PRINT, "limit_70_80_e_dens_232931--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_70_80_e_dens_232931])
PRINT, limit_p_int[limit_70_80_e_dens_232931] ;18

PRINT, "limit_70_80_e_dens_232931--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_232931[limit_70_80_e_dens_232931])
PRINT, ABS(limit_velocity_232931[limit_70_80_e_dens_232931]) ;18

PRINT, "limit_70_80_e_dens_232931--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_70_80_e_dens_232931])
PRINT, limit_lw[limit_70_80_e_dens_232931] ;18

PRINT, "limit_70_80_e_dens_232931--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_70_80_e_dens_232931])
PRINT, limit_sig_p_int[limit_70_80_e_dens_232931] ;18

PRINT, "limit_70_80_e_dens_232931--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_70_80_e_dens_232931])
PRINT, limit_sig_lw[limit_70_80_e_dens_232931] ;18

;60.0-70.0 km/s velocity lines
limit_60_70_e_dens_232931 = WHERE((limit_vel_width_232931 GE 60.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_232931 LE 70.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_232931 LE (limit_gamma_232931/limit_wave0_232931) * 3e5)), COMPLEMENT = not_limit_60_70_e_dens_232931, count)
PRINT, "limit_60_70_e_dens_232931--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_232931[limit_60_70_e_dens_232931])
PRINT, limit_vel_width_232931[limit_60_70_e_dens_232931] ;38

PRINT, "limit_60_70_e_dens_232931--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_60_70_e_dens_232931])
PRINT, limit_p_int[limit_60_70_e_dens_232931] ;38

PRINT, "limit_60_70_e_dens_232931--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_232931[limit_60_70_e_dens_232931])
PRINT, ABS(limit_velocity_232931[limit_60_70_e_dens_232931]) ;38

PRINT, "limit_60_70_e_dens_232931--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_60_70_e_dens_232931])
PRINT, limit_lw[limit_60_70_e_dens_232931] ;38

PRINT, "limit_60_70_e_dens_232931--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_60_70_e_dens_232931])
PRINT, limit_sig_p_int[limit_60_70_e_dens_232931] ;38

PRINT, "limit_60_70_e_dens_232931--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_60_70_e_dens_232931])
PRINT, limit_sig_lw[limit_60_70_e_dens_232931] ;38

;50.0-60.0 km/s velocity lines
limit_50_60_e_dens_232931 = WHERE((limit_vel_width_232931 GE 50.0) AND (limit_p_int GE new_peak_min) AND (limit_vel_width_232931 LE 60.0) AND (limit_lw GE 0.0) AND (limit_sig_p_int GE 0.0) AND (limit_sig_lw GE 0.0) AND (ABS(limit_velocity_232931 LE (limit_gamma_232931/limit_wave0_232931) * 3e5)), COMPLEMENT = not_limit_50_60_e_dens_232931, count)
PRINT, "limit_50_60_e_dens_232931--limit_vel_width"
PRINT, N_ELEMENTS(limit_vel_width_232931[limit_50_60_e_dens_232931])
PRINT, limit_vel_width_232931[limit_50_60_e_dens_232931] ;46

PRINT, "limit_50_60_e_dens_232931--limit_p_int"
PRINT, N_ELEMENTS(limit_p_int[limit_50_60_e_dens_232931])
PRINT, limit_p_int[limit_50_60_e_dens_232931] ;46

PRINT, "limit_50_60_e_dens_232931--limit_velocity"
PRINT, N_ELEMENTS(limit_velocity_232931[limit_50_60_e_dens_232931])
PRINT, ABS(limit_velocity_232931[limit_50_60_e_dens_232931]) ;46

PRINT, "limit_50_60_e_dens_232931--limit_lw"
PRINT, N_ELEMENTS(limit_lw[limit_50_60_e_dens_232931])
PRINT, limit_lw[limit_50_60_e_dens_232931] ;46

PRINT, "limit_50_60_e_dens_232931--limit_sig_p_int"
PRINT, N_ELEMENTS(limit_sig_p_int[limit_50_60_e_dens_232931])
PRINT, limit_sig_p_int[limit_50_60_e_dens_232931] ;46

PRINT, "limit_50_60_e_dens_232931--limit_sig_lw"
PRINT, N_ELEMENTS(limit_sig_lw[limit_50_60_e_dens_232931])
PRINT, limit_sig_lw[limit_50_60_e_dens_232931] ;46

;calculate total integrated intensity 80-1000 km/s

limit_It_Si_232931 = (sqrt(2.0*!dpi)*limit_p_int[limit_e_dens_232931]*limit_lw[limit_e_dens_232931]) ;total integrated intensity 
PRINT, "limit_It_Si_232931"
PRINT, limit_It_Si_232931

;calculate integrated intensity uncertainty 80-1000 km/s

limit_int_int_unc_Si_232931 = [2.0*!dpi*((limit_p_int[limit_e_dens_232931])^2*(limit_sig_lw[limit_e_dens_232931])^2+(limit_lw[limit_e_dens_232931])^2*(limit_sig_p_int[limit_e_dens_232931])^2)]^0.5
PRINT, "limit_int_int_unc_Si_232931"
PRINT, limit_int_int_unc_Si_232931

;calculate total integrated intensity 70-80 km/s

limit_70_80_It_Si_232931 = (sqrt(2.0*!dpi)*limit_p_int[limit_70_80_e_dens_232931]*limit_lw[limit_70_80_e_dens_232931]) ;total integrated intensity 
PRINT, "limit_70_80_It_Si_232931"
PRINT, limit_70_80_It_Si_232931

;calculate integrated intensity uncertainty 70-80 km/s

limit_70_80_int_int_unc_Si_232931 = [2.0*!dpi*((limit_p_int[limit_70_80_e_dens_232931])^2*(limit_sig_lw[limit_70_80_e_dens_232931])^2+(limit_lw[limit_70_80_e_dens_232931])^2*(limit_sig_p_int[limit_70_80_e_dens_232931])^2)]^0.5
PRINT, "limit_70_80_int_int_unc_Si_232931"
PRINT, limit_70_80_int_int_unc_Si_232931

;calculate total integrated intensity 60-70 km/s

limit_60_70_It_Si_232931 = (sqrt(2.0*!dpi)*limit_p_int[limit_60_70_e_dens_232931]*limit_lw[limit_60_70_e_dens_232931]) ;total integrated intensity 
PRINT, "limit_60_70_It_Si_232931"
PRINT, limit_60_70_It_Si_232931

;calculate integrated intensity uncertainty 60-70 km/s

limit_60_70_int_int_unc_Si_232931 = [2.0*!dpi*((limit_p_int[limit_60_70_e_dens_232931])^2*(limit_sig_lw[limit_60_70_e_dens_232931])^2+(limit_lw[limit_60_70_e_dens_232931])^2*(limit_sig_p_int[limit_60_70_e_dens_232931])^2)]^0.5
PRINT, "limit_60_70_int_int_unc_Si_232931"
PRINT, limit_60_70_int_int_unc_Si_232931

;calculate total integrated intensity 50-60 km/s

limit_50_60_It_Si_232931 = (sqrt(2.0*!dpi)*limit_p_int[limit_50_60_e_dens_232931]*limit_lw[limit_50_60_e_dens_232931]) ;total integrated intensity 
PRINT, "limit_50_60_It_Si_232931"
PRINT, limit_50_60_It_Si_232931

;calculate integrated intensity uncertainty 50-60 km/s

limit_50_60_int_int_unc_Si_232931 = [2.0*!dpi*((limit_p_int[limit_50_60_e_dens_232931])^2*(limit_sig_lw[limit_50_60_e_dens_232931])^2+(limit_lw[limit_50_60_e_dens_232931])^2*(limit_sig_p_int[limit_50_60_e_dens_232931])^2)]^0.5
PRINT, "limit_50_60_int_int_unc_Si_232931"
PRINT, limit_50_60_int_int_unc_Si_232931

;save parameters from FOR loop

sfname_UV_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/limit_IT_UV_232931.sav'
SAVE, limit_e_dens_232931, limit_It_Si_232931, limit_int_int_unc_Si_232931, limit_70_80_e_dens_232931, limit_70_80_It_Si_232931, limit_70_80_int_int_unc_Si_232931, limit_60_70_e_dens_232931, limit_60_70_It_Si_232931, limit_60_70_int_int_unc_Si_232931, limit_50_60_e_dens_232931, limit_50_60_It_Si_232931, limit_50_60_int_int_unc_Si_232931, FILENAME = sfname_UV_limit

;===============================================================================
;calculate total integrated intensity

It_Si_232931 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, It_Si_232931

;calculate integrated intensity uncertainty

int_int_unc_Si_232931 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_Si_232931

;save parameters from FOR loop

sfname_UV = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
SAVE, coeff_232931_UV, inst_unc_Si_232931, sigma_coeff, sigma_coeff_arr, coeff_arr_232931_UV, It_Si_232931, int_int_unc_Si_232931, FILENAME = sfname_UV

;===============================================================================

;for pres

;raster_pres = N_ELEMENTS(nspectraRast1394_232931[0,0,*])
;yposition_pres = N_ELEMENTS(nspectraRast1394_232931[0,*,0])

;pres = ARRAY_INDICES([raster_pres,yposition_pres], UVB_ind_232931, /DIMENSIONS)

;pres_r = REFORM(pres[0,*])
;pres_y = REFORM(pres[1,*])

;420, 424, 429, 430, 431
;prof = REFORM(nspectraRast1394_232931[*,pres_y[431],pres_r[431]])

;WINDOW, XSIZE = 900, YSIZE = 700
;PLOT, lambda1394_232931[19:174], prof, TITLE = 'AR11974_232931 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/annotate_232931.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_232931[19:174], avg_fit_232931, COLOR = 255, THICK = 4

;save as png

;TVLCT, [[255], [255], [255]], 2
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;PLOT, lambda1394_232931[19:174], prof, TITLE = 'AR11974_232931 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45, COLOR = 2

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/annotate_232931.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_232931[19:174], avg_fit_232931, COLOR = 255, THICK = 4

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/funky_232931.png', screenshot

;save as ps

;!P.FONT = 1 ;true font option

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/funky_232931.eps', /ENCAPSULATED

;TVLCT, [[0], [0], [0]], 1
;PLOT, lambda1394_232931[19:174], prof, TITLE = 'AR11974_232931 Si IV 1393.8 '+STRING("305B)+' Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, COLOR = 1, XTHICK = 10, YTHICK = 10

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_232931[19:174], avg_fit_232931, COLOR = 255, THICK = 4

;DEVICE, /CLOSE

;===============================================================================

;byte-scaling and saturation

sort_c_232931 = coeff_arr_232931[SORT(coeff_arr_232931)]
sort_c_232931 = sort_c_232931[WHERE(FINITE(sort_c_232931) OR (sort_c_232931 NE -200))]
n_sort_c_232931 = N_ELEMENTS(sort_c_232931)

;despike

coeff_arr_232931_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_232931[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_232931 = BYTSCL(coeff_arr_232931_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(byte_scale_232931[UVB_ind_232931]) ;1D 228

byte_scale_232931[UVB_ind_232931] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(byte_scale_232931)) ;2D,400,1093

PLOT_IMAGE, REFORM(byte_scale_232931), ORIGIN = [SolarX1400_232931[0], SolarY1400_232931[0]], SCALE = [ResX1400_232931, ResY1400_232931], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

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

;PLOT_IMAGE, REFORM(byte_scale_232931), ORIGIN = [Solarx1400_232931[0], SolarY1400_232931[0]], SCALE = [resx1400_232931, resy1400_232931], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;TVLCT, [[255], [255], [255]], 1

;COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4, COLOR = 1

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/intensity_UVB_232931.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/intensity_UVB_232931.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_232931), ORIGIN = [solarx1400_232931[0], solary1400_232931[0]], SCALE = [resx1400_232931, resy1400_232931], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

OBJ_DESTROY, dataRast_232931
OBJ_DESTROY, data1400_232931

END
