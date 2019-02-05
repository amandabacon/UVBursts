;+
;Name: master_hist.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/02/01
;RESTORE ALL SAVE FILES FROM EACH OBSERVATION IN 'Oiv_1401_SGF' IN
;ORDER TO CREATE ONE MASTER HISTOGRAM OF ALL SNRs AND THE FREQUENCY OF
;APPEARANCE OF O IV EMISSION LINE IN UVB SPECTRA.

;PRO master_hist

;restore 004121 TIIs, SNRs, etc.

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname

PRINT, "one"

PRINT, SIZE(SNR_O_004121[SNR2_O_004121]) ;464
one = SNR_O_004121[SNR2_O_004121]

num_three = WHERE((SNR_O_004121[SNR2_O_004121] GT 3.0), count) ;90
PRINT, SIZE(num_three)
num_five = WHERE((SNR_O_004121[SNR2_O_004121] GT 5.0), count) ;47
PRINT, SIZE(num_five)
num_ten = WHERE((SNR_O_004121[SNR2_O_004121] GT 10.0), count) ;12
PRINT, SIZE(num_ten)
num_twenty = WHERE((SNR_O_004121[SNR2_O_004121] GT 20.0), count) ;3
PRINT, SIZE(num_twenty)
num_forty = WHERE((SNR_O_004121[SNR2_O_004121] GT 40.0), count) ;3
PRINT, SIZE(num_forty)

;restore 050655 TIIs, SNRs, etc.

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/sigma_coeff_arr_050655_Oiv.sav'
RESTORE, rfname2

PRINT, "two"

PRINT, SIZE(SNR_O_050655[SNR2_O_050655]) ;279
two = SNR_O_050655[SNR2_O_050655]

num2_three = WHERE((SNR_O_050655[SNR2_O_050655] GT 3.0), count) ;66
PRINT, SIZE(num2_three)
num2_five = WHERE((SNR_O_050655[SNR2_O_050655] GT 5.0), count) ;33
PRINT, SIZE(num2_five)
num2_ten = WHERE((SNR_O_050655[SNR2_O_050655] GT 10.0), count) ;15
PRINT, SIZE(num2_ten)
num2_twenty = WHERE((SNR_O_050655[SNR2_O_050655] GT 20.0), count) ;1
PRINT, SIZE(num2_twenty)
num2_forty = WHERE((SNR_O_050655[SNR2_O_050655] GT 40.0), count) ;3
PRINT, SIZE(num2_forty)

;restore 050655_1 TIIs, SNRs, etc.

rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/sigma_coeff_arr_050655_1_Oiv.sav'
RESTORE, rfname3

PRINT, "three"

PRINT, SIZE(SNR_O_050655_1[SNR2_O_050655_1]) ;384
three = SNR_O_050655_1[SNR2_O_050655_1]

num3_three = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 3.0), count) ;109
PRINT, SIZE(num3_three)
num3_five = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 5.0), count) ;47
PRINT, SIZE(num3_five)
num3_ten = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 10.0), count) ;3
PRINT, SIZE(num3_ten)
num3_twenty = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 20.0), count) ;3
PRINT, SIZE(num3_twenty)
num3_forty = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 40.0), count) ;3
PRINT, SIZE(num3_forty)

;restore 052046 TIIs, SNRs, etc.

rfname4 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/sigma_coeff_arr_052046_Oiv.sav'
RESTORE, rfname4

PRINT, "four"

PRINT, SIZE(SNR_O_052046[SNR2_O_052046]) ;2656
four = SNR_O_052046[SNR2_O_052046]

num4_three = WHERE((SNR_O_052046[SNR2_O_052046] GT 3.0), count) ;1231
PRINT, SIZE(num4_three)
num4_five = WHERE((SNR_O_052046[SNR2_O_052046] GT 5.0), count) ;859
PRINT, SIZE(num4_five)
num4_ten = WHERE((SNR_O_052046[SNR2_O_052046] GT 10.0), count) ;570
PRINT, SIZE(num4_ten)
num4_twenty = WHERE((SNR_O_052046[SNR2_O_052046] GT 20.0), count) ;200
PRINT, SIZE(num4_twenty)
num4_forty = WHERE((SNR_O_052046[SNR2_O_052046] GT 40.0), count) ;20
PRINT, SIZE(num4_forty)

;restore 061606 TIIs, SNRs, etc.

