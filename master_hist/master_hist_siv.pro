;+
;Name: master_hist_siv.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/05/06
;RESTORE ALL SAVE FILES FROM EACH OBSERVATION IN 'Siv_1401_SGF' IN
;ORDER TO CREATE ONE MASTER HISTOGRAM OF ALL SNRs AND THE FREQUENCY OF
;APPEARANCE OF S IV EMISSION LINE IN UVB SPECTRA.

PRO master_hist_siv

;restore 004121 TIIs, SNRs, etc.

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/S_IV/sigma_coeff_arr_004121_Siv.sav'
RESTORE, rfname

PRINT, "one"

PRINT, SIZE(SNR_S_004121[SNR2_S_004121]) ;421
one = SNR_S_004121[SNR2_S_004121]

num_three = WHERE((SNR_S_004121[SNR2_S_004121] GT 3.0), count) ;8
PRINT, SIZE(num_three)
num_five = WHERE((SNR_S_004121[SNR2_S_004121] GT 5.0), count) ;3
PRINT, SIZE(num_five)
num_ten = WHERE((SNR_S_004121[SNR2_S_004121] GT 10.0), count) ;0
PRINT, SIZE(num_ten)
num_twenty = WHERE((SNR_S_004121[SNR2_S_004121] GT 20.0), count) ;0
PRINT, SIZE(num_twenty)
num_forty = WHERE((SNR_S_004121[SNR2_S_004121] GT 40.0), count) ;0
PRINT, SIZE(num_forty)

;restore 050655 TIIs, SNRs, etc.

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/S_IV/sigma_coeff_arr_050655_Siv.sav'
RESTORE, rfname2

PRINT, "two"

PRINT, SIZE(SNR_S_050655[SNR2_S_050655]) ;242
two = SNR_S_050655[SNR2_S_050655]

num2_three = WHERE((SNR_S_050655[SNR2_S_050655] GT 3.0), count) ;11
PRINT, SIZE(num2_three)
num2_five = WHERE((SNR_S_050655[SNR2_S_050655] GT 5.0), count) ;3
PRINT, SIZE(num2_five)
num2_ten = WHERE((SNR_S_050655[SNR2_S_050655] GT 10.0), count) ;0
PRINT, SIZE(num2_ten)
num2_twenty = WHERE((SNR_S_050655[SNR2_S_050655] GT 20.0), count) ;0
PRINT, SIZE(num2_twenty)
num2_forty = WHERE((SNR_S_050655[SNR2_S_050655] GT 40.0), count) ;0
PRINT, SIZE(num2_forty)

;restore 050655_1 TIIs, SNRs, etc.

rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/S_IV/sigma_coeff_arr_050655_1_Siv.sav'
RESTORE, rfname3

PRINT, "three"

PRINT, SIZE(SNR_S_050655_1[SNR2_S_050655_1]) ;306
three = SNR_S_050655_1[SNR2_S_050655_1]

num3_three = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 3.0), count) ;3
PRINT, SIZE(num3_three)
num3_five = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 5.0), count) ;2
PRINT, SIZE(num3_five)
num3_ten = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 10.0), count) ;0
PRINT, SIZE(num3_ten)
num3_twenty = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 20.0), count) ;0
PRINT, SIZE(num3_twenty)
num3_forty = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 40.0), count) ;0
PRINT, SIZE(num3_forty)

;restore 052046 TIIs, SNRs, etc.

rfname4 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/S_IV/sigma_coeff_arr_052046_Siv.sav'
RESTORE, rfname4

PRINT, "four"

PRINT, SIZE(SNR_S_052046[SNR2_S_052046]) ;2174
four = SNR_S_052046[SNR2_S_052046]

