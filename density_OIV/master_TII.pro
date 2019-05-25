;+
;Name: master_TII.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/01/24
;FROM Si IV TII CALCULATIONS AND UNCERTAINTIES, AS WELL AS SNRs AND
;TIIs FROM O IV, TAKE THE RATIO B/W THE RESONANT SI IV 1394 AND O IV
;1401 LINE TO GET THE ELECTRON DENSITIES OF THESE O IV EMISSION LINES
;IN UVB SPECTRA.

PRO master_TII

;SNR O IV vals

PRINT, 'continue'

rfname_004121 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/iso_vars_004121.sav' 
RESTORE, rfname_004121

;restore O IV 004121 TIIs, SNRs, etc.

rfname_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_SNR

one = SNR_O_004121[SNR2_O_004121]

;-------------------------------------------------------------------------------
;wrong--breaking one-to-one correspondence
;num_three = WHERE((SNR_O_004121[SNR2_O_004121] GT 3.0), count)
;-------------------------------------------------------------------------------

num_three = WHERE((SNR_O_004121 GE 3.0) AND FINITE(SNR_O_004121), count) ;remove both the nonfinite SNRs and SNRs < 3 in one shot
PRINT, SIZE(num_three) ;90
PRINT, 'SNR_O_004121[num_three]'
PRINT, SNR_O_004121[num_three]

;-------------------------------------------------------------------------------
;wrong--breaking one-to-one correspondence
;O_004121_a = It_O_004121[SNR2_O_004121] ;It = total integrated intensity
;O_004121 = O_004121_a[num_three]
;-------------------------------------------------------------------------------

O_004121 = It_O_004121[num_three]
PRINT, 'O_004121'
PRINT, O_004121

PRINT, 'continue'

rfname_050655 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/iso_vars_050655.sav'
RESTORE, rfname_050655

;restore O IV 050655 TIIs, SNRs, etc.

rfname2_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/sigma_coeff_arr_050655_Oiv.sav'
RESTORE, rfname2_SNR

two = SNR_O_050655[SNR2_O_050655]

num2_three = WHERE((SNR_O_050655 GE 3.0) AND FINITE(SNR_O_050655), count)
PRINT, SIZE(num2_three) ;66
PRINT, 'SNR_O_050655[num2_three]'
PRINT, SNR_O_050655[num2_three]

O_050655 = It_O_050655[num2_three]
PRINT, 'O_050655'
PRINT, O_050655

PRINT, 'continue'

rfname_050655_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/iso_vars_050655_1.sav'
RESTORE, rfname_050655_1

;restore O IV 050655_1 TIIs, SNRs, etc.

rfname3_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/sigma_coeff_arr_050655_1_Oiv.sav'
RESTORE, rfname3_SNR

three = SNR_O_050655_1[SNR2_O_050655_1]

num3_three = WHERE((SNR_O_050655_1 GE 3.0) AND FINITE(SNR_O_050655_1), count)
PRINT, SIZE(num3_three) ;109
PRINT, 'SNR_O_050655_1[num3_three]'
PRINT, SNR_O_050655_1[num3_three]

O_050655_1 = It_O_050655_1[num3_three]
PRINT, 'O_050655_1'
PRINT, O_050655_1

PRINT, 'continue'

rfname_052046 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_052046.sav'
RESTORE, rfname_052046

;restore O IV 052046 TIIs, SNRs, etc.

rfname4_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/sigma_coeff_arr_052046_Oiv.sav'
RESTORE, rfname4_SNR

four = SNR_O_052046[SNR2_O_052046]

num4_three = WHERE((SNR_O_052046 GE 3.0) AND FINITE(SNR_O_052046), count)
PRINT, SIZE(num4_three) ;1231
PRINT, 'SNR_O_052046[num4_three]'
PRINT, SNR_O_052046[num4_three]

O_052046 = It_O_052046[num4_three]
PRINT, 'O_052046'
PRINT, O_052046

PRINT, 'continue'

rfname_061606 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/iso_vars_061606.sav'
RESTORE, rfname_061606

;restore O IV 061606 TIIs, SNRs, etc.

rfname5_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/sigma_coeff_arr_061606_Oiv.sav'
RESTORE, rfname5_SNR

five = SNR_O_061606[SNR2_O_061606]

num5_three = WHERE((SNR_O_061606 GE 3.0) AND FINITE(SNR_O_061606), count)
PRINT, SIZE(num5_three) ;108
PRINT, 'SNR_O_061606[num5_three]'
PRINT, SNR_O_061606[num5_three]

O_061606 = It_O_061606[num5_three]
PRINT, 'O_061606'
PRINT, O_061606

PRINT, 'continue'

rfname_114951 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
RESTORE, rfname_114951

;restore O IV 114951 TIIs, SNRs, etc.

rfname6_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/sigma_coeff_arr_114951_Oiv.sav'
RESTORE, rfname6_SNR

six = SNR_O_114951[SNR2_O_114951]

num6_three = WHERE((SNR_O_114951 GE 3.0) AND FINITE(SNR_O_114951), count)
PRINT, SIZE(num6_three) ;160
PRINT, 'SNR_O_114951[num6_three]'
PRINT, SNR_O_114951[num6_three]

O_114951 = It_O_114951[num6_three]
PRINT, 'O_114951'
PRINT, O_114951

PRINT, 'continue'

rfname_122033 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/iso_vars_122033.sav'
RESTORE, rfname_122033

;restore O IV 122033 TIIs, SNRs, etc.

rfname7_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/sigma_coeff_arr_122033_Oiv.sav'
RESTORE, rfname7_SNR

seven = SNR_O_122033[SNR2_O_122033]

num7_three = WHERE((SNR_O_122033 GE 3.0) AND FINITE(SNR_O_122033), count)
PRINT, SIZE(num7_three) ;399
PRINT, 'SNR_O_122033[num7_three]'
PRINT, SNR_O_122033[num7_three]

O_122033 = It_O_122033[num7_three]
PRINT, 'O_122033'
PRINT, O_122033

PRINT, 'continue'

rfname_160806 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/iso_vars_160806.sav'
RESTORE, rfname_160806

;restore O IV 160806 TIIs, SNRs, etc.

rfname8_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/sigma_coeff_arr_160806_Oiv.sav'
RESTORE, rfname8_SNR

eight = SNR_O_160806[SNR2_O_160806]

num8_three = WHERE((SNR_O_160806 GE 3.0) AND FINITE(SNR_O_160806), count)
PRINT, SIZE(num8_three) ;157
PRINT, 'SNR_O_160806[num8_three]'
PRINT, SNR_O_160806[num8_three]

O_160806 = It_O_160806[num8_three]
PRINT, 'O_160806'
PRINT, O_160806

PRINT, 'continue'

