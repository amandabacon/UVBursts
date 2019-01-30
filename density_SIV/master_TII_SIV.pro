;+
;Name: master_TII_SIV.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/27
;FROM Si IV TII CALCULATIONS AND UNCERTAINTIES, AS WELL AS SNRs AND
;TIIs FROM S IV, TAKE THE RATIO B/W THE RESONANCE SI IV 1394 AND S IV
;1404 LINE TO GET THE ELECTRON DENSITIES OF THESE S IV EMISSION LINES
;IN UVB SPECTRA.

;PRO master_TII_SIV

;SNR S IV vals

;restore S IV 004121 TIIs, SNRs, etc.

rfname_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/S_IV/sigma_coeff_arr_004121_Siv.sav'
RESTORE, rfname_SNR

PRINT, SIZE(SNR_S_004121[SNR2_S_004121])
one = SNR_S_004121[SNR2_S_004121]

t_S_004121 = SNR_S_004121[SNR2_S_004121]
num_three = WHERE((t_S_004121 GT 3.0), count) ;421

num_three = WHERE((SNR_S_004121[SNR2_S_004121] GT 3.0), count) ;421

S_004121_a = It_S_004121[SNR2_S_004121]
S_004121 = S_004121_a[num_three]

;restore S IV 050655 TIIs, SNRs, etc.

rfname2_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/S_IV/sigma_coeff_arr_050655_Siv.sav'
RESTORE, rfname2_SNR

PRINT, SIZE(SNR_S_050655[SNR2_S_050655])
two = SNR_S_050655[SNR2_S_050655]

t_S_050655 = SNR_S_050655[SNR2_S_050655]
num2_three = WHERE((t_S_050655 GT 3.0), count) ;242

num2_three = WHERE((SNR_S_050655[SNR2_S_050655] GT 3.0), count) ;242

S_050655_a = It_S_050655[SNR2_S_050655]
S_050655 = S_050655_a[num2_three]

;restore S IV 050655_1 TIIs, SNRs, etc.

rfname3_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/S_IV/sigma_coeff_arr_050655_1_Siv.sav'
RESTORE, rfname3_SNR

PRINT, SIZE(SNR_S_050655_1[SNR2_S_050655_1])
three = SNR_S_050655_1[SNR2_S_050655_1]

t = SNR_S_050655_1[SNR2_S_050655_1]
num3_three = WHERE((t GT 3.0), count) ;306

num3_three = WHERE((SNR_S_050655_1[SNR2_S_050655_1] GT 3.0), count) ;306

S_050655_1_a = It_S_050655_1[SNR2_S_050655_1]
S_050655_1 = S_050655_1_a[num3_three]

;restore S IV 052046 TIIs, SNRs, etc.

;rfname4_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/S_IV/sigma_coeff_arr_052046_Siv.sav'
;RESTORE, rfname4_SNR

;PRINT, SIZE(SNR_S_052046[SNR2_S_052046])
;four = SNR_S_052046[SNR2_S_052046]

;t = SNR_S_052046[SNR2_S_052046]
;num4_three = WHERE((t GT 3.0), count) ;

;num4_three = WHERE((SNR_S_052046[SNR2_S_052046] GT 3.0), count) ;

;S_052046_a = It_S_052046[SNR2_S_052046]
;S_052046 = S_052046_a[num4_three]

;restore S IV 061606 TIIs, SNRs, etc.

rfname5_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/S_IV/sigma_coeff_arr_061606_Siv.sav'
RESTORE, rfname5_SNR

PRINT, SIZE(SNR_S_061606[SNR2_S_061606])
five = SNR_S_061606[SNR2_S_061606]

t = SNR_S_061606[SNR2_S_061606]
num5_three = WHERE((t GT 3.0), count) ;348

num5_three = WHERE((SNR_S_061606[SNR2_S_061606] GT 3.0), count) ;348

S_061606_a = It_S_061606[SNR2_S_061606]
S_061606 = S_061606_a[num5_three]

;restore S IV 114951 TIIs, SNRs, etc.

rfname6_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/sigma_coeff_arr_114951_Siv.sav'
RESTORE, rfname6_SNR

PRINT, SIZE(SNR_S_114951[SNR2_S_114951])
six = SNR_S_114951[SNR2_S_114951]

