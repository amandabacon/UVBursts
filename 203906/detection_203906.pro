;+
;Name: detection_203906.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/08
;USING Si IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400-STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH. THEN APPLY A CUT IN 4-D PARAMETER SPACE TO GET
;UVB POPULATION REGION. THIS CODE IS USED TO DETECT UV BURSTS.

PRO detection_203906

;load the data (http://iris.lmsal.com/search/)

IRast_203906 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140213_203906/iris_l2_20140213_203906_3800258496_raster_t000_r00000.fits'

SJI1400_203906 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140213_203906/iris_l2_20140213_203906_3800258496_SJI_1400_t000.fits'

;read the data

dataRast_203906 = IRIS_OBJ(IRast_203906)

data1400_203906 = IRIS_SJI(SJI1400_203906)

;load images/profiles (WANT Si IV 1394)

dataRast_203906->SHOW_LINES
spectraRast1394_203906 = dataRast_203906->GETVAR(2, /LOAD)

images1400_203906 = data1400_203906->GETVAR()

;get spectral information

lambda1394_203906 = dataRast_203906->GETLAM(2) ;1391.3042-1396.2141
;PRINT, lambda1394_203906
pxlslitRast_203906 = dataRast_203906->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_203906

ResX1400_203906 = data1400_203906->GETRESX()
ResY1400_203906 = data1400_203906->GETRESY()

SolarX1400_203906 = data1400_203906->XSCALE()
SolarY1400_203906 = data1400_203906->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_203906 = dataRast_203906->GETEXP() ;one 0s exposures--8 s
;PRINT, exp_arrRast_203906

;get every data point in each lambda, y-pos, and image

cube1394_203906 = spectraRast1394_203906[*,*,*] ;SIZE: 3D,194,1093,400,float
;PRINT, SIZE(cube1394_203906)

;count the number of images of original cube

array1394_203906 = spectraRast1394_203906[0,0,*]

array1400_203906 = images1400_203906[0,0,*]

nImages1394_203906 = N_ELEMENTS(array1394_203906) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_203906[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_203906[0,*]))
;**********************************

;number of elements in wavelength, slit position, and 400-step image of original cube

n_img1394_203906 = N_ELEMENTS(spectraRast1394_203906[0,0,*]) ;400 images
n_wav1394_203906 = N_ELEMENTS(spectraRast1394_203906[*,0,0]) ;194 wavelengths b/w 1391-1395
n_ypos1394_203906 = N_ELEMENTS(spectraRast1394_203906[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_203906 = MEAN(MEAN(spectraRast1394_203906, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 194, float
;PRINT, SIZE(cut_203906)

;PLOT, cut_203906 ;this plot shows the overscan that you should remove

spectra1394_203906 = cut_203906[19:139]

;PLOT, spectra1394_203906

nspectraRast1394_203906 = spectraRast1394_203906[19:139,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_203906 = N_ELEMENTS(nspectraRast1394_203906[*,0,0]) ;121
;PRINT, n_wav_203906
n_ypos_203906 = N_ELEMENTS(nspectraRast1394_203906[0,*,0]) ;1093
n_img_203906 = N_ELEMENTS(nspectraRast1394_203906[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_203906-1 DO BEGIN
nspectraRast1394_203906[*,*,i] = nspectraRast1394_203906[*,*,i]/exp_arrRast_203906[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get
;lambda0 (rest wavelength)

avg_prof_203906 = MEAN(MEAN(nspectraRast1394_203906, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN) ;/NAN tag because of 0 in exposure time

avg_fit_203906 = MPFITPEAK(lambda1394_203906[19:139], avg_prof_203906, coeff_avg_203906)

wave0_203906 = coeff_avg_203906[1] ;1393.7850
;PRINT, wave0_203906

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
aspr = (ny*ResY1400_203906)/(nx*ResX1400_203906)
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

;create array to hold coeff parameters from FOR loop, images, & y-pos

coeff_arr_203906 = DBLARR(4, n_img_203906, n_ypos_203906)

;FOR loop with cut array and coeff_arr_203906 above

;CATCH in loop because of 0 sec exposure time
TIC
FOR i = 0, n_img_203906-1 DO BEGIN
	FOR j = 0, n_ypos_203906-1 DO BEGIN
		PLOT, lambda1394_203906[19:139], nspectraRast1394_203906[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_203906 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF
		YFIT_203906 = MPFITPEAK(lambda1394_203906[19:139], nspectraRast1394_203906[*,j,i], coeff_203906, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
		IF STATUS LE 0 THEN message, errmsg
		OPLOT, lambda1394_203906[19:139], YFIT_203906, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
		coeff_arr_203906[*,i,j] = coeff_203906
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF
	ENDFOR
ENDFOR
TOC ;Time elapsed: ~37.06 min

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/coeff_arr_203906.sav'
SAVE, coeff_avg_203906, coeff_203906, spectraRast1394_203906, nspectraRast1394_203906, coeff_arr_203906, wave0_203906, FILENAME = sfname

;restore coeff_arr_203906

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/coeff_arr_203906.sav'
RESTORE, rfname, /VERBOSE

;get effective area and binning spectrograph

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_203906->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_203906->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_203906->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-13T20:39:06.690

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.34158 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4681191

;0-peak intensity, 1-central wavelength , 2-line width , 3-background

;velocity conversion--exponential line width

vel_width_203906 = (coeff_arr_203906[2,*,*]/wave0_203906) * 3e5 * sqrt(2)

;perform limits--peak intensity

coeff_arr_peak_203906 = coeff_arr_203906[0,*,*]

;PRINT, lambda1394_203906[19:139]

lam2_203906 = ABS(1394.8404-wave0_203906) ;1.0554852
;PRINT, lam2_203906
lam1_203906 = ABS(1391.7876-wave0_203906) ;1.9973713
;PRINT, lam1_203906

gamma_203906 = MAX([lam2_203906,lam1_203906])
;PRINT, gamma_203906
;PRINT, (gamma_203906/wave0_203906)

velocity_203906 = ((coeff_arr_203906[1,*,*]-wave0_203906)/wave0_203906) * 3e5 ; from param_maps--doppler shift

;apply cut in 4-D parameter space to isolate UVB

cut_ind_203906 = WHERE((coeff_arr_peak_203906 GE new_peak_min) AND (vel_width_203906 GE 55) AND (vel_width_203906 LE 1000) AND (ABS(velocity_203906 LE (gamma_203906/wave0_203906) * 3e5)), COMPLEMENT = not_cut_ind_203906, count)

PRINT, N_ELEMENTS(cut_ind_203906) ;11174 (vel_width 40); 4014 (@13); now:5026

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_203906, coeff_arr_203906[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_203906[not_cut_ind_203906], coeff_arr_peak_203906[not_cut_ind_203906], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_203906[cut_ind_203906], coeff_arr_peak_203906[cut_ind_203906], COLOR = 255

;save as png

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1
WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_203906, coeff_arr_203906[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_plot_203906.png', screenshot

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_203906[not_cut_ind_203906], coeff_arr_peak_203906[not_cut_ind_203906], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_203906[cut_ind_203906], coeff_arr_peak_203906[cut_ind_203906], COLOR = 255
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/cut_intensity_plot_203906.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/intensity_plot_203906.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_203906, coeff_arr_203906[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/cut_intensity_plot_203906.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_203906[not_cut_ind_203906], coeff_arr_peak_203906[not_cut_ind_203906], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_203906', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_203906[cut_ind_203906], coeff_arr_peak_203906[cut_ind_203906], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/all_vars_203906.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_203906
OBJ_DESTROY, data1400_203906

END
