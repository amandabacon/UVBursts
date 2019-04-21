;+
;Name: master_table.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/03/02
;

;PRO master_table

;restore UVB_ind_obs#

rfname_004121 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/iso_vars_safe_004121.sav'
RESTORE, rfname_004121

;rfname_050655 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/iso_vars_050655.sav'
;RESTORE, rfname_050655

;rfname_050655_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/iso_vars_050655_1.sav'
;RESTORE, rfname_050655_1

;rfname_052046 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_052046.sav'
;RESTORE, rfname_052046

;rfname_061606 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/iso_vars_061606.sav'
;RESTORE, rfname_061606

;rfname_114951 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
;RESTORE, rfname_114951

;rfname_122033 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/iso_vars_122033.sav'
;RESTORE, rfname_122033

;rfname_160806 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/iso_vars_160806.sav'
;RESTORE, rfname_160806

;rfname_163205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_163205.sav'
;RESTORE, rfname_163205

;rfname_174905 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/iso_vars_174905.sav'
;RESTORE, rfname_174905

;rfname_181205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/iso_vars_181205.sav'
;RESTORE, rfname_181205

;rfname_201925 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_201925.sav'
;RESTORE, rfname_201925

;rfname_201925_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/iso_vars_201925_1.sav'
;RESTORE, rfname_201925_1

;rfname_203906 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
;RESTORE, rfname_203906

;rfname_215426 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/iso_vars_215426.sav'
;RESTORE, rfname_215426

;rfname_232931 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_232931.sav'
;RESTORE, rfname_232931

;===============================================================================
;SNR O IV vals

;restore O IV 004121 TIIs, SNRs, etc.

rfname_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_SNR_limit

;rfname2_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/sigma_coeff_arr_050655_Oiv.sav'
;RESTORE, rfname2_SNR_limit

;rfname3_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/sigma_coeff_arr_050655_1_Oiv.sav'
;RESTORE, rfname3_SNR_limit

;rfname4_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/sigma_coeff_arr_052046_Oiv.sav'
;RESTORE, rfname4_SNR_limit

;rfname5_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/sigma_coeff_arr_061606_Oiv.sav'
;RESTORE, rfname5_SNR_limit

;rfname6_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/sigma_coeff_arr_114951_Oiv.sav'
;RESTORE, rfname6_SNR_limit

;rfname7_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/sigma_coeff_arr_122033_Oiv.sav'
;RESTORE, rfname7_SNR_limit

;rfname8_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/sigma_coeff_arr_160806_Oiv.sav'
;RESTORE, rfname8_SNR_limit

;rfname9_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
;RESTORE, rfname9_SNR_limit

;rfname10_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/sigma_coeff_arr_174905_Oiv.sav'
;RESTORE, rfname10_SNR_limit

;rfname11_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/sigma_coeff_arr_181205_Oiv.sav'
;RESTORE, rfname11_SNR_limit

;rfname12_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/sigma_coeff_arr_201925_Oiv.sav'
;RESTORE, rfname12_SNR_limit

;rfname13_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/sigma_coeff_arr_201925_1_Oiv.sav'
;RESTORE, rfname13_SNR_limit

;rfname14_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
;RESTORE, rfname14_SNR_limit

;rfname15_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/sigma_coeff_arr_215426_Oiv.sav'
;RESTORE, rfname15_SNR_limit

;rfname16_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/sigma_coeff_arr_232931_Oiv.sav'
;RESTORE, rfname16_SNR_limit

;===============================================================================
;TII: It, int_int_unc w/ O IV and Si IV

;restore Si IV 004121 TIIs, TII Unc, etc.

rfname_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/IT_UV_004121.sav'
RESTORE, rfname_limit

;rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/IT_UV_050655.sav'
;RESTORE, rfname2_limit

;rfname3_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/IT_UV_050655_1.sav'
;RESTORE, rfname3_limit

;rfname4_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
;RESTORE, rfname4_limit

;rfname5_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/IT_UV_061606.sav'
;RESTORE, rfname5_limit

;rfname6_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
;RESTORE, rfname6_limit

;rfname7_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/IT_UV_122033.sav'
;RESTORE, rfname7_limit

;rfname8_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/IT_UV_160806.sav'
;RESTORE, rfname8_limit