rfname_163205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_163205.sav'
RESTORE, rfname_163205

;restore O IV 163205 TIIs, SNRs, etc.

rfname9_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
RESTORE, rfname9_SNR

nine = SNR_O_163205[SNR2_O_163205]

num9_three = WHERE((SNR_O_163205 GE 3.0) AND FINITE(SNR_O_163205), count)
PRINT, SIZE(num9_three) ;71
PRINT, 'SNR_O_163205[num9_three]'
PRINT, SNR_O_163205[num9_three]

O_163205 = It_O_163205[num9_three]
PRINT, 'O_163205'
PRINT, O_163205

PRINT, 'continue'

rfname_174905 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/iso_vars_174905.sav'
RESTORE, rfname_174905

;restore O IV 174905 TIIs, SNRs, etc.

rfname10_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/sigma_coeff_arr_174905_Oiv.sav'
RESTORE, rfname10_SNR

ten = SNR_O_174905[SNR2_O_174905]

num10_three = WHERE((SNR_O_174905 GE 3.0) AND FINITE(SNR_O_174905), count)
PRINT, SIZE(num10_three) ;244
PRINT, 'SNR_O_174905[num10_three]'
PRINT, SNR_O_174905[num10_three]

O_174905 = It_O_174905[num10_three]
PRINT, 'O_174905'
PRINT, O_174905

PRINT, 'continue'

rfname_181205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/iso_vars_181205.sav'
RESTORE, rfname_181205

;restore O IV 181205 TIIs, SNRs, etc.

rfname11_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/sigma_coeff_arr_181205_Oiv.sav'
RESTORE, rfname11_SNR

eleven = SNR_O_181205[SNR2_O_181205]

num11_three = WHERE((SNR_O_181205 GE 3.0) AND FINITE(SNR_O_181205), count)
PRINT, SIZE(num11_three) ;71
PRINT, 'SNR_O_181205[num11_three]'
PRINT, SNR_O_181205[num11_three]

O_181205 = It_O_181205[num11_three]
PRINT, 'O_181205'
PRINT, O_181205

PRINT, 'continue'

rfname_201925 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_201925.sav'
RESTORE, rfname_201925

;restore O IV 201925 TIIs, SNRs, etc.

rfname12_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/sigma_coeff_arr_201925_Oiv.sav'
RESTORE, rfname12_SNR

twelve = SNR_O_201925[SNR2_O_201925]

num12_three = WHERE((SNR_O_201925 GE 3.0) AND FINITE(SNR_O_201925), count)
PRINT, SIZE(num12_three) ;59
PRINT, 'SNR_O_201925[num12_three]'
PRINT, SNR_O_201925[num12_three]

O_201925 = It_O_201925[num12_three]
PRINT, 'O_201925'
PRINT, O_201925

PRINT, 'continue'

rfname_201925_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/iso_vars_201925_1.sav'
RESTORE, rfname_201925_1

;restore O IV 201925_1 TIIs, SNRs, etc.

rfname13_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/sigma_coeff_arr_201925_1_Oiv.sav'
RESTORE, rfname13_SNR

thirteen = SNR_O_201925_1[SNR2_O_201925_1]

num13_three = WHERE((SNR_O_201925_1 GE 3.0) AND FINITE(SNR_O_201925_1), count)
PRINT, SIZE(num13_three) ;58
PRINT, 'SNR_O_201925_1[num13_three]'
PRINT, SNR_O_201925_1[num13_three]

O_201925_1 = It_O_201925_1[num13_three]
PRINT, 'O_201925_1'
PRINT, O_201925_1

PRINT, 'continue'

rfname_203906 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
RESTORE, rfname_203906

;restore O IV 203906 TIIs, SNRs, etc.

rfname14_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
RESTORE, rfname14_SNR

fourteen = SNR_O_203906[SNR2_O_203906]

num14_three = WHERE((SNR_O_203906 GE 3.0) AND FINITE(SNR_O_203906), count)
PRINT, SIZE(num14_three) ;340
PRINT, 'SNR_O_203906[num14_three]'
PRINT, SNR_O_203906[num14_three]

O_203906 = It_O_203906[num14_three]
PRINT, 'O_203906'
PRINT, O_203906

PRINT, 'continue'

;restore O IV 215426 TIIs, SNRs, etc.

rfname_215426 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/iso_vars_215426.sav'
RESTORE, rfname_215426

rfname15_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/sigma_coeff_arr_215426_Oiv.sav'
RESTORE, rfname15_SNR

fifteen = SNR_O_215426[SNR2_O_215426]

num15_three = WHERE((SNR_O_215426 GE 3.0) AND FINITE(SNR_O_215426), count)
PRINT, SIZE(num15_three) ;26
PRINT, 'SNR_O_215426[num15_three]'
PRINT, SNR_O_215426[num15_three]

O_215426 = It_O_215426[num15_three]
PRINT, 'O_215426'
PRINT, O_215426

PRINT, 'continue'

rfname_232931 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_232931.sav'
RESTORE, rfname_232931

;restore O IV 232931 TIIs, SNRs, etc.

rfname16_SNR = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/sigma_coeff_arr_232931_Oiv.sav'
RESTORE, rfname16_SNR

sixteen = SNR_O_232931[SNR2_O_232931]

num16_three = WHERE((SNR_O_232931 GE 3.0) AND FINITE(SNR_O_232931), count)
PRINT, SIZE(num16_three) ;28
PRINT, 'SNR_O_232931[num16_three]'
PRINT, SNR_O_232931[num16_three]

O_232931 = It_O_232931[num16_three]
PRINT, 'O_232931'
PRINT, O_232931

;concatenate arrays

total_SNR = [one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen,sixteen]
PRINT, SIZE(total_SNR) ;10567

;===============================================================================
;TII: It, int_int_unc w/ O IV and Si IV

;restore Si IV 004121 TIIs, SNRs, etc.

rfname = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/IT_UV_004121.sav'
RESTORE, rfname

;-------------------------------------------------------------------------------
;wrong--breaks one-to-one correspondence
;PRINT, 'test'
;PRINT, It_Si_004121[num_three] ;same as below..

;Si_004121_a = It_Si_004121[SNR2_O_004121]
;Si_004121 = Si_004121_a[num_three]
;-------------------------------------------------------------------------------

UVB_ind_Oiv_three_004121 = UVB_ind_Oiv_004121[num_three]
PRINT, 'UVB_ind_Oiv_three_004121'
PRINT, UVB_ind_Oiv_three_004121

var_Si_three = WHERE(UVB_ind_004121 EQ UVB_ind_Oiv_three_004121)
MATCH,UVB_ind_004121,UVB_ind_Oiv_three_004121,var_Si_three,dum
Si_004121 = It_Si_004121[var_Si_three]
PRINT, N_ELEMENTS(Si_004121) ;90
PRINT, 'Si_004121'
PRINT, Si_004121

