;+
;Name: master_TII.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/24
;FROM Si IV TII CALCULATIONS AND UNCERTAINTIES, AS WELL AS SNRs AND
;TIIs FROM O IV, TAKE THE RATIO B/W THE RESONANCE SI IV 1394 AND O IV
;1401 LINE TO GET THE ELECTRON DENSITIES OF THESE O IV EMISSION LINES
;IN UVB SPECTRA.

;PRO master_TII

;SNR O IV vals

;restore O IV 004121 TIIs, SNRs, etc.

rfname_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_SNR

PRINT, SIZE(SNR_O_004121[SNR2_O_004121])
one = SNR_O_004121[SNR2_O_004121]

t_O_004121 = SNR_O_004121[SNR2_O_004121]
num_three = WHERE((t_O_004121 GT 3.0), count) ;464

num_three = WHERE((SNR_O_004121[SNR2_O_004121] GT 3.0), count) ;464

O_004121_a = It_O_004121[SNR2_O_004121]
O_004121 = O_004121_a[num_three]

;restore O IV 050655 TIIs, SNRs, etc.

rfname2_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/sigma_coeff_arr_050655_Oiv.sav'
RESTORE, rfname2_SNR

PRINT, SIZE(SNR_O_050655[SNR2_O_050655])
two = SNR_O_050655[SNR2_O_050655]

t_O_050655 = SNR_O_050655[SNR2_O_050655]
num2_three = WHERE((t_O_050655 GT 3.0), count) ;279

num2_three = WHERE((SNR_O_050655[SNR2_O_050655] GT 3.0), count) ;279

O_050655_a = It_O_050655[SNR2_O_050655]
O_050655 = O_050655_a[num2_three]

;restore O IV 050655_1 TIIs, SNRs, etc.

rfname3_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/sigma_coeff_arr_050655_1_Oiv.sav'
RESTORE, rfname3_SNR

PRINT, SIZE(SNR_O_050655_1[SNR2_O_050655_1])
three = SNR_O_050655_1[SNR2_O_050655_1]

t = SNR_O_050655_1[SNR2_O_050655_1]
num3_three = WHERE((t GT 3.0), count) ;384

num3_three = WHERE((SNR_O_050655_1[SNR2_O_050655_1] GT 3.0), count) ;384

O_050655_1_a = It_O_050655_1[SNR2_O_050655_1]
O_050655_1 = O_050655_1_a[num3_three]

;restore O IV 052046 TIIs, SNRs, etc.

rfname4_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/sigma_coeff_arr_052046_Oiv.sav'
RESTORE, rfname4_SNR

PRINT, SIZE(SNR_O_052046[SNR2_O_052046])
four = SNR_O_052046[SNR2_O_052046]

t = SNR_O_052046[SNR2_O_052046]
num4_three = WHERE((t GT 3.0), count) ;2656

num4_three = WHERE((SNR_O_052046[SNR2_O_052046] GT 3.0), count) ;2656

O_052046_a = It_O_052046[SNR2_O_052046]
O_052046 = O_052046_a[num4_three]

;restore O IV 061606 TIIs, SNRs, etc.

rfname5_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/sigma_coeff_arr_061606_Oiv.sav'
RESTORE, rfname5_SNR

PRINT, SIZE(SNR_O_061606[SNR2_O_061606])
five = SNR_O_061606[SNR2_O_061606]

t = SNR_O_061606[SNR2_O_061606]
num5_three = WHERE((t GT 3.0), count) ;414

num5_three = WHERE((SNR_O_061606[SNR2_O_061606] GT 3.0), count) ;414

O_061606_a = It_O_061606[SNR2_O_061606]
O_061606 = O_061606_a[num5_three]

;restore O IV 114951 TIIs, SNRs, etc.

rfname6_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/sigma_coeff_arr_114951_Oiv.sav'
RESTORE, rfname6_SNR

PRINT, SIZE(SNR_O_114951[SNR2_O_114951])
six = SNR_O_114951[SNR2_O_114951]

t = SNR_O_114951[SNR2_O_114951]
num6_three = WHERE((t GT 3.0), count) ;887

num6_three = WHERE((SNR_O_114951[SNR2_O_114951] GT 3.0), count) ;887

O_114951_a = It_O_114951[SNR2_O_114951]
O_114951 = O_114951_a[num6_three]

