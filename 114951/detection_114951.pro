;+
;Name: detection_114951.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/09
;USING Si IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400-STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH. THEN APPLY A CUT IN 4-D PARAMETER SPACE TO GET
;UVB POPULATION REGION. THIS CODE IS USED TO DETECT UV BURSTS.

PRO detection_114951

;load the data (http://iris.lmsal.com/search/)

IRast_114951 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_114951/iris_l2_20140214_114951_3800263296_raster_t000_r00000.fits'

SJI1400_114951 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_114951/iris_l2_20140214_114951_3800263296_SJI_1400_t000.fits'

;read the data

dataRast_114951 = IRIS_OBJ(IRast_114951)

data1400_114951 = IRIS_SJI(SJI1400_114951)

;load images/profiles (WANT Si IV 1394)

dataRast_114951->SHOW_LINES
spectraRast1394_114951 = dataRast_114951->GETVAR(2, /LOAD)

images1400_114951 = data1400_114951->GETVAR()

;get spectral information

lambda1394_114951 = dataRast_114951->GETLAM(2) ;1391.3042-1396.2396
;PRINT, lambda1394_114951
pxlslitRast_114951 = dataRast_114951->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_114951

ResX1400_114951 = data1400_114951->GETRESX()
ResY1400_114951 = data1400_114951->GETRESY()

SolarX1400_114951 = data1400_114951->XSCALE()
SolarY1400_114951 = data1400_114951->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_114951 = dataRast_114951->GETEXP() ;one 0s exposures --30 s exp.
;PRINT, exp_arrRast_114951

;get every data point in each wavelength (lambda), y-pos (slit), and
;image (400-step)

cube1394_114951 = spectraRast1394_114951[*,*,*] ;SIZE: 3D,195,1093,400,float
;PRINT, SIZE(cube1394_114951)

;count the number of images of original cube

array1394_114951 = spectraRast1394_114951[0,0,*]

array1400_114951 = images1400_114951[0,0,*]

nImages1394_114951 = N_ELEMENTS(array1394_114951) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_114951[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_114951[0,*]))
;**********************************

;number of elements in wavelength, slit position, and 400-step image of original cube

