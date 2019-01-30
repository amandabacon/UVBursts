;+
;Name: detection_050655_1.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/30
;USING SI IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400 STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH OF APPLY A CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION REGION

;PRO detection_050655_1

;load the data

IRast_050655_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_050655/iris_l2_20140216_050655_3800254296_raster_t000_r00001.fits'

SJI1400_050655_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_050655/iris_l2_20140216_050655_3800254296_SJI_1400_t000.fits'

;read the data

dataRast_050655_1 = IRIS_OBJ(IRast_050655_1)

data1400_050655_1 = IRIS_SJI(SJI1400_050655_1)

;load images/profiles (WANT SI IV 1394)

dataRast_050655_1->SHOW_LINES
spectraRast1394_050655_1 = dataRast_050655_1->GETVAR(2, /LOAD)

images1400_050655_1 = data1400_050655_1->GETVAR()

;get spectral information

lambda1394_050655_1 = dataRast_050655_1->GETLAM(2) ;1391.3297-1396.2141
;PRINT, lambda1394_050655_1
pxlslitRast_050655_1 = dataRast_050655_1->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_050655_1

ResX1400_050655_1 = data1400_050655_1->GETRESX()
ResY1400_050655_1 = data1400_050655_1->GETRESY()

SolarX1400_050655_1 = data1400_050655_1->XSCALE()
SolarY1400_050655_1 = data1400_050655_1->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_050655_1 = dataRast_050655_1->GETEXP() ;no 0s exposures--2 s exp
;PRINT, exp_arrRast_050655_1

;get every data point in each lambda, y-pos, and image

cube1394_050655_1 = spectraRast1394_050655_1[*,*,*] ;SIZE: 3D, 193,1093,400, float
;PRINT, SIZE(cube1394_050655_1)

;count the number of images of original cube

array1394_050655_1 = spectraRast1394_050655_1[0,0,*]

array1400_050655_1 = images1400_050655_1[0,0,*]