rfname5 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/sigma_coeff_arr_061606_Oiv.sav'
RESTORE, rfname5

PRINT, "five"

PRINT, SIZE(SNR_O_061606[SNR2_O_061606]) ;414
five = SNR_O_061606[SNR2_O_061606]

num5_three = WHERE((SNR_O_061606[SNR2_O_061606] GT 3.0), count) ;108
PRINT, SIZE(num5_three)
num5_five = WHERE((SNR_O_061606[SNR2_O_061606] GT 5.0), count) ;67
PRINT, SIZE(num5_five)
num5_ten = WHERE((SNR_O_061606[SNR2_O_061606] GT 10.0), count) ;18
PRINT, SIZE(num5_ten)
num5_twenty = WHERE((SNR_O_061606[SNR2_O_061606] GT 20.0), count) ;1
PRINT, SIZE(num5_twenty)
num5_forty = WHERE((SNR_O_061606[SNR2_O_061606] GT 40.0), count) ;3
PRINT, SIZE(num5_forty)

;restore 114951 TIIs, SNRs, etc.

rfname6 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/sigma_coeff_arr_114951_Oiv.sav'
RESTORE, rfname6

PRINT, "six"

PRINT, SIZE(SNR_O_114951[SNR2_O_114951]) ;887
six = SNR_O_114951[SNR2_O_114951]

num6_three = WHERE((SNR_O_114951[SNR2_O_114951] GT 3.0), count) ;160
PRINT, SIZE(num6_three)
num6_five = WHERE((SNR_O_114951[SNR2_O_114951] GT 5.0), count) ;73
PRINT, SIZE(num6_five)
num6_ten = WHERE((SNR_O_114951[SNR2_O_114951] GT 10.0), count) ;28
PRINT, SIZE(num6_ten)
num6_twenty = WHERE((SNR_O_114951[SNR2_O_114951] GT 20.0), count) ;10
PRINT, SIZE(num6_twenty)
num6_forty = WHERE((SNR_O_114951[SNR2_O_114951] GT 40.0), count) ;1
PRINT, SIZE(num6_forty)

;restore 122033 TIIs, SNRs, etc.

rfname7 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/sigma_coeff_arr_122033_Oiv.sav'
RESTORE, rfname7

PRINT, "seven"

PRINT, SIZE(SNR_O_122033[SNR2_O_122033]) ;914
seven = SNR_O_122033[SNR2_O_122033]

num7_three = WHERE((SNR_O_122033[SNR2_O_122033] GT 3.0), count) ;399
PRINT, SIZE(num7_three)
num7_five = WHERE((SNR_O_122033[SNR2_O_122033] GT 5.0), count) ;248
PRINT, SIZE(num7_five)
num7_ten = WHERE((SNR_O_122033[SNR2_O_122033] GT 10.0), count) ;57
PRINT, SIZE(num7_ten)
num7_twenty = WHERE((SNR_O_122033[SNR2_O_122033] GT 20.0), count) ;5
PRINT, SIZE(num7_twenty)
num7_forty = WHERE((SNR_O_122033[SNR2_O_122033] GT 40.0), count) ;3
PRINT, SIZE(num7_forty)

;restore 160806 TIIs, SNRs, etc.

rfname8 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/sigma_coeff_arr_160806_Oiv.sav'
RESTORE, rfname8

PRINT, "eight"

PRINT, SIZE(SNR_O_160806[SNR2_O_160806]) ;574
eight = SNR_O_160806[SNR2_O_160806]

num8_three = WHERE((SNR_O_160806[SNR2_O_160806] GT 3.0), count) ;157
PRINT, SIZE(num8_three)
num8_five = WHERE((SNR_O_160806[SNR2_O_160806] GT 5.0), count) ;69
PRINT, SIZE(num8_five)
num8_ten = WHERE((SNR_O_160806[SNR2_O_160806] GT 10.0), count) ;7
PRINT, SIZE(num8_ten)
num8_twenty = WHERE((SNR_O_160806[SNR2_O_160806] GT 20.0), count) ;1
PRINT, SIZE(num8_twenty)
num8_forty = WHERE((SNR_O_160806[SNR2_O_160806] GT 40.0), count) ;3
PRINT, SIZE(num8_forty)

;restore 163205 TIIs, SNRs, etc.

rfname9 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
RESTORE, rfname9

PRINT, "nine"