num4_three = WHERE((SNR_S_052046[SNR2_S_052046] GT 3.0), count) ;444
PRINT, SIZE(num4_three)
num4_five = WHERE((SNR_S_052046[SNR2_S_052046] GT 5.0), count) ;122
PRINT, SIZE(num4_five)
num4_ten = WHERE((SNR_S_052046[SNR2_S_052046] GT 10.0), count) ;8
PRINT, SIZE(num4_ten)
num4_twenty = WHERE((SNR_S_052046[SNR2_S_052046] GT 20.0), count) ;0
PRINT, SIZE(num4_twenty)
num4_forty = WHERE((SNR_S_052046[SNR2_S_052046] GT 40.0), count) ;0
PRINT, SIZE(num4_forty)

;restore 061606 TIIs, SNRs, etc.

rfname5 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/S_IV/sigma_coeff_arr_061606_Siv.sav'
RESTORE, rfname5

PRINT, "five"

PRINT, SIZE(SNR_S_061606[SNR2_S_061606]) ;348
five = SNR_S_061606[SNR2_S_061606]

num5_three = WHERE((SNR_S_061606[SNR2_S_061606] GT 3.0), count) ;5
PRINT, SIZE(num5_three)
num5_five = WHERE((SNR_S_061606[SNR2_S_061606] GT 5.0), count) ;2
PRINT, SIZE(num5_five)
num5_ten = WHERE((SNR_S_061606[SNR2_S_061606] GT 10.0), count) ;0
PRINT, SIZE(num5_ten)
num5_twenty = WHERE((SNR_S_061606[SNR2_S_061606] GT 20.0), count) ;0
PRINT, SIZE(num5_twenty)
num5_forty = WHERE((SNR_S_061606[SNR2_S_061606] GT 40.0), count) ;0
PRINT, SIZE(num5_forty)

;restore 114951 TIIs, SNRs, etc.

rfname6 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/sigma_coeff_arr_114951_Siv.sav'
RESTORE, rfname6

PRINT, "six"

PRINT, SIZE(SNR_S_114951[SNR2_S_114951]) ;753
six = SNR_S_114951[SNR2_S_114951]

num6_three = WHERE((SNR_S_114951[SNR2_S_114951] GT 3.0), count) ;52
PRINT, SIZE(num6_three)
num6_five = WHERE((SNR_S_114951[SNR2_S_114951] GT 5.0), count) ;41
PRINT, SIZE(num6_five)
num6_ten = WHERE((SNR_S_114951[SNR2_S_114951] GT 10.0), count) ;9
PRINT, SIZE(num6_ten)
num6_twenty = WHERE((SNR_S_114951[SNR2_S_114951] GT 20.0), count) ;0
PRINT, SIZE(num6_twenty)
num6_forty = WHERE((SNR_S_114951[SNR2_S_114951] GT 40.0), count) ;0
PRINT, SIZE(num6_forty)

;restore 122033 TIIs, SNRs, etc.

rfname7 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/sigma_coeff_arr_122033_Siv.sav'
RESTORE, rfname7

PRINT, "seven"

PRINT, SIZE(SNR_S_122033[SNR2_S_122033]) ;844
seven = SNR_S_122033[SNR2_S_122033]

num7_three = WHERE((SNR_S_122033[SNR2_S_122033] GT 3.0), count) ;38
PRINT, SIZE(num7_three)
num7_five = WHERE((SNR_S_122033[SNR2_S_122033] GT 5.0), count) ;23
PRINT, SIZE(num7_five)
num7_ten = WHERE((SNR_S_122033[SNR2_S_122033] GT 10.0), count) ;7
PRINT, SIZE(num7_ten)
num7_twenty = WHERE((SNR_S_122033[SNR2_S_122033] GT 20.0), count) ;0
PRINT, SIZE(num7_twenty)
num7_forty = WHERE((SNR_S_122033[SNR2_S_122033] GT 40.0), count) ;0
PRINT, SIZE(num7_forty)

;restore 160806 TIIs, SNRs, etc.

rfname8 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/S_IV/sigma_coeff_arr_160806_Siv.sav'
RESTORE, rfname8

PRINT, "eight"

PRINT, SIZE(SNR_S_160806[SNR2_S_160806]) ;510
eight = SNR_S_160806[SNR2_S_160806]