;restore O IV 122033 TIIs, SNRs, etc.

rfname7_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/sigma_coeff_arr_122033_Oiv.sav'
RESTORE, rfname7_SNR

PRINT, SIZE(SNR_O_122033[SNR2_O_122033])
seven = SNR_O_122033[SNR2_O_122033]

t = SNR_O_122033[SNR2_O_122033]
num7_three = WHERE((t GT 3.0), count) ;914

num7_three = WHERE((SNR_O_122033[SNR2_O_122033] GT 3.0), count) ;914

O_122033_a = It_O_122033[SNR2_O_122033]
O_122033 = O_122033_a[num7_three]

;restore O IV 160806 TIIs, SNRs, etc.

rfname8_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/sigma_coeff_arr_160806_Oiv.sav'
RESTORE, rfname8_SNR

PRINT, SIZE(SNR_O_160806[SNR2_O_160806])
eight = SNR_O_160806[SNR2_O_160806]

t = SNR_O_160806[SNR2_O_160806]
num8_three = WHERE((t GT 3.0), count) ;574

num8_three = WHERE((SNR_O_160806[SNR2_O_160806] GT 3.0), count) ;574

O_160806_a = It_O_160806[SNR2_O_160806]
O_160806 = O_160806_a[num8_three]

;restore O IV 163205 TIIs, SNRs, etc.

rfname9_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
RESTORE, rfname9_SNR

PRINT, SIZE(SNR_O_163205[SNR2_O_163205])
nine = SNR_O_163205[SNR2_O_163205]

t = SNR_O_163205[SNR2_O_163205]
num9_three = WHERE((t GT 3.0), count) ;483

num9_three = WHERE((SNR_O_163205[SNR2_O_163205] GT 3.0), count) ;483

O_163205_a = It_O_163205[SNR2_O_163205]
O_163205 = O_163205_a[num9_three]

;restore O IV 174905 TIIs, SNRs, etc.

rfname10_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/sigma_coeff_arr_174905_Oiv.sav'
RESTORE, rfname10_SNR

PRINT, SIZE(SNR_O_174905[SNR2_O_174905])
ten = SNR_O_174905[SNR2_O_174905]

t = SNR_O_174905[SNR2_O_174905]
num10_three = WHERE((t GT 3.0), count) ;712

num10_three = WHERE((SNR_O_174905[SNR2_O_174905] GT 3.0), count) ;712

O_174905_a = It_O_174905[SNR2_O_174905]
O_174905 = O_174905_a[num10_three]

;restore O IV 181205 TIIs, SNRs, etc.

rfname11_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/sigma_coeff_arr_181205_Oiv.sav'
RESTORE, rfname11_SNR

PRINT, SIZE(SNR_O_181205[SNR2_O_181205])
eleven = SNR_O_181205[SNR2_O_181205]

t = SNR_O_181205[SNR2_O_181205]
num11_three = WHERE((t GT 3.0), count) ;349

num11_three = WHERE((SNR_O_181205[SNR2_O_181205] GT 3.0), count) ;349

O_181205_a = It_O_181205[SNR2_O_181205]
O_181205 = O_181205_a[num11_three]

;restore O IV 201925 TIIs, SNRs, etc.

rfname12_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/sigma_coeff_arr_201925_Oiv.sav'
RESTORE, rfname12_SNR

PRINT, SIZE(SNR_O_201925[SNR2_O_201925])
twelve = SNR_O_201925[SNR2_O_201925]

t = SNR_O_201925[SNR2_O_201925]
num12_three = WHERE((t GT 3.0), count) ;572

num12_three = WHERE((SNR_O_201925[SNR2_O_201925] GT 3.0), count) ;572

O_201925_a = It_O_201925[SNR2_O_201925]
O_201925 = O_201925_a[num12_three]

;restore O IV 201925_1 TIIs, SNRs, etc.

rfname13_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/sigma_coeff_arr_201925_1_Oiv.sav'
RESTORE, rfname13_SNR

PRINT, SIZE(SNR_O_201925_1[SNR2_O_201925_1])
thirteen = SNR_O_201925_1[SNR2_O_201925_1]

t = SNR_O_201925_1[SNR2_O_201925_1]
num13_three = WHERE((t GT 3.0), count) ;303