t = SNR_S_114951[SNR2_S_114951]
num6_three = WHERE((t GT 3.0), count) ;753

num6_three = WHERE((SNR_S_114951[SNR2_S_114951] GT 3.0), count) ;753

S_114951_a = It_S_114951[SNR2_S_114951]
S_114951 = S_114951_a[num6_three]

;restore S IV 122033 TIIs, SNRs, etc.

rfname7_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/sigma_coeff_arr_122033_Siv.sav'
RESTORE, rfname7_SNR

PRINT, SIZE(SNR_S_122033[SNR2_S_122033])
seven = SNR_S_122033[SNR2_S_122033]

t = SNR_S_122033[SNR2_S_122033]
num7_three = WHERE((t GT 3.0), count) ;844

num7_three = WHERE((SNR_S_122033[SNR2_S_122033] GT 3.0), count) ;844

S_122033_a = It_S_122033[SNR2_S_122033]
S_122033 = S_122033_a[num7_three]

;restore S IV 160806 TIIs, SNRs, etc.

rfname8_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/S_IV/sigma_coeff_arr_160806_Siv.sav'
RESTORE, rfname8_SNR

PRINT, SIZE(SNR_S_160806[SNR2_S_160806])
eight = SNR_S_160806[SNR2_S_160806]

t = SNR_S_160806[SNR2_S_160806]
num8_three = WHERE((t GT 3.0), count) ;510

num8_three = WHERE((SNR_S_160806[SNR2_S_160806] GT 3.0), count) ;510

S_160806_a = It_S_160806[SNR2_S_160806]
S_160806 = S_160806_a[num8_three]

;restore S IV 163205 TIIs, SNRs, etc.

rfname9_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/sigma_coeff_arr_163205_Siv.sav'
RESTORE, rfname9_SNR

PRINT, SIZE(SNR_S_163205[SNR2_S_163205])
nine = SNR_S_163205[SNR2_S_163205]

t = SNR_S_163205[SNR2_S_163205]
num9_three = WHERE((t GT 3.0), count) ;408

num9_three = WHERE((SNR_S_163205[SNR2_S_163205] GT 3.0), count) ;408

S_163205_a = It_S_163205[SNR2_S_163205]
S_163205 = S_163205_a[num9_three]

;restore S IV 174905 TIIs, SNRs, etc.

rfname10_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/S_IV/sigma_coeff_arr_174905_Siv.sav'
RESTORE, rfname10_SNR

PRINT, SIZE(SNR_S_174905[SNR2_S_174905])
ten = SNR_S_174905[SNR2_S_174905]

t = SNR_S_174905[SNR2_S_174905]
num10_three = WHERE((t GT 3.0), count) ;575

num10_three = WHERE((SNR_S_174905[SNR2_S_174905] GT 3.0), count) ;575

S_174905_a = It_S_174905[SNR2_S_174905]
S_174905 = S_174905_a[num10_three]

;restore S IV 181205 TIIs, SNRs, etc.

rfname11_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/S_IV/sigma_coeff_arr_181205_Siv.sav'
RESTORE, rfname11_SNR

PRINT, SIZE(SNR_S_181205[SNR2_S_181205])
eleven = SNR_S_181205[SNR2_S_181205]

t = SNR_S_181205[SNR2_S_181205]
num11_three = WHERE((t GT 3.0), count) ;265

num11_three = WHERE((SNR_S_181205[SNR2_S_181205] GT 3.0), count) ;265

S_181205_a = It_S_181205[SNR2_S_181205]
S_181205 = S_181205_a[num11_three]

;restore S IV 201925 TIIs, SNRs, etc.

rfname12_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/S_IV/sigma_coeff_arr_201925_Siv.sav'
RESTORE, rfname12_SNR

PRINT, SIZE(SNR_S_201925[SNR2_S_201925])
twelve = SNR_S_201925[SNR2_S_201925]

t = SNR_S_201925[SNR2_S_201925]
num12_three = WHERE((t GT 3.0), count) ;474

num12_three = WHERE((SNR_S_201925[SNR2_S_201925] GT 3.0), count) ;474

S_201925_a = It_S_201925[SNR2_S_201925]
S_201925 = S_201925_a[num12_three]