;rfname9_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/IT_UV_163205.sav'
;RESTORE, rfname9_limit

;rfname10_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/IT_UV_174905.sav'
;RESTORE, rfname10_limit

;rfname11_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/IT_UV_181205.sav'
;RESTORE, rfname11_limit

;rfname12_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
;RESTORE, rfname12_limit

;rfname13_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/IT_UV_201925_1.sav'
;RESTORE, rfname13_limit

;rfname14_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
;RESTORE, rfname14_limit

;rfname15_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/IT_UV_215426.sav'
;RESTORE, rfname15_limit

;rfname16_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
;RESTORE, rfname16_limit

;===============================================================================
;restore Si IV velocities

rfname_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/limit_IT_UV_004121.sav'
RESTORE, rfname_ve

;rfname2_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/limit_IT_UV_050655.sav'
;RESTORE, rfname2_ve

;rfname3_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/limit_IT_UV_050655_1.sav'
;RESTORE, rfname3_ve

;rfname4_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/limit_IT_UV_052046.sav'
;RESTORE, rfname4_ve

;rfname5_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/limit_IT_UV_061606.sav'
;RESTORE, rfname5_ve

;rfname6_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/limit_IT_UV_114951.sav'
;RESTORE, rfname6_ve

;rfname7_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/limit_IT_UV_122033.sav'
;RESTORE, rfname7_ve

;rfname8_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/limit_IT_UV_160806.sav'
;RESTORE, rfname8_ve

;rfname9_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/limit_IT_UV_163205.sav'
;RESTORE, rfname9_ve

;rfname10_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/limit_IT_UV_174905.sav'
;RESTORE, rfname10_ve

;rfname11_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/limit_IT_UV_181205.sav'
;RESTORE, rfname11_ve

;rfname12_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/limit_IT_UV_201925.sav'
;RESTORE, rfname12_ve

;rfname13_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/limit_IT_UV_201925_1.sav'
;RESTORE, rfname13_ve

;rfname14_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/limit_IT_UV_203906.sav'
;RESTORE, rfname14_ve

;rfname15_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/limit_IT_UV_215426.sav'
;RESTORE, rfname15_ve

;rfname16_ve = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/limit_IT_UV_232931.sav'
;RESTORE, rfname16_ve

;===============================================================================
;restore S IV SNRs, TIIs, etc.

rfname_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/S_IV/sigma_coeff_arr_004121_Siv.sav'
RESTORE, rfname_Siv;, /VERBOSE--lw introduced here

;rfname2_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/S_IV/sigma_coeff_arr_050655_Siv.sav'
;RESTORE, rfname2_Siv

;rfname3_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/S_IV/sigma_coeff_arr_050655_1_Siv.sav'
;RESTORE, rfname3_Siv

;rfname4_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/S_IV/sigma_coeff_arr_052046_Siv.sav'
;RESTORE, rfname4_Siv

;rfname5_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/S_IV/sigma_coeff_arr_061606_Siv.sav'
;RESTORE, rfname5_Siv

;rfname6_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/sigma_coeff_arr_114951_Siv.sav'
;RESTORE, rfname6_Siv

;rfname7_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/sigma_coeff_arr_122033_Siv.sav'
;RESTORE, rfname7_Siv

;rfname8_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/S_IV/sigma_coeff_arr_160806_Siv.sav'
;RESTORE, rfname8_Siv

;rfname9_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/sigma_coeff_arr_163205_Siv.sav'
;RESTORE, rfname9_Siv

;rfname10_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/S_IV/sigma_coeff_arr_174905_Siv.sav'
;RESTORE, rfname10_Siv

;rfname11_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/S_IV/sigma_coeff_arr_181205_Siv.sav'
;RESTORE, rfname11_Siv

;rfname12_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/S_IV/sigma_coeff_arr_201925_Siv.sav'
;RESTORE, rfname12_Siv

;rfname13_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/S_IV/sigma_coeff_arr_201925_1_Siv.sav'
;RESTORE, rfname13_Siv

;rfname14_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/S_IV/sigma_coeff_arr_203906_Siv.sav'
;RESTORE, rfname14_Siv

;rfname15_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/sigma_coeff_arr_215426_Siv.sav'
;RESTORE, rfname15_Siv