num13_three = WHERE((SNR_O_201925_1[SNR2_O_201925_1] GT 3.0), count) ;303

O_201925_1_a = It_O_201925_1[SNR2_O_201925_1]
O_201925_1 = O_201925_1_a[num13_three]

;restore O IV 203906 TIIs, SNRs, etc.

rfname14_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
RESTORE, rfname14_SNR

PRINT, SIZE(SNR_O_203906[SNR2_O_203906])
fourteen = SNR_O_203906[SNR2_O_203906]

t = SNR_O_203906[SNR2_O_203906]
num14_three = WHERE((t GT 3.0), count) ;1157

num14_three = WHERE((SNR_O_203906[SNR2_O_203906] GT 3.0), count) ;1157

O_203906_a = It_O_203906[SNR2_O_203906]
O_203906 = O_203906_a[num14_three]

;restore O IV 215426 TIIs, SNRs, etc.

rfname15_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/sigma_coeff_arr_215426_Oiv.sav'
RESTORE, rfname15_SNR

PRINT, SIZE(SNR_O_215426[SNR2_O_215426])
fifteen = SNR_O_215426[SNR2_O_215426]

t = SNR_O_215426[SNR2_O_215426]
num15_three = WHERE((t GT 3.0), count) ;194

num15_three = WHERE((SNR_O_215426[SNR2_O_215426] GT 3.0), count) ;194

O_215426_a = It_O_215426[SNR2_O_215426]
O_215426 = O_215426_a[num15_three]

;restore O IV 232931 TIIs, SNRs, etc.

rfname16_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/sigma_coeff_arr_232931_Oiv.sav'
RESTORE, rfname16_SNR

PRINT, SIZE(SNR_O_232931[SNR2_O_232931])
sixteen = SNR_O_232931[SNR2_O_232931]

t = SNR_O_232931[SNR2_O_232931]
num16_three = WHERE((t GT 3.0), count) ;225

num16_three = WHERE((SNR_O_232931[SNR2_O_232931] GT 3.0), count) ;225

O_232931_a = It_O_232931[SNR2_O_232931]
O_232931 = O_232931_a[num16_three]

;concatenate arrays

total_SNR = [one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen]
PRINT, SIZE(total_SNR) ;10567

;===============================================================================
;TII: It, int_int_unc w/ O IV and Si IV

;restore Si IV 004121 TIIs, SNRs, etc.

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/IT_UV_004121.sav'
RESTORE, rfname

PRINT, N_ELEMENTS(It_Si_004121[num_three]) ;90

Si_004121_a = It_Si_004121[SNR2_O_004121]
Si_004121 = Si_004121_a[num_three]

;restore Si IV 050655 TIIs, SNRs, etc.

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/IT_UV_050655.sav'
RESTORE, rfname2

PRINT, N_ELEMENTS(It_Si_050655[num2_three]) ;66

Si_050655_a = It_Si_050655[SNR2_O_050655]
Si_050655 = Si_050655_a[num2_three]

;restore Si IV 050655_1 TIIs, SNRs, etc.

rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/IT_UV_050655_1.sav'
RESTORE, rfname3

PRINT, N_ELEMENTS(It_Si_050655_1[num3_three]) ;109

Si_050655_1_a = It_Si_050655_1[SNR2_O_050655_1]
Si_050655_1 = Si_050655_1_a[num3_three]

;restore Si IV 052046 TIIs, SNRs, etc.

rfname4 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
RESTORE, rfname4

PRINT, N_ELEMENTS(It_Si_052046[num4_three]) ;1231

Si_052046_a = It_Si_052046[SNR2_O_052046]
Si_052046 = Si_052046_a[num4_three]

;restore Si IV 061606 TIIs, SNRs, etc.

rfname5 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/IT_UV_061606.sav'
RESTORE, rfname5

PRINT, N_ELEMENTS(It_Si_061606[num5_three]) ;108

Si_061606_a = It_Si_061606[SNR2_O_061606]
Si_061606 = Si_061606_a[num5_three]

;restore Si IV 114951 TIIs, SNRs, etc.

rfname6 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
RESTORE, rfname6

PRINT, N_ELEMENTS(It_Si_114951[num6_three]) ;160

Si_114951_a = It_Si_114951[SNR2_O_114951]
Si_114951 = Si_114951_a[num6_three]

