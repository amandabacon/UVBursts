;+
;Name: master_table.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/03/02
;Create a large table for each observation that has all of the UV
;burst spectra information for Si IV, O IV, and S IV, including: UVB
;indices, TIIs, associated uncertainties, SNRs, velocity widths, Doppler
;shifts, peak intensities, and line widths. From those tables, perform
;electron density diagnostics and a UVB intensity map for observation 004121
;to check the UVB maps made in isolate_obs#.

PRO master_table

;restore UVB_ind_obs#

TIC

rfname_004121 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/iso_vars_safe_004121.sav' ;use safe for SolarX1400_004121 for UVB maps
RESTORE, rfname_004121

rfname_050655 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/iso_vars_050655.sav'
RESTORE, rfname_050655

rfname_050655_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/iso_vars_050655_1.sav'
RESTORE, rfname_050655_1

rfname_052046 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/iso_vars_052046.sav'
RESTORE, rfname_052046

rfname_061606 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/iso_vars_061606.sav'
RESTORE, rfname_061606

rfname_114951 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/iso_vars_114951.sav'
RESTORE, rfname_114951

rfname_122033 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/iso_vars_122033.sav'
RESTORE, rfname_122033

rfname_160806 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/iso_vars_160806.sav'
RESTORE, rfname_160806

rfname_163205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/iso_vars_163205.sav'
RESTORE, rfname_163205

rfname_174905 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/iso_vars_174905.sav'
RESTORE, rfname_174905

rfname_181205 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/iso_vars_181205.sav'
RESTORE, rfname_181205

rfname_201925 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/iso_vars_201925.sav'
RESTORE, rfname_201925

rfname_201925_1 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/iso_vars_201925_1.sav'
RESTORE, rfname_201925_1

rfname_203906 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/iso_vars_203906.sav'
RESTORE, rfname_203906

rfname_215426 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/iso_vars_215426.sav'
RESTORE, rfname_215426

rfname_232931 = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/iso_vars_232931.sav'
RESTORE, rfname_232931

;===============================================================================
;SNR O IV vals

;restore O IV 004121 TIIs, SNRs, etc.

rfname_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_SNR_limit

rfname2_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/sigma_coeff_arr_050655_Oiv.sav'
RESTORE, rfname2_SNR_limit

rfname3_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/sigma_coeff_arr_050655_1_Oiv.sav'
RESTORE, rfname3_SNR_limit

rfname4_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/sigma_coeff_arr_052046_Oiv.sav'
RESTORE, rfname4_SNR_limit

rfname5_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/sigma_coeff_arr_061606_Oiv.sav'
RESTORE, rfname5_SNR_limit

rfname6_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/sigma_coeff_arr_114951_Oiv.sav'
RESTORE, rfname6_SNR_limit

rfname7_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/sigma_coeff_arr_122033_Oiv.sav'
RESTORE, rfname7_SNR_limit

rfname8_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/sigma_coeff_arr_160806_Oiv.sav'
RESTORE, rfname8_SNR_limit

rfname9_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/sigma_coeff_arr_163205_Oiv.sav'
RESTORE, rfname9_SNR_limit

rfname10_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/sigma_coeff_arr_174905_Oiv.sav'
RESTORE, rfname10_SNR_limit

rfname11_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/sigma_coeff_arr_181205_Oiv.sav'
RESTORE, rfname11_SNR_limit

rfname12_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/sigma_coeff_arr_201925_Oiv.sav'
RESTORE, rfname12_SNR_limit

rfname13_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/sigma_coeff_arr_201925_1_Oiv.sav'
RESTORE, rfname13_SNR_limit

rfname14_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/sigma_coeff_arr_203906_Oiv.sav'
RESTORE, rfname14_SNR_limit

rfname15_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/sigma_coeff_arr_215426_Oiv.sav'
RESTORE, rfname15_SNR_limit

rfname16_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/sigma_coeff_arr_232931_Oiv.sav'
RESTORE, rfname16_SNR_limit

;===============================================================================
;TII: It, int_int_unc w/ O IV and Si IV

;restore Si IV 004121 TIIs, TII Unc, etc.

rfname_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/IT_UV_004121.sav'
RESTORE, rfname_limit

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/IT_UV_050655.sav'
RESTORE, rfname2_limit

rfname3_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/IT_UV_050655_1.sav'
RESTORE, rfname3_limit

rfname4_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/IT_UV_052046.sav'
RESTORE, rfname4_limit

rfname5_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/IT_UV_061606.sav'
RESTORE, rfname5_limit

rfname6_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/IT_UV_114951.sav'
RESTORE, rfname6_limit

rfname7_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/IT_UV_122033.sav'
RESTORE, rfname7_limit

rfname8_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/IT_UV_160806.sav'
RESTORE, rfname8_limit

rfname9_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/IT_UV_163205.sav'
RESTORE, rfname9_limit

rfname10_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/IT_UV_174905.sav'
RESTORE, rfname10_limit

rfname11_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/IT_UV_181205.sav'
RESTORE, rfname11_limit

rfname12_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/IT_UV_201925.sav'
RESTORE, rfname12_limit

rfname13_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/IT_UV_201925_1.sav'
RESTORE, rfname13_limit

rfname14_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/IT_UV_203906.sav'
RESTORE, rfname14_limit

rfname15_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/IT_UV_215426.sav'
RESTORE, rfname15_limit

rfname16_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/IT_UV_232931.sav'
RESTORE, rfname16_limit

;===============================================================================
;restore S IV SNRs, TIIs, etc.

rfname_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/S_IV/sigma_coeff_arr_004121_Siv.sav'
RESTORE, rfname_Siv

rfname2_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/S_IV/sigma_coeff_arr_050655_Siv.sav'
RESTORE, rfname2_Siv

rfname3_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/S_IV/sigma_coeff_arr_050655_1_Siv.sav'
RESTORE, rfname3_Siv

rfname4_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/S_IV/sigma_coeff_arr_052046_Siv.sav'
RESTORE, rfname4_Siv

rfname5_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/S_IV/sigma_coeff_arr_061606_Siv.sav'
RESTORE, rfname5_Siv

rfname6_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/S_IV/sigma_coeff_arr_114951_Siv.sav'
RESTORE, rfname6_Siv

rfname7_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/S_IV/sigma_coeff_arr_122033_Siv.sav'
RESTORE, rfname7_Siv

rfname8_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/S_IV/sigma_coeff_arr_160806_Siv.sav'
RESTORE, rfname8_Siv

rfname9_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/S_IV/sigma_coeff_arr_163205_Siv.sav'
RESTORE, rfname9_Siv

rfname10_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/S_IV/sigma_coeff_arr_174905_Siv.sav'
RESTORE, rfname10_Siv

rfname11_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/S_IV/sigma_coeff_arr_181205_Siv.sav'
RESTORE, rfname11_Siv

rfname12_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/S_IV/sigma_coeff_arr_201925_Siv.sav'
RESTORE, rfname12_Siv

rfname13_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/S_IV/sigma_coeff_arr_201925_1_Siv.sav'
RESTORE, rfname13_Siv

rfname14_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/S_IV/sigma_coeff_arr_203906_Siv.sav'
RESTORE, rfname14_Siv

rfname15_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/S_IV/sigma_coeff_arr_215426_Siv.sav'
RESTORE, rfname15_Siv

rfname16_Siv = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/S_IV/sigma_coeff_arr_232931_Siv.sav'
RESTORE, rfname16_Siv

;===============================================================================
;load electron density diagnostic model

rfname_dens = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/si4_o4_dens_diagnostic.sav'
RESTORE, rfname_dens

;===============================================================================
;concatenate arrays

;PRINT, "array_004121_O"
array_004121_O = [[It_O_004121],[int_int_unc_O_004121],[limit_vel_width_004121_Oiv],[limit_velocity_004121_Oiv],[SNR_O_004121],[UVB_ind_Oiv_004121],[lw_004121_Oiv],[p_int_004121_Oiv]]
;PRINT, SIZE(array_004121_O) ;2D,464

;PRINT, "array_004121_Si"
array_004121_Si = [[It_Si_004121],[int_int_unc_Si_004121],[limit_vel_width_004121],[limit_velocity_004121],[UVB_ind_004121],[lw_004121],[p_int_004121]]
;PRINT, SIZE(array_004121_Si) ;2D,471

;PRINT, "array_004121_S"
array_004121_S = [[It_S_004121],[int_int_unc_S_004121],[limit_vel_width_004121_Siv],[limit_velocity_004121_Siv],[SNR_S_004121],[UVB_ind_Siv_004121],[lw_004121_Siv],[p_int_004121_Siv]]
;PRINT, SIZE(array_004121_S) ;2D,421

;-------------------------------------------------------------------------------

;PRINT, "array_050655_O"
array_050655_O = [[It_O_050655],[int_int_unc_O_050655],[limit_vel_width_050655_Oiv],[limit_velocity_050655_Oiv],[SNR_O_050655],[UVB_ind_Oiv_050655],[lw_050655_Oiv],[p_int_050655_Oiv]]
;PRINT, SIZE(array_050655_O) ;2D,280

;PRINT, "array_050655_Si"
array_050655_Si = [[It_Si_050655],[int_int_unc_Si_050655],[limit_vel_width_050655],[limit_velocity_050655],[UVB_ind_050655],[lw_050655],[p_int_050655]]
;PRINT, SIZE(array_050655_Si) ;2D,304

;PRINT, "array_050655_S"
array_050655_S = [[It_S_050655],[int_int_unc_S_050655],[limit_vel_width_050655_Siv],[limit_velocity_050655_Siv],[SNR_S_050655],[UVB_ind_Siv_050655],[lw_050655_Siv],[p_int_050655_Siv]]
;PRINT, SIZE(array_050655_S) ;2D,246

;-------------------------------------------------------------------------------

;PRINT, "array_050655_1_O"
array_050655_1_O = [[It_O_050655_1],[int_int_unc_O_050655_1],[limit_vel_width_050655_1_Oiv],[limit_velocity_050655_1_Oiv],[SNR_O_050655_1],[UVB_ind_Oiv_050655_1],[lw_050655_1_Oiv],[p_int_050655_1_Oiv]]
;PRINT, SIZE(array_050655_1_O) ;2D,387

;PRINT, "array_050655_1_Si"
array_050655_1_Si = [[It_Si_050655_1],[int_int_unc_Si_050655_1],[limit_vel_width_050655_1],[limit_velocity_050655_1],[UVB_ind_050655_1],[lw_050655_1],[p_int_050655_1]]
;PRINT, SIZE(array_050655_1_Si) ;2D,402

;PRINT, "array_050655_1_S"
array_050655_1_S = [[It_S_050655_1],[int_int_unc_S_050655_1],[limit_vel_width_050655_1_Siv],[limit_velocity_050655_1_Siv],[SNR_S_050655_1],[UVB_ind_Siv_050655_1],[lw_050655_1_Siv],[p_int_050655_1_Siv]]
;PRINT, SIZE(array_050655_1_S) ;2D,309

;-------------------------------------------------------------------------------

;PRINT, "array_052046_O"
array_052046_O = [[It_O_052046],[int_int_unc_O_052046],[limit_vel_width_052046_Oiv],[limit_velocity_052046_Oiv],[SNR_O_052046],[UVB_ind_Oiv_052046],[lw_052046_Oiv],[p_int_052046_Oiv]]
;PRINT, SIZE(array_052046_O) ;2D,2660

;PRINT, "array_052046_Si"
array_052046_Si = [[It_Si_052046],[int_int_unc_Si_052046],[limit_vel_width_052046],[limit_velocity_052046],[UVB_ind_052046],[lw_052046],[p_int_052046]]
;PRINT, SIZE(array_052046_Si) ;2D,2811

;PRINT, "array_052046_S"
array_052046_S = [[It_S_052046],[int_int_unc_S_052046],[limit_vel_width_052046_Siv],[limit_velocity_052046_Siv],[SNR_S_052046],[UVB_ind_Siv_052046],[lw_052046_Siv],[p_int_052046_Siv]]
;PRINT, SIZE(array_052046_S) ;2D,2190

;-------------------------------------------------------------------------------

;PRINT, "array_061606_O"
array_061606_O = [[It_O_061606],[int_int_unc_O_061606],[limit_vel_width_061606_Oiv],[limit_velocity_061606_Oiv],[SNR_O_061606],[UVB_ind_Oiv_061606],[lw_061606_Oiv],[p_int_061606_Oiv]]
;PRINT, SIZE(array_061606_O) ;2D,415

;PRINT, "array_061606_Si"
array_061606_Si = [[It_Si_061606],[int_int_unc_Si_061606],[limit_vel_width_061606],[limit_velocity_061606],[UVB_ind_061606],[lw_061606],[p_int_061606]]
;PRINT, SIZE(array_061606_Si) ;2D,431

;PRINT, "array_061606_S"
array_061606_S = [[It_S_061606],[int_int_unc_S_061606],[limit_vel_width_061606_Siv],[limit_velocity_061606_Siv],[SNR_S_061606],[UVB_ind_Siv_061606],[lw_061606_Siv],[p_int_061606_Siv]]
;PRINT, SIZE(array_061606_S) ;2D,352

;-------------------------------------------------------------------------------

;PRINT, "array_114951_O"
array_114951_O = [[It_O_114951],[int_int_unc_O_114951],[limit_vel_width_114951_Oiv],[limit_velocity_114951_Oiv],[SNR_O_114951],[UVB_ind_Oiv_114951],[lw_114951_Oiv],[p_int_114951_Oiv]]
;PRINT, SIZE(array_114951_O) ;2D,893

;PRINT, "array_114951_Si"
array_114951_Si = [[It_Si_114951],[int_int_unc_Si_114951],[limit_vel_width_114951],[limit_velocity_114951],[UVB_ind_114951],[lw_114951],[p_int_114951]]
;PRINT, SIZE(array_114951_Si) ;2D,1070

;PRINT, "array_114951_S"
array_114951_S = [[It_S_114951],[int_int_unc_S_114951],[limit_vel_width_114951_Siv],[limit_velocity_114951_Siv],[SNR_S_114951],[UVB_ind_Siv_114951],[lw_114951_Siv],[p_int_114951_Siv]]
;PRINT, SIZE(array_114951_S) ;2D,759

;-------------------------------------------------------------------------------

;PRINT, "array_122033_O"
array_122033_O = [[It_O_122033],[int_int_unc_O_122033],[limit_vel_width_122033_Oiv],[limit_velocity_122033_Oiv],[SNR_O_122033],[UVB_ind_Oiv_122033],[lw_122033_Oiv],[p_int_122033_Oiv]]
;PRINT, SIZE(array_122033_O) ;2D,915

;PRINT, "array_122033_Si"
array_122033_Si = [[It_Si_122033],[int_int_unc_Si_122033],[limit_vel_width_122033],[limit_velocity_122033],[UVB_ind_122033],[lw_122033],[p_int_122033]]
;PRINT, SIZE(array_122033_Si) ;2D,963

;PRINT, "array_122033_S"
array_122033_S = [[It_S_122033],[int_int_unc_S_122033],[limit_vel_width_122033_Siv],[limit_velocity_122033_Siv],[SNR_S_122033],[UVB_ind_Siv_122033],[lw_122033_Siv],[p_int_122033_Siv]]
;PRINT, SIZE(array_122033_S) ;2D,849

;-------------------------------------------------------------------------------

;PRINT, "array_160806_O"
array_160806_O = [[It_O_160806],[int_int_unc_O_160806],[limit_vel_width_160806_Oiv],[limit_velocity_160806_Oiv],[SNR_O_160806],[UVB_ind_Oiv_160806],[lw_160806_Oiv],[p_int_160806_Oiv]]
;PRINT, SIZE(array_160806_O) ;2D,574

;PRINT, "array_160806_Si"
array_160806_Si = [[It_Si_160806],[int_int_unc_Si_160806],[limit_vel_width_160806],[limit_velocity_160806],[UVB_ind_160806],[lw_160806],[p_int_160806]]
;PRINT, SIZE(array_160806_Si) ;2D,613

;PRINT, "array_160806_S"
array_160806_S = [[It_S_160806],[int_int_unc_S_160806],[limit_vel_width_160806_Siv],[limit_velocity_160806_Siv],[SNR_S_160806],[UVB_ind_Siv_160806],[lw_160806_Siv],[p_int_160806_Siv]]
;PRINT, SIZE(array_160806_S) ;2D,512

;-------------------------------------------------------------------------------

;PRINT, "array_163205_O"
array_163205_O = [[It_O_163205],[int_int_unc_O_163205],[limit_vel_width_163205_Oiv],[limit_velocity_163205_Oiv],[SNR_O_163205],[UVB_ind_Oiv_163205],[lw_163205_Oiv],[p_int_163205_Oiv]]
;PRINT, SIZE(array_163205_O) ;2D,486

;PRINT, "array_163205_Si"
array_163205_Si = [[It_Si_163205],[int_int_unc_Si_163205],[limit_vel_width_163205],[limit_velocity_163205],[UVB_ind_163205],[lw_163205],[p_int_163205]]
;PRINT, SIZE(array_163205_Si) ;2D,522

;PRINT, "array_163205_S"
array_163205_S = [[It_S_163205],[int_int_unc_S_163205],[limit_vel_width_163205_Siv],[limit_velocity_163205_Siv],[SNR_S_163205],[UVB_ind_Siv_163205],[lw_163205_Siv],[p_int_163205_Siv]]
;PRINT, SIZE(array_163205_S) ;2D,411

;-------------------------------------------------------------------------------

;PRINT, "array_174905_O"
array_174905_O = [[It_O_174905],[int_int_unc_O_174905],[limit_vel_width_174905_Oiv],[limit_velocity_174905_Oiv],[SNR_O_174905],[UVB_ind_Oiv_174905],[lw_174905_Oiv],[p_int_174905_Oiv]]
;PRINT, SIZE(array_174905_O) ;2D,713

;PRINT, "array_174905_Si"
array_174905_Si = [[It_Si_174905],[int_int_unc_Si_174905],[limit_vel_width_174905],[limit_velocity_174905],[UVB_ind_174905],[lw_174905],[p_int_174905]]
;PRINT, SIZE(array_174905_Si) ;2D,760

;PRINT, "array_174905_S"
array_174905_S = [[It_S_174905],[int_int_unc_S_174905],[limit_vel_width_174905_Siv],[limit_velocity_174905_Siv],[SNR_S_174905],[UVB_ind_Siv_174905],[lw_174905_Siv],[p_int_174905_Siv]]
;PRINT, SIZE(array_174905_S) ;2D,582

;-------------------------------------------------------------------------------

;PRINT, "array_181205_O"
array_181205_O = [[It_O_181205],[int_int_unc_O_181205],[limit_vel_width_181205_Oiv],[limit_velocity_181205_Oiv],[SNR_O_181205],[UVB_ind_Oiv_181205],[lw_181205_Oiv],[p_int_181205_Oiv]]
;PRINT, SIZE(array_181205_O) ;2D,352

;PRINT, "array_181205_Si"
array_181205_Si = [[It_Si_181205],[int_int_unc_Si_181205],[limit_vel_width_181205],[limit_velocity_181205],[UVB_ind_181205],[lw_181205],[p_int_181205]]
;PRINT, SIZE(array_181205_Si) ;2D,388

;PRINT, "array_181205_S"
array_181205_S = [[It_S_181205],[int_int_unc_S_181205],[limit_vel_width_181205_Siv],[limit_velocity_181205_Siv],[SNR_S_181205],[UVB_ind_Siv_181205],[lw_181205_Siv],[p_int_181205_Siv]]
;PRINT, SIZE(array_181205_S) ;2D,268

;-------------------------------------------------------------------------------

;PRINT, "array_201925_O"
array_201925_O = [[It_O_201925],[int_int_unc_O_201925],[limit_vel_width_201925_Oiv],[limit_velocity_201925_Oiv],[SNR_O_201925],[UVB_ind_Oiv_201925],[lw_201925_Oiv],[p_int_201925_Oiv]]
;PRINT, SIZE(array_201925_O) ;2D,578

;PRINT, "array_201925_Si"
array_201925_Si = [[It_Si_201925],[int_int_unc_Si_201925],[limit_vel_width_201925],[limit_velocity_201925],[UVB_ind_201925],[lw_201925],[p_int_201925]]
;PRINT, SIZE(array_201925_Si) ;2D,660

;PRINT, "array_201925_S"
array_201925_S = [[It_S_201925],[int_int_unc_S_201925],[limit_vel_width_201925_Siv],[limit_velocity_201925_Siv],[SNR_S_201925],[UVB_ind_Siv_201925],[lw_201925_Siv],[p_int_201925_Siv]]
;PRINT, SIZE(array_201925_S) ;2D,478

;-------------------------------------------------------------------------------

;PRINT, "array_201925_1_O"
array_201925_1_O = [[It_O_201925_1],[int_int_unc_O_201925_1],[limit_vel_width_201925_1_Oiv],[limit_velocity_201925_1_Oiv],[SNR_O_201925_1],[UVB_ind_Oiv_201925_1],[lw_201925_1_Oiv],[p_int_201925_1_Oiv]]
;PRINT, SIZE(array_201925_1_O) ;2D,304

;PRINT, "array_201925_1_Si"
array_201925_1_Si = [[It_Si_201925_1],[int_int_unc_Si_201925_1],[limit_vel_width_201925_1],[limit_velocity_201925_1],[UVB_ind_201925_1],[lw_201925_1],[p_int_201925_1]]
;PRINT, SIZE(array_201925_1_Si) ;2D,315

;PRINT, "array_201925_1_S"
array_201925_1_S = [[It_S_201925_1],[int_int_unc_S_201925_1],[limit_vel_width_201925_1_Siv],[limit_velocity_201925_1_Siv],[SNR_S_201925_1],[UVB_ind_Siv_201925_1],[lw_201925_1_Siv],[p_int_201925_1_Siv]]
;PRINT, SIZE(array_201925_1_S) ;2D,243

;-------------------------------------------------------------------------------

;PRINT, "array_203906_O"
array_203906_O = [[It_O_203906],[int_int_unc_O_203906],[limit_vel_width_203906_Oiv],[limit_velocity_203906_Oiv],[SNR_O_203906],[UVB_ind_Oiv_203906],[lw_203906_Oiv],[p_int_203906_Oiv]]
;PRINT, SIZE(array_203906_O) ;2D,1157

;PRINT, "array_203906_Si"
array_203906_Si = [[It_Si_203906],[int_int_unc_Si_203906],[limit_vel_width_203906],[limit_velocity_203906],[UVB_ind_203906],[lw_203906],[p_int_203906]]
;PRINT, SIZE(array_203906_Si) ;2D,1235

;PRINT, "array_203906_S"
array_203906_S = [[It_S_203906],[int_int_unc_S_203906],[limit_vel_width_203906_Siv],[limit_velocity_203906_Siv],[SNR_S_203906],[UVB_ind_Siv_203906],[lw_203906_Siv],[p_int_203906_Siv]]
;PRINT, SIZE(array_203906_S) ;2D,1059

;-------------------------------------------------------------------------------

;PRINT, "array_215426_O"
array_215426_O = [[It_O_215426],[int_int_unc_O_215426],[limit_vel_width_215426_Oiv],[limit_velocity_215426_Oiv],[SNR_O_215426],[UVB_ind_Oiv_215426],[lw_215426_Oiv],[p_int_215426_Oiv]]
;PRINT, SIZE(array_215426_O) ;2D,194

;PRINT, "array_215426_Si"
array_215426_Si = [[It_Si_215426],[int_int_unc_Si_215426],[limit_vel_width_215426],[limit_velocity_215426],[UVB_ind_215426],[lw_215426],[p_int_215426]]
;PRINT, SIZE(array_215426_Si) ;2D,196

;PRINT, "array_215426_S"
array_215426_S = [[It_S_215426],[int_int_unc_S_215426],[limit_vel_width_215426_Siv],[limit_velocity_215426_Siv],[SNR_S_215426],[UVB_ind_Siv_215426],[lw_215426_Siv],[p_int_215426_Siv]]
;PRINT, SIZE(array_215426_S) ;2D,158

;-------------------------------------------------------------------------------

;PRINT, "array_232931_O"
array_232931_O = [[It_O_232931],[int_int_unc_O_232931],[limit_vel_width_232931_Oiv],[limit_velocity_232931_Oiv],[SNR_O_232931],[UVB_ind_Oiv_232931],[lw_232931_Oiv],[p_int_232931_Oiv]]
;PRINT, SIZE(array_232931_O) ;2D,227

;PRINT, "array_232931_Si"
array_232931_Si = [[It_Si_232931],[int_int_unc_Si_232931],[limit_vel_width_232931],[limit_velocity_232931],[UVB_ind_232931],[lw_232931],[p_int_232931]]
;PRINT, SIZE(array_232931_Si) ;2D,228

;PRINT, "array_232931_S"
array_232931_S = [[It_S_232931],[int_int_unc_S_232931],[limit_vel_width_232931_Siv],[limit_velocity_232931_Siv],[SNR_S_232931],[UVB_ind_Siv_232931],[lw_232931_Siv],[p_int_232931_Siv]]
;PRINT, SIZE(array_232931_S) ;2D,189

;===============================================================================
;below is how to index the arrays:

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
;PRINT, 'UVB_ind_Siv_232931'
;PRINT, array_232931_S[*,5]

;===============================================================================
;WHERE function testing for UVB maps

vel_width = array_004121_Si[*,2]
uvb_index = array_004121_Si[*,4]

vel_40_50 = WHERE((vel_width GE 40.0) AND (vel_width LT 45.0) AND (uvb_index GE 0.0), count)
;PRINT, count ;66
;PRINT, vel_width[vel_40_50]
;PRINT, uvb_index[vel_40_50]

vel_50_60 = WHERE((vel_width GE 50.0) AND (vel_width LT 60.0) AND (uvb_index GE 0.0), count)
;PRINT, count ;163
;PRINT, vel_width[vel_50_60]
;PRINT, uvb_index[vel_50_60]

vel_60_70 = WHERE((vel_width GE 60.0) AND (vel_width LT 70.0) AND (uvb_index GE 0.0), count)
;PRINT, count ;127
;PRINT, vel_width[vel_60_70]
;PRINT, uvb_index[vel_60_70]

vel_70_80 = WHERE((vel_width GE 70.0) AND (vel_width LT 80.0) AND (uvb_index GE 0.0), count)
;PRINT, count ;76
;PRINT, vel_width[vel_70_80]
;PRINT, uvb_index[vel_70_80]