;restore S IV 201925_1 TIIs, SNRs, etc.

rfname13_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/S_IV/sigma_coeff_arr_201925_1_Siv.sav'
RESTORE, rfname13_SNR

PRINT, SIZE(SNR_S_201925_1[SNR2_S_201925_1])
thirteen = SNR_S_201925_1[SNR2_S_201925_1]

t = SNR_S_201925_1[SNR2_S_201925_1]
num13_three = WHERE((t GT 3.0), count) ;240

num13_three = WHERE((SNR_S_201925_1[SNR2_S_201925_1] GT 3.0), count) ;240

S_201925_1_a = It_S_201925_1[SNR2_S_201925_1]
S_201925_1 = S_201925_1_a[num13_three]

;restore S IV 203906 TIIs, SNRs, etc.

rfname14_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/S_IV/sigma_coeff_arr_203906_Siv.sav'
RESTORE, rfname14_SNR

PRINT, SIZE(SNR_S_203906[SNR2_S_203906])
fourteen = SNR_S_203906[SNR2_S_203906]

t = SNR_S_203906[SNR2_S_203906]
num14_three = WHERE((t GT 3.0), count) ;1054

num14_three = WHERE((SNR_S_203906[SNR2_S_203906] GT 3.0), count) ;1054

S_203906_a = It_S_203906[SNR2_S_203906]
S_203906 = S_203906_a[num14_three]

;restore S IV 215426 TIIs, SNRs, etc.

rfname15_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/sigma_coeff_arr_215426_Siv.sav'
RESTORE, rfname15_SNR

PRINT, SIZE(SNR_S_215426[SNR2_S_215426])
fifteen = SNR_S_215426[SNR2_S_215426]

t = SNR_S_215426[SNR2_S_215426]
num15_three = WHERE((t GT 3.0), count) ;157

num15_three = WHERE((SNR_S_215426[SNR2_S_215426] GT 3.0), count) ;157

S_215426_a = It_S_215426[SNR2_S_215426]
S_215426 = S_215426_a[num15_three]

;restore S IV 232931 TIIs, SNRs, etc.

rfname16_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/S_IV/sigma_coeff_arr_232931_Siv.sav'
RESTORE, rfname16_SNR

PRINT, SIZE(SNR_S_232931[SNR2_S_232931])
sixteen = SNR_S_232931[SNR2_S_232931]

t = SNR_S_232931[SNR2_S_232931]
num16_three = WHERE((t GT 3.0), count) ;187

num16_three = WHERE((SNR_S_232931[SNR2_S_232931] GT 3.0), count) ;187

S_232931_a = It_S_232931[SNR2_S_232931]
S_232931 = S_232931_a[num16_three]

;concatenate arrays

total_SNR = [one,two,three,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen]
PRINT, SIZE(total_SNR) ;6784

;===============================================================================
;TII: It, int_int_unc w/ S IV and Si IV

;restore Si IV 004121 TIIs, SNRs, etc.

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/IT_UV_004121.sav'
RESTORE, rfname

PRINT, N_ELEMENTS(It_Si_004121[num_three]) ;8

Si_004121_a = It_Si_004121[SNR2_S_004121]
Si_004121 = Si_004121_a[num_three]

;restore Si IV 050655 TIIs, SNRs, etc.

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/IT_UV_050655.sav'
RESTORE, rfname2

PRINT, N_ELEMENTS(It_Si_050655[num2_three]) ;11

Si_050655_a = It_Si_050655[SNR2_S_050655]
Si_050655 = Si_050655_a[num2_three]

;restore Si IV 050655_1 TIIs, SNRs, etc.

rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/IT_UV_050655_1.sav'
RESTORE, rfname3

PRINT, N_ELEMENTS(It_Si_050655_1[num3_three]) ;3

Si_050655_1_a = It_Si_050655_1[SNR2_S_050655_1]
Si_050655_1 = Si_050655_1_a[num3_three]

;restore Si IV 052046 TIIs, SNRs, etc.

;rfname4 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
;RESTORE, rfname4

;PRINT, N_ELEMENTS(It_Si_052046[num4_three]) ;

;Si_052046_a = It_Si_052046[SNR2_S_052046]
;Si_052046 = Si_052046_a[num4_three]