;restore Si IV 122033 TIIs, SNRs, etc.

rfname7 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/IT_UV_122033.sav'
RESTORE, rfname7

PRINT, N_ELEMENTS(It_Si_122033[num7_three]) ;399

Si_122033_a = It_Si_122033[SNR2_O_122033]
Si_122033 = Si_122033_a[num7_three]

;restore Si IV 160806 TIIs, SNRs, etc.

rfname8 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/IT_UV_160806.sav'
RESTORE, rfname8

PRINT, N_ELEMENTS(It_Si_160806[num8_three]) ;157

Si_160806_a = It_Si_160806[SNR2_O_160806]
Si_160806 = Si_160806_a[num8_three]

;restore Si IV 163205 TIIs, SNRs, etc.

rfname9 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/IT_UV_163205.sav'
RESTORE, rfname9

PRINT, N_ELEMENTS(It_Si_163205[num9_three]) ;71

Si_163205_a = It_Si_163205[SNR2_O_163205]
Si_163205 = Si_163205_a[num9_three]

;restore Si IV 174905 TIIs, SNRs, etc.

rfname10 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/IT_UV_174905.sav'
RESTORE, rfname10

PRINT, N_ELEMENTS(It_Si_174905[num10_three]) ;244

Si_174905_a = It_Si_174905[SNR2_O_174905]
Si_174905 = Si_174905_a[num10_three]

;restore Si IV 181205 TIIs, SNRs, etc.

rfname11 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/IT_UV_181205.sav'
RESTORE, rfname11

PRINT, N_ELEMENTS(It_Si_181205[num11_three]) ;71

Si_181205_a = It_Si_181205[SNR2_O_181205]
Si_181205 = Si_181205_a[num11_three]

;restore Si IV 201925 TIIs, SNRs, etc.

rfname12 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
RESTORE, rfname12

PRINT, N_ELEMENTS(It_Si_201925[num12_three]) ;59

Si_201925_a = It_Si_201925[SNR2_O_201925]
Si_201925 = Si_201925_a[num12_three]

;restore Si IV 201925_1 TIIs, SNRs, etc.

rfname13 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/IT_UV_201925_1.sav'
RESTORE, rfname13

PRINT, N_ELEMENTS(It_Si_201925_1[num13_three]) ;58

Si_201925_1_a = It_Si_201925_1[SNR2_O_201925_1]
Si_201925_1 = Si_201925_1_a[num13_three]

;restore Si IV 203906 TIIs, SNRs, etc.

rfname14 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
RESTORE, rfname14

PRINT, N_ELEMENTS(It_Si_203906[num14_three]) ;340

Si_203906_a = It_Si_203906[SNR2_O_203906]
Si_203906 = Si_203906_a[num14_three]

;restore Si IV 215426 TIIs, SNRs, etc.

rfname15 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/IT_UV_215426.sav'
RESTORE, rfname15

PRINT, N_ELEMENTS(It_Si_215426[num15_three]) ;26

Si_215426_a = It_Si_215426[SNR2_O_215426]
Si_215426 = Si_215426_a[num15_three]

;restore Si IV 232931 TIIs, SNRs, etc.

rfname16 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
RESTORE, rfname16

PRINT, N_ELEMENTS(It_Si_232931[num16_three]) ;28

Si_232931_a = It_Si_232931[SNR2_O_232931]
Si_232931 = Si_232931_a[num16_three]

;===============================================================================
;retrieve Si IV 1393.8/O IV ratios

ratio_004121 = (Si_004121/O_004121)
ratio_050655 = (Si_050655/O_050655)
ratio_050655_1 = (Si_050655_1/O_050655_1)
ratio_052046 = (Si_052046/O_052046)
ratio_061606 = (Si_061606/O_061606)
ratio_114951 = (Si_114951/O_114951)
ratio_122033 = (Si_122033/O_122033)
ratio_160806 = (Si_160806/O_160806)
ratio_163205 = (Si_163205/O_163205)
ratio_174905 = (Si_174905/O_174905)
ratio_181205 = (Si_181205/O_181205)
ratio_201925 = (Si_201925/O_201925)
ratio_201925_1 = (Si_201925_1/O_201925_1)
ratio_203906 = (Si_203906/O_203906)
ratio_215426 = (Si_215426/O_215426)
ratio_232931 = (Si_232931/O_232931)