nImages1394_050655_1 = N_ELEMENTS(array1394_050655_1) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_050655_1[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_050655_1[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1394_050655_1 = N_ELEMENTS(spectraRast1394_050655_1[0,0,*]) ;400 images
n_wav1394_050655_1 = N_ELEMENTS(spectraRast1394_050655_1[*,0,0]) ;193 wavelengths b/w 1391-1395
n_ypos1394_050655_1 = N_ELEMENTS(spectraRast1394_050655_1[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_050655_1 = MEAN(MEAN(spectraRast1394_050655_1, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 193, float
;PRINT, SIZE(cut_050655_1)

;PLOT, cut_050655_1

spectra1394_050655_1 = cut_050655_1[19:173]

;PLOT, spectra1394_050655_1

nspectraRast1394_050655_1 = spectraRast1394_050655_1[19:173,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_050655_1 = N_ELEMENTS(nspectraRast1394_050655_1[*,0,0]) ;155
;PRINT, n_wav_050655_1
n_ypos_050655_1 = N_ELEMENTS(nspectraRast1394_050655_1[0,*,0]) ;1093
n_img_050655_1 = N_ELEMENTS(nspectraRast1394_050655_1[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_050655_1-1 DO BEGIN
nspectraRast1394_050655_1[*,*,i] = nspectraRast1394_050655_1[*,*,i]/exp_arrRast_050655_1[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_050655_1 = MEAN(MEAN(nspectraRast1394_050655_1, DIMENSION = 2), DIMENSION = 2)

avg_fit_050655_1 = MPFITPEAK(lambda1394_050655_1[19:173], avg_prof_050655_1, coeff_avg_050655_1)

wave0_050655_1 = coeff_avg_050655_1[1] ;1393.7749
;PRINT, wave0_050655_1

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
aspr = (ny*ResY1400_050655_1)/(nx*ResX1400_050655_1)
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

;create array to hold coeff paramters from FOR loop, images, & y-pos

coeff_arr_050655_1 = DBLARR(4, n_img_050655_1, n_ypos_050655_1)

;FOR loop with cut array and coeff_arr_050655_1 above

;TIC
;FOR i = 0, n_img_050655_1-1 DO BEGIN
;	FOR j = 0, n_ypos_050655_1-1 DO BEGIN
;		PLOT, lambda1394_050655_1[19:173], nspectraRast1394_050655_1[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_050655_1 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
;		YFIT_050655_1 = MPFITPEAK(lambda1394_050655_1[19:173], nspectraRast1394_050655_1[*,j,i], coeff_050655_1, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
;		OPLOT, lambda1394_050655_1[19:173], YFIT_050655_1, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
;		coeff_arr_050655_1[*,i,j] = coeff_050655_1
;	ENDFOR
;ENDFOR
;TOC ;Time elapsed: ~44.05 min

;save parameters from nested FOR loop

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/coeff_arr_050655_1.sav'
;SAVE, coeff_avg_050655_1, coeff_050655_1, spectraRast1394_050655_1, nspectraRast1394_050655_1, coeff_arr_050655_1, wave0_050655_1, FILENAME = sfname

;restore coeff_arr_050655_1

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/coeff_arr_050655_1.sav'
RESTORE, rfname, /VERBOSE

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_050655_1->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_050655_1->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_050655_1->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-16T05:29:24.760

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.32313 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4066863

;velocity conversion

vel_width_050655_1 = (coeff_arr_050655_1[2,*,*]/wave0_050655_1) * 3e5 * sqrt(2)

;perform limits

coeff_arr_peak_050655_1 = coeff_arr_050655_1[0,*,*]

;PRINT, lambda1394_050655_1[19:173]

lam2_050655_1 = ABS(1395.7053-wave0_050655_1) ;1.9304507
;PRINT, lam2_050655_1
lam1_050655_1 = ABS(1391.8130-wave0_050655_1) ;1.9618833
;PRINT, lam1_050655_1

gamma_050655_1 = MAX([lam2_050655_1,lam1_050655_1])
;PRINT, gamma_050655_1
;PRINT, (gamma_050655_1/wave0_050655_1)

velocity_050655_1 = ((coeff_arr_050655_1[1,*,*]-wave0_050655_1)/wave0_050655_1) * 3e5 ; from param_maps

cut_ind_050655_1 = WHERE((coeff_arr_peak_050655_1 GE new_peak_min) AND (vel_width_050655_1 GE 40) AND (vel_width_050655_1 LE 1000) AND (ABS(velocity_050655_1 LE (gamma_050655_1/wave0_050655_1) * 3e5)), COMPLEMENT = not_cut_ind_050655_1, count)

PRINT, N_ELEMENTS(cut_ind_050655_1) ;4502@12; now: 6396

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_050655_1, coeff_arr_050655_1[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_050655_1[not_cut_ind_050655_1], coeff_arr_peak_050655_1[not_cut_ind_050655_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_050655_1[cut_ind_050655_1], coeff_arr_peak_050655_1[cut_ind_050655_1], COLOR = 255

;save as png

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_050655_1, coeff_arr_050655_1[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/intensity_plot_050655_1.png', screenshot

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_050655_1[not_cut_ind_050655_1], coeff_arr_peak_050655_1[not_cut_ind_050655_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;TVLCT, [[255], [0], [0]], 255
;OPLOT, psym = 3, vel_width_050655_1[cut_ind_050655_1], coeff_arr_peak_050655_1[cut_ind_050655_1], COLOR = 255
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/cut_intensity_plot_050655_1.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/intensity_plot_050655_1.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_050655_1, coeff_arr_050655_1[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/cut_intensity_plot_050655_1.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_050655_1[not_cut_ind_050655_1], coeff_arr_peak_050655_1[not_cut_ind_050655_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_050655_1', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_050655_1[cut_ind_050655_1], coeff_arr_peak_050655_1[cut_ind_050655_1], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/all_vars_050655_1.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_050655_1
OBJ_DESTROY, data1400_050655_1

END