;restore Si IV 061606 TIIs, SNRs, etc.

rfname5 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/IT_UV_061606.sav'
RESTORE, rfname5

PRINT, N_ELEMENTS(It_Si_061606[num5_three]) ;5

Si_061606_a = It_Si_061606[SNR2_S_061606]
Si_061606 = Si_061606_a[num5_three]

;restore Si IV 114951 TIIs, SNRs, etc.

rfname6 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
RESTORE, rfname6

PRINT, N_ELEMENTS(It_Si_114951[num6_three]) ;52

Si_114951_a = It_Si_114951[SNR2_S_114951]
Si_114951 = Si_114951_a[num6_three]

;restore Si IV 122033 TIIs, SNRs, etc.

rfname7 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/IT_UV_122033.sav'
RESTORE, rfname7

PRINT, N_ELEMENTS(It_Si_122033[num7_three]) ;38

Si_122033_a = It_Si_122033[SNR2_S_122033]
Si_122033 = Si_122033_a[num7_three]

;restore Si IV 160806 TIIs, SNRs, etc.

rfname8 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/IT_UV_160806.sav'
RESTORE, rfname8

PRINT, N_ELEMENTS(It_Si_160806[num8_three]) ;19

Si_160806_a = It_Si_160806[SNR2_S_160806]
Si_160806 = Si_160806_a[num8_three]

;restore Si IV 163205 TIIs, SNRs, etc.

rfname9 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/IT_UV_163205.sav'
RESTORE, rfname9

PRINT, N_ELEMENTS(It_Si_163205[num9_three]) ;9

Si_163205_a = It_Si_163205[SNR2_S_163205]
Si_163205 = Si_163205_a[num9_three]

;restore Si IV 174905 TIIs, SNRs, etc.

rfname10 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/IT_UV_174905.sav'
RESTORE, rfname10

PRINT, N_ELEMENTS(It_Si_174905[num10_three]) ;54

Si_174905_a = It_Si_174905[SNR2_S_174905]
Si_174905 = Si_174905_a[num10_three]

;restore Si IV 181205 TIIs, SNRs, etc.

rfname11 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/IT_UV_181205.sav'
RESTORE, rfname11

PRINT, N_ELEMENTS(It_Si_181205[num11_three]) ;10

Si_181205_a = It_Si_181205[SNR2_S_181205]
Si_181205 = Si_181205_a[num11_three]

;restore Si IV 201925 TIIs, SNRs, etc.

rfname12 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
RESTORE, rfname12

PRINT, N_ELEMENTS(It_Si_201925[num12_three]) ;15

Si_201925_a = It_Si_201925[SNR2_S_201925]
Si_201925 = Si_201925_a[num12_three]

;restore Si IV 201925_1 TIIs, SNRs, etc.

rfname13 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/IT_UV_201925_1.sav'
RESTORE, rfname13

PRINT, N_ELEMENTS(It_Si_201925_1[num13_three]) ;5

Si_201925_1_a = It_Si_201925_1[SNR2_S_201925_1]
Si_201925_1 = Si_201925_1_a[num13_three]

;restore Si IV 203906 TIIs, SNRs, etc.

rfname14 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
RESTORE, rfname14

PRINT, N_ELEMENTS(It_Si_203906[num14_three]) ;50

Si_203906_a = It_Si_203906[SNR2_S_203906]
Si_203906 = Si_203906_a[num14_three]

;restore Si IV 215426 TIIs, SNRs, etc.

rfname15 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/IT_UV_215426.sav'
RESTORE, rfname15

PRINT, N_ELEMENTS(It_Si_215426[num15_three]) ;1

Si_215426_a = It_Si_215426[SNR2_S_215426]
Si_215426 = Si_215426_a[num15_three]

;restore Si IV 232931 TIIs, SNRs, etc.

rfname16 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
RESTORE, rfname16

PRINT, N_ELEMENTS(It_Si_232931[num16_three]) ;1

Si_232931_a = It_Si_232931[SNR2_S_232931]
Si_232931 = Si_232931_a[num16_three]

;===============================================================================
;retrieve Si IV 1393.8/S IV ratios