;rfname16_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/S_IV/sigma_coeff_arr_232931_Siv.sav'
;RESTORE, rfname16_Siv

;===============================================================================
;restore velocities

rfname_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/limit_sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_vel

;rfname2_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/limit_sigma_coeff_arr_050655_Oiv.sav'
;RESTORE, rfname2_vel

;rfname3_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/limit_sigma_coeff_arr_050655_1_Oiv.sav'
;RESTORE, rfname3_vel

;rfname4_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/limit_sigma_coeff_arr_052046_Oiv.sav'
;RESTORE, rfname4_vel

;rfname5_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/limit_sigma_coeff_arr_061606_Oiv.sav'
;RESTORE, rfname5_vel

;rfname6_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/limit_sigma_coeff_arr_114951_Oiv.sav'
;RESTORE, rfname6_vel

;rfname7_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/limit_sigma_coeff_arr_122033_Oiv.sav'
;RESTORE, rfname7_vel

;rfname8_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/limit_sigma_coeff_arr_160806_Oiv.sav'
;RESTORE, rfname8_vel

;rfname9_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/limit_sigma_coeff_arr_163205_Oiv.sav'
;RESTORE, rfname9_vel

;rfname10_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/limit_sigma_coeff_arr_174905_Oiv.sav'
;RESTORE, rfname10_vel

;rfname11_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/limit_sigma_coeff_arr_181205_Oiv.sav'
;RESTORE, rfname11_vel

;rfname12_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/limit_sigma_coeff_arr_201925_Oiv.sav'
;RESTORE, rfname12_vel

;rfname13_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/limit_sigma_coeff_arr_201925_1_Oiv.sav'
;RESTORE, rfname13_vel

;rfname14_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/limit_sigma_coeff_arr_203906_Oiv.sav'
;RESTORE, rfname14_vel

;rfname15_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/limit_sigma_coeff_arr_215426_Oiv.sav'
;RESTORE, rfname15_vel

;rfname16_vel = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/limit_sigma_coeff_arr_232931_Oiv.sav'
;RESTORE, rfname16_vel

;===============================================================================
;load diagnostic model

rfname_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/si4_o4_dens_diagnostic.sav'
RESTORE, rfname_dens

;===============================================================================
;concatenate arrays

array_004121_O = [[It_O_004121],[int_int_unc_O_004121],[limit_vel_width_004121_Oiv],[limit_velocity_004121_Oiv],[SNR_O_004121],[testt]]
PRINT, SIZE(array_004121_O) ;2D,464

array_004121_Si = [[It_Si_004121],[int_int_unc_Si_004121],[limit_vel_width_004121],[limit_velocity_004121],[UVB_ind_004121]];,[p_int],[sig_lw],[lw],[sig_p_int]]
PRINT, SIZE(array_004121_Si) ;2D,471

array_004121_S = [[It_S_004121],[int_int_unc_S_004121],[limit_vel_width_004121_Siv],[limit_velocity_004121_Siv],[SNR_S_004121]]
PRINT, SIZE(array_004121_S) ;2D,421

;-------------------------------------------------------------------------------

;array_050655_O = [[It_O_050655],[int_int_unc_O_050655],[limit_vel_width_050655_Oiv],[limit_velocity_050655_Oiv],[SNR_O_050655]]
;PRINT, SIZE(array_050655_O) ;2D,280

;array_050655_Si = [[It_Si_050655],[int_int_unc_Si_050655],[limit_vel_width_050655],[limit_velocity_050655],[UVB_ind_050655]]
;PRINT, SIZE(array_050655_Si) ;2D,304

;array_050655_S = [[It_S_050655],[int_int_unc_S_050655],[limit_vel_width_050655_Siv],[limit_velocity_050655_Siv],[SNR_S_050655]]
;PRINT, SIZE(array_050655_S) ;2D,246

;-------------------------------------------------------------------------------

;array_050655_1_O = [[It_O_050655_1],[int_int_unc_O_050655_1],[limit_vel_width_050655_1_Oiv],[limit_velocity_050655_1_Oiv],[SNR_O_050655_1]]
;PRINT, SIZE(array_050655_1_O) ;2D,387