;===============================================================================
;load diagnostic model

rfname_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/si4_o4_dens_diagnostic.sav'
RESTORE, rfname_dens

;get size of ratios over each observation

TII_004121_s = N_ELEMENTS(ratio_004121)
TII_050655_s = N_ELEMENTS(ratio_050655)
TII_050655_1_s = N_ELEMENTS(ratio_050655_1)
TII_052046_s = N_ELEMENTS(ratio_052046)
TII_061606_s = N_ELEMENTS(ratio_061606)
TII_114951_s = N_ELEMENTS(ratio_114951)
TII_122033_s = N_ELEMENTS(ratio_122033)
TII_160806_s = N_ELEMENTS(ratio_160806)
TII_163205_s = N_ELEMENTS(ratio_163205)
TII_174905_s = N_ELEMENTS(ratio_174905)
TII_181205_s = N_ELEMENTS(ratio_181205)
TII_201925_s = N_ELEMENTS(ratio_201925)
TII_201925_1_s = N_ELEMENTS(ratio_201925_1)
TII_203906_s = N_ELEMENTS(ratio_203906)
TII_215426_s = N_ELEMENTS(ratio_215426)
TII_232931_s = N_ELEMENTS(ratio_232931)

;FOR loops for electron density info

electron_dens_arr_004121 = DBLARR(TII_004121_s)

FOR i = 0, TII_004121_s-1 DO BEGIN
   difference_arr_004121 = ABS(si_o_ratio-ratio_004121[i])
   electron_dens_004121 = WHERE(difference_arr_004121 EQ MIN(difference_arr_004121), /NULL)
   electron_dens_arr_004121[i] = electron_dens_004121[0]
ENDFOR

;PRINT, electron_dens_arr_004121 ;few zeros

;PRINT, e_density[electron_dens_arr_004121]

e_dens_004121 = e_density[electron_dens_arr_004121]

;===============================================================================

electron_dens_arr_050655 = DBLARR(TII_050655_s)

FOR i = 0, TII_050655_s-1 DO BEGIN
   difference_arr_050655 = ABS(si_o_ratio-ratio_050655[i])
   electron_dens_050655 = WHERE(difference_arr_050655 EQ MIN(difference_arr_050655), /NULL)
   electron_dens_arr_050655[i] = electron_dens_050655[0]
ENDFOR

;PRINT, electron_dens_arr_050655 ;few zeros

;PRINT, e_density[electron_dens_arr_050655]

e_dens_050655 = e_density[electron_dens_arr_050655]

;===============================================================================

electron_dens_arr_050655_1 = DBLARR(TII_050655_1_s)

FOR i = 0, TII_050655_1_s-1 DO BEGIN
   difference_arr_050655_1 = ABS(si_o_ratio-ratio_050655_1[i])
   electron_dens_050655_1 = WHERE(difference_arr_050655_1 EQ MIN(difference_arr_050655_1), /NULL)
   electron_dens_arr_050655_1[i] = electron_dens_050655_1[0]
ENDFOR

;PRINT, electron_dens_arr_050655_1 ;few zeros

;PRINT, e_density[electron_dens_arr_050655_1]

e_dens_050655_1 = e_density[electron_dens_arr_050655_1]

;===============================================================================

electron_dens_arr_052046 = DBLARR(TII_052046_s)

FOR i = 0, TII_052046_s-1 DO BEGIN
   difference_arr_052046 = ABS(si_o_ratio-ratio_052046[i])
   electron_dens_052046 = WHERE(difference_arr_052046 EQ MIN(difference_arr_052046), /NULL)
   electron_dens_arr_052046[i] = electron_dens_052046[0]
ENDFOR

;PRINT, electron_dens_arr_052046 ;few zeros

;PRINT, e_density[electron_dens_arr_052046]

e_dens_052046 = e_density[electron_dens_arr_052046]

;===============================================================================

electron_dens_arr_061606 = DBLARR(TII_061606_s)

FOR i = 0, TII_061606_s-1 DO BEGIN
   difference_arr_061606 = ABS(si_o_ratio-ratio_061606[i])
   electron_dens_061606 = WHERE(difference_arr_061606 EQ MIN(difference_arr_061606))
   electron_dens_arr_061606[i] = electron_dens_061606[0]