ratio_004121_SIV = (Si_004121/S_004121)
ratio_050655_SIV = (Si_050655/S_050655)
ratio_050655_1_SIV = (Si_050655_1/S_050655_1)
;ratio_052046_SIV = (Si_052046/S_052046)
ratio_061606_SIV = (Si_061606/S_061606)
ratio_114951_SIV = (Si_114951/S_114951)
ratio_122033_SIV = (Si_122033/S_122033)
ratio_160806_SIV = (Si_160806/S_160806)
ratio_163205_SIV = (Si_163205/S_163205)
ratio_174905_SIV = (Si_174905/S_174905)
ratio_181205_SIV = (Si_181205/S_181205)
ratio_201925_SIV = (Si_201925/S_201925)
ratio_201925_1_SIV = (Si_201925_1/S_201925_1)
ratio_203906_SIV = (Si_203906/S_203906)
ratio_215426_SIV = (Si_215426/S_215426)
ratio_232931_SIV = (Si_232931/S_232931)

;===============================================================================
;load diagnostic model

;rfname_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density/si4_o4_dens_diagnostic.sav'
;RESTORE, rfname_dens

;get size of ratios over each observation

;TII_004121_S = N_ELEMENTS(ratio_004121_SIV)
;TII_050655_S = N_ELEMENTS(ratio_050655_SIV)
;TII_050655_1_S = N_ELEMENTS(ratio_050655_1_SIV)
;TII_052046_S = N_ELEMENTS(ratio_052046_SIV)
;TII_061606_S = N_ELEMENTS(ratio_061606_SIV)
;TII_114951_S = N_ELEMENTS(ratio_114951_SIV)
;TII_122033_S = N_ELEMENTS(ratio_122033_SIV)
;TII_160806_S = N_ELEMENTS(ratio_160806_SIV)
;TII_163205_S = N_ELEMENTS(ratio_163205_SIV)
;TII_174905_S = N_ELEMENTS(ratio_174905_SIV)
;TII_181205_S = N_ELEMENTS(ratio_181205_SIV)
;TII_201925_S = N_ELEMENTS(ratio_201925_SIV)
;TII_201925_1_S = N_ELEMENTS(ratio_201925_1_SIV)
;TII_203906_S = N_ELEMENTS(ratio_203906_SIV)
;TII_215426_S = N_ELEMENTS(ratio_215426_SIV)
;TII_232931_S = N_ELEMENTS(ratio_232931_SIV)

;FOR loops for electron density info

electron_dens_arr_004121 = DBLARR(TII_004121_S)

FOR i = 0, TII_004121_S-1 DO BEGIN
   difference_arr_004121 = ABS(si_s_ratio-ratio_004121[i])
   electron_dens_004121 = WHERE(difference_arr_004121 EQ MIN(difference_arr_004121), /NULL)
   electron_dens_arr_004121[i] = electron_dens_004121[0]
ENDFOR

;PRINT, electron_dens_arr_004121 ;few zeros

;PRINT, e_density[electron_dens_arr_004121]

e_dens_004121 = e_density[electron_dens_arr_004121]

;===============================================================================

electron_dens_arr_050655 = DBLARR(TII_050655_S)

FOR i = 0, TII_050655_S-1 DO BEGIN
   difference_arr_050655 = ABS(si_s_ratio-ratio_050655[i])
   electron_dens_050655 = WHERE(difference_arr_050655 EQ MIN(difference_arr_050655), /NULL)
   electron_dens_arr_050655[i] = electron_dens_050655[0]
ENDFOR

;PRINT, electron_dens_arr_050655 ;few zeros

;PRINT, e_density[electron_dens_arr_050655]

e_dens_050655 = e_density[electron_dens_arr_050655]

;===============================================================================

electron_dens_arr_050655_1 = DBLARR(TII_050655_1_S)

FOR i = 0, TII_050655_1_S-1 DO BEGIN
   difference_arr_050655_1 = ABS(si_s_ratio-ratio_050655_1[i])
   electron_dens_050655_1 = WHERE(difference_arr_050655_1 EQ MIN(difference_arr_050655_1), /NULL)
   electron_dens_arr_050655_1[i] = electron_dens_050655_1[0]
ENDFOR

;PRINT, electron_dens_arr_050655_1 ;few zeros

;PRINT, e_density[electron_dens_arr_050655_1]