num8_three = WHERE((SNR_S_160806[SNR2_S_160806] GT 3.0), count) ;19
PRINT, SIZE(num8_three)
num8_five = WHERE((SNR_S_160806[SNR2_S_160806] GT 5.0), count) ;15
PRINT, SIZE(num8_five)
num8_ten = WHERE((SNR_S_160806[SNR2_S_160806] GT 10.0), count) ;3
PRINT, SIZE(num8_ten)
num8_twenty = WHERE((SNR_S_160806[SNR2_S_160806] GT 20.0), count) ;0
PRINT, SIZE(num8_twenty)
num8_forty = WHERE((SNR_S_160806[SNR2_S_160806] GT 40.0), count) ;0
PRINT, SIZE(num8_forty)

;restore 163205 TIIs, SNRs, etc.

rfname9 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/sigma_coeff_arr_163205_Siv.sav'
RESTORE, rfname9

PRINT, "nine"

PRINT, SIZE(SNR_S_163205[SNR2_S_163205]) ;408
nine = SNR_S_163205[SNR2_S_163205]

num9_three = WHERE((SNR_S_163205[SNR2_S_163205] GT 3.0), count) ;9
PRINT, SIZE(num9_three)
num9_five = WHERE((SNR_S_163205[SNR2_S_163205] GT 5.0), count) ;7
PRINT, SIZE(num9_five)
num9_ten = WHERE((SNR_S_163205[SNR2_S_163205] GT 10.0), count) ;0
PRINT, SIZE(num9_ten)
num9_twenty = WHERE((SNR_S_163205[SNR2_S_163205] GT 20.0), count) ;0
PRINT, SIZE(num9_twenty)
num9_forty = WHERE((SNR_S_163205[SNR2_S_163205] GT 40.0), count) ;0
PRINT, SIZE(num9_forty)

;restore 174905 TIIs, SNRs, etc.

rfname10 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/S_IV/sigma_coeff_arr_174905_Siv.sav'
RESTORE, rfname10

PRINT, "ten"

PRINT, SIZE(SNR_S_174905[SNR2_S_174905]) ;575
ten = SNR_S_174905[SNR2_S_174905]

num10_three = WHERE((SNR_S_174905[SNR2_S_174905] GT 3.0), count) ;54
PRINT, SIZE(num10_three)
num10_five = WHERE((SNR_S_174905[SNR2_S_174905] GT 5.0), count) ;21
PRINT, SIZE(num10_five)
num10_ten = WHERE((SNR_S_174905[SNR2_S_174905] GT 10.0), count) ;1
PRINT, SIZE(num10_ten)
num10_twenty = WHERE((SNR_S_174905[SNR2_S_174905] GT 20.0), count) ;0
PRINT, SIZE(num10_twenty)
num10_forty = WHERE((SNR_S_174905[SNR2_S_174905] GT 40.0), count) ;0
PRINT, SIZE(num10_forty)

;restore 181205 TIIs, SNRs, etc.

rfname11 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/S_IV/sigma_coeff_arr_181205_Siv.sav'
RESTORE, rfname11

PRINT, "eleven"

PRINT, SIZE(SNR_S_181205[SNR2_S_181205]) ;265
eleven = SNR_S_181205[SNR2_S_181205]

num11_three = WHERE((SNR_S_181205[SNR2_S_181205] GT 3.0), count) ;10
PRINT, SIZE(num11_three)
num11_five = WHERE((SNR_S_181205[SNR2_S_181205] GT 5.0), count) ;2
PRINT, SIZE(num11_five)
num11_ten = WHERE((SNR_S_181205[SNR2_S_181205] GT 10.0), count) ;0
PRINT, SIZE(num11_ten)
num11_twenty = WHERE((SNR_S_181205[SNR2_S_181205] GT 20.0), count) ;0
PRINT, SIZE(num11_twenty)
num11_forty = WHERE((SNR_S_181205[SNR2_S_181205] GT 40.0), count) ;0
PRINT, SIZE(num11_forty)

;restore 201925 TIIs, SNRs, etc.