;array_050655_1_Si = [[It_Si_050655_1],[int_int_unc_Si_050655_1],[limit_vel_width_050655_1],[limit_velocity_050655_1],[UVB_ind_050655_1]]
;PRINT, SIZE(array_050655_1_Si) ;2D,402

;array_050655_1_S = [[It_S_050655_1],[int_int_unc_S_050655_1],[limit_vel_width_050655_1_Siv],[limit_velocity_050655_1_Siv],[SNR_S_050655_1]]
;PRINT, SIZE(array_050655_1_S) ;2D,309

;-------------------------------------------------------------------------------

;array_052046_O = [[It_O_052046],[int_int_unc_O_052046],[limit_vel_width_052046_Siv],[limit_velocity_052046_Siv],[SNR_O_052046]]
;PRINT, SIZE(array_052046_O) ;2D,

;array_052046_Si = [[It_Si_052046],[int_int_unc_Si_052046],[limit_vel_width_052046],[limit_velocity_052046],[UVB_ind_052046]]
;PRINT, SIZE(array_052046_Si) ;2D,

;array_052046_S = [[It_S_052046],[int_int_unc_S_052046],[limit_vel_width_052046_Siv],[limit_velocity_052046_Siv],[SNR_S_052046]]
;PRINT, SIZE(array_052046_S) ;2D,

;-------------------------------------------------------------------------------

;array_061606_O = [[It_O_061606],[int_int_unc_O_061606],[limit_vel_width_061606_Oiv],[limit_velocity_061606_Oiv],[SNR_O_061606]]
;PRINT, SIZE(array_061606_O) ;2D,415

;array_061606_Si = [[It_Si_061606],[int_int_unc_Si_061606],[limit_vel_width_061606],[limit_velocity_061606],[UVB_ind_061606]]
;PRINT, SIZE(array_061606_Si) ;2D,431

;array_061606_S = [[It_S_061606],[int_int_unc_S_061606],[limit_vel_width_061606_Siv],[limit_velocity_061606_Siv],[SNR_S_061606]]
;PRINT, SIZE(array_061606_S) ;2D,352

;-------------------------------------------------------------------------------

;array_114951_O = [[It_O_114951],[int_int_unc_O_114951],[limit_vel_width_114951_Oiv],[limit_velocity_114951_Oiv],[SNR_O_114951]]
;PRINT, SIZE(array_114951_O) ;2D,893

;array_114951_Si = [[It_Si_114951],[int_int_unc_Si_114951],[limit_vel_width_114951],[limit_velocity_114951],[UVB_ind_114951]]
;PRINT, SIZE(array_114951_Si) ;2D,1070

;array_114951_S = [[It_S_114951],[int_int_unc_S_114951],[limit_vel_width_114951_Siv],[limit_velocity_114951_Siv],[SNR_S_114951]]
;PRINT, SIZE(array_114951_S) ;2D,759

;-------------------------------------------------------------------------------

;array_122033_O = [[It_O_122033],[int_int_unc_O_122033],[limit_vel_width_122033_Oiv],[limit_velocity_122033_Oiv],[SNR_O_122033]]
;PRINT, SIZE(array_122033_O) ;2D,915

;array_122033_Si = [[It_Si_122033],[int_int_unc_Si_122033],[limit_vel_width_122033],[limit_velocity_122033],[UVB_ind_122033]]
;PRINT, SIZE(array_122033_Si) ;2D,963

;array_122033_S = [[It_S_122033],[int_int_unc_S_122033],[limit_vel_width_122033_Siv],[limit_velocity_122033_Siv],[SNR_S_122033]]
;PRINT, SIZE(array_122033_S) ;2D,849

;-------------------------------------------------------------------------------

;array_160806_O = [[It_O_160806],[int_int_unc_O_160806],[limit_vel_width_160806_Oiv],[limit_velocity_160806_Oiv],[SNR_O_160806]]
;PRINT, SIZE(array_160806_O) ;2D,574

;array_160806_Si = [[It_Si_160806],[int_int_unc_Si_160806],[limit_vel_width_160806],[limit_velocity_160806],[UVB_ind_160806]]
;PRINT, SIZE(array_160806_Si) ;2D,613

;array_160806_S = [[It_S_160806],[int_int_unc_S_160806],[limit_vel_width_160806_Siv],[limit_velocity_160806_Siv],[SNR_S_160806]]
;PRINT, SIZE(array_160806_S) ;2D,512

