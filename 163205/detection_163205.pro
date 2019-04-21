;+
;Name: detection_163205.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/15
;USING SI IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400-STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH AND APPLY A CUT IN 4-D PARAMETER SPACE TO GET
;UVB POPULATION REGION. THIS CODE IS USED TO DETECT UV BURSTS.

PRO detection_163205

;load the data (http://iris.lmsal.com/search/)

IRast_163205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_raster_t000_r00000.fits'

SJI1400_163205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_163205/iris_l2_20140215_163205_3800258296_SJI_1400_t000.fits'

;read the data

dataRast_163205 = IRIS_OBJ(IRast_163205)

data1400_163205 = IRIS_SJI(SJI1400_163205)

;load images/profiles (WANT SI IV 1394)

dataRast_163205->SHOW_LINES
spectraRast1394_163205 = dataRast_163205->GETVAR(2, /LOAD)

images1400_163205 = data1400_163205->GETVAR()

;get spectral information

lambda1394_163205 = dataRast_163205->GETLAM(2) ;1391.3042-1396.2141
;PRINT, lambda1394_163205
pxlslitRast_163205 = dataRast_163205->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_163205

ResX1400_163205 = data1400_163205->GETRESX()
ResY1400_163205 = data1400_163205->GETRESY()

SolarX1400_163205 = data1400_163205->XSCALE()
SolarY1400_163205 = data1400_163205->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_163205 = dataRast_163205->GETEXP() ;one 0s exposures--8 s exp
;PRINT, exp_arrRast_163205

;get every data point in each lambda, y-pos, and image

cube1394_163205 = spectraRast1394_163205[*,*,*] ;SIZE: 3D, 194,1093,400, float
;PRINT, SIZE(cube1394_163205)

;count the number of images of original cube

array1394_163205 = spectraRast1394_163205[0,0,*]

array1400_163205 = images1400_163205[0,0,*]

nImages1394_163205 = N_ELEMENTS(array1394_163205) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_163205[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_163205[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1394_163205 = N_ELEMENTS(spectraRast1394_163205[0,0,*]) ;400 images
n_wav1394_163205 = N_ELEMENTS(spectraRast1394_163205[*,0,0]) ;194 wavelengths b/w 1391-1395
n_ypos1394_163205 = N_ELEMENTS(spectraRast1394_163205[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_163205 = MEAN(MEAN(spectraRast1394_163205, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 194, float
;PRINT, SIZE(cut_163205)

;PLOT, cut_163205

spectra1394_163205 = cut_163205[19:173]

;PLOT, spectra1394_163205

nspectraRast1394_163205 = spectraRast1394_163205[19:173,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_163205 = N_ELEMENTS(nspectraRast1394_163205[*,0,0]) ;155
;PRINT, n_wav_163205
n_ypos_163205 = N_ELEMENTS(nspectraRast1394_163205[0,*,0]) ;1093
n_img_163205 = N_ELEMENTS(nspectraRast1394_163205[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_163205-1 DO BEGIN
nspectraRast1394_163205[*,*,i] = nspectraRast1394_163205[*,*,i]/exp_arrRast_163205[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_163205 = MEAN(MEAN(nspectraRast1394_163205, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_163205 = MPFITPEAK(lambda1394_163205[19:173], avg_prof_163205, coeff_avg_163205)

wave0_163205 = coeff_avg_163205[1] ;1393.7745
;PRINT, wave0_163205

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
aspr = (ny*ResY1400_163205)/(nx*ResX1400_163205)
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

coeff_arr_163205 = DBLARR(4, n_img_163205, n_ypos_163205)

;FOR loop with cut array and coeff_arr_163205 above

TIC
FOR i = 0, n_img_163205-1 DO BEGIN
	FOR j = 0, n_ypos_163205-1 DO BEGIN
		PLOT, lambda1394_163205[19:173], nspectraRast1394_163205[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_163205 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF
		YFIT_163205 = MPFITPEAK(lambda1394_163205[19:173], nspectraRast1394_163205[*,j,i], coeff_163205, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
		IF STATUS LE 0 THEN message, errmsg
		OPLOT, lambda1394_163205[19:173], YFIT_163205, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
		coeff_arr_163205[*,i,j] = coeff_163205
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF 
	ENDFOR
ENDFOR
TOC ;Time elapsed: ~39.09 min

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/coeff_arr_163205.sav'
SAVE, coeff_avg_163205, coeff_163205, spectraRast1394_163205, nspectraRast1394_163205, coeff_arr_163205, wave0_163205, FILENAME = sfname

;restore coeff_arr_163205

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/coeff_arr_163205.sav'
RESTORE, rfname, /VERBOSE

;get effective and binning spectrograph

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_163205->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_163205->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_163205->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-15T16:32:05.880

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.32726 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4204245

;velocity conversion

vel_width_163205 = (coeff_arr_163205[2,*,*]/wave0_163205) * 3e5 * sqrt(2)

;perform limits

coeff_arr_peak_163205 = coeff_arr_163205[0,*,*]

;PRINT, lambda1394_163205[19:173]

lam2_163205 = ABS(1395.7053-wave0_163205) ;1.9307919
;PRINT, lam2_163205
lam1_163205 = ABS(1391.7876-wave0_163205) ;1.9869327
;PRINT, lam1_163205

gamma_163205 = MAX([lam2_163205,lam1_163205])
;PRINT, gamma_163205
;PRINT, (gamma_163205/wave0_163205)

velocity_163205 = ((coeff_arr_163205[1,*,*]-wave0_163205)/wave0_163205) * 3e5 ; from param_maps

cut_ind_163205 = WHERE((coeff_arr_peak_163205 GE new_peak_min) AND (vel_width_163205 GE 54) AND (vel_width_163205 LE 1000) AND (ABS(velocity_163205 LE (gamma_163205/wave0_163205) * 3e5)), COMPLEMENT = not_cut_ind_163205, count)

PRINT, N_ELEMENTS(cut_ind_163205) ;7329 (peak GE 12 & vel_width GE 40), 2988@18; now:3639

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_163205, coeff_arr_163205[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_163205[not_cut_ind_163205], coeff_arr_peak_163205[not_cut_ind_163205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_163205[cut_ind_163205], coeff_arr_peak_163205[cut_ind_163205], COLOR = 255

;save as png

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1
WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_163205, coeff_arr_163205[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/intensity_plot_163205.png', screenshot

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_163205[not_cut_ind_163205], coeff_arr_peak_163205[not_cut_ind_163205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_163205[cut_ind_163205], coeff_arr_peak_163205[cut_ind_163205], COLOR = 255
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/cut_intensity_plot_163205.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/intensity_plot_163205.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_163205, coeff_arr_163205[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/cut_intensity_plot_163205.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_163205[not_cut_ind_163205], coeff_arr_peak_163205[not_cut_ind_163205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_163205', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_163205[cut_ind_163205], coeff_arr_peak_163205[cut_ind_163205], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/all_vars_163205.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_163205
OBJ_DESTROY, data1400_163205

END
