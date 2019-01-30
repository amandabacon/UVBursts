;+
;Name: isolate_114951.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/09
;USING INDICES FROM CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION
;REGION, MANUALLY ITERATING THROUGH SPECTRA LOOKING FOR SIGNS OF NI II
;ABSORPTION TO USE FOR ANALYSIS PART OF PROJECT.

;PRO isolate_114951

;restore variables

;rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/all_vars_114951.sav'
;RESTORE, rfname

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

;raster_114951 = N_ELEMENTS(nspectraRast1394_114951[0,0,*]) ;400
;yposition_114951 = N_ELEMENTS(nspectraRast1394_114951[0,*,0]) ;1093
;PRINT, yposition_114951

;cut_ind_ry_114951 = ARRAY_INDICES([raster_114951,yposition_114951], cut_ind_114951, /DIMENSIONS)
;PRINT, SIZE(cut_ind_ry_114951) ;2D,2,6488 where 2 is [raster,ypos]

;cut_ind_r_114951 = REFORM(cut_ind_ry_114951[0,*]) ;1D 6488
;PRINT, SIZE(cut_ind_r_114951)
;cut_ind_y_114951 = REFORM(cut_ind_ry_114951[1,*]) ;1D 6488
;PRINT, SIZE(cut_ind_y_114951)

;pull out all green rectangle UVB pop. indices

;cut_size_114951 = N_ELEMENTS(cut_ind_114951) ;6488
;PRINT, cut_size_114951
;cut_ind_r_s_114951 = N_ELEMENTS(cut_ind_r_114951) ;6488
;PRINT, cut_ind_r_s_114951
;cut_ind_y_s_114951 = N_ELEMENTS(cut_ind_y_114951) ;6488
;PRINT, cut_ind_y_s_114951

;is_absorb_114951 = LONARR(cut_size_114951)

;TIC
;FOR i = 0, cut_size_114951-1 DO BEGIN
;	WINDOW, XSIZE = 900, YSIZE = 700
;	PLOT, lambda1394_114951[19:172], REFORM(nspectraRast1394_114951[*,cut_ind_y_114951[i],cut_ind_r_114951[i]]), XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395.3], POSITION = [x0,y0,x0+dx,y0+dy]
;	ch = ''
;	READ, ch, PROMPT = 'UVB?: '
;		IF ch EQ 'y' THEN BEGIN
;		is_absorb_114951[i] = 1
;		ind_absorb_114951 = WHERE(is_absorb_114951 EQ 1)
;		UVB_ind_114951 = cut_ind_114951[ind_absorb_114951]
;		ENDIF
;ENDFOR
;TOC ;2.29 hrs

;save new params

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
;SAVE, UVB_ind_114951, is_absorb_114951, ind_absorb_114951, FILENAME = sfname

;sfname_safe = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_safe_114951.sav'
;SAVE, /VARIABLES, FILENAME = sfname_safe

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_safe_114951.sav'
RESTORE, rfname2

;rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
;RESTORE, rfname3

;===============================================================================

;ARRAY_INDICES to convert 1D index to 2D (ypos and raster)

raster_114951_UV = N_ELEMENTS(nspectraRast1394_114951[0,0,*]) ;400
yposition_114951_UV = N_ELEMENTS(nspectraRast1394_114951[0,*,0]) ;1093

UVB_ind_ry_114951_UV = ARRAY_INDICES([raster_114951_UV,yposition_114951_UV], UVB_ind_114951, /DIMENSIONS)
;PRINT, SIZE(UVB_ind_ry_114951_UV) ;2D,2,1070 where 2 is [raster,ypos]

UVB_ind_r_114951_UV = REFORM(UVB_ind_ry_114951_UV[0,*]) ;1D 1070
UVB_ind_y_114951_UV = REFORM(UVB_ind_ry_114951_UV[1,*]) ;1D 1070

;pull out all green rectangle UVB pop. indices

UVB_size_114951_UV = N_ELEMENTS(UVB_ind_114951) ;1070
UVB_ind_r_s_114951_UV = N_ELEMENTS(UVB_ind_r_114951_UV) ;1070
UVB_ind_y_s_114951_UV = N_ELEMENTS(UVB_ind_y_114951_UV) ;1070

;calculate total integrated intensity

R = (1.75)^2 ;counts/pxl
g = 7.2 ;photons/count
dt = 30.0
inst_unc_Si_114951 = [ABS((REFORM(nspectraRast1394_114951[*,UVB_ind_y_114951_UV,UVB_ind_r_114951_UV]))/(g*dt))+R]^0.5

coeff_arr_114951_UV = DBLARR(4,UVB_size_114951_UV)
sigma_coeff_arr = DBLARR(4,UVB_size_114951_UV)

TIC
FOR i = 0, UVB_size_114951_UV-1 DO BEGIN
	PLOT, lambda1394_114951[19:172], REFORM(nspectraRast1394_114951[*,UVB_ind_y_114951_UV[i],UVB_ind_r_114951_UV[i]]), XRANGE = [1392.2,1395.3], TITLE = 'AR11974_114951_UV Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
	YFIT_114951_UV = MPFITPEAK(lambda1394_114951[19:172], REFORM(nspectraRast1394_114951[*,UVB_ind_y_114951_UV[i],UVB_ind_r_114951_UV[i]]), coeff_114951_UV, NTERMS = 4, PERROR = sigma_coeff, ERROR = inst_unc_Si_114951[*,i,i])
	OPLOT, lambda1394_114951[19:172], REFORM(YFIT_114951_UV), COLOR = 170, LINESTYLE = 2, THICK = 5
	coeff_arr_114951_UV[*,i] = coeff_114951_UV
	sigma_coeff_arr[*,i] = sigma_coeff 