PRINT, SIZE(SNR_O_163205[SNR2_O_163205]) ;483
nine = SNR_O_163205[SNR2_O_163205]

num9_three = WHERE((SNR_O_163205[SNR2_O_163205] GT 3.0), count) ;71
PRINT, SIZE(num9_three)
num9_five = WHERE((SNR_O_163205[SNR2_O_163205] GT 5.0), count) ;21
PRINT, SIZE(num9_five)
num9_ten = WHERE((SNR_O_163205[SNR2_O_163205] GT 10.0), count) ;1
PRINT, SIZE(num9_ten)
num9_twenty = WHERE((SNR_O_163205[SNR2_O_163205] GT 20.0), count) ;3
PRINT, SIZE(num9_twenty)
num9_forty = WHERE((SNR_O_163205[SNR2_O_163205] GT 40.0), count) ;3
PRINT, SIZE(num9_forty)

;restore 174905 TIIs, SNRs, etc.

rfname10 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/sigma_coeff_arr_174905_Oiv.sav'
RESTORE, rfname10

PRINT, "ten"

PRINT, SIZE(SNR_O_174905[SNR2_O_174905]) ;712
ten = SNR_O_174905[SNR2_O_174905]

num10_three = WHERE((SNR_O_174905[SNR2_O_174905] GT 3.0), count) ;244
PRINT, SIZE(num10_three)
num10_five = WHERE((SNR_O_174905[SNR2_O_174905] GT 5.0), count) ;193
PRINT, SIZE(num10_five)
num10_ten = WHERE((SNR_O_174905[SNR2_O_174905] GT 10.0), count) ;95
PRINT, SIZE(num10_ten)
num10_twenty = WHERE((SNR_O_174905[SNR2_O_174905] GT 20.0), count) ;10
PRINT, SIZE(num10_twenty)
num10_forty = WHERE((SNR_O_174905[SNR2_O_174905] GT 40.0), count) ;3
PRINT, SIZE(num10_forty)

;restore 181205 TIIs, SNRs, etc.

rfname11 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/sigma_coeff_arr_181205_Oiv.sav'
RESTORE, rfname11

PRINT, "eleven"

PRINT, SIZE(SNR_O_181205[SNR2_O_181205]) ;349
eleven = SNR_O_181205[SNR2_O_181205]

num11_three = WHERE((SNR_O_181205[SNR2_O_181205] GT 3.0), count) ;71
PRINT, SIZE(num11_three)
num11_five = WHERE((SNR_O_181205[SNR2_O_181205] GT 5.0), count) ;41
PRINT, SIZE(num11_five)
num11_ten = WHERE((SNR_O_181205[SNR2_O_181205] GT 10.0), count) ;3
PRINT, SIZE(num11_ten)
num11_twenty = WHERE((SNR_O_181205[SNR2_O_181205] GT 20.0), count) ;3
PRINT, SIZE(num11_twenty)
num11_forty = WHERE((SNR_O_181205[SNR2_O_181205] GT 40.0), count) ;3
PRINT, SIZE(num11_forty)

;restore 201925 TIIs, SNRs, etc.

rfname12 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/sigma_coeff_arr_201925_Oiv.sav'
RESTORE, rfname12

PRINT, "twelve"

PRINT, SIZE(SNR_O_201925[SNR2_O_201925]) ;572
twelve = SNR_O_201925[SNR2_O_201925]

num12_three = WHERE((SNR_O_201925[SNR2_O_201925] GT 3.0), count) ;59
PRINT, SIZE(num12_three)
num12_five = WHERE((SNR_O_201925[SNR2_O_201925] GT 5.0), count) ;13
PRINT, SIZE(num12_five)
num12_ten = WHERE((SNR_O_201925[SNR2_O_201925] GT 10.0), count) ;3
PRINT, SIZE(num12_ten)
num12_twenty = WHERE((SNR_O_201925[SNR2_O_201925] GT 20.0), count) ;3
PRINT, SIZE(num12_twenty)
num12_forty = WHERE((SNR_O_201925[SNR2_O_201925] GT 40.0), count) ;3
PRINT, SIZE(num12_forty)

;restore 201925_1 TIIs, SNRs, etc.

rfname13 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/sigma_coeff_arr_201925_1_Oiv.sav'
RESTORE, rfname13

PRINT, "thirteen"

