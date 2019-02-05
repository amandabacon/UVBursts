;+
;Name: detection_122033.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/14
;USING SI IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400 STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH OF APPLY A CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION REGION

;PRO detection_122033

;load the data

IRast_122033 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_122033/iris_l2_20140215_122033_3800263296_raster_t000_r00000.fits'

SJI1400_122033 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140215_122033/iris_l2_20140215_122033_3800263296_SJI_1400_t000.fits'

;read the data

dataRast_122033 = IRIS_OBJ(IRast_122033)

data1400_122033 = IRIS_SJI(SJI1400_122033)

;load images/profiles (WANT SI IV 1394)

dataRast_122033->SHOW_LINES
spectraRast1394_122033 = dataRast_122033->GETVAR(2, /LOAD)

images1400_122033 = data1400_122033->GETVAR()

;get spectral information

lambda1394_122033 = dataRast_122033->GETLAM(2) ;1391.3042-1396.2141
;PRINT, lambda1394_122033
pxlslitRast_122033 = dataRast_122033->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_122033

ResX1400_122033 = data1400_122033->GETRESX()
ResY1400_122033 = data1400_122033->GETRESY()

SolarX1400_122033 = data1400_122033->XSCALE()
SolarY1400_122033 = data1400_122033->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_122033 = dataRast_122033->GETEXP() ;two 0s exposures--30 s exp
;PRINT, exp_arrRast_122033

;get every data point in each lambda, y-pos, and image

cube1394_122033 = spectraRast1394_122033[*,*,*] ;SIZE: 3D, 194,1093,400, float
;PRINT, SIZE(cube1394_122033)

;count the number of images of original cube

array1394_122033 = spectraRast1394_122033[0,0,*]

array1400_122033 = images1400_122033[0,0,*]

nImages1394_122033 = N_ELEMENTS(array1394_122033) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_122033[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_122033[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1394_122033 = N_ELEMENTS(spectraRast1394_122033[0,0,*]) ;400 images
n_wav1394_122033 = N_ELEMENTS(spectraRast1394_122033[*,0,0]) ;194 wavelengths b/w 1391-1395
n_ypos1394_122033 = N_ELEMENTS(spectraRast1394_122033[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_122033 = MEAN(MEAN(spectraRast1394_122033, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 194, float
;PRINT, SIZE(cut_122033)

;PLOT, cut_122033

spectra1394_122033 = cut_122033[19:174]

;PLOT, spectra1394_122033

nspectraRast1394_122033 = spectraRast1394_122033[19:174,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_122033 = N_ELEMENTS(nspectraRast1394_122033[*,0,0]) ;156
PRINT, n_wav_122033
n_ypos_122033 = N_ELEMENTS(nspectraRast1394_122033[0,*,0]) ;1093
n_img_122033 = N_ELEMENTS(nspectraRast1394_122033[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_122033-1 DO BEGIN
nspectraRast1394_122033[*,*,i] = nspectraRast1394_122033[*,*,i]/exp_arrRast_122033[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_122033 = MEAN(MEAN(nspectraRast1394_122033, DIMENSION = 2, /NAN), DIMENSION = 2, /NAN)

avg_fit_122033 = MPFITPEAK(lambda1394_122033[19:174], avg_prof_122033, coeff_avg_122033)

wave0_122033 = coeff_avg_122033[1] ;1393.7752
;PRINT, wave0_122033

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
aspr = (ny*ResY1400_122033)/(nx*ResX1400_122033)
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

coeff_arr_122033 = DBLARR(4, n_img_122033, n_ypos_122033)

;FOR loop with cut array and coeff_arr_122033 above

;TIC
;FOR i = 0, n_img_122033-1 DO BEGIN
;	FOR j = 0, n_ypos_122033-1 DO BEGIN
;		PLOT, lambda1394_122033[19:174], nspectraRast1394_122033[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_122033 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
;		CATCH, Error_status
;		IF Error_status NE 0 THEN BEGIN
;		PRINT, 'ERROR INDEX: ', Error_status
;		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
;		ENDIF
;		YFIT_122033 = MPFITPEAK(lambda1394_122033[19:174], nspectraRast1394_122033[*,j,i], coeff_122033, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
;		IF STATUS LE 0 THEN message, errmsg
;		OPLOT, lambda1394_122033[19:174], YFIT_122033, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
;		coeff_arr_122033[*,i,j] = coeff_122033
;		CATCH, Error_status
;		IF Error_status NE 0 THEN BEGIN
;		PRINT, 'ERROR INDEX: ', Error_status
;		PRINT, 'ERROR MSG: ', !ERROR_STATE.MSG
;		ENDIF 
;	ENDFOR
;ENDFOR
;TOC ;Time elapsed: ~37.17 min

;save parameters from nested FOR loop

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/coeff_arr_122033.sav'
;SAVE, coeff_avg_122033, coeff_122033, spectraRast1394_122033, nspectraRast1394_122033, coeff_arr_122033, wave0_122033, FILENAME = sfname

;restore coeff_arr_122033

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/coeff_arr_122033.sav'
RESTORE, rfname, /VERBOSE

;get effective and binning spectrograph

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_122033->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_122033->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_122033->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-15T12:20:33.881

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.32860 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4249029

;velocity conversion

vel_width_122033 = (coeff_arr_122033[2,*,*]/wave0_122033) * 3e5 * sqrt(2)

;perform limits

coeff_arr_peak_122033 = coeff_arr_122033[0,*,*]

;PRINT, lambda1394_122033[19:174]

lam2_122033 = ABS(1395.7308-wave0_122033) ;1.9556416
;PRINT, lam2_122033
lam1_122033 = ABS(1391.7876-wave0_122033) ;1.9875957
;PRINT, lam1_122033

gamma_122033 = MAX([lam2_122033,lam1_122033])
;PRINT, gamma_122033
;PRINT, (gamma_122033/wave0_122033)

velocity_122033 = ((coeff_arr_122033[1,*,*]-wave0_122033)/wave0_122033) * 3e5 ; from param_maps

cut_ind_122033 = WHERE((coeff_arr_peak_122033 GE new_peak_min) AND (vel_width_122033 GE 51) AND (vel_width_122033 LE 1000) AND (ABS(velocity_122033 LE (gamma_122033/wave0_122033) * 3e5)), COMPLEMENT = not_cut_ind_122033, count)

PRINT, N_ELEMENTS(cut_ind_122033) ;7196 (peak GE 12 & vel_width GE 40), 2969@13; now:4207

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_122033, coeff_arr_122033[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_122033[not_cut_ind_122033], coeff_arr_peak_122033[not_cut_ind_122033], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_122033[cut_ind_122033], coeff_arr_peak_122033[cut_ind_122033], COLOR = 255

;save as png

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_122033, coeff_arr_122033[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/intensity_plot_122033.png', screenshot

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_122033[not_cut_ind_122033], coeff_arr_peak_122033[not_cut_ind_122033], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;TVLCT, [[255], [0], [0]], 255
;OPLOT, psym = 3, vel_width_122033[cut_ind_122033], coeff_arr_peak_122033[cut_ind_122033], COLOR = 255
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/cut_intensity_plot_122033.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/intensity_plot_122033.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_122033, coeff_arr_122033[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/cut_intensity_plot_122033.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_122033[not_cut_ind_122033], coeff_arr_peak_122033[not_cut_ind_122033], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_122033', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_122033[cut_ind_122033], coeff_arr_peak_122033[cut_ind_122033], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/all_vars_122033.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_122033
OBJ_DESTROY, data1400_122033

END