;restore Si IV 050655 TIIs, SNRs, etc.

rfname2 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/IT_UV_050655.sav'
RESTORE, rfname2

UVB_ind_Oiv_three_050655 = UVB_ind_Oiv_050655[num2_three]
PRINT, 'UVB_ind_Oiv_three_050655'
PRINT, UVB_ind_Oiv_three_050655

var_Si_three_2 = WHERE(UVB_ind_050655 EQ UVB_ind_Oiv_three_050655)
MATCH,UVB_ind_050655,UVB_ind_Oiv_three_050655,var_Si_three_2,dum
Si_050655 = It_Si_050655[var_Si_three_2]
PRINT, N_ELEMENTS(Si_050655) ;66
PRINT, 'Si_050655'
PRINT, Si_050655

;restore Si IV 050655_1 TIIs, SNRs, etc.

rfname3 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/IT_UV_050655_1.sav'
RESTORE, rfname3

UVB_ind_Oiv_three_050655_1 = UVB_ind_Oiv_050655_1[num3_three]
PRINT, 'UVB_ind_Oiv_three_050655_1'
PRINT, UVB_ind_Oiv_three_050655_1

var_Si_three_3 = WHERE(UVB_ind_050655_1 EQ UVB_ind_Oiv_three_050655_1)
MATCH,UVB_ind_050655_1,UVB_ind_Oiv_three_050655_1,var_Si_three_3,dum
Si_050655_1 = It_Si_050655_1[var_Si_three_3]
PRINT, N_ELEMENTS(Si_050655_1) ;109
PRINT, 'Si_050655_1'
PRINT, Si_050655_1

;restore Si IV 052046 TIIs, SNRs, etc.

rfname4 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
RESTORE, rfname4

UVB_ind_Oiv_three_052046 = UVB_ind_Oiv_052046[num4_three]
PRINT, 'UVB_ind_Oiv_three_052046'
PRINT, UVB_ind_Oiv_three_052046

var_Si_three_4 = WHERE(UVB_ind_052046 EQ UVB_ind_Oiv_three_052046)
MATCH,UVB_ind_052046,UVB_ind_Oiv_three_052046,var_Si_three_4,dum
Si_052046 = It_Si_052046[var_Si_three_4]
PRINT, N_ELEMENTS(Si_052046) ;1231-----------------------check this
PRINT, 'Si_052046'
PRINT, Si_052046

;restore Si IV 061606 TIIs, SNRs, etc.

rfname5 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/IT_UV_061606.sav'
RESTORE, rfname5

UVB_ind_Oiv_three_061606 = UVB_ind_Oiv_061606[num5_three]
PRINT, 'UVB_ind_Oiv_three_061606'
PRINT, UVB_ind_Oiv_three_061606

var_Si_three_5 = WHERE(UVB_ind_061606 EQ UVB_ind_Oiv_three_061606)
MATCH,UVB_ind_061606,UVB_ind_Oiv_three_061606,var_Si_three_5,dum
Si_061606 = It_Si_061606[var_Si_three_5]
PRINT, N_ELEMENTS(Si_061606) ;108
PRINT, 'Si_061606'
PRINT, Si_061606

;restore Si IV 114951 TIIs, SNRs, etc.

rfname6 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
RESTORE, rfname6

UVB_ind_Oiv_three_114951 = UVB_ind_Oiv_114951[num6_three]
PRINT, 'UVB_ind_Oiv_three_114951'
PRINT, UVB_ind_Oiv_three_114951

var_Si_three_6 = WHERE(UVB_ind_114951 EQ UVB_ind_Oiv_three_114951)
MATCH,UVB_ind_114951,UVB_ind_Oiv_three_114951,var_Si_three_6,dum
Si_114951 = It_Si_114951[var_Si_three_6]
PRINT, N_ELEMENTS(Si_114951) ;160
PRINT, 'Si_114951'
PRINT, Si_114951

;restore Si IV 122033 TIIs, SNRs, etc.

rfname7 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/IT_UV_122033.sav'
RESTORE, rfname7

UVB_ind_Oiv_three_122033 = UVB_ind_Oiv_122033[num7_three]
PRINT, 'UVB_ind_Oiv_three_122033'
PRINT, UVB_ind_Oiv_three_122033

var_Si_three_7 = WHERE(UVB_ind_122033 EQ UVB_ind_Oiv_three_122033)
MATCH,UVB_ind_122033,UVB_ind_Oiv_three_122033,var_Si_three_7,dum
Si_122033 = It_Si_122033[var_Si_three_7]
PRINT, N_ELEMENTS(Si_122033) ;399
PRINT, 'Si_122033'
PRINT, Si_122033

;restore Si IV 160806 TIIs, SNRs, etc.

rfname8 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/IT_UV_160806.sav'
RESTORE, rfname8

UVB_ind_Oiv_three_160806 = UVB_ind_Oiv_160806[num8_three]
PRINT, 'UVB_ind_Oiv_three_160806'
PRINT, UVB_ind_Oiv_three_160806

var_Si_three_8 = WHERE(UVB_ind_160806 EQ UVB_ind_Oiv_three_160806)
MATCH,UVB_ind_160806,UVB_ind_Oiv_three_160806,var_Si_three_8,dum
Si_160806 = It_Si_160806[var_Si_three_8]
PRINT, N_ELEMENTS(Si_160806) ;157
PRINT, 'Si_160806'
PRINT, Si_160806

;restore Si IV 163205 TIIs, SNRs, etc.

rfname9 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/IT_UV_163205.sav'
RESTORE, rfname9

UVB_ind_Oiv_three_163205 = UVB_ind_Oiv_163205[num9_three]
PRINT, 'UVB_ind_Oiv_three_163205'
PRINT, UVB_ind_Oiv_three_163205

var_Si_three_9 = WHERE(UVB_ind_163205 EQ UVB_ind_Oiv_three_163205)
MATCH,UVB_ind_163205,UVB_ind_Oiv_three_163205,var_Si_three_9,dum
Si_163205 = It_Si_163205[var_Si_three_9]
PRINT, N_ELEMENTS(Si_163205) ;71
PRINT, 'Si_163205'
PRINT, Si_163205

;restore Si IV 174905 TIIs, SNRs, etc.

rfname10 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/IT_UV_174905.sav'
RESTORE, rfname10

UVB_ind_Oiv_three_174905 = UVB_ind_Oiv_174905[num10_three]
PRINT, 'UVB_ind_Oiv_three_174905'
PRINT, UVB_ind_Oiv_three_174905

