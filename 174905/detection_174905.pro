;+
;Name: detection_174905.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/09/10
;USING SI IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400 STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH OF APPLY A CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION REGION

;PRO detection_174905

;load the data

IRast_174905 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_174905/iris_l2_20140214_174905_3800254296_raster_t000_r00000.fits'

SJI1400_174905 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140214_174905/iris_l2_20140214_174905_3800254296_SJI_1400_t000.fits'

;read the data

dataRast_174905 = IRIS_OBJ(IRast_174905)

data1400_174905 = IRIS_SJI(SJI1400_174905)

;load images/profiles (WANT SI IV 1394)

dataRast_174905->SHOW_LINES
spectraRast1394_174905 = dataRast_174905->GETVAR(2, /LOAD)

images1400_174905 = data1400_174905->GETVAR()

;get spectral information

lambda1394_174905 = dataRast_174905->GETLAM(2) ;1391.3042-1396.2141
;PRINT, lambda1394_174905
pxlslitRast_174905 = dataRast_174905->GETNSLIT(2) ;1092
;PRINT, pxlslitRast_174905

ResX1400_174905 = data1400_174905->GETRESX()
ResY1400_174905 = data1400_174905->GETRESY()

SolarX1400_174905 = data1400_174905->XSCALE()
SolarY1400_174905 = data1400_174905->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_174905 = dataRast_174905->GETEXP() ;no 0s exposures--2 s exp
;PRINT, exp_arrRast_174905

;get every data point in each lambda, y-pos, and image

cube1394_174905 = spectraRast1394_174905[*,*,*] ;SIZE: 3D, 194,1092,400, float
;PRINT, SIZE(cube1394_174905)

;count the number of images of original cube

array1394_174905 = spectraRast1394_174905[0,0,*]

array1400_174905 = images1400_174905[0,0,*]

nImages1394_174905 = N_ELEMENTS(array1394_174905) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_174905[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_174905[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1394_174905 = N_ELEMENTS(spectraRast1394_174905[0,0,*]) ;400 images
n_wav1394_174905 = N_ELEMENTS(spectraRast1394_174905[*,0,0]) ;194 wavelengths b/w 1391-1395
n_ypos1394_174905 = N_ELEMENTS(spectraRast1394_174905[0,*,0]) ;1092 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_174905 = MEAN(MEAN(spectraRast1394_174905, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 194, float
;PRINT, SIZE(cut_174905)

;PLOT, cut_174905

spectra1394_174905 = cut_174905[20:173]

;PLOT, spectra1394_174905

nspectraRast1394_174905 = spectraRast1394_174905[20:173,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_174905 = N_ELEMENTS(nspectraRast1394_174905[*,0,0]) ;154
;PRINT, n_wav_174905
n_ypos_174905 = N_ELEMENTS(nspectraRast1394_174905[0,*,0]) ;1092
n_img_174905 = N_ELEMENTS(nspectraRast1394_174905[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_174905-1 DO BEGIN
nspectraRast1394_174905[*,*,i] = nspectraRast1394_174905[*,*,i]/exp_arrRast_174905[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_174905 = MEAN(MEAN(nspectraRast1394_174905, DIMENSION = 2), DIMENSION = 2)

avg_fit_174905 = MPFITPEAK(lambda1394_174905[20:173], avg_prof_174905, coeff_avg_174905)

wave0_174905 = coeff_avg_174905[1] ;1393.7887
;PRINT, wave0_174905

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
aspr = (ny*ResY1400_174905)/(nx*ResX1400_174905)
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

coeff_arr_174905 = DBLARR(4, n_img_174905, n_ypos_174905)

;FOR loop with cut array and coeff_arr_174905 above

;TIC
;FOR i = 0, n_img_174905-1 DO BEGIN
;	FOR j = 0, n_ypos_174905-1 DO BEGIN
;		PLOT, lambda1394_174905[20:173], nspectraRast1394_174905[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_174905 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
;		YFIT_174905 = MPFITPEAK(lambda1394_174905[20:173], nspectraRast1394_174905[*,j,i], coeff_174905, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
;		OPLOT, lambda1394_174905[20:173], YFIT_174905, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
;		coeff_arr_174905[*,i,j] = coeff_174905
;	ENDFOR
;ENDFOR
;TOC ;Time elapsed: ~50.98 min

;save parameters from nested FOR loop

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/coeff_arr_174905.sav'
;SAVE, coeff_avg_174905, coeff_174905, spectraRast1394_174905, nspectraRast1394_174905, coeff_arr_174905, wave0_174905, FILENAME = sfname

;restore coeff_arr_174905

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/coeff_arr_174905.sav'
RESTORE, rfname, /VERBOSE

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_174905->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_174905->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_174905->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-14T17:49:05.850

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.33460 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.4448881

;velocity conversion

vel_width_174905 = (coeff_arr_174905[2,*,*]/wave0_174905) * 3e5 * sqrt(2)

;perform limits

coeff_arr_peak_174905 = coeff_arr_174905[0,*,*]

;PRINT, lambda1394_174905[20:173]

lam2_174905 = ABS(1395.7053-wave0_174905) ;1.9166114
;PRINT, lam2_174905
lam1_174905 = ABS(1391.8130-wave0_174905) ;1.9757225
;PRINT, lam1_174905

gamma_174905 = MAX([lam2_174905,lam1_174905])
;PRINT, gamma_174905
;PRINT, (gamma_174905/wave0_174905)

velocity_174905 = ((coeff_arr_174905[1,*,*]-wave0_174905)/wave0_174905) * 3e5 ; from param_maps

cut_ind_174905 = WHERE((coeff_arr_peak_174905 GE new_peak_min) AND (vel_width_174905 GE 55) AND (vel_width_174905 LE 1000) AND (ABS(velocity_174905 LE (gamma_174905/wave0_174905) * 3e5)), COMPLEMENT = not_cut_ind_174905, count)

PRINT, N_ELEMENTS(cut_ind_174905) ;12871 (@vel_width 40 peak 12); 4875 @14; now:5333

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_174905, coeff_arr_174905[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_174905[not_cut_ind_174905], coeff_arr_peak_174905[not_cut_ind_174905], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_174905[cut_ind_174905], coeff_arr_peak_174905[cut_ind_174905], COLOR = 255

;save as png

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_174905, coeff_arr_174905[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/intensity_plot_174905.png', screenshot

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_174905[not_cut_ind_174905], coeff_arr_peak_174905[not_cut_ind_174905], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;TVLCT, [[255], [0], [0]], 255
;OPLOT, psym = 3, vel_width_174905[cut_ind_174905], coeff_arr_peak_174905[cut_ind_174905], COLOR = 255
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/cut_intensity_plot_174905.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/intensity_plot_174905.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_174905, coeff_arr_174905[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/cut_intensity_plot_174905.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_174905[not_cut_ind_174905], coeff_arr_peak_174905[not_cut_ind_174905], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_174905', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_174905[cut_ind_174905], coeff_arr_peak_174905[cut_ind_174905], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/all_vars_174905.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_174905
OBJ_DESTROY, data1400_174905

END