ENDFOR
TOC ;Time elapsed: ~4.33 sec

p_int = coeff_arr_114951_UV[0,*,*]
sig_lw = sigma_coeff_arr[2,*,*]
lw = coeff_arr_114951_UV[2,*,*]
sig_p_int = sigma_coeff_arr[0,*,*]

;calculate total integrated intensity

It_Si_114951 = (sqrt(2.0*!dpi)*p_int*lw) ;total integrated intensity 
PRINT, It_Si_114951

PRINT, 'integrated intensity uncertainty'

;calculate integrated intensity uncertainty

int_int_unc_Si_114951 = [2.0*!dpi*((p_int)^2*(sig_lw)^2+(lw)^2*(sig_p_int)^2)]^0.5
PRINT, int_int_unc_Si_114951

;save parameters from FOR loop

sfname_UV = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
SAVE, coeff_114951_UV, inst_unc_Si_114951, sigma_coeff, sigma_coeff_arr, coeff_arr_114951_UV, It_Si_114951, int_int_unc_Si_114951, FILENAME = sfname_UV

;===============================================================================

;for pres

;raster_pres = N_ELEMENTS(nspectraRast1394_114951[0,0,*])
;yposition_pres = N_ELEMENTS(nspectraRast1394_114951[0,*,0])

;pres = ARRAY_INDICES([raster_pres,yposition_pres], UVB_ind_114951, /DIMENSIONS)

;pres_r = REFORM(pres[0,*])
;pres_y = REFORM(pres[1,*])

;420, 424, 429, 430, 431
;prof = REFORM(nspectraRast1394_114951[*,pres_y[431],pres_r[431]])

;WINDOW, XSIZE = 900, YSIZE = 700
;PLOT, lambda1394_114951[19:172], prof, TITLE = 'AR11974_114951 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/annotate_114951.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_114951[19:172], avg_fit_114951, COLOR = 255, THICK = 4

;save as png

;TVLCT, [[255], [255], [255]], 2
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;PLOT, lambda1394_114951[19:172], prof, TITLE = 'AR11974_114951 Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45, COLOR = 2

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;ANNOTATE, LOAD_FILE = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/annotate_114951.dat'

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_114951[19:172], avg_fit_114951, COLOR = 255, THICK = 4

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/funky_114951.png', screenshot

;save as ps

;!P.FONT = 1 ;true font option

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/funky_114951.eps', /ENCAPSULATED

;TVLCT, [[0], [0], [0]], 1
;PLOT, lambda1394_114951[19:172], prof, TITLE = 'AR11974_114951 Si IV 1393.8 '+STRING("305B)+' Emission Line Profile', XTITLE = 'Wavelength['+STRING("305B)+']', YTITLE = 'Instensity [Arb. Units]', XRANGE = [1392.2,1395], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, COLOR = 1, XTHICK = 10, YTHICK = 10

;XYOUTS, 1392.5, 360, 'Fe II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.05, 360, 'Ni II', CHARSIZE = 1.8, COLOR = 2
;XYOUTS, 1393.50, 360, 'Si IV', CHARSIZE = 1.8, COLOR = 2

;TVLCT, [[255], [0], [0]], 255
;OPLOT, lambda1394_114951[19:172], avg_fit_114951, COLOR = 255, THICK = 4

;DEVICE, /CLOSE

;===============================================================================

;byte-scaling and saturation

sort_c_114951 = coeff_arr_114951[SORT(coeff_arr_114951)]
sort_c_114951 = sort_c_114951[WHERE(FINITE(sort_c_114951) OR (sort_c_114951 NE -200))]
n_sort_c_114951 = N_ELEMENTS(sort_c_114951)

;despike

coeff_arr_114951_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_114951[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_114951 = BYTSCL(coeff_arr_114951_clean, MIN = 5, MAX = 75, TOP = 254)

PRINT, SIZE(byte_scale_114951[UVB_ind_114951]) ;1D 1070

byte_scale_114951[UVB_ind_114951] = 255

WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PRINT, SIZE(REFORM(byte_scale_114951)) ;2D,400,1093

PLOT_IMAGE, REFORM(byte_scale_114951), ORIGIN = [SolarX1400_114951[0], SolarY1400_114951[0]], SCALE = [ResX1400_114951, ResY1400_114951], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

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

;PLOT_IMAGE, REFORM(byte_scale_114951), ORIGIN = [Solarx1400_114951[0], SolarY1400_114951[0]], SCALE = [resx1400_114951, resy1400_114951], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45

;TVLCT, [[255], [255], [255]], 1

;COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4, COLOR = 1

;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/intensity_UVB_114951.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/intensity_UVB_114951.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_114951), ORIGIN = [solarx1400_114951[0], solary1400_114951[0]], SCALE = [resx1400_114951, resy1400_114951], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE, XTHICK = 10, YTHICK = 10, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.35,0.91,0.70,0.92], /TOP, CHARSIZE = 1.4

DEVICE, /CLOSE

OBJ_DESTROY, dataRast_114951
OBJ_DESTROY, data1400_114951

END
