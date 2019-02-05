;+
;Name: detection_201925.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2018/10/05
;USING SI IV 1394 LINE, APPLY 4-PARAMETER SINGLE GAUSSIAN FIT (SGF) TO
;EACH SPECTRA OVER 400 STEP RASTER TO MAKE A SCATTER PLOT OF PEAK
;INTENSITY VS LINE WIDTH OF APPLY A CUT IN 4-D PARAMETER SPACE TO GET UVB POPULATION REGION

;PRO detection_201925

;load the data

IRast_201925 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_201925/iris_l2_20140216_201925_3800254296_raster_t000_r00000.fits'

SJI1400_201925 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/AR11974/20140216_201925/iris_l2_20140216_201925_3800254296_SJI_1400_t000.fits'

;read the data

dataRast_201925 = IRIS_OBJ(IRast_201925)

data1400_201925 = IRIS_SJI(SJI1400_201925)

;load images/profiles (WANT SI IV 1394)

dataRast_201925->SHOW_LINES
spectraRast1394_201925 = dataRast_201925->GETVAR(2, /LOAD)

images1400_201925 = data1400_201925->GETVAR()

;get spectral information

lambda1394_201925 = dataRast_201925->GETLAM(2) ;1391.3042-1396.2141
;PRINT, lambda1394_201925
pxlslitRast_201925 = dataRast_201925->GETNSLIT(2) ;1093
;PRINT, pxlslitRast_201925

ResX1400_201925 = data1400_201925->GETRESX()
ResY1400_201925 = data1400_201925->GETRESY()

SolarX1400_201925 = data1400_201925->XSCALE()
SolarY1400_201925 = data1400_201925->YSCALE()

;get exposure time in prep for normalization

exp_arrRast_201925 = dataRast_201925->GETEXP() ;no 0s exposures--2s exp
;PRINT, exp_arrRast_201925

;get every data point in each lambda, y-pos, and image

cube1394_201925 = spectraRast1394_201925[*,*,*] ;SIZE: 3D, 194,1093,400, float
;PRINT, SIZE(cube1394_201925)

;count the number of images of original cube

array1394_201925 = spectraRast1394_201925[0,0,*]

array1400_201925 = images1400_201925[0,0,*]

nImages1394_201925 = N_ELEMENTS(array1394_201925) ;400 images

;********GUIDANCE FROM CHAD********
;Takes the array image values and
;determines the size of the array
;in x/y through N_ELEMENTS.
;The array elements are integers, so
;DOUBLE() transforms them into decimals.

nx = DOUBLE(N_ELEMENTS(array1400_201925[*,0]))
ny = DOUBLE(N_ELEMENTS(array1400_201925[0,*]))
;**********************************

;number of elements in wavelength, ypos, and image of original cube

n_img1394_201925 = N_ELEMENTS(spectraRast1394_201925[0,0,*]) ;400 images
n_wav1394_201925 = N_ELEMENTS(spectraRast1394_201925[*,0,0]) ;194 wavelengths b/w 1391-1395
n_ypos1394_201925 = N_ELEMENTS(spectraRast1394_201925[0,*,0]) ;1093 y-positions

;remove overscan by making a tilt and applying a cut, then make a new array

cut_201925 = MEAN(MEAN(spectraRast1394_201925, DIMENSION = 2), DIMENSION = 2) ;SIZE: 1D, 194, float
;PRINT, SIZE(cut_201925)

;PLOT, cut_201925

spectra1394_201925 = cut_201925[19:173]

;PLOT, spectra1394_201925

nspectraRast1394_201925 = spectraRast1394_201925[19:173,*,*]

;number of elements in new array: wavelength, ypos, and image of cut cube

n_wav_201925 = N_ELEMENTS(nspectraRast1394_201925[*,0,0]) ;155
;PRINT, n_wav_201925
n_ypos_201925 = N_ELEMENTS(nspectraRast1394_201925[0,*,0]) ;1093
n_img_201925 = N_ELEMENTS(nspectraRast1394_201925[0,0,*]) ;400

;loop for (new) exposure time normalization

FOR i = 0, nImages1394_201925-1 DO BEGIN
nspectraRast1394_201925[*,*,i] = nspectraRast1394_201925[*,*,i]/exp_arrRast_201925[i]
ENDFOR

;get average Si IV line profile of entire observation in order to get lambda0

avg_prof_201925 = MEAN(MEAN(nspectraRast1394_201925, DIMENSION = 2), DIMENSION = 2)

avg_fit_201925 = MPFITPEAK(lambda1394_201925[19:173], avg_prof_201925, coeff_avg_201925)

wave0_201925 = coeff_avg_201925[1] ;1393.7710
;PRINT, wave0_201925

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
aspr = (ny*ResY1400_201925)/(nx*ResX1400_201925)
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

coeff_arr_201925 = DBLARR(4, n_img_201925, n_ypos_201925)

;FOR loop with cut array and coeff_arr_201925 above

;TIC
;FOR i = 0, n_img_201925-1 DO BEGIN
;	FOR j = 0, n_ypos_201925-1 DO BEGIN
;		PLOT, lambda1394_201925[19:173], nspectraRast1394_201925[*,j,i], XRANGE = [1391.3, 1396.2], TITLE = 'AR11974_201925 Gaussian Fit', XTITLE = 'Wavelength', YTITLE = 'Intensity'
;		YFIT_201925 = MPFITPEAK(lambda1394_201925[19:173], nspectraRast1394_201925[*,j,i], coeff_201925, NTERMS = 4, STATUS = status, ERRMSG = errmsg)
;		OPLOT, lambda1394_201925[19:173], YFIT_201925, COLOR = 170, LINESTYLE = 2, THICK = 5
;		WAIT, 0.05 ;chance to see fits
;		coeff_arr_201925[*,i,j] = coeff_201925
;	ENDFOR
;ENDFOR
;TOC ;Time elapsed: ~43.50 min