ENDFOR

;PRINT, electron_dens_arr_061606 ;few zeros

;PRINT, e_density[electron_dens_arr_061606]

e_dens_061606 = e_density[electron_dens_arr_061606]

;===============================================================================

electron_dens_arr_114951 = DBLARR(TII_114951_s)

FOR i = 0, TII_114951_s-1 DO BEGIN
   difference_arr_114951 = ABS(si_o_ratio-ratio_114951[i])
   electron_dens_114951 = WHERE(difference_arr_114951 EQ MIN(difference_arr_114951), /NULL) ;remove -1
   electron_dens_arr_114951[i] = electron_dens_114951[0] ;0 to choose the first min value if more than one
ENDFOR

;PRINT, electron_dens_arr_114951 ;few zeros

;PRINT, e_density[electron_dens_arr_114951]

e_dens_114951 = e_density[electron_dens_arr_114951]

;===============================================================================

electron_dens_arr_122033 = DBLARR(TII_122033_s)

FOR i = 0, TII_122033_s-1 DO BEGIN
   difference_arr_122033 = ABS(si_o_ratio-ratio_122033[i])
   electron_dens_122033 = WHERE(difference_arr_122033 EQ MIN(difference_arr_122033), /NULL)
   electron_dens_arr_122033[i] = electron_dens_122033[0]
ENDFOR

;PRINT, electron_dens_arr_122033 ;few zeros

;PRINT, e_density[electron_dens_arr_122033]

e_dens_122033 = e_density[electron_dens_arr_122033]

;===============================================================================

electron_dens_arr_160806 = DBLARR(TII_160806_s)

FOR i = 0, TII_160806_s-1 DO BEGIN
   difference_arr_160806 = ABS(si_o_ratio-ratio_160806[i])
   electron_dens_160806 = WHERE(difference_arr_160806 EQ MIN(difference_arr_160806), /NULL)
   electron_dens_arr_160806[i] = electron_dens_160806[0]
ENDFOR

;PRINT, electron_dens_arr_160806

;PRINT, e_density[electron_dens_arr_160806]

e_dens_160806 = e_density[electron_dens_arr_160806]

;===============================================================================

electron_dens_arr_163205 = DBLARR(TII_163205_s)

FOR i = 0, TII_163205_s-1 DO BEGIN
   difference_arr_163205 = ABS(si_o_ratio-ratio_163205[i])
   electron_dens_163205 = WHERE(difference_arr_163205 EQ MIN(difference_arr_163205), /NULL)
   electron_dens_arr_163205[i] = electron_dens_163205[0]
ENDFOR

;PRINT, electron_dens_arr_163205

;PRINT, e_density[electron_dens_arr_163205]

e_dens_163205 = e_density[electron_dens_arr_163205]

;===============================================================================

electron_dens_arr_174905 = DBLARR(TII_174905_s)

FOR i = 0, TII_174905_s-1 DO BEGIN
   difference_arr_174905 = ABS(si_o_ratio-ratio_174905[i])
   electron_dens_174905 = WHERE(difference_arr_174905 EQ MIN(difference_arr_174905), /NULL)
   electron_dens_arr_174905[i] = electron_dens_174905[0]
ENDFOR

;PRINT, electron_dens_arr_174905 ;few zeros

;PRINT, e_density[electron_dens_arr_174905]

e_dens_174905 = e_density[electron_dens_arr_174905]

;===============================================================================

electron_dens_arr_181205 = DBLARR(TII_181205_s)

FOR i = 0, TII_181205_s-1 DO BEGIN
   difference_arr_181205 = ABS(si_o_ratio-ratio_181205[i])
   electron_dens_181205 = WHERE(difference_arr_181205 EQ MIN(difference_arr_181205), /NULL)
   electron_dens_arr_181205[i] = electron_dens_181205[0]
ENDFOR

;PRINT, electron_dens_arr_181205 ;few zeros

;PRINT, e_density[electron_dens_arr_181205]

e_dens_181205 = e_density[electron_dens_arr_181205]

;===============================================================================

electron_dens_arr_201925 = DBLARR(TII_201925_s)