rfname12 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/S_IV/sigma_coeff_arr_201925_Siv.sav'
RESTORE, rfname12

PRINT, "twelve"

PRINT, SIZE(SNR_S_201925[SNR2_S_201925]) ;474
twelve = SNR_S_201925[SNR2_S_201925]

num12_three = WHERE((SNR_S_201925[SNR2_S_201925] GT 3.0), count) ;15
PRINT, SIZE(num12_three)
num12_five = WHERE((SNR_S_201925[SNR2_S_201925] GT 5.0), count) ;7
PRINT, SIZE(num12_five)
num12_ten = WHERE((SNR_S_201925[SNR2_S_201925] GT 10.0), count) ;0
PRINT, SIZE(num12_ten)
num12_twenty = WHERE((SNR_S_201925[SNR2_S_201925] GT 20.0), count) ;0
PRINT, SIZE(num12_twenty)
num12_forty = WHERE((SNR_S_201925[SNR2_S_201925] GT 40.0), count) ;0
PRINT, SIZE(num12_forty)

;restore 201925_1 TIIs, SNRs, etc.

rfname13 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/S_IV/sigma_coeff_arr_201925_1_Siv.sav'
RESTORE, rfname13

PRINT, "thirteen"

PRINT, SIZE(SNR_S_201925_1[SNR2_S_201925_1]) ;240
thirteen = SNR_S_201925_1[SNR2_S_201925_1]

num13_three = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 3.0), count) ;5
PRINT, SIZE(num13_three)
num13_five = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 5.0), count) ;0
PRINT, SIZE(num13_five)
num13_ten = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 10.0), count) ;0
PRINT, SIZE(num13_ten)
num13_twenty = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 20.0), count) ;0
PRINT, SIZE(num13_twenty)
num13_forty = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 40.0), count) ;0
PRINT, SIZE(num13_forty)

;restore 203906 TIIs, SNRs, etc.

rfname14 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/S_IV/sigma_coeff_arr_203906_Siv.sav'
RESTORE, rfname14

PRINT, "fourteen"

PRINT, SIZE(SNR_S_203906[SNR2_S_203906]) ;1054
fourteen = SNR_S_203906[SNR2_S_203906]

num14_three = WHERE((SNR_S_203906[SNR2_S_203906] GT 3.0), count) ;50
PRINT, SIZE(num14_three)
num14_five = WHERE((SNR_S_203906[SNR2_S_203906] GT 5.0), count) ;18
PRINT, SIZE(num14_five)
num14_ten = WHERE((SNR_S_203906[SNR2_S_203906] GT 10.0), count) ;4
PRINT, SIZE(num14_ten)
num14_twenty = WHERE((SNR_S_203906[SNR2_S_203906] GT 20.0), count) ;0
PRINT, SIZE(num14_twenty)
num14_forty = WHERE((SNR_S_203906[SNR2_S_203906] GT 40.0), count) ;0
PRINT, SIZE(num14_forty)

;restore 215426 TIIs, SNRs, etc.

rfname15 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/sigma_coeff_arr_215426_Siv.sav'
RESTORE, rfname15

PRINT, "fifteen"

PRINT, SIZE(SNR_S_215426[SNR2_S_215426]) ;157
fifteen = SNR_S_215426[SNR2_S_215426]

num15_three = WHERE((SNR_S_215426[SNR2_S_215426] GT 3.0), count) ;0
PRINT, SIZE(num15_three)
num15_five = WHERE((SNR_S_215426[SNR2_S_215426] GT 5.0), count) ;0
PRINT, SIZE(num15_five)
num15_ten = WHERE((SNR_S_215426[SNR2_S_215426] GT 10.0), count) ;0
PRINT, SIZE(num15_ten)
num15_twenty = WHERE((SNR_S_215426[SNR2_S_215426] GT 20.0), count) ;0
PRINT, SIZE(num15_twenty)
num15_forty = WHERE((SNR_S_215426[SNR2_S_215426] GT 40.0), count) ;0
PRINT, SIZE(num15_forty)