var_Si_three_10 = WHERE(UVB_ind_174905 EQ UVB_ind_Oiv_three_174905)
MATCH,UVB_ind_174905,UVB_ind_Oiv_three_174905,var_Si_three_10,dum
Si_174905 = It_Si_174905[var_Si_three_10]
PRINT, N_ELEMENTS(Si_174905) ;244
PRINT, 'Si_174905'
PRINT, Si_174905

;restore Si IV 181205 TIIs, SNRs, etc.

rfname11 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/IT_UV_181205.sav'
RESTORE, rfname11

UVB_ind_Oiv_three_181205 = UVB_ind_Oiv_181205[num11_three]
PRINT, 'UVB_ind_Oiv_three_181205'
PRINT, UVB_ind_Oiv_three_181205

var_Si_three_11 = WHERE(UVB_ind_181205 EQ UVB_ind_Oiv_three_181205)
MATCH,UVB_ind_181205,UVB_ind_Oiv_three_181205,var_Si_three_11,dum
Si_181205 = It_Si_181205[var_Si_three_11]
PRINT, N_ELEMENTS(Si_181205) ;71
PRINT, 'Si_181205'
PRINT, Si_181205

;restore Si IV 201925 TIIs, SNRs, etc.

rfname12 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
RESTORE, rfname12

UVB_ind_Oiv_three_201925 = UVB_ind_Oiv_201925[num12_three]
PRINT, 'UVB_ind_Oiv_three_201925'
PRINT, UVB_ind_Oiv_three_201925

var_Si_three_12 = WHERE(UVB_ind_201925 EQ UVB_ind_Oiv_three_201925)
MATCH,UVB_ind_201925,UVB_ind_Oiv_three_201925,var_Si_three_12,dum
Si_201925 = It_Si_201925[var_Si_three_12]
PRINT, N_ELEMENTS(Si_201925) ;59
PRINT, 'Si_201925'
PRINT, Si_201925

;restore Si IV 201925_1 TIIs, SNRs, etc.

rfname13 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/IT_UV_201925_1.sav'
RESTORE, rfname13

UVB_ind_Oiv_three_201925_1 = UVB_ind_Oiv_201925_1[num13_three]
PRINT, 'UVB_ind_Oiv_three_201925_1'
PRINT, UVB_ind_Oiv_three_201925_1

var_Si_three_13 = WHERE(UVB_ind_201925_1 EQ UVB_ind_Oiv_three_201925_1)
MATCH,UVB_ind_201925_1,UVB_ind_Oiv_three_201925_1,var_Si_three_13,dum
Si_201925_1 = It_Si_201925_1[var_Si_three_13]
PRINT, N_ELEMENTS(Si_201925_1) ;58
PRINT, 'Si_201925_1'
PRINT, Si_201925_1

;restore Si IV 203906 TIIs, SNRs, etc.

rfname14 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
RESTORE, rfname14

UVB_ind_Oiv_three_203906 = UVB_ind_Oiv_203906[num14_three]
PRINT, 'UVB_ind_Oiv_three_203906'
PRINT, UVB_ind_Oiv_three_203906

var_Si_three_14 = WHERE(UVB_ind_203906 EQ UVB_ind_Oiv_three_203906)
MATCH,UVB_ind_203906,UVB_ind_Oiv_three_203906,var_Si_three_14,dum
Si_203906 = It_Si_203906[var_Si_three_14]
PRINT, N_ELEMENTS(Si_203906) ;340
PRINT, 'Si_203906'
PRINT, Si_203906

;restore Si IV 215426 TIIs, SNRs, etc.

rfname15 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/IT_UV_215426.sav'
RESTORE, rfname15

UVB_ind_Oiv_three_215426 = UVB_ind_Oiv_215426[num15_three]
PRINT, 'UVB_ind_Oiv_three_215426'
PRINT, UVB_ind_Oiv_three_215426

var_Si_three_15 = WHERE(UVB_ind_215426 EQ UVB_ind_Oiv_three_215426)
MATCH,UVB_ind_215426,UVB_ind_Oiv_three_215426,var_Si_three_15,dum
Si_215426 = It_Si_215426[var_Si_three_15]
PRINT, N_ELEMENTS(Si_215426) ;26
PRINT, 'Si_215426'
PRINT, Si_215426

;restore Si IV 232931 TIIs, SNRs, etc.

rfname16 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
RESTORE, rfname16

UVB_ind_Oiv_three_232931 = UVB_ind_Oiv_232931[num16_three]
PRINT, 'UVB_ind_Oiv_three_232931'
PRINT, UVB_ind_Oiv_three_232931

var_Si_three_16 = WHERE(UVB_ind_232931 EQ UVB_ind_Oiv_three_232931)
MATCH,UVB_ind_232931,UVB_ind_Oiv_three_232931,var_Si_three_16,dum
Si_232931 = It_Si_232931[var_Si_three_16]
PRINT, N_ELEMENTS(Si_232931) ;28
PRINT, 'Si_232931'
PRINT, Si_232931

;===============================================================================
;retrieve Si IV 1393.8/O IV ratios

ratio_004121 = (Si_004121/O_004121)
PRINT, "ratio_004121"
PRINT, ratio_004121
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
PRINT, "TII_004121_s"
PRINT, TII_004121_s ;90
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

;===============================================================================

;FOR loops for electron density info

electron_dens_arr_004121 = DBLARR(TII_004121_s)

FOR i = 0, TII_004121_s-1 DO BEGIN
   difference_arr_004121 = ABS(si_o_ratio-ratio_004121[i])
   electron_dens_004121 = WHERE(difference_arr_004121 EQ MIN(difference_arr_004121), /NULL)
   electron_dens_arr_004121[i] = electron_dens_004121[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_004121"

;PRINT, electron_dens_arr_004121 ;7 zeros--all +5 (decimal places to left)

PRINT, "ZEROS"

zeros_004121 = WHERE((electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_004121)

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_004121] ;no zeros--+09=7,+10=6,+11=50,+12=27
;--0
PRINT, "004121"

nin_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_004121) ;7--0

ten_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_004121) ;6--0

elev_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_004121) ;50--46

twel_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_004121) ;27--44

thirt_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_004121) ;0

four_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_004121) ;0

PRINT, "STATS"