;-------------------------------------------------------------------------------

;array_163205_O = [[It_O_163205],[int_int_unc_O_163205],[limit_vel_width_163205_Oiv],[limit_velocity_163205_Oiv],[SNR_O_163205]]
;PRINT, SIZE(array_163205_O) ;2D,486

;array_163205_Si = [[It_Si_163205],[int_int_unc_Si_163205],[limit_vel_width_163205],[limit_velocity_163205],[UVB_ind_163205]]
;PRINT, SIZE(array_163205_Si) ;2D,522

;array_163205_S = [[It_S_163205],[int_int_unc_S_163205],[limit_vel_width_163205_Siv],[limit_velocity_163205_Siv],[SNR_S_163205]]
;PRINT, SIZE(array_163205_S) ;2D,411

;-------------------------------------------------------------------------------

;array_174905_O = [[It_O_174905],[int_int_unc_O_174905],[limit_vel_width_174905_Oiv],[limit_velocity_174905_Oiv],[SNR_O_174905]]
;PRINT, SIZE(array_174905_O) ;2D,713

;array_174905_Si = [[It_Si_174905],[int_int_unc_Si_174905],[limit_vel_width_174905],[limit_velocity_174905],[UVB_ind_174905]]
;PRINT, SIZE(array_174905_Si) ;2D,760

;array_174905_S = [[It_S_174905],[int_int_unc_S_174905],[limit_vel_width_174905_Siv],[limit_velocity_174905_Siv],[SNR_S_174905]]
;PRINT, SIZE(array_174905_S) ;2D,582

;-------------------------------------------------------------------------------

;array_181205_O = [[It_O_181205],[int_int_unc_O_181205],[limit_vel_width_181205_Oiv],[limit_velocity_181205_Oiv],[SNR_O_181205]]
;PRINT, SIZE(array_181205_O) ;2D,352

;array_181205_Si = [[It_Si_181205],[int_int_unc_Si_181205],[limit_vel_width_181205],[limit_velocity_181205],[UVB_ind_181205]]
;PRINT, SIZE(array_181205_Si) ;2D,388

;array_181205_S = [[It_S_181205],[int_int_unc_S_181205],[limit_vel_width_181205_Siv],[limit_velocity_181205_Siv],[SNR_S_181205]]
;PRINT, SIZE(array_181205_S) ;2D,268

;-------------------------------------------------------------------------------

;array_201925_O = [[It_O_201925],[int_int_unc_O_201925],[limit_vel_width_201925_Oiv],[limit_velocity_201925_Oiv],[SNR_O_201925]]
;PRINT, SIZE(array_201925_O) ;2D,578

;array_201925_Si = [[It_Si_201925],[int_int_unc_Si_201925],[limit_vel_width_201925],[limit_velocity_201925],[UVB_ind_201925]]
;PRINT, SIZE(array_201925_Si) ;2D,660

;array_201925_S = [[It_S_201925],[int_int_unc_S_201925],[limit_vel_width_201925_Siv],[limit_velocity_201925_Siv],[SNR_S_201925]]
;PRINT, SIZE(array_201925_S) ;2D,478

;-------------------------------------------------------------------------------

;array_201925_1_O = [[It_O_201925_1],[int_int_unc_O_201925_1],[limit_vel_width_201925_1_Oiv],[limit_velocity_201925_1_Oiv],[SNR_O_201925_1]]
;PRINT, SIZE(array_201925_1_O) ;2D,304

;array_201925_1_Si = [[It_Si_201925_1],[int_int_unc_Si_201925_1],[limit_vel_width_201925_1],[limit_velocity_201925_1],[UVB_ind_201925_1]]
;PRINT, SIZE(array_201925_1_Si) ;2D,315

;array_201925_1_S = [[It_S_201925_1],[int_int_unc_S_201925_1],[limit_vel_width_201925_1_Siv],[limit_velocity_201925_1_Siv],[SNR_S_201925_1]]
;PRINT, SIZE(array_201925_1_S) ;2D,243

;-------------------------------------------------------------------------------