FOR i = 0, TII_201925_s-1 DO BEGIN
   difference_arr_201925 = ABS(si_o_ratio-ratio_201925[i])
   electron_dens_201925 = WHERE(difference_arr_201925 EQ MIN(difference_arr_201925), /NULL)
   electron_dens_arr_201925[i] = electron_dens_201925[0]
ENDFOR

;PRINT, electron_dens_arr_201925 ;few zeros

;PRINT, e_density[electron_dens_arr_201925]

e_dens_201925 = e_density[electron_dens_arr_201925]

;===============================================================================

electron_dens_arr_201925_1 = DBLARR(TII_201925_1_s)

FOR i = 0, TII_201925_1_s-1 DO BEGIN
   difference_arr_201925_1 = ABS(si_o_ratio-ratio_201925_1[i])
   electron_dens_201925_1 = WHERE(difference_arr_201925_1 EQ MIN(difference_arr_201925_1), /NULL)
   electron_dens_arr_201925_1[i] = electron_dens_201925_1[0]
ENDFOR

;PRINT, electron_dens_arr_201925_1 ;few zeros

;PRINT, e_density[electron_dens_arr_201925_1]

e_dens_201925_1 = e_density[electron_dens_arr_201925_1]

;===============================================================================

electron_dens_arr_203906 = DBLARR(TII_203906_s)

FOR i = 0, TII_203906_s-1 DO BEGIN
   difference_arr_203906 = ABS(si_o_ratio-ratio_203906[i])
   electron_dens_203906 = WHERE(difference_arr_203906 EQ MIN(difference_arr_203906), /NULL)
   electron_dens_arr_203906[i] = electron_dens_203906[0]
ENDFOR

;PRINT, electron_dens_arr_203906 ;few zeros

;PRINT, e_density[electron_dens_arr_203906]

e_dens_203906 = e_density[electron_dens_arr_203906]

;===============================================================================

electron_dens_arr_215426 = DBLARR(TII_215426_s)

FOR i = 0, TII_215426_s-1 DO BEGIN
   difference_arr_215426 = ABS(si_o_ratio-ratio_215426[i])
   electron_dens_215426 = WHERE(difference_arr_215426 EQ MIN(difference_arr_215426), /NULL)
   electron_dens_arr_215426[i] = electron_dens_215426[0]
ENDFOR

;PRINT, electron_dens_arr_215426 ;few zeros

;PRINT, e_density[electron_dens_arr_215426]

e_dens_215426 = e_density[electron_dens_arr_215426]

;===============================================================================

electron_dens_arr_232931 = DBLARR(TII_232931_s)

FOR i = 0, TII_232931_s-1 DO BEGIN
   difference_arr_232931 = ABS(si_o_ratio-ratio_232931[i])
   electron_dens_232931 = WHERE(difference_arr_232931 EQ MIN(difference_arr_232931), /NULL)
   electron_dens_arr_232931[i] = electron_dens_232931[0]
ENDFOR

;PRINT, electron_dens_arr_232931 ;few zeros

;PRINT, e_density[electron_dens_arr_232931]

e_dens_232931 = e_density[electron_dens_arr_232931]

;===============================================================================

sfname_e_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/e_dens.sav'
SAVE, electron_dens_arr_004121, electron_dens_arr_050655, electron_dens_arr_050655_1, electron_dens_arr_052046, electron_dens_arr_061606, electron_dens_arr_114951, electron_dens_arr_122033, electron_dens_arr_160806, electron_dens_arr_163205, electron_dens_arr_174905, electron_dens_arr_181205, electron_dens_arr_201925, electron_dens_arr_201925_1, electron_dens_arr_203906, electron_dens_arr_215426, electron_dens_arr_232931, FILENAME = sfname_e_dens

;restore to get aspr info.

rfname_aspr = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/all_vars_004121.sav'
RESTORE, rfname_aspr

;concatenate arrays

total_D = [e_dens_004121, e_dens_050655, e_dens_050655_1, e_dens_052046, e_dens_061606, e_dens_114951, e_dens_122033, e_dens_160806, e_dens_163205, e_dens_174905, e_dens_181205, e_dens_201925, e_dens_201925_1, e_dens_203906, e_dens_215426, e_dens_232931]

;large data, so take log base 10

total_D = ALOG10(total_D)

;make histogram of all densities and frequencies

D_hist = HISTOGRAM(total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

END