vel_80_1000 = WHERE((vel_width GE 80.0) AND (vel_width LT 1000.0) AND (uvb_index GE 0.0), count)
;PRINT, count ;39
;PRINT, vel_width[vel_80_1000]
;PRINT, uvb_index[vel_80_1000]

;===============================================================================
;line width vs density 

;004121

;check before csv creation--all match with csv
;PRINT, It_Si_004121
;PRINT, int_int_unc_Si_004121
;PRINT, limit_vel_width_004121
;PRINT, limit_velocity_004121
;PRINT, lw_004121
;PRINT, It_O_004121
;PRINT, int_int_unc_O_004121
;PRINT, limit_vel_width_004121_Oiv
;PRINT, limit_velocity_004121_Oiv
;PRINT, SNR_O_004121
;PRINT, lw_004121_Oiv
;PRINT, It_S_004121
;PRINT, int_int_unc_S_004121
;PRINT, limit_vel_width_004121_Siv
;PRINT, limit_velocity_004121_Siv
;PRINT, SNR_S_004121
;PRINT, lw_004121_Siv
;PRINT, UVB_ind_Siv_004121

;Just want everything in relation to O IV. Basically "throwing away"
;data that doesn't match with O IV. We could have filled in
;missing data with a -999 if we did it the other way. 
y = array_004121_O[*,5]
;PRINT, N_ELEMENTS(y) ;464
x = array_004121_Si[*,4]
;PRINT, N_ELEMENTS(x) ;471
z = array_004121_S[*,5]
;PRINT, N_ELEMENTS(z) ;421
openw, 1, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table.csv'
FOR i = 0, N_ELEMENTS(y)-1 DO BEGIN
   O_Si_004121 = WHERE((x EQ y[i]),count)
   O_S_004121 = WHERE((z EQ y[i]),count)
;   PRINT, x[var], y[i], z[var2]
;   PRINT, count ;464 checked --43 zeros for S and 7 for Si, csv has
;50 for S columns and fill with last value the missing ones. 471-421=50...
   IF (count EQ 0) THEN z[O_S_004121] = -999
   IF (count EQ 0) THEN It_S_004121[O_S_004121] = -999
   IF (count EQ 0) THEN int_int_unc_S_004121[O_S_004121] = -999
   IF (count EQ 0) THEN limit_vel_width_004121_Siv[O_S_004121] = -999
   IF (count EQ 0) THEN limit_velocity_004121_Siv[O_S_004121] = -999
   IF (count EQ 0) THEN SNR_S_004121[O_S_004121] = -999
   IF (count EQ 0) THEN lw_004121_Siv[O_S_004121] = -999
   IF (count EQ 0) THEN p_int_004121_Siv[O_S_004121] = -999
   printf, 1, x[O_Si_004121], y[i], It_Si_004121[O_Si_004121], int_int_unc_Si_004121[O_Si_004121], limit_vel_width_004121[O_Si_004121], limit_velocity_004121[O_Si_004121], lw_004121[O_Si_004121], p_int_004121[O_Si_004121], It_O_004121[i], int_int_unc_O_004121[i], limit_vel_width_004121_Oiv[i], limit_velocity_004121_Oiv[i], SNR_O_004121[i], lw_004121_Oiv[i], p_int_004121_Oiv[i], It_S_004121[O_S_004121], int_int_unc_S_004121[O_S_004121], limit_vel_width_004121_Siv[O_S_004121], limit_velocity_004121_Siv[O_S_004121], SNR_S_004121[O_S_004121], lw_004121_Siv[O_S_004121], p_int_004121_Siv[O_S_004121], z[O_S_004121], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)" ;HEADER = ['Si_IV_UVB',' , ','O_IV_UVB'] Si_IV_UVB[var], O_IV_UVB[i], It_Si_004121[var], int_int_unc_Si_004121[var], limit_vel_width_004121[var], limit_velocity_004121[var], lw_004121[var], p_int_004121[var], It_O_004121[i], int_int_unc_O_004121[i], limit_vel_width_004121_Oiv[i], limit_velocity_004121_Oiv[i], SNR_O_004121[i], lw_004121_Oiv[i], p_int_004121_Oiv[i], It_S_004121[var2], int_int_unc_S_004121[var2], limit_vel_width_004121_Siv[var2], limit_velocity_004121_Siv[var2], SNR_S_004121[var2], lw_004121_Siv[var2], p_int_004121[var2], S_IV_UVB[var]
ENDFOR
close, 1

;initial thoughts when trying to use QGIS
;openw, 2, 'coordx.csv'
;printf, 2, SolarX1400_004121, FORMAT = "(f100.9)"
;close, 2

;initial thoughts when trying to use QGIS
;openw, 3, 'coordy.csv'
;printf, 3, SolarY1400_004121, FORMAT = "(f100.9)"
;close, 3

;check excel has right elements
;PRINT, It_Si_004121
;PRINT, int_int_unc_Si_004121
;PRINT, limit_vel_width_004121
;PRINT, limit_velocity_004121
;PRINT, lw_004121
;PRINT, p_int_004121
;PRINT, It_O_004121
;PRINT, int_int_unc_O_004121
;PRINT, limit_vel_width_004121_Oiv
;PRINT, limit_velocity_004121_Oiv
;PRINT, SNR_O_004121
;PRINT, lw_004121_Oiv
;PRINT, p_int_004121_Oiv
;PRINT, It_S_004121
;PRINT, int_int_unc_S_004121
;PRINT, limit_vel_width_004121_Siv
;PRINT, limit_velocity_004121_Siv
;PRINT, SNR_S_004121
;PRINT, lw_004121_Siv
;PRINT, p_int_004121_Siv
;PRINT, UVB_ind_Siv_004121

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table.csv')
;PRINT, csv
col_si_uvb = csv.(0) ;Si IV UVB
col_o_uvb = csv.(1) ;O IV UVB
col_si_tii = csv.(2) ;Si IV TII
col_si_tii_u = csv.(3) ;Si IV TII uncertainty
col_si_vel_w = csv.(4) ;Si IV vel_width
col_si_vel = csv.(5) ;Si IV velocity
col_si_lw = csv.(6) ;Si IV lw
col_si_int = csv.(7) ;Si IV p_int
col_o_tii = csv.(8) ;O IV TII
col_o_tii_u = csv.(9) ;O IV TII uncertainty
col_o_vel_w = csv.(10) ;O IV vel_width
col_o_vel = csv.(11) ;O IV velocity
col_o_snr = csv.(12) ;O IV SNR
col_o_lw = csv.(13) ;O IV lw
col_o_int = csv.(14) ;O IV p_int
col_s_tii = csv.(15) ;S IV TII
col_s_tii_u = csv.(16) ;S IV TII uncertainty
col_s_vel_w = csv.(17) ;S IV vel_width
col_s_vel = csv.(18) ;S IV velocity
col_s_snr = csv.(19) ;S IV SNR
col_s_lw = csv.(20) ;S IV lw
col_s_int = csv.(21) ;S IV p_int
col_s_uvb = csv.(22) ;S IV UVB
table_limit = WHERE((col_si_uvb EQ 31049) AND (col_o_uvb EQ 31049) AND (col_si_tii GE 0.0) AND (col_si_tii_u GE 0.0) AND (col_si_vel_w GE 0.0) AND (col_si_vel GE 0.0) AND (col_o_tii GE 0.0) AND (col_o_tii_u GE 0.0) AND (col_o_vel_w GE 0.0) AND (col_o_vel GE 0.0) AND (col_o_snr GE 0.0))
;PRINT, col_si_uvb[table_limit]
;PRINT, col_o_uvb[table_limit]
;PRINT, col_si_tii[table_limit]
;PRINT, col_si_tii_u[table_limit]
;PRINT, col_si_vel_w[table_limit]
;PRINT, col_si_vel[table_limit]
;PRINT, col_si_lw[table_limit]
;PRINT, col_si_int[table_limit]
;PRINT, col_o_tii[table_limit]
;PRINT, col_o_tii_u[table_limit]
;PRINT, col_o_vel_w[table_limit]
;PRINT, col_o_vel[table_limit]
;PRINT, col_o_snr[table_limit]
;PRINT, col_o_lw[table_limit]
;PRINT, col_o_int[table_limit]
;PRINT, col_s_tii[table_limit]
;PRINT, col_s_tii_u[table_limit]
;PRINT, col_s_vel_w[table_limit]
;PRINT, col_s_vel[table_limit]
;PRINT, col_s_snr[table_limit]
;PRINT, col_s_lw[table_limit]
;PRINT, col_s_int[table_limit]
;PRINT, col_s_uvb[table_limit]
ratio_limit = WHERE((col_o_snr GE 3.0) AND (col_o_snr LT 1000) AND (col_o_tii GE 0.0) AND (col_si_tii GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr[ratio_limit] ;the same as SNR_O_004121[num_three]
PRINT, 'TII O'
PRINT, col_o_tii[ratio_limit] ;the same as O_004121
PRINT, 'TII Si IV'
PRINT, col_si_tii[ratio_limit] ;not same as Si_004121 in master_TII.pro...has 30 that have snrs < 3.0 intermittent between matching values, but same count.

;double check above matches old way (and checked with master_TII.pro):
;snr_cut = array_004121_O[*,4]
;tii_cut = array_004121_O[*,0]
;oiv_cut_004121 = WHERE((snr_cut GE 3.0) AND (snr_cut LT 1000) AND (tii_cut GE 0.0), count)
;PRINT, snr_cut[oiv_cut_004121]
;PRINT, 'next'
;PRINT, tii_cut[oiv_cut_004121]

ratio_004121 = (col_si_tii[ratio_limit]/col_o_tii[ratio_limit])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_004121)
PRINT, ratio_004121 ;same count, and starts with similar number as master_TII, but diverges then on.

TII_004121 = N_ELEMENTS(ratio_004121)
PRINT, TII_004121 ;90

electron_dens_arr_004121 = DBLARR(TII_004121)

FOR i = 0, TII_004121-1 DO BEGIN
   difference_arr_004121 = ABS(si_o_ratio-ratio_004121[i])
   electron_dens_004121 = WHERE(difference_arr_004121 EQ MIN(difference_arr_004121), /NULL)
   electron_dens_arr_004121[i] = electron_dens_004121[0]
ENDFOR

PRINT, e_density[electron_dens_arr_004121]

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

e_dens_004121 = e_density[electron_dens_arr_004121]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_70_1000 = WHERE((col_o_snr GE 3.0) AND (col_o_snr LT 1000) AND (col_o_tii GE 0.0) AND (col_si_tii GE 0.0) AND (col_si_vel_w GE 70.0) AND (col_si_vel_w LT 1000.0) AND (col_o_vel_w GE 70.0) AND (col_o_vel_w LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr[ratio_limit_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii[ratio_limit_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii[ratio_limit_70_1000]

ratio_004121_70_1000 = (col_si_tii[ratio_limit_70_1000]/col_o_tii[ratio_limit_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_004121_70_1000)
PRINT, ratio_004121_70_1000

TII_004121_70_1000 = N_ELEMENTS(ratio_004121_70_1000)
PRINT, TII_004121_70_1000 ;4

electron_dens_arr_004121_70_1000 = DBLARR(TII_004121_70_1000)

FOR i = 0, TII_004121_70_1000-1 DO BEGIN
   difference_arr_004121_70_1000 = ABS(si_o_ratio-ratio_004121_70_1000[i])
   electron_dens_004121_70_1000 = WHERE(difference_arr_004121_70_1000 EQ MIN(difference_arr_004121_70_1000), /NULL)
   electron_dens_arr_004121_70_1000[i] = electron_dens_004121_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_004121_70_1000]

PRINT, "004121_70_1000"

nin_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_004121_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_004121_70_1000) ;0

ten_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_004121_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_004121_70_1000) ;0

elev_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_004121_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_004121_70_1000) ;4

twel_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_004121_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_004121_70_1000) ;0

thirt_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_004121_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_004121_70_1000) ;0