;array_203906_O = [[It_O_203906],[int_int_unc_O_203906],[limit_vel_width_203906_Oiv],[limit_velocity_203906_Oiv],[SNR_O_203906]]
;PRINT, SIZE(array_203906_O) ;2D,1157

;array_203906_Si = [[It_Si_203906],[int_int_unc_Si_203906],[limit_vel_width_203906],[limit_velocity_203906],[UVB_ind_203906]]
;PRINT, SIZE(array_203906_Si) ;2D,1235

;array_203906_S = [[It_S_203906],[int_int_unc_S_203906],[limit_vel_width_203906_Siv],[limit_velocity_203906_Siv],[SNR_S_203906]]
;PRINT, SIZE(array_203906_S) ;2D,1059

;-------------------------------------------------------------------------------

;array_215426_O = [[It_O_215426],[int_int_unc_O_215426],[limit_vel_width_215426_Oiv],[limit_velocity_215426_Oiv],[SNR_O_215426]]
;PRINT, SIZE(array_215426_O) ;2D,194

;array_215426_Si = [[It_Si_215426],[int_int_unc_Si_215426],[limit_vel_width_215426],[limit_velocity_215426],[UVB_ind_215426]]
;PRINT, SIZE(array_215426_Si) ;2D,196

;array_215426_S = [[It_S_215426],[int_int_unc_S_215426],[limit_vel_width_215426_Siv],[limit_velocity_215426_Siv],[SNR_S_215426]]
;PRINT, SIZE(array_215426_S) ;2D,158

;-------------------------------------------------------------------------------

;array_232931_O = [[It_O_232931],[int_int_unc_O_232931],[limit_vel_width_232931_Oiv],[limit_velocity_232931_Oiv],[SNR_O_232931]]
;PRINT, SIZE(array_232931_O) ;2D,227

;array_232931_Si = [[It_Si_232931],[int_int_unc_Si_232931],[limit_vel_width_232931],[limit_velocity_232931],[UVB_ind_232931]]
;PRINT, SIZE(array_232931_Si) ;2D,228

;array_232931_S = [[It_S_232931],[int_int_unc_S_232931],[limit_vel_width_232931_Siv],[limit_velocity_232931_Siv],[SNR_S_232931]]
;PRINT, SIZE(array_232931_S) ;2D,189

;PRINT, array_232931_S
;PRINT, '1st item in all arrays'
;PRINT, array_232931_S[0,*]
;PRINT, 'It_S_232931'
;PRINT, array_232931_S[*,0]
;PRINT, 'int_int_unc_S_232931'
;PRINT, array_232931_S[*,1]
;PRINT, 'limit_vel_width_232931_Siv'
;PRINT, array_232931_S[*,2]
;PRINT, 'limit_velocity_232931_Siv'
;PRINT, array_232931_S[*,3]
;PRINT, 'SNR_S_232931'
;PRINT, array_232931_S[*,4]

;===============================================================================
;WHERE function testing  

;test = array_232931_Si[*,0]
;test1 = WHERE((test GE 3.0), count)
;PRINT, count ;213
;PRINT, test[test1]

;test11 = array_232931_Si[*,2]
;test2 = WHERE((test11 GE 40.0) AND (test11 LT 50.0), count)
;PRINT, count ;124
;PRINT, test11[test2]

;test3 = WHERE((test GE 3.0) AND (test11 GE 40.0) AND (test11 LT 50.0), count)
;PRINT, count ;114
;PRINT, test11[test3]
;PRINT, test[test3]

test12 = array_004121_Si[*,2]
uu = array_004121_Si[*,4]
test4 = WHERE((test12 GE 50.0) AND (test12 LT 60.0) AND (uu GE 0.0), count)
;PRINT, count ;163
;PRINT, test12[test4]
;PRINT, uu[test4]

;u = array_232931_Si[*,4]
;test5 = WHERE((test11 GE 40.0) AND (test11 LT 50.0) AND (u GE 0.0), count)
;PRINT, count ;124
;PRINT, test11[test5]
;PRINT, u[test5]

test6 = WHERE((test12 GE 40.0) AND (test12 LT 50.0) AND (uu GE 0.0), count)
;PRINT, count ;66
;PRINT, test12[test6]
;PRINT, uu[test6]