n_img1394_114951 = N_ELEMENTS(spectraRast1394_114951[0,0,*]) ;400 images
n_wav1394_114951 = N_ELEMENTS(spectraRast1394_114951[*,0,0]) ;195 wavelengths b/w 1391-1395
n_ypos1394_114951 = N_ELEMENTS(spectraRast1394_114951[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_114951 = MEAN(MEAN(spectraRast1394_114951, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 195, float
;PRINT, SIZE(cut_114951)

;PLOT, cut_114951 ;this plot shows the overscan that you should remove

spectra1394_114951 = cut_114951[19:172]

;PLOT, spectra1394_114951

nspectraRast1394_114951 = spectraRast1394_114951[19:172,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_114951 = N_ELEMENTS(nspectraRast1394_114951[*,0,0]) ;154
;PRINT, n_wav_114951
n_ypos_114951 = N_ELEMENTS(nspectraRast1394_114951[0,*,0]) ;1093
n_img_114951 = N_ELEMENTS(nspectraRast1394_114951[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_114951-1 DO BEGIN
nspectraRast1394_114951[*,*,i] = nspectraRast1394_114951[*,*,i]/exp_arrRast_114951[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get
;lambda0 (rest wavelength)

avg_prof_114951 = MEAN(MEAN(nspectraRast1394_114951, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN) ;/NAN tag because of 0 in exposure time

avg_fit_114951 = MPFITPEAK(lambda1394_114951[19:172], avg_prof_114951, coeff_avg_114951)

wave0_114951 = coeff_avg_114951[1] ;1393.7822
;PRINT, wave0_114951

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
aspr = (ny*ResY1400_114951)/(nx*ResX1400_114951)
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

coeff_arr_114951 = DBLARR(4, n_img_114951, n_ypos_114951)

;FOR loop with cut array and coeff_arr_114951 above

;CATCH in loop because of 0 sec exposure time
TIC
FOR i = 0, n_img_114951-1 DO BEGIN
	FOR j = 0, n_ypos_114951-1 DO BEGIN
		PLOT, lambda1394_114951[19:172], nspectraRast1394_114951[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_114951 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF
		YFIT_114951 = MPFITPEAK(lambda1394_114951[19:172], nspectraRast1394_114951[*,j,i], coeff_114951, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
		IF STATUS LE 0 THEN message, errmsg
		OPLOT, lambda1394_114951[19:172], YFIT_114951, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
		coeff_arr_114951[*,i,j] = coeff_114951
		CATCH, Error_status
		IF Error_status NE 0 THEN BEGIN
		PRINT, 'ERROR INDEX: ', Error_status
		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
		ENDIF
	ENDFOR
ENDFOR
TOC ;Time elapsed: ~36.66 min

;save parameters from nested FOR loop

sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/coeff_arr_114951.sav'
SAVE, coeff_avg_114951, coeff_114951, spectraRast1394_114951, nspectraRast1394_114951, coeff_arr_114951, wave0_114951, FILENAME = sfname

;restore coeff_arr_114951

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/coeff_arr_114951.sav'
RESTORE, rfname, /VERBOSE

;get effective area and binning spectrograph

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_114951->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_114951->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_114951->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-14T11:49:51.851

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.33656 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4514160

;0-peak intensity, 1-central wavelength , 2-line width , 3-background

;velocity conversion--exponential line width

vel_width_114951 = (coeff_arr_114951[2,*,*]/wave0_114951) * 3e5 * sqrt(2)

;perform limits--peak intensity

coeff_arr_peak_114951 = coeff_arr_114951[0,*,*]

;PRINT, lambda1394_114951[19:172]

lam2_114951 = ABS(1395.6799-wave0_114951) ;1.8977510
;PRINT, lam2_114951
lam1_114951 = ABS(1391.7876-wave0_114951) ;1.9945830
;PRINT, lam1_114951

gamma_114951 = MAX([lam2_114951,lam1_114951])
;PRINT, gamma_114951
;PRINT, (gamma_114951/wave0_114951)

velocity_114951 = ((coeff_arr_114951[1,*,*]-wave0_114951)/wave0_114951) * 3e5 ; from param_maps--doppler shift

;apply cut in 4-D parameter space to isolate UVB

cut_ind_114951 = WHERE((coeff_arr_peak_114951 GE new_peak_min) AND (vel_width_114951 GE 55) AND (vel_width_114951 LE 1000) AND (ABS(velocity_114951 LE (gamma_114951/wave0_114951) * 3e5)), COMPLEMENT = not_cut_ind_114951, count)

PRINT, N_ELEMENTS(cut_ind_114951) ;13204 (@vel_width 40 and peak 12); 4729@12; now:6488

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_114951, coeff_arr_114951[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_114951[not_cut_ind_114951], coeff_arr_peak_114951[not_cut_ind_114951], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_114951[cut_ind_114951], coeff_arr_peak_114951[cut_ind_114951], COLOR = 255

;save as png

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1
WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_114951, coeff_arr_114951[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/intensity_plot_114951.png', screenshot

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
TVLCT, [[255], [255], [255]], 0
PLOT, psym = 3, vel_width_114951[not_cut_ind_114951], coeff_arr_peak_114951[not_cut_ind_114951], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11850_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_114951[cut_ind_114951], coeff_arr_peak_114951[cut_ind_114951], COLOR = 255
screenshot = TVRD(TRUE = 1)
WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/cut_intensity_plot_114951.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/intensity_plot_114951.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_114951, coeff_arr_114951[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/cut_intensity_plot_114951.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_114951[not_cut_ind_114951], coeff_arr_peak_114951[not_cut_ind_114951], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_114951', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_114951[cut_ind_114951], coeff_arr_peak_114951[cut_ind_114951], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/all_vars_114951.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_114951
OBJ_DESTROY, data1400_114951

END