PRINT, SIZE(SNR_O_201925_1[SNR2_O_201925_1]) ;303
thirteen = SNR_O_201925_1[SNR2_O_201925_1]

num13_three = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 3.0), count) ;58
PRINT, SIZE(num13_three)
num13_five = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 5.0), count) ;24
PRINT, SIZE(num13_five)
num13_ten = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 10.0), count) ;7
PRINT, SIZE(num13_ten)
num13_twenty = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 20.0), count) ;3
PRINT, SIZE(num13_twenty)
num13_forty = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 40.0), count) ;3
PRINT, SIZE(num13_forty)

;restore 203906 TIIs, SNRs, etc.

rfname14 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
RESTORE, rfname14

PRINT, "fourteen"

PRINT, SIZE(SNR_O_203906[SNR2_O_203906]) ;1157
fourteen = SNR_O_203906[SNR2_O_203906]

num14_three = WHERE((SNR_O_203906[SNR2_O_203906] GT 3.0), count) ;340
PRINT, SIZE(num14_three)
num14_five = WHERE((SNR_O_203906[SNR2_O_203906] GT 5.0), count) ;224
PRINT, SIZE(num14_five)
num14_ten = WHERE((SNR_O_203906[SNR2_O_203906] GT 10.0), count) ;70
PRINT, SIZE(num14_ten)
num14_twenty = WHERE((SNR_O_203906[SNR2_O_203906] GT 20.0), count) ;3
PRINT, SIZE(num14_twenty)
num14_forty = WHERE((SNR_O_203906[SNR2_O_203906] GT 40.0), count) ;3
PRINT, SIZE(num14_forty)

;restore 215426 TIIs, SNRs, etc.

rfname15 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/sigma_coeff_arr_215426_Oiv.sav'
RESTORE, rfname15

PRINT, "fifteen"

PRINT, SIZE(SNR_O_215426[SNR2_O_215426]) ;194
fifteen = SNR_O_215426[SNR2_O_215426]

num15_three = WHERE((SNR_O_215426[SNR2_O_215426] GT 3.0), count) ;26
PRINT, SIZE(num15_three)
num15_five = WHERE((SNR_O_215426[SNR2_O_215426] GT 5.0), count) ;15
PRINT, SIZE(num15_five)
num15_ten = WHERE((SNR_O_215426[SNR2_O_215426] GT 10.0), count) ;3
PRINT, SIZE(num15_ten)
num15_twenty = WHERE((SNR_O_215426[SNR2_O_215426] GT 20.0), count) ;3
PRINT, SIZE(num15_twenty)
num15_forty = WHERE((SNR_O_215426[SNR2_O_215426] GT 40.0), count) ;3
PRINT, SIZE(num15_forty)

;restore 232931 TIIs, SNRs, etc.

rfname16 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/sigma_coeff_arr_232931_Oiv.sav'
RESTORE, rfname16

PRINT, "sixteen"

PRINT, SIZE(SNR_O_232931[SNR2_O_232931]) ;225
sixteen = SNR_O_232931[SNR2_O_232931]

num16_three = WHERE((SNR_O_232931[SNR2_O_232931] GT 3.0), count) ;28
PRINT, SIZE(num16_three)
num16_five = WHERE((SNR_O_232931[SNR2_O_232931] GT 5.0), count) ;10
PRINT, SIZE(num16_five)
num16_ten = WHERE((SNR_O_232931[SNR2_O_232931] GT 10.0), count) ;3
PRINT, SIZE(num16_ten)
num16_twenty = WHERE((SNR_O_232931[SNR2_O_232931] GT 20.0), count) ;3
PRINT, SIZE(num16_twenty)
num16_forty = WHERE((SNR_O_232931[SNR2_O_232931] GT 40.0), count) ;3
PRINT, SIZE(num16_forty)

;===============================================================================
;get overall values of SNRs

total_SNR = [one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen]
PRINT, SIZE(total_SNR) ;10567

PRINT, N_ELEMENTS(WHERE((total_SNR GT 3.00), count)) ;3217
;t = WHERE((total_SNR GT 3.00), count)
;PRINT, total_SNR[t]
;PRINT, 'sep'
PRINT, N_ELEMENTS(WHERE((total_SNR GT 5.00), count)) ;1984
PRINT, N_ELEMENTS(WHERE((total_SNR GT 10.00), count)) ;889
PRINT, N_ELEMENTS(WHERE((total_SNR GT 20.00), count)) ;228
;t2 = WHERE((total_SNR GT 20.00), count)
;PRINT, total_SNR[t2]
PRINT, N_ELEMENTS(WHERE((total_SNR GT 40.00), count, /NULL)) ;21