stat_nin_004121 = FLOAT((N_ELEMENTS(nin_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_nin_004121 ;7.77778--0

stat_ten_004121 = FLOAT((N_ELEMENTS(ten_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_ten_004121 ;6.66667--0

stat_elev_004121 = FLOAT((N_ELEMENTS(elev_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_elev_004121 ;55.5556--51.1111

stat_twel_004121 = FLOAT((N_ELEMENTS(twel_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_twel_004121 ;30.0000--48.8889

stat_thirt_004121 = FLOAT((N_ELEMENTS(thirt_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_thirt_004121 ;0

stat_four_004121 = FLOAT((N_ELEMENTS(four_004121))/FLOAT(N_ELEMENTS(num_three)))*100
PRINT, stat_four_004121 ;0

e_dens_004121 = e_density[electron_dens_arr_004121]

;===============================================================================

electron_dens_arr_050655 = DBLARR(TII_050655_s)

FOR i = 0, TII_050655_s-1 DO BEGIN
   difference_arr_050655 = ABS(si_o_ratio-ratio_050655[i])
   electron_dens_050655 = WHERE(difference_arr_050655 EQ MIN(difference_arr_050655), /NULL)
   electron_dens_arr_050655[i] = electron_dens_050655[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_050655"

;PRINT, electron_dens_arr_050655 ;10 zeros--all +05 to left--0

PRINT, "ZEROS"

zeros_050655 = WHERE((electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_050655) ;10

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_050655] ;no
;zeros--+09=10,+10=5,+11=32,+12=17,+13=2

PRINT, "050655"

nin_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655) ;10--0

ten_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655) ;5--1

elev_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655) ;32

twel_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655) ;17--29

thirt_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655) ;2--4

four_050655 = WHERE((e_density[electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655) ;0

PRINT, "STATS"

stat_nin_050655 = FLOAT((N_ELEMENTS(nin_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_nin_050655 ;15.1515--0

stat_ten_050655 = FLOAT((N_ELEMENTS(ten_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_ten_050655 ;7.57576--1.51515

stat_elev_050655 = FLOAT((N_ELEMENTS(elev_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_elev_050655 ;48.4848

stat_twel_050655 = FLOAT((N_ELEMENTS(twel_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_twel_050655 ;25.7576--43.9394

stat_thirt_050655 = FLOAT((N_ELEMENTS(thirt_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_thirt_050655 ;3.03030--6.06061

stat_four_050655 = FLOAT((N_ELEMENTS(four_050655))/FLOAT(N_ELEMENTS(num2_three)))*100
PRINT, stat_four_050655 ;0

e_dens_050655 = e_density[electron_dens_arr_050655]

;===============================================================================

electron_dens_arr_050655_1 = DBLARR(TII_050655_1_s)

FOR i = 0, TII_050655_1_s-1 DO BEGIN
   difference_arr_050655_1 = ABS(si_o_ratio-ratio_050655_1[i])
   electron_dens_050655_1 = WHERE(difference_arr_050655_1 EQ MIN(difference_arr_050655_1), /NULL)
   electron_dens_arr_050655_1[i] = electron_dens_050655_1[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_050655_1"

;PRINT, electron_dens_arr_050655_1 ;8 zeros--1

PRINT, "ZEROS"

zeros_050655_1 = WHERE((electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_050655_1) ;8--1

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_050655_1]

PRINT, "050655_1"

nin_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655_1) ;9--1

ten_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655_1) ;8--4

elev_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655_1) ;64--67

twel_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655_1) ;28--36

thirt_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655_1) ;0--1

four_050655_1 = WHERE((e_density[electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655_1) ;0

PRINT, "STATS"

stat_nin_050655_1 = FLOAT((N_ELEMENTS(nin_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_nin_050655_1 ;8.25688--0.917431

stat_ten_050655_1 = FLOAT((N_ELEMENTS(ten_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_ten_050655_1 ;7.33945--3.66972

stat_elev_050655_1 = FLOAT((N_ELEMENTS(elev_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_elev_050655_1 ;58.7156--61.4679

stat_twel_050655_1 = FLOAT((N_ELEMENTS(twel_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_twel_050655_1 ;25.6881--33.0275

stat_thirt_050655_1 = FLOAT((N_ELEMENTS(thirt_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_thirt_050655_1 ;0--0.917431

stat_four_050655_1 = FLOAT((N_ELEMENTS(four_050655_1))/FLOAT(N_ELEMENTS(num3_three)))*100
PRINT, stat_four_050655_1 ;0

e_dens_050655_1 = e_density[electron_dens_arr_050655_1]

;===============================================================================

electron_dens_arr_052046 = DBLARR(TII_052046_s)

FOR i = 0, TII_052046_s-1 DO BEGIN
   difference_arr_052046 = ABS(si_o_ratio-ratio_052046[i])
   electron_dens_052046 = WHERE(difference_arr_052046 EQ MIN(difference_arr_052046), /NULL)
   electron_dens_arr_052046[i] = electron_dens_052046[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_052046"

;PRINT, electron_dens_arr_052046 ;355 zeros

PRINT, "ZEROS"

zeros_052046 = WHERE((electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_052046) ;355--20

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_052046]

PRINT, "052046"

nin_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_052046) ;362--21

ten_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_052046) ;124--33

elev_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_052046) ;513--992

twel_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_052046) ;223--171

thirt_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_052046) ;9--14

four_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_052046) ;0

PRINT, "STATS"

stat_nin_052046 = FLOAT((N_ELEMENTS(nin_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_nin_052046 ;29.4070--1.70593

stat_ten_052046 = FLOAT((N_ELEMENTS(ten_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_ten_052046 ;10.0731--2.68075

stat_elev_052046 = FLOAT((N_ELEMENTS(elev_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_elev_052046 ;41.6734--80.5849

stat_twel_052046 = FLOAT((N_ELEMENTS(twel_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_twel_052046 ;18.1154--13.8911

stat_thirt_052046 = FLOAT((N_ELEMENTS(thirt_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_thirt_052046 ;0.731113--1.13729

stat_four_052046 = FLOAT((N_ELEMENTS(four_052046))/FLOAT(N_ELEMENTS(num4_three)))*100
PRINT, stat_four_052046 ;0

e_dens_052046 = e_density[electron_dens_arr_052046]

;===============================================================================

electron_dens_arr_061606 = DBLARR(TII_061606_s)

FOR i = 0, TII_061606_s-1 DO BEGIN
   difference_arr_061606 = ABS(si_o_ratio-ratio_061606[i])
   electron_dens_061606 = WHERE(difference_arr_061606 EQ MIN(difference_arr_061606))
   electron_dens_arr_061606[i] = electron_dens_061606[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_061606"

;PRINT, electron_dens_arr_061606 ;6 zeros--0

PRINT, "ZEROS"

zeros_061606 = WHERE((electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_061606) ;6--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_061606]

PRINT, "061606"

nin_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_061606) ;7--0

ten_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_061606) ;4--1

elev_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_061606) ;45--48

twel_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_061606) ;52--59

thirt_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_061606) ;0

four_061606 = WHERE((e_density[electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_061606) ;0

PRINT, "STATS"

stat_nin_061606 = FLOAT((N_ELEMENTS(nin_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_nin_061606 ;6.48148--0

stat_ten_061606 = FLOAT((N_ELEMENTS(ten_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_ten_061606 ;3.70370--0.925926

stat_elev_061606 = FLOAT((N_ELEMENTS(elev_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_elev_061606 ;41.6667--44.4444

stat_twel_061606 = FLOAT((N_ELEMENTS(twel_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_twel_061606 ;48.1481--54.6296

stat_thirt_061606 = FLOAT((N_ELEMENTS(thirt_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_thirt_061606 ;0

stat_four_061606 = FLOAT((N_ELEMENTS(four_061606))/FLOAT(N_ELEMENTS(num5_three)))*100
PRINT, stat_four_061606 ;0

e_dens_061606 = e_density[electron_dens_arr_061606]

;===============================================================================

electron_dens_arr_114951 = DBLARR(TII_114951_s)

FOR i = 0, TII_114951_s-1 DO BEGIN
   difference_arr_114951 = ABS(si_o_ratio-ratio_114951[i])
   electron_dens_114951 = WHERE(difference_arr_114951 EQ MIN(difference_arr_114951), /NULL) ;remove -1
   electron_dens_arr_114951[i] = electron_dens_114951[0] ;0 to choose the first min value if more than one
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_114951"

;PRINT, electron_dens_arr_114951 ;50 zeros--35

PRINT, "ZEROS"

zeros_114951 = WHERE((electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_114951) ;50--35

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_114951]

PRINT, "114951"

nin_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_114951) ;53--35

ten_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_114951) ;6--5

elev_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_114951) ;46--55

twel_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_114951) ;51--63

thirt_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_114951) ;4--2

four_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_114951) ;0

PRINT, "STATS"

stat_nin_114951 = FLOAT((N_ELEMENTS(nin_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_nin_114951 ;33.1250--21.8750

stat_ten_114951 = FLOAT((N_ELEMENTS(ten_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_ten_114951 ;3.75000--3.12500

stat_elev_114951 = FLOAT((N_ELEMENTS(elev_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_elev_114951 ;28.7500--34.3750

stat_twel_114951 = FLOAT((N_ELEMENTS(twel_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_twel_114951 ;31.8750--39.3750

stat_thirt_114951 = FLOAT((N_ELEMENTS(thirt_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_thirt_114951 ;2.50000--1.25000

stat_four_114951 = FLOAT((N_ELEMENTS(four_114951))/FLOAT(N_ELEMENTS(num6_three)))*100
PRINT, stat_four_114951 ;0

e_dens_114951 = e_density[electron_dens_arr_114951]

;===============================================================================

electron_dens_arr_122033 = DBLARR(TII_122033_s)

FOR i = 0, TII_122033_s-1 DO BEGIN
   difference_arr_122033 = ABS(si_o_ratio-ratio_122033[i])
   electron_dens_122033 = WHERE(difference_arr_122033 EQ MIN(difference_arr_122033), /NULL)
   electron_dens_arr_122033[i] = electron_dens_122033[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_122033"

;PRINT, electron_dens_arr_122033 ;60 zeros--5

PRINT, "ZEROS"

zeros_122033 = WHERE((electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_122033) ;60--5

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_122033]

PRINT, "122033"

nin_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_122033) ;63--5

ten_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_122033) ;29--0

elev_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_122033) ;168--214

twel_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_122033) ;138--180

thirt_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_122033) ;1--0

four_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_122033) ;0

PRINT, "STATS"

stat_nin_122033 = FLOAT((N_ELEMENTS(nin_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_nin_122033 ;15.7895--1.25313

stat_ten_122033 = FLOAT((N_ELEMENTS(ten_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_ten_122033 ;7.26817--0

stat_elev_122033 = FLOAT((N_ELEMENTS(elev_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_elev_122033 ;42.1053--53.6341

stat_twel_122033 = FLOAT((N_ELEMENTS(twel_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_twel_122033 ;34.5865--45.1128

stat_thirt_122033 = FLOAT((N_ELEMENTS(thirt_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_thirt_122033 ;0.250627--0

stat_four_122033 = FLOAT((N_ELEMENTS(four_122033))/FLOAT(N_ELEMENTS(num7_three)))*100
PRINT, stat_four_122033 ;0

e_dens_122033 = e_density[electron_dens_arr_122033]

;===============================================================================

electron_dens_arr_160806 = DBLARR(TII_160806_s)

FOR i = 0, TII_160806_s-1 DO BEGIN
   difference_arr_160806 = ABS(si_o_ratio-ratio_160806[i])
   electron_dens_160806 = WHERE(difference_arr_160806 EQ MIN(difference_arr_160806), /NULL)
   electron_dens_arr_160806[i] = electron_dens_160806[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_160806"

;PRINT, electron_dens_arr_160806 ;4 zeros

PRINT, "ZEROS"

zeros_160806 = WHERE((electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_160806) ;4

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_160806]

PRINT, "160806"

nin_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_160806) ;4

ten_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_160806) ;3--0

elev_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_160806) ;76--67

twel_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_160806) ;71--83

thirt_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_160806) ;3

four_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_160806) ;0

PRINT, "STATS"

stat_nin_160806 = FLOAT((N_ELEMENTS(nin_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_nin_160806 ;2.54777

stat_ten_160806 = FLOAT((N_ELEMENTS(ten_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_ten_160806 ;1.91083--0

stat_elev_160806 = FLOAT((N_ELEMENTS(elev_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_elev_160806 ;48.4076--42.6752

stat_twel_160806 = FLOAT((N_ELEMENTS(twel_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_twel_160806 ;45.2229--52.8662

stat_thirt_160806 = FLOAT((N_ELEMENTS(thirt_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_thirt_160806 ;1.91083--1.91083

stat_four_160806 = FLOAT((N_ELEMENTS(four_160806))/FLOAT(N_ELEMENTS(num8_three)))*100
PRINT, stat_four_160806 ;0

e_dens_160806 = e_density[electron_dens_arr_160806]

;===============================================================================

electron_dens_arr_163205 = DBLARR(TII_163205_s)

FOR i = 0, TII_163205_s-1 DO BEGIN
   difference_arr_163205 = ABS(si_o_ratio-ratio_163205[i])
   electron_dens_163205 = WHERE(difference_arr_163205 EQ MIN(difference_arr_163205), /NULL)
   electron_dens_arr_163205[i] = electron_dens_163205[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_163205"

;PRINT, electron_dens_arr_163205 ;9 zeros--5

PRINT, "ZEROS"

zeros_163205 = WHERE((electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_163205) ;9--5

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_163205]

PRINT, "163205"

nin_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_163205) ;10--5

ten_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_163205) ;6--0

elev_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_163205) ;37--33

twel_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_163205) ;16--32

thirt_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_163205) ;2--1

four_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_163205) ;0

PRINT, "STATS"

stat_nin_163205 = FLOAT((N_ELEMENTS(nin_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_nin_163205 ;14.0845--7.04225

stat_ten_163205 = FLOAT((N_ELEMENTS(ten_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_ten_163205 ;8.45070--0

stat_elev_163205 = FLOAT((N_ELEMENTS(elev_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_elev_163205 ;52.1127--46.4789

stat_twel_163205 = FLOAT((N_ELEMENTS(twel_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_twel_163205 ;22.5352--45.0704

stat_thirt_163205 = FLOAT((N_ELEMENTS(thirt_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_thirt_163205 ;2.81690--1.40845

stat_four_163205 = FLOAT((N_ELEMENTS(four_163205))/FLOAT(N_ELEMENTS(num9_three)))*100
PRINT, stat_four_163205 ;0

e_dens_163205 = e_density[electron_dens_arr_163205]

;===============================================================================

electron_dens_arr_174905 = DBLARR(TII_174905_s)

FOR i = 0, TII_174905_s-1 DO BEGIN
   difference_arr_174905 = ABS(si_o_ratio-ratio_174905[i])
   electron_dens_174905 = WHERE(difference_arr_174905 EQ MIN(difference_arr_174905), /NULL)
   electron_dens_arr_174905[i] = electron_dens_174905[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_174905"

;PRINT, electron_dens_arr_174905 ;12 zeros--0

PRINT, "ZEROS"

zeros_174905 = WHERE((electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_174905) ;12--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_174905]

PRINT, "174905"

nin_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_174905) ;13--0

ten_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_174905) ;13--0

elev_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_174905) ;139--124

twel_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_174905) ;78--118

thirt_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_174905) ;1--2

four_174905 = WHERE((e_density[electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_174905) ;0

PRINT, "STATS"

stat_nin_174905 = FLOAT((N_ELEMENTS(nin_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_nin_174905 ;5.32787--0

stat_ten_174905 = FLOAT((N_ELEMENTS(ten_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_ten_174905 ;5.32787--0

stat_elev_174905 = FLOAT((N_ELEMENTS(elev_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_elev_174905 ;56.9672--50.8197

stat_twel_174905 = FLOAT((N_ELEMENTS(twel_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_twel_174905 ;31.9672--48.3607

stat_thirt_174905 = FLOAT((N_ELEMENTS(thirt_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_thirt_174905 ;0.409836--0.819672

stat_four_174905 = FLOAT((N_ELEMENTS(four_174905))/FLOAT(N_ELEMENTS(num10_three)))*100
PRINT, stat_four_174905 ;0

e_dens_174905 = e_density[electron_dens_arr_174905]

;===============================================================================

electron_dens_arr_181205 = DBLARR(TII_181205_s)

FOR i = 0, TII_181205_s-1 DO BEGIN
   difference_arr_181205 = ABS(si_o_ratio-ratio_181205[i])
   electron_dens_181205 = WHERE(difference_arr_181205 EQ MIN(difference_arr_181205), /NULL)
   electron_dens_arr_181205[i] = electron_dens_181205[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_181205"

;PRINT, electron_dens_arr_181205 ;2 zeros--0

PRINT, "ZEROS"

zeros_181205 = WHERE((electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_181205) ;2--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_181205]

PRINT, "181205"

nin_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_181205) ;3--0

ten_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_181205) ;2--0

elev_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_181205) ;28--14

twel_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_181205) ;38--57

thirt_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_181205) ;0

four_181205 = WHERE((e_density[electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_181205) ;0

PRINT, "STATS"

stat_nin_181205 = FLOAT((N_ELEMENTS(nin_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_nin_181205 ;4.22535--0

stat_ten_181205 = FLOAT((N_ELEMENTS(ten_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_ten_181205 ;2.81690--0

stat_elev_181205 = FLOAT((N_ELEMENTS(elev_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_elev_181205 ;39.4366--19.7183

stat_twel_181205 = FLOAT((N_ELEMENTS(twel_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_twel_181205 ;53.5211--80.2817

stat_thirt_181205 = FLOAT((N_ELEMENTS(thirt_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_thirt_181205 ;0

stat_four_181205 = FLOAT((N_ELEMENTS(four_181205))/FLOAT(N_ELEMENTS(num11_three)))*100
PRINT, stat_four_181205 ;0

e_dens_181205 = e_density[electron_dens_arr_181205]

;===============================================================================

electron_dens_arr_201925 = DBLARR(TII_201925_s)

FOR i = 0, TII_201925_s-1 DO BEGIN
   difference_arr_201925 = ABS(si_o_ratio-ratio_201925[i])
   electron_dens_201925 = WHERE(difference_arr_201925 EQ MIN(difference_arr_201925), /NULL)
   electron_dens_arr_201925[i] = electron_dens_201925[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_201925"

;PRINT, electron_dens_arr_201925 ;7 zeros--3

PRINT, "ZEROS"

zeros_201925 = WHERE((electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_201925) ;7--3

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_201925]

PRINT, "201925"

nin_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925) ;7--3

ten_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925) ;5--2

elev_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925) ;21--8

twel_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925) ;20--40

thirt_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925) ;6

four_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925) ;0

PRINT, "STATS"

stat_nin_201925 = FLOAT((N_ELEMENTS(nin_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_nin_201925 ;11.8644--5.08475

stat_ten_201925 = FLOAT((N_ELEMENTS(ten_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_ten_201925 ;8.47458--3.38983

stat_elev_201925 = FLOAT((N_ELEMENTS(elev_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_elev_201925 ;35.5932--13.5593

stat_twel_201925 = FLOAT((N_ELEMENTS(twel_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_twel_201925 ;33.8983--67.7966

stat_thirt_201925 = FLOAT((N_ELEMENTS(thirt_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_thirt_201925 ;10.1695

stat_four_201925 = FLOAT((N_ELEMENTS(four_201925))/FLOAT(N_ELEMENTS(num12_three)))*100
PRINT, stat_four_201925 ;0

e_dens_201925 = e_density[electron_dens_arr_201925]

;===============================================================================

electron_dens_arr_201925_1 = DBLARR(TII_201925_1_s)

FOR i = 0, TII_201925_1_s-1 DO BEGIN
   difference_arr_201925_1 = ABS(si_o_ratio-ratio_201925_1[i])
   electron_dens_201925_1 = WHERE(difference_arr_201925_1 EQ MIN(difference_arr_201925_1), /NULL)
   electron_dens_arr_201925_1[i] = electron_dens_201925_1[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_201925_1"

;PRINT, electron_dens_arr_201925_1 ;2 zeros--0

PRINT, "ZEROS"

zeros_201925_1 = WHERE((electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_201925_1) ;2--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_201925_1]

PRINT, "201925_1"

nin_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925_1) ;2--0

ten_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925_1) ;5--0

elev_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925_1) ;22--10

twel_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925_1) ;25--45

thirt_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925_1) ;4--3

four_201925_1 = WHERE((e_density[electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925_1) ;0

PRINT, "STATS"

stat_nin_201925_1 = FLOAT((N_ELEMENTS(nin_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_nin_201925_1 ;3.44828--0

stat_ten_201925_1 = FLOAT((N_ELEMENTS(ten_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_ten_201925_1 ;8.62069--0

stat_elev_201925_1 = FLOAT((N_ELEMENTS(elev_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_elev_201925_1 ;37.9310--17.2414

stat_twel_201925_1 = FLOAT((N_ELEMENTS(twel_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_twel_201925_1 ;43.1034--77.5862

stat_thirt_201925_1 = FLOAT((N_ELEMENTS(thirt_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_thirt_201925_1 ;6.89655--5.17241

stat_four_201925_1 = FLOAT((N_ELEMENTS(four_201925_1))/FLOAT(N_ELEMENTS(num13_three)))*100
PRINT, stat_four_201925_1 ;0

e_dens_201925_1 = e_density[electron_dens_arr_201925_1]

;===============================================================================

electron_dens_arr_203906 = DBLARR(TII_203906_s)

FOR i = 0, TII_203906_s-1 DO BEGIN
   difference_arr_203906 = ABS(si_o_ratio-ratio_203906[i])
   electron_dens_203906 = WHERE(difference_arr_203906 EQ MIN(difference_arr_203906), /NULL)
   electron_dens_arr_203906[i] = electron_dens_203906[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_203906"

;PRINT, electron_dens_arr_203906 ;40--0

PRINT, "ZEROS"

zeros_203906 = WHERE((electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_203906) ;40--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_203906]

PRINT, "203906"

nin_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_203906) ;41--0

ten_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_203906) ;41--0

elev_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_203906) ;157--187

twel_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_203906) ;96--153

thirt_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_203906) ;5--0

four_203906 = WHERE((e_density[electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_203906) ;0

PRINT, "STATS"

stat_nin_203906 = FLOAT((N_ELEMENTS(nin_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_nin_203906 ;12.0588--0

stat_ten_203906 = FLOAT((N_ELEMENTS(ten_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_ten_203906 ;12.0588--0

stat_elev_203906 = FLOAT((N_ELEMENTS(elev_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_elev_203906 ;46.1765--55.0000

stat_twel_203906 = FLOAT((N_ELEMENTS(twel_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_twel_203906 ;28.2353--45.0000

stat_thirt_203906 = FLOAT((N_ELEMENTS(thirt_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_thirt_203906 ;1.47059--0

stat_four_203906 = FLOAT((N_ELEMENTS(four_203906))/FLOAT(N_ELEMENTS(num14_three)))*100
PRINT, stat_four_203906 ;0

e_dens_203906 = e_density[electron_dens_arr_203906]

;===============================================================================

electron_dens_arr_215426 = DBLARR(TII_215426_s)

FOR i = 0, TII_215426_s-1 DO BEGIN
   difference_arr_215426 = ABS(si_o_ratio-ratio_215426[i])
   electron_dens_215426 = WHERE(difference_arr_215426 EQ MIN(difference_arr_215426), /NULL)
   electron_dens_arr_215426[i] = electron_dens_215426[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_215426"

;PRINT, electron_dens_arr_215426 ;3 zeros--0

PRINT, "ZEROS"

zeros_215426 = WHERE((electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_215426) ;3--0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_215426]

PRINT, "215426"

nin_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_215426) ;3--0

ten_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_215426) ;0

elev_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_215426) ;18--20

twel_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_215426) ;5--6

thirt_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_215426) ;0

four_215426 = WHERE((e_density[electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_215426) ;0

PRINT, "STATS"

stat_nin_215426 = FLOAT((N_ELEMENTS(nin_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_nin_215426 ;11.5385--0

stat_ten_215426 = FLOAT((N_ELEMENTS(ten_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_ten_215426 ;0

stat_elev_215426 = FLOAT((N_ELEMENTS(elev_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_elev_215426 ;69.2308--76.9231

stat_twel_215426 = FLOAT((N_ELEMENTS(twel_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_twel_215426 ;19.2308--23.0769

stat_thirt_215426 = FLOAT((N_ELEMENTS(thirt_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_thirt_215426 ;0

stat_four_215426 = FLOAT((N_ELEMENTS(four_215426))/FLOAT(N_ELEMENTS(num15_three)))*100
PRINT, stat_four_215426 ;0

e_dens_215426 = e_density[electron_dens_arr_215426]

;===============================================================================

electron_dens_arr_232931 = DBLARR(TII_232931_s)

FOR i = 0, TII_232931_s-1 DO BEGIN
   difference_arr_232931 = ABS(si_o_ratio-ratio_232931[i])
   electron_dens_232931 = WHERE(difference_arr_232931 EQ MIN(difference_arr_232931), /NULL)
   electron_dens_arr_232931[i] = electron_dens_232931[0]
ENDFOR

;PRINT, "ELECTRON_DENS_ARR_232931"

;PRINT, electron_dens_arr_232931 ;0 zeros

PRINT, "ZEROS"

zeros_232931 = WHERE((electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(zeros_232931) ;0

;PRINT, "E_DENSITY[ABOVE]"

;PRINT, e_density[electron_dens_arr_232931]

PRINT, "232931"

nin_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_232931) ;0

ten_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_232931) ;0

elev_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_232931) ;23

twel_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_232931) ;5

thirt_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_232931) ;0

four_232931 = WHERE((e_density[electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_232931) ;0

PRINT, "STATS"

stat_nin_232931 = FLOAT((N_ELEMENTS(nin_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_nin_232931 ;0

stat_ten_232931 = FLOAT((N_ELEMENTS(ten_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_ten_232931 ;0

stat_elev_232931 = FLOAT((N_ELEMENTS(elev_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_elev_232931 ;82.1429

stat_twel_232931 = FLOAT((N_ELEMENTS(twel_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_twel_232931 ;17.8571

stat_thirt_232931 = FLOAT((N_ELEMENTS(thirt_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_thirt_232931 ;0

stat_four_232931 = FLOAT((N_ELEMENTS(four_232931))/FLOAT(N_ELEMENTS(num16_three)))*100
PRINT, stat_four_232931 ;0

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

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5

DEVICE, /CLOSE

;save as ps--Wheaton College Presentation

;!P.FONT = 1

;TVLCT, [[255],[255],[255]], 1
;SET_PLOT, 'ps'
;DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/elec_dens_histogram_pres.eps', /ENCAPSULATED

;PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

;DEVICE, /CLOSE

;destroy all evidence

OBJ_DESTROY, dataRast_004121
OBJ_DESTROY, data1400_004121

END