;restore 232931 TIIs, SNRs, etc.

rfname16 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/S_IV/sigma_coeff_arr_232931_Siv.sav'
RESTORE, rfname16

PRINT, "sixteen"

PRINT, SIZE(SNR_S_232931[SNR2_S_232931]) ;187
sixteen = SNR_S_232931[SNR2_S_232931]

num16_three = WHERE((SNR_S_232931[SNR2_S_232931] GT 3.0), count) ;1
PRINT, SIZE(num16_three)
num16_five = WHERE((SNR_S_232931[SNR2_S_232931] GT 5.0), count) ;0
PRINT, SIZE(num16_five)
num16_ten = WHERE((SNR_S_232931[SNR2_S_232931] GT 10.0), count) ;0
PRINT, SIZE(num16_ten)
num16_twenty = WHERE((SNR_S_232931[SNR2_S_232931] GT 20.0), count) ;0
PRINT, SIZE(num16_twenty)
num16_forty = WHERE((SNR_S_232931[SNR2_S_232931] GT 40.0), count) ;0
PRINT, SIZE(num16_forty)

;===============================================================================
;get overall values of SNRs

total_SNR_siv = [one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen]
PRINT, SIZE(total_SNR_siv) ;8958

PRINT, N_ELEMENTS(WHERE((total_SNR_siv GT 3.00), count)) ;724
PRINT, N_ELEMENTS(WHERE((total_SNR_siv GT 5.00), count)) ;266
PRINT, N_ELEMENTS(WHERE((total_SNR_siv GT 10.00), count)) ;32
PRINT, N_ELEMENTS(WHERE((total_SNR_siv GT 20.00), count)) ;1
PRINT, N_ELEMENTS(WHERE((total_SNR_siv GT 40.00), count, /NULL)) ;0

;===============================================================================
;restore variable for window and create plots

rfnamee = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/all_vars_004121.sav'
RESTORE, rfnamee

;master histogram log

SNR_hist_siv = HISTOGRAM(total_SNR_siv, BINSIZE = 0.5, LOCATIONS = x_hist)

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/master_histogram_siv.eps', /ENCAPSULATED

SNR_hist_siv = HISTOGRAM(total_SNR_siv, BINSIZE = 0.5, LOCATIONS = x_hist)
PLOT, x_hist, SNR_hist_siv, PSYM = 10, XTITLE = "Signal-to-Noise", YTITLE = "Frequency", TITLE = "Master Histogram of Signal-to-Noise of AR11974", /YLOG, YRANGE = [1.0e-1,1.0e4], POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5

DEVICE, /CLOSE

;percentage frequency of SNRs

cumul_arr_siv = DBLARR(61) ;0-30 but want 0.5 step size, so 0-60 which is 61

snr_val_siv = -0.5

FOR i = 0, 60 DO BEGIN
	snr_val_siv = snr_val_siv + 0.5 ;multiply SNR vals by binsize 0.5
	nsnr_arr_siv = WHERE((total_SNR_siv GE snr_val_siv), count)
	cumul_arr_siv[i] = count
ENDFOR

percent_arr_siv = cumul_arr_siv/N_ELEMENTS(total_SNR_siv)*100

x_arr_siv = DINDGEN(60)*0.5

PLOT, x_arr_siv, percent_arr_siv

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/master_hist/freq_histogram_siv.eps', /ENCAPSULATED

PLOT, x_arr_siv, percent_arr_siv, XTITLE = "Minimum Signal-to-Noise", YTITLE = "Frequency of SNR greater than or equal to Minimum", COLOR = 1, POSITION = [x0,y0,x0+dx,y0+dy], XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5
TVLCT, r, g, b, /GET
tvlct, r[0], g[0], b[255]
PLOTS, [3.0,3.0], !Y.CRANGE, THICK = 10, LINESTYLE = 0

DEVICE, /CLOSE

;destroy all evidence

OBJ_DESTROY, dataRast_004121
OBJ_DESTROY, data1400_004121

END