;===============================================================================
;restore variable for window and create plots

rfnamee = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/all_vars_004121.sav'
RESTORE, rfnamee

;master histogram log

SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Master Histogram of Signal-to-Noise of AR11974", /YLOG, YRANGE = [1.0e-1,1.0e4]

;not log

;SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Master Histogram of Signal-to-Noise of AR11974"

;save as png

;WINDOW, XSIZE = 900, YSIZE = 700, RETAIN = 2
;SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Master Histogram of Signal-to-Noise of AR11974", /YLOG, YRANGE = [1.0e-1,1.0e4], POSITION = [x0,y0,x0+dx,y0+dy]
;screenshot = TVRD(TRUE = 1)
;WRITE_PNG, '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/master_histogram.png', screenshot

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/master_histogram.eps', /ENCAPSULATED

SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
PLOT, x_hist, SNR_hist, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Master Histogram of Signal-to-Noise of AR11974", /YLOG, YRANGE = [1.0e-1,1.0e4], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

;===============================================================================

;cumulative histogram

;SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;cum = TOTAL(SNR_hist, /CUMULATIVE)
;PLOT, x_hist, cum, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Cumulative Frequency", TITLE = "Cumulative Frequency Histogram of Signal-to-Noise of AR11974", /YLOG

;save as ps

;!P.FONT = 1

;TVLCT, [[255],[255],[255]], 1
;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 8.8, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/cum_histogram.eps', /ENCAPSULATED

;SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;cum = TOTAL(SNR_hist, /CUMULATIVE)
;PLOT, x_hist, cum, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Cumulative Frequency", TITLE = "Cumulative Frequency Histogram of Signal-to-Noise of AR11974", COLOR = 1, POSITION = [x0,y0,x0+dx,y0+dy], XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

;DEVICE, /CLOSE

;===============================================================================

;reverse cumulative histogram--wrong though

;test = REVERSE(total_SNR)

;SNR_hist = HISTOGRAM(test, BINSIZE = 0.5, LOCATIONS = x_hist)
;cum_r = TOTAL(SNR_hist, /CUMULATIVE)
;PLOT, REVERSE(x_hist), cum_r, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Cumulative Frequency (Reverse)", TITLE = "Reverse Cumulative Frequency Histogram of Signal-to-Noise of AR11974"

;===============================================================================

;reverse cumulative percentage histogram--wrong though

;SNR_hist = HISTOGRAM(total_SNR, BINSIZE = 0.5, LOCATIONS = x_hist)
;cum_r = TOTAL(SNR_hist, /CUMULATIVE)
;perc = (cum_r / 3700) * 100

;PLOT, REVERSE(x_hist), perc, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Cumulative Frequency (Reverse)", TITLE = "Reverse Cumulative Frequency Histogram of Signal-to-Noise of AR11874"

;===============================================================================
;percentage frequency of SNRs

cumul_arr = DBLARR(61) ;0-30 but want 0.5 step size, so 0-60 which is 61

snr_val = -0.5

FOR i = 0, 60 DO BEGIN
	snr_val = snr_val + 0.5 ;multiply SNR vals by binsize 0.5
	nsnr_arr = WHERE((total_SNR GE snr_val), count)
	cumul_arr[i] = count
ENDFOR

percent_arr = cumul_arr/N_ELEMENTS(total_SNR)*100

x_arr = DINDGEN(60)*0.5

PLOT, x_arr, percent_arr

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/freq_histogram.eps', /ENCAPSULATED

PLOT, x_arr, percent_arr, XTITLE = "Minimum Signal-to-Noise", YTITLE = "Frequency of SNR greater than or equal to Minimum", COLOR = 1, POSITION = [x0,y0,x0+dx,y0+dy], XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10
TVLCT, r, g, b, /GET
tvlct, r[0], g[0], b[255]
PLOTS, [3.0,3.0], !Y.CRANGE, THICK = 3, LINESTYLE = 0

DEVICE, /CLOSE

;destroy all evidence

OBJ_DESTROY, dataRast_004121
OBJ_DESTROY, data1400_004121

END