four_004121_70_1000 = WHERE((e_density[electron_dens_arr_004121_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_004121_70_1000) ;0

e_dens_004121_70_1000 = e_density[electron_dens_arr_004121_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_40_70 = WHERE((col_o_snr GE 3.0) AND (col_o_snr LT 1000) AND (col_o_tii GE 0.0) AND (col_si_tii GE 0.0) AND (col_si_vel_w GE 40.0) AND (col_si_vel_w LT 70.0) AND (col_o_vel_w GE 40.0) AND (col_o_vel_w LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr[ratio_limit_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii[ratio_limit_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii[ratio_limit_40_70]

ratio_004121_40_70 = (col_si_tii[ratio_limit_40_70]/col_o_tii[ratio_limit_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_004121_40_70)
PRINT, ratio_004121_40_70

TII_004121_40_70 = N_ELEMENTS(ratio_004121_40_70)
PRINT, TII_004121_40_70 ;32

electron_dens_arr_004121_40_70 = DBLARR(TII_004121_40_70)

FOR i = 0, TII_004121_40_70-1 DO BEGIN
   difference_arr_004121_40_70 = ABS(si_o_ratio-ratio_004121_40_70[i])
   electron_dens_004121_40_70 = WHERE(difference_arr_004121_40_70 EQ MIN(difference_arr_004121_40_70), /NULL)
   electron_dens_arr_004121_40_70[i] = electron_dens_004121_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_004121_40_70]

PRINT, "004121_40_70"

nin_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_004121_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_004121_40_70) ;0

ten_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_004121_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_004121_40_70) ;0

elev_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_004121_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_004121_40_70) ;22

twel_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_004121_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_004121_40_70) ;10

thirt_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_004121_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_004121_40_70) ;0

four_004121_40_70 = WHERE((e_density[electron_dens_arr_004121_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_004121_40_70) ;0

e_dens_004121_40_70 = e_density[electron_dens_arr_004121_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_40 = WHERE((col_o_snr GE 3.0) AND (col_o_snr LT 1000) AND (col_o_tii GE 0.0) AND (col_si_tii GE 0.0) AND (col_si_vel_w GE 0.0) AND (col_si_vel_w LT 40.0) AND (col_o_vel_w GE 0.0) AND (col_o_vel_w LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result = CORRELATE(lw_004121,e_density[electron_dens_arr_004121])
PRINT, result ;-0.092130031

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_004121, e_density[electron_dens_arr_004121], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_004121, e_density[electron_dens_arr_004121], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_004121, p_int_004121, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;050655

y_050655 = array_050655_O[*,5]
;PRINT, N_ELEMENTS(y_050655) ;280
x_050655 = array_050655_Si[*,4]
;PRINT, N_ELEMENTS(x_050655) ;304
z_050655 = array_050655_S[*,5]
;PRINT, N_ELEMENTS(z_050655) ;246
openw, 4, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_050655.csv'
FOR i = 0, N_ELEMENTS(y_050655)-1 DO BEGIN
   O_Si_050655 = WHERE((x_050655 EQ y_050655[i]),count)
   O_S_050655 = WHERE((z_050655 EQ y_050655[i]),count)
   IF (SNR_O_050655[i] EQ 'Infinity') THEN SNR_O_050655[i] = -999
   IF (SNR_S_050655[O_S_050655] EQ 'Infinity') THEN SNR_S_050655[O_S_050655] = -999
   IF (count EQ 0) THEN z_050655[O_S_050655] = -999
   IF (count EQ 0) THEN It_S_050655[O_S_050655] = -999
   IF (count EQ 0) THEN int_int_unc_S_050655[O_S_050655] = -999
   IF (count EQ 0) THEN limit_vel_width_050655_Siv[O_S_050655] = -999
   IF (count EQ 0) THEN limit_velocity_050655_Siv[O_S_050655] = -999
   IF (count EQ 0) THEN SNR_S_050655[O_S_050655] = -999
   IF (count EQ 0) THEN lw_050655_Siv[O_S_050655] = -999
   IF (count EQ 0) THEN p_int_050655_Siv[O_S_050655] = -999
   printf, 4, x_050655[O_Si_050655], y_050655[i], It_Si_050655[O_Si_050655], int_int_unc_Si_050655[O_Si_050655], limit_vel_width_050655[O_Si_050655], limit_velocity_050655[O_Si_050655], lw_050655[O_Si_050655], p_int_050655[O_Si_050655], It_O_050655[i], int_int_unc_O_050655[i], limit_vel_width_050655_Oiv[i], limit_velocity_050655_Oiv[i], SNR_O_050655[i], lw_050655_Oiv[i], p_int_050655_Oiv[i], It_S_050655[O_S_050655],int_int_unc_S_050655[O_S_050655],limit_vel_width_050655_Siv[O_S_050655],limit_velocity_050655_Siv[O_S_050655], SNR_S_050655[O_S_050655], lw_050655_Siv[O_S_050655], p_int_050655_Siv[O_S_050655], z_050655[O_S_050655], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 4

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_050655.csv')
col_si_uvb_050655 = csv.(0) ;Si IV UVB
col_o_uvb_050655 = csv.(1) ;O IV UVB
col_si_tii_050655 = csv.(2) ;Si IV TII
col_si_tii_u_050655 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_050655 = csv.(4) ;Si IV vel_width
col_si_vel_050655 = csv.(5) ;Si IV velocity
col_si_lw_050655 = csv.(6) ;Si IV lw
col_si_int_050655 = csv.(7) ;Si IV p_int
col_o_tii_050655 = csv.(8) ;O IV TII
col_o_tii_u_050655 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_050655 = csv.(10) ;O IV vel_width
col_o_vel_050655 = csv.(11) ;O IV velocity
col_o_snr_050655 = csv.(12) ;O IV SNR
col_o_lw_050655 = csv.(13) ;O IV lw
col_o_int_050655 = csv.(14) ;O IV p_int
col_s_tii_050655 = csv.(15) ;S IV TII
col_s_tii_u_050655 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_050655 = csv.(17) ;S IV vel_width
col_s_vel_050655 = csv.(18) ;S IV velocity
col_s_snr_050655 = csv.(19) ;S IV SNR
col_s_lw_050655 = csv.(20) ;S IV lw
col_s_int_050655 = csv.(21) ;S IV p_int
col_s_uvb_050655 = csv.(22) ;S IV UVB
table_limit_050655 = WHERE((col_si_uvb_050655 EQ 31049) AND (col_o_uvb_050655 EQ 31049) AND (col_si_tii_050655 GE 0.0) AND (col_si_tii_u_050655 GE 0.0) AND (col_si_vel_w_050655 GE 0.0) AND (col_si_vel_050655 GE 0.0) AND (col_o_tii_050655 GE 0.0) AND (col_o_tii_u_050655 GE 0.0) AND (col_o_vel_w_050655 GE 0.0) AND (col_o_vel_050655 GE 0.0) AND (col_o_snr_050655 GE 0.0))

ratio_limit_050655 = WHERE((col_o_snr_050655 GE 3.0) AND (col_o_snr_050655 LT 1000) AND (col_o_snr_050655 LT 1000) AND (col_o_tii_050655 GE 0.0) AND (col_si_tii_050655 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_050655[ratio_limit_050655]
PRINT, 'TII O'
PRINT, col_o_tii_050655[ratio_limit_050655]
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655[ratio_limit_050655]

ratio_050655 = (col_si_tii_050655[ratio_limit_050655]/col_o_tii_050655[ratio_limit_050655])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655)
PRINT, ratio_050655

TII_050655 = N_ELEMENTS(ratio_050655)
PRINT, TII_050655 ;66

electron_dens_arr_050655 = DBLARR(TII_050655)

FOR i = 0, TII_050655-1 DO BEGIN
   difference_arr_050655 = ABS(si_o_ratio-ratio_050655[i])
   electron_dens_050655 = WHERE(difference_arr_050655 EQ MIN(difference_arr_050655), /NULL)
   electron_dens_arr_050655[i] = electron_dens_050655[0]
ENDFOR

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

e_dens_050655 = e_density[electron_dens_arr_050655]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_050655_70_1000 = WHERE((col_o_snr_050655 GE 3.0) AND (col_o_snr_050655 LT 1000) AND (col_o_tii_050655 GE 0.0) AND (col_si_tii_050655 GE 0.0) AND (col_si_vel_w_050655 GE 70.0) AND (col_si_vel_w_050655 LT 1000.0) AND (col_o_vel_w_050655 GE 70.0) AND (col_o_vel_w_050655 LT 1000.0), /NULL)
PRINT, 'SNR O'
PRINT, col_o_snr_050655[ratio_limit_050655_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_050655[ratio_limit_050655_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655[ratio_limit_050655_70_1000]

ratio_050655_70_1000 = (col_si_tii_050655[ratio_limit_050655_70_1000]/col_o_tii_050655[ratio_limit_050655_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655_70_1000)
PRINT, ratio_050655_70_1000

TII_050655_70_1000 = N_ELEMENTS(ratio_050655_70_1000)
PRINT, TII_050655_70_1000 ;1

electron_dens_arr_050655_70_1000 = DBLARR(TII_050655_70_1000)

FOR i = 0, TII_050655_70_1000-1 DO BEGIN
   difference_arr_050655_70_1000 = ABS(si_o_ratio-ratio_050655_70_1000[i])
   electron_dens_050655_70_1000 = WHERE(difference_arr_050655_70_1000 EQ MIN(difference_arr_050655_70_1000), /NULL)
   electron_dens_arr_050655_70_1000[i] = electron_dens_050655_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_050655_70_1000]

PRINT, "050655_70_1000"

nin_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655_70_1000) ;0

ten_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655_70_1000) ;0

elev_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655_70_1000) ;1

twel_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655_70_1000) ;0

thirt_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655_70_1000) ;0

four_050655_70_1000 = WHERE((e_density[electron_dens_arr_050655_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655_70_1000) ;0

e_dens_050655_70_1000 = e_density[electron_dens_arr_050655_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_050655_40_70 = WHERE((col_o_snr_050655 GE 3.0) AND (col_o_snr_050655 LT 1000) AND (col_o_tii_050655 GE 0.0) AND (col_si_tii_050655 GE 0.0) AND (col_si_vel_w_050655 GE 40.0) AND (col_si_vel_w_050655 LT 70.0) AND (col_o_vel_w_050655 GE 40.0) AND (col_o_vel_w_050655 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_050655[ratio_limit_050655_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_050655[ratio_limit_050655_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655[ratio_limit_050655_40_70]

ratio_050655_40_70 = (col_si_tii_050655[ratio_limit_050655_40_70]/col_o_tii_050655[ratio_limit_050655_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655_40_70)
PRINT, ratio_050655_40_70

TII_050655_40_70 = N_ELEMENTS(ratio_050655_40_70)
PRINT, TII_050655_40_70 ;22

electron_dens_arr_050655_40_70 = DBLARR(TII_050655_40_70)

FOR i = 0, TII_050655_40_70-1 DO BEGIN
   difference_arr_050655_40_70 = ABS(si_o_ratio-ratio_050655_40_70[i])
   electron_dens_050655_40_70 = WHERE(difference_arr_050655_40_70 EQ MIN(difference_arr_050655_40_70), /NULL)
   electron_dens_arr_050655_40_70[i] = electron_dens_050655_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_050655_40_70]

PRINT, "050655_40_70"

nin_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655_40_70) ;0

ten_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655_40_70) ;0

elev_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655_40_70) ;11

twel_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655_40_70) ;11

thirt_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655_40_70) ;0

four_050655_40_70 = WHERE((e_density[electron_dens_arr_050655_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655_40_70) ;0

e_dens_050655_40_70 = e_density[electron_dens_arr_050655_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_050655_40 = WHERE((col_o_snr_050655 GE 3.0) AND (col_o_snr_050655 LT 1000) AND (col_o_tii_050655 GE 0.0) AND (col_si_tii_050655 GE 0.0) AND (col_si_vel_w_050655 GE 0.0) AND (col_si_vel_w_050655 LT 40.0) AND (col_o_vel_w_050655 GE 0.0) AND (col_o_vel_w_050655 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_050655 = CORRELATE(lw_050655,e_density[electron_dens_arr_050655])
PRINT, result_050655 ;-0.31327837

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_050655, e_density[electron_dens_arr_050655], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_050655, e_density[electron_dens_arr_050655], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_050655, p_int_050655, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;050655_1

y_050655_1 = array_050655_1_O[*,5]
;PRINT, N_ELEMENTS(y_050655_1) ;387
x_050655_1 = array_050655_1_Si[*,4]
;PRINT, N_ELEMENTS(x_050655_1) ;402
z_050655_1 = array_050655_1_S[*,5]
;PRINT, N_ELEMENTS(z_050655_1) ;309
openw, 5, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_050655_1.csv'
FOR i = 0, N_ELEMENTS(y_050655_1)-1 DO BEGIN
   O_Si_050655_1 = WHERE((x_050655_1 EQ y_050655_1[i]),count)
   O_S_050655_1 = WHERE((z_050655_1 EQ y_050655_1[i]),count)
   IF (SNR_O_050655_1[i] EQ 'Infinity') THEN SNR_O_050655_1[i] = -999
   IF (SNR_S_050655_1[O_S_050655_1] EQ 'Infinity') THEN SNR_S_050655_1[O_S_050655_1] = -999
   IF (count EQ 0) THEN z_050655_1[O_S_050655_1] = -999
   IF (count EQ 0) THEN It_S_050655_1[O_S_050655_1] = -999
   IF (count EQ 0) THEN int_int_unc_S_050655_1[O_S_050655_1] = -999
   IF (count EQ 0) THEN limit_vel_width_050655_1_Siv[O_S_050655_1] = -999
   IF (count EQ 0) THEN limit_velocity_050655_1_Siv[O_S_050655_1] = -999
   IF (count EQ 0) THEN SNR_S_050655_1[O_S_050655_1] = -999
   IF (count EQ 0) THEN lw_050655_1_Siv[O_S_050655_1] = -999
   IF (count EQ 0) THEN p_int_050655_1_Siv[O_S_050655_1] = -999
   printf, 5, x_050655_1[O_Si_050655_1], y_050655_1[i], It_Si_050655_1[O_Si_050655_1], int_int_unc_Si_050655_1[O_Si_050655_1], limit_vel_width_050655_1[O_Si_050655_1], limit_velocity_050655_1[O_Si_050655_1], lw_050655_1[O_Si_050655_1], p_int_050655_1[O_Si_050655_1], It_O_050655_1[i], int_int_unc_O_050655_1[i], limit_vel_width_050655_1_Oiv[i], limit_velocity_050655_1_Oiv[i], SNR_O_050655_1[i], lw_050655_1_Oiv[i], p_int_050655_1_Oiv[i], It_S_050655_1[O_S_050655_1], int_int_unc_S_050655_1[O_S_050655_1], limit_vel_width_050655_1_Siv[O_S_050655_1], limit_velocity_050655_1_Siv[O_S_050655_1], SNR_S_050655_1[O_S_050655_1], lw_050655_1_Siv[O_S_050655_1], p_int_050655_1_Siv[O_S_050655_1], z_050655_1[O_S_050655_1], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 5

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_050655_1.csv')
col_si_uvb_050655_1 = csv.(0) ;Si IV UVB
col_o_uvb_050655_1 = csv.(1) ;O IV UVB
col_si_tii_050655_1 = csv.(2) ;Si IV TII
col_si_tii_u_050655_1 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_050655_1 = csv.(4) ;Si IV vel_width
col_si_vel_050655_1 = csv.(5) ;Si IV velocity
col_si_lw_050655_1 = csv.(6) ;Si IV lw
col_si_int_050655_1 = csv.(7) ;Si IV p_int
col_o_tii_050655_1 = csv.(8) ;O IV TII
col_o_tii_u_050655_1 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_050655_1 = csv.(10) ;O IV vel_width
col_o_vel_050655_1 = csv.(11) ;O IV velocity
col_o_snr_050655_1 = csv.(12) ;O IV SNR
col_o_lw_050655_1 = csv.(13) ;O IV lw
col_o_int_050655_1 = csv.(14) ;O IV p_int
col_s_tii_050655_1 = csv.(15) ;S IV TII
col_s_tii_u_050655_1 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_050655_1 = csv.(17) ;S IV vel_width
col_s_vel_050655_1 = csv.(18) ;S IV velocity
col_s_snr_050655_1 = csv.(19) ;S IV SNR
col_s_lw_050655_1 = csv.(20) ;S IV lw
col_s_int_050655_1 = csv.(21) ;S IV p_int
col_s_uvb_050655_1 = csv.(22) ;S IV UVB
table_limit_050655_1 = WHERE((col_si_uvb_050655_1 EQ 31049) AND (col_o_uvb_050655_1 EQ 31049) AND (col_si_tii_050655_1 GE 0.0) AND (col_si_tii_u_050655_1 GE 0.0) AND (col_si_vel_w_050655_1 GE 0.0) AND (col_si_vel_050655_1 GE 0.0) AND (col_o_tii_050655_1 GE 0.0) AND (col_o_tii_u_050655_1 GE 0.0) AND (col_o_vel_w_050655_1 GE 0.0) AND (col_o_vel_050655_1 GE 0.0) AND (col_o_snr_050655_1 GE 0.0))

ratio_limit_050655_1 = WHERE((col_o_snr_050655_1 GE 3.0) AND (col_o_snr_050655_1 LT 1000) AND (col_o_snr_050655_1 LT 1000) AND (col_o_tii_050655_1 GE 0.0) AND (col_si_tii_050655_1 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_050655_1[ratio_limit_050655_1]
PRINT, 'TII O'
PRINT, col_o_tii_050655_1[ratio_limit_050655_1]
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655_1[ratio_limit_050655_1]

ratio_050655_1 = (col_si_tii_050655_1[ratio_limit_050655_1]/col_o_tii_050655_1[ratio_limit_050655_1])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655_1)
PRINT, ratio_050655_1

TII_050655_1 = N_ELEMENTS(ratio_050655_1)
PRINT, TII_050655_1 ;109

electron_dens_arr_050655_1 = DBLARR(TII_050655_1)

FOR i = 0, TII_050655_1-1 DO BEGIN
   difference_arr_050655_1 = ABS(si_o_ratio-ratio_050655_1[i])
   electron_dens_050655_1 = WHERE(difference_arr_050655_1 EQ MIN(difference_arr_050655_1), /NULL)
   electron_dens_arr_050655_1[i] = electron_dens_050655_1[0]
ENDFOR

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

e_dens_050655_1 = e_density[electron_dens_arr_050655_1]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_050655_1_70_1000 = WHERE((col_o_snr_050655_1 GE 3.0) AND (col_o_snr_050655_1 LT 1000) AND (col_o_tii_050655_1 GE 0.0) AND (col_si_tii_050655_1 GE 0.0) AND (col_si_vel_w_050655_1 GE 70.0) AND (col_si_vel_w_050655_1 LT 1000.0) AND (col_o_vel_w_050655_1 GE 70.0) AND (col_o_vel_w_050655_1 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_050655_1[ratio_limit_050655_1_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_050655_1[ratio_limit_050655_1_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655_1[ratio_limit_050655_1_70_1000]

ratio_050655_1_70_1000 = (col_si_tii_050655_1[ratio_limit_050655_1_70_1000]/col_o_tii_050655_1[ratio_limit_050655_1_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655_1_70_1000)
PRINT, ratio_050655_1_70_1000

TII_050655_1_70_1000 = N_ELEMENTS(ratio_050655_1_70_1000)
PRINT, TII_050655_1_70_1000 ;2

electron_dens_arr_050655_1_70_1000 = DBLARR(TII_050655_1_70_1000)

FOR i = 0, TII_050655_1_70_1000-1 DO BEGIN
   difference_arr_050655_1_70_1000 = ABS(si_o_ratio-ratio_050655_1_70_1000[i])
   electron_dens_050655_1_70_1000 = WHERE(difference_arr_050655_1_70_1000 EQ MIN(difference_arr_050655_1_70_1000), /NULL)
   electron_dens_arr_050655_1_70_1000[i] = electron_dens_050655_1_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_050655_1_70_1000]

PRINT, "050655_1_70_1000"

nin_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655_1_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655_1_70_1000) ;0

ten_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655_1_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655_1_70_1000) ;0

elev_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655_1_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655_1_70_1000) ;2

twel_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655_1_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655_1_70_1000) ;0

thirt_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655_1_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655_1_70_1000) ;0

four_050655_1_70_1000 = WHERE((e_density[electron_dens_arr_050655_1_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655_1_70_1000) ;0

e_dens_050655_1_70_1000 = e_density[electron_dens_arr_050655_1_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_050655_1_40_70 = WHERE((col_o_snr_050655_1 GE 3.0) AND (col_o_snr_050655_1 LT 1000) AND (col_o_tii_050655_1 GE 0.0) AND (col_si_tii_050655_1 GE 0.0) AND (col_si_vel_w_050655_1 GE 40.0) AND (col_si_vel_w_050655_1 LT 70.0) AND (col_o_vel_w_050655_1 GE 40.0) AND (col_o_vel_w_050655_1 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_050655_1[ratio_limit_050655_1_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_050655_1[ratio_limit_050655_1_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_050655_1[ratio_limit_050655_1_40_70]

ratio_050655_1_40_70 = (col_si_tii_050655_1[ratio_limit_050655_1_40_70]/col_o_tii_050655_1[ratio_limit_050655_1_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_050655_1_40_70)
PRINT, ratio_050655_1_40_70

TII_050655_1_40_70 = N_ELEMENTS(ratio_050655_1_40_70)
PRINT, TII_050655_1_40_70 ;29

electron_dens_arr_050655_1_40_70 = DBLARR(TII_050655_1_40_70)

FOR i = 0, TII_050655_1_40_70-1 DO BEGIN
   difference_arr_050655_1_40_70 = ABS(si_o_ratio-ratio_050655_1_40_70[i])
   electron_dens_050655_1_40_70 = WHERE(difference_arr_050655_1_40_70 EQ MIN(difference_arr_050655_1_40_70), /NULL)
   electron_dens_arr_050655_1_40_70[i] = electron_dens_050655_1_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_050655_1_40_70]

PRINT, "050655_1_40_70"

nin_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_050655_1_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_050655_1_40_70) ;0

ten_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_050655_1_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_050655_1_40_70) ;3

elev_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_050655_1_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_050655_1_40_70) ;25

twel_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_050655_1_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_050655_1_40_70) ;1

thirt_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_050655_1_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_050655_1_40_70) ;0

four_050655_1_40_70 = WHERE((e_density[electron_dens_arr_050655_1_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_050655_1_40_70) ;0

e_dens_050655_1_40_70 = e_density[electron_dens_arr_050655_1_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_050655_1_40 = WHERE((col_o_snr_050655_1 GE 3.0) AND (col_o_snr_050655_1 LT 1000) AND (col_o_tii_050655_1 GE 0.0) AND (col_si_tii_050655_1 GE 0.0) AND (col_si_vel_w_050655_1 GE 0.0) AND (col_si_vel_w_050655_1 LT 40.0) AND (col_o_vel_w_050655_1 GE 0.0) AND (col_o_vel_w_050655_1 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_050655_1 = CORRELATE(lw_050655_1,e_density[electron_dens_arr_050655_1])
PRINT, result_050655_1 ;-0.21333146

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_050655_1, e_density[electron_dens_arr_050655_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_050655_1, e_density[electron_dens_arr_050655_1], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_050655_1, p_int_050655_1, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;052046

y_052046 = array_052046_O[*,5]
;PRINT, N_ELEMENTS(y_052046) ;2660
x_052046 = array_052046_Si[*,4]
;PRINT, N_ELEMENTS(x_052046) ;2811
z_052046 = array_052046_S[*,5]
;PRINT, N_ELEMENTS(z_052046) ;2190
openw, 5, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_052046.csv'
FOR i = 0, N_ELEMENTS(y_052046)-1 DO BEGIN
   O_Si_052046 = WHERE((x_052046 EQ y_052046[i]),count)
   O_S_052046 = WHERE((z_052046 EQ y_052046[i]),count)
   IF (SNR_O_052046[i] EQ 'Infinity') THEN SNR_O_052046[i] = -999
   IF (SNR_S_052046[O_S_052046] EQ 'Infinity') THEN SNR_S_052046[O_S_052046] = -999
   IF (count EQ 0) THEN z_052046[O_S_052046] = -999
   IF (count EQ 0) THEN It_S_052046[O_S_052046] = -999
   IF (count EQ 0) THEN int_int_unc_S_052046[O_S_052046] = -999
   IF (count EQ 0) THEN limit_vel_width_052046_Siv[O_S_052046] = -999
   IF (count EQ 0) THEN limit_velocity_052046_Siv[O_S_052046] = -999
   IF (count EQ 0) THEN SNR_S_052046[O_S_052046] = -999
   IF (count EQ 0) THEN lw_052046_Siv[O_S_052046] = -999
   IF (count EQ 0) THEN p_int_052046_Siv[O_S_052046] = -999
   printf, 5, x_052046[O_Si_052046], y_052046[i], It_Si_052046[O_Si_052046], int_int_unc_Si_052046[O_Si_052046], limit_vel_width_052046[O_Si_052046], limit_velocity_052046[O_Si_052046], lw_052046[O_Si_052046], p_int_052046[O_Si_052046], It_O_052046[i], int_int_unc_O_052046[i], limit_vel_width_052046_Oiv[i], limit_velocity_052046_Oiv[i], SNR_O_052046[i], lw_052046_Oiv[i], p_int_052046_Oiv[i], It_S_052046[O_S_052046], int_int_unc_S_052046[O_S_052046], limit_vel_width_052046_Siv[O_S_052046], limit_velocity_052046_Siv[O_S_052046], SNR_S_052046[O_S_052046], lw_052046_Siv[O_S_052046], p_int_052046_Siv[O_S_052046], z_052046[O_S_052046], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 5

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_052046.csv')
col_si_uvb_052046 = csv.(0) ;Si IV UVB
col_o_uvb_052046 = csv.(1) ;O IV UVB
col_si_tii_052046 = csv.(2) ;Si IV TII
col_si_tii_u_052046 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_052046 = csv.(4) ;Si IV vel_width
col_si_vel_052046 = csv.(5) ;Si IV velocity
col_si_lw_052046 = csv.(6) ;Si IV lw
col_si_int_052046 = csv.(7) ;Si IV p_int
col_o_tii_052046 = csv.(8) ;O IV TII
col_o_tii_u_052046 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_052046 = csv.(10) ;O IV vel_width
col_o_vel_052046 = csv.(11) ;O IV velocity
col_o_snr_052046 = csv.(12) ;O IV SNR
col_o_lw_052046 = csv.(13) ;O IV lw
col_o_int_052046 = csv.(14) ;O IV p_int
col_s_tii_052046 = csv.(15) ;S IV TII
col_s_tii_u_052046 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_052046 = csv.(17) ;S IV vel_width
col_s_vel_052046 = csv.(18) ;S IV velocity
col_s_snr_052046 = csv.(19) ;S IV SNR
col_s_lw_052046 = csv.(20) ;S IV lw
col_s_int_052046 = csv.(21) ;S IV p_int
col_s_uvb_052046 = csv.(22) ;S IV UVB
table_limit_052046 = WHERE((col_si_uvb_052046 EQ 31049) AND (col_o_uvb_052046 EQ 31049) AND (col_si_tii_052046 GE 0.0) AND (col_si_tii_u_052046 GE 0.0) AND (col_si_vel_w_052046 GE 0.0) AND (col_si_vel_052046 GE 0.0) AND (col_o_tii_052046 GE 0.0) AND (col_o_tii_u_052046 GE 0.0) AND (col_o_vel_w_052046 GE 0.0) AND (col_o_vel_052046 GE 0.0) AND (col_o_snr_052046 GE 0.0))

ratio_limit_052046 = WHERE((col_o_snr_052046 GE 3.0) AND (col_o_snr_052046 LT 1000) AND (col_o_snr_052046 LT 1000) AND (col_o_tii_052046 GE 0.0) AND (col_si_tii_052046 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_052046[ratio_limit_052046]
PRINT, 'TII O'
PRINT, col_o_tii_052046[ratio_limit_052046]
PRINT, 'TII Si IV'
PRINT, col_si_tii_052046[ratio_limit_052046]

ratio_052046 = (col_si_tii_052046[ratio_limit_052046]/col_o_tii_052046[ratio_limit_052046])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_052046)
PRINT, ratio_052046

TII_052046 = N_ELEMENTS(ratio_052046)
PRINT, TII_052046 ;1220

electron_dens_arr_052046 = DBLARR(TII_052046)

FOR i = 0, TII_052046-1 DO BEGIN
   difference_arr_052046 = ABS(si_o_ratio-ratio_052046[i])
   electron_dens_052046 = WHERE(difference_arr_052046 EQ MIN(difference_arr_052046), /NULL)
   electron_dens_arr_052046[i] = electron_dens_052046[0]
ENDFOR

PRINT, "052046"

nin_052046 = WHERE((e_density[electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_052046) ;362--10

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

e_dens_052046 = e_density[electron_dens_arr_052046]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_052046_70_1000 = WHERE((col_o_snr_052046 GE 3.0) AND (col_o_snr_052046 LT 1000) AND (col_o_tii_052046 GE 0.0) AND (col_si_tii_052046 GE 0.0) AND (col_si_vel_w_052046 GE 70.0) AND (col_si_vel_w_052046 LT 1000.0) AND (col_o_vel_w_052046 GE 70.0) AND (col_o_vel_w_052046 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_052046[ratio_limit_052046_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_052046[ratio_limit_052046_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_052046[ratio_limit_052046_70_1000]

ratio_052046_70_1000 = (col_si_tii_052046[ratio_limit_052046_70_1000]/col_o_tii_052046[ratio_limit_052046_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_052046_70_1000)
PRINT, ratio_052046_70_1000

TII_052046_70_1000 = N_ELEMENTS(ratio_052046_70_1000)
PRINT, TII_052046_70_1000 ;37

electron_dens_arr_052046_70_1000 = DBLARR(TII_052046_70_1000)

FOR i = 0, TII_052046_70_1000-1 DO BEGIN
   difference_arr_052046_70_1000 = ABS(si_o_ratio-ratio_052046_70_1000[i])
   electron_dens_052046_70_1000 = WHERE(difference_arr_052046_70_1000 EQ MIN(difference_arr_052046_70_1000), /NULL)
   electron_dens_arr_052046_70_1000[i] = electron_dens_052046_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_052046_70_1000]

PRINT, "052046_70_1000"

nin_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_052046_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_052046_70_1000) ;0

ten_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_052046_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_052046_70_1000) ;0

elev_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_052046_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_052046_70_1000) ;27

twel_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_052046_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_052046_70_1000) ;10

thirt_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_052046_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_052046_70_1000) ;0

four_052046_70_1000 = WHERE((e_density[electron_dens_arr_052046_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_052046_70_1000) ;0

e_dens_052046_70_1000 = e_density[electron_dens_arr_052046_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_052046_40_70 = WHERE((col_o_snr_052046 GE 3.0) AND (col_o_snr_052046 LT 1000) AND (col_o_tii_052046 GE 0.0) AND (col_si_tii_052046 GE 0.0) AND (col_si_vel_w_052046 GE 40.0) AND (col_si_vel_w_052046 LT 70.0) AND (col_o_vel_w_052046 GE 40.0) AND (col_o_vel_w_052046 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_052046[ratio_limit_052046_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_052046[ratio_limit_052046_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_052046[ratio_limit_052046_40_70]

ratio_052046_40_70 = (col_si_tii_052046[ratio_limit_052046_40_70]/col_o_tii_052046[ratio_limit_052046_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_052046_40_70)
PRINT, ratio_052046_40_70

TII_052046_40_70 = N_ELEMENTS(ratio_052046_40_70)
PRINT, TII_052046_40_70 ;374

electron_dens_arr_052046_40_70 = DBLARR(TII_052046_40_70)

FOR i = 0, TII_052046_40_70-1 DO BEGIN
   difference_arr_052046_40_70 = ABS(si_o_ratio-ratio_052046_40_70[i])
   electron_dens_052046_40_70 = WHERE(difference_arr_052046_40_70 EQ MIN(difference_arr_052046_40_70), /NULL)
   electron_dens_arr_052046_40_70[i] = electron_dens_052046_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_052046_40_70]

PRINT, "052046_40_70"

nin_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_052046_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_052046_40_70) ;7

ten_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_052046_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_052046_40_70) ;9

elev_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_052046_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_052046_40_70) ;329

twel_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_052046_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_052046_40_70) ;26

thirt_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_052046_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_052046_40_70) ;3

four_052046_40_70 = WHERE((e_density[electron_dens_arr_052046_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_052046_40_70) ;0

e_dens_052046_40_70 = e_density[electron_dens_arr_052046_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_052046_40 = WHERE((col_o_snr_052046 GE 3.0) AND (col_o_snr_052046 LT 1000) AND (col_o_tii_052046 GE 0.0) AND (col_si_tii_052046 GE 0.0) AND (col_si_vel_w_052046 GE 0.0) AND (col_si_vel_w_052046 LT 40.0) AND (col_o_vel_w_052046 GE 0.0) AND (col_o_vel_w_052046 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_052046 = CORRELATE(lw_052046,e_density[electron_dens_arr_052046])
PRINT, result_052046 ;0.089794123

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_052046, e_density[electron_dens_arr_052046], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_052046, e_density[electron_dens_arr_052046], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_052046, p_int_052046, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;061606

y_061606 = array_061606_O[*,5]
;PRINT, N_ELEMENTS(y_061606) ;415
x_061606 = array_061606_Si[*,4]
;PRINT, N_ELEMENTS(x_061606) ;431
z_061606 = array_061606_S[*,5]
;PRINT, N_ELEMENTS(z_061606) ;352
openw, 7, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_061606.csv'
FOR i = 0, N_ELEMENTS(y_061606)-1 DO BEGIN
   O_Si_061606 = WHERE((x_061606 EQ y_061606[i]),count)
   O_S_061606 = WHERE((z_061606 EQ y_061606[i]),count)
   IF (SNR_O_061606[i] EQ 'Infinity') THEN SNR_O_061606[i] = -999
   IF (SNR_S_061606[O_S_061606] EQ 'Infinity') THEN SNR_S_061606[O_S_061606] = -999
   IF (count EQ 0) THEN z_061606[O_S_061606] = -999
   IF (count EQ 0) THEN It_S_061606[O_S_061606] = -999
   IF (count EQ 0) THEN int_int_unc_S_061606[O_S_061606] = -999
   IF (count EQ 0) THEN limit_vel_width_061606_Siv[O_S_061606] = -999
   IF (count EQ 0) THEN limit_velocity_061606_Siv[O_S_061606] = -999
   IF (count EQ 0) THEN SNR_S_061606[O_S_061606] = -999
   IF (count EQ 0) THEN lw_061606_Siv[O_S_061606] = -999
   IF (count EQ 0) THEN p_int_061606_Siv[O_S_061606] = -999
   printf, 7, x_061606[O_Si_061606], y_061606[i], It_Si_061606[O_Si_061606], int_int_unc_Si_061606[O_Si_061606], limit_vel_width_061606[O_Si_061606], limit_velocity_061606[O_Si_061606], lw_061606[O_Si_061606], p_int_061606[O_Si_061606], It_O_061606[i], int_int_unc_O_061606[i], limit_vel_width_061606_Oiv[i], limit_velocity_061606_Oiv[i], SNR_O_061606[i], lw_061606_Oiv[i], p_int_061606_Oiv[i], It_S_061606[O_S_061606], int_int_unc_S_061606[O_S_061606], limit_vel_width_061606_Siv[O_S_061606], limit_velocity_061606_Siv[O_S_061606], SNR_S_061606[O_S_061606], lw_061606_Siv[O_S_061606], p_int_061606_Siv[O_S_061606], z_061606[O_S_061606], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 7

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_061606.csv')
col_si_uvb_061606 = csv.(0) ;Si IV UVB
col_o_uvb_061606 = csv.(1) ;O IV UVB
col_si_tii_061606 = csv.(2) ;Si IV TII
col_si_tii_u_061606 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_061606 = csv.(4) ;Si IV vel_width
col_si_vel_061606 = csv.(5) ;Si IV velocity
col_si_lw_061606 = csv.(6) ;Si IV lw
col_si_int_061606 = csv.(7) ;Si IV p_int
col_o_tii_061606 = csv.(8) ;O IV TII
col_o_tii_u_061606 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_061606 = csv.(10) ;O IV vel_width
col_o_vel_061606 = csv.(11) ;O IV velocity
col_o_snr_061606 = csv.(12) ;O IV SNR
col_o_lw_061606 = csv.(13) ;O IV lw
col_o_int_061606 = csv.(14) ;O IV p_int
col_s_tii_061606 = csv.(15) ;S IV TII
col_s_tii_u_061606 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_061606 = csv.(17) ;S IV vel_width
col_s_vel_061606 = csv.(18) ;S IV velocity
col_s_snr_061606 = csv.(19) ;S IV SNR
col_s_lw_061606 = csv.(20) ;S IV lw
col_s_int_061606 = csv.(21) ;S IV p_int
col_s_uvb_061606 = csv.(22) ;S IV UVB
table_limit_061606 = WHERE((col_si_uvb_061606 EQ 31049) AND (col_o_uvb_061606 EQ 31049) AND (col_si_tii_061606 GE 0.0) AND (col_si_tii_u_061606 GE 0.0) AND (col_si_vel_w_061606 GE 0.0) AND (col_si_vel_061606 GE 0.0) AND (col_o_tii_061606 GE 0.0) AND (col_o_tii_u_061606 GE 0.0) AND (col_o_vel_w_061606 GE 0.0) AND (col_o_vel_061606 GE 0.0) AND (col_o_snr_061606 GE 0.0))

ratio_limit_061606 = WHERE((col_o_snr_061606 GE 3.0) AND (col_o_snr_061606 LT 1000) AND (col_o_snr_061606 LT 1000) AND (col_o_tii_061606 GE 0.0) AND (col_si_tii_061606 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_061606[ratio_limit_061606]
PRINT, 'TII O'
PRINT, col_o_tii_061606[ratio_limit_061606]
PRINT, 'TII Si IV'
PRINT, col_si_tii_061606[ratio_limit_061606]

ratio_061606 = (col_si_tii_061606[ratio_limit_061606]/col_o_tii_061606[ratio_limit_061606])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_061606)
PRINT, ratio_061606

TII_061606 = N_ELEMENTS(ratio_061606)
PRINT, TII_061606 ;108

electron_dens_arr_061606 = DBLARR(TII_061606)

FOR i = 0, TII_061606-1 DO BEGIN
   difference_arr_061606 = ABS(si_o_ratio-ratio_061606[i])
   electron_dens_061606 = WHERE(difference_arr_061606 EQ MIN(difference_arr_061606))
   electron_dens_arr_061606[i] = electron_dens_061606[0]
ENDFOR

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

e_dens_061606 = e_density[electron_dens_arr_061606]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_061606_70_1000 = WHERE((col_o_snr_061606 GE 3.0) AND (col_o_snr_061606 LT 1000) AND (col_o_tii_061606 GE 0.0) AND (col_si_tii_061606 GE 0.0) AND (col_si_vel_w_061606 GE 70.0) AND (col_si_vel_w_061606 LT 1000.0) AND (col_o_vel_w_061606 GE 70.0) AND (col_o_vel_w_061606 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_061606[ratio_limit_061606_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_061606[ratio_limit_061606_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_061606[ratio_limit_061606_70_1000]

ratio_061606_70_1000 = (col_si_tii_061606[ratio_limit_061606_70_1000]/col_o_tii_061606[ratio_limit_061606_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_061606_70_1000)
PRINT, ratio_061606_70_1000

TII_061606_70_1000 = N_ELEMENTS(ratio_061606_70_1000)
PRINT, TII_061606_70_1000 ;2

electron_dens_arr_061606_70_1000 = DBLARR(TII_061606_70_1000)

FOR i = 0, TII_061606_70_1000-1 DO BEGIN
   difference_arr_061606_70_1000 = ABS(si_o_ratio-ratio_061606_70_1000[i])
   electron_dens_061606_70_1000 = WHERE(difference_arr_061606_70_1000 EQ MIN(difference_arr_061606_70_1000), /NULL)
   electron_dens_arr_061606_70_1000[i] = electron_dens_061606_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_061606_70_1000]

PRINT, "061606_70_1000"

nin_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_061606_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_061606_70_1000) ;0

ten_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_061606_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_061606_70_1000) ;0

elev_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_061606_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_061606_70_1000) ;2

twel_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_061606_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_061606_70_1000) ;0

thirt_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_061606_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_061606_70_1000) ;0

four_061606_70_1000 = WHERE((e_density[electron_dens_arr_061606_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_061606_70_1000) ;0

e_dens_061606_70_1000 = e_density[electron_dens_arr_061606_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_061606_40_70 = WHERE((col_o_snr_061606 GE 3.0) AND (col_o_snr_061606 LT 1000) AND (col_o_tii_061606 GE 0.0) AND (col_si_tii_061606 GE 0.0) AND (col_si_vel_w_061606 GE 40.0) AND (col_si_vel_w_061606 LT 70.0) AND (col_o_vel_w_061606 GE 40.0) AND (col_o_vel_w_061606 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_061606[ratio_limit_061606_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_061606[ratio_limit_061606_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_061606[ratio_limit_061606_40_70]

ratio_061606_40_70 = (col_si_tii_061606[ratio_limit_061606_40_70]/col_o_tii_061606[ratio_limit_061606_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_061606_40_70)
PRINT, ratio_061606_40_70

TII_061606_40_70 = N_ELEMENTS(ratio_061606_40_70)
PRINT, TII_061606_40_70 ;8

electron_dens_arr_061606_40_70 = DBLARR(TII_061606_40_70)

FOR i = 0, TII_061606_40_70-1 DO BEGIN
   difference_arr_061606_40_70 = ABS(si_o_ratio-ratio_061606_40_70[i])
   electron_dens_061606_40_70 = WHERE(difference_arr_061606_40_70 EQ MIN(difference_arr_061606_40_70), /NULL)
   electron_dens_arr_061606_40_70[i] = electron_dens_061606_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_061606_40_70]

PRINT, "061606_40_70"

nin_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_061606_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_061606_40_70) ;0

ten_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_061606_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_061606_40_70) ;1

elev_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_061606_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_061606_40_70) ;3

twel_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_061606_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_061606_40_70) ;4

thirt_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_061606_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_061606_40_70) ;0

four_061606_40_70 = WHERE((e_density[electron_dens_arr_061606_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_061606_40_70) ;0

e_dens_061606_40_70 = e_density[electron_dens_arr_061606_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_061606_40 = WHERE((col_o_snr_061606 GE 3.0) AND (col_o_snr_061606 LT 1000) AND (col_o_tii_061606 GE 0.0) AND (col_si_tii_061606 GE 0.0) AND (col_si_vel_w_061606 GE 0.0) AND (col_si_vel_w_061606 LT 40.0) AND (col_o_vel_w_061606 GE 0.0) AND (col_o_vel_w_061606 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_061606 = CORRELATE(lw_061606,e_density[electron_dens_arr_061606])
PRINT, result_061606 ;0.088369950

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_061606, e_density[electron_dens_arr_061606], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_061606, e_density[electron_dens_arr_061606], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_061606, p_int_061606, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;114951

y_114951 = array_114951_O[*,5]
;PRINT, N_ELEMENTS(y_114951) ;893
x_114951 = array_114951_Si[*,4]
;PRINT, N_ELEMENTS(x_114951) ;1070
z_114951 = array_114951_S[*,5]
;PRINT, N_ELEMENTS(z_114951) ;759
openw, 8, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_114951.csv'
FOR i = 0, N_ELEMENTS(y_114951)-1 DO BEGIN
   O_Si_114951 = WHERE((x_114951 EQ y_114951[i]),count)
   O_S_114951 = WHERE((z_114951 EQ y_114951[i]),count)
   IF (SNR_O_114951[i] EQ 'Infinity') THEN SNR_O_114951[i] = -999
   IF (SNR_S_114951[O_S_114951] EQ 'Infinity') THEN SNR_S_114951[O_S_114951] = -999
   IF (count EQ 0) THEN z_114951[O_S_114951] = -999
   IF (count EQ 0) THEN It_S_114951[O_S_114951] = -999
   IF (count EQ 0) THEN int_int_unc_S_114951[O_S_114951] = -999
   IF (count EQ 0) THEN limit_vel_width_114951_Siv[O_S_114951] = -999
   IF (count EQ 0) THEN limit_velocity_114951_Siv[O_S_114951] = -999
   IF (count EQ 0) THEN SNR_S_114951[O_S_114951] = -999
   IF (count EQ 0) THEN lw_114951_Siv[O_S_114951] = -999
   IF (count EQ 0) THEN p_int_114951_Siv[O_S_114951] = -999
   printf, 8, x_114951[O_Si_114951], y_114951[i], It_Si_114951[O_Si_114951], int_int_unc_Si_114951[O_Si_114951], limit_vel_width_114951[O_Si_114951], limit_velocity_114951[O_Si_114951], lw_114951[O_Si_114951], p_int_114951[O_Si_114951], It_O_114951[i], int_int_unc_O_114951[i], limit_vel_width_114951_Oiv[i], limit_velocity_114951_Oiv[i], SNR_O_114951[i], lw_114951_Oiv[i], p_int_114951_Oiv[i], It_S_114951[O_S_114951], int_int_unc_S_114951[O_S_114951], limit_vel_width_114951_Siv[O_S_114951], limit_velocity_114951_Siv[O_S_114951], SNR_S_114951[O_S_114951], lw_114951_Siv[O_S_114951], p_int_114951_Siv[O_S_114951], z_114951[O_S_114951], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 8

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_114951.csv')
col_si_uvb_114951 = csv.(0) ;Si IV UVB
col_o_uvb_114951 = csv.(1) ;O IV UVB
col_si_tii_114951 = csv.(2) ;Si IV TII
col_si_tii_u_114951 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_114951 = csv.(4) ;Si IV vel_width
col_si_vel_114951 = csv.(5) ;Si IV velocity
col_si_lw_114951 = csv.(6) ;Si IV lw
col_si_int_114951 = csv.(7) ;Si IV p_int
col_o_tii_114951 = csv.(8) ;O IV TII
col_o_tii_u_114951 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_114951 = csv.(10) ;O IV vel_width
col_o_vel_114951 = csv.(11) ;O IV velocity
col_o_snr_114951 = csv.(12) ;O IV SNR
col_o_lw_114951 = csv.(13) ;O IV lw
col_o_int_114951 = csv.(14) ;O IV p_int
col_s_tii_114951 = csv.(15) ;S IV TII
col_s_tii_u_114951 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_114951 = csv.(17) ;S IV vel_width
col_s_vel_114951 = csv.(18) ;S IV velocity
col_s_snr_114951 = csv.(19) ;S IV SNR
col_s_lw_114951 = csv.(20) ;S IV lw
col_s_int_114951 = csv.(21) ;S IV p_int
col_s_uvb_114951 = csv.(22) ;S IV UVB
table_limit_114951 = WHERE((col_si_uvb_114951 EQ 31049) AND (col_o_uvb_114951 EQ 31049) AND (col_si_tii_114951 GE 0.0) AND (col_si_tii_u_114951 GE 0.0) AND (col_si_vel_w_114951 GE 0.0) AND (col_si_vel_114951 GE 0.0) AND (col_o_tii_114951 GE 0.0) AND (col_o_tii_u_114951 GE 0.0) AND (col_o_vel_w_114951 GE 0.0) AND (col_o_vel_114951 GE 0.0) AND (col_o_snr_114951 GE 0.0))

ratio_limit_114951 = WHERE((col_o_snr_114951 GE 3.0) AND (col_o_snr_114951 LT 1000) AND (col_o_snr_114951 LT 1000) AND (col_o_tii_114951 GE 0.0) AND (col_si_tii_114951 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_114951[ratio_limit_114951]
PRINT, 'TII O'
PRINT, col_o_tii_114951[ratio_limit_114951]
PRINT, 'TII Si IV'
PRINT, col_si_tii_114951[ratio_limit_114951]

ratio_114951 = (col_si_tii_114951[ratio_limit_114951]/col_o_tii_114951[ratio_limit_114951])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_114951)
PRINT, ratio_114951

TII_114951 = N_ELEMENTS(ratio_114951)
PRINT, TII_114951 ;127

electron_dens_arr_114951 = DBLARR(TII_114951)

FOR i = 0, TII_114951-1 DO BEGIN
   difference_arr_114951 = ABS(si_o_ratio-ratio_114951[i])
   electron_dens_114951 = WHERE(difference_arr_114951 EQ MIN(difference_arr_114951), /NULL) ;remove -1
   electron_dens_arr_114951[i] = electron_dens_114951[0] ;0 to choose the first min value if more than one
ENDFOR

PRINT, "114951"

nin_114951 = WHERE((e_density[electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_114951) ;53--2

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

e_dens_114951 = e_density[electron_dens_arr_114951]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_114951_70_1000 = WHERE((col_o_snr_114951 GE 3.0) AND (col_o_snr_114951 LT 1000) AND (col_o_tii_114951 GE 0.0) AND (col_si_tii_114951 GE 0.0) AND (col_si_vel_w_114951 GE 70.0) AND (col_si_vel_w_114951 LT 1000.0) AND (col_o_vel_w_114951 GE 70.0) AND (col_o_vel_w_114951 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_114951[ratio_limit_114951_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_114951[ratio_limit_114951_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_114951[ratio_limit_114951_70_1000]

ratio_114951_70_1000 = (col_si_tii_114951[ratio_limit_114951_70_1000]/col_o_tii_114951[ratio_limit_114951_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_114951_70_1000)
PRINT, ratio_114951_70_1000

TII_114951_70_1000 = N_ELEMENTS(ratio_114951_70_1000)
PRINT, TII_114951_70_1000 ;3

electron_dens_arr_114951_70_1000 = DBLARR(TII_114951_70_1000)

FOR i = 0, TII_114951_70_1000-1 DO BEGIN
   difference_arr_114951_70_1000 = ABS(si_o_ratio-ratio_114951_70_1000[i])
   electron_dens_114951_70_1000 = WHERE(difference_arr_114951_70_1000 EQ MIN(difference_arr_114951_70_1000), /NULL)
   electron_dens_arr_114951_70_1000[i] = electron_dens_114951_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_114951_70_1000]

PRINT, "114951_70_1000"

nin_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_114951_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_114951_70_1000) ;0

ten_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_114951_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_114951_70_1000) ;1

elev_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_114951_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_114951_70_1000) ;2

twel_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_114951_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_114951_70_1000) ;0

thirt_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_114951_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_114951_70_1000) ;0

four_114951_70_1000 = WHERE((e_density[electron_dens_arr_114951_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_114951_70_1000) ;0

e_dens_114951_70_1000 = e_density[electron_dens_arr_114951_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_114951_40_70 = WHERE((col_o_snr_114951 GE 3.0) AND (col_o_snr_114951 LT 1000) AND (col_o_tii_114951 GE 0.0) AND (col_si_tii_114951 GE 0.0) AND (col_si_vel_w_114951 GE 40.0) AND (col_si_vel_w_114951 LT 70.0) AND (col_o_vel_w_114951 GE 40.0) AND (col_o_vel_w_114951 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_114951[ratio_limit_114951_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_114951[ratio_limit_114951_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_114951[ratio_limit_114951_40_70]

ratio_114951_40_70 = (col_si_tii_114951[ratio_limit_114951_40_70]/col_o_tii_114951[ratio_limit_114951_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_114951_40_70)
PRINT, ratio_114951_40_70

TII_114951_40_70 = N_ELEMENTS(ratio_114951_40_70)
PRINT, TII_114951_40_70 ;29

electron_dens_arr_114951_40_70 = DBLARR(TII_114951_40_70)

FOR i = 0, TII_114951_40_70-1 DO BEGIN
   difference_arr_114951_40_70 = ABS(si_o_ratio-ratio_114951_40_70[i])
   electron_dens_114951_40_70 = WHERE(difference_arr_114951_40_70 EQ MIN(difference_arr_114951_40_70), /NULL)
   electron_dens_arr_114951_40_70[i] = electron_dens_114951_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_114951_40_70]

PRINT, "114951_40_70"

nin_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_114951_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_114951_40_70) ;1

ten_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_114951_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_114951_40_70) ;2

elev_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_114951_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_114951_40_70) ;20

twel_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_114951_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_114951_40_70) ;6

thirt_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_114951_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_114951_40_70) ;0

four_114951_40_70 = WHERE((e_density[electron_dens_arr_114951_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_114951_40_70) ;0

e_dens_114951_40_70 = e_density[electron_dens_arr_114951_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_114951_40 = WHERE((col_o_snr_114951 GE 3.0) AND (col_o_snr_114951 LT 1000) AND (col_o_tii_114951 GE 0.0) AND (col_si_tii_114951 GE 0.0) AND (col_si_vel_w_114951 GE 0.0) AND (col_si_vel_w_114951 LT 40.0) AND (col_o_vel_w_114951 GE 0.0) AND (col_o_vel_w_114951 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_114951 = CORRELATE(lw_114951,e_density[electron_dens_arr_114951])
PRINT, result_114951 ;-0.11370625

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_114951, e_density[electron_dens_arr_114951], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_114951, e_density[electron_dens_arr_114951], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_114951, p_int_114951, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;122033

y_122033 = array_122033_O[*,5]
;PRINT, N_ELEMENTS(y_122033) ;915
x_122033 = array_122033_Si[*,4]
;PRINT, N_ELEMENTS(x_122033) ;963
z_122033 = array_122033_S[*,5]
;PRINT, N_ELEMENTS(z_122033) ;849
openw, 9, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_122033.csv'
FOR i = 0, N_ELEMENTS(y_122033)-1 DO BEGIN
   O_Si_122033 = WHERE((x_122033 EQ y_122033[i]),count)
   O_S_122033 = WHERE((z_122033 EQ y_122033[i]),count)
   IF (SNR_O_122033[i] EQ 'Infinity') THEN SNR_O_122033[i] = -999
   IF (SNR_S_122033[O_S_122033] EQ 'Infinity') THEN SNR_S_122033[O_S_122033] = -999
   IF (count EQ 0) THEN z_122033[O_S_122033] = -999
   IF (count EQ 0) THEN It_S_122033[O_S_122033] = -999
   IF (count EQ 0) THEN int_int_unc_S_122033[O_S_122033] = -999
   IF (count EQ 0) THEN limit_vel_width_122033_Siv[O_S_122033] = -999
   IF (count EQ 0) THEN limit_velocity_122033_Siv[O_S_122033] = -999
   IF (count EQ 0) THEN SNR_S_122033[O_S_122033] = -999
   IF (count EQ 0) THEN lw_122033_Siv[O_S_122033] = -999
   IF (count EQ 0) THEN p_int_122033_Siv[O_S_122033] = -999
   printf, 9, x_122033[O_Si_122033], y_122033[i], It_Si_122033[O_Si_122033], int_int_unc_Si_122033[O_Si_122033], limit_vel_width_122033[O_Si_122033], limit_velocity_122033[O_Si_122033], lw_122033[O_Si_122033], p_int_122033[O_Si_122033], It_O_122033[i], int_int_unc_O_122033[i], limit_vel_width_122033_Oiv[i], limit_velocity_122033_Oiv[i], SNR_O_122033[i], lw_122033_Oiv[i], p_int_122033_Oiv[i], It_S_122033[O_S_122033], int_int_unc_S_122033[O_S_122033], limit_vel_width_122033_Siv[O_S_122033], limit_velocity_122033_Siv[O_S_122033], SNR_S_122033[O_S_122033], lw_122033_Siv[O_S_122033], p_int_122033_Siv[O_S_122033], z_122033[O_S_122033], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 9

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_122033.csv')
col_si_uvb_122033 = csv.(0) ;Si IV UVB
col_o_uvb_122033 = csv.(1) ;O IV UVB
col_si_tii_122033 = csv.(2) ;Si IV TII
col_si_tii_u_122033 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_122033 = csv.(4) ;Si IV vel_width
col_si_vel_122033 = csv.(5) ;Si IV velocity
col_si_lw_122033 = csv.(6) ;Si IV lw
col_si_int_122033 = csv.(7) ;Si IV p_int
col_o_tii_122033 = csv.(8) ;O IV TII
col_o_tii_u_122033 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_122033 = csv.(10) ;O IV vel_width
col_o_vel_122033 = csv.(11) ;O IV velocity
col_o_snr_122033 = csv.(12) ;O IV SNR
col_o_lw_122033 = csv.(13) ;O IV lw
col_o_int_122033 = csv.(14) ;O IV p_int
col_s_tii_122033 = csv.(15) ;S IV TII
col_s_tii_u_122033 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_122033 = csv.(17) ;S IV vel_width
col_s_vel_122033 = csv.(18) ;S IV velocity
col_s_snr_122033 = csv.(19) ;S IV SNR
col_s_lw_122033 = csv.(20) ;S IV lw
col_s_int_122033 = csv.(21) ;S IV p_int
col_s_uvb_122033 = csv.(22) ;S IV UVB
table_limit_122033 = WHERE((col_si_uvb_122033 EQ 31049) AND (col_o_uvb_122033 EQ 31049) AND (col_si_tii_122033 GE 0.0) AND (col_si_tii_u_122033 GE 0.0) AND (col_si_vel_w_122033 GE 0.0) AND (col_si_vel_122033 GE 0.0) AND (col_o_tii_122033 GE 0.0) AND (col_o_tii_u_122033 GE 0.0) AND (col_o_vel_w_122033 GE 0.0) AND (col_o_vel_122033 GE 0.0) AND (col_o_snr_122033 GE 0.0))

ratio_limit_122033 = WHERE((col_o_snr_122033 GE 3.0) AND (col_o_snr_122033 LT 1000) AND (col_o_snr_122033 LT 1000) AND (col_o_tii_122033 GE 0.0) AND (col_si_tii_122033 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_122033[ratio_limit_122033]
PRINT, 'TII O'
PRINT, col_o_tii_122033[ratio_limit_122033]
PRINT, 'TII Si IV'
PRINT, col_si_tii_122033[ratio_limit_122033]

ratio_122033 = (col_si_tii_122033[ratio_limit_122033]/col_o_tii_122033[ratio_limit_122033])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_122033)
PRINT, ratio_122033

TII_122033 = N_ELEMENTS(ratio_122033)
PRINT, TII_122033 ;394

electron_dens_arr_122033 = DBLARR(TII_122033)

FOR i = 0, TII_122033-1 DO BEGIN
   difference_arr_122033 = ABS(si_o_ratio-ratio_122033[i])
   electron_dens_122033 = WHERE(difference_arr_122033 EQ MIN(difference_arr_122033), /NULL)
   electron_dens_arr_122033[i] = electron_dens_122033[0]
ENDFOR

PRINT, "122033"

nin_122033 = WHERE((e_density[electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_122033) ;63--0

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

e_dens_122033 = e_density[electron_dens_arr_122033]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_122033_70_1000 = WHERE((col_o_snr_122033 GE 3.0) AND (col_o_snr_122033 LT 1000) AND (col_o_tii_122033 GE 0.0) AND (col_si_tii_122033 GE 0.0) AND (col_si_vel_w_122033 GE 70.0) AND (col_si_vel_w_122033 LT 1000.0) AND (col_o_vel_w_122033 GE 70.0) AND (col_o_vel_w_122033 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_122033[ratio_limit_122033_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_122033[ratio_limit_122033_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_122033[ratio_limit_122033_70_1000]

ratio_122033_70_1000 = (col_si_tii_122033[ratio_limit_122033_70_1000]/col_o_tii_122033[ratio_limit_122033_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_122033_70_1000)
PRINT, ratio_122033_70_1000

TII_122033_70_1000 = N_ELEMENTS(ratio_122033_70_1000)
PRINT, TII_122033_70_1000 ;37

electron_dens_arr_122033_70_1000 = DBLARR(TII_122033_70_1000)

FOR i = 0, TII_122033_70_1000-1 DO BEGIN
   difference_arr_122033_70_1000 = ABS(si_o_ratio-ratio_122033_70_1000[i])
   electron_dens_122033_70_1000 = WHERE(difference_arr_122033_70_1000 EQ MIN(difference_arr_122033_70_1000), /NULL)
   electron_dens_arr_122033_70_1000[i] = electron_dens_122033_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_122033_70_1000]

PRINT, "122033_70_1000"

nin_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_122033_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_122033_70_1000) ;0

ten_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_122033_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_122033_70_1000) ;0

elev_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_122033_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_122033_70_1000) ;11

twel_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_122033_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_122033_70_1000) ;26

thirt_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_122033_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_122033_70_1000) ;0

four_122033_70_1000 = WHERE((e_density[electron_dens_arr_122033_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_122033_70_1000) ;0

e_dens_122033_70_1000 = e_density[electron_dens_arr_122033_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_122033_40_70 = WHERE((col_o_snr_122033 GE 3.0) AND (col_o_snr_122033 LT 1000) AND (col_o_tii_122033 GE 0.0) AND (col_si_tii_122033 GE 0.0) AND (col_si_vel_w_122033 GE 40.0) AND (col_si_vel_w_122033 LT 70.0) AND (col_o_vel_w_122033 GE 40.0) AND (col_o_vel_w_122033 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_122033[ratio_limit_122033_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_122033[ratio_limit_122033_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_122033[ratio_limit_122033_40_70]

ratio_122033_40_70 = (col_si_tii_122033[ratio_limit_122033_40_70]/col_o_tii_122033[ratio_limit_122033_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_122033_40_70)
PRINT, ratio_122033_40_70

TII_122033_40_70 = N_ELEMENTS(ratio_122033_40_70)
PRINT, TII_122033_40_70 ;76

electron_dens_arr_122033_40_70 = DBLARR(TII_122033_40_70)

FOR i = 0, TII_122033_40_70-1 DO BEGIN
   difference_arr_122033_40_70 = ABS(si_o_ratio-ratio_122033_40_70[i])
   electron_dens_122033_40_70 = WHERE(difference_arr_122033_40_70 EQ MIN(difference_arr_122033_40_70), /NULL)
   electron_dens_arr_122033_40_70[i] = electron_dens_122033_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_122033_40_70]

PRINT, "122033_40_70"

nin_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_122033_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_122033_40_70) ;0

ten_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_122033_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_122033_40_70) ;0

elev_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_122033_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_122033_40_70) ;57

twel_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_122033_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_122033_40_70) ;19

thirt_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_122033_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_122033_40_70) ;0

four_122033_40_70 = WHERE((e_density[electron_dens_arr_122033_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_122033_40_70) ;0

e_dens_122033_40_70 = e_density[electron_dens_arr_122033_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_122033_40 = WHERE((col_o_snr_122033 GE 3.0) AND (col_o_snr_122033 LT 1000) AND (col_o_tii_122033 GE 0.0) AND (col_si_tii_122033 GE 0.0) AND (col_si_vel_w_122033 GE 0.0) AND (col_si_vel_w_122033 LT 40.0) AND (col_o_vel_w_122033 GE 0.0) AND (col_o_vel_w_122033 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_122033 = CORRELATE(lw_122033,e_density[electron_dens_arr_122033])
PRINT, result_122033 ;0.052061408

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_122033, e_density[electron_dens_arr_122033], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_122033, e_density[electron_dens_arr_122033], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_122033, p_int_122033, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;160806

y_160806 = array_160806_O[*,5]
;PRINT, N_ELEMENTS(y_160806) ;574
x_160806 = array_160806_Si[*,4]
;PRINT, N_ELEMENTS(x_160806) ;613
z_160806 = array_160806_S[*,5]
;PRINT, N_ELEMENTS(z_160806) ;512
openw, 10, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_160806.csv'
FOR i = 0, N_ELEMENTS(y_160806)-1 DO BEGIN
   O_Si_160806 = WHERE((x_160806 EQ y_160806[i]),count)
   O_S_160806 = WHERE((z_160806 EQ y_160806[i]),count)
   IF (SNR_O_160806[i] EQ 'Infinity') THEN SNR_O_160806[i] = -999
   IF (SNR_S_160806[O_S_160806] EQ 'Infinity') THEN SNR_S_160806[O_S_160806] = -999
   IF (count EQ 0) THEN z_160806[O_S_160806] = -999
   IF (count EQ 0) THEN It_S_160806[O_S_160806] = -999
   IF (count EQ 0) THEN int_int_unc_S_160806[O_S_160806] = -999
   IF (count EQ 0) THEN limit_vel_width_160806_Siv[O_S_160806] = -999
   IF (count EQ 0) THEN limit_velocity_160806_Siv[O_S_160806] = -999
   IF (count EQ 0) THEN SNR_S_160806[O_S_160806] = -999
   IF (count EQ 0) THEN lw_160806_Siv[O_S_160806] = -999
   IF (count EQ 0) THEN p_int_160806_Siv[O_S_160806] = -999
   printf, 10, x_160806[O_Si_160806], y_160806[i], It_Si_160806[O_Si_160806], int_int_unc_Si_160806[O_Si_160806], limit_vel_width_160806[O_Si_160806], limit_velocity_160806[O_Si_160806], lw_160806[O_Si_160806], p_int_160806[O_Si_160806], It_O_160806[i], int_int_unc_O_160806[i], limit_vel_width_160806_Oiv[i], limit_velocity_160806_Oiv[i], SNR_O_160806[i], lw_160806_Oiv[i], p_int_160806_Oiv[i], It_S_160806[O_S_160806], int_int_unc_S_160806[O_S_160806], limit_vel_width_160806_Siv[O_S_160806], limit_velocity_160806_Siv[O_S_160806], SNR_S_160806[O_S_160806], lw_160806_Siv[O_S_160806], p_int_160806_Siv[O_S_160806], z_160806[O_S_160806], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 10

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_160806.csv')
col_si_uvb_160806 = csv.(0) ;Si IV UVB
col_o_uvb_160806 = csv.(1) ;O IV UVB
col_si_tii_160806 = csv.(2) ;Si IV TII
col_si_tii_u_160806 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_160806 = csv.(4) ;Si IV vel_width
col_si_vel_160806 = csv.(5) ;Si IV velocity
col_si_lw_160806 = csv.(6) ;Si IV lw
col_si_int_160806 = csv.(7) ;Si IV p_int
col_o_tii_160806 = csv.(8) ;O IV TII
col_o_tii_u_160806 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_160806 = csv.(10) ;O IV vel_width
col_o_vel_160806 = csv.(11) ;O IV velocity
col_o_snr_160806 = csv.(12) ;O IV SNR
col_o_lw_160806 = csv.(13) ;O IV lw
col_o_int_160806 = csv.(14) ;O IV p_int
col_s_tii_160806 = csv.(15) ;S IV TII
col_s_tii_u_160806 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_160806 = csv.(17) ;S IV vel_width
col_s_vel_160806 = csv.(18) ;S IV velocity
col_s_snr_160806 = csv.(19) ;S IV SNR
col_s_lw_160806 = csv.(20) ;S IV lw
col_s_int_160806 = csv.(21) ;S IV p_int
col_s_uvb_160806 = csv.(22) ;S IV UVB
table_limit_160806 = WHERE((col_si_uvb_160806 EQ 31049) AND (col_o_uvb_160806 EQ 31049) AND (col_si_tii_160806 GE 0.0) AND (col_si_tii_u_160806 GE 0.0) AND (col_si_vel_w_160806 GE 0.0) AND (col_si_vel_160806 GE 0.0) AND (col_o_tii_160806 GE 0.0) AND (col_o_tii_u_160806 GE 0.0) AND (col_o_vel_w_160806 GE 0.0) AND (col_o_vel_160806 GE 0.0) AND (col_o_snr_160806 GE 0.0))

ratio_limit_160806 = WHERE((col_o_snr_160806 GE 3.0) AND (col_o_snr_160806 LT 1000) AND (col_o_snr_160806 LT 1000) AND (col_o_tii_160806 GE 0.0) AND (col_si_tii_160806 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_160806[ratio_limit_160806]
PRINT, 'TII O'
PRINT, col_o_tii_160806[ratio_limit_160806]
PRINT, 'TII Si IV'
PRINT, col_si_tii_160806[ratio_limit_160806]

ratio_160806 = (col_si_tii_160806[ratio_limit_160806]/col_o_tii_160806[ratio_limit_160806])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_160806)
PRINT, ratio_160806

TII_160806 = N_ELEMENTS(ratio_160806)
PRINT, TII_160806 ;153

electron_dens_arr_160806 = DBLARR(TII_160806)

FOR i = 0, TII_160806-1 DO BEGIN
   difference_arr_160806 = ABS(si_o_ratio-ratio_160806[i])
   electron_dens_160806 = WHERE(difference_arr_160806 EQ MIN(difference_arr_160806), /NULL)
   electron_dens_arr_160806[i] = electron_dens_160806[0]
ENDFOR

PRINT, "160806"

nin_160806 = WHERE((e_density[electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_160806) ;4--0

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

e_dens_160806 = e_density[electron_dens_arr_160806]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_160806_70_1000 = WHERE((col_o_snr_160806 GE 3.0) AND (col_o_snr_160806 LT 1000) AND (col_o_tii_160806 GE 0.0) AND (col_si_tii_160806 GE 0.0) AND (col_si_vel_w_160806 GE 70.0) AND (col_si_vel_w_160806 LT 1000.0) AND (col_o_vel_w_160806 GE 70.0) AND (col_o_vel_w_160806 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_160806[ratio_limit_160806_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_160806[ratio_limit_160806_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_160806[ratio_limit_160806_70_1000]

ratio_160806_70_1000 = (col_si_tii_160806[ratio_limit_160806_70_1000]/col_o_tii_160806[ratio_limit_160806_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_160806_70_1000)
PRINT, ratio_160806_70_1000

TII_160806_70_1000 = N_ELEMENTS(ratio_160806_70_1000)
PRINT, TII_160806_70_1000 ;3

electron_dens_arr_160806_70_1000 = DBLARR(TII_160806_70_1000)

FOR i = 0, TII_160806_70_1000-1 DO BEGIN
   difference_arr_160806_70_1000 = ABS(si_o_ratio-ratio_160806_70_1000[i])
   electron_dens_160806_70_1000 = WHERE(difference_arr_160806_70_1000 EQ MIN(difference_arr_160806_70_1000), /NULL)
   electron_dens_arr_160806_70_1000[i] = electron_dens_160806_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_160806_70_1000]

PRINT, "160806_70_1000"

nin_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_160806_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_160806_70_1000) ;0

ten_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_160806_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_160806_70_1000) ;0

elev_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_160806_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_160806_70_1000) ;0

twel_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_160806_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_160806_70_1000) ;3

thirt_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_160806_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_160806_70_1000) ;0

four_160806_70_1000 = WHERE((e_density[electron_dens_arr_160806_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_160806_70_1000) ;0

e_dens_160806_70_1000 = e_density[electron_dens_arr_160806_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_160806_40_70 = WHERE((col_o_snr_160806 GE 3.0) AND (col_o_snr_160806 LT 1000) AND (col_o_tii_160806 GE 0.0) AND (col_si_tii_160806 GE 0.0) AND (col_si_vel_w_160806 GE 40.0) AND (col_si_vel_w_160806 LT 70.0) AND (col_o_vel_w_160806 GE 40.0) AND (col_o_vel_w_160806 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_160806[ratio_limit_160806_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_160806[ratio_limit_160806_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_160806[ratio_limit_160806_40_70]

ratio_160806_40_70 = (col_si_tii_160806[ratio_limit_160806_40_70]/col_o_tii_160806[ratio_limit_160806_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_160806_40_70)
PRINT, ratio_160806_40_70

TII_160806_40_70 = N_ELEMENTS(ratio_160806_40_70)
PRINT, TII_160806_40_70 ;16

electron_dens_arr_160806_40_70 = DBLARR(TII_160806_40_70)

FOR i = 0, TII_160806_40_70-1 DO BEGIN
   difference_arr_160806_40_70 = ABS(si_o_ratio-ratio_160806_40_70[i])
   electron_dens_160806_40_70 = WHERE(difference_arr_160806_40_70 EQ MIN(difference_arr_160806_40_70), /NULL)
   electron_dens_arr_160806_40_70[i] = electron_dens_160806_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_160806_40_70]

PRINT, "160806_40_70"

nin_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_160806_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_160806_40_70) ;0

ten_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_160806_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_160806_40_70) ;0

elev_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_160806_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_160806_40_70) ;13

twel_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_160806_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_160806_40_70) ;3

thirt_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_160806_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_160806_40_70) ;0

four_160806_40_70 = WHERE((e_density[electron_dens_arr_160806_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_160806_40_70) ;0

e_dens_160806_40_70 = e_density[electron_dens_arr_160806_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_160806_40 = WHERE((col_o_snr_160806 GE 3.0) AND (col_o_snr_160806 LT 1000) AND (col_o_tii_160806 GE 0.0) AND (col_si_tii_160806 GE 0.0) AND (col_si_vel_w_160806 GE 0.0) AND (col_si_vel_w_160806 LT 40.0) AND (col_o_vel_w_160806 GE 0.0) AND (col_o_vel_w_160806 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_160806 = CORRELATE(lw_160806,e_density[electron_dens_arr_160806])
PRINT, result_160806 ;0.23068631

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_160806, e_density[electron_dens_arr_160806], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_160806, e_density[electron_dens_arr_160806], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_160806, p_int_160806, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;163205

y_163205 = array_163205_O[*,5]
;PRINT, N_ELEMENTS(y_163205) ;486
x_163205 = array_163205_Si[*,4]
;PRINT, N_ELEMENTS(x_163205) ;522
z_163205 = array_163205_S[*,5]
;PRINT, N_ELEMENTS(z_163205) ;411
openw, 11, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_163205.csv'
FOR i = 0, N_ELEMENTS(y_163205)-1 DO BEGIN
   O_Si_163205 = WHERE((x_163205 EQ y_163205[i]),count)
   O_S_163205 = WHERE((z_163205 EQ y_163205[i]),count)
   IF (SNR_O_163205[i] EQ 'Infinity') THEN SNR_O_163205[i] = -999
   IF (SNR_S_163205[O_S_163205] EQ 'Infinity') THEN SNR_S_163205[O_S_163205] = -999
   IF (count EQ 0) THEN z_163205[O_S_163205] = -999
   IF (count EQ 0) THEN It_S_163205[O_S_163205] = -999
   IF (count EQ 0) THEN int_int_unc_S_163205[O_S_163205] = -999
   IF (count EQ 0) THEN limit_vel_width_163205_Siv[O_S_163205] = -999
   IF (count EQ 0) THEN limit_velocity_163205_Siv[O_S_163205] = -999
   IF (count EQ 0) THEN SNR_S_163205[O_S_163205] = -999
   IF (count EQ 0) THEN lw_163205_Siv[O_S_163205] = -999
   IF (count EQ 0) THEN p_int_163205_Siv[O_S_163205] = -999
   printf, 11, x_163205[O_Si_163205], y_163205[i], It_Si_163205[O_Si_163205], int_int_unc_Si_163205[O_Si_163205], limit_vel_width_163205[O_Si_163205], limit_velocity_163205[O_Si_163205], lw_163205[O_Si_163205], p_int_163205[O_Si_163205], It_O_163205[i], int_int_unc_O_163205[i], limit_vel_width_163205_Oiv[i], limit_velocity_163205_Oiv[i], SNR_O_163205[i], lw_163205_Oiv[i], p_int_163205_Oiv[i], It_S_163205[O_S_163205], int_int_unc_S_163205[O_S_163205], limit_vel_width_163205_Siv[O_S_163205], limit_velocity_163205_Siv[O_S_163205], SNR_S_163205[O_S_163205], lw_163205_Siv[O_S_163205], p_int_163205_Siv[O_S_163205], z_163205[O_S_163205], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 11

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_163205.csv')
col_si_uvb_163205 = csv.(0) ;Si IV UVB
col_o_uvb_163205 = csv.(1) ;O IV UVB
col_si_tii_163205 = csv.(2) ;Si IV TII
col_si_tii_u_163205 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_163205 = csv.(4) ;Si IV vel_width
col_si_vel_163205 = csv.(5) ;Si IV velocity
col_si_lw_163205 = csv.(6) ;Si IV lw
col_si_int_163205 = csv.(7) ;Si IV p_int
col_o_tii_163205 = csv.(8) ;O IV TII
col_o_tii_u_163205 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_163205 = csv.(10) ;O IV vel_width
col_o_vel_163205 = csv.(11) ;O IV velocity
col_o_snr_163205 = csv.(12) ;O IV SNR
col_o_lw_163205 = csv.(13) ;O IV lw
col_o_int_163205 = csv.(14) ;O IV p_int
col_s_tii_163205 = csv.(15) ;S IV TII
col_s_tii_u_163205 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_163205 = csv.(17) ;S IV vel_width
col_s_vel_163205 = csv.(18) ;S IV velocity
col_s_snr_163205 = csv.(19) ;S IV SNR
col_s_lw_163205 = csv.(20) ;S IV lw
col_s_int_163205 = csv.(21) ;S IV p_int
col_s_uvb_163205 = csv.(22) ;S IV UVB
table_limit_163205 = WHERE((col_si_uvb_163205 EQ 31049) AND (col_o_uvb_163205 EQ 31049) AND (col_si_tii_163205 GE 0.0) AND (col_si_tii_u_163205 GE 0.0) AND (col_si_vel_w_163205 GE 0.0) AND (col_si_vel_163205 GE 0.0) AND (col_o_tii_163205 GE 0.0) AND (col_o_tii_u_163205 GE 0.0) AND (col_o_vel_w_163205 GE 0.0) AND (col_o_vel_163205 GE 0.0) AND (col_o_snr_163205 GE 0.0))

ratio_limit_163205 = WHERE((col_o_snr_163205 GE 3.0) AND (col_o_snr_163205 LT 1000) AND (col_o_snr_163205 LT 1000) AND (col_o_tii_163205 GE 0.0) AND (col_si_tii_163205 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_163205[ratio_limit_163205]
PRINT, 'TII O'
PRINT, col_o_tii_163205[ratio_limit_163205]
PRINT, 'TII Si IV'
PRINT, col_si_tii_163205[ratio_limit_163205]

ratio_163205 = (col_si_tii_163205[ratio_limit_163205]/col_o_tii_163205[ratio_limit_163205])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_163205)
PRINT, ratio_163205

TII_163205 = N_ELEMENTS(ratio_163205)
PRINT, TII_163205 ;66

electron_dens_arr_163205 = DBLARR(TII_163205)

FOR i = 0, TII_163205-1 DO BEGIN
   difference_arr_163205 = ABS(si_o_ratio-ratio_163205[i])
   electron_dens_163205 = WHERE(difference_arr_163205 EQ MIN(difference_arr_163205), /NULL)
   electron_dens_arr_163205[i] = electron_dens_163205[0]
ENDFOR

PRINT, "163205"

nin_163205 = WHERE((e_density[electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_163205) ;10--0

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

e_dens_163205 = e_density[electron_dens_arr_163205]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

;none here!
ratio_limit_163205_70_1000 = WHERE((col_o_snr_163205 GE 3.0) AND (col_o_snr_163205 LT 1000) AND (col_o_tii_163205 GE 0.0) AND (col_si_tii_163205 GE 0.0) AND (col_si_vel_w_163205 GE 70.0) AND (col_si_vel_w_163205 LT 1000.0) AND (col_o_vel_w_163205 GE 70.0) AND (col_o_vel_w_163205 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_163205[ratio_limit_163205_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_163205[ratio_limit_163205_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_163205[ratio_limit_163205_70_1000]

ratio_163205_70_1000 = (col_si_tii_163205[ratio_limit_163205_70_1000]/col_o_tii_163205[ratio_limit_163205_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_163205_70_1000)
PRINT, ratio_163205_70_1000

TII_163205_70_1000 = N_ELEMENTS(ratio_163205_70_1000)
PRINT, TII_163205_70_1000 ;1

electron_dens_arr_163205_70_1000 = DBLARR(TII_163205_70_1000)

FOR i = 0, TII_163205_70_1000-1 DO BEGIN
   difference_arr_163205_70_1000 = ABS(si_o_ratio-ratio_163205_70_1000[i])
   electron_dens_163205_70_1000 = WHERE(difference_arr_163205_70_1000 EQ MIN(difference_arr_163205_70_1000), /NULL)
   electron_dens_arr_163205_70_1000[i] = electron_dens_163205_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_163205_70_1000]

PRINT, "163205_70_1000"

nin_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_163205_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_163205_70_1000) ;0

ten_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_163205_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_163205_70_1000) ;0

elev_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_163205_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_163205_70_1000) ;1

twel_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_163205_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_163205_70_1000) ;0

thirt_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_163205_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_163205_70_1000) ;0

four_163205_70_1000 = WHERE((e_density[electron_dens_arr_163205_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_163205_70_1000) ;0

e_dens_163205_70_1000 = e_density[electron_dens_arr_163205_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_163205_40_70 = WHERE((col_o_snr_163205 GE 3.0) AND (col_o_snr_163205 LT 1000) AND (col_o_tii_163205 GE 0.0) AND (col_si_tii_163205 GE 0.0) AND (col_si_vel_w_163205 GE 40.0) AND (col_si_vel_w_163205 LT 70.0) AND (col_o_vel_w_163205 GE 40.0) AND (col_o_vel_w_163205 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_163205[ratio_limit_163205_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_163205[ratio_limit_163205_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_163205[ratio_limit_163205_40_70]

ratio_163205_40_70 = (col_si_tii_163205[ratio_limit_163205_40_70]/col_o_tii_163205[ratio_limit_163205_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_163205_40_70)
PRINT, ratio_163205_40_70

TII_163205_40_70 = N_ELEMENTS(ratio_163205_40_70)
PRINT, TII_163205_40_70 ;22

electron_dens_arr_163205_40_70 = DBLARR(TII_163205_40_70)

FOR i = 0, TII_163205_40_70-1 DO BEGIN
   difference_arr_163205_40_70 = ABS(si_o_ratio-ratio_163205_40_70[i])
   electron_dens_163205_40_70 = WHERE(difference_arr_163205_40_70 EQ MIN(difference_arr_163205_40_70), /NULL)
   electron_dens_arr_163205_40_70[i] = electron_dens_163205_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_163205_40_70]

PRINT, "163205_40_70"

nin_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_163205_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_163205_40_70) ;0

ten_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_163205_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_163205_40_70) ;0

elev_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_163205_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_163205_40_70) ;20

twel_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_163205_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_163205_40_70) ;2

thirt_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_163205_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_163205_40_70) ;0

four_163205_40_70 = WHERE((e_density[electron_dens_arr_163205_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_163205_40_70) ;0

e_dens_163205_40_70 = e_density[electron_dens_arr_163205_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_163205_40 = WHERE((col_o_snr_163205 GE 3.0) AND (col_o_snr_163205 LT 1000) AND (col_o_tii_163205 GE 0.0) AND (col_si_tii_163205 GE 0.0) AND (col_si_vel_w_163205 GE 0.0) AND (col_si_vel_w_163205 LT 40.0) AND (col_o_vel_w_163205 GE 0.0) AND (col_o_vel_w_163205 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_163205 = CORRELATE(lw_163205,e_density[electron_dens_arr_163205])
PRINT, result_163205 ;0.19907853

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_163205, e_density[electron_dens_arr_163205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_163205, e_density[electron_dens_arr_163205], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_163205, p_int_163205, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;174905

y_174905 = array_174905_O[*,5]
;PRINT, N_ELEMENTS(y_174905) ;713
x_174905 = array_174905_Si[*,4]
;PRINT, N_ELEMENTS(x_174905) ;760
z_174905 = array_174905_S[*,5]
;PRINT, N_ELEMENTS(z_174905) ;582
openw, 12, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_174905.csv'
FOR i = 0, N_ELEMENTS(y_174905)-1 DO BEGIN
   O_Si_174905 = WHERE((x_174905 EQ y_174905[i]),count)
   O_S_174905 = WHERE((z_174905 EQ y_174905[i]),count)
   IF (SNR_O_174905[i] EQ 'Infinity') THEN SNR_O_174905[i] = -999
   IF (SNR_S_174905[O_S_174905] EQ 'Infinity') THEN SNR_S_174905[O_S_174905] = -999
   IF (count EQ 0) THEN z_174905[O_S_174905] = -999
   IF (count EQ 0) THEN It_S_174905[O_S_174905] = -999
   IF (count EQ 0) THEN int_int_unc_S_174905[O_S_174905] = -999
   IF (count EQ 0) THEN limit_vel_width_174905_Siv[O_S_174905] = -999
   IF (count EQ 0) THEN limit_velocity_174905_Siv[O_S_174905] = -999
   IF (count EQ 0) THEN SNR_S_174905[O_S_174905] = -999
   IF (count EQ 0) THEN lw_174905_Siv[O_S_174905] = -999
   IF (count EQ 0) THEN p_int_174905_Siv[O_S_174905] = -999
   printf, 12, x_174905[O_Si_174905], y_174905[i], It_Si_174905[O_Si_174905], int_int_unc_Si_174905[O_Si_174905], limit_vel_width_174905[O_Si_174905], limit_velocity_174905[O_Si_174905], lw_174905[O_Si_174905], p_int_174905[O_Si_174905], It_O_174905[i], int_int_unc_O_174905[i], limit_vel_width_174905_Oiv[i], limit_velocity_174905_Oiv[i], SNR_O_174905[i], lw_174905_Oiv[i], p_int_174905_Oiv[i], It_S_174905[O_S_174905], int_int_unc_S_174905[O_S_174905], limit_vel_width_174905_Siv[O_S_174905], limit_velocity_174905_Siv[O_S_174905], SNR_S_174905[O_S_174905], lw_174905_Siv[O_S_174905], p_int_174905_Siv[O_S_174905], z_174905[O_S_174905], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 12

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_174905.csv')
col_si_uvb_174905 = csv.(0) ;Si IV UVB
col_o_uvb_174905 = csv.(1) ;O IV UVB
col_si_tii_174905 = csv.(2) ;Si IV TII
col_si_tii_u_174905 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_174905 = csv.(4) ;Si IV vel_width
col_si_vel_174905 = csv.(5) ;Si IV velocity
col_si_lw_174905 = csv.(6) ;Si IV lw
col_si_int_174905 = csv.(7) ;Si IV p_int
col_o_tii_174905 = csv.(8) ;O IV TII
col_o_tii_u_174905 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_174905 = csv.(10) ;O IV vel_width
col_o_vel_174905 = csv.(11) ;O IV velocity
col_o_snr_174905 = csv.(12) ;O IV SNR
col_o_lw_174905 = csv.(13) ;O IV lw
col_o_int_174905 = csv.(14) ;O IV p_int
col_s_tii_174905 = csv.(15) ;S IV TII
col_s_tii_u_174905 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_174905 = csv.(17) ;S IV vel_width
col_s_vel_174905 = csv.(18) ;S IV velocity
col_s_snr_174905 = csv.(19) ;S IV SNR
col_s_lw_174905 = csv.(20) ;S IV lw
col_s_int_174905 = csv.(21) ;S IV p_int
col_s_uvb_174905 = csv.(22) ;S IV UVB
table_limit_174905 = WHERE((col_si_uvb_174905 EQ 31049) AND (col_o_uvb_174905 EQ 31049) AND (col_si_tii_174905 GE 0.0) AND (col_si_tii_u_174905 GE 0.0) AND (col_si_vel_w_174905 GE 0.0) AND (col_si_vel_174905 GE 0.0) AND (col_o_tii_174905 GE 0.0) AND (col_o_tii_u_174905 GE 0.0) AND (col_o_vel_w_174905 GE 0.0) AND (col_o_vel_174905 GE 0.0) AND (col_o_snr_174905 GE 0.0))

ratio_limit_174905 = WHERE((col_o_snr_174905 GE 3.0) AND (col_o_snr_174905 LT 1000) AND (col_o_snr_174905 LT 1000) AND (col_o_tii_174905 GE 0.0) AND (col_si_tii_174905 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_174905[ratio_limit_174905]
PRINT, 'TII O'
PRINT, col_o_tii_174905[ratio_limit_174905]
PRINT, 'TII Si IV'
PRINT, col_si_tii_174905[ratio_limit_174905]

ratio_174905 = (col_si_tii_174905[ratio_limit_174905]/col_o_tii_174905[ratio_limit_174905])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_174905)
PRINT, ratio_174905

TII_174905 = N_ELEMENTS(ratio_174905)
PRINT, TII_174905 ;244

electron_dens_arr_174905 = DBLARR(TII_174905)

FOR i = 0, TII_174905-1 DO BEGIN
   difference_arr_174905 = ABS(si_o_ratio-ratio_174905[i])
   electron_dens_174905 = WHERE(difference_arr_174905 EQ MIN(difference_arr_174905), /NULL)
   electron_dens_arr_174905[i] = electron_dens_174905[0]
ENDFOR

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

e_dens_174905 = e_density[electron_dens_arr_174905]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_174905_70_1000 = WHERE((col_o_snr_174905 GE 3.0) AND (col_o_snr_174905 LT 1000) AND (col_o_tii_174905 GE 0.0) AND (col_si_tii_174905 GE 0.0) AND (col_si_vel_w_174905 GE 70.0) AND (col_si_vel_w_174905 LT 1000.0) AND (col_o_vel_w_174905 GE 70.0) AND (col_o_vel_w_174905 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_174905[ratio_limit_174905_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_174905[ratio_limit_174905_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_174905[ratio_limit_174905_70_1000]

ratio_174905_70_1000 = (col_si_tii_174905[ratio_limit_174905_70_1000]/col_o_tii_174905[ratio_limit_174905_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_174905_70_1000)
PRINT, ratio_174905_70_1000

TII_174905_70_1000 = N_ELEMENTS(ratio_174905_70_1000)
PRINT, TII_174905_70_1000 ;8

electron_dens_arr_174905_70_1000 = DBLARR(TII_174905_70_1000)

FOR i = 0, TII_174905_70_1000-1 DO BEGIN
   difference_arr_174905_70_1000 = ABS(si_o_ratio-ratio_174905_70_1000[i])
   electron_dens_174905_70_1000 = WHERE(difference_arr_174905_70_1000 EQ MIN(difference_arr_174905_70_1000), /NULL)
   electron_dens_arr_174905_70_1000[i] = electron_dens_174905_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_174905_70_1000]

PRINT, "174905_70_1000"

nin_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_174905_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_174905_70_1000) ;0

ten_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_174905_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_174905_70_1000) ;0

elev_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_174905_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_174905_70_1000) ;6

twel_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_174905_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_174905_70_1000) ;2

thirt_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_174905_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_174905_70_1000) ;0

four_174905_70_1000 = WHERE((e_density[electron_dens_arr_174905_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_174905_70_1000) ;0

e_dens_174905_70_1000 = e_density[electron_dens_arr_174905_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_174905_40_70 = WHERE((col_o_snr_174905 GE 3.0) AND (col_o_snr_174905 LT 1000) AND (col_o_tii_174905 GE 0.0) AND (col_si_tii_174905 GE 0.0) AND (col_si_vel_w_174905 GE 40.0) AND (col_si_vel_w_174905 LT 70.0) AND (col_o_vel_w_174905 GE 40.0) AND (col_o_vel_w_174905 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_174905[ratio_limit_174905_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_174905[ratio_limit_174905_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_174905[ratio_limit_174905_40_70]

ratio_174905_40_70 = (col_si_tii_174905[ratio_limit_174905_40_70]/col_o_tii_174905[ratio_limit_174905_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_174905_40_70)
PRINT, ratio_174905_40_70

TII_174905_40_70 = N_ELEMENTS(ratio_174905_40_70)
PRINT, TII_174905_40_70 ;30

electron_dens_arr_174905_40_70 = DBLARR(TII_174905_40_70)

FOR i = 0, TII_174905_40_70-1 DO BEGIN
   difference_arr_174905_40_70 = ABS(si_o_ratio-ratio_174905_40_70[i])
   electron_dens_174905_40_70 = WHERE(difference_arr_174905_40_70 EQ MIN(difference_arr_174905_40_70), /NULL)
   electron_dens_arr_174905_40_70[i] = electron_dens_174905_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_174905_40_70]

PRINT, "174905_40_70"

nin_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_174905_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_174905_40_70) ;0

ten_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_174905_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_174905_40_70) ;0

elev_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_174905_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_174905_40_70) ;24

twel_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_174905_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_174905_40_70) ;6

thirt_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_174905_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_174905_40_70) ;0

four_174905_40_70 = WHERE((e_density[electron_dens_arr_174905_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_174905_40_70) ;0

e_dens_174905_40_70 = e_density[electron_dens_arr_174905_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_174905_40 = WHERE((col_o_snr_174905 GE 3.0) AND (col_o_snr_174905 LT 1000) AND (col_o_tii_174905 GE 0.0) AND (col_si_tii_174905 GE 0.0) AND (col_si_vel_w_174905 GE 0.0) AND (col_si_vel_w_174905 LT 40.0) AND (col_o_vel_w_174905 GE 0.0) AND (col_o_vel_w_174905 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_174905 = CORRELATE(lw_174905,e_density[electron_dens_arr_174905])
PRINT, result_174905 ;0.014578854

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_174905, e_density[electron_dens_arr_174905], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_174905, e_density[electron_dens_arr_174905], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_174905, p_int_174905, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;181205

y_181205 = array_181205_O[*,5]
;PRINT, N_ELEMENTS(y_181205) ;352
x_181205 = array_181205_Si[*,4]
;PRINT, N_ELEMENTS(x_181205) ;388
z_181205 = array_181205_S[*,5]
;PRINT, N_ELEMENTS(z_181205) ;268
openw, 13, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_181205.csv'
FOR i = 0, N_ELEMENTS(y_181205)-1 DO BEGIN
   O_Si_181205 = WHERE((x_181205 EQ y_181205[i]),count)
   O_S_181205 = WHERE((z_181205 EQ y_181205[i]),count)
   IF (SNR_O_181205[i] EQ 'Infinity') THEN SNR_O_181205[i] = -999
   IF (SNR_S_181205[O_S_181205] EQ 'Infinity') THEN SNR_S_181205[O_S_181205] = -999
   IF (count EQ 0) THEN z_181205[O_S_181205] = -999
   IF (count EQ 0) THEN It_S_181205[O_S_181205] = -999
   IF (count EQ 0) THEN int_int_unc_S_181205[O_S_181205] = -999
   IF (count EQ 0) THEN limit_vel_width_181205_Siv[O_S_181205] = -999
   IF (count EQ 0) THEN limit_velocity_181205_Siv[O_S_181205] = -999
   IF (count EQ 0) THEN SNR_S_181205[O_S_181205] = -999
   IF (count EQ 0) THEN lw_181205_Siv[O_S_181205] = -999
   IF (count EQ 0) THEN p_int_181205_Siv[O_S_181205] = -999
   printf, 13, x_181205[O_Si_181205], y_181205[i], It_Si_181205[O_Si_181205], int_int_unc_Si_181205[O_Si_181205], limit_vel_width_181205[O_Si_181205], limit_velocity_181205[O_Si_181205], lw_181205[O_Si_181205], p_int_181205[O_Si_181205], It_O_181205[i], int_int_unc_O_181205[i], limit_vel_width_181205_Oiv[i], limit_velocity_181205_Oiv[i], SNR_O_181205[i], lw_181205_Oiv[i], p_int_181205_Oiv[i], It_S_181205[O_S_181205], int_int_unc_S_181205[O_S_181205], limit_vel_width_181205_Siv[O_S_181205], limit_velocity_181205_Siv[O_S_181205], SNR_S_181205[O_S_181205], lw_181205_Siv[O_S_181205], p_int_181205_Siv[O_S_181205], z_181205[O_S_181205], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 13

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_181205.csv')
col_si_uvb_181205 = csv.(0) ;Si IV UVB
col_o_uvb_181205 = csv.(1) ;O IV UVB
col_si_tii_181205 = csv.(2) ;Si IV TII
col_si_tii_u_181205 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_181205 = csv.(4) ;Si IV vel_width
col_si_vel_181205 = csv.(5) ;Si IV velocity
col_si_lw_181205 = csv.(6) ;Si IV lw
col_si_int_181205 = csv.(7) ;Si IV p_int
col_o_tii_181205 = csv.(8) ;O IV TII
col_o_tii_u_181205 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_181205 = csv.(10) ;O IV vel_width
col_o_vel_181205 = csv.(11) ;O IV velocity
col_o_snr_181205 = csv.(12) ;O IV SNR
col_o_lw_181205 = csv.(13) ;O IV lw
col_o_int_181205 = csv.(14) ;O IV p_int
col_s_tii_181205 = csv.(15) ;S IV TII
col_s_tii_u_181205 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_181205 = csv.(17) ;S IV vel_width
col_s_vel_181205 = csv.(18) ;S IV velocity
col_s_snr_181205 = csv.(19) ;S IV SNR
col_s_lw_181205 = csv.(20) ;S IV lw
col_s_int_181205 = csv.(21) ;S IV p_int
col_s_uvb_181205 = csv.(22) ;S IV UVB
table_limit_181205 = WHERE((col_si_uvb_181205 EQ 31049) AND (col_o_uvb_181205 EQ 31049) AND (col_si_tii_181205 GE 0.0) AND (col_si_tii_u_181205 GE 0.0) AND (col_si_vel_w_181205 GE 0.0) AND (col_si_vel_181205 GE 0.0) AND (col_o_tii_181205 GE 0.0) AND (col_o_tii_u_181205 GE 0.0) AND (col_o_vel_w_181205 GE 0.0) AND (col_o_vel_181205 GE 0.0) AND (col_o_snr_181205 GE 0.0))

ratio_limit_181205 = WHERE((col_o_snr_181205 GE 3.0) AND (col_o_snr_181205 LT 1000) AND (col_o_snr_181205 LT 1000) AND (col_o_tii_181205 GE 0.0) AND (col_si_tii_181205 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_181205[ratio_limit_181205]
PRINT, 'TII O'
PRINT, col_o_tii_181205[ratio_limit_181205]
PRINT, 'TII Si IV'
PRINT, col_si_tii_181205[ratio_limit_181205]

ratio_181205 = (col_si_tii_181205[ratio_limit_181205]/col_o_tii_181205[ratio_limit_181205])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_181205)
PRINT, ratio_181205

TII_181205 = N_ELEMENTS(ratio_181205)
PRINT, TII_181205 ;71

electron_dens_arr_181205 = DBLARR(TII_181205)

FOR i = 0, TII_181205-1 DO BEGIN
   difference_arr_181205 = ABS(si_o_ratio-ratio_181205[i])
   electron_dens_181205 = WHERE(difference_arr_181205 EQ MIN(difference_arr_181205), /NULL)
   electron_dens_arr_181205[i] = electron_dens_181205[0]
ENDFOR

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

e_dens_181205 = e_density[electron_dens_arr_181205]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

;none here
ratio_limit_181205_70_1000 = WHERE((col_o_snr_181205 GE 3.0) AND (col_o_snr_181205 LT 1000) AND (col_o_tii_181205 GE 0.0) AND (col_si_tii_181205 GE 0.0) AND (col_si_vel_w_181205 GE 70.0) AND (col_si_vel_w_181205 LT 1000.0) AND (col_o_vel_w_181205 GE 70.0) AND (col_o_vel_w_181205 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_181205[ratio_limit_181205_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_181205[ratio_limit_181205_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_181205[ratio_limit_181205_70_1000]

ratio_181205_70_1000 = (col_si_tii_181205[ratio_limit_181205_70_1000]/col_o_tii_181205[ratio_limit_181205_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_181205_70_1000)
PRINT, ratio_181205_70_1000

TII_181205_70_1000 = N_ELEMENTS(ratio_181205_70_1000)
PRINT, TII_181205_70_1000 ;1

electron_dens_arr_181205_70_1000 = DBLARR(TII_181205_70_1000)

FOR i = 0, TII_181205_70_1000-1 DO BEGIN
   difference_arr_181205_70_1000 = ABS(si_o_ratio-ratio_181205_70_1000[i])
   electron_dens_181205_70_1000 = WHERE(difference_arr_181205_70_1000 EQ MIN(difference_arr_181205_70_1000), /NULL)
   electron_dens_arr_181205_70_1000[i] = electron_dens_181205_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_181205_70_1000]

PRINT, "181205_70_1000"

nin_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_181205_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_181205_70_1000) ;0

ten_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_181205_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_181205_70_1000) ;0

elev_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_181205_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_181205_70_1000) ;0

twel_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_181205_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_181205_70_1000) ;1

thirt_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_181205_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_181205_70_1000) ;0

four_181205_70_1000 = WHERE((e_density[electron_dens_arr_181205_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_181205_70_1000) ;0

e_dens_181205_70_1000 = e_density[electron_dens_arr_181205_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_181205_40_70 = WHERE((col_o_snr_181205 GE 3.0) AND (col_o_snr_181205 LT 1000) AND (col_o_tii_181205 GE 0.0) AND (col_si_tii_181205 GE 0.0) AND (col_si_vel_w_181205 GE 40.0) AND (col_si_vel_w_181205 LT 70.0) AND (col_o_vel_w_181205 GE 40.0) AND (col_o_vel_w_181205 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_181205[ratio_limit_181205_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_181205[ratio_limit_181205_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_181205[ratio_limit_181205_40_70]

ratio_181205_40_70 = (col_si_tii_181205[ratio_limit_181205_40_70]/col_o_tii_181205[ratio_limit_181205_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_181205_40_70)
PRINT, ratio_181205_40_70

TII_181205_40_70 = N_ELEMENTS(ratio_181205_40_70)
PRINT, TII_181205_40_70 ;12

electron_dens_arr_181205_40_70 = DBLARR(TII_181205_40_70)

FOR i = 0, TII_181205_40_70-1 DO BEGIN
   difference_arr_181205_40_70 = ABS(si_o_ratio-ratio_181205_40_70[i])
   electron_dens_181205_40_70 = WHERE(difference_arr_181205_40_70 EQ MIN(difference_arr_181205_40_70), /NULL)
   electron_dens_arr_181205_40_70[i] = electron_dens_181205_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_181205_40_70]

PRINT, "181205_40_70"

nin_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_181205_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_181205_40_70) ;0

ten_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_181205_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_181205_40_70) ;0

elev_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_181205_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_181205_40_70) ;2

twel_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_181205_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_181205_40_70) ;10

thirt_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_181205_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_181205_40_70) ;0

four_181205_40_70 = WHERE((e_density[electron_dens_arr_181205_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_181205_40_70) ;0

e_dens_181205_40_70 = e_density[electron_dens_arr_181205_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_181205_40 = WHERE((col_o_snr_181205 GE 3.0) AND (col_o_snr_181205 LT 1000) AND (col_o_tii_181205 GE 0.0) AND (col_si_tii_181205 GE 0.0) AND (col_si_vel_w_181205 GE 0.0) AND (col_si_vel_w_181205 LT 40.0) AND (col_o_vel_w_181205 GE 0.0) AND (col_o_vel_w_181205 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_181205 = CORRELATE(lw_181205,e_density[electron_dens_arr_181205])
PRINT, result_181205 ;-0.11396399

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_181205, e_density[electron_dens_arr_181205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_181205, e_density[electron_dens_arr_181205], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_181205, p_int_181205, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;201925

y_201925 = array_201925_O[*,5]
;PRINT, N_ELEMENTS(y_201925) ;578
x_201925 = array_201925_Si[*,4]
;PRINT, N_ELEMENTS(x_201925) ;660
z_201925 = array_201925_S[*,5]
;PRINT, N_ELEMENTS(z_201925) ;478
openw, 14, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_201925.csv'
FOR i = 0, N_ELEMENTS(y_201925)-1 DO BEGIN
   O_Si_201925= WHERE((x_201925 EQ y_201925[i]),count)
   O_S_201925 = WHERE((z_201925 EQ y_201925[i]),count)
   IF (SNR_O_201925[i] EQ 'Infinity') THEN SNR_O_201925[i] = -999
   IF (SNR_S_201925[O_S_201925] EQ 'Infinity') THEN SNR_S_201925[O_S_201925] = -999
   IF (count EQ 0) THEN z_201925[O_S_201925] = -999
   IF (count EQ 0) THEN It_S_201925[O_S_201925] = -999
   IF (count EQ 0) THEN int_int_unc_S_201925[O_S_201925] = -999
   IF (count EQ 0) THEN limit_vel_width_201925_Siv[O_S_201925] = -999
   IF (count EQ 0) THEN limit_velocity_201925_Siv[O_S_201925] = -999
   IF (count EQ 0) THEN SNR_S_201925[O_S_201925] = -999
   IF (count EQ 0) THEN lw_201925_Siv[O_S_201925] = -999
   IF (count EQ 0) THEN p_int_201925_Siv[O_S_201925] = -999
   printf, 14, x_201925[O_Si_201925], y_201925[i], It_Si_201925[O_Si_201925], int_int_unc_Si_201925[O_Si_201925], limit_vel_width_201925[O_Si_201925], limit_velocity_201925[O_Si_201925], lw_201925[O_Si_201925], p_int_201925[O_Si_201925], It_O_201925[i], int_int_unc_O_201925[i], limit_vel_width_201925_Oiv[i], limit_velocity_201925_Oiv[i], SNR_O_201925[i], lw_201925_Oiv[i], p_int_201925_Oiv[i], It_S_201925[O_S_201925], int_int_unc_S_201925[O_S_201925], limit_vel_width_201925_Siv[O_S_201925], limit_velocity_201925_Siv[O_S_201925], SNR_S_201925[O_S_201925], lw_201925_Siv[O_S_201925], p_int_201925_Siv[O_S_201925], z_201925[O_S_201925], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 14

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_201925.csv')
col_si_uvb_201925 = csv.(0) ;Si IV UVB
col_o_uvb_201925 = csv.(1) ;O IV UVB
col_si_tii_201925 = csv.(2) ;Si IV TII
col_si_tii_u_201925 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_201925 = csv.(4) ;Si IV vel_width
col_si_vel_201925 = csv.(5) ;Si IV velocity
col_si_lw_201925 = csv.(6) ;Si IV lw
col_si_int_201925 = csv.(7) ;Si IV p_int
col_o_tii_201925 = csv.(8) ;O IV TII
col_o_tii_u_201925 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_201925 = csv.(10) ;O IV vel_width
col_o_vel_201925 = csv.(11) ;O IV velocity
col_o_snr_201925 = csv.(12) ;O IV SNR
col_o_lw_201925 = csv.(13) ;O IV lw
col_o_int_201925 = csv.(14) ;O IV p_int
col_s_tii_201925 = csv.(15) ;S IV TII
col_s_tii_u_201925 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_201925 = csv.(17) ;S IV vel_width
col_s_vel_201925 = csv.(18) ;S IV velocity
col_s_snr_201925 = csv.(19) ;S IV SNR
col_s_lw_201925 = csv.(20) ;S IV lw
col_s_int_201925 = csv.(21) ;S IV p_int
col_s_uvb_201925 = csv.(22) ;S IV UVB
table_limit_201925 = WHERE((col_si_uvb_201925 EQ 31049) AND (col_o_uvb_201925 EQ 31049) AND (col_si_tii_201925 GE 0.0) AND (col_si_tii_u_201925 GE 0.0) AND (col_si_vel_w_201925 GE 0.0) AND (col_si_vel_201925 GE 0.0) AND (col_o_tii_201925 GE 0.0) AND (col_o_tii_u_201925 GE 0.0) AND (col_o_vel_w_201925 GE 0.0) AND (col_o_vel_201925 GE 0.0) AND (col_o_snr_201925 GE 0.0))

ratio_limit_201925 = WHERE((col_o_snr_201925 GE 3.0) AND (col_o_snr_201925 LT 1000) AND (col_o_snr_201925 LT 1000) AND (col_o_tii_201925 GE 0.0) AND (col_si_tii_201925 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_201925[ratio_limit_201925]
PRINT, 'TII O'
PRINT, col_o_tii_201925[ratio_limit_201925]
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925[ratio_limit_201925]

ratio_201925 = (col_si_tii_201925[ratio_limit_201925]/col_o_tii_201925[ratio_limit_201925])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925)
PRINT, ratio_201925

TII_201925 = N_ELEMENTS(ratio_201925)
PRINT, TII_201925 ;56

electron_dens_arr_201925 = DBLARR(TII_201925)

FOR i = 0, TII_201925-1 DO BEGIN
   difference_arr_201925 = ABS(si_o_ratio-ratio_201925[i])
   electron_dens_201925 = WHERE(difference_arr_201925 EQ MIN(difference_arr_201925), /NULL)
   electron_dens_arr_201925[i] = electron_dens_201925[0]
ENDFOR

PRINT, "201925"

nin_201925 = WHERE((e_density[electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925) ;7--0

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

e_dens_201925 = e_density[electron_dens_arr_201925]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_201925_70_1000 = WHERE((col_o_snr_201925 GE 3.0) AND (col_o_snr_201925 LT 1000) AND (col_o_tii_201925 GE 0.0) AND (col_si_tii_201925 GE 0.0) AND (col_si_vel_w_201925 GE 70.0) AND (col_si_vel_w_201925 LT 1000.0) AND (col_o_vel_w_201925 GE 70.0) AND (col_o_vel_w_201925 LT 1000.0), /NULL)
PRINT, 'SNR O'
PRINT, col_o_snr_201925[ratio_limit_201925_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_201925[ratio_limit_201925_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925[ratio_limit_201925_70_1000]

ratio_201925_70_1000 = (col_si_tii_201925[ratio_limit_201925_70_1000]/col_o_tii_201925[ratio_limit_201925_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925_70_1000)
PRINT, ratio_201925_70_1000

TII_201925_70_1000 = N_ELEMENTS(ratio_201925_70_1000)
PRINT, TII_201925_70_1000 ;1

electron_dens_arr_201925_70_1000 = DBLARR(TII_201925_70_1000)

FOR i = 0, TII_201925_70_1000-1 DO BEGIN
   difference_arr_201925_70_1000 = ABS(si_o_ratio-ratio_201925_70_1000[i])
   electron_dens_201925_70_1000 = WHERE(difference_arr_201925_70_1000 EQ MIN(difference_arr_201925_70_1000), /NULL)
   electron_dens_arr_201925_70_1000[i] = electron_dens_201925_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_201925_70_1000]

PRINT, "201925_70_1000"

nin_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925_70_1000) ;0

ten_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925_70_1000) ;0

elev_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925_70_1000) ;1

twel_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925_70_1000) ;0

thirt_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925_70_1000) ;0

four_201925_70_1000 = WHERE((e_density[electron_dens_arr_201925_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925_70_1000) ;0

e_dens_201925_70_1000 = e_density[electron_dens_arr_201925_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_201925_40_70 = WHERE((col_o_snr_201925 GE 3.0) AND (col_o_snr_201925 LT 1000) AND (col_o_tii_201925 GE 0.0) AND (col_si_tii_201925 GE 0.0) AND (col_si_vel_w_201925 GE 40.0) AND (col_si_vel_w_201925 LT 70.0) AND (col_o_vel_w_201925 GE 40.0) AND (col_o_vel_w_201925 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_201925[ratio_limit_201925_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_201925[ratio_limit_201925_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925[ratio_limit_201925_40_70]

ratio_201925_40_70 = (col_si_tii_201925[ratio_limit_201925_40_70]/col_o_tii_201925[ratio_limit_201925_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925_40_70)
PRINT, ratio_201925_40_70

TII_201925_40_70 = N_ELEMENTS(ratio_201925_40_70)
PRINT, TII_201925_40_70 ;14

electron_dens_arr_201925_40_70 = DBLARR(TII_201925_40_70)

FOR i = 0, TII_201925_40_70-1 DO BEGIN
   difference_arr_201925_40_70 = ABS(si_o_ratio-ratio_201925_40_70[i])
   electron_dens_201925_40_70 = WHERE(difference_arr_201925_40_70 EQ MIN(difference_arr_201925_40_70), /NULL)
   electron_dens_arr_201925_40_70[i] = electron_dens_201925_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_201925_40_70]

PRINT, "201925_40_70"

nin_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925_40_70) ;0

ten_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925_40_70) ;0

elev_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925_40_70) ;2

twel_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925_40_70) ;12

thirt_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925_40_70) ;0

four_201925_40_70 = WHERE((e_density[electron_dens_arr_201925_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925_40_70) ;0

e_dens_201925_40_70 = e_density[electron_dens_arr_201925_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_201925_40 = WHERE((col_o_snr_201925 GE 3.0) AND (col_o_snr_201925 LT 1000) AND (col_o_tii_201925 GE 0.0) AND (col_si_tii_201925 GE 0.0) AND (col_si_vel_w_201925 GE 0.0) AND (col_si_vel_w_201925 LT 40.0) AND (col_o_vel_w_201925 GE 0.0) AND (col_o_vel_w_201925 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_201925 = CORRELATE(lw_201925,e_density[electron_dens_arr_201925])
PRINT, result_201925 ;-0.28457077

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_201925, e_density[electron_dens_arr_201925], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_201925, e_density[electron_dens_arr_201925], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_201925, p_int_201925, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;201925_1

y_201925_1 = array_201925_1_O[*,5]
;PRINT, N_ELEMENTS(y_201925_1) ;304
x_201925_1 = array_201925_1_Si[*,4]
;PRINT, N_ELEMENTS(x_201925_1) ;315
z_201925_1 = array_201925_1_S[*,5]
;PRINT, N_ELEMENTS(z_201925_1) ;243
openw, 15, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_201925_1.csv'
FOR i = 0, N_ELEMENTS(y_201925_1)-1 DO BEGIN
   O_Si_201925_1= WHERE((x_201925_1 EQ y_201925_1[i]),count)
   O_S_201925_1 = WHERE((z_201925_1 EQ y_201925_1[i]),count)
   IF (SNR_O_201925_1[i] EQ 'Infinity') THEN SNR_O_201925_1[i] = -999
   IF (SNR_S_201925_1[O_S_201925_1] EQ 'Infinity') THEN SNR_S_201925_1[O_S_201925_1] = -999
   IF (count EQ 0) THEN z_201925_1[O_S_201925_1] = -999
   IF (count EQ 0) THEN It_S_201925_1[O_S_201925_1] = -999
   IF (count EQ 0) THEN int_int_unc_S_201925_1[O_S_201925_1] = -999
   IF (count EQ 0) THEN limit_vel_width_201925_1_Siv[O_S_201925_1] = -999
   IF (count EQ 0) THEN limit_velocity_201925_1_Siv[O_S_201925_1] = -999
   IF (count EQ 0) THEN SNR_S_201925_1[O_S_201925_1] = -999
   IF (count EQ 0) THEN lw_201925_1_Siv[O_S_201925_1] = -999
   IF (count EQ 0) THEN p_int_201925_1_Siv[O_S_201925_1] = -999
   printf, 15, x_201925_1[O_Si_201925_1], y_201925_1[i], It_Si_201925_1[O_Si_201925_1], int_int_unc_Si_201925_1[O_Si_201925_1], limit_vel_width_201925_1[O_Si_201925_1], limit_velocity_201925_1[O_Si_201925_1], lw_201925_1[O_Si_201925_1], p_int_201925_1[O_Si_201925_1], It_O_201925_1[i], int_int_unc_O_201925_1[i], limit_vel_width_201925_1_Oiv[i], limit_velocity_201925_1_Oiv[i], SNR_O_201925_1[i], lw_201925_1_Oiv[i], p_int_201925_1_Oiv[i], It_S_201925_1[O_S_201925_1], int_int_unc_S_201925_1[O_S_201925_1], limit_vel_width_201925_1_Siv[O_S_201925_1], limit_velocity_201925_1_Siv[O_S_201925_1], SNR_S_201925_1[O_S_201925_1], lw_201925_1_Siv[O_S_201925_1], p_int_201925_1_Siv[O_S_201925_1], z_201925_1[O_S_201925_1], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 15

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_201925_1.csv')
col_si_uvb_201925_1 = csv.(0) ;Si IV UVB
col_o_uvb_201925_1 = csv.(1) ;O IV UVB
col_si_tii_201925_1 = csv.(2) ;Si IV TII
col_si_tii_u_201925_1 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_201925_1 = csv.(4) ;Si IV vel_width
col_si_vel_201925_1 = csv.(5) ;Si IV velocity
col_si_lw_201925_1 = csv.(6) ;Si IV lw
col_si_int_201925_1 = csv.(7) ;Si IV p_int
col_o_tii_201925_1= csv.(8) ;O IV TII
col_o_tii_u_201925_1 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_201925_1 = csv.(10) ;O IV vel_width
col_o_vel_201925_1 = csv.(11) ;O IV velocity
col_o_snr_201925_1 = csv.(12) ;O IV SNR
col_o_lw_201925_1 = csv.(13) ;O IV lw
col_o_int_201925_1 = csv.(14) ;O IV p_int
col_s_tii_201925_1 = csv.(15) ;S IV TII
col_s_tii_u_201925_1 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_201925_1 = csv.(17) ;S IV vel_width
col_s_vel_201925_1 = csv.(18) ;S IV velocity
col_s_snr_201925_1 = csv.(19) ;S IV SNR
col_s_lw_201925_1 = csv.(20) ;S IV lw
col_s_int_201925_1 = csv.(21) ;S IV p_int
col_s_uvb_201925_1 = csv.(22) ;S IV UVB
table_limit_201925_1 = WHERE((col_si_uvb_201925_1 EQ 31049) AND (col_o_uvb_201925_1 EQ 31049) AND (col_si_tii_201925_1 GE 0.0) AND (col_si_tii_u_201925_1 GE 0.0) AND (col_si_vel_w_201925_1 GE 0.0) AND (col_si_vel_201925_1 GE 0.0) AND (col_o_tii_201925_1 GE 0.0) AND (col_o_tii_u_201925_1 GE 0.0) AND (col_o_vel_w_201925_1 GE 0.0) AND (col_o_vel_201925_1 GE 0.0) AND (col_o_snr_201925_1 GE 0.0))

ratio_limit_201925_1 = WHERE((col_o_snr_201925_1 GE 3.0) AND (col_o_snr_201925_1 LT 1000) AND (col_o_snr_201925_1 LT 1000) AND (col_o_tii_201925_1 GE 0.0) AND (col_si_tii_201925_1 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_201925_1[ratio_limit_201925_1]
PRINT, 'TII O'
PRINT, col_o_tii_201925_1[ratio_limit_201925_1]
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925_1[ratio_limit_201925_1]

ratio_201925_1 = (col_si_tii_201925_1[ratio_limit_201925_1]/col_o_tii_201925_1[ratio_limit_201925_1])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925_1)
PRINT, ratio_201925_1

TII_201925_1 = N_ELEMENTS(ratio_201925_1)
PRINT, TII_201925_1 ;58

electron_dens_arr_201925_1 = DBLARR(TII_201925_1)

FOR i = 0, TII_201925_1-1 DO BEGIN
   difference_arr_201925_1 = ABS(si_o_ratio-ratio_201925_1[i])
   electron_dens_201925_1 = WHERE(difference_arr_201925_1 EQ MIN(difference_arr_201925_1), /NULL)
   electron_dens_arr_201925_1[i] = electron_dens_201925_1[0]
ENDFOR

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

e_dens_201925_1 = e_density[electron_dens_arr_201925_1]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

;none here
ratio_limit_201925_1_70_1000 = WHERE((col_o_snr_201925_1 GE 3.0) AND (col_o_snr_201925_1 LT 1000) AND (col_o_tii_201925_1 GE 0.0) AND (col_si_tii_201925_1 GE 0.0) AND (col_si_vel_w_201925_1 GE 70.0) AND (col_si_vel_w_201925_1 LT 1000.0) AND (col_o_vel_w_201925_1 GE 70.0) AND (col_o_vel_w_201925_1 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_201925_1[ratio_limit_201925_1_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_201925_1[ratio_limit_201925_1_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925_1[ratio_limit_201925_1_70_1000]

ratio_201925_1_70_1000 = (col_si_tii[ratio_limit_201925_1_70_1000]/col_o_tii[ratio_limit_201925_1_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925_1_70_1000)
PRINT, ratio_201925_1_70_1000

TII_201925_1_70_1000 = N_ELEMENTS(ratio_201925_1_70_1000)
PRINT, TII_201925_1_70_1000 ;1

electron_dens_arr_201925_1_70_1000 = DBLARR(TII_201925_1_70_1000)

FOR i = 0, TII_201925_1_70_1000-1 DO BEGIN
   difference_arr_201925_1_70_1000 = ABS(si_o_ratio-ratio_201925_1_70_1000[i])
   electron_dens_201925_1_70_1000 = WHERE(difference_arr_201925_1_70_1000 EQ MIN(difference_arr_201925_1_70_1000), /NULL)
   electron_dens_arr_201925_1_70_1000[i] = electron_dens_201925_1_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_201925_1_70_1000]

PRINT, "201925_1_70_1000"

nin_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925_1_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925_1_70_1000) ;0

ten_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925_1_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925_1_70_1000) ;0

elev_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925_1_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925_1_70_1000) ;0

twel_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925_1_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925_1_70_1000) ;1

thirt_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925_1_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925_1_70_1000) ;0

four_201925_1_70_1000 = WHERE((e_density[electron_dens_arr_201925_1_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925_1_70_1000) ;0

e_dens_201925_1_70_1000 = e_density[electron_dens_arr_201925_1_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_201925_1_40_70 = WHERE((col_o_snr_201925_1 GE 3.0) AND (col_o_snr_201925_1 LT 1000) AND (col_o_tii_201925_1 GE 0.0) AND (col_si_tii_201925_1 GE 0.0) AND (col_si_vel_w_201925_1 GE 40.0) AND (col_si_vel_w_201925_1 LT 70.0) AND (col_o_vel_w_201925_1 GE 40.0) AND (col_o_vel_w_201925_1 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_201925_1[ratio_limit_201925_1_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_201925_1[ratio_limit_201925_1_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_201925_1[ratio_limit_201925_1_40_70]

ratio_201925_1_40_70 = (col_si_tii_201925_1[ratio_limit_201925_1_40_70]/col_o_tii_201925_1[ratio_limit_201925_1_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_201925_1_40_70)
PRINT, ratio_201925_1_40_70

TII_201925_1_40_70 = N_ELEMENTS(ratio_201925_1_40_70)
PRINT, TII_201925_1_40_70 ;3

electron_dens_arr_201925_1_40_70 = DBLARR(TII_201925_1_40_70)

FOR i = 0, TII_201925_1_40_70-1 DO BEGIN
   difference_arr_201925_1_40_70 = ABS(si_o_ratio-ratio_201925_1_40_70[i])
   electron_dens_201925_1_40_70 = WHERE(difference_arr_201925_1_40_70 EQ MIN(difference_arr_201925_1_40_70), /NULL)
   electron_dens_arr_201925_1_40_70[i] = electron_dens_201925_1_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_201925_1_40_70]

PRINT, "201925_1_40_70"

nin_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_201925_1_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_201925_1_40_70) ;0

ten_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_201925_1_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_201925_1_40_70) ;0

elev_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_201925_1_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_201925_1_40_70) ;2

twel_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_201925_1_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_201925_1_40_70) ;1

thirt_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_201925_1_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_201925_1_40_70) ;0

four_201925_1_40_70 = WHERE((e_density[electron_dens_arr_201925_1_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_201925_1_40_70) ;0

e_dens_201925_1_40_70 = e_density[electron_dens_arr_201925_1_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_201925_1_40 = WHERE((col_o_snr_201925_1 GE 3.0) AND (col_o_snr_201925_1 LT 1000) AND (col_o_tii_201925_1 GE 0.0) AND (col_si_tii_201925_1 GE 0.0) AND (col_si_vel_w_201925_1 GE 0.0) AND (col_si_vel_w_201925_1 LT 40.0) AND (col_o_vel_w_201925_1 GE 0.0) AND (col_o_vel_w_201925_1 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_201925_1 = CORRELATE(lw_201925_1,e_density[electron_dens_arr_201925_1])
PRINT, result_201925_1 ;0.072535444

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_201925_1, e_density[electron_dens_arr_201925_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_201925_1, e_density[electron_dens_arr_201925_1], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_201925_1, p_int_201925_1, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;203906

y_203906 = array_203906_O[*,5]
;PRINT, N_ELEMENTS(y_203906) ;1157
x_203906 = array_203906_Si[*,4]
;PRINT, N_ELEMENTS(x_203906) ;1235
z_203906 = array_203906_S[*,5]
;PRINT, N_ELEMENTS(z_203906) ;1059
openw, 16, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_203906.csv'
FOR i = 0, N_ELEMENTS(y_203906)-1 DO BEGIN
   O_Si_203906= WHERE((x_203906 EQ y_203906[i]),count)
   O_S_203906 = WHERE((z_203906 EQ y_203906[i]),count)
   IF (SNR_O_203906[i] EQ 'Infinity') THEN SNR_O_203906[i] = -999
   IF (SNR_S_203906[O_S_203906] EQ 'Infinity') THEN SNR_S_203906[O_S_203906] = -999
   IF (count EQ 0) THEN z_203906[O_S_203906] = -999
   IF (count EQ 0) THEN It_S_203906[O_S_203906] = -999
   IF (count EQ 0) THEN int_int_unc_S_203906[O_S_203906] = -999
   IF (count EQ 0) THEN limit_vel_width_203906_Siv[O_S_203906] = -999
   IF (count EQ 0) THEN limit_velocity_203906_Siv[O_S_203906] = -999
   IF (count EQ 0) THEN SNR_S_203906[O_S_203906] = -999
   IF (count EQ 0) THEN lw_203906_Siv[O_S_203906] = -999
   IF (count EQ 0) THEN p_int_203906_Siv[O_S_203906] = -999
   printf, 16, x_203906[O_Si_203906], y_203906[i], It_Si_203906[O_Si_203906], int_int_unc_Si_203906[O_Si_203906], limit_vel_width_203906[O_Si_203906], limit_velocity_203906[O_Si_203906], lw_203906[O_Si_203906], p_int_203906[O_Si_203906], It_O_203906[i], int_int_unc_O_203906[i], limit_vel_width_203906_Oiv[i], limit_velocity_203906_Oiv[i], SNR_O_203906[i], lw_203906_Oiv[i], p_int_203906_Oiv[i], It_S_203906[O_S_203906], int_int_unc_S_203906[O_S_203906], limit_vel_width_203906_Siv[O_S_203906], limit_velocity_203906_Siv[O_S_203906], SNR_S_203906[O_S_203906], lw_203906_Siv[O_S_203906], p_int_203906_Siv[O_S_203906], z_203906[O_S_203906], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 16

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_203906.csv')
col_si_uvb_203906 = csv.(0) ;Si IV UVB
col_o_uvb_203906 = csv.(1) ;O IV UVB
col_si_tii_203906 = csv.(2) ;Si IV TII
col_si_tii_u_203906 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_203906 = csv.(4) ;Si IV vel_width
col_si_vel_203906 = csv.(5) ;Si IV velocity
col_si_lw_203906 = csv.(6) ;Si IV lw
col_si_int_203906 = csv.(7) ;Si IV p_int
col_o_tii_203906 = csv.(8) ;O IV TII
col_o_tii_u_203906 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_203906 = csv.(10) ;O IV vel_width
col_o_vel_203906 = csv.(11) ;O IV velocity
col_o_snr_203906 = csv.(12) ;O IV SNR
col_o_lw_203906 = csv.(13) ;O IV lw
col_o_int_203906 = csv.(14) ;O IV p_int
col_s_tii_203906 = csv.(15) ;S IV TII
col_s_tii_u_203906 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_203906 = csv.(17) ;S IV vel_width
col_s_vel_203906 = csv.(18) ;S IV velocity
col_s_snr_203906 = csv.(19) ;S IV SNR
col_s_lw_203906 = csv.(20) ;S IV lw
col_s_int_203906 = csv.(21) ;S IV p_int
col_s_uvb_203906 = csv.(22) ;S IV UVB
table_limit_203906 = WHERE((col_si_uvb_203906 EQ 31049) AND (col_o_uvb_203906 EQ 31049) AND (col_si_tii_203906 GE 0.0) AND (col_si_tii_u_203906 GE 0.0) AND (col_si_vel_w_203906 GE 0.0) AND (col_si_vel_203906 GE 0.0) AND (col_o_tii_203906 GE 0.0) AND (col_o_tii_u_203906 GE 0.0) AND (col_o_vel_w_203906 GE 0.0) AND (col_o_vel_203906 GE 0.0) AND (col_o_snr_203906 GE 0.0))

ratio_limit_203906 = WHERE((col_o_snr_203906 GE 3.0) AND (col_o_snr_203906 LT 1000) AND (col_o_snr_203906 LT 1000) AND (col_o_tii_203906 GE 0.0) AND (col_si_tii_203906 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_203906[ratio_limit_203906]
PRINT, 'TII O'
PRINT, col_o_tii_203906[ratio_limit_203906]
PRINT, 'TII Si IV'
PRINT, col_si_tii_203906[ratio_limit_203906]

ratio_203906 = (col_si_tii_203906[ratio_limit_203906]/col_o_tii_203906[ratio_limit_203906])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_203906)
PRINT, ratio_203906

TII_203906 = N_ELEMENTS(ratio_203906)
PRINT, TII_203906 ;340

electron_dens_arr_203906 = DBLARR(TII_203906)

FOR i = 0, TII_203906-1 DO BEGIN
   difference_arr_203906 = ABS(si_o_ratio-ratio_203906[i])
   electron_dens_203906 = WHERE(difference_arr_203906 EQ MIN(difference_arr_203906), /NULL)
   electron_dens_arr_203906[i] = electron_dens_203906[0]
ENDFOR

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

e_dens_203906 = e_density[electron_dens_arr_203906]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_203906_70_1000 = WHERE((col_o_snr_203906 GE 3.0) AND (col_o_snr_203906 LT 1000) AND (col_o_tii_203906 GE 0.0) AND (col_si_tii_203906 GE 0.0) AND (col_si_vel_w_203906 GE 70.0) AND (col_si_vel_w_203906 LT 1000.0) AND (col_o_vel_w_203906 GE 70.0) AND (col_o_vel_w_203906 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_203906[ratio_limit_203906_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_203906[ratio_limit_203906_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_203906[ratio_limit_203906_70_1000]

ratio_203906_70_1000 = (col_si_tii_203906[ratio_limit_203906_70_1000]/col_o_tii_203906[ratio_limit_203906_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_203906_70_1000)
PRINT, ratio_203906_70_1000

TII_203906_70_1000 = N_ELEMENTS(ratio_203906_70_1000)
PRINT, TII_203906_70_1000 ;16

electron_dens_arr_203906_70_1000 = DBLARR(TII_203906_70_1000)

FOR i = 0, TII_203906_70_1000-1 DO BEGIN
   difference_arr_203906_70_1000 = ABS(si_o_ratio-ratio_203906_70_1000[i])
   electron_dens_203906_70_1000 = WHERE(difference_arr_203906_70_1000 EQ MIN(difference_arr_203906_70_1000), /NULL)
   electron_dens_arr_203906_70_1000[i] = electron_dens_203906_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_203906_70_1000]

PRINT, "203906_70_1000"

nin_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_203906_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_203906_70_1000) ;0

ten_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_203906_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_203906_70_1000) ;0

elev_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_203906_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_203906_70_1000) ;6

twel_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_203906_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_203906_70_1000) ;10

thirt_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_203906_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_203906_70_1000) ;0

four_203906_70_1000 = WHERE((e_density[electron_dens_arr_203906_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_203906_70_1000) ;0

e_dens_203906_70_1000 = e_density[electron_dens_arr_203906_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_203906_40_70 = WHERE((col_o_snr_203906 GE 3.0) AND (col_o_snr_203906 LT 1000) AND (col_o_tii_203906 GE 0.0) AND (col_si_tii_203906 GE 0.0) AND (col_si_vel_w_203906 GE 40.0) AND (col_si_vel_w_203906 LT 70.0) AND (col_o_vel_w_203906 GE 40.0) AND (col_o_vel_w_203906 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_203906[ratio_limit_203906_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_203906[ratio_limit_203906_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_203906[ratio_limit_203906_40_70]

ratio_203906_40_70 = (col_si_tii_203906[ratio_limit_203906_40_70]/col_o_tii_203906[ratio_limit_203906_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_203906_40_70)
PRINT, ratio_203906_40_70

TII_203906_40_70 = N_ELEMENTS(ratio_203906_40_70)
PRINT, TII_203906_40_70 ;21

electron_dens_arr_203906_40_70 = DBLARR(TII_203906_40_70)

FOR i = 0, TII_203906_40_70-1 DO BEGIN
   difference_arr_203906_40_70 = ABS(si_o_ratio-ratio_203906_40_70[i])
   electron_dens_203906_40_70 = WHERE(difference_arr_203906_40_70 EQ MIN(difference_arr_203906_40_70), /NULL)
   electron_dens_arr_203906_40_70[i] = electron_dens_203906_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_203906_40_70]

PRINT, "203906_40_70"

nin_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_203906_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_203906_40_70) ;0

ten_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_203906_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_203906_40_70) ;0

elev_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_203906_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_203906_40_70) ;18

twel_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_203906_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_203906_40_70) ;3

thirt_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_203906_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_203906_40_70) ;0

four_203906_40_70 = WHERE((e_density[electron_dens_arr_203906_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_203906_40_70) ;0

e_dens_203906_40_70 = e_density[electron_dens_arr_203906_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_203906_40 = WHERE((col_o_snr_203906 GE 3.0) AND (col_o_snr_203906 LT 1000) AND (col_o_tii_203906 GE 0.0) AND (col_si_tii_203906 GE 0.0) AND (col_si_vel_w_203906 GE 0.0) AND (col_si_vel_w_203906 LT 40.0) AND (col_o_vel_w_203906 GE 0.0) AND (col_o_vel_w_203906 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_203906 = CORRELATE(lw_203906,e_density[electron_dens_arr_203906])
PRINT, result_203906 ;-0.029570853

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_203906, e_density[electron_dens_arr_203906], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_203906, e_density[electron_dens_arr_203906], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_203906, p_int_203906, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;215426

y_215426 = array_215426_O[*,5]
;PRINT, N_ELEMENTS(y_215426) ;194
x_215426 = array_215426_Si[*,4]
;PRINT, N_ELEMENTS(x_215426) ;196
z_215426 = array_215426_S[*,5]
;PRINT, N_ELEMENTS(z_215426) ;158
openw, 17, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_215426.csv'
FOR i = 0, N_ELEMENTS(y_215426)-1 DO BEGIN
   O_Si_215426= WHERE((x_215426 EQ y_215426[i]),count)
   O_S_215426 = WHERE((z_215426 EQ y_215426[i]),count)
   IF (SNR_O_215426[i] EQ 'Infinity') THEN SNR_O_215426[i] = -999
   IF (SNR_S_215426[O_S_215426] EQ 'Infinity') THEN SNR_S_215426[O_S_215426] = -999
   IF (count EQ 0) THEN z_215426[O_S_215426] = -999
   IF (count EQ 0) THEN It_S_215426[O_S_215426] = -999
   IF (count EQ 0) THEN int_int_unc_S_215426[O_S_215426] = -999
   IF (count EQ 0) THEN limit_vel_width_215426_Siv[O_S_215426] = -999
   IF (count EQ 0) THEN limit_velocity_215426_Siv[O_S_215426] = -999
   IF (count EQ 0) THEN SNR_S_215426[O_S_215426] = -999
   IF (count EQ 0) THEN lw_215426_Siv[O_S_215426] = -999
   IF (count EQ 0) THEN p_int_215426_Siv[O_S_215426] = -999
   printf, 17, x_215426[O_Si_215426], y_215426[i], It_Si_215426[O_Si_215426], int_int_unc_Si_215426[O_Si_215426], limit_vel_width_215426[O_Si_215426], limit_velocity_215426[O_Si_215426], lw_215426[O_Si_215426], p_int_215426[O_Si_215426], It_O_215426[i], int_int_unc_O_215426[i], limit_vel_width_215426_Oiv[i], limit_velocity_215426_Oiv[i], SNR_O_215426[i], lw_215426_Oiv[i], p_int_215426_Oiv[i], It_S_215426[O_S_215426], int_int_unc_S_215426[O_S_215426], limit_vel_width_215426_Siv[O_S_215426], limit_velocity_215426_Siv[O_S_215426], SNR_S_215426[O_S_215426], lw_215426_Siv[O_S_215426], p_int_215426_Siv[O_S_215426], z_215426[O_S_215426], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 17

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_215426.csv')
col_si_uvb_215426 = csv.(0) ;Si IV UVB
col_o_uvb_215426 = csv.(1) ;O IV UVB
col_si_tii_215426 = csv.(2) ;Si IV TII
col_si_tii_u_215426 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_215426 = csv.(4) ;Si IV vel_width
col_si_vel_215426 = csv.(5) ;Si IV velocity
col_si_lw_215426 = csv.(6) ;Si IV lw
col_si_int_215426 = csv.(7) ;Si IV p_int
col_o_tii_215426 = csv.(8) ;O IV TII
col_o_tii_u_215426 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_215426 = csv.(10) ;O IV vel_width
col_o_vel_215426 = csv.(11) ;O IV velocity
col_o_snr_215426 = csv.(12) ;O IV SNR
col_o_lw_215426 = csv.(13) ;O IV lw
col_o_int_215426 = csv.(14) ;O IV p_int
col_s_tii_215426 = csv.(15) ;S IV TII
col_s_tii_u_215426 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_215426 = csv.(17) ;S IV vel_width
col_s_vel_215426 = csv.(18) ;S IV velocity
col_s_snr_215426 = csv.(19) ;S IV SNR
col_s_lw_215426 = csv.(20) ;S IV lw
col_s_int_215426 = csv.(21) ;S IV p_int
col_s_uvb_215426 = csv.(22) ;S IV UVB
table_limit_215426 = WHERE((col_si_uvb_215426 EQ 31049) AND (col_o_uvb_215426 EQ 31049) AND (col_si_tii_215426 GE 0.0) AND (col_si_tii_u_215426 GE 0.0) AND (col_si_vel_w_215426 GE 0.0) AND (col_si_vel_215426 GE 0.0) AND (col_o_tii_215426 GE 0.0) AND (col_o_tii_u_215426 GE 0.0) AND (col_o_vel_w_215426 GE 0.0) AND (col_o_vel_215426 GE 0.0) AND (col_o_snr_215426 GE 0.0))

ratio_limit_215426 = WHERE((col_o_snr_215426 GE 3.0) AND (col_o_snr_215426 LT 1000) AND (col_o_snr_215426 LT 1000) AND (col_o_tii_215426 GE 0.0) AND (col_si_tii_215426 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_215426[ratio_limit_215426]
PRINT, 'TII O'
PRINT, col_o_tii_215426[ratio_limit_215426]
PRINT, 'TII Si IV'
PRINT, col_si_tii_215426[ratio_limit_215426]

ratio_215426 = (col_si_tii_215426[ratio_limit_215426]/col_o_tii_215426[ratio_limit_215426])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_215426)
PRINT, ratio_215426

TII_215426 = N_ELEMENTS(ratio_215426)
PRINT, TII_215426 ;26

electron_dens_arr_215426 = DBLARR(TII_215426)

FOR i = 0, TII_215426-1 DO BEGIN
   difference_arr_215426 = ABS(si_o_ratio-ratio_215426[i])
   electron_dens_215426 = WHERE(difference_arr_215426 EQ MIN(difference_arr_215426), /NULL)
   electron_dens_arr_215426[i] = electron_dens_215426[0]
ENDFOR

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

e_dens_215426 = e_density[electron_dens_arr_215426]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

ratio_limit_215426_70_1000 = WHERE((col_o_snr_215426 GE 3.0) AND (col_o_snr_215426 LT 1000) AND (col_o_tii_215426 GE 0.0) AND (col_si_tii_215426 GE 0.0) AND (col_si_vel_w_215426 GE 70.0) AND (col_si_vel_w_215426 LT 1000.0) AND (col_o_vel_w_215426 GE 70.0) AND (col_o_vel_w_215426 LT 1000.0), /NULL)
PRINT, 'SNR O'
PRINT, col_o_snr_215426[ratio_limit_215426_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_215426[ratio_limit_215426_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_215426[ratio_limit_215426_70_1000]

ratio_215426_70_1000 = (col_si_tii_215426[ratio_limit_215426_70_1000]/col_o_tii_215426[ratio_limit_215426_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_215426_70_1000)
PRINT, ratio_215426_70_1000

TII_215426_70_1000 = N_ELEMENTS(ratio_215426_70_1000)
PRINT, TII_215426_70_1000 ;1

electron_dens_arr_215426_70_1000 = DBLARR(TII_215426_70_1000)

FOR i = 0, TII_215426_70_1000-1 DO BEGIN
   difference_arr_215426_70_1000 = ABS(si_o_ratio-ratio_215426_70_1000[i])
   electron_dens_215426_70_1000 = WHERE(difference_arr_215426_70_1000 EQ MIN(difference_arr_215426_70_1000), /NULL)
   electron_dens_arr_215426_70_1000[i] = electron_dens_215426_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_215426_70_1000]

PRINT, "215426_70_1000"

nin_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_215426_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_215426_70_1000) ;0

ten_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_215426_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_215426_70_1000) ;0

elev_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_215426_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_215426_70_1000) ;1

twel_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_215426_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_215426_70_1000) ;0

thirt_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_215426_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_215426_70_1000) ;0

four_215426_70_1000 = WHERE((e_density[electron_dens_arr_215426_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_215426_70_1000) ;0

e_dens_215426_70_1000 = e_density[electron_dens_arr_215426_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ratio_limit_215426_40_70 = WHERE((col_o_snr_215426 GE 3.0) AND (col_o_snr_215426 LT 1000) AND (col_o_tii_215426 GE 0.0) AND (col_si_tii_215426 GE 0.0) AND (col_si_vel_w_215426 GE 40.0) AND (col_si_vel_w_215426 LT 70.0) AND (col_o_vel_w_215426 GE 40.0) AND (col_o_vel_w_215426 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_215426[ratio_limit_215426_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_215426[ratio_limit_215426_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_215426[ratio_limit_215426_40_70]

ratio_215426_40_70 = (col_si_tii_215426[ratio_limit_215426_40_70]/col_o_tii_215426[ratio_limit_215426_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_215426_40_70)
PRINT, ratio_215426_40_70

TII_215426_40_70 = N_ELEMENTS(ratio_215426_40_70)
PRINT, TII_215426_40_70 ;8

electron_dens_arr_215426_40_70 = DBLARR(TII_215426_40_70)

FOR i = 0, TII_215426_40_70-1 DO BEGIN
   difference_arr_215426_40_70 = ABS(si_o_ratio-ratio_215426_40_70[i])
   electron_dens_215426_40_70 = WHERE(difference_arr_215426_40_70 EQ MIN(difference_arr_215426_40_70), /NULL)
   electron_dens_arr_215426_40_70[i] = electron_dens_215426_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_215426_40_70]

PRINT, "215426_40_70"

nin_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_215426_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_215426_40_70) ;0

ten_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_215426_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_215426_40_70) ;0

elev_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_215426_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_215426_40_70) ;4

twel_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_215426_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_215426_40_70) ;4

thirt_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_215426_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_215426_40_70) ;0

four_215426_40_70 = WHERE((e_density[electron_dens_arr_215426_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_215426_40_70) ;0

e_dens_215426_40_70 = e_density[electron_dens_arr_215426_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_215426_40 = WHERE((col_o_snr_215426 GE 3.0) AND (col_o_snr_215426 LT 1000) AND (col_o_tii_215426 GE 0.0) AND (col_si_tii_215426 GE 0.0) AND (col_si_vel_w_215426 GE 0.0) AND (col_si_vel_w_215426 LT 40.0) AND (col_o_vel_w_215426 GE 0.0) AND (col_o_vel_w_215426 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_215426 = CORRELATE(lw_215426,e_density[electron_dens_arr_215426])
PRINT, result_215426 ;-0.33871753

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_215426, e_density[electron_dens_arr_215426], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_215426, e_density[electron_dens_arr_215426], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_215426, p_int_215426, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity [Arb. Units]', POSITION = [x0,y0,x0+dx,y0+dy]

;-------------------------------------------------------------------------------

;232931

y_232931 = array_232931_O[*,5]
;PRINT, N_ELEMENTS(y_232931) ;227
x_232931 = array_232931_Si[*,4]
;PRINT, N_ELEMENTS(x_232931) ;228
z_232931 = array_232931_S[*,5]
;PRINT, N_ELEMENTS(z_232931) ;189
openw, 18, '~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_232931.csv'
FOR i = 0, N_ELEMENTS(y_232931)-1 DO BEGIN
   O_Si_232931= WHERE((x_232931 EQ y_232931[i]),count)
   O_S_232931 = WHERE((z_232931 EQ y_232931[i]),count)
   IF (SNR_O_232931[i] EQ 'Infinity') THEN SNR_O_232931[i] = -999
   IF (SNR_S_232931[O_S_232931] EQ 'Infinity') THEN SNR_S_232931[O_S_232931] = -999
   IF (count EQ 0) THEN z_232931[O_S_232931] = -999
   IF (count EQ 0) THEN It_S_232931[O_S_232931] = -999
   IF (count EQ 0) THEN int_int_unc_S_232931[O_S_232931] = -999
   IF (count EQ 0) THEN limit_vel_width_232931_Siv[O_S_232931] = -999
   IF (count EQ 0) THEN limit_velocity_232931_Siv[O_S_232931] = -999
   IF (count EQ 0) THEN SNR_S_232931[O_S_232931] = -999
   IF (count EQ 0) THEN lw_232931_Siv[O_S_232931] = -999
   IF (count EQ 0) THEN p_int_232931_Siv[O_S_232931] = -999
   printf, 18, x_232931[O_Si_232931], y_232931[i], It_Si_232931[O_Si_232931], int_int_unc_Si_232931[O_Si_232931], limit_vel_width_232931[O_Si_232931], limit_velocity_232931[O_Si_232931], lw_232931[O_Si_232931], p_int_232931[O_Si_232931], It_O_232931[i], int_int_unc_O_232931[i], limit_vel_width_232931_Oiv[i], limit_velocity_232931_Oiv[i], SNR_O_232931[i], lw_232931_Oiv[i], p_int_232931_Oiv[i], It_S_232931[O_S_232931], int_int_unc_S_232931[O_S_232931], limit_vel_width_232931_Siv[O_S_232931], limit_velocity_232931_Siv[O_S_232931], SNR_S_232931[O_S_232931], lw_232931_Siv[O_S_232931], p_int_232931_Siv[O_S_232931], z_232931[O_S_232931], FORMAT = "(I7,' , ',I7,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9,' , ',I7)"
ENDFOR
close, 18

csv = READ_CSV('~/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/tables/table_232931.csv')
col_si_uvb_232931 = csv.(0) ;Si IV UVB
col_o_uvb_232931 = csv.(1) ;O IV UVB
col_si_tii_232931 = csv.(2) ;Si IV TII
col_si_tii_u_232931 = csv.(3) ;Si IV TII uncertainty
col_si_vel_w_232931 = csv.(4) ;Si IV vel_width
col_si_vel_232931 = csv.(5) ;Si IV velocity
col_si_lw_232931 = csv.(6) ;Si IV lw
col_si_int_232931 = csv.(7) ;Si IV p_int
col_o_tii_232931 = csv.(8) ;O IV TII
col_o_tii_u_232931 = csv.(9) ;O IV TII uncertainty
col_o_vel_w_232931 = csv.(10) ;O IV vel_width
col_o_vel_232931 = csv.(11) ;O IV velocity
col_o_snr_232931 = csv.(12) ;O IV SNR
col_o_lw_232931 = csv.(13) ;O IV lw
col_o_int_232931 = csv.(14) ;O IV p_int
col_s_tii_232931 = csv.(15) ;S IV TII
col_s_tii_u_232931 = csv.(16) ;S IV TII uncertainty
col_s_vel_w_232931 = csv.(17) ;S IV vel_width
col_s_vel_232931 = csv.(18) ;S IV velocity
col_s_snr_232931 = csv.(19) ;S IV SNR
col_s_lw_232931 = csv.(20) ;S IV lw
col_s_int_232931 = csv.(21) ;S IV p_int
col_s_uvb_232931 = csv.(22) ;S IV UVB
table_limit_232931 = WHERE((col_si_uvb_232931 EQ 31049) AND (col_o_uvb_232931 EQ 31049) AND (col_si_tii_232931 GE 0.0) AND (col_si_tii_u_232931 GE 0.0) AND (col_si_vel_w_232931 GE 0.0) AND (col_si_vel_232931 GE 0.0) AND (col_o_tii_232931 GE 0.0) AND (col_o_tii_u_232931 GE 0.0) AND (col_o_vel_w_232931 GE 0.0) AND (col_o_vel_232931 GE 0.0) AND (col_o_snr_232931 GE 0.0))

ratio_limit_232931 = WHERE((col_o_snr_232931 GE 3.0) AND (col_o_snr_232931 LT 1000) AND (col_o_snr_232931 LT 1000) AND (col_o_tii_232931 GE 0.0) AND (col_si_tii_232931 GE 0.0))
PRINT, 'SNR O'
PRINT, col_o_snr_232931[ratio_limit_232931]
PRINT, 'TII O'
PRINT, col_o_tii_232931[ratio_limit_232931]
PRINT, 'TII Si IV'
PRINT, col_si_tii_232931[ratio_limit_232931]

ratio_232931 = (col_si_tii_232931[ratio_limit_232931]/col_o_tii_232931[ratio_limit_232931])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_232931)
PRINT, ratio_232931

TII_232931 = N_ELEMENTS(ratio_232931)
PRINT, TII_232931 ;28

electron_dens_arr_232931 = DBLARR(TII_232931)

FOR i = 0, TII_232931-1 DO BEGIN
   difference_arr_232931 = ABS(si_o_ratio-ratio_232931[i])
   electron_dens_232931 = WHERE(difference_arr_232931 EQ MIN(difference_arr_232931), /NULL)
   electron_dens_arr_232931[i] = electron_dens_232931[0]
ENDFOR

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

e_dens_232931 = e_density[electron_dens_arr_232931]

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;velocity limits

;none here
ratio_limit_232931_70_1000 = WHERE((col_o_snr_232931 GE 3.0) AND (col_o_snr_232931 LT 1000) AND (col_o_tii_232931 GE 0.0) AND (col_si_tii_232931 GE 0.0) AND (col_si_vel_w_232931 GE 70.0) AND (col_si_vel_w_232931 LT 1000.0) AND (col_o_vel_w_232931 GE 70.0) AND (col_o_vel_w_232931 LT 1000.0))
PRINT, 'SNR O'
PRINT, col_o_snr_232931[ratio_limit_232931_70_1000] 
PRINT, 'TII O'
PRINT, col_o_tii_232931[ratio_limit_232931_70_1000] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_232931[ratio_limit_232931_70_1000]

ratio_232931_70_1000 = (col_si_tii_232931[ratio_limit_232931_70_1000]/col_o_tii_232931[ratio_limit_232931_70_1000])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_232931_70_1000)
PRINT, ratio_232931_70_1000

TII_232931_70_1000 = N_ELEMENTS(ratio_232931_70_1000)
PRINT, TII_232931_70_1000 ;1

electron_dens_arr_232931_70_1000 = DBLARR(TII_232931_70_1000)

FOR i = 0, TII_232931_70_1000-1 DO BEGIN
   difference_arr_232931_70_1000 = ABS(si_o_ratio-ratio_232931_70_1000[i])
   electron_dens_232931_70_1000 = WHERE(difference_arr_232931_70_1000 EQ MIN(difference_arr_232931_70_1000), /NULL)
   electron_dens_arr_232931_70_1000[i] = electron_dens_232931_70_1000[0]
ENDFOR

PRINT, e_density[electron_dens_arr_232931_70_1000]

PRINT, "232931_70_1000"

nin_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+09) AND (e_density[electron_dens_arr_232931_70_1000] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_232931_70_1000) ;0

ten_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+10) AND (e_density[electron_dens_arr_232931_70_1000] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_232931_70_1000) ;1

elev_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+11) AND (e_density[electron_dens_arr_232931_70_1000] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_232931_70_1000) ;0

twel_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+12) AND (e_density[electron_dens_arr_232931_70_1000] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_232931_70_1000) ;0

thirt_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+13) AND (e_density[electron_dens_arr_232931_70_1000] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_232931_70_1000) ;0

four_232931_70_1000 = WHERE((e_density[electron_dens_arr_232931_70_1000] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_232931_70_1000) ;0

e_dens_232931_70_1000 = e_density[electron_dens_arr_232931_70_1000]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;none here
ratio_limit_232931_40_70 = WHERE((col_o_snr_232931 GE 3.0) AND (col_o_snr_232931 LT 1000) AND (col_o_tii_232931 GE 0.0) AND (col_si_tii_232931 GE 0.0) AND (col_si_vel_w_232931 GE 40.0) AND (col_si_vel_w_232931 LT 70.0) AND (col_o_vel_w_232931 GE 40.0) AND (col_o_vel_w_232931 LT 70.0))
PRINT, 'SNR O'
PRINT, col_o_snr_232931[ratio_limit_232931_40_70] 
PRINT, 'TII O'
PRINT, col_o_tii_232931[ratio_limit_232931_40_70] 
PRINT, 'TII Si IV'
PRINT, col_si_tii_232931[ratio_limit_232931_40_70]

ratio_232931_40_70 = (col_si_tii_232931[ratio_limit_232931_40_70]/col_o_tii_232931[ratio_limit_232931_40_70])
PRINT, "ratio"
PRINT, N_ELEMENTS(ratio_232931_40_70)
PRINT, ratio_232931_40_70

TII_232931_40_70 = N_ELEMENTS(ratio_232931_40_70)
PRINT, TII_232931_40_70 ;1

electron_dens_arr_232931_40_70 = DBLARR(TII_232931_40_70)

FOR i = 0, TII_232931_40_70-1 DO BEGIN
   difference_arr_232931_40_70 = ABS(si_o_ratio-ratio_232931_40_70[i])
   electron_dens_232931_40_70 = WHERE(difference_arr_232931_40_70 EQ MIN(difference_arr_232931_40_70), /NULL)
   electron_dens_arr_232931_40_70[i] = electron_dens_232931_40_70[0]
ENDFOR

PRINT, e_density[electron_dens_arr_232931_40_70]

PRINT, "232931_40_70"

nin_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+09) AND (e_density[electron_dens_arr_232931_40_70] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(nin_232931_40_70) ;0

ten_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+10) AND (e_density[electron_dens_arr_232931_40_70] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(ten_232931_40_70) ;1

elev_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+11) AND (e_density[electron_dens_arr_232931_40_70] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(elev_232931_40_70) ;0

twel_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+12) AND (e_density[electron_dens_arr_232931_40_70] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(twel_232931_40_70) ;0

thirt_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+13) AND (e_density[electron_dens_arr_232931_40_70] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(thirt_232931_40_70) ;0

four_232931_40_70 = WHERE((e_density[electron_dens_arr_232931_40_70] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(four_232931_40_70) ;0

e_dens_232931_40_70 = e_density[electron_dens_arr_232931_40_70]

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;none here
;ratio_limit_232931_40 = WHERE((col_o_snr_232931 GE 3.0) AND (col_o_snr_232931 LT 1000) AND (col_o_tii_232931 GE 0.0) AND (col_si_tii_232931 GE 0.0) AND (col_si_vel_w_232931 GE 0.0) AND (col_si_vel_w_232931 LT 40.0) AND (col_o_vel_w_232931 GE 0.0) AND (col_o_vel_w_232931 LT 40.0), /NULL)

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

result_232931 = CORRELATE(lw_232931,e_density[electron_dens_arr_232931])
PRINT, result_232931 ;0.070033537

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_232931, e_density[electron_dens_arr_232931], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, p_int_232931, e_density[electron_dens_arr_232931], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-1]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy]

WINDOW, XSIZE = 900, YSIZE = 700
PLOT, psym = 1, lw_232931, p_int_232931, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Peak Intensity vs Line Width', POSITION = [x0,y0,x0+dx,y0+dy]

;*******************************************************************************
;all_lw, all_p_int for eps files

all_lw = [lw_004121,lw_050655,lw_050655_1,lw_052046,lw_061606,lw_114951,lw_122033,lw_160806,lw_163205,lw_174905,lw_181205,lw_201925,lw_201925_1,lw_203906,lw_215426,lw_232931]

all_p_int = [p_int_004121,p_int_050655,p_int_050655_1,p_int_052046,p_int_061606,p_int_114951,p_int_122033,p_int_160806,p_int_174905,p_int_181205,p_int_201925,p_int_201925_1,p_int_203906,p_int_215426,p_int_232931]

;*******************************************************************************

;===============================================================================
;density array for int_ed,lw_ed,lw_int

total_D = [e_dens_004121, e_dens_050655, e_dens_050655_1, e_dens_052046, e_dens_061606, e_dens_114951, e_dens_122033, e_dens_160806, e_dens_163205, e_dens_174905, e_dens_181205, e_dens_201925, e_dens_201925_1, e_dens_203906, e_dens_215426, e_dens_232931]
;===============================================================================

;===============================================================================
;velocity maps--used as a cross-check to ensure isolate_obs# maps were
;the same. They are the same!

;byte-scaling and saturation

sort_c_004121 = coeff_arr_004121[SORT(coeff_arr_004121)]
sort_c_004121 = sort_c_004121[WHERE(FINITE(sort_c_004121) OR (sort_c_004121 NE -200))]
n_sort_c_004121 = N_ELEMENTS(sort_c_004121)

;despike

coeff_arr_004121_clean = IRIS_PREP_DESPIKE(REFORM(coeff_arr_004121[0,*,*]), niter = 1000, min_std = 2.8, sigmas = 2.5, mode = 'both') ;coeff_arr_004121 comes from save file rfname2 and targets peak intensity 

;BYTSCL() TO SHOW UVB OVERPLOT IN RED

byte_scale_004121_40_50 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_50_60 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_60_70 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_70_80 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)
byte_scale_004121_80_1000 = BYTSCL(coeff_arr_004121_clean, MIN = 5, MAX = 75, TOP = 254)

;PRINT, SIZE(byte_scale_004121_40_50)
;PRINT, uvb_index
;PRINT, '40-50'
PRINT, uvb_index[vel_40_50]
;PRINT, N_ELEMENTS(SolarX1400_004121) ;1842
;PRINT, SolarX1400_004121
;PRINT, N_ELEMENTS(SolarY1400_004121) ;1093--slit length
;PRINT, SolarY1400_004121
;PRINT, SolarX1400_004121 ;580.54382
;PRINT, SolarY1400_004121 ;-200.07310

openw, 4, 'coord_uvb.csv'
ff = uvb_index[vel_40_50]
FOR i = 0, N_ELEMENTS(ff)-1 DO BEGIN
   col_y = fix(ff[i]/1093)
   row_x = (ff[i] MOD 1093)
   printf, 4, col_y, row_x, ((col_y*0.16635000)+(580.54382)), ((row_x*0.16635000)+(-200.07310)), FORMAT = "(f100.9,' , ',f100.9,' , ',f100.9,' , ',f100.9)" ;HEADER = column of UVB spectra number, row of UVB spectra number, column of UVB spectra number in arcsec, row of UVB spectra number in arcsec (actually, column is x and row is y)
ENDFOR
close, 4

byte_scale_004121_40_50[uvb_index[vel_40_50]] = 255
;PRINT, byte_scale_004121_40_50[uvb_index[vel_40_50]]
byte_scale_004121_50_60[uvb_index[vel_50_60]] = 255  
byte_scale_004121_60_70[uvb_index[vel_60_70]] = 255 
byte_scale_004121_70_80[uvb_index[vel_70_80]] = 255
byte_scale_004121_80_1000[uvb_index[vel_80_1000]] = 255
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

;-------------------------------------------------------------------------------

;40-50 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/intense_uvb/table_intensity_40_50_UVB_004121.eps', /ENCAPSULATED

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

;-------------------------------------------------------------------------------

;50-60 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/intense_uvb/table_intensity_50_60_UVB_004121.eps', /ENCAPSULATED

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

;-------------------------------------------------------------------------------

;60-70 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/intense_uvb/table_intensity_60_70_UVB_004121.eps', /ENCAPSULATED

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

;-------------------------------------------------------------------------------

;70-80 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/intense_uvb/table_intensity_70_80_UVB_004121.eps', /ENCAPSULATED

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

;-------------------------------------------------------------------------------

;80-1000 km/s velocity
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/intense_uvb/table_intensity_80_1000_UVB_004121.eps', /ENCAPSULATED

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

;===============================================================================
;lw vs electron density plots
;independent variable is the x, dependent is the y. How does e_dens
;depend on lw?

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_004121.eps', /ENCAPSULATED

PLOT, psym = 1, lw_004121, e_density[electron_dens_arr_004121], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_050655.eps', /ENCAPSULATED

PLOT, psym = 1, lw_050655, e_density[electron_dens_arr_050655], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_050655_1.eps', /ENCAPSULATED

PLOT, psym = 1, lw_050655_1, e_density[electron_dens_arr_050655_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_052046.eps', /ENCAPSULATED

PLOT, psym = 1, lw_052046, e_density[electron_dens_arr_052046], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_061606.eps', /ENCAPSULATED

PLOT, psym = 1, lw_061606, e_density[electron_dens_arr_061606], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_114951.eps', /ENCAPSULATED

PLOT, psym = 1, lw_114951, e_density[electron_dens_arr_114951], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_122033.eps', /ENCAPSULATED

PLOT, psym = 1, lw_122033, e_density[electron_dens_arr_122033], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_160806.eps', /ENCAPSULATED

PLOT, psym = 1, lw_160806, e_density[electron_dens_arr_160806], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_163205.eps', /ENCAPSULATED

PLOT, psym = 1, lw_163205, e_density[electron_dens_arr_163205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_174905.eps', /ENCAPSULATED

PLOT, psym = 1, lw_174905, e_density[electron_dens_arr_174905], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_181205.eps', /ENCAPSULATED

PLOT, psym = 1, lw_181205, e_density[electron_dens_arr_181205], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_201925.eps', /ENCAPSULATED

PLOT, psym = 1, lw_201925, e_density[electron_dens_arr_201925], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_201925_1.eps', /ENCAPSULATED

PLOT, psym = 1, lw_201925_1, e_density[electron_dens_arr_201925_1], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_203906.eps', /ENCAPSULATED

PLOT, psym = 1, lw_203906, e_density[electron_dens_arr_203906], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_215426.eps', /ENCAPSULATED

PLOT, psym = 1, lw_215426, e_density[electron_dens_arr_215426], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_232931.eps', /ENCAPSULATED

PLOT, psym = 1, lw_232931, e_density[electron_dens_arr_232931], XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_all.eps', /ENCAPSULATED

PLOT, psym = 1, all_lw, total_D, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, XRANGE = [0,1.0]

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_ed/lw_ed_all_log.eps', /ENCAPSULATED

PLOT, psym = 1, all_lw, total_D, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Line Width vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, /YLOG, XRANGE = [0,1.0]

DEVICE, /CLOSE

;===============================================================================
;peak intensity vs electron density plots

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_004121.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_004121, e_density[electron_dens_arr_004121], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_050655.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_050655, e_density[electron_dens_arr_050655], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_050655_1.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_050655_1, e_density[electron_dens_arr_050655_1], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_052046.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_052046, e_density[electron_dens_arr_052046], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_061606.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_061606, e_density[electron_dens_arr_061606], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_114951.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_114951, e_density[electron_dens_arr_114951], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_122033.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_122033, e_density[electron_dens_arr_122033], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_160806.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_160806, e_density[electron_dens_arr_160806], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_163205.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_163205, e_density[electron_dens_arr_163205], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_174905.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_174905, e_density[electron_dens_arr_174905], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_181205.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_181205, e_density[electron_dens_arr_181205], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_201925.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_201925, e_density[electron_dens_arr_201925], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_201925_1.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_201925_1, e_density[electron_dens_arr_201925_1], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_203906.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_203906, e_density[electron_dens_arr_203906], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_215426.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_215426, e_density[electron_dens_arr_215426], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_232931.eps', /ENCAPSULATED

PLOT, psym = 1, p_int_232931, e_density[electron_dens_arr_232931], XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_all.eps', /ENCAPSULATED

PLOT, psym = 1, all_p_int, total_D, XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, XRANGE = [0,1.0e4]

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/int_ed/int_ed_all_log.eps', /ENCAPSULATED

PLOT, psym = 1, all_p_int, total_D, XTITLE = 'Peak Intensity [Arb. Units]', YTITLE = 'Electron Density [cm^-3]', TITLE = 'Scatter Plot of Peak Intensity vs Electron Density', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, /YLOG, XRANGE = [0,2.0e4]

DEVICE, /CLOSE

;===============================================================================
;lw vs peak intensity plots

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_004121.eps', /ENCAPSULATED

PLOT, psym = 1, lw_004121, p_int_004121, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_050655.eps', /ENCAPSULATED

PLOT, psym = 1, lw_050655, p_int_050655, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_050655_1.eps', /ENCAPSULATED

PLOT, psym = 1, lw_050655_1, p_int_050655_1, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_052046.eps', /ENCAPSULATED

PLOT, psym = 1, lw_052046, p_int_052046, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_061606.eps', /ENCAPSULATED

PLOT, psym = 1, lw_061606, p_int_061606, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_114951.eps', /ENCAPSULATED

PLOT, psym = 1, lw_114951, p_int_114951, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_122033.eps', /ENCAPSULATED

PLOT, psym = 1, lw_122033, p_int_122033, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_160806.eps', /ENCAPSULATED

PLOT, psym = 1, lw_160806, p_int_160806, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_163205.eps', /ENCAPSULATED

PLOT, psym = 1, lw_163205, p_int_163205, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_174905.eps', /ENCAPSULATED

PLOT, psym = 1, lw_174905, p_int_174905, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_181205.eps', /ENCAPSULATED

PLOT, psym = 1, lw_181205, p_int_181205, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_201925.eps', /ENCAPSULATED

PLOT, psym = 1, lw_201925, p_int_201925, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_201925_1.eps', /ENCAPSULATED

PLOT, psym = 1, lw_201925_1, p_int_201925_1, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_203906.eps', /ENCAPSULATED

PLOT, psym = 1, lw_203906, p_int_203906, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_215426.eps', /ENCAPSULATED

PLOT, psym = 1, lw_215426, p_int_215426, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_232931.eps', /ENCAPSULATED

PLOT, psym = 1, lw_232931, p_int_232931, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_all.eps', /ENCAPSULATED

PLOT, psym = 1, all_lw, all_p_int, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, YRANGE = [0,8e3]

DEVICE, /CLOSE

!P.FONT = 1

SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 0, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/lw_int/lw_int_all_log.eps', /ENCAPSULATED

PLOT, psym = 1, all_lw, all_p_int, XTITLE = 'Line Width [km*s^-1]', YTITLE = 'Peak Intensity [Arb. Units]', TITLE = 'Scatter Plot of Line Width vs Peak Intensity', POSITION = [x0,y0,x0+dx,y0+dy], XSTYLE = 1, THICK = 4, CHARSIZE = 1.8, XCHARSIZE = 1.35, YCHARSIZE = 1.4, YTHICK = 10, XTHICK = 10, /YLOG

DEVICE, /CLOSE

;===============================================================================
;density plots

;concatenate arrays

total_D = [e_dens_004121, e_dens_050655, e_dens_050655_1, e_dens_052046, e_dens_061606, e_dens_114951, e_dens_122033, e_dens_160806, e_dens_163205, e_dens_174905, e_dens_181205, e_dens_201925, e_dens_201925_1, e_dens_203906, e_dens_215426, e_dens_232931]

;large data, so take log base 10

total_D = ALOG10(total_D)

;make histogram of all densities and frequencies

D_hist = HISTOGRAM(total_D, BINSIZE = 0.2, MIN = 9, MAX = 14, LOCATIONS = x_hist)

;PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;concatenate arrays

total_D_40_70 = [e_dens_004121_40_70, e_dens_050655_40_70, e_dens_050655_1_40_70, e_dens_052046_40_70, e_dens_061606_40_70, e_dens_114951_40_70, e_dens_122033_40_70, e_dens_160806_40_70, e_dens_163205_40_70, e_dens_174905_40_70, e_dens_181205_40_70, e_dens_201925_40_70, e_dens_201925_1_40_70, e_dens_203906_40_70, e_dens_215426_40_70, e_dens_232931_40_70]

;large data, so take log base 10

total_D_40_70 = ALOG10(total_D_40_70)

;make histogram of all densities and frequencies

D_hist_40_70 = HISTOGRAM(total_D_40_70, BINSIZE = 0.2, MIN = 9, MAX = 14, LOCATIONS = x_hist2)

;PLOT, x_hist2, D_hist_40_70, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
;concatenate arrays

total_D_70_1000 = [e_dens_004121_70_1000, e_dens_050655_70_1000, e_dens_050655_1_70_1000, e_dens_052046_70_1000, e_dens_061606_70_1000, e_dens_114951_70_1000, e_dens_122033_70_1000, e_dens_160806_70_1000, e_dens_163205_70_1000, e_dens_174905_70_1000, e_dens_181205_70_1000, e_dens_201925_70_1000, e_dens_201925_1_70_1000, e_dens_203906_70_1000, e_dens_215426_70_1000, e_dens_232931_70_1000]

;large data, so take log base 10

total_D_70_1000 = ALOG10(total_D_70_1000)

;make histogram of all densities and frequencies

D_hist_70_1000 = HISTOGRAM(total_D_70_1000, BINSIZE = 0.2, MIN = 9, MAX = 14, LOCATIONS = x_hist3)

;PLOT, x_hist3, D_hist_70_1000, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;input into R for overlaying purposes

;openw, 25, 'density.csv'
;FOR i = 0, N_ELEMENTS(total_D)-1 DO BEGIN
;   t = total_D[i]
;   printf, 25, t, FORMAT = "(f100.9)"
;ENDFOR
;close, 25

;openw, 26, 'density_40_70.csv'
;FOR i = 0, N_ELEMENTS(total_D_40_70)-1 DO BEGIN
;   tt = total_D_40_70[i]
;   printf, 26, tt, FORMAT = "(f100.9)"
;ENDFOR
;close, 26

;openw, 27, 'density_70_1000.csv'
;FOR i = 0, N_ELEMENTS(total_D_70_1000)-1 DO BEGIN
;   ttt = total_D_70_1000[i]
;   printf, 27, ttt, FORMAT = "(f100.9)"
;ENDFOR
;close, 27

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/master_table_density_plots/elec_dens_histogram_table.eps', /ENCAPSULATED

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5

DEVICE, /CLOSE

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/master_table_density_plots/elec_dens_histogram_table_40_70.eps', /ENCAPSULATED

PLOT, x_hist2, D_hist_40_70, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5

DEVICE, /CLOSE

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/master_table_density_plots/elec_dens_histogram_table_70_1000.eps', /ENCAPSULATED

PLOT, x_hist3, D_hist_70_1000, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, CHARTHICK = 5

DEVICE, /CLOSE

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/master_table_density_plots/elec_dens_histogram_table_overplot.eps', /ENCAPSULATED

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, XRANGE = [9,13.4], CHARTHICK = 5

TVLCT, [[0],[0],[255]], 2 ;blue
OPLOT, x_hist2, D_hist_70_1000, PSYM = 10, COLOR = 2, THICK = 10

TVLCT, [[0],[127],[0]], 3 ;green
OPLOT, x_hist3, D_hist_40_70, PSYM = 10, COLOR = 3, THICK = 10

DEVICE, /CLOSE

;save as ps--SW Senior Presentation

!P.FONT = 1

TVLCT, [[255],[255],[255]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/master_table_density_plots/elec_dens_histogram_table_overplot_pres.eps', /ENCAPSULATED

PLOT, x_hist, D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 10, XTHICK = 10, YTHICK = 10, XRANGE = [9,13.4], CHARTHICK = 5

TVLCT, [[0],[0],[255]], 2
OPLOT, x_hist2, D_hist_70_1000, PSYM = 10, COLOR = 2, THICK = 10

TVLCT, [[0],[127],[0]], 3
OPLOT, x_hist3, D_hist_40_70, PSYM = 10, COLOR = 3, THICK = 10

DEVICE, /CLOSE

TOC

END