;save parameters from nested FOR loop

;sfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/coeff_arr_201925.sav'
;SAVE, coeff_avg_201925, coeff_201925, spectraRast1394_201925, nspectraRast1394_201925, coeff_arr_201925, wave0_201925, FILENAME = sfname

;restore coeff_arr_201925

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/coeff_arr_201925.sav'
RESTORE, rfname, /VERBOSE

;get effective and binning spectrograph

oea = 2.10179 ;at 1395 angstrom--cm^2--original effective area
oasr = 0.02544 ;A/pxl original average spectral resolution
orig_peak_min = 7 ;from 050945

win_ind = dataRast_201925->GETWINDX(1394) ;spectral window containing Si IV 1394 A line w/o SHOW_LINES()
PRINT, win_ind ;2

ave_spec_res = dataRast_201925->GETDISPERSION(win_ind[0]) ;spectral window containing Si IV 1394 A
PRINT, ave_spec_res ;0.025440000 (no binning change)

datetime = dataRast_201925->GETINFO('DATE_OBS') ;extract date and time of observation
PRINT, datetime ;2014-02-16T20:19:25.910

ea_struct = IRIS_GET_RESPONSE(datetime) ;find the effective area using time data
;PRINT, ea_struct

efarea = ea_struct.area_sg[WHERE(ea_struct.lambda EQ 139.5)]
PRINT, efarea ;1.31847 (effective area (sensitivity decay) has gone down)
PRINT, WHERE(ea_struct.lambda EQ 139.5) ;390

new_peak_min = orig_peak_min*(efarea[0]/oea)*(ave_spec_res/oasr)
PRINT, new_peak_min ;4.3911448

;velocity conversion

vel_width_201925 = (coeff_arr_201925[2,*,*]/wave0_201925) * 3e5 * sqrt(2)

;perform limits

coeff_arr_peak_201925 = coeff_arr_201925[0,*,*]

;PRINT, lambda1394_201925[19:173]

lam2_201925 = ABS(1395.7053-wave0_201925) ;1.9343616
;PRINT, lam2_201925
lam1_201925 = ABS(1391.7876-wave0_201925) ;1.9833630
;PRINT, lam1_201925

gamma_201925 = MAX([lam2_201925,lam1_201925])
;PRINT, gamma_201925
;PRINT, (gamma_201925/wave0_201925)

velocity_201925 = ((coeff_arr_201925[1,*,*]-wave0_201925)/wave0_201925) * 3e5 ; from param_maps

cut_ind_201925 = WHERE((coeff_arr_peak_201925 GE new_peak_min) AND (vel_width_201925 GE 40) AND (vel_width_201925 LE 1000) AND (ABS(velocity_201925 LE (gamma_201925/wave0_201925) * 3e5)), COMPLEMENT = not_cut_ind_201925, count)

PRINT, N_ELEMENTS(cut_ind_201925) ;4261@12; now:7311

WINDOW, XSIZE = 900, YSIZE = 700
TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

;intensity v width plot

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_201925, coeff_arr_201925[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]

;perform isolation of UV burst region

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, vel_width_201925[not_cut_ind_201925], coeff_arr_peak_201925[not_cut_ind_201925], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy]
TVLCT, [[255], [0], [0]], 255
OPLOT, psym = 3, vel_width_201925[cut_ind_201925], coeff_arr_peak_201925[cut_ind_201925], COLOR = 255

;save as png

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1
;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_201925, coeff_arr_201925[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/intensity_plot_201925.png', screenshot

;TVLCT, [[0], [0], [0]], 1
;!P.BACKGROUND = 1

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;TVLCT, [[255], [255], [255]], 0
;PLOT, psym = 3, vel_width_201925[not_cut_ind_201925], coeff_arr_peak_201925[not_cut_ind_201925], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 0, XTHICK = 4, YTHICK = 4, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.45, YCHARSIZE = 1.45
;TVLCT, [[255], [0], [0]], 255
;OPLOT, psym = 3, vel_width_201925[cut_ind_201925], coeff_arr_peak_201925[cut_ind_201925], COLOR = 255
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/cut_intensity_plot_201925.png', screenshot

;save as ps

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/intensity_plot_201925.eps', /ENCAPSULATED

PLOT, psym = 3, vel_width_201925, coeff_arr_201925[0,*,*], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

TVLCT, [[0], [0], [0]], 1
!P.BACKGROUND = 1

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/cut_intensity_plot_201925.eps', /ENCAPSULATED

TVLCT, [[0], [0], [0]], 1
PLOT, psym = 3, vel_width_201925[not_cut_ind_201925], coeff_arr_peak_201925[not_cut_ind_201925], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Instensity [Arb. Units]', TITLE = 'Scatter Plot of Intensity vs Width AR11974_201925', /XLOG, /YLOG, XRANGE = [10e-3,10e6], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10
TVLCT, [[173], [255], [47]], 173
OPLOT, psym = 3, vel_width_201925[cut_ind_201925], coeff_arr_peak_201925[cut_ind_201925], COLOR = 173

DEVICE, /CLOSE

;save all variables

sfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/all_vars_201925.sav'
SAVE, /VARIABLES, FILENAME = sfname2

OBJ_DESTROY, dataRast_201925
OBJ_DESTROY, data1400_201925

END