test7 = WHERE((test12 GE 60.0) AND (test12 LT 70.0) AND (uu GE 0.0), count)
;PRINT, count ;127
;PRINT, test12[test7]
;PRINT, uu[test7]

test8 = WHERE((test12 GE 70.0) AND (test12 LT 80.0) AND (uu GE 0.0), count)
;PRINT, count ;76
;PRINT, test12[test8]
;PRINT, uu[test8]

test9 = WHERE((test12 GE 80.0) AND (test12 LT 1000.0) AND (uu GE 0.0), count)
PRINT, count ;
;PRINT, test12[test9]
;PRINT, uu[test9]

;the counts above are the same for isolate_obs#.pro, the only
;difference is the points on the map...

;===============================================================================
;line width vs density 

;Just want everything in relation to o iv. Basically "throwing away"
;data that doesn't match with o iv.
y = array_004121_O[*,5]
x = array_004121_Si[*,4]
openw, 1, 'test.csv'
FOR i = 0, N_ELEMENTS(y)-1 DO BEGIN
   var = WHERE((x EQ y[i]),count)
;   PRINT, x[var], y[i]
;   PRINT, count ;464 checked
;   [oiv[i],si_TII[var]]; for ith line in oiv, get si iv info
   printf, 1, x[var], y[i], It_Si_004121[var], int_int_unc_Si_004121[var], limit_vel_width_004121[var], limit_velocity_004121[var], It_O_004121[i], int_int_unc_O_004121[i], limit_vel_width_004121_Oiv[i], limit_velocity_004121_Oiv[i], SNR_O_004121[i], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9)";HEADER = ['Si_IV_UVB',' , ','O_IV_UVB']; Si_IV_UVB[var], O_IV_UVB[i], It_Si_004121[var], int_int_unc_Si_004121[var], limit_vel_width_004121[var], limit_velocity_004121[var], It_O_004121[i], int_int_unc_O_004121[i], limit_vel_width_004121_Oiv[i], limit_velocity_004121_Oiv[i], SNR_O_004121[i]
ENDFOR
close, 1

;check excel has right elements
;PRINT, It_Si_004121
;PRINT, int_int_unc_Si_004121
;PRINT, limit_vel_width_004121
;PRINT, limit_velocity_004121
;PRINT, It_O_004121
;PRINT, int_int_unc_O_004121
;PRINT, limit_vel_width_004121_Oiv
;PRINT, limit_velocity_004121_Oiv
;PRINT, SNR_O_004121

csv = READ_CSV('test.csv')
;PRINT, csv
col_0 = csv.(0)
col_1 = csv.(1)
col_2 = csv.(2)
col_3 = csv.(3)
col_4 = csv.(4)
col_5 = csv.(5)
col_6 = csv.(6)
col_7 = csv.(7)
col_8 = csv.(8)
col_9 = csv.(9)
col_10 = csv.(10)
ttt = WHERE((col_0 EQ 31049) AND (col_1 EQ 31049) AND (col_2 GE 0.0) AND (col_3 GE 0.0) AND (col_4 GE 0.0) AND (col_5 GE 0.0) AND (col_6 GE 0.0) AND (col_7 GE 0.0) AND (col_8 GE 0.0) AND (col_9 GE 0.0) AND (col_10 GE 0.0))
;PRINT, col_0[ttt]
;PRINT, col_1[ttt]
;PRINT, col_2[ttt]
;PRINT, col_3[ttt]
;PRINT, col_4[ttt]
;PRINT, col_5[ttt]
;PRINT, col_6[ttt]
;PRINT, col_7[ttt]
;PRINT, col_8[ttt]
;PRINT, col_9[ttt]
;PRINT, col_10[ttt]
rrr = WHERE((col_10 GE 3.0) AND (col_10 LT 1000) AND (col_6 GE 0.0) AND (col_2 GE 0.0))
PRINT, 'SNR O'
PRINT, col_10[rrr]
PRINT, 'TII O'
PRINT, col_6[rrr]
PRINT, 'TII Si IV'
PRINT, col_2[rrr]

;double check above matches old way (and checked with master_TII.pro):
;snr_cut = array_004121_O[*,4]
;tii_cut = array_004121_O[*,0]
;oiv_cut_004121 = WHERE((snr_cut GE 3.0) AND (snr_cut LT 1000) AND (tii_cut GE 0.0), count)
;PRINT, snr_cut[oiv_cut_004121]
;PRINT, 'se'
;PRINT, tii_cut[oiv_cut_004121]