e_dens_050655_1 = e_density[electron_dens_arr_050655_1]

;===============================================================================

electron_dens_arr_052046 = DBLARR(TII_052046_S)

FOR i = 0, TII_052046_S-1 DO BEGIN
   difference_arr_052046 = ABS(si_s_ratio-ratio_052046[i])
   electron_dens_052046 = WHERE(difference_arr_052046 EQ MIN(difference_arr_052046), /NULL)
   electron_dens_arr_052046[i] = electron_dens_052046[0]
ENDFOR

;PRINT, electron_dens_arr_052046 ;few zeros

;PRINT, e_density[electron_dens_arr_052046]

e_dens_052046 = e_density[electron_dens_arr_052046]

;===============================================================================

electron_dens_arr_061606 = DBLARR(TII_061606_S)

FOR i = 0, TII_061606_S-1 DO BEGIN
   difference_arr_061606 = ABS(si_s_ratio-ratio_061606[i])
   electron_dens_061606 = WHERE(difference_arr_061606 EQ MIN(difference_arr_061606))
   electron_dens_arr_061606[i] = electron_dens_061606[0]
ENDFOR

;PRINT, electron_dens_arr_061606 ;few zeros

;PRINT, e_density[electron_dens_arr_061606]

e_dens_061606 = e_density[electron_dens_arr_061606]

;===============================================================================

electron_dens_arr_114951 = DBLARR(TII_114951_S)

FOR i = 0, TII_114951_S-1 DO BEGIN
   difference_arr_114951 = ABS(si_s_ratio-ratio_114951[i])
   electron_dens_114951 = WHERE(difference_arr_114951 EQ MIN(difference_arr_114951), /NULL) ;remove -1
   electron_dens_arr_114951[i] = electron_dens_114951[0] ;0 to choose the first min value if more than one
ENDFOR

;PRINT, electron_dens_arr_114951 ;few zeros

;PRINT, e_density[electron_dens_arr_114951]

e_dens_114951 = e_density[electron_dens_arr_114951]

;===============================================================================

electron_dens_arr_122033 = DBLARR(TII_122033_S)

FOR i = 0, TII_122033_S-1 DO BEGIN
   difference_arr_122033 = ABS(si_s_ratio-ratio_122033[i])
   electron_dens_122033 = WHERE(difference_arr_122033 EQ MIN(difference_arr_122033), /NULL)
   electron_dens_arr_122033[i] = electron_dens_122033[0]
ENDFOR

;PRINT, electron_dens_arr_122033 ;few zeros

;PRINT, e_density[electron_dens_arr_122033]

e_dens_122033 = e_density[electron_dens_arr_122033]

;===============================================================================

electron_dens_arr_160806 = DBLARR(TII_160806_S)

FOR i = 0, TII_160806_S-1 DO BEGIN
   difference_arr_160806 = ABS(si_s_ratio-ratio_160806[i])
   electron_dens_160806 = WHERE(difference_arr_160806 EQ MIN(difference_arr_160806), /NULL)
   electron_dens_arr_160806[i] = electron_dens_160806[0]
ENDFOR

;PRINT, electron_dens_arr_160806

;PRINT, e_density[electron_dens_arr_160806]

e_dens_160806 = e_density[electron_dens_arr_160806]

;===============================================================================

electron_dens_arr_163205 = DBLARR(TII_163205_S)

FOR i = 0, TII_163205_S-1 DO BEGIN
   difference_arr_163205 = ABS(si_s_ratio-ratio_163205[i])
   electron_dens_163205 = WHERE(difference_arr_163205 EQ MIN(difference_arr_163205), /NULL)
   electron_dens_arr_163205[i] = electron_dens_163205[0]
ENDFOR

;PRINT, electron_dens_arr_163205

;PRINT, e_density[electron_dens_arr_163205]

e_dens_163205 = e_density[electron_dens_arr_163205]

;===============================================================================

electron_dens_arr_174905 = DBLARR(TII_174905_S)

FOR i = 0, TII_174905_S-1 DO BEGIN
   difference_arr_174905 = ABS(si_s_ratio-ratio_174905[i])
   electron_dens_174905 = WHERE(difference_arr_174905 EQ MIN(difference_arr_174905), /NULL)
   electron_dens_arr_174905[i] = electron_dens_174905[0]