ratio_004121 = (col_2[rrr]/col_6[rrr])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_004121)
PRINT, ratio_004121

TII_004121 = N_ELEMENTS(ratio_004121)
PRINT, TII_004121

electron_dens_arr_004121 = DBLARR(TII_004121)

FOR i = 0, TII_004121-1 DO BEGIN
   difference_arr_004121 = ABS(si_o_ratio-ratio_004121[i])
   electron_dens_004121 = WHERE(difference_arr_004121 EQ MIN(difference_arr_004121), /NULL)
   electron_dens_arr_004121[i] = electron_dens_004121[0]
ENDFOR

PRINT, e_density[electron_dens_arr_004121]

PRINT, "004121"

nin_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_004121) ;7 --0

ten_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_004121) ;6 --0

elev_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_004121) ;50 --46

twel_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_004121) ;27 --4

thirt_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_004121) ;0

four_004121 = WHERE((e_density[electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_004121) ;0

result = CORRELATE(lw,e_density[electron_dens_arr_004121])
PRINT, result

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 3, lw, e_density[electron_dens_arr_004121], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]
;m = regress(lw,e_density[electron_dens_arr_004121],const=b,correlation=r,ftest=f,yfit=yregress)
;OPLOT,lw,yregress
;===============================================================================
;velocity maps

;byte-scaling and saturation

sort_c_004121 = coeff_arr_004121[SORT(coeff_arr_004121)]
sort_c_004121 = sort_c_004121[WHERE(FINITE(sort_c_004121) OR (sort_c_004121 NE -200))]
n_sort_c_004121 = N_ELEMENTS(sort_c_004121)

;despike

coeff_arr_004121_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_004121[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both')

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_004121_40_50 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_50_60 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_60_70 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_70_80 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_80_1000 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)

byte_scale_004121_40_50[uu[test6]] = 255 
byte_scale_004121_50_60[uu[test4]] = 255  
byte_scale_004121_60_70[uu[test7]] = 255 
byte_scale_004121_70_80[uu[test8]] = 255
byte_scale_004121_80_1000[uu[test9]] = 255
;byte_scale_004121[array_004121_Si[*,4]] = 255 ;works--all UVBs


;now how many UVB in plage regions? footpoints? inversion lines?
;magnetic inversion line (magnetic neutral line) separates regions of different ;magnetic polarity


WINDOW, XSIZE = 900, YSIZE = 700

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_50_60), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[255], [255], [255]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

;40-50 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/table_intensity_40_50_UVB_004121.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_40_50), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[0], [0], [0]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

DEVICE, /CLOSE

;50-60 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/table_intensity_50_60_UVB_004121.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_50_60), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[0], [0], [0]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

DEVICE, /CLOSE

;60-70 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/table_intensity_60_70_UVB_004121.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_60_70), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[0], [0], [0]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

DEVICE, /CLOSE

;70-80 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/table_intensity_70_80_UVB_004121.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_70_80), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[0], [0], [0]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

DEVICE, /CLOSE

;80-1000 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/table_intensity_80_1000_UVB_004121.eps', /ENCAPSULATED

EIS_COLORS, /INTENSITY

TVLCT, rv, gv, bv, /GET
rv[255] = 255
gv[255] = 0
bv[255] = 0

TVLCT, rv, gv, bv

PLOT_IMAGE, REFORM(byte_scale_004121_80_1000), ORIGIN = [SolarX1400_004121[0], SolarY1400_004121[0]], SCALE = [ResX1400_004121, ResY1400_004121], XTITLE = 'Solar X [arcsec]', YTITLE = 'Solar Y [arcsec]', POSITION = [x0,y0,x0+dx,y0+dy], /NORMAL, /NOSCALE

TVLCT, [[0], [0], [0]], 1

COLORBAR, FORMAT = '(F0.2)', TITLE = "Intensity [Arbitrary Units]", RANGE = [5,75], /YLOG, YTICKS = 10, POSITION = [0.32,0.91,0.70,0.92], /TOP, COLOR = 1

DEVICE, /CLOSE

END