ENDFOR

;PRINT, electron_dens_arr_174905 ;few zeros

;PRINT, e_density[electron_dens_arr_174905]

e_dens_174905 = e_density[electron_dens_arr_174905]

;===============================================================================

electron_dens_arr_181205 = DBLARR(TII_181205_S)

FOR i = 0, TII_181205_S-1 DO BEGIN
   difference_arr_181205 = ABS(si_s_ratio-ratio_181205[i])
   electron_dens_181205 = WHERE(difference_arr_181205 EQ MIN(difference_arr_181205), /NULL)
   electron_dens_arr_181205[i] = electron_dens_181205[0]
ENDFOR

;PRINT, electron_dens_arr_181205 ;few zeros

;PRINT, e_density[electron_dens_arr_181205]

e_dens_181205 = e_density[electron_dens_arr_181205]

;===============================================================================

electron_dens_arr_201925 = DBLARR(TII_201925_S)

FOR i = 0, TII_201925_S-1 DO BEGIN
   difference_arr_201925 = ABS(si_s_ratio-ratio_201925[i])
   electron_dens_201925 = WHERE(difference_arr_201925 EQ MIN(difference_arr_201925), /NULL)
   electron_dens_arr_201925[i] = electron_dens_201925[0]
ENDFOR

;PRINT, electron_dens_arr_201925 ;few zeros

;PRINT, e_density[electron_dens_arr_201925]

e_dens_201925 = e_density[electron_dens_arr_201925]

;===============================================================================

electron_dens_arr_201925_1 = DBLARR(TII_201925_1_S)

FOR i = 0, TII_201925_1_S-1 DO BEGIN
   difference_arr_201925_1 = ABS(si_s_ratio-ratio_201925_1[i])
   electron_dens_201925_1 = WHERE(difference_arr_201925_1 EQ MIN(difference_arr_201925_1), /NULL)
   electron_dens_arr_201925_1[i] = electron_dens_201925_1[0]
ENDFOR

;PRINT, electron_dens_arr_201925_1 ;few zeros

;PRINT, e_density[electron_dens_arr_201925_1]

e_dens_201925_1 = e_density[electron_dens_arr_201925_1]

;===============================================================================

electron_dens_arr_203906 = DBLARR(TII_203906_S)

FOR i = 0, TII_203906_S-1 DO BEGIN
   difference_arr_203906 = ABS(si_s_ratio-ratio_203906[i])
   electron_dens_203906 = WHERE(difference_arr_203906 EQ MIN(difference_arr_203906), /NULL)
   electron_dens_arr_203906[i] = electron_dens_203906[0]
ENDFOR

;PRINT, electron_dens_arr_203906 ;few zeros

;PRINT, e_density[electron_dens_arr_203906]

e_dens_203906 = e_density[electron_dens_arr_203906]

;===============================================================================

electron_dens_arr_215426 = DBLARR(TII_215426_S)

FOR i = 0, TII_215426_S-1 DO BEGIN
   difference_arr_215426 = ABS(si_s_ratio-ratio_215426[i])
   electron_dens_215426 = WHERE(difference_arr_215426 EQ MIN(difference_arr_215426), /NULL)
   electron_dens_arr_215426[i] = electron_dens_215426[0]
ENDFOR

;PRINT, electron_dens_arr_215426 ;few zeros

;PRINT, e_density[electron_dens_arr_215426]

e_dens_215426 = e_density[electron_dens_arr_215426]

;===============================================================================

electron_dens_arr_232931 = DBLARR(TII_232931_S)

FOR i = 0, TII_232931_S-1 DO BEGIN
   difference_arr_232931 = ABS(si_s_ratio-ratio_232931[i])
   electron_dens_232931 = WHERE(difference_arr_232931 EQ MIN(difference_arr_232931), /NULL)
   electron_dens_arr_232931[i] = electron_dens_232931[0]
ENDFOR

;PRINT, electron_dens_arr_232931 ;few zeros

;PRINT, e_density[electron_dens_arr_232931]

e_dens_232931 = e_density[electron_dens_arr_232931]

;===============================================================================

sfname_e_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_SIV/e_dens.sav'
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
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_SIV/siv_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

END
