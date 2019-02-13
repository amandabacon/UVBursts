;+
;Name: master_TII_limit.pro
;Written by: Amanda Bacon (amandabacon@bennington.edu)
;Date: 2019/02/05
;FROM Si IV TII CALCULATIONS AND UNCERTAINTIES, AS WELL AS SNRs AND
;TIIs FROM O IV, TAKE THE RATIO B/W THE RESONANCE SI IV 1394 AND O IV
;1401 LINE TO GET THE ELECTRON DENSITIES OF THESE O IV EMISSION LINES
;IN UVB SPECTRA. (highest velocities and doppler shifts)

;PRO master_TII_limit

;SNR O IV vals

;restore O IV 004121 TIIs, SNRs, etc.

rfname_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/O_IV/limit_sigma_coeff_arr_004121_Oiv.sav'
RESTORE, rfname_SNR_limit

PRINT, '004121'

;80-1000 km/s velocity
limit_one = limit_SNR_O_004121[limit_SNR2_O_004121] 

limit_t_O_004121 = limit_SNR_O_004121[limit_SNR2_O_004121]
limit_num_three = WHERE((limit_t_O_004121 GT 3.0), count, /NULL)

limit_num_three = WHERE((limit_SNR_O_004121[limit_SNR2_O_004121] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num_three) ;2
PRINT, limit_SNR_O_004121[limit_num_three] ;7.98 & 4.66

limit_O_004121_a = limit_It_O_004121[limit_SNR2_O_004121] ;It=total integrated intensity
limit_O_004121 = limit_O_004121_a[limit_num_three]

;70-80 km/s velocity
limit_70_80_one = limit_70_80_SNR_O_004121[limit_70_80_SNR2_O_004121]

limit_70_80_t_O_004121 = limit_70_80_SNR_O_004121[limit_70_80_SNR2_O_004121]
limit_70_80_num_three = WHERE((limit_70_80_t_O_004121 GT 3.0), count, /NULL)

limit_70_80_num_three = WHERE((limit_70_80_SNR_O_004121[limit_70_80_SNR2_O_004121] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num_three) ;1
PRINT, limit_70_80_SNR_O_004121[limit_70_80_num_three] ;8.44

limit_70_80_O_004121_a = limit_70_80_It_O_004121[limit_70_80_SNR2_O_004121]
limit_70_80_O_004121 = limit_70_80_O_004121_a[limit_70_80_num_three]

;60-70 km/s velocity
limit_60_70_one = limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121]

limit_60_70_t_O_004121 = limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121]
limit_60_70_num_three = WHERE((limit_60_70_t_O_004121 GT 3.0), count, /NULL)

;-------------------------------------------------------------------------------

;PRINT, 'CONDITIONAL ALTERING ARRAY'
;limit_60_70_t_O_004121[WHERE((limit_60_70_t_O_004121 LT 3.0), count, /NULL)] = 0.0
;PRINT, limit_60_70_t_O_004121[limit_60_70_t_O_004121] ;0.0000000

;limit_60_70_num_three = WHERE((limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121] GT 3.0), count, /NULL)

;limit_60_70_SNR_O_004121[WHERE((limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121] LT 3.0), count, /NULL)] = 0.0
;PRINT, limit_60_70_SNR_O_004121[limit_60_70_SNR_O_004121]

;limit_60_70_O_004121_a = limit_60_70_It_O_004121[limit_60_70_SNR2_O_004121]
;limit_60_70_O_004121 = limit_60_70_O_004121_a[limit_60_70_num_three]
;PRINT, limit_60_70_O_004121
;-------------------------------------------------------------------------------

limit_60_70_num_three = WHERE((limit_60_70_SNR_O_004121[limit_60_70_SNR2_O_004121] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_60_70_num_three) ;0
PRINT, limit_60_70_SNR_O_004121[limit_60_70_num_three] ;0.696

limit_60_70_O_004121_a = limit_60_70_It_O_004121[limit_60_70_SNR2_O_004121]
limit_60_70_O_004121 = limit_60_70_O_004121_a[limit_60_70_num_three]

;50-60 km/s velocity
limit_50_60_one = limit_50_60_SNR_O_004121[limit_50_60_SNR2_O_004121]

limit_50_60_t_O_004121 = limit_50_60_SNR_O_004121[limit_50_60_SNR2_O_004121]
limit_50_60_num_three = WHERE((limit_50_60_t_O_004121 GT 3.0), count, /NULL)

limit_50_60_num_three = WHERE((limit_50_60_SNR_O_004121[limit_50_60_SNR2_O_004121] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num_three) ;10
PRINT, limit_50_60_SNR_O_004121[limit_50_60_num_three] ;5.60-9.04

limit_50_60_O_004121_a = limit_50_60_It_O_004121[limit_50_60_SNR2_O_004121]
limit_50_60_O_004121 = limit_50_60_O_004121_a[limit_50_60_num_three]

;40-50 km/s velocity
limit_40_50_one = limit_40_50_SNR_O_004121[limit_40_50_SNR2_O_004121]

limit_40_50_t_O_004121 = limit_40_50_SNR_O_004121[limit_40_50_SNR2_O_004121]
limit_40_50_num_three = WHERE((limit_40_50_t_O_004121 GT 3.0), count, /NULL)

limit_40_50_num_three = WHERE((limit_40_50_SNR_O_004121[limit_40_50_SNR2_O_004121] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num_three) ;23
PRINT, limit_40_50_SNR_O_004121[limit_40_50_num_three] ;4.13-19.33

limit_40_50_O_004121_a = limit_40_50_It_O_004121[limit_40_50_SNR2_O_004121]
limit_40_50_O_004121 = limit_40_50_O_004121_a[limit_40_50_num_three]

;restore O IV 050655 TIIs, SNRs, etc.

rfname2_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/O_IV/limit_sigma_coeff_arr_050655_Oiv.sav'
RESTORE, rfname2_SNR_limit

PRINT, '050655'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_050655[limit_SNR2_O_050655]) 
limit_two = limit_SNR_O_050655[limit_SNR2_O_050655]

limit_t_O_050655 = limit_SNR_O_050655[limit_SNR2_O_050655]
limit_num2_three = WHERE((limit_t_O_050655 GT 3.0), count, /NULL)

limit_num2_three = WHERE((limit_SNR_O_050655[limit_SNR2_O_050655] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num2_three) ;2
PRINT, limit_SNR_O_050655[limit_num2_three] ;5.655 & 13.99

limit_O_050655_a = limit_It_O_050655[limit_SNR2_O_050655]
limit_O_050655 = limit_O_050655_a[limit_num2_three]

;70-80 km/s velocity
limit_70_80_two = limit_70_80_SNR_O_050655[limit_70_80_SNR2_O_050655]

limit_70_80_t_O_050655 = limit_70_80_SNR_O_050655[limit_70_80_SNR2_O_050655]
limit_70_80_num2_three = WHERE((limit_70_80_t_O_050655 GT 3.0), count, /NULL)

limit_70_80_num2_three = WHERE((limit_70_80_SNR_O_050655[limit_70_80_SNR2_O_050655] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num2_three) ;0
PRINT, limit_70_80_SNR_O_050655[limit_70_80_num2_three] ;1.648

limit_70_80_O_050655_a = limit_70_80_It_O_050655[limit_70_80_SNR2_O_050655]
limit_70_80_O_050655 = limit_70_80_O_050655_a[limit_70_80_num2_three]

;60-70 km/s velocity
limit_60_70_two = limit_60_70_SNR_O_050655[limit_60_70_SNR2_O_050655]

limit_60_70_t_O_050655 = limit_60_70_SNR_O_050655[limit_60_70_SNR2_O_050655]
limit_60_70_num2_three = WHERE((limit_60_70_t_O_050655 GT 3.0), count, /NULL)

limit_60_70_num2_three = WHERE((limit_60_70_SNR_O_050655[limit_60_70_SNR2_O_050655] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num2_three) ;1
PRINT, limit_60_70_SNR_O_050655[limit_60_70_num2_three] ;14.25

limit_60_70_O_050655_a = limit_60_70_It_O_050655[limit_60_70_SNR2_O_050655]
limit_60_70_O_050655 = limit_60_70_O_050655_a[limit_60_70_num2_three]

;50-60 km/s velocity
limit_50_60_two = limit_50_60_SNR_O_050655[limit_50_60_SNR2_O_050655]

limit_50_60_t_O_050655 = limit_50_60_SNR_O_050655[limit_50_60_SNR2_O_050655]
limit_50_60_num2_three = WHERE((limit_50_60_t_O_050655 GT 3.0), count, /NULL)

limit_50_60_num2_three = WHERE((limit_50_60_SNR_O_050655[limit_50_60_SNR2_O_050655] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num2_three) ;7
PRINT, limit_50_60_SNR_O_050655[limit_50_60_num2_three] ;4.38-17.10

limit_50_60_O_050655_a = limit_50_60_It_O_050655[limit_50_60_SNR2_O_050655]
limit_50_60_O_050655 = limit_50_60_O_050655_a[limit_50_60_num2_three]

;40-50 km/s velocity
limit_40_50_two = limit_40_50_SNR_O_050655[limit_40_50_SNR2_O_050655]

limit_40_50_t_O_050655 = limit_40_50_SNR_O_050655[limit_40_50_SNR2_O_050655]
limit_40_50_num2_three = WHERE((limit_40_50_t_O_050655 GT 3.0), count, /NULL)

limit_40_50_num2_three = WHERE((limit_40_50_SNR_O_050655[limit_40_50_SNR2_O_050655] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num2_three) ;15
PRINT, limit_40_50_SNR_O_050655[limit_40_50_num2_three] ;4.25-20.28

limit_40_50_O_050655_a = limit_40_50_It_O_050655[limit_40_50_SNR2_O_050655]
limit_40_50_O_050655 = limit_40_50_O_050655_a[limit_40_50_num2_three]

;restore O IV 050655_1 TIIs, SNRs, etc.

rfname3_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/O_IV/limit_sigma_coeff_arr_050655_1_Oiv.sav'
RESTORE, rfname3_SNR_limit

PRINT, '050655_1'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_050655_1[limit_SNR2_O_050655_1]) 
limit_three = limit_SNR_O_050655_1[limit_SNR2_O_050655_1]

limit_t = limit_SNR_O_050655_1[limit_SNR2_O_050655_1]
limit_num3_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num3_three = WHERE((limit_SNR_O_050655_1[limit_SNR2_O_050655_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num3_three) ;1
PRINT, limit_SNR_O_050655_1[limit_num3_three] ;8.057

limit_O_050655_1_a = limit_It_O_050655_1[limit_SNR2_O_050655_1]
limit_O_050655_1 = limit_O_050655_1_a[limit_num3_three]

;70-80 km/s velocity
limit_70_80_three = limit_70_80_SNR_O_050655_1[limit_70_80_SNR2_O_050655_1]

limit_70_80_t_O_050655_1 = limit_70_80_SNR_O_050655_1[limit_70_80_SNR2_O_050655_1]
limit_70_80_num3_three = WHERE((limit_70_80_t_O_050655_1 GT 3.0), count, /NULL)

limit_70_80_num3_three = WHERE((limit_70_80_SNR_O_050655_1[limit_70_80_SNR2_O_050655_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num3_three) ;1
PRINT, limit_70_80_SNR_O_050655_1[limit_70_80_num3_three] ;8.057

limit_70_80_O_050655_1_a = limit_70_80_It_O_050655_1[limit_70_80_SNR2_O_050655_1]
limit_70_80_O_050655_1 = limit_70_80_O_050655_1_a[limit_70_80_num3_three]

;60-70 km/s velocity
limit_60_70_three = limit_60_70_SNR_O_050655_1[limit_60_70_SNR2_O_050655_1]

limit_60_70_t_O_050655_1 = limit_60_70_SNR_O_050655_1[limit_60_70_SNR2_O_050655_1]
limit_60_70_num3_three = WHERE((limit_60_70_t_O_050655_1 GT 3.0), count, /NULL)

limit_60_70_num3_three = WHERE((limit_60_70_SNR_O_050655_1[limit_60_70_SNR2_O_050655_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num3_three) ;1
PRINT, limit_60_70_SNR_O_050655_1[limit_60_70_num3_three] ;8.057

limit_60_70_O_050655_1_a = limit_60_70_It_O_050655_1[limit_60_70_SNR2_O_050655_1]
limit_60_70_O_050655_1 = limit_60_70_O_050655_1_a[limit_60_70_num3_three]

;50-60 km/s velocity
limit_50_60_three = limit_50_60_SNR_O_050655_1[limit_50_60_SNR2_O_050655_1]

limit_50_60_t_O_050655_1 = limit_50_60_SNR_O_050655_1[limit_50_60_SNR2_O_050655_1]
limit_50_60_num3_three = WHERE((limit_50_60_t_O_050655_1 GT 3.0), count, /NULL)

limit_50_60_num3_three = WHERE((limit_50_60_SNR_O_050655_1[limit_50_60_SNR2_O_050655_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num3_three) ;4
PRINT, limit_50_60_SNR_O_050655_1[limit_50_60_num3_three] ;4.31-6.57

limit_50_60_O_050655_1_a = limit_50_60_It_O_050655_1[limit_50_60_SNR2_O_050655_1]
limit_50_60_O_050655_1 = limit_50_60_O_050655_1_a[limit_50_60_num3_three]

;40-50 km/s velocity
limit_40_50_three = limit_40_50_SNR_O_050655_1[limit_40_50_SNR2_O_050655_1]

limit_40_50_t_O_050655_1 = limit_40_50_SNR_O_050655_1[limit_40_50_SNR2_O_050655_1]
limit_40_50_num3_three = WHERE((limit_40_50_t_O_050655_1 GT 3.0), count, /NULL)

limit_40_50_num3_three = WHERE((limit_40_50_SNR_O_050655_1[limit_40_50_SNR2_O_050655_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num3_three) ;22
PRINT, limit_40_50_SNR_O_050655_1[limit_40_50_num3_three] ;4.14-9.83

limit_40_50_O_050655_1_a = limit_40_50_It_O_050655_1[limit_40_50_SNR2_O_050655_1]
limit_40_50_O_050655_1 = limit_40_50_O_050655_1_a[limit_40_50_num3_three]

;restore O IV 052046 TIIs, SNRs, etc.

rfname4_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/O_IV/limit_sigma_coeff_arr_052046_Oiv.sav'
RESTORE, rfname4_SNR_limit

PRINT, '052046'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_052046[limit_SNR2_O_052046]) 
limit_four = limit_SNR_O_052046[limit_SNR2_O_052046]

limit_t = limit_SNR_O_052046[limit_SNR2_O_052046]
limit_num4_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num4_three = WHERE((limit_SNR_O_052046[limit_SNR2_O_052046] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num4_three) ;10
PRINT, limit_SNR_O_052046[limit_num4_three] ;5.40-40.01

limit_O_052046_a = limit_It_O_052046[limit_SNR2_O_052046]
limit_O_052046 = limit_O_052046_a[limit_num4_three]

;70-80 km/s velocity
limit_70_80_four = limit_70_80_SNR_O_052046[limit_70_80_SNR2_O_052046]

limit_70_80_t_O_052046 = limit_70_80_SNR_O_052046[limit_70_80_SNR2_O_052046]
limit_70_80_num4_three = WHERE((limit_70_80_t_O_052046 GT 3.0), count, /NULL)

limit_70_80_num4_three = WHERE((limit_70_80_SNR_O_052046[limit_70_80_SNR2_O_052046] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num4_three) ;19
PRINT, limit_70_80_SNR_O_052046[limit_70_80_num4_three] ;5.25-43.95

limit_70_80_O_052046_a = limit_70_80_It_O_052046[limit_70_80_SNR2_O_052046]
limit_70_80_O_052046 = limit_70_80_O_052046_a[limit_70_80_num4_three]

;60-70 km/s velocity
limit_60_70_four = limit_60_70_SNR_O_052046[limit_60_70_SNR2_O_052046]

limit_60_70_t_O_052046 = limit_60_70_SNR_O_052046[limit_60_70_SNR2_O_052046]
limit_60_70_num4_three = WHERE((limit_60_70_t_O_052046 GT 3.0), count, /NULL)

limit_60_70_num4_three = WHERE((limit_60_70_SNR_O_052046[limit_60_70_SNR2_O_052046] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num4_three) ;67
PRINT, limit_60_70_SNR_O_052046[limit_60_70_num4_three] ;4.81-47.83

limit_60_70_O_052046_a = limit_60_70_It_O_052046[limit_60_70_SNR2_O_052046]
limit_60_70_O_052046 = limit_60_70_O_052046_a[limit_60_70_num4_three]

;50-60 km/s velocity
limit_50_60_four = limit_50_60_SNR_O_052046[limit_50_60_SNR2_O_052046]

limit_50_60_t_O_052046 = limit_50_60_SNR_O_052046[limit_50_60_SNR2_O_052046]
limit_50_60_num4_three = WHERE((limit_50_60_t_O_052046 GT 3.0), count, /NULL)

limit_50_60_num4_three = WHERE((limit_50_60_SNR_O_052046[limit_50_60_SNR2_O_052046] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num4_three) ;100
PRINT, limit_50_60_SNR_O_052046[limit_50_60_num4_three] ;4.73-58.68

limit_50_60_O_052046_a = limit_50_60_It_O_052046[limit_50_60_SNR2_O_052046]
limit_50_60_O_052046 = limit_50_60_O_052046_a[limit_50_60_num4_three]

;40-50 km/s velocity
limit_40_50_four = limit_40_50_SNR_O_052046[limit_40_50_SNR2_O_052046]

limit_40_50_t_O_052046 = limit_40_50_SNR_O_052046[limit_40_50_SNR2_O_052046]
limit_40_50_num4_three = WHERE((limit_40_50_t_O_052046 GT 3.0), count, /NULL)

limit_40_50_num4_three = WHERE((limit_40_50_SNR_O_052046[limit_40_50_SNR2_O_052046] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num4_three) ;234
PRINT, limit_40_50_SNR_O_052046[limit_40_50_num4_three] ;4.06-41.11
PRINT, MIN(limit_40_50_SNR_O_052046[limit_40_50_num4_three])
PRINT, MAX(limit_40_50_SNR_O_052046[limit_40_50_num4_three])

limit_40_50_O_052046_a = limit_40_50_It_O_052046[limit_40_50_SNR2_O_052046]
limit_40_50_O_052046 = limit_40_50_O_052046_a[limit_40_50_num4_three]

;restore O IV 061606 TIIs, SNRs, etc.

rfname5_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/O_IV/limit_sigma_coeff_arr_061606_Oiv.sav'
RESTORE, rfname5_SNR_limit

PRINT, '061606'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_061606[limit_SNR2_O_061606]) 
limit_five = limit_SNR_O_061606[limit_SNR2_O_061606]

limit_t = limit_SNR_O_061606[limit_SNR2_O_061606]
limit_num5_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num5_three = WHERE((limit_SNR_O_061606[limit_SNR2_O_061606] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num5_three) ;2
PRINT, limit_SNR_O_061606[limit_num5_three] ;16.36 & 21.10

limit_O_061606_a = limit_It_O_061606[limit_SNR2_O_061606]
limit_O_061606 = limit_O_061606_a[limit_num5_three]

;70-80 km/s velocity
limit_70_80_five = limit_70_80_SNR_O_061606[limit_70_80_SNR2_O_061606]

limit_70_80_t_O_061606 = limit_70_80_SNR_O_061606[limit_70_80_SNR2_O_061606]
limit_70_80_num5_three = WHERE((limit_70_80_t_O_061606 GT 3.0), count, /NULL)

limit_70_80_num5_three = WHERE((limit_70_80_SNR_O_061606[limit_70_80_SNR2_O_061606] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num5_three) ;1
PRINT, limit_70_80_SNR_O_061606[limit_70_80_num5_three] ;5.89

limit_70_80_O_061606_a = limit_70_80_It_O_061606[limit_70_80_SNR2_O_061606]
limit_70_80_O_061606 = limit_70_80_O_061606_a[limit_70_80_num5_three]

;60-70 km/s velocity
limit_60_70_five = limit_60_70_SNR_O_061606[limit_60_70_SNR2_O_061606]

limit_60_70_t_O_061606 = limit_60_70_SNR_O_061606[limit_60_70_SNR2_O_061606]
limit_60_70_num5_three = WHERE((limit_60_70_t_O_061606 GT 3.0), count, /NULL)

limit_60_70_num5_three = WHERE((limit_60_70_SNR_O_061606[limit_60_70_SNR2_O_061606] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num5_three) ;1
PRINT, limit_60_70_SNR_O_061606[limit_60_70_num5_three] ;5.89

limit_60_70_O_061606_a = limit_60_70_It_O_061606[limit_60_70_SNR2_O_061606]
limit_60_70_O_061606 = limit_60_70_O_061606_a[limit_60_70_num5_three]

;50-60 km/s velocity
limit_50_60_five = limit_50_60_SNR_O_061606[limit_50_60_SNR2_O_061606]

limit_50_60_t_O_061606 = limit_50_60_SNR_O_061606[limit_50_60_SNR2_O_061606]
limit_50_60_num5_three = WHERE((limit_50_60_t_O_061606 GT 3.0), count, /NULL)

limit_50_60_num5_three = WHERE((limit_50_60_SNR_O_061606[limit_50_60_SNR2_O_061606] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num5_three) ;8
PRINT, limit_50_60_SNR_O_061606[limit_50_60_num5_three] ;4.66-6.37

limit_50_60_O_061606_a = limit_50_60_It_O_061606[limit_50_60_SNR2_O_061606]
limit_50_60_O_061606 = limit_50_60_O_061606_a[limit_50_60_num5_three]

;40-50 km/s velocity
limit_40_50_five = limit_40_50_SNR_O_061606[limit_40_50_SNR2_O_061606]

limit_40_50_t_O_061606 = limit_40_50_SNR_O_061606[limit_40_50_SNR2_O_061606]
limit_40_50_num5_three = WHERE((limit_40_50_t_O_061606 GT 3.0), count, /NULL)

limit_40_50_num5_three = WHERE((limit_40_50_SNR_O_061606[limit_40_50_SNR2_O_061606] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num5_three) ;11
PRINT, limit_40_50_SNR_O_061606[limit_40_50_num5_three] ;5.31-12.93

limit_40_50_O_061606_a = limit_40_50_It_O_061606[limit_40_50_SNR2_O_061606]
limit_40_50_O_061606 = limit_40_50_O_061606_a[limit_40_50_num5_three]

;restore O IV 114951 TIIs, SNRs, etc.

rfname6_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/O_IV/limit_sigma_coeff_arr_114951_Oiv.sav'
RESTORE, rfname6_SNR_limit

PRINT, '114951'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_114951[limit_SNR2_O_114951]) 
limit_six = limit_SNR_O_114951[limit_SNR2_O_114951]

limit_t = limit_SNR_O_114951[limit_SNR2_O_114951]
limit_num6_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num6_three = WHERE((limit_SNR_O_114951[limit_SNR2_O_114951] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num6_three) ;0
PRINT, limit_SNR_O_114951[limit_num6_three] ;0.358

limit_O_114951_a = limit_It_O_114951[limit_SNR2_O_114951]
limit_O_114951 = limit_O_114951_a[limit_num6_three]

;70-80 km/s velocity
limit_70_80_six = limit_70_80_SNR_O_114951[limit_70_80_SNR2_O_114951]

limit_70_80_t_O_114951 = limit_70_80_SNR_O_114951[limit_70_80_SNR2_O_114951]
limit_70_80_num6_three = WHERE((limit_70_80_t_O_114951 GT 3.0), count, /NULL)

limit_70_80_num6_three = WHERE((limit_70_80_SNR_O_114951[limit_70_80_SNR2_O_114951] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num6_three) ;0
PRINT, limit_70_80_SNR_O_114951[limit_70_80_num6_three] ;0.358

limit_70_80_O_114951_a = limit_70_80_It_O_114951[limit_70_80_SNR2_O_114951]
limit_70_80_O_114951 = limit_70_80_O_114951_a[limit_70_80_num6_three]

;60-70 km/s velocity
limit_60_70_six = limit_60_70_SNR_O_114951[limit_60_70_SNR2_O_114951]

limit_60_70_t_O_114951 = limit_60_70_SNR_O_114951[limit_60_70_SNR2_O_114951]
limit_60_70_num6_three = WHERE((limit_60_70_t_O_114951 GT 3.0), count, /NULL)

limit_60_70_num6_three = WHERE((limit_60_70_SNR_O_114951[limit_60_70_SNR2_O_114951] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num6_three) ;3
PRINT, limit_60_70_SNR_O_114951[limit_60_70_num6_three] ;6.99-8.81

limit_60_70_O_114951_a = limit_60_70_It_O_114951[limit_60_70_SNR2_O_114951]
limit_60_70_O_114951 = limit_60_70_O_114951_a[limit_60_70_num6_three]

;50-60 km/s velocity
limit_50_60_six = limit_50_60_SNR_O_114951[limit_50_60_SNR2_O_114951]

limit_50_60_t_O_114951 = limit_50_60_SNR_O_114951[limit_50_60_SNR2_O_114951]
limit_50_60_num6_three = WHERE((limit_50_60_t_O_114951 GT 3.0), count, /NULL)

limit_50_60_num6_three = WHERE((limit_50_60_SNR_O_114951[limit_50_60_SNR2_O_114951] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num6_three) ;12
PRINT, limit_50_60_SNR_O_114951[limit_50_60_num6_three] ;5.43-89.33

limit_50_60_O_114951_a = limit_50_60_It_O_114951[limit_50_60_SNR2_O_114951]
limit_50_60_O_114951 = limit_50_60_O_114951_a[limit_50_60_num6_three]

;40-50 km/s velocity
limit_40_50_six = limit_40_50_SNR_O_114951[limit_40_50_SNR2_O_114951]

limit_40_50_t_O_114951 = limit_40_50_SNR_O_114951[limit_40_50_SNR2_O_114951]
limit_40_50_num6_three = WHERE((limit_40_50_t_O_114951 GT 3.0), count, /NULL)

limit_40_50_num6_three = WHERE((limit_40_50_SNR_O_114951[limit_40_50_SNR2_O_114951] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num6_three) ;15
PRINT, limit_40_50_SNR_O_114951[limit_40_50_num6_three] ;4.37-10.91

limit_40_50_O_114951_a = limit_40_50_It_O_114951[limit_40_50_SNR2_O_114951]
limit_40_50_O_114951 = limit_40_50_O_114951_a[limit_40_50_num6_three]

;restore O IV 122033 TIIs, SNRs, etc.

rfname7_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/O_IV/limit_sigma_coeff_arr_122033_Oiv.sav'
RESTORE, rfname7_SNR_limit

PRINT, '122033'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_122033[limit_SNR2_O_122033]) 
limit_seven = limit_SNR_O_122033[limit_SNR2_O_122033]

limit_t = limit_SNR_O_122033[limit_SNR2_O_122033]
limit_num7_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num7_three = WHERE((limit_SNR_O_122033[limit_SNR2_O_122033] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num7_three) ;15
PRINT, limit_SNR_O_122033[limit_num7_three] ;3.80-28.57

limit_O_122033_a = limit_It_O_122033[limit_SNR2_O_122033]
limit_O_122033 = limit_O_122033_a[limit_num7_three]

;70-80 km/s velocity
limit_70_80_seven = limit_70_80_SNR_O_122033[limit_70_80_SNR2_O_122033]

limit_70_80_t_O_122033 = limit_70_80_SNR_O_122033[limit_70_80_SNR2_O_122033]
limit_70_80_num7_three = WHERE((limit_70_80_t_O_122033 GT 3.0), count, /NULL)

limit_70_80_num7_three = WHERE((limit_70_80_SNR_O_122033[limit_70_80_SNR2_O_122033] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num7_three) ;9
PRINT, limit_70_80_SNR_O_122033[limit_70_80_num7_three] ;4.69-20.50

limit_70_80_O_122033_a = limit_70_80_It_O_122033[limit_70_80_SNR2_O_122033]
limit_70_80_O_122033 = limit_70_80_O_122033_a[limit_70_80_num7_three]

;60-70 km/s velocity
limit_60_70_seven = limit_60_70_SNR_O_122033[limit_60_70_SNR2_O_122033]

limit_60_70_t_O_122033 = limit_60_70_SNR_O_122033[limit_60_70_SNR2_O_122033]
limit_60_70_num7_three = WHERE((limit_60_70_t_O_122033 GT 3.0), count, /NULL)

limit_60_70_num7_three = WHERE((limit_60_70_SNR_O_122033[limit_60_70_SNR2_O_122033] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num7_three) ;20
PRINT, limit_60_70_SNR_O_122033[limit_60_70_num7_three] ;5.09-19.21

limit_60_70_O_122033_a = limit_60_70_It_O_122033[limit_60_70_SNR2_O_122033]
limit_60_70_O_122033 = limit_60_70_O_122033_a[limit_60_70_num7_three]

;50-60 km/s velocity
limit_50_60_seven = limit_50_60_SNR_O_122033[limit_50_60_SNR2_O_122033]

limit_50_60_t_O_122033 = limit_50_60_SNR_O_122033[limit_50_60_SNR2_O_122033]
limit_50_60_num7_three = WHERE((limit_50_60_t_O_122033 GT 3.0), count, /NULL)

limit_50_60_num7_three = WHERE((limit_50_60_SNR_O_122033[limit_50_60_SNR2_O_122033] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num7_three) ;46
PRINT, limit_50_60_SNR_O_122033[limit_50_60_num7_three] ;4.43-30.79

limit_50_60_O_122033_a = limit_50_60_It_O_122033[limit_50_60_SNR2_O_122033]
limit_50_60_O_122033 = limit_50_60_O_122033_a[limit_50_60_num7_three]

;40-50 km/s velocity
limit_40_50_seven = limit_40_50_SNR_O_122033[limit_40_50_SNR2_O_122033]

limit_40_50_t_O_122033 = limit_40_50_SNR_O_122033[limit_40_50_SNR2_O_122033]
limit_40_50_num7_three = WHERE((limit_40_50_t_O_122033 GT 3.0), count, /NULL)

limit_40_50_num7_three = WHERE((limit_40_50_SNR_O_122033[limit_40_50_SNR2_O_122033] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num7_three) ;118
PRINT, limit_40_50_SNR_O_122033[limit_40_50_num7_three] ;4.21-15.64
PRINT, MIN(limit_40_50_SNR_O_122033[limit_40_50_num7_three])
PRINT, MAX(limit_40_50_SNR_O_122033[limit_40_50_num7_three])

limit_40_50_O_122033_a = limit_40_50_It_O_122033[limit_40_50_SNR2_O_122033]
limit_40_50_O_122033 = limit_40_50_O_122033_a[limit_40_50_num7_three]

;restore O IV 160806 TIIs, SNRs, etc.

rfname8_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/O_IV/limit_sigma_coeff_arr_160806_Oiv.sav'
RESTORE, rfname8_SNR_limit

PRINT, '160806'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_160806[limit_SNR2_O_160806]) 
limit_eight = limit_SNR_O_160806[limit_SNR2_O_160806]

limit_t = limit_SNR_O_160806[limit_SNR2_O_160806]
limit_num8_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num8_three = WHERE((limit_SNR_O_160806[limit_SNR2_O_160806] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num8_three) ;2
PRINT, limit_SNR_O_160806[limit_num8_three] ;5.93 & 5.98

limit_O_160806_a = limit_It_O_160806[limit_SNR2_O_160806]
limit_O_160806 = limit_O_160806_a[limit_num8_three]

;70-80 km/s velocity
limit_70_80_eight = limit_70_80_SNR_O_160806[limit_70_80_SNR2_O_160806]

limit_70_80_t_O_160806 = limit_70_80_SNR_O_160806[limit_70_80_SNR2_O_160806]
limit_70_80_num8_three = WHERE((limit_70_80_t_O_160806 GT 3.0), count, /NULL)

limit_70_80_num8_three = WHERE((limit_70_80_SNR_O_160806[limit_70_80_SNR2_O_160806] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num8_three) ;0
PRINT, limit_70_80_SNR_O_160806[limit_70_80_num8_three] ;1.05

limit_70_80_O_160806_a = limit_70_80_It_O_160806[limit_70_80_SNR2_O_160806]
limit_70_80_O_160806 = limit_70_80_O_160806_a[limit_70_80_num8_three]

;60-70 km/s velocity
limit_60_70_eight = limit_60_70_SNR_O_160806[limit_60_70_SNR2_O_160806]

limit_60_70_t_O_160806 = limit_60_70_SNR_O_160806[limit_60_70_SNR2_O_160806]
limit_60_70_num8_three = WHERE((limit_60_70_t_O_160806 GT 3.0), count, /NULL)

limit_60_70_num8_three = WHERE((limit_60_70_SNR_O_160806[limit_60_70_SNR2_O_160806] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_60_70_num8_three) ;0
PRINT, limit_60_70_SNR_O_160806[limit_60_70_num8_three] ;1.05

limit_60_70_O_160806_a = limit_60_70_It_O_160806[limit_60_70_SNR2_O_160806]
limit_60_70_O_160806 = limit_60_70_O_160806_a[limit_60_70_num8_three]

;50-60 km/s velocity
limit_50_60_eight = limit_50_60_SNR_O_160806[limit_50_60_SNR2_O_160806]

limit_50_60_t_O_160806 = limit_50_60_SNR_O_160806[limit_50_60_SNR2_O_160806]
limit_50_60_num8_three = WHERE((limit_50_60_t_O_160806 GT 3.0), count, /NULL)

limit_50_60_num8_three = WHERE((limit_50_60_SNR_O_160806[limit_50_60_SNR2_O_160806] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num8_three) ;2
PRINT, limit_50_60_SNR_O_160806[limit_50_60_num8_three] ;5.04 & 4.65

limit_50_60_O_160806_a = limit_50_60_It_O_160806[limit_50_60_SNR2_O_160806]
limit_50_60_O_160806 = limit_50_60_O_160806_a[limit_50_60_num8_three]

;40-50 km/s velocity
limit_40_50_eight = limit_40_50_SNR_O_160806[limit_40_50_SNR2_O_160806]

limit_40_50_t_O_160806 = limit_40_50_SNR_O_160806[limit_40_50_SNR2_O_160806]
limit_40_50_num8_three = WHERE((limit_40_50_t_O_160806 GT 3.0), count, /NULL)

limit_40_50_num8_three = WHERE((limit_40_50_SNR_O_160806[limit_40_50_SNR2_O_160806] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num8_three) ;9
PRINT, limit_40_50_SNR_O_160806[limit_40_50_num8_three] ;4.33-7.29

limit_40_50_O_160806_a = limit_40_50_It_O_160806[limit_40_50_SNR2_O_160806]
limit_40_50_O_160806 = limit_40_50_O_160806_a[limit_40_50_num8_three]

;restore O IV 163205 TIIs, SNRs, etc.

rfname9_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/O_IV/limit_sigma_coeff_arr_163205_Oiv.sav'
RESTORE, rfname9_SNR_limit

PRINT, '163205'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_163205[limit_SNR2_O_163205]) 
limit_nine = limit_SNR_O_163205[limit_SNR2_O_163205]

limit_t = limit_SNR_O_163205[limit_SNR2_O_163205]
limit_num9_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num9_three = WHERE((limit_SNR_O_163205[limit_SNR2_O_163205] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num9_three) ;0
PRINT, limit_SNR_O_163205[limit_num9_three] ;0.68

limit_O_163205_a = limit_It_O_163205[limit_SNR2_O_163205]
limit_O_163205 = limit_O_163205_a[limit_num9_three]

;70-80 km/s velocity
limit_70_80_nine = limit_70_80_SNR_O_163205[limit_70_80_SNR2_O_163205]

limit_70_80_t_O_163205 = limit_70_80_SNR_O_163205[limit_70_80_SNR2_O_163205]
limit_70_80_num9_three = WHERE((limit_70_80_t_O_163205 GT 3.0), count, /NULL)

limit_70_80_num9_three = WHERE((limit_70_80_SNR_O_163205[limit_70_80_SNR2_O_163205] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num9_three) ;0
PRINT, limit_70_80_SNR_O_163205[limit_70_80_num9_three] ;0.68

limit_70_80_O_163205_a = limit_70_80_It_O_163205[limit_70_80_SNR2_O_163205]
limit_70_80_O_163205 = limit_70_80_O_163205_a[limit_70_80_num9_three]

;60-70 km/s velocity
limit_60_70_nine = limit_60_70_SNR_O_163205[limit_60_70_SNR2_O_163205]

limit_60_70_t_O_163205 = limit_60_70_SNR_O_163205[limit_60_70_SNR2_O_163205]
limit_60_70_num9_three = WHERE((limit_60_70_t_O_163205 GT 3.0), count, /NULL)

limit_60_70_num9_three = WHERE((limit_60_70_SNR_O_163205[limit_60_70_SNR2_O_163205] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num9_three) ;1
PRINT, limit_60_70_SNR_O_163205[limit_60_70_num9_three] ;4.82

limit_60_70_O_163205_a = limit_60_70_It_O_163205[limit_60_70_SNR2_O_163205]
limit_60_70_O_163205 = limit_60_70_O_163205_a[limit_60_70_num9_three]

;50-60 km/s velocity
limit_50_60_nine = limit_50_60_SNR_O_163205[limit_50_60_SNR2_O_163205]

limit_50_60_t_O_163205 = limit_50_60_SNR_O_163205[limit_50_60_SNR2_O_163205]
limit_50_60_num9_three = WHERE((limit_50_60_t_O_163205 GT 3.0), count, /NULL)

limit_50_60_num9_three = WHERE((limit_50_60_SNR_O_163205[limit_50_60_SNR2_O_163205] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num9_three) ;12
PRINT, limit_50_60_SNR_O_163205[limit_50_60_num9_three] ;4.68-8.10

limit_50_60_O_163205_a = limit_50_60_It_O_163205[limit_50_60_SNR2_O_163205]
limit_50_60_O_163205 = limit_50_60_O_163205_a[limit_50_60_num9_three]

;40-50 km/s velocity
limit_40_50_nine = limit_40_50_SNR_O_163205[limit_40_50_SNR2_O_163205]

limit_40_50_t_O_163205 = limit_40_50_SNR_O_163205[limit_40_50_SNR2_O_163205]
limit_40_50_num9_three = WHERE((limit_40_50_t_O_163205 GT 3.0), count, /NULL)

limit_40_50_num9_three = WHERE((limit_40_50_SNR_O_163205[limit_40_50_SNR2_O_163205] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num9_three) ;5
PRINT, limit_40_50_SNR_O_163205[limit_40_50_num9_three] ;4.41-8.47

limit_40_50_O_163205_a = limit_40_50_It_O_163205[limit_40_50_SNR2_O_163205]
limit_40_50_O_163205 = limit_40_50_O_163205_a[limit_40_50_num9_three]

;restore O IV 174905 TIIs, SNRs, etc.

rfname10_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/O_IV/limit_sigma_coeff_arr_174905_Oiv.sav'
RESTORE, rfname10_SNR_limit

PRINT, '174905'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_174905[limit_SNR2_O_174905]) 
limit_ten = limit_SNR_O_174905[limit_SNR2_O_174905]

limit_t = limit_SNR_O_174905[limit_SNR2_O_174905]
limit_num10_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num10_three = WHERE((limit_SNR_O_174905[limit_SNR2_O_174905] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num10_three) ;4
PRINT, limit_SNR_O_174905[limit_num10_three] ; 6.13-10.49

limit_O_174905_a = limit_It_O_174905[limit_SNR2_O_174905]
limit_O_174905 = limit_O_174905_a[limit_num10_three]

;70-80 km/s velocity
limit_70_80_ten = limit_70_80_SNR_O_174905[limit_70_80_SNR2_O_174905]

limit_70_80_t_O_174905 = limit_70_80_SNR_O_174905[limit_70_80_SNR2_O_174905]
limit_70_80_num10_three = WHERE((limit_70_80_t_O_174905 GT 3.0), count, /NULL)

limit_70_80_num10_three = WHERE((limit_70_80_SNR_O_174905[limit_70_80_SNR2_O_174905] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num10_three) ;1
PRINT, limit_70_80_SNR_O_174905[limit_70_80_num10_three] ;4.63

limit_70_80_O_174905_a = limit_70_80_It_O_174905[limit_70_80_SNR2_O_174905]
limit_70_80_O_174905 = limit_70_80_O_174905_a[limit_70_80_num10_three]

;60-70 km/s velocity
limit_60_70_ten = limit_60_70_SNR_O_174905[limit_60_70_SNR2_O_174905]

limit_60_70_t_O_174905 = limit_60_70_SNR_O_174905[limit_60_70_SNR2_O_174905]
limit_60_70_num10_three = WHERE((limit_60_70_t_O_174905 GT 3.0), count, /NULL)

limit_60_70_num10_three = WHERE((limit_60_70_SNR_O_174905[limit_60_70_SNR2_O_174905] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num10_three) ;7
PRINT, limit_60_70_SNR_O_174905[limit_60_70_num10_three] ;5.43-13.93

limit_60_70_O_174905_a = limit_60_70_It_O_174905[limit_60_70_SNR2_O_174905]
limit_60_70_O_174905 = limit_60_70_O_174905_a[limit_60_70_num10_three]

;50-60 km/s velocity
limit_50_60_ten = limit_50_60_SNR_O_174905[limit_50_60_SNR2_O_174905]

limit_50_60_t_O_174905 = limit_50_60_SNR_O_174905[limit_50_60_SNR2_O_174905]
limit_50_60_num10_three = WHERE((limit_50_60_t_O_174905 GT 3.0), count, /NULL)

limit_50_60_num10_three = WHERE((limit_50_60_SNR_O_174905[limit_50_60_SNR2_O_174905] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num10_three) ;21
PRINT, limit_50_60_SNR_O_174905[limit_50_60_num10_three] ;4.93-10.91

limit_50_60_O_174905_a = limit_50_60_It_O_174905[limit_50_60_SNR2_O_174905]
limit_50_60_O_174905 = limit_50_60_O_174905_a[limit_50_60_num10_three]

;40-50 km/s velocity
limit_40_50_ten = limit_40_50_SNR_O_174905[limit_40_50_SNR2_O_174905]

limit_40_50_t_O_174905 = limit_40_50_SNR_O_174905[limit_40_50_SNR2_O_174905]
limit_40_50_num10_three = WHERE((limit_40_50_t_O_174905 GT 3.0), count, /NULL)

limit_40_50_num10_three = WHERE((limit_40_50_SNR_O_174905[limit_40_50_SNR2_O_174905] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num10_three) ;56
PRINT, limit_40_50_SNR_O_174905[limit_40_50_num10_three] ;3.93-18.70

limit_40_50_O_174905_a = limit_40_50_It_O_174905[limit_40_50_SNR2_O_174905]
limit_40_50_O_174905 = limit_40_50_O_174905_a[limit_40_50_num10_three]

;restore O IV 181205 TIIs, SNRs, etc.

rfname11_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/O_IV/limit_sigma_coeff_arr_181205_Oiv.sav'
RESTORE, rfname11_SNR_limit

PRINT, '181205'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_181205[limit_SNR2_O_181205]) 
limit_eleven = limit_SNR_O_181205[limit_SNR2_O_181205]

limit_t = limit_SNR_O_181205[limit_SNR2_O_181205]
limit_num11_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num11_three = WHERE((limit_SNR_O_181205[limit_SNR2_O_181205] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num11_three) ;0
PRINT, limit_SNR_O_181205[limit_num11_three] ;0.47

limit_O_181205_a = limit_It_O_181205[limit_SNR2_O_181205]
limit_O_181205 = limit_O_181205_a[limit_num11_three]

;70-80 km/s velocity
limit_70_80_eleven = limit_70_80_SNR_O_181205[limit_70_80_SNR2_O_181205]

limit_70_80_t_O_181205 = limit_70_80_SNR_O_181205[limit_70_80_SNR2_O_181205]
limit_70_80_num11_three = WHERE((limit_70_80_t_O_181205 GT 3.0), count, /NULL)

limit_70_80_num11_three = WHERE((limit_70_80_SNR_O_181205[limit_70_80_SNR2_O_181205] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num11_three) ;0
PRINT, limit_70_80_SNR_O_181205[limit_70_80_num11_three] ;0.47

limit_70_80_O_181205_a = limit_70_80_It_O_181205[limit_70_80_SNR2_O_181205]
limit_70_80_O_181205 = limit_70_80_O_181205_a[limit_70_80_num11_three]

;60-70 km/s velocity
limit_60_70_eleven = limit_60_70_SNR_O_181205[limit_60_70_SNR2_O_181205]

limit_60_70_t_O_181205 = limit_60_70_SNR_O_181205[limit_60_70_SNR2_O_181205]
limit_60_70_num11_three = WHERE((limit_60_70_t_O_181205 GT 3.0), count, /NULL)

limit_60_70_num11_three = WHERE((limit_60_70_SNR_O_181205[limit_60_70_SNR2_O_181205] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_60_70_num11_three) ;0
PRINT, limit_60_70_SNR_O_181205[limit_60_70_num11_three] ;0.47

limit_60_70_O_181205_a = limit_60_70_It_O_181205[limit_60_70_SNR2_O_181205]
limit_60_70_O_181205 = limit_60_70_O_181205_a[limit_60_70_num11_three]

;50-60 km/s velocity
limit_50_60_eleven = limit_50_60_SNR_O_181205[limit_50_60_SNR2_O_181205]

limit_50_60_t_O_181205 = limit_50_60_SNR_O_181205[limit_50_60_SNR2_O_181205]
limit_50_60_num11_three = WHERE((limit_50_60_t_O_181205 GT 3.0), count, /NULL)

limit_50_60_num11_three = WHERE((limit_50_60_SNR_O_181205[limit_50_60_SNR2_O_181205] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num11_three) ;2
PRINT, limit_50_60_SNR_O_181205[limit_50_60_num11_three] ;7.76 & 7.69

limit_50_60_O_181205_a = limit_50_60_It_O_181205[limit_50_60_SNR2_O_181205]
limit_50_60_O_181205 = limit_50_60_O_181205_a[limit_50_60_num11_three]

;40-50 km/s velocity
limit_40_50_eleven = limit_40_50_SNR_O_181205[limit_40_50_SNR2_O_181205]

limit_40_50_t_O_181205 = limit_40_50_SNR_O_181205[limit_40_50_SNR2_O_181205]
limit_40_50_num11_three = WHERE((limit_40_50_t_O_181205 GT 3.0), count, /NULL)

limit_40_50_num11_three = WHERE((limit_40_50_SNR_O_181205[limit_40_50_SNR2_O_181205] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num11_three) ;13
PRINT, limit_40_50_SNR_O_181205[limit_40_50_num11_three] ;4.89-8.59

limit_40_50_O_181205_a = limit_40_50_It_O_181205[limit_40_50_SNR2_O_181205]
limit_40_50_O_181205 = limit_40_50_O_181205_a[limit_40_50_num11_three]

;restore O IV 201925 TIIs, SNRs, etc.

rfname12_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/O_IV/limit_sigma_coeff_arr_201925_Oiv.sav'
RESTORE, rfname12_SNR_limit

PRINT, '201925'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_201925[limit_SNR2_O_201925]) 
limit_twelve = limit_SNR_O_201925[limit_SNR2_O_201925]

limit_t = limit_SNR_O_201925[limit_SNR2_O_201925]
limit_num12_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num12_three = WHERE((limit_SNR_O_201925[limit_SNR2_O_201925] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num12_three) ;0
PRINT, limit_SNR_O_201925[limit_num12_three] ;1.0532032

limit_O_201925_a = limit_It_O_201925[limit_SNR2_O_201925]
;PRINT, limit_O_201925_a ;-0.18097079
limit_O_201925 = limit_O_201925_a[limit_num12_three]
;PRINT, limit_O_201925 ;-0.18097079 NEGATIVE!!!!!!!!!!!!!!!!!

;70-80 km/s velocity
limit_70_80_twelve = limit_70_80_SNR_O_201925[limit_70_80_SNR2_O_201925]

limit_70_80_t_O_201925 = limit_70_80_SNR_O_201925[limit_70_80_SNR2_O_201925]
limit_70_80_num12_three = WHERE((limit_70_80_t_O_201925 GT 3.0), count, /NULL)

limit_70_80_num12_three = WHERE((limit_70_80_SNR_O_201925[limit_70_80_SNR2_O_201925] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num12_three) ;0
PRINT, limit_70_80_SNR_O_201925[limit_70_80_num12_three] ;1.0532032

limit_70_80_O_201925_a = limit_70_80_It_O_201925[limit_70_80_SNR2_O_201925]
limit_70_80_O_201925 = limit_70_80_O_201925_a[limit_70_80_num12_three]

;60-70 km/s velocity
limit_60_70_twelve = limit_60_70_SNR_O_201925[limit_60_70_SNR2_O_201925]

limit_60_70_t_O_201925 = limit_60_70_SNR_O_201925[limit_60_70_SNR2_O_201925]
limit_60_70_num12_three = WHERE((limit_60_70_t_O_201925 GT 3.0), count, /NULL)

limit_60_70_num12_three = WHERE((limit_60_70_SNR_O_201925[limit_60_70_SNR2_O_201925] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num12_three) ;1
PRINT, limit_60_70_SNR_O_201925[limit_60_70_num12_three] ;5.19

limit_60_70_O_201925_a = limit_60_70_It_O_201925[limit_60_70_SNR2_O_201925]
limit_60_70_O_201925 = limit_60_70_O_201925_a[limit_60_70_num12_three]

;50-60 km/s velocity
limit_50_60_twelve = limit_50_60_SNR_O_201925[limit_50_60_SNR2_O_201925]

limit_50_60_t_O_201925 = limit_50_60_SNR_O_201925[limit_50_60_SNR2_O_201925]
limit_50_60_num12_three = WHERE((limit_50_60_t_O_201925 GT 3.0), count, /NULL)

limit_50_60_num12_three = WHERE((limit_50_60_SNR_O_201925[limit_50_60_SNR2_O_201925] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num12_three) ;2
PRINT, limit_50_60_SNR_O_201925[limit_50_60_num12_three] ;4.99 & 11.79

limit_50_60_O_201925_a = limit_50_60_It_O_201925[limit_50_60_SNR2_O_201925]
limit_50_60_O_201925 = limit_50_60_O_201925_a[limit_50_60_num12_three]

;40-50 km/s velocity
limit_40_50_twelve = limit_40_50_SNR_O_201925[limit_40_50_SNR2_O_201925]

limit_40_50_t_O_201925 = limit_40_50_SNR_O_201925[limit_40_50_SNR2_O_201925]
limit_40_50_num12_three = WHERE((limit_40_50_t_O_201925 GT 3.0), count, /NULL)

limit_40_50_num12_three = WHERE((limit_40_50_SNR_O_201925[limit_40_50_SNR2_O_201925] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num12_three) ;7
PRINT, limit_40_50_SNR_O_201925[limit_40_50_num12_three] ;5.19-13.31

limit_40_50_O_201925_a = limit_40_50_It_O_201925[limit_40_50_SNR2_O_201925]
limit_40_50_O_201925 = limit_40_50_O_201925_a[limit_40_50_num12_three]

;restore O IV 201925_1 TIIs, SNRs, etc.

rfname13_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/O_IV/limit_sigma_coeff_arr_201925_1_Oiv.sav'
RESTORE, rfname13_SNR_limit

PRINT, '201925_1'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_201925_1[limit_SNR2_O_201925_1]) 
limit_thirteen = limit_SNR_O_201925_1[limit_SNR2_O_201925_1]

limit_t = limit_SNR_O_201925_1[limit_SNR2_O_201925_1]
limit_num13_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num13_three = WHERE((limit_SNR_O_201925_1[limit_SNR2_O_201925_1] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num13_three) ;0
PRINT, limit_SNR_O_201925_1[limit_num13_three] ;1.24

limit_O_201925_1_a = limit_It_O_201925_1[limit_SNR2_O_201925_1]
limit_O_201925_1 = limit_O_201925_1_a[limit_num13_three]

;70-80 km/s velocity
limit_70_80_thirteen = limit_70_80_SNR_O_201925_1[limit_70_80_SNR2_O_201925_1]

limit_70_80_t_O_201925_1 = limit_70_80_SNR_O_201925_1[limit_70_80_SNR2_O_201925_1]
limit_70_80_num13_three = WHERE((limit_70_80_t_O_201925_1 GT 3.0), count, /NULL)

limit_70_80_num13_three = WHERE((limit_70_80_SNR_O_201925_1[limit_70_80_SNR2_O_201925_1] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num13_three) ;0
PRINT, limit_70_80_SNR_O_201925_1[limit_70_80_num13_three] ;1.24

limit_70_80_O_201925_1_a = limit_70_80_It_O_201925_1[limit_70_80_SNR2_O_201925_1]
limit_70_80_O_201925_1 = limit_70_80_O_201925_1_a[limit_70_80_num13_three]

;60-70 km/s velocity
limit_60_70_thirteen = limit_60_70_SNR_O_201925_1[limit_60_70_SNR2_O_201925_1]

limit_60_70_t_O_201925_1 = limit_60_70_SNR_O_201925_1[limit_60_70_SNR2_O_201925_1]
limit_60_70_num13_three = WHERE((limit_60_70_t_O_201925_1 GT 3.0), count, /NULL)

limit_60_70_num13_three = WHERE((limit_60_70_SNR_O_201925_1[limit_60_70_SNR2_O_201925_1] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_60_70_num13_three) ;0
PRINT, limit_60_70_SNR_O_201925_1[limit_60_70_num13_three] ;1.24

limit_60_70_O_201925_1_a = limit_60_70_It_O_201925_1[limit_60_70_SNR2_O_201925_1]
limit_60_70_O_201925_1 = limit_60_70_O_201925_1_a[limit_60_70_num13_three]

;50-60 km/s velocity
limit_50_60_thirteen = limit_50_60_SNR_O_201925_1[limit_50_60_SNR2_O_201925_1]

limit_50_60_t_O_201925_1 = limit_50_60_SNR_O_201925_1[limit_50_60_SNR2_O_201925_1]
limit_50_60_num13_three = WHERE((limit_50_60_t_O_201925_1 GT 3.0), count, /NULL)

limit_50_60_num13_three = WHERE((limit_50_60_SNR_O_201925_1[limit_50_60_SNR2_O_201925_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num13_three) ;1
PRINT, limit_50_60_SNR_O_201925_1[limit_50_60_num13_three] ;4.88

limit_50_60_O_201925_1_a = limit_50_60_It_O_201925_1[limit_50_60_SNR2_O_201925_1]
limit_50_60_O_201925_1 = limit_50_60_O_201925_1_a[limit_50_60_num13_three]

;40-50 km/s velocity
limit_40_50_thirteen = limit_40_50_SNR_O_201925_1[limit_40_50_SNR2_O_201925_1]

limit_40_50_t_O_201925_1 = limit_40_50_SNR_O_201925_1[limit_40_50_SNR2_O_201925_1]
limit_40_50_num13_three = WHERE((limit_40_50_t_O_201925_1 GT 3.0), count, /NULL)

limit_40_50_num13_three = WHERE((limit_40_50_SNR_O_201925_1[limit_40_50_SNR2_O_201925_1] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num13_three) ;7
PRINT, limit_40_50_SNR_O_201925_1[limit_40_50_num13_three] ;5.54-16.96

limit_40_50_O_201925_1_a = limit_40_50_It_O_201925_1[limit_40_50_SNR2_O_201925_1]
limit_40_50_O_201925_1 = limit_40_50_O_201925_1_a[limit_40_50_num13_three]

;restore O IV 203906 TIIs, SNRs, etc.

rfname14_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/O_IV/limit_sigma_coeff_arr_203906_Oiv.sav'
RESTORE, rfname14_SNR_limit

PRINT, '203906'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_203906[limit_SNR2_O_203906]) 
limit_fourteen = limit_SNR_O_203906[limit_SNR2_O_203906]

limit_t = limit_SNR_O_203906[limit_SNR2_O_203906]
limit_num14_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num14_three = WHERE((limit_SNR_O_203906[limit_SNR2_O_203906] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num14_three) ;7
PRINT, limit_SNR_O_203906[limit_num14_three] ;4.67-13.63

limit_O_203906_a = limit_It_O_203906[limit_SNR2_O_203906]
limit_O_203906 = limit_O_203906_a[limit_num14_three]

;70-80 km/s velocity
limit_70_80_fourteen = limit_70_80_SNR_O_203906[limit_70_80_SNR2_O_203906]

limit_70_80_t_O_203906 = limit_70_80_SNR_O_203906[limit_70_80_SNR2_O_203906]
limit_70_80_num14_three = WHERE((limit_70_80_t_O_203906 GT 3.0), count, /NULL)

limit_70_80_num14_three = WHERE((limit_70_80_SNR_O_203906[limit_70_80_SNR2_O_203906] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num14_three) ;3
PRINT, limit_70_80_SNR_O_203906[limit_70_80_num14_three] ;9.17-10.04

limit_70_80_O_203906_a = limit_70_80_It_O_203906[limit_70_80_SNR2_O_203906]
limit_70_80_O_203906 = limit_70_80_O_203906_a[limit_70_80_num14_three]

;60-70 km/s velocity
limit_60_70_fourteen = limit_60_70_SNR_O_203906[limit_60_70_SNR2_O_203906]

limit_60_70_t_O_203906 = limit_60_70_SNR_O_203906[limit_60_70_SNR2_O_203906]
limit_60_70_num14_three = WHERE((limit_60_70_t_O_203906 GT 3.0), count, /NULL)

limit_60_70_num14_three = WHERE((limit_60_70_SNR_O_203906[limit_60_70_SNR2_O_203906] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num14_three) ;4
PRINT, limit_60_70_SNR_O_203906[limit_60_70_num14_three] ;4.56-13.56

limit_60_70_O_203906_a = limit_60_70_It_O_203906[limit_60_70_SNR2_O_203906]
limit_60_70_O_203906 = limit_60_70_O_203906_a[limit_60_70_num14_three]

;50-60 km/s velocity
limit_50_60_fourteen = limit_50_60_SNR_O_203906[limit_50_60_SNR2_O_203906]

limit_50_60_t_O_203906 = limit_50_60_SNR_O_203906[limit_50_60_SNR2_O_203906]
limit_50_60_num14_three = WHERE((limit_50_60_t_O_203906 GT 3.0), count, /NULL)

limit_50_60_num14_three = WHERE((limit_50_60_SNR_O_203906[limit_50_60_SNR2_O_203906] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num14_three) ;3
PRINT, limit_50_60_SNR_O_203906[limit_50_60_num14_three] ;5.30-12.44

limit_50_60_O_203906_a = limit_50_60_It_O_203906[limit_50_60_SNR2_O_203906]
limit_50_60_O_203906 = limit_50_60_O_203906_a[limit_50_60_num14_three]

;40-50 km/s velocity
limit_40_50_fourteen = limit_40_50_SNR_O_203906[limit_40_50_SNR2_O_203906]

limit_40_50_t_O_203906 = limit_40_50_SNR_O_203906[limit_40_50_SNR2_O_203906]
limit_40_50_num14_three = WHERE((limit_40_50_t_O_203906 GT 3.0), count, /NULL)

limit_40_50_num14_three = WHERE((limit_40_50_SNR_O_203906[limit_40_50_SNR2_O_203906] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num14_three) ;18
PRINT, limit_40_50_SNR_O_203906[limit_40_50_num14_three] ;4.32-9.44

limit_40_50_O_203906_a = limit_40_50_It_O_203906[limit_40_50_SNR2_O_203906]
limit_40_50_O_203906 = limit_40_50_O_203906_a[limit_40_50_num14_three]

;restore O IV 215426 TIIs, SNRs, etc.

rfname15_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/O_IV/limit_sigma_coeff_arr_215426_Oiv.sav'
RESTORE, rfname15_SNR_limit

PRINT, '215426'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_215426[limit_SNR2_O_215426]) 
limit_fifteen = limit_SNR_O_215426[limit_SNR2_O_215426]

limit_t = limit_SNR_O_215426[limit_SNR2_O_215426]
limit_num15_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num15_three = WHERE((limit_SNR_O_215426[limit_SNR2_O_215426] GT 3.0), count, /NULL)
PRINT, SIZE(limit_num15_three) ;1
PRINT, limit_SNR_O_215426[limit_num15_three] ;3.23

limit_O_215426_a = limit_It_O_215426[limit_SNR2_O_215426]
limit_O_215426 = limit_O_215426_a[limit_num15_three]

;70-80 km/s velocity
limit_70_80_fifteen = limit_70_80_SNR_O_215426[limit_70_80_SNR2_O_215426]

limit_70_80_t_O_215426 = limit_70_80_SNR_O_215426[limit_70_80_SNR2_O_215426]
limit_70_80_num15_three = WHERE((limit_70_80_t_O_215426 GT 3.0), count, /NULL)

limit_70_80_num15_three = WHERE((limit_70_80_SNR_O_215426[limit_70_80_SNR2_O_215426] GT 3.0), count, /NULL)
PRINT, SIZE(limit_70_80_num15_three) ;1
PRINT, limit_70_80_SNR_O_215426[limit_70_80_num15_three] ;3.23

limit_70_80_O_215426_a = limit_70_80_It_O_215426[limit_70_80_SNR2_O_215426]
limit_70_80_O_215426 = limit_70_80_O_215426_a[limit_70_80_num15_three]

;60-70 km/s velocity
limit_60_70_fifteen = limit_60_70_SNR_O_215426[limit_60_70_SNR2_O_215426]

limit_60_70_t_O_215426 = limit_60_70_SNR_O_215426[limit_60_70_SNR2_O_215426]
limit_60_70_num15_three = WHERE((limit_60_70_t_O_215426 GT 3.0), count, /NULL)

limit_60_70_num15_three = WHERE((limit_60_70_SNR_O_215426[limit_60_70_SNR2_O_215426] GT 3.0), count, /NULL)
PRINT, SIZE(limit_60_70_num15_three) ;1
PRINT, limit_60_70_SNR_O_215426[limit_60_70_num15_three] ;3.23

limit_60_70_O_215426_a = limit_60_70_It_O_215426[limit_60_70_SNR2_O_215426]
limit_60_70_O_215426 = limit_60_70_O_215426_a[limit_60_70_num15_three]

;50-60 km/s velocity
limit_50_60_fifteen = limit_50_60_SNR_O_215426[limit_50_60_SNR2_O_215426]

limit_50_60_t_O_215426 = limit_50_60_SNR_O_215426[limit_50_60_SNR2_O_215426]
limit_50_60_num15_three = WHERE((limit_50_60_t_O_215426 GT 3.0), count, /NULL)

limit_50_60_num15_three = WHERE((limit_50_60_SNR_O_215426[limit_50_60_SNR2_O_215426] GT 3.0), count, /NULL)
PRINT, SIZE(limit_50_60_num15_three) ;1
PRINT, limit_50_60_SNR_O_215426[limit_50_60_num15_three] ;5.17

limit_50_60_O_215426_a = limit_50_60_It_O_215426[limit_50_60_SNR2_O_215426]
limit_50_60_O_215426 = limit_50_60_O_215426_a[limit_50_60_num15_three]

;40-50 km/s velocity
limit_40_50_fifteen = limit_40_50_SNR_O_215426[limit_40_50_SNR2_O_215426]

limit_40_50_t_O_215426 = limit_40_50_SNR_O_215426[limit_40_50_SNR2_O_215426]
limit_40_50_num15_three = WHERE((limit_40_50_t_O_215426 GT 3.0), count, /NULL)

limit_40_50_num15_three = WHERE((limit_40_50_SNR_O_215426[limit_40_50_SNR2_O_215426] GT 3.0), count, /NULL)
PRINT, SIZE(limit_40_50_num15_three) ;5
PRINT, limit_40_50_SNR_O_215426[limit_40_50_num15_three] ;5.02-9.84

limit_40_50_O_215426_a = limit_40_50_It_O_215426[limit_40_50_SNR2_O_215426]
limit_40_50_O_215426 = limit_40_50_O_215426_a[limit_40_50_num15_three]

;restore O IV 232931 TIIs, SNRs, etc.

rfname16_SNR_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/O_IV/limit_sigma_coeff_arr_232931_Oiv.sav'
RESTORE, rfname16_SNR_limit

PRINT, '232931'

;80-1000 km/s velocity
;PRINT, SIZE(limit_SNR_O_232931[limit_SNR2_O_232931]) 
limit_sixteen = limit_SNR_O_232931[limit_SNR2_O_232931]

limit_t = limit_SNR_O_232931[limit_SNR2_O_232931]
limit_num16_three = WHERE((limit_t GT 3.0), count, /NULL)

limit_num16_three = WHERE((limit_SNR_O_232931[limit_SNR2_O_232931] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_num16_three) ;0
PRINT, limit_SNR_O_232931[limit_num16_three] ;0.47

limit_O_232931_a = limit_It_O_232931[limit_SNR2_O_232931]
;PRINT, "limit_O_232931_a"
;PRINT, limit_O_232931_a
limit_O_232931 = limit_O_232931_a[limit_num16_three]
;PRINT, "limit_O_232931"
;PRINT, limit_O_232931

;70-80 km/s velocity
limit_70_80_sixteen = limit_70_80_SNR_O_232931[limit_70_80_SNR2_O_232931]

limit_70_80_t_O_232931 = limit_70_80_SNR_O_232931[limit_70_80_SNR2_O_232931]
limit_70_80_num16_three = WHERE((limit_70_80_t_O_232931 GT 3.0), count, /NULL)

limit_70_80_num16_three = WHERE((limit_70_80_SNR_O_232931[limit_70_80_SNR2_O_232931] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_70_80_num16_three) ;0
PRINT, limit_70_80_SNR_O_232931[limit_70_80_num16_three] ;0.47

limit_70_80_O_232931_a = limit_70_80_It_O_232931[limit_70_80_SNR2_O_232931]
limit_70_80_O_232931 = limit_70_80_O_232931_a[limit_70_80_num16_three]

;60-70 km/s velocity
limit_60_70_sixteen = limit_60_70_SNR_O_232931[limit_60_70_SNR2_O_232931]

limit_60_70_t_O_232931 = limit_60_70_SNR_O_232931[limit_60_70_SNR2_O_232931]
limit_60_70_num16_three = WHERE((limit_60_70_t_O_232931 GT 3.0), count, /NULL)

limit_60_70_num16_three = WHERE((limit_60_70_SNR_O_232931[limit_60_70_SNR2_O_232931] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_60_70_num16_three) ;0
PRINT, limit_60_70_SNR_O_232931[limit_60_70_num16_three] ;0.47

limit_60_70_O_232931_a = limit_60_70_It_O_232931[limit_60_70_SNR2_O_232931]
limit_60_70_O_232931 = limit_60_70_O_232931_a[limit_60_70_num16_three]

;50-60 km/s velocity
limit_50_60_sixteen = limit_50_60_SNR_O_232931[limit_50_60_SNR2_O_232931]

limit_50_60_t_O_232931 = limit_50_60_SNR_O_232931[limit_50_60_SNR2_O_232931]
limit_50_60_num16_three = WHERE((limit_50_60_t_O_232931 GT 3.0), count, /NULL)

limit_50_60_num16_three = WHERE((limit_50_60_SNR_O_232931[limit_50_60_SNR2_O_232931] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_50_60_num16_three) ;0
PRINT, limit_50_60_SNR_O_232931[limit_50_60_num16_three] ;0.47

limit_50_60_O_232931_a = limit_50_60_It_O_232931[limit_50_60_SNR2_O_232931]
limit_50_60_O_232931 = limit_50_60_O_232931_a[limit_50_60_num16_three]

;40-50 km/s velocity
limit_40_50_sixteen = limit_40_50_SNR_O_232931[limit_40_50_SNR2_O_232931]

limit_40_50_t_O_232931 = limit_40_50_SNR_O_232931[limit_40_50_SNR2_O_232931]
limit_40_50_num16_three = WHERE((limit_40_50_t_O_232931 GT 3.0), count, /NULL)

limit_40_50_num16_three = WHERE((limit_40_50_SNR_O_232931[limit_40_50_SNR2_O_232931] GT 3.0), count);, /NULL)
PRINT, SIZE(limit_40_50_num16_three) ;0
PRINT, limit_40_50_SNR_O_232931[limit_40_50_num16_three] ;0.47

limit_40_50_O_232931_a = limit_40_50_It_O_232931[limit_40_50_SNR2_O_232931]
limit_40_50_O_232931 = limit_40_50_O_232931_a[limit_40_50_num16_three]

;concatenate arrays

limit_total_SNR = [limit_one,limit_70_80_one,limit_60_70_one,limit_50_60_one,limit_40_50_one,limit_two,limit_70_80_two,limit_60_70_two,limit_50_60_two,limit_40_50_two,limit_three,limit_70_80_three,limit_60_70_three,limit_50_60_three,limit_40_50_three,limit_four,limit_70_80_four,limit_60_70_four,limit_50_60_four,limit_40_50_four,limit_five,limit_70_80_five,limit_60_70_five,limit_50_60_five,limit_40_50_five,limit_six,limit_70_80_six,limit_60_70_six,limit_50_60_six,limit_40_50_six,limit_seven,limit_70_80_seven,limit_60_70_seven,limit_50_60_seven,limit_40_50_seven,limit_eight,limit_70_80_eight,limit_60_70_eight,limit_50_60_eight,limit_40_50_eight,limit_nine,limit_70_80_nine,limit_60_70_nine,limit_50_60_nine,limit_40_50_nine,limit_ten,limit_70_80_ten,limit_60_70_ten,limit_50_60_ten,limit_40_50_ten,limit_eleven,limit_70_80_eleven,limit_60_70_eleven,limit_50_60_eleven,limit_40_50_eleven,limit_twelve,limit_70_80_twelve,limit_60_70_twelve,limit_50_60_twelve,limit_40_50_twelve,limit_thirteen,limit_70_80_thirteen,limit_60_70_thirteen,limit_50_60_thirteen,limit_40_50_thirteen,limit_fourteen,limit_70_80_fourteen,limit_60_70_fourteen,limit_50_60_fourteen,limit_40_50_fourteen,limit_fifteen,limit_70_80_fifteen,limit_60_70_fifteen,limit_50_60_fifteen,limit_40_50_fifteen,limit_sixteen,limit_70_80_sixteen,limit_60_70_sixteen,limit_50_60_sixteen,limit_40_50_sixteen]
PRINT, SIZE(limit_total_SNR) ;999

;===============================================================================
;TII: It, int_int_unc w/ O IV and Si IV

PRINT, 'SECTION: TII'

;restore Si IV 004121 TIIs, SNRs, etc.

rfname_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/limit_IT_UV_004121.sav'
RESTORE, rfname_limit

PRINT, '004121'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_004121[limit_num_three]) ;2
PRINT, limit_It_Si_004121[limit_num_three] ;34.74 & 42.91

limit_Si_004121_a = limit_It_Si_004121[limit_SNR2_O_004121]
;PRINT, "limit_Si_004121_a"
;PRINT, limit_Si_004121_a
limit_Si_004121 = limit_Si_004121_a[limit_num_three]
;PRINT, "limit_Si_004121"
;PRINT, limit_Si_004121

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_004121[limit_70_80_num_three]) ;1
PRINT, limit_70_80_It_Si_004121[limit_70_80_num_three] ;41.69

limit_70_80_Si_004121_a = limit_70_80_It_Si_004121[limit_70_80_SNR2_O_004121]
limit_70_80_Si_004121 = limit_70_80_Si_004121_a[limit_70_80_num_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_004121[limit_60_70_num_three]) ;1
PRINT, limit_60_70_It_Si_004121[limit_60_70_num_three] ;39.98

limit_60_70_Si_004121_a = limit_60_70_It_Si_004121[limit_60_70_SNR2_O_004121]
limit_60_70_Si_004121 = limit_60_70_Si_004121_a[limit_60_70_num_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_004121[limit_50_60_num_three]) ;10
PRINT, limit_50_60_It_Si_004121[limit_50_60_num_three] ;2.55-63.30

limit_50_60_Si_004121_a = limit_50_60_It_Si_004121[limit_50_60_SNR2_O_004121]
limit_50_60_Si_004121 = limit_50_60_Si_004121_a[limit_50_60_num_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_004121[limit_40_50_num_three]) ;23
PRINT, limit_40_50_It_Si_004121[limit_40_50_num_three] ;3.15-39.59

limit_40_50_Si_004121_a = limit_40_50_It_Si_004121[limit_40_50_SNR2_O_004121]
limit_40_50_Si_004121 = limit_40_50_Si_004121_a[limit_40_50_num_three]

;restore Si IV 050655 TIIs, SNRs, etc.

rfname2_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster/limit_IT_UV_050655.sav'
RESTORE, rfname2_limit

PRINT, '050655'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_050655[limit_num2_three]) ;2
PRINT, limit_It_Si_050655[limit_num2_three] ;11.66 & 25.92

limit_Si_050655_a = limit_It_Si_050655[limit_SNR2_O_050655]
limit_Si_050655 = limit_Si_050655_a[limit_num2_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_050655[limit_70_80_num2_three]) ;1
PRINT, limit_70_80_It_Si_050655[limit_70_80_num2_three] ;71.97

limit_70_80_Si_050655_a = limit_70_80_It_Si_050655[limit_70_80_SNR2_O_050655]
limit_70_80_Si_050655 = limit_70_80_Si_050655_a[limit_70_80_num2_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_050655[limit_60_70_num2_three]) ;1
PRINT, limit_60_70_It_Si_050655[limit_60_70_num2_three] ;9.53

limit_60_70_Si_050655_a = limit_60_70_It_Si_050655[limit_60_70_SNR2_O_050655]
limit_60_70_Si_050655 = limit_60_70_Si_050655_a[limit_60_70_num2_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_050655[limit_50_60_num2_three]) ;7
PRINT, limit_50_60_It_Si_050655[limit_50_60_num2_three] ;24.01-303.62

limit_50_60_Si_050655_a = limit_50_60_It_Si_050655[limit_50_60_SNR2_O_050655]
limit_50_60_Si_050655 = limit_50_60_Si_050655_a[limit_50_60_num2_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_050655[limit_40_50_num2_three]) ;15
PRINT, limit_40_50_It_Si_050655[limit_40_50_num2_three] ;8.67-167.79

limit_40_50_Si_050655_a = limit_40_50_It_Si_050655[limit_40_50_SNR2_O_050655]
limit_40_50_Si_050655 = limit_40_50_Si_050655_a[limit_40_50_num2_three]

;restore Si IV 050655_1 TIIs, SNRs, etc.

rfname3_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/050655/raster1/limit_IT_UV_050655_1.sav'
RESTORE, rfname3_limit

PRINT, '050655_1'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_050655_1[limit_num3_three]) ;1
PRINT, limit_It_Si_050655_1[limit_num3_three] ;19.08

limit_Si_050655_1_a = limit_It_Si_050655_1[limit_SNR2_O_050655_1]
limit_Si_050655_1 = limit_Si_050655_1_a[limit_num3_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_050655_1[limit_70_80_num3_three]) ;1
PRINT, limit_70_80_It_Si_050655_1[limit_70_80_num3_three] ;11.02

limit_70_80_Si_050655_1_a = limit_70_80_It_Si_050655_1[limit_70_80_SNR2_O_050655_1]
limit_70_80_Si_050655_1 = limit_70_80_Si_050655_1_a[limit_70_80_num3_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_050655_1[limit_60_70_num3_three]) ;1
PRINT, limit_60_70_It_Si_050655_1[limit_60_70_num3_three] ;22.87

limit_60_70_Si_050655_1_a = limit_60_70_It_Si_050655_1[limit_60_70_SNR2_O_050655_1]
limit_60_70_Si_050655_1 = limit_60_70_Si_050655_1_a[limit_60_70_num3_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_050655_1[limit_50_60_num3_three]) ;4
PRINT, limit_50_60_It_Si_050655_1[limit_50_60_num3_three] ;8.17-25.43

limit_50_60_Si_050655_1_a = limit_50_60_It_Si_050655_1[limit_50_60_SNR2_O_050655_1]
limit_50_60_Si_050655_1 = limit_50_60_Si_050655_1_a[limit_50_60_num3_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_050655_1[limit_40_50_num3_three]) ;22
PRINT, limit_40_50_It_Si_050655_1[limit_40_50_num3_three] ;5.88-57.94

limit_40_50_Si_050655_1_a = limit_40_50_It_Si_050655_1[limit_40_50_SNR2_O_050655_1]
limit_40_50_Si_050655_1 = limit_40_50_Si_050655_1_a[limit_40_50_num3_three]

;restore Si IV 052046 TIIs, SNRs, etc.

rfname4_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/052046/limit_IT_UV_052046.sav'
RESTORE, rfname4_limit

PRINT, '052046'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_052046[limit_num4_three]) ;10
PRINT, limit_It_Si_052046[limit_num4_three] ;3.43-162.79

limit_Si_052046_a = limit_It_Si_052046[limit_SNR2_O_052046]
limit_Si_052046 = limit_Si_052046_a[limit_num4_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_052046[limit_70_80_num4_three]) ;19
PRINT, limit_70_80_It_Si_052046[limit_70_80_num4_three] ;3.81-154.73

limit_70_80_Si_052046_a = limit_70_80_It_Si_052046[limit_70_80_SNR2_O_052046]
limit_70_80_Si_052046 = limit_70_80_Si_052046_a[limit_70_80_num4_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_052046[limit_60_70_num4_three]) ;67
PRINT, limit_60_70_It_Si_052046[limit_60_70_num4_three] ;2.48-147.27

limit_60_70_Si_052046_a = limit_60_70_It_Si_052046[limit_60_70_SNR2_O_052046]
limit_60_70_Si_052046 = limit_60_70_Si_052046_a[limit_60_70_num4_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_052046[limit_50_60_num4_three]) ;100
PRINT, limit_50_60_It_Si_052046[limit_50_60_num4_three] ;3.90-385.22

limit_50_60_Si_052046_a = limit_50_60_It_Si_052046[limit_50_60_SNR2_O_052046]
limit_50_60_Si_052046 = limit_50_60_Si_052046_a[limit_50_60_num4_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_052046[limit_40_50_num4_three]) ;234
PRINT, limit_40_50_It_Si_052046[limit_40_50_num4_three] ;1.73-688.23
PRINT, MIN(limit_40_50_It_Si_052046[limit_40_50_num4_three])
PRINT, MAX(limit_40_50_It_Si_052046[limit_40_50_num4_three])

limit_40_50_Si_052046_a = limit_40_50_It_Si_052046[limit_40_50_SNR2_O_052046]
limit_40_50_Si_052046 = limit_40_50_Si_052046_a[limit_40_50_num4_three]

;restore Si IV 061606 TIIs, SNRs, etc.

rfname5_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/061606/limit_IT_UV_061606.sav'
RESTORE, rfname5_limit

PRINT, '061606'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_061606[limit_num5_three]) ;2
PRINT, limit_It_Si_061606[limit_num5_three] ;55.21 & 111.62

limit_Si_061606_a = limit_It_Si_061606[limit_SNR2_O_061606]
limit_Si_061606 = limit_Si_061606_a[limit_num5_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_061606[limit_70_80_num5_three]) ;1
PRINT, limit_70_80_It_Si_061606[limit_70_80_num5_three] ;23.86

limit_70_80_Si_061606_a = limit_70_80_It_Si_061606[limit_70_80_SNR2_O_061606]
limit_70_80_Si_061606 = limit_70_80_Si_061606_a[limit_70_80_num5_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_061606[limit_60_70_num5_three]) ;1
PRINT, limit_60_70_It_Si_061606[limit_60_70_num5_three] ;13.62

limit_60_70_Si_061606_a = limit_60_70_It_Si_061606[limit_60_70_SNR2_O_061606]
limit_60_70_Si_061606 = limit_60_70_Si_061606_a[limit_60_70_num5_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_061606[limit_50_60_num5_three]) ;8
PRINT, limit_50_60_It_Si_061606[limit_50_60_num5_three] ;3.85-16.88

limit_50_60_Si_061606_a = limit_50_60_It_Si_061606[limit_50_60_SNR2_O_061606]
limit_50_60_Si_061606 = limit_50_60_Si_061606_a[limit_50_60_num5_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_061606[limit_40_50_num5_three]) ;11
PRINT, limit_40_50_It_Si_061606[limit_40_50_num5_three] ;4.30-50.81

limit_40_50_Si_061606_a = limit_40_50_It_Si_061606[limit_40_50_SNR2_O_061606]
limit_40_50_Si_061606 = limit_40_50_Si_061606_a[limit_40_50_num5_three]

;restore Si IV 114951 TIIs, SNRs, etc.

rfname6_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/114951/limit_IT_UV_114951.sav'
RESTORE, rfname6_limit

PRINT, '114951'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_114951[limit_num6_three]) ;1
PRINT, limit_It_Si_114951[limit_num6_three] ;71.53

limit_Si_114951_a = limit_It_Si_114951[limit_SNR2_O_114951]
limit_Si_114951 = limit_Si_114951_a[limit_num6_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_114951[limit_70_80_num6_three]) ;1
PRINT, limit_70_80_It_Si_114951[limit_70_80_num6_three] ;384.28

limit_70_80_Si_114951_a = limit_70_80_It_Si_114951[limit_70_80_SNR2_O_114951]
limit_70_80_Si_114951 = limit_70_80_Si_114951_a[limit_70_80_num6_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_114951[limit_60_70_num6_three]) ;3
PRINT, limit_60_70_It_Si_114951[limit_60_70_num6_three] ;65.94-77.05

limit_60_70_Si_114951_a = limit_60_70_It_Si_114951[limit_60_70_SNR2_O_114951]
limit_60_70_Si_114951 = limit_60_70_Si_114951_a[limit_60_70_num6_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_114951[limit_50_60_num6_three]) ;12
PRINT, limit_50_60_It_Si_114951[limit_50_60_num6_three] ;30.31-104.44

limit_50_60_Si_114951_a = limit_50_60_It_Si_114951[limit_50_60_SNR2_O_114951]
limit_50_60_Si_114951 = limit_50_60_Si_114951_a[limit_50_60_num6_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_114951[limit_40_50_num6_three]) ;15
PRINT, limit_40_50_It_Si_114951[limit_40_50_num6_three] ;ALL 21.73!!!!!!!!!!!

limit_40_50_Si_114951_a = limit_40_50_It_Si_114951[limit_40_50_SNR2_O_114951]
limit_40_50_Si_114951 = limit_40_50_Si_114951_a[limit_40_50_num6_three]

;restore Si IV 122033 TIIs, SNRs, etc.

rfname7_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/122033/limit_IT_UV_122033.sav'
RESTORE, rfname7_limit

PRINT, '122033'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_122033[limit_num7_three]) ;15
PRINT, limit_It_Si_122033[limit_num7_three] ;18.48-279.32

limit_Si_122033_a = limit_It_Si_122033[limit_SNR2_O_122033]
limit_Si_122033 = limit_Si_122033_a[limit_num7_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_122033[limit_70_80_num7_three]) ;9
PRINT, limit_70_80_It_Si_122033[limit_70_80_num7_three] ;8.59-170.99

limit_70_80_Si_122033_a = limit_70_80_It_Si_122033[limit_70_80_SNR2_O_122033]
limit_70_80_Si_122033 = limit_70_80_Si_122033_a[limit_70_80_num7_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_122033[limit_60_70_num7_three]) ;20
PRINT, limit_60_70_It_Si_122033[limit_60_70_num7_three] ;6.75-193.47

limit_60_70_Si_122033_a = limit_60_70_It_Si_122033[limit_60_70_SNR2_O_122033]
limit_60_70_Si_122033 = limit_60_70_Si_122033_a[limit_60_70_num7_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_122033[limit_50_60_num7_three]) ;46
PRINT, limit_50_60_It_Si_122033[limit_50_60_num7_three] ;2.90-107.34

limit_50_60_Si_122033_a = limit_50_60_It_Si_122033[limit_50_60_SNR2_O_122033]
limit_50_60_Si_122033 = limit_50_60_Si_122033_a[limit_50_60_num7_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_122033[limit_40_50_num7_three]) ;118
PRINT, limit_40_50_It_Si_122033[limit_40_50_num7_three] ;ALL 21.67!!!!!!!!!!!!

limit_40_50_Si_122033_a = limit_40_50_It_Si_122033[limit_40_50_SNR2_O_122033]
limit_40_50_Si_122033 = limit_40_50_Si_122033_a[limit_40_50_num7_three]

;restore Si IV 160806 TIIs, SNRs, etc.

rfname8_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/160806/limit_IT_UV_160806.sav'
RESTORE, rfname8_limit

PRINT, '160806'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_160806[limit_num8_three]) ;2
PRINT, limit_It_Si_160806[limit_num8_three] ;65.81 & 70.71

limit_Si_160806_a = limit_It_Si_160806[limit_SNR2_O_160806]
limit_Si_160806 = limit_Si_160806_a[limit_num8_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_160806[limit_70_80_num8_three]) ;1
PRINT, limit_70_80_It_Si_160806[limit_70_80_num8_three] ;29.47

limit_70_80_Si_160806_a = limit_70_80_It_Si_160806[limit_70_80_SNR2_O_160806]
limit_70_80_Si_160806 = limit_70_80_Si_160806_a[limit_70_80_num8_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_160806[limit_60_70_num8_three]) ;1
PRINT, limit_60_70_It_Si_160806[limit_60_70_num8_three] ;15.28

limit_60_70_Si_160806_a = limit_60_70_It_Si_160806[limit_60_70_SNR2_O_160806]
limit_60_70_Si_160806 = limit_60_70_Si_160806_a[limit_60_70_num8_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_160806[limit_50_60_num8_three]) ;2
PRINT, limit_50_60_It_Si_160806[limit_50_60_num8_three] ;12.28 & 16.66

limit_50_60_Si_160806_a = limit_50_60_It_Si_160806[limit_50_60_SNR2_O_160806]
limit_50_60_Si_160806 = limit_50_60_Si_160806_a[limit_50_60_num8_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_160806[limit_40_50_num8_three]) ;9
PRINT, limit_40_50_It_Si_160806[limit_40_50_num8_three] ;ALL 17.35!!!!!!!!!!!!!!

limit_40_50_Si_160806_a = limit_40_50_It_Si_160806[limit_40_50_SNR2_O_160806]
limit_40_50_Si_160806 = limit_40_50_Si_160806_a[limit_40_50_num8_three]

;restore Si IV 163205 TIIs, SNRs, etc.

rfname9_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/163205/limit_IT_UV_163205.sav'
RESTORE, rfname9_limit

PRINT, '163205'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_163205[limit_num9_three]) ;1
PRINT, limit_It_Si_163205[limit_num9_three] ;14.16

limit_Si_163205_a = limit_It_Si_163205[limit_SNR2_O_163205]
limit_Si_163205 = limit_Si_163205_a[limit_num9_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_163205[limit_70_80_num9_three]) ;1
PRINT, limit_70_80_It_Si_163205[limit_70_80_num9_three] ;7.21

limit_70_80_Si_163205_a = limit_70_80_It_Si_163205[limit_70_80_SNR2_O_163205]
limit_70_80_Si_163205 = limit_70_80_Si_163205_a[limit_70_80_num9_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_163205[limit_60_70_num9_three]) ;1
PRINT, limit_60_70_It_Si_163205[limit_60_70_num9_three] ;66.08

limit_60_70_Si_163205_a = limit_60_70_It_Si_163205[limit_60_70_SNR2_O_163205]
limit_60_70_Si_163205 = limit_60_70_Si_163205_a[limit_60_70_num9_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_163205[limit_50_60_num9_three]) ;12
PRINT, limit_50_60_It_Si_163205[limit_50_60_num9_three] ;13.62-65.18

limit_50_60_Si_163205_a = limit_50_60_It_Si_163205[limit_50_60_SNR2_O_163205]
limit_50_60_Si_163205 = limit_50_60_Si_163205_a[limit_50_60_num9_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_163205[limit_40_50_num9_three]) ;5
PRINT, limit_40_50_It_Si_163205[limit_40_50_num9_three] ;ALL 7.21!!!!!!!!!!!!!!!

limit_40_50_Si_163205_a = limit_40_50_It_Si_163205[limit_40_50_SNR2_O_163205]
limit_40_50_Si_163205 = limit_40_50_Si_163205_a[limit_40_50_num9_three]

;restore Si IV 174905 TIIs, SNRs, etc.

rfname10_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/174905/limit_IT_UV_174905.sav'
RESTORE, rfname10_limit

PRINT, '174905'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_174905[limit_num10_three]) ;4
PRINT, limit_It_Si_174905[limit_num10_three] ;52.57-61.91

limit_Si_174905_a = limit_It_Si_174905[limit_SNR2_O_174905]
limit_Si_174905 = limit_Si_174905_a[limit_num10_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_174905[limit_70_80_num10_three]) ;1
PRINT, limit_70_80_It_Si_174905[limit_70_80_num10_three] ;56.86

limit_70_80_Si_174905_a = limit_70_80_It_Si_174905[limit_70_80_SNR2_O_174905]
limit_70_80_Si_174905 = limit_70_80_Si_174905_a[limit_70_80_num10_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_174905[limit_60_70_num10_three]) ;7
PRINT, limit_60_70_It_Si_174905[limit_60_70_num10_three] ;21.57-107.44

limit_60_70_Si_174905_a = limit_60_70_It_Si_174905[limit_60_70_SNR2_O_174905]
limit_60_70_Si_174905 = limit_60_70_Si_174905_a[limit_60_70_num10_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_174905[limit_50_60_num10_three]) ;21
PRINT, limit_50_60_It_Si_174905[limit_50_60_num10_three] ;6.44-295.33

limit_50_60_Si_174905_a = limit_50_60_It_Si_174905[limit_50_60_SNR2_O_174905]
limit_50_60_Si_174905 = limit_50_60_Si_174905_a[limit_50_60_num10_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_174905[limit_40_50_num10_three]) ;56
PRINT, limit_40_50_It_Si_174905[limit_40_50_num10_three] ;ALL 66.70!!!!!!!!!!!

limit_40_50_Si_174905_a = limit_40_50_It_Si_174905[limit_40_50_SNR2_O_174905]
limit_40_50_Si_174905 = limit_40_50_Si_174905_a[limit_40_50_num10_three]

;restore Si IV 181205 TIIs, SNRs, etc.

rfname11_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/181205/limit_IT_UV_181205.sav'
RESTORE, rfname11_limit

PRINT, '181205'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_181205[limit_num11_three]) ;1
PRINT, limit_It_Si_181205[limit_num11_three] ;105.54

limit_Si_181205_a = limit_It_Si_181205[limit_SNR2_O_181205]
limit_Si_181205 = limit_Si_181205_a[limit_num11_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_181205[limit_70_80_num11_three]) ;1
PRINT, limit_70_80_It_Si_181205[limit_70_80_num11_three] ;87.43

limit_70_80_Si_181205_a = limit_70_80_It_Si_181205[limit_70_80_SNR2_O_181205]
limit_70_80_Si_181205 = limit_70_80_Si_181205_a[limit_70_80_num11_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_181205[limit_60_70_num11_three]) ;1
PRINT, limit_60_70_It_Si_181205[limit_60_70_num11_three] ;33.16

limit_60_70_Si_181205_a = limit_60_70_It_Si_181205[limit_60_70_SNR2_O_181205]
limit_60_70_Si_181205 = limit_60_70_Si_181205_a[limit_60_70_num11_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_181205[limit_50_60_num11_three]) ;2
PRINT, limit_50_60_It_Si_181205[limit_50_60_num11_three] ;30.74 & 45.13

limit_50_60_Si_181205_a = limit_50_60_It_Si_181205[limit_50_60_SNR2_O_181205]
limit_50_60_Si_181205 = limit_50_60_Si_181205_a[limit_50_60_num11_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_181205[limit_40_50_num11_three]) ;13
PRINT, limit_40_50_It_Si_181205[limit_40_50_num11_three] ;9.05-443.33 REPEATS!!!

limit_40_50_Si_181205_a = limit_40_50_It_Si_181205[limit_40_50_SNR2_O_181205]
limit_40_50_Si_181205 = limit_40_50_Si_181205_a[limit_40_50_num11_three]

;restore Si IV 201925 TIIs, SNRs, etc.

rfname12_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster/limit_IT_UV_201925.sav'
RESTORE, rfname12_limit

PRINT, '201925'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_201925[limit_num12_three]) ;1
PRINT, limit_It_Si_201925[limit_num12_three] ;63.49

limit_Si_201925_a = limit_It_Si_201925[limit_SNR2_O_201925]
;PRINT, limit_Si_201925_a ;9.26
limit_Si_201925 = limit_Si_201925_a[limit_num12_three]
;PRINT, limit_Si_201925 ;9.26

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_201925[limit_70_80_num12_three]) ;1
PRINT, limit_70_80_It_Si_201925[limit_70_80_num12_three] ;122.70

limit_70_80_Si_201925_a = limit_70_80_It_Si_201925[limit_70_80_SNR2_O_201925]
limit_70_80_Si_201925 = limit_70_80_Si_201925_a[limit_70_80_num12_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_201925[limit_60_70_num12_three]) ;1
PRINT, limit_60_70_It_Si_201925[limit_60_70_num12_three] ;27.61

limit_60_70_Si_201925_a = limit_60_70_It_Si_201925[limit_60_70_SNR2_O_201925]
limit_60_70_Si_201925 = limit_60_70_Si_201925_a[limit_60_70_num12_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_201925[limit_50_60_num12_three]) ;2
PRINT, limit_50_60_It_Si_201925[limit_50_60_num12_three] ;25.63 & 25.91

limit_50_60_Si_201925_a = limit_50_60_It_Si_201925[limit_50_60_SNR2_O_201925]
limit_50_60_Si_201925 = limit_50_60_Si_201925_a[limit_50_60_num12_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_201925[limit_40_50_num12_three]) ;7
PRINT, limit_40_50_It_Si_201925[limit_40_50_num12_three] ;6.39-15.47

limit_40_50_Si_201925_a = limit_40_50_It_Si_201925[limit_40_50_SNR2_O_201925]
limit_40_50_Si_201925 = limit_40_50_Si_201925_a[limit_40_50_num12_three]

;restore Si IV 201925_1 TIIs, SNRs, etc.

rfname13_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/201925/raster1/limit_IT_UV_201925_1.sav'
RESTORE, rfname13_limit

PRINT, '201925_1'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_201925_1[limit_num13_three]) ;1
PRINT, limit_It_Si_201925_1[limit_num13_three] ;48.97

limit_Si_201925_1_a = limit_It_Si_201925_1[limit_SNR2_O_201925_1]
limit_Si_201925_1 = limit_Si_201925_1_a[limit_num13_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_201925_1[limit_70_80_num13_three]) ;1
PRINT, limit_70_80_It_Si_201925_1[limit_70_80_num13_three] ;45.60

limit_70_80_Si_201925_1_a = limit_70_80_It_Si_201925_1[limit_70_80_SNR2_O_201925_1]
limit_70_80_Si_201925_1 = limit_70_80_Si_201925_1_a[limit_70_80_num13_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_201925_1[limit_60_70_num13_three]) ;1
PRINT, limit_60_70_It_Si_201925_1[limit_60_70_num13_three] ;13.14

limit_60_70_Si_201925_1_a = limit_60_70_It_Si_201925_1[limit_60_70_SNR2_O_201925_1]
limit_60_70_Si_201925_1 = limit_60_70_Si_201925_1_a[limit_60_70_num13_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_201925_1[limit_50_60_num13_three]) ;1
PRINT, limit_50_60_It_Si_201925_1[limit_50_60_num13_three] ;25.17

limit_50_60_Si_201925_1_a = limit_50_60_It_Si_201925_1[limit_50_60_SNR2_O_201925_1]
limit_50_60_Si_201925_1 = limit_50_60_Si_201925_1_a[limit_50_60_num13_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_201925_1[limit_40_50_num13_three]) ;7
PRINT, limit_40_50_It_Si_201925_1[limit_40_50_num13_three] ;12.02-1106.81

limit_40_50_Si_201925_1_a = limit_40_50_It_Si_201925_1[limit_40_50_SNR2_O_201925_1]
limit_40_50_Si_201925_1 = limit_40_50_Si_201925_1_a[limit_40_50_num13_three]

;restore Si IV 203906 TIIs, SNRs, etc.

rfname14_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/203906/limit_IT_UV_203906.sav'
RESTORE, rfname14_limit

PRINT, '203906'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_203906[limit_num14_three]) ;7
PRINT, limit_It_Si_203906[limit_num14_three] ;8.23-132.25

limit_Si_203906_a = limit_It_Si_203906[limit_SNR2_O_203906]
limit_Si_203906 = limit_Si_203906_a[limit_num14_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_203906[limit_70_80_num14_three]) ;3
PRINT, limit_70_80_It_Si_203906[limit_70_80_num14_three] ;7.22-14.22

limit_70_80_Si_203906_a = limit_70_80_It_Si_203906[limit_70_80_SNR2_O_203906]
limit_70_80_Si_203906 = limit_70_80_Si_203906_a[limit_70_80_num14_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_203906[limit_60_70_num14_three]) ;4
PRINT, limit_60_70_It_Si_203906[limit_60_70_num14_three] ;8.92-19.79

limit_60_70_Si_203906_a = limit_60_70_It_Si_203906[limit_60_70_SNR2_O_203906]
limit_60_70_Si_203906 = limit_60_70_Si_203906_a[limit_60_70_num14_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_203906[limit_50_60_num14_three]) ;3
PRINT, limit_50_60_It_Si_203906[limit_50_60_num14_three] ;8.01-17.07

limit_50_60_Si_203906_a = limit_50_60_It_Si_203906[limit_50_60_SNR2_O_203906]
limit_50_60_Si_203906 = limit_50_60_Si_203906_a[limit_50_60_num14_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_203906[limit_40_50_num14_three]) ;18
PRINT, limit_40_50_It_Si_203906[limit_40_50_num14_three] ;ALL 11.41!!!!!!!!!!!!

limit_40_50_Si_203906_a = limit_40_50_It_Si_203906[limit_40_50_SNR2_O_203906]
limit_40_50_Si_203906 = limit_40_50_Si_203906_a[limit_40_50_num14_three]

;restore Si IV 215426 TIIs, SNRs, etc.

rfname15_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/215426/limit_IT_UV_215426.sav'
RESTORE, rfname15_limit

PRINT, '215426'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_215426[limit_num15_three]) ;1
PRINT, limit_It_Si_215426[limit_num15_three] ;8.04

limit_Si_215426_a = limit_It_Si_215426[limit_SNR2_O_215426]
limit_Si_215426 = limit_Si_215426_a[limit_num15_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_215426[limit_70_80_num15_three]) ;1
PRINT, limit_70_80_It_Si_215426[limit_70_80_num15_three] ;6.29

limit_70_80_Si_215426_a = limit_70_80_It_Si_215426[limit_70_80_SNR2_O_215426]
limit_70_80_Si_215426 = limit_70_80_Si_215426_a[limit_70_80_num15_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_215426[limit_60_70_num15_three]) ;1
PRINT, limit_60_70_It_Si_215426[limit_60_70_num15_three] ;232.10

limit_60_70_Si_215426_a = limit_60_70_It_Si_215426[limit_60_70_SNR2_O_215426]
limit_60_70_Si_215426 = limit_60_70_Si_215426_a[limit_60_70_num15_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_215426[limit_50_60_num15_three]) ;1
PRINT, limit_50_60_It_Si_215426[limit_50_60_num15_three] ;188.13

limit_50_60_Si_215426_a = limit_50_60_It_Si_215426[limit_50_60_SNR2_O_215426]
limit_50_60_Si_215426 = limit_50_60_Si_215426_a[limit_50_60_num15_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_215426[limit_40_50_num15_three]) ;15
PRINT, limit_40_50_It_Si_215426[limit_40_50_num15_three] ;2.26-50.35

limit_40_50_Si_215426_a = limit_40_50_It_Si_215426[limit_40_50_SNR2_O_215426]
limit_40_50_Si_215426 = limit_40_50_Si_215426_a[limit_40_50_num15_three]

;restore Si IV 232931 TIIs, SNRs, etc.

rfname16_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/232931/limit_IT_UV_232931.sav'
RESTORE, rfname16_limit

PRINT, '232931'

;80-1000 km/s velocity
PRINT, N_ELEMENTS(limit_It_Si_232931[limit_num16_three]) ;1
PRINT, limit_It_Si_232931[limit_num16_three] ;154.65

limit_Si_232931_a = limit_It_Si_232931[limit_SNR2_O_232931]
limit_Si_232931 = limit_Si_232931_a[limit_num16_three]

;70-80 km/s velocity
PRINT, N_ELEMENTS(limit_70_80_It_Si_232931[limit_70_80_num16_three]) ;1
PRINT, limit_70_80_It_Si_232931[limit_70_80_num16_three] ;92.19

limit_70_80_Si_232931_a = limit_70_80_It_Si_232931[limit_70_80_SNR2_O_232931]
limit_70_80_Si_232931 = limit_70_80_Si_232931_a[limit_70_80_num16_three]

;60-70 km/s velocity
PRINT, N_ELEMENTS(limit_60_70_It_Si_232931[limit_60_70_num16_three]) ;1
PRINT, limit_60_70_It_Si_232931[limit_60_70_num16_three] ;47.87

limit_60_70_Si_232931_a = limit_60_70_It_Si_232931[limit_60_70_SNR2_O_232931]
limit_60_70_Si_232931 = limit_60_70_Si_232931_a[limit_60_70_num16_three]

;50-60 km/s velocity
PRINT, N_ELEMENTS(limit_50_60_It_Si_232931[limit_50_60_num16_three]) ;1
PRINT, limit_50_60_It_Si_232931[limit_50_60_num16_three] ;1.82

limit_50_60_Si_232931_a = limit_50_60_It_Si_232931[limit_50_60_SNR2_O_232931]
limit_50_60_Si_232931 = limit_50_60_Si_232931_a[limit_50_60_num16_three]

;40-50 km/s velocity
PRINT, N_ELEMENTS(limit_40_50_It_Si_232931[limit_40_50_num16_three]) ;1
PRINT, limit_40_50_It_Si_232931[limit_40_50_num16_three] ;2.52

limit_40_50_Si_232931_a = limit_40_50_It_Si_232931[limit_40_50_SNR2_O_232931]
limit_40_50_Si_232931 = limit_40_50_Si_232931_a[limit_40_50_num16_three]

;===============================================================================
;retrieve Si IV 1393.8/O IV ratios

PRINT, 'Si IV/O IV'

PRINT, '004121'

;80-1000 km/s velocity
limit_ratio_004121 = (limit_Si_004121/limit_O_004121)
PRINT, "limit_Si_004121"
PRINT, limit_Si_004121 ;BIGGER 34.74,42.91

PRINT, "limit_O_004121"
PRINT, limit_O_004121 ;SMALLER 6.19,4.11

PRINT, "limit_ratio_004121"
PRINT, limit_ratio_004121 ;5.6084191 & 10.424135

;70-80 km/s velocity
limit_70_80_ratio_004121 = (limit_70_80_Si_004121/limit_70_80_O_004121)
PRINT, "limit_70_80_Si_004121"
PRINT, limit_70_80_Si_004121 ;41.69

PRINT, "limit_70_80_O_004121"
PRINT, limit_70_80_O_004121 ;4.82

PRINT, "limit_70_80_ratio_004121"
PRINT, limit_70_80_ratio_004121 ;8.64

;60-70 km/s velocity
limit_60_70_ratio_004121 = (limit_60_70_Si_004121/limit_60_70_O_004121)
PRINT, "limit_60_70_Si_004121"
PRINT, limit_60_70_Si_004121 ;40.59

PRINT, "limit_60_70_O_004121"
PRINT, limit_60_70_O_004121 ;0.19

PRINT, "limit_60_70_ratio_004121"
PRINT, limit_60_70_ratio_004121 ;209.02

;50-60 km/s velocity
limit_50_60_ratio_004121 = (limit_50_60_Si_004121/limit_50_60_O_004121)
PRINT, "limit_50_60_Si_004121"
PRINT, limit_50_60_Si_004121 ;2.55-63.30

PRINT, "limit_50_60_O_004121"
PRINT, limit_50_60_O_004121 ;2.45-3.99

PRINT, "limit_50_60_ratio_004121"
PRINT, limit_50_60_ratio_004121 ;0.66-15.85 (JUST 1 0...)

;40-50 km/s velocity
limit_40_50_ratio_004121 = (limit_40_50_Si_004121/limit_40_50_O_004121)
PRINT, "limit_40_50_Si_004121"
PRINT, limit_40_50_Si_004121 ;3.15-39.59

PRINT, "limit_40_50_O_004121"
PRINT, limit_40_50_O_004121 ;1.60-6.48

PRINT, "limit_40_50_ratio_004121"
PRINT, limit_40_50_ratio_004121 ;0.65-10.74 (JUST 1 O...)

PRINT, '050655'

;80-1000 km/s velocity
limit_ratio_050655 = (limit_Si_050655/limit_O_050655)
PRINT, "limit_Si_050655"
PRINT, limit_Si_050655 ;BIGGER 11.66,25.92

PRINT, "limit_O_050655"
PRINT, limit_O_050655 ;SMALLER 4.01,13.40

PRINT, "limit_ratio_050655"
PRINT, limit_ratio_050655 ;2.9081764 & 1.9344642

;70-80 km/s velocity
limit_70_80_ratio_050655 = (limit_70_80_Si_050655/limit_70_80_O_050655)
PRINT, "limit_70_80_Si_050655"
PRINT, limit_70_80_Si_050655 ;20.57

PRINT, "limit_70_80_O_050655"
PRINT, limit_70_80_O_050655 ;0.41

PRINT, "limit_70_80_ratio_050655"
PRINT, limit_70_80_ratio_050655 ;50.01

;60-70 km/s velocity
limit_60_70_ratio_050655 = (limit_60_70_Si_050655/limit_60_70_O_050655)
PRINT, "limit_60_70_Si_050655"
PRINT, limit_60_70_Si_050655 ;9.53

PRINT, "limit_60_70_O_050655"
PRINT, limit_60_70_O_050655 ;7.47

PRINT, "limit_60_70_ratio_050655"
PRINT, limit_60_70_ratio_050655 ;1.27

;50-60 km/s velocity
limit_50_60_ratio_050655 = (limit_50_60_Si_050655/limit_50_60_O_050655)
PRINT, "limit_50_60_Si_050655"
PRINT, limit_50_60_Si_050655 ;24.01-303.62

PRINT, "limit_50_60_O_050655"
PRINT, limit_50_60_O_050655 ;1.95-8.76

PRINT, "limit_50_60_ratio_050655"
PRINT, limit_50_60_ratio_050655 ;5.71-154.92

;40-50 km/s velocity
limit_40_50_ratio_050655 = (limit_40_50_Si_050655/limit_40_50_O_050655)
PRINT, "limit_40_50_Si_050655"
PRINT, limit_40_50_Si_050655 ;9.18-167.79

PRINT, "limit_40_50_O_050655"
PRINT, limit_40_50_O_050655 ;1.72-9.70

PRINT, "limit_40_50_ratio_050655"
PRINT, limit_40_50_ratio_050655 ;2.40-39.09

PRINT, '050655_1'

;80-1000 km/s velocity
limit_ratio_050655_1 = (limit_Si_050655_1/limit_O_050655_1)
PRINT, "limit_Si_050655_1"
PRINT, limit_Si_050655_1 ;BIGGER 19.08

PRINT, "limit_O_050655_1"
PRINT, limit_O_050655_1 ;SMALLER 3.18

PRINT, "limit_ratio_050655_1"
PRINT, limit_ratio_050655_1 ;5.9972971

;70-80 km/s velocity
limit_70_80_ratio_050655_1 = (limit_70_80_Si_050655_1/limit_70_80_O_050655_1)
PRINT, "limit_70_80_Si_050655_1"
PRINT, limit_70_80_Si_050655_1 ;11.02

PRINT, "limit_70_80_O_050655_1"
PRINT, limit_70_80_O_050655_1 ;3.18

PRINT, "limit_70_80_ratio_050655_1"
PRINT, limit_70_80_ratio_050655_1 ;3.46

;60-70 km/s velocity
limit_60_70_ratio_050655_1 = (limit_60_70_Si_050655_1/limit_60_70_O_050655_1)
PRINT, "limit_60_70_Si_050655_1"
PRINT, limit_60_70_Si_050655_1 ;22.87

PRINT, "limit_60_70_O_050655_1"
PRINT, limit_60_70_O_050655_1 ;3.18

PRINT, "limit_60_70_ratio_050655_1"
PRINT, limit_60_70_ratio_050655_1 ;7.18

;50-60 km/s velocity
limit_50_60_ratio_050655_1 = (limit_50_60_Si_050655_1/limit_50_60_O_050655_1)
PRINT, "limit_50_60_Si_050655_1"
PRINT, limit_50_60_Si_050655_1 ;8.17-25.43

PRINT, "limit_50_60_O_050655_1"
PRINT, limit_50_60_O_050655_1 ;1.86-2.88

PRINT, "limit_50_60_ratio_050655_1"
PRINT, limit_50_60_ratio_050655_1 ;2.83-13.66

;40-50 km/s velocity
limit_40_50_ratio_050655_1 = (limit_40_50_Si_050655_1/limit_40_50_O_050655_1)
PRINT, "limit_40_50_Si_050655_1"
PRINT, limit_40_50_Si_050655_1 ;5.88-57.94

PRINT, "limit_40_50_O_050655_1"
PRINT, limit_40_50_O_050655_1 ;1.63-4.27

PRINT, "limit_40_50_ratio_050655_1"
PRINT, limit_40_50_ratio_050655_1 ;1.93-34.53

PRINT, '052046'

;80-1000 km/s velocity
limit_ratio_052046 = (limit_Si_052046/limit_O_052046)
PRINT, "limit_Si_052046"
PRINT, limit_Si_052046 ;BIGGER (by 3/10) 3.43-162.79

PRINT, "limit_O_052046"
PRINT, limit_O_052046 ;BIGGER (by 7/10) 4.43-24.50

PRINT, "limit_ratio_052046"
PRINT, limit_ratio_052046 ;0.84251019,0.25333793,3.3036951,0.23823155,0.26797380,0.15089491,6.9175352,0.57621893,0.31173167,10.739133 (JUST 7 0...)

;70-80 km/s velocity
limit_70_80_ratio_052046 = (limit_70_80_Si_052046/limit_70_80_O_052046)
PRINT, "limit_70_80_Si_052046"
PRINT, limit_70_80_Si_052046 ;3.81-146.35

PRINT, "limit_70_80_O_052046"
PRINT, limit_70_80_O_052046 ;3.00-24.11

PRINT, "limit_70_80_ratio_052046"
PRINT, limit_70_80_ratio_052046 ;0.16-17.03 (JUST 6 0...)

;60-70 km/s velocity
limit_60_70_ratio_052046 = (limit_60_70_Si_052046/limit_60_70_O_052046)
PRINT, "limit_60_70_Si_052046"
PRINT, limit_60_70_Si_052046 ;2.48-147.27

PRINT, "limit_60_70_O_052046"
PRINT, limit_60_70_O_052046 ;2.38-23.97

PRINT, "limit_60_70_ratio_052046"
PRINT, limit_60_70_ratio_052046 ;0.31-20.47 (JUST 8 0...)

;50-60 km/s velocity
limit_50_60_ratio_052046 = (limit_50_60_Si_052046/limit_50_60_O_052046)
PRINT, "limit_50_60_Si_052046"
PRINT, limit_50_60_Si_052046 ;3.90-476.21

PRINT, "limit_50_60_O_052046"
PRINT, limit_50_60_O_052046 ;2.04-40.29

PRINT, "limit_50_60_ratio_052046"
PRINT, limit_50_60_ratio_052046 ;0.37-477.38 (JUST 13 0...)

;40-50 km/s velocity
limit_40_50_ratio_052046 = (limit_40_50_Si_052046/limit_40_50_O_052046)
PRINT, "limit_40_50_Si_052046"
PRINT, limit_40_50_Si_052046 ;1.73-688.23
PRINT, MIN(limit_40_50_Si_052046)
PRINT, MAX(limit_40_50_Si_052046)

PRINT, "limit_40_50_O_052046"
PRINT, limit_40_50_O_052046 ;1.53-16.74
PRINT, MIN(limit_40_50_O_052046)
PRINT, MAX(limit_40_50_O_052046)

PRINT, "limit_40_50_ratio_052046"
PRINT, limit_40_50_ratio_052046 ;0.46-279.35 (JUST 24 0...)
PRINT, MIN(limit_40_50_ratio_052046)
PRINT, MAX(limit_40_50_ratio_052046)

PRINT, '061606'

;80-1000 km/s velocity
limit_ratio_061606 = (limit_Si_061606/limit_O_061606)
PRINT, "limit_Si_061606"
PRINT, limit_Si_061606 ;BIGGER 55.21,111.62

PRINT, "limit_O_061606"
PRINT, limit_O_061606 ;SMALLER 13.05,14.57

PRINT, "limit_ratio_061606"
PRINT, limit_ratio_061606 ;4.2302477 & 7.6606455

;70-80 km/s velocity
limit_70_80_ratio_061606 = (limit_70_80_Si_061606/limit_70_80_O_061606)
PRINT, "limit_70_80_Si_061606"
PRINT, limit_70_80_Si_061606 ;23.86

PRINT, "limit_70_80_O_061606"
PRINT, limit_70_80_O_061606 ;1.68

PRINT, "limit_70_80_ratio_061606"
PRINT, limit_70_80_ratio_061606 ;14.13

;60-70 km/s velocity
limit_60_70_ratio_061606 = (limit_60_70_Si_061606/limit_60_70_O_061606)
PRINT, "limit_60_70_Si_061606"
PRINT, limit_60_70_Si_061606 ;13.62

PRINT, "limit_60_70_O_061606"
PRINT, limit_60_70_O_061606 ;1.68

PRINT, "limit_60_70_ratio_061606"
PRINT, limit_60_70_ratio_061606 ;8.06

;50-60 km/s velocity
limit_50_60_ratio_061606 = (limit_50_60_Si_061606/limit_50_60_O_061606)
PRINT, "limit_50_60_Si_061606"
PRINT, limit_50_60_Si_061606 ;3.85-16.88

PRINT, "limit_50_60_O_061606"
PRINT, limit_50_60_O_061606 ;1.98-2.70

PRINT, "limit_50_60_ratio_061606"
PRINT, limit_50_60_ratio_061606 ;1.74-8.49

;40-50 km/s velocity
limit_40_50_ratio_061606 = (limit_40_50_Si_061606/limit_40_50_O_061606)
PRINT, "limit_40_50_Si_061606"
PRINT, limit_40_50_Si_061606 ;4.30-50.81

PRINT, "limit_40_50_O_061606"
PRINT, limit_40_50_O_061606 ;2.14-5.20

PRINT, "limit_40_50_ratio_061606"
PRINT, limit_40_50_ratio_061606 ;1.01-20.28

PRINT, '114951'

;80-1000 km/s velocity
limit_ratio_114951 = (limit_Si_114951/limit_O_114951)
PRINT, "limit_Si_114951"
PRINT, limit_Si_114951 ;BIGGER 13.69

PRINT, "limit_O_114951"
PRINT, limit_O_114951 ;SMALLER 0.085

PRINT, "limit_ratio_114951"
PRINT, limit_ratio_114951 ;159.99232

;70-80 km/s velocity
limit_70_80_ratio_114951 = (limit_70_80_Si_114951/limit_70_80_O_114951)
PRINT, "limit_70_80_Si_114951"
PRINT, limit_70_80_Si_114951 ;71.60

PRINT, "limit_70_80_O_114951"
PRINT, limit_70_80_O_114951 ;0.085

PRINT, "limit_70_80_ratio_114951"
PRINT, limit_70_80_ratio_114951 ;836.24

;60-70 km/s velocity
limit_60_70_ratio_114951 = (limit_60_70_Si_114951/limit_60_70_O_114951)
PRINT, "limit_60_70_Si_114951"
PRINT, limit_60_70_Si_114951 ;77.05,75.36,65.94

PRINT, "limit_60_70_O_114951"
PRINT, limit_60_70_O_114951 ;3.67,4.11,3.38

PRINT, "limit_60_70_ratio_114951"
PRINT, limit_60_70_ratio_114951 ;20.98,18.31,19.45

;50-60 km/s velocity
limit_50_60_ratio_114951 = (limit_50_60_Si_114951/limit_50_60_O_114951)
PRINT, "limit_50_60_Si_114951"
PRINT, limit_50_60_Si_114951 ;30.31-104.44

PRINT, "limit_50_60_O_114951"
PRINT, limit_50_60_O_114951 ;2.26-46.71

PRINT, "limit_50_60_ratio_114951"
PRINT, limit_50_60_ratio_114951 ;0.94-46.02 (JUST 1 0...)

;40-50 km/s velocity
limit_40_50_ratio_114951 = (limit_40_50_Si_114951/limit_40_50_O_114951)
PRINT, "limit_40_50_Si_114951"
PRINT, limit_40_50_Si_114951 ;ALL 21.73!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_114951"
PRINT, limit_40_50_O_114951 ;1.76-4.52

PRINT, "limit_40_50_ratio_114951"
PRINT, limit_40_50_ratio_114951 ;4.80-12.30

PRINT, '122033'

;80-1000 km/s velocity
limit_ratio_122033 = (limit_Si_122033/limit_O_122033)
PRINT, "limit_Si_122033"
PRINT, limit_Si_122033 ;BIGGER 24.25-279.32

PRINT, "limit_O_122033"
PRINT, limit_O_122033 ;SMALLER (but 1/15 is larger than Si) 3.43-35.30

PRINT, "limit_ratio_122033"
PRINT, limit_ratio_122033 ;3.3335891,2.6507779,12.197808,1.1465221,5.9701400,5.1932194,0.52359676,38.883902,9.8070857,12.595423,26.719850,62.315723,2.9417391,9.4716954,23.661374 (JUST 1 0...)

;70-80 km/s velocity
limit_70_80_ratio_122033 = (limit_70_80_Si_122033/limit_70_80_O_122033)
PRINT, "limit_70_80_Si_122033"
PRINT, limit_70_80_Si_122033 ;8.59-170.99

PRINT, "limit_70_80_O_122033"
PRINT, limit_70_80_O_122033 ;2.83-11.93

PRINT, "limit_70_80_ratio_122033"
PRINT, limit_70_80_ratio_122033 ;0.73-44.10 (JUST 1 0...)

;60-70 km/s velocity
limit_60_70_ratio_122033 = (limit_60_70_Si_122033/limit_60_70_O_122033)
PRINT, "limit_60_70_Si_122033"
PRINT, limit_60_70_Si_122033 ;6.75-193.47

PRINT, "limit_60_70_O_122033"
PRINT, limit_60_70_O_122033 ;2.42-10.38

PRINT, "limit_60_70_ratio_122033"
PRINT, limit_60_70_ratio_122033 ;1.38-63.13

;50-60 km/s velocity
limit_50_60_ratio_122033 = (limit_50_60_Si_122033/limit_50_60_O_122033)
PRINT, "limit_50_60_Si_122033"
PRINT, limit_50_60_Si_122033 ;2.90-107.75

PRINT, "limit_50_60_O_122033"
PRINT, limit_50_60_O_122033 ;1.88-13.68

PRINT, "limit_50_60_ratio_122033"
PRINT, limit_50_60_ratio_122033 ;0.76-48.62 (JUST 3 0...)

;40-50 km/s velocity
limit_40_50_ratio_122033 = (limit_40_50_Si_122033/limit_40_50_O_122033)
PRINT, "limit_40_50_Si_122033"
PRINT, limit_40_50_Si_122033 ;ALL 21.67!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_122033"
PRINT, limit_40_50_O_122033 ;1.66-6.40
PRINT, MIN(limit_40_50_O_122033)
PRINT, MAX(limit_40_50_O_122033)

PRINT, "limit_40_50_ratio_122033"
PRINT, limit_40_50_ratio_122033 ;3.38-12.98
PRINT, MIN(limit_40_50_ratio_122033)
PRINT, MAX(limit_40_50_ratio_122033)

PRINT, '160806'

;80-1000 km/s velocity
limit_ratio_160806 = (limit_Si_160806/limit_O_160806)
PRINT, "limit_Si_160806"
PRINT, limit_Si_160806 ;BIGGER 70.71,65.81

PRINT, "limit_O_160806"
PRINT, limit_O_160806 ;SMALLER 4.00,3.99

PRINT, "limit_ratio_160806"
PRINT, limit_ratio_160806 ;17.658391 & 16.487102

;70-80 km/s velocity
limit_70_80_ratio_160806 = (limit_70_80_Si_160806/limit_70_80_O_160806)
PRINT, "limit_70_80_Si_160806"
PRINT, limit_70_80_Si_160806 ;61.51

PRINT, "limit_70_80_O_160806"
PRINT, limit_70_80_O_160806 ;0.26

PRINT, "limit_70_80_ratio_160806"
PRINT, limit_70_80_ratio_160806 ;233.54

;60-70 km/s velocity
limit_60_70_ratio_160806 = (limit_60_70_Si_160806/limit_60_70_O_160806)
PRINT, "limit_60_70_Si_160806"
PRINT, limit_60_70_Si_160806 ;12.83

PRINT, "limit_60_70_O_160806"
PRINT, limit_60_70_O_160806 ;0.26

PRINT, "limit_60_70_ratio_160806"
PRINT, limit_60_70_ratio_160806 ;48.74

;50-60 km/s velocity
limit_50_60_ratio_160806 = (limit_50_60_Si_160806/limit_50_60_O_160806)
PRINT, "limit_50_60_Si_160806"
PRINT, limit_50_60_Si_160806 ;12.28,16.66

PRINT, "limit_50_60_O_160806"
PRINT, limit_50_60_O_160806 ;2.07,2.15

PRINT, "limit_50_60_ratio_160806"
PRINT, limit_50_60_ratio_160806 ;5.92,7.74

;40-50 km/s velocity
limit_40_50_ratio_160806 = (limit_40_50_Si_160806/limit_40_50_O_160806)
PRINT, "limit_40_50_Si_160806"
PRINT, limit_40_50_Si_160806 ;ALL 17.35!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_160806"
PRINT, limit_40_50_O_160806 ;1.65-2.79

PRINT, "limit_40_50_ratio_160806"
PRINT, limit_40_50_ratio_160806 ;6.20-10.51

PRINT, '163205'

;80-1000 km/s velocity
limit_ratio_163205 = (limit_Si_163205/limit_O_163205)
PRINT, "limit_Si_163205"
PRINT, limit_Si_163205 ;BIGGER 25.52

PRINT, "limit_O_163205"
PRINT, limit_O_163205 ;SMALLER 0.17

PRINT, "limit_ratio_163205"
PRINT, limit_ratio_163205 ;144.01698

;70-80 km/s velocity
limit_70_80_ratio_163205 = (limit_70_80_Si_163205/limit_70_80_O_163205)
PRINT, "limit_70_80_Si_163205"
PRINT, limit_70_80_Si_163205 ;34.82

PRINT, "limit_70_80_O_163205"
PRINT, limit_70_80_O_163205 ;0.177

PRINT, "limit_70_80_ratio_163205"
PRINT, limit_70_80_ratio_163205 ;196.48

;60-70 km/s velocity
limit_60_70_ratio_163205 = (limit_60_70_Si_163205/limit_60_70_O_163205)
PRINT, "limit_60_70_Si_163205"
PRINT, limit_60_70_Si_163205 ;66.08

PRINT, "limit_60_70_O_163205"
PRINT, limit_60_70_O_163205 ;2.25

PRINT, "limit_60_70_ratio_163205"
PRINT, limit_60_70_ratio_163205 ;29.32

;50-60 km/s velocity
limit_50_60_ratio_163205 = (limit_50_60_Si_163205/limit_50_60_O_163205)
PRINT, "limit_50_60_Si_163205"
PRINT, limit_50_60_Si_163205 ;13.62-65.18

PRINT, "limit_50_60_O_163205"
PRINT, limit_50_60_O_163205 ;2.01-3.69

PRINT, "limit_50_60_ratio_163205"
PRINT, limit_50_60_ratio_163205 ;4.05-27.95

;40-50 km/s velocity
limit_40_50_ratio_163205 = (limit_40_50_Si_163205/limit_40_50_O_163205)
PRINT, "limit_40_50_Si_163205"
PRINT, limit_40_50_Si_163205 ;ALL 7.21!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_163205"
PRINT, limit_40_50_O_163205 ;1.67-3.19

PRINT, "limit_40_50_ratio_163205"
PRINT, limit_40_50_ratio_163205 ;2.26-4.29

PRINT, '174905'

;80-1000 km/s velocity
limit_ratio_174905 = (limit_Si_174905/limit_O_174905)
PRINT, "limit_Si_174905"
PRINT, limit_Si_174905 ;BIGGER 52.57-61.91

PRINT, "limit_O_174905"
PRINT, limit_O_174905 ;SMALLER 6.38-10.89

PRINT, "limit_ratio_174905"
PRINT, limit_ratio_174905 ;9.3733156,6.3173406,8.2384778,5.3575983

;70-80 km/s velocity
limit_70_80_ratio_174905 = (limit_70_80_Si_174905/limit_70_80_O_174905)
PRINT, "limit_70_80_Si_174905"
PRINT, limit_70_80_Si_174905 ;56.86

PRINT, "limit_70_80_O_174905"
PRINT, limit_70_80_O_174905 ;1.99

PRINT, "limit_70_80_ratio_174905"
PRINT, limit_70_80_ratio_174905 ;28.51

;60-70 km/s velocity
limit_60_70_ratio_174905 = (limit_60_70_Si_174905/limit_60_70_O_174905)
PRINT, "limit_60_70_Si_174905"
PRINT, limit_60_70_Si_174905 ;21.57-107.44

PRINT, "limit_60_70_O_174905"
PRINT, limit_60_70_O_174905 ;2.72-7.28

PRINT, "limit_60_70_ratio_174905"
PRINT, limit_60_70_ratio_174905 ;4.49-39.43

;50-60 km/s velocity
limit_50_60_ratio_174905 = (limit_50_60_Si_174905/limit_50_60_O_174905)
PRINT, "limit_50_60_Si_174905"
PRINT, limit_50_60_Si_174905 ;6.44-295.33

PRINT, "limit_50_60_O_174905"
PRINT, limit_50_60_O_174905 ;2.16-5.35

PRINT, "limit_50_60_ratio_174905"
PRINT, limit_50_60_ratio_174905 ;1.34-91.77

;40-50 km/s velocity
limit_40_50_ratio_174905 = (limit_40_50_Si_174905/limit_40_50_O_174905)
PRINT, "limit_40_50_Si_174905"
PRINT, limit_40_50_Si_174905 ;ALL 66.70!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_174905"
PRINT, limit_40_50_O_174905 ;1.57-8.37
PRINT, MIN(limit_40_50_O_174905)
PRINT, MAX(limit_40_50_O_174905)

PRINT, "limit_40_50_ratio_174905"
PRINT, limit_40_50_ratio_174905 ;7.96-42.44
PRINT, MIN(limit_40_50_ratio_174905)
PRINT, MAX(limit_40_50_ratio_174905)

PRINT, '181205'

;80-1000 km/s velocity
limit_ratio_181205 = (limit_Si_181205/limit_O_181205)
PRINT, "limit_Si_181205"
PRINT, limit_Si_181205 ;BIGGER 110.56

PRINT, "limit_O_181205"
PRINT, limit_O_181205 ;SMALLER 0.085

PRINT, "limit_ratio_181205"
PRINT, limit_ratio_181205 ;1294.7989

;70-80 km/s velocity
limit_70_80_ratio_181205 = (limit_70_80_Si_181205/limit_70_80_O_181205)
PRINT, "limit_70_80_Si_181205"
PRINT, limit_70_80_Si_181205 ;86.36

PRINT, "limit_70_80_O_181205"
PRINT, limit_70_80_O_181205 ;0.085

PRINT, "limit_70_80_ratio_181205"
PRINT, limit_70_80_ratio_181205 ;1011.44

;60-70 km/s velocity
limit_60_70_ratio_181205 = (limit_60_70_Si_181205/limit_60_70_O_181205)
PRINT, "limit_60_70_Si_181205"
PRINT, limit_60_70_Si_181205 ;99.42

PRINT, "limit_60_70_O_181205"
PRINT, limit_60_70_O_181205 ;0.085

PRINT, "limit_60_70_ratio_181205"
PRINT, limit_60_70_ratio_181205 ;1164.42

;50-60 km/s velocity
limit_50_60_ratio_181205 = (limit_50_60_Si_181205/limit_50_60_O_181205)
PRINT, "limit_50_60_Si_181205"
PRINT, limit_50_60_Si_181205 ;30.74,45.13

PRINT, "limit_50_60_O_181205"
PRINT, limit_50_60_O_181205 ;3.54,3.43

PRINT, "limit_50_60_ratio_181205"
PRINT, limit_50_60_ratio_181205 ;8.67,13.13

;40-50 km/s velocity
limit_40_50_ratio_181205 = (limit_40_50_Si_181205/limit_40_50_O_181205)
PRINT, "limit_40_50_Si_181205"
PRINT, limit_40_50_Si_181205 ;9.05-443.33

PRINT, "limit_40_50_O_181205"
PRINT, limit_40_50_O_181205 ;1.96-3.45

PRINT, "limit_40_50_ratio_181205"
PRINT, limit_40_50_ratio_181205 ;4.25-131.32

PRINT, '201925'

;80-1000 km/s velocity
limit_ratio_201925 = (limit_Si_201925/limit_O_201925)
PRINT, "limit_Si_201925"
PRINT, limit_Si_201925 ;BIGGER 9.26

PRINT, "limit_O_201925"
PRINT, limit_O_201925 ;SMALLER NEGATIVE?????? -0.180

PRINT, "limit_ratio_201925"
PRINT, limit_ratio_201925 ;NEGATIVE??????? -51.21

;70-80 km/s velocity
limit_70_80_ratio_201925 = (limit_70_80_Si_201925/limit_70_80_O_201925)
PRINT, "limit_70_80_Si_201925"
PRINT, limit_70_80_Si_201925 ;7.77

PRINT, "limit_70_80_O_201925"
PRINT, limit_70_80_O_201925 ;NEGATIVE??????? -0.18

PRINT, "limit_70_80_ratio_201925"
PRINT, limit_70_80_ratio_201925 ;NEGATIVE??????? -42.94

;60-70 km/s velocity
limit_60_70_ratio_201925 = (limit_60_70_Si_201925/limit_60_70_O_201925)
PRINT, "limit_60_70_Si_201925"
PRINT, limit_60_70_Si_201925 ;27.61

PRINT, "limit_60_70_O_201925"
PRINT, limit_60_70_O_201925 ;2.56

PRINT, "limit_60_70_ratio_201925"
PRINT, limit_60_70_ratio_201925 ;10.74

;50-60 km/s velocity
limit_50_60_ratio_201925 = (limit_50_60_Si_201925/limit_50_60_O_201925)
PRINT, "limit_50_60_Si_201925"
PRINT, limit_50_60_Si_201925 ;25.91,25.63

PRINT, "limit_50_60_O_201925"
PRINT, limit_50_60_O_201925 ;5.58,2.31

PRINT, "limit_50_60_ratio_201925"
PRINT, limit_50_60_ratio_201925 ;4.64,11.09

;40-50 km/s velocity
limit_40_50_ratio_201925 = (limit_40_50_Si_201925/limit_40_50_O_201925)
PRINT, "limit_40_50_Si_201925"
PRINT, limit_40_50_Si_201925 ;6.39-15.47

PRINT, "limit_40_50_O_201925"
PRINT, limit_40_50_O_201925 ;1.89-6.13

PRINT, "limit_40_50_ratio_201925"
PRINT, limit_40_50_ratio_201925 ;2.52-6.04

PRINT, '201925_1'

;80-1000 km/s velocity
limit_ratio_201925_1 = (limit_Si_201925_1/limit_O_201925_1)
PRINT, "limit_Si_201925_1"
PRINT, limit_Si_201925_1 ;BIGGER 16.99

PRINT, "limit_O_201925_1"
PRINT, limit_O_201925_1 ;SMALLER 0.15

PRINT, "limit_ratio_201925_1"
PRINT, limit_ratio_201925_1 ;111.02591

;70-80 km/s velocity
limit_70_80_ratio_201925_1 = (limit_70_80_Si_201925_1/limit_70_80_O_201925_1)
PRINT, "limit_70_80_Si_201925_1"
PRINT, limit_70_80_Si_201925_1 ;38.43

PRINT, "limit_70_80_O_201925_1"
PRINT, limit_70_80_O_201925_1 ;0.15

PRINT, "limit_70_80_ratio_201925_1"
PRINT, limit_70_80_ratio_201925_1 ;250.99

;60-70 km/s velocity
limit_60_70_ratio_201925_1 = (limit_60_70_Si_201925_1/limit_60_70_O_201925_1)
PRINT, "limit_60_70_Si_201925_1"
PRINT, limit_60_70_Si_201925_1 ;109.71

PRINT, "limit_60_70_O_201925_1"
PRINT, limit_60_70_O_201925_1 ;0.15

PRINT, "limit_60_70_ratio_201925_1"
PRINT, limit_60_70_ratio_201925_1 ;716.54

;50-60 km/s velocity
limit_50_60_ratio_201925_1 = (limit_50_60_Si_201925_1/limit_50_60_O_201925_1)
PRINT, "limit_50_60_Si_201925_1"
PRINT, limit_50_60_Si_201925_1 ;25.17

PRINT, "limit_50_60_O_201925_1"
PRINT, limit_50_60_O_201925_1 ;2.14

PRINT, "limit_50_60_ratio_201925_1"
PRINT, limit_50_60_ratio_201925_1 ;11.73

;40-50 km/s velocity
limit_40_50_ratio_201925_1 = (limit_40_50_Si_201925_1/limit_40_50_O_201925_1)
PRINT, "limit_40_50_Si_201925_1"
PRINT, limit_40_50_Si_201925_1 ;12.02-1106.81

PRINT, "limit_40_50_O_201925_1"
PRINT, limit_40_50_O_201925_1 ;2.29-8.05

PRINT, "limit_40_50_ratio_201925_1"
PRINT, limit_40_50_ratio_201925_1 ;1.67-308.39

PRINT, '203906'

;80-1000 km/s velocity
limit_ratio_203906 = (limit_Si_203906/limit_O_203906)
PRINT, "limit_Si_203906"
PRINT, limit_Si_203906 ;BIGGER 8.23-132.25

PRINT, "limit_O_203906"
PRINT, limit_O_203906 ;SMALLER 1.24-26.01

PRINT, "limit_ratio_203906"
PRINT, limit_ratio_203906 ;8.1205185,2.8926341,3.5850117,26.012802,1.6449124,9.2414895,1.2451248

;70-80 km/s velocity
limit_70_80_ratio_203906 = (limit_70_80_Si_203906/limit_70_80_O_203906)
PRINT, "limit_70_80_Si_203906"
PRINT, limit_70_80_Si_203906 ;7.93,7.22,14.22

PRINT, "limit_70_80_O_203906"
PRINT, limit_70_80_O_203906 ;5.36,5.04,5.89

PRINT, "limit_70_80_ratio_203906"
PRINT, limit_70_80_ratio_203906 ;1.47,1.43,2.41

;60-70 km/s velocity
limit_60_70_ratio_203906 = (limit_60_70_Si_203906/limit_60_70_O_203906)
PRINT, "limit_60_70_Si_203906"
PRINT, limit_60_70_Si_203906 ;19.79,9.72,8.92,12.15

PRINT, "limit_60_70_O_203906"
PRINT, limit_60_70_O_203906 ;2.72,5.64,7.49,3.64

PRINT, "limit_60_70_ratio_203906"
PRINT, limit_60_70_ratio_203906 ;7.27,1.72,1.19,3.33

;50-60 km/s velocity
limit_50_60_ratio_203906 = (limit_50_60_Si_203906/limit_50_60_O_203906)
PRINT, "limit_50_60_Si_203906"
PRINT, limit_50_60_Si_203906 ;10.25,17.07,8.01

PRINT, "limit_50_60_O_203906"
PRINT, limit_50_60_O_203906 ;2.37,5.62,3.05

PRINT, "limit_50_60_ratio_203906"
PRINT, limit_50_60_ratio_203906 ;4.31,3.03,2.62

;40-50 km/s velocity
limit_40_50_ratio_203906 = (limit_40_50_Si_203906/limit_40_50_O_203906)
PRINT, "limit_40_50_Si_203906"
PRINT, limit_40_50_Si_203906 ;ALL 11.41!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PRINT, "limit_40_50_O_203906"
PRINT, limit_40_50_O_203906 ;1.65-3.78

PRINT, "limit_40_50_ratio_203906"
PRINT, limit_40_50_ratio_203906 ;3.01-6.89

PRINT, '215426'

;80-1000 km/s velocity
limit_ratio_215426 = (limit_Si_215426/limit_O_215426)
PRINT, "limit_Si_215426"
PRINT, limit_Si_215426 ;BIGGER 8.04

PRINT, "limit_O_215426"
PRINT, limit_O_215426 ;SMALLER 1.20

PRINT, "limit_ratio_215426"
PRINT, limit_ratio_215426 ;6.6582199

;70-80 km/s velocity
limit_70_80_ratio_215426 = (limit_70_80_Si_215426/limit_70_80_O_215426)
PRINT, "limit_70_80_Si_215426"
PRINT, limit_70_80_Si_215426 ;6.29

PRINT, "limit_70_80_O_215426"
PRINT, limit_70_80_O_215426 ;1.20

PRINT, "limit_70_80_ratio_215426"
PRINT, limit_70_80_ratio_215426 ;5.21

;60-70 km/s velocity
limit_60_70_ratio_215426 = (limit_60_70_Si_215426/limit_60_70_O_215426)
PRINT, "limit_60_70_Si_215426"
PRINT, limit_60_70_Si_215426 ;232.10

PRINT, "limit_60_70_O_215426"
PRINT, limit_60_70_O_215426 ;1.20

PRINT, "limit_60_70_ratio_215426"
PRINT, limit_60_70_ratio_215426 ;192.20

;50-60 km/s velocity
limit_50_60_ratio_215426 = (limit_50_60_Si_215426/limit_50_60_O_215426)
PRINT, "limit_50_60_Si_215426"
PRINT, limit_50_60_Si_215426 ;188.13

PRINT, "limit_50_60_O_215426"
PRINT, limit_50_60_O_215426 ;2.20

PRINT, "limit_50_60_ratio_215426"
PRINT, limit_50_60_ratio_215426 ;85.20

;40-50 km/s velocity
limit_40_50_ratio_215426 = (limit_40_50_Si_215426/limit_40_50_O_215426)
PRINT, "limit_40_50_Si_215426"
PRINT, limit_40_50_Si_215426 ;2.26-50.35

PRINT, "limit_40_50_O_215426"
PRINT, limit_40_50_O_215426 ;2.07-4.11

PRINT, "limit_40_50_ratio_215426"
PRINT, limit_40_50_ratio_215426 ;0.62-19.99 (JUST 1 0...)

PRINT, '232931'

;80-1000 km/s velocity
limit_ratio_232931 = (limit_Si_232931/limit_O_232931)
PRINT, "limit_Si_232931"
PRINT, limit_Si_232931 ;BIGGER 135.27

PRINT, "limit_O_232931"
PRINT, limit_O_232931 ;SMALLER 0.18

PRINT, "limit_ratio_232931"
PRINT, limit_ratio_232931 ;713.76735

;70-80 km/s velocity
limit_70_80_ratio_232931 = (limit_70_80_Si_232931/limit_70_80_O_232931)
PRINT, "limit_70_80_Si_232931"
PRINT, limit_70_80_Si_232931 ;5.79

PRINT, "limit_70_80_O_232931"
PRINT, limit_70_80_O_232931 ;0.18

PRINT, "limit_70_80_ratio_232931"
PRINT, limit_70_80_ratio_232931 ;30.58

;60-70 km/s velocity
limit_60_70_ratio_232931 = (limit_60_70_Si_232931/limit_60_70_O_232931)
PRINT, "limit_60_70_Si_232931"
PRINT, limit_60_70_Si_232931 ;5.41

PRINT, "limit_60_70_O_232931"
PRINT, limit_60_70_O_232931 ;0.18

PRINT, "limit_60_70_ratio_232931"
PRINT, limit_60_70_ratio_232931 ;28.57

;50-60 km/s velocity
limit_50_60_ratio_232931 = (limit_50_60_Si_232931/limit_50_60_O_232931)
PRINT, "limit_50_60_Si_232931"
PRINT, limit_50_60_Si_232931 ;2.17

PRINT, "limit_50_60_O_232931"
PRINT, limit_50_60_O_232931 ;0.189

PRINT, "limit_50_60_ratio_232931"
PRINT, limit_50_60_ratio_232931 ;11.49

;40-50 km/s velocity
limit_40_50_ratio_232931 = (limit_40_50_Si_232931/limit_40_50_O_232931)
PRINT, "limit_40_50_Si_232931"
PRINT, limit_40_50_Si_232931 ;3.18

PRINT, "limit_40_50_O_232931"
PRINT, limit_40_50_O_232931 ;0.18

PRINT, "limit_40_50_ratio_232931"
PRINT, limit_40_50_ratio_232931 ;16.79

;===============================================================================
;load diagnostic model

rfname_dens_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/si4_o4_dens_diagnostic.sav'
RESTORE, rfname_dens_limit

;get size of ratios over each observation

limit_TII_004121_s = N_ELEMENTS(limit_ratio_004121)
;PRINT, "limit_TII_004121_s"
;PRINT, limit_TII_004121_s ;2
limit_70_80_TII_004121_s = N_ELEMENTS(limit_70_80_ratio_004121)
limit_60_70_TII_004121_s = N_ELEMENTS(limit_60_70_ratio_004121)
limit_50_60_TII_004121_s = N_ELEMENTS(limit_50_60_ratio_004121)
limit_40_50_TII_004121_s = N_ELEMENTS(limit_40_50_ratio_004121)

limit_TII_050655_s = N_ELEMENTS(limit_ratio_050655)
limit_70_80_TII_050655_s = N_ELEMENTS(limit_70_80_ratio_050655)
limit_60_70_TII_050655_s = N_ELEMENTS(limit_60_70_ratio_050655)
limit_50_60_TII_050655_s = N_ELEMENTS(limit_50_60_ratio_050655)
limit_40_50_TII_050655_s = N_ELEMENTS(limit_40_50_ratio_050655)

limit_TII_050655_1_s = N_ELEMENTS(limit_ratio_050655_1)
limit_70_80_TII_050655_1_s = N_ELEMENTS(limit_70_80_ratio_050655_1)
limit_60_70_TII_050655_1_s = N_ELEMENTS(limit_60_70_ratio_050655_1)
limit_50_60_TII_050655_1_s = N_ELEMENTS(limit_50_60_ratio_050655_1)
limit_40_50_TII_050655_1_s = N_ELEMENTS(limit_40_50_ratio_050655_1)

limit_TII_052046_s = N_ELEMENTS(limit_ratio_052046)
limit_70_80_TII_052046_s = N_ELEMENTS(limit_70_80_ratio_052046)
limit_60_70_TII_052046_s = N_ELEMENTS(limit_60_70_ratio_052046)
limit_50_60_TII_052046_s = N_ELEMENTS(limit_50_60_ratio_052046)
limit_40_50_TII_052046_s = N_ELEMENTS(limit_40_50_ratio_052046)

limit_TII_061606_s = N_ELEMENTS(limit_ratio_061606)
limit_70_80_TII_061606_s = N_ELEMENTS(limit_70_80_ratio_061606)
limit_60_70_TII_061606_s = N_ELEMENTS(limit_60_70_ratio_061606)
limit_50_60_TII_061606_s = N_ELEMENTS(limit_50_60_ratio_061606)
limit_40_50_TII_061606_s = N_ELEMENTS(limit_40_50_ratio_061606)

limit_TII_114951_s = N_ELEMENTS(limit_ratio_114951)
limit_70_80_TII_114951_s = N_ELEMENTS(limit_70_80_ratio_114951)
limit_60_70_TII_114951_s = N_ELEMENTS(limit_60_70_ratio_114951)
limit_50_60_TII_114951_s = N_ELEMENTS(limit_50_60_ratio_114951)
limit_40_50_TII_114951_s = N_ELEMENTS(limit_40_50_ratio_114951)

limit_TII_122033_s = N_ELEMENTS(limit_ratio_122033)
limit_70_80_TII_122033_s = N_ELEMENTS(limit_70_80_ratio_122033)
limit_60_70_TII_122033_s = N_ELEMENTS(limit_60_70_ratio_122033)
limit_50_60_TII_122033_s = N_ELEMENTS(limit_50_60_ratio_122033)
limit_40_50_TII_122033_s = N_ELEMENTS(limit_40_50_ratio_122033)

limit_TII_160806_s = N_ELEMENTS(limit_ratio_160806)
limit_70_80_TII_160806_s = N_ELEMENTS(limit_70_80_ratio_160806)
limit_60_70_TII_160806_s = N_ELEMENTS(limit_60_70_ratio_160806)
limit_50_60_TII_160806_s = N_ELEMENTS(limit_50_60_ratio_160806)
limit_40_50_TII_160806_s = N_ELEMENTS(limit_40_50_ratio_160806)

limit_TII_163205_s = N_ELEMENTS(limit_ratio_163205)
limit_70_80_TII_163205_s = N_ELEMENTS(limit_70_80_ratio_163205)
limit_60_70_TII_163205_s = N_ELEMENTS(limit_60_70_ratio_163205)
limit_50_60_TII_163205_s = N_ELEMENTS(limit_50_60_ratio_163205)
limit_40_50_TII_163205_s = N_ELEMENTS(limit_40_50_ratio_163205)

limit_TII_174905_s = N_ELEMENTS(limit_ratio_174905)
limit_70_80_TII_174905_s = N_ELEMENTS(limit_70_80_ratio_174905)
limit_60_70_TII_174905_s = N_ELEMENTS(limit_60_70_ratio_174905)
limit_50_60_TII_174905_s = N_ELEMENTS(limit_50_60_ratio_174905)
limit_40_50_TII_174905_s = N_ELEMENTS(limit_40_50_ratio_174905)

limit_TII_181205_s = N_ELEMENTS(limit_ratio_181205)
limit_70_80_TII_181205_s = N_ELEMENTS(limit_70_80_ratio_181205)
limit_60_70_TII_181205_s = N_ELEMENTS(limit_60_70_ratio_181205)
limit_50_60_TII_181205_s = N_ELEMENTS(limit_50_60_ratio_181205)
limit_40_50_TII_181205_s = N_ELEMENTS(limit_40_50_ratio_181205)

limit_TII_201925_s = N_ELEMENTS(limit_ratio_201925)
limit_70_80_TII_201925_s = N_ELEMENTS(limit_70_80_ratio_201925)
limit_60_70_TII_201925_s = N_ELEMENTS(limit_60_70_ratio_201925)
limit_50_60_TII_201925_s = N_ELEMENTS(limit_50_60_ratio_201925)
limit_40_50_TII_201925_s = N_ELEMENTS(limit_40_50_ratio_201925)

limit_TII_201925_1_s = N_ELEMENTS(limit_ratio_201925_1)
limit_70_80_TII_201925_1_s = N_ELEMENTS(limit_70_80_ratio_201925_1)
limit_60_70_TII_201925_1_s = N_ELEMENTS(limit_60_70_ratio_201925_1)
limit_50_60_TII_201925_1_s = N_ELEMENTS(limit_50_60_ratio_201925_1)
limit_40_50_TII_201925_1_s = N_ELEMENTS(limit_40_50_ratio_201925_1)

limit_TII_203906_s = N_ELEMENTS(limit_ratio_203906)
limit_70_80_TII_203906_s = N_ELEMENTS(limit_70_80_ratio_203906)
limit_60_70_TII_203906_s = N_ELEMENTS(limit_60_70_ratio_203906)
limit_50_60_TII_203906_s = N_ELEMENTS(limit_50_60_ratio_203906)
limit_40_50_TII_203906_s = N_ELEMENTS(limit_40_50_ratio_203906)

limit_TII_215426_s = N_ELEMENTS(limit_ratio_215426)
limit_70_80_TII_215426_s = N_ELEMENTS(limit_70_80_ratio_215426)
limit_60_70_TII_215426_s = N_ELEMENTS(limit_60_70_ratio_215426)
limit_50_60_TII_215426_s = N_ELEMENTS(limit_50_60_ratio_215426)
limit_40_50_TII_215426_s = N_ELEMENTS(limit_40_50_ratio_215426)

limit_TII_232931_s = N_ELEMENTS(limit_ratio_232931)
limit_70_80_TII_232931_s = N_ELEMENTS(limit_70_80_ratio_232931)
limit_60_70_TII_232931_s = N_ELEMENTS(limit_60_70_ratio_232931)
limit_50_60_TII_232931_s = N_ELEMENTS(limit_50_60_ratio_232931)
limit_40_50_TII_232931_s = N_ELEMENTS(limit_40_50_ratio_232931)

;===============================================================================

;FOR loops for electron density info

PRINT, '004121'

;80-1000 km/s velocity
limit_electron_dens_arr_004121 = DBLARR(limit_TII_004121_s)

FOR i = 0, limit_TII_004121_s-1 DO BEGIN
   limit_difference_arr_004121 = ABS(si_o_ratio-limit_ratio_004121[i])
   limit_electron_dens_004121 = WHERE(limit_difference_arr_004121 EQ MIN(limit_difference_arr_004121), /NULL)
   limit_electron_dens_arr_004121[i] = limit_electron_dens_004121[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_004121"

;PRINT, limit_electron_dens_arr_004121

PRINT, "ZEROS"

limit_zeros_004121 = WHERE((limit_electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_004121) ;1

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_004121] 

;70-80 km/s velocity
limit_70_80_electron_dens_arr_004121 = DBLARR(limit_70_80_TII_004121_s)

FOR i = 0, limit_70_80_TII_004121_s-1 DO BEGIN
   limit_70_80_difference_arr_004121 = ABS(si_o_ratio-limit_70_80_ratio_004121[i])
   limit_70_80_electron_dens_004121 = WHERE(limit_70_80_difference_arr_004121 EQ MIN(limit_70_80_difference_arr_004121), /NULL)
   limit_70_80_electron_dens_arr_004121[i] = limit_70_80_electron_dens_004121[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_004121 = WHERE((limit_70_80_electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_004121) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_004121 = DBLARR(limit_60_70_TII_004121_s)

FOR i = 0, limit_60_70_TII_004121_s-1 DO BEGIN
   limit_60_70_difference_arr_004121 = ABS(si_o_ratio-limit_60_70_ratio_004121[i])
   limit_60_70_electron_dens_004121 = WHERE(limit_60_70_difference_arr_004121 EQ MIN(limit_60_70_difference_arr_004121), /NULL)
   limit_60_70_electron_dens_arr_004121[i] = limit_60_70_electron_dens_004121[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_004121 = WHERE((limit_60_70_electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_004121) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_004121 = DBLARR(limit_50_60_TII_004121_s)

FOR i = 0, limit_50_60_TII_004121_s-1 DO BEGIN
   limit_50_60_difference_arr_004121 = ABS(si_o_ratio-limit_50_60_ratio_004121[i])
   limit_50_60_electron_dens_004121 = WHERE(limit_50_60_difference_arr_004121 EQ MIN(limit_50_60_difference_arr_004121), /NULL)
   limit_50_60_electron_dens_arr_004121[i] = limit_50_60_electron_dens_004121[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_004121 = WHERE((limit_50_60_electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_004121) ;7

;40-50 km/s velocity
limit_40_50_electron_dens_arr_004121 = DBLARR(limit_40_50_TII_004121_s)

FOR i = 0, limit_40_50_TII_004121_s-1 DO BEGIN
   limit_40_50_difference_arr_004121 = ABS(si_o_ratio-limit_40_50_ratio_004121[i])
   limit_40_50_electron_dens_004121 = WHERE(limit_40_50_difference_arr_004121 EQ MIN(limit_40_50_difference_arr_004121), /NULL)
   limit_40_50_electron_dens_arr_004121[i] = limit_40_50_electron_dens_004121[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_004121 = WHERE((limit_40_50_electron_dens_arr_004121 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_004121) ;17
;PRINT, limit_40_50_electron_dens_arr_004121[limit_40_50_zeros_004121]

;-------------------------------------------------------------------------------

PRINT, "004121"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_004121) ;1
;PRINT, e_density[limit_nin_004121]

limit_ten_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_004121) ;1

limit_elev_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_004121) ;0

limit_twel_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_004121) ;0

limit_thirt_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_004121) ;0

limit_four_004121 = WHERE((e_density[limit_electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_004121) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_004121) ;0
;PRINT, e_density[limit_70_80_nin_004121]

limit_70_80_ten_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_004121) ;1

limit_70_80_elev_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_004121) ;0

limit_70_80_twel_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_004121) ;0

limit_70_80_thirt_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_004121) ;0

limit_70_80_four_004121 = WHERE((e_density[limit_70_80_electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_004121) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_004121) ;0
;PRINT, e_density[limit_60_70_nin_004121]

limit_60_70_ten_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_004121) ;0

limit_60_70_elev_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_004121) ;0

limit_60_70_twel_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_004121) ;1

limit_60_70_thirt_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_004121) ;0

limit_60_70_four_004121 = WHERE((e_density[limit_60_70_electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_004121) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_004121) ;7
;PRINT, e_density[limit_50_60_nin_004121]

limit_50_60_ten_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_004121) ;1

limit_50_60_elev_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_004121) ;2

limit_50_60_twel_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_004121) ;0

limit_50_60_thirt_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_004121) ;0

limit_50_60_four_004121 = WHERE((e_density[limit_50_60_electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_004121) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_004121] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_004121) ;18
;PRINT, e_density[limit_40_50_nin_004121]

limit_40_50_ten_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_004121] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_004121) ;5

limit_40_50_elev_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_004121] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_004121) ;0

limit_40_50_twel_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_004121] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_004121) ;0

limit_40_50_thirt_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_004121] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_004121) ;0

limit_40_50_four_004121 = WHERE((e_density[limit_40_50_electron_dens_arr_004121] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_004121) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'
;80-1000 km/s velocity
limit_stat_nin_004121 = FLOAT((N_ELEMENTS(limit_nin_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_nin_004121 ;50.0000

limit_stat_ten_004121 = FLOAT((N_ELEMENTS(limit_ten_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_ten_004121 ;50.0000

limit_stat_elev_004121 = FLOAT((N_ELEMENTS(limit_elev_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_elev_004121 ;0

limit_stat_twel_004121 = FLOAT((N_ELEMENTS(limit_twel_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_twel_004121 ;0

limit_stat_thirt_004121 = FLOAT((N_ELEMENTS(limit_thirt_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_thirt_004121 ;0

limit_stat_four_004121 = FLOAT((N_ELEMENTS(limit_four_004121))/FLOAT(N_ELEMENTS(limit_num_three)))*100
PRINT, limit_stat_four_004121 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_004121 = FLOAT((N_ELEMENTS(limit_70_80_nin_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_nin_004121 ;0

limit_70_80_stat_ten_004121 = FLOAT((N_ELEMENTS(limit_70_80_ten_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_ten_004121 ;100.000

limit_70_80_stat_elev_004121 = FLOAT((N_ELEMENTS(limit_70_80_elev_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_elev_004121 ;0

limit_70_80_stat_twel_004121 = FLOAT((N_ELEMENTS(limit_70_80_twel_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_twel_004121 ;0

limit_70_80_stat_thirt_004121 = FLOAT((N_ELEMENTS(limit_70_80_thirt_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_thirt_004121 ;0

limit_70_80_stat_four_004121 = FLOAT((N_ELEMENTS(limit_70_80_four_004121))/FLOAT(N_ELEMENTS(limit_70_80_num_three)))*100
PRINT, limit_70_80_stat_four_004121 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_004121 = FLOAT((N_ELEMENTS(limit_60_70_nin_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_nin_004121 ;0

limit_60_70_stat_ten_004121 = FLOAT((N_ELEMENTS(limit_60_70_ten_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_ten_004121 ;0

limit_60_70_stat_elev_004121 = FLOAT((N_ELEMENTS(limit_60_70_elev_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_elev_004121 ;0

limit_60_70_stat_twel_004121 = FLOAT((N_ELEMENTS(limit_60_70_twel_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_twel_004121 ;100.000

limit_60_70_stat_thirt_004121 = FLOAT((N_ELEMENTS(limit_60_70_thirt_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_thirt_004121 ;0

limit_60_70_stat_four_004121 = FLOAT((N_ELEMENTS(limit_60_70_four_004121))/FLOAT(N_ELEMENTS(limit_60_70_num_three)))*100
PRINT, limit_60_70_stat_four_004121 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_004121 = FLOAT((N_ELEMENTS(limit_50_60_nin_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_nin_004121 ;70.0000

limit_50_60_stat_ten_004121 = FLOAT((N_ELEMENTS(limit_50_60_ten_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_ten_004121 ;10.0000

limit_50_60_stat_elev_004121 = FLOAT((N_ELEMENTS(limit_50_60_elev_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_elev_004121 ;20.0000

limit_50_60_stat_twel_004121 = FLOAT((N_ELEMENTS(limit_50_60_twel_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_twel_004121 ;0

limit_50_60_stat_thirt_004121 = FLOAT((N_ELEMENTS(limit_50_60_thirt_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_thirt_004121 ;0

limit_50_60_stat_four_004121 = FLOAT((N_ELEMENTS(limit_50_60_four_004121))/FLOAT(N_ELEMENTS(limit_50_60_num_three)))*100
PRINT, limit_50_60_stat_four_004121 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_004121 = FLOAT((N_ELEMENTS(limit_40_50_nin_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_nin_004121 ;78.2609

limit_40_50_stat_ten_004121 = FLOAT((N_ELEMENTS(limit_40_50_ten_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_ten_004121 ;21.7391

limit_40_50_stat_elev_004121 = FLOAT((N_ELEMENTS(limit_40_50_elev_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_elev_004121 ;0

limit_40_50_stat_twel_004121 = FLOAT((N_ELEMENTS(limit_40_50_twel_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_twel_004121 ;0

limit_40_50_stat_thirt_004121 = FLOAT((N_ELEMENTS(limit_40_50_thirt_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_thirt_004121 ;0

limit_40_50_stat_four_004121 = FLOAT((N_ELEMENTS(limit_40_50_four_004121))/FLOAT(N_ELEMENTS(limit_40_50_num_three)))*100
PRINT, limit_40_50_stat_four_004121 ;0

limit_e_dens_004121 = e_density[limit_electron_dens_arr_004121]
limit_70_80_e_dens_004121 = e_density[limit_70_80_electron_dens_arr_004121]
limit_60_70_e_dens_004121 = e_density[limit_60_70_electron_dens_arr_004121]
limit_50_60_e_dens_004121 = e_density[limit_50_60_electron_dens_arr_004121]
limit_40_50_e_dens_004121 = e_density[limit_40_50_electron_dens_arr_004121]

;===============================================================================

PRINT, '050655'

;80-1000 km/s velocity
limit_electron_dens_arr_050655 = DBLARR(limit_TII_050655_s)

FOR i = 0, limit_TII_050655_s-1 DO BEGIN
   limit_difference_arr_050655 = ABS(si_o_ratio-limit_ratio_050655[i])
   limit_electron_dens_050655 = WHERE(limit_difference_arr_050655 EQ MIN(limit_difference_arr_050655), /NULL)
   limit_electron_dens_arr_050655[i] = limit_electron_dens_050655[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_050655"

;PRINT, limit_electron_dens_arr_050655

PRINT, "ZEROS"

limit_zeros_050655 = WHERE((limit_electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_050655) ;2

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_050655]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_050655 = DBLARR(limit_70_80_TII_050655_s)

FOR i = 0, limit_70_80_TII_050655_s-1 DO BEGIN
   limit_70_80_difference_arr_050655 = ABS(si_o_ratio-limit_70_80_ratio_050655[i])
   limit_70_80_electron_dens_050655 = WHERE(limit_70_80_difference_arr_050655 EQ MIN(limit_70_80_difference_arr_050655), /NULL)
   limit_70_80_electron_dens_arr_050655[i] = limit_70_80_electron_dens_050655[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_050655 = WHERE((limit_70_80_electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_050655) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_050655 = DBLARR(limit_60_70_TII_050655_s)

FOR i = 0, limit_60_70_TII_050655_s-1 DO BEGIN
   limit_60_70_difference_arr_050655 = ABS(si_o_ratio-limit_60_70_ratio_050655[i])
   limit_60_70_electron_dens_050655 = WHERE(limit_60_70_difference_arr_050655 EQ MIN(limit_60_70_difference_arr_050655), /NULL)
   limit_60_70_electron_dens_arr_050655[i] = limit_60_70_electron_dens_050655[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_050655 = WHERE((limit_60_70_electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_050655) ;1

;50-60 km/s velocity
limit_50_60_electron_dens_arr_050655 = DBLARR(limit_50_60_TII_050655_s)

FOR i = 0, limit_50_60_TII_050655_s-1 DO BEGIN
   limit_50_60_difference_arr_050655 = ABS(si_o_ratio-limit_50_60_ratio_050655[i])
   limit_50_60_electron_dens_050655 = WHERE(limit_50_60_difference_arr_050655 EQ MIN(limit_50_60_difference_arr_050655), /NULL)
   limit_50_60_electron_dens_arr_050655[i] = limit_50_60_electron_dens_050655[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_050655 = WHERE((limit_50_60_electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_050655) ;1

;40-50 km/s velocity
limit_40_50_electron_dens_arr_050655 = DBLARR(limit_40_50_TII_050655_s)

FOR i = 0, limit_40_50_TII_050655_s-1 DO BEGIN
   limit_40_50_difference_arr_050655 = ABS(si_o_ratio-limit_40_50_ratio_050655[i])
   limit_40_50_electron_dens_050655 = WHERE(limit_40_50_difference_arr_050655 EQ MIN(limit_40_50_difference_arr_050655), /NULL)
   limit_40_50_electron_dens_arr_050655[i] = limit_40_50_electron_dens_050655[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_050655 = WHERE((limit_40_50_electron_dens_arr_050655 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_050655) ;5

;-------------------------------------------------------------------------------

PRINT, "050655"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_050655) ;2

limit_ten_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_050655) ;0

limit_elev_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_050655) ;0

limit_twel_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_050655) ;0

limit_thirt_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_050655) ;0

limit_four_050655 = WHERE((e_density[limit_electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_050655) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_050655) ;0

limit_70_80_ten_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_050655) ;0

limit_70_80_elev_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_050655) ;1

limit_70_80_twel_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_050655) ;0

limit_70_80_thirt_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_050655) ;0

limit_70_80_four_050655 = WHERE((e_density[limit_70_80_electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_050655) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_050655) ;1

limit_60_70_ten_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_050655) ;0

limit_60_70_elev_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_050655) ;0

limit_60_70_twel_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_050655) ;0

limit_60_70_thirt_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_050655) ;0

limit_60_70_four_050655 = WHERE((e_density[limit_60_70_electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_050655) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_050655) ;1

limit_50_60_ten_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_050655) ;1

limit_50_60_elev_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_050655) ;3

limit_50_60_twel_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_050655) ;2

limit_50_60_thirt_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_050655) ;0

limit_50_60_four_050655 = WHERE((e_density[limit_50_60_electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_050655) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_050655] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_050655) ;5

limit_40_50_ten_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_050655] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_050655) ;5

limit_40_50_elev_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_050655] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_050655) ;5

limit_40_50_twel_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_050655] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_050655) ;0

limit_40_50_thirt_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_050655] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_050655) ;0

limit_40_50_four_050655 = WHERE((e_density[limit_40_50_electron_dens_arr_050655] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_050655) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
stat_nin_050655 = FLOAT((N_ELEMENTS(limit_nin_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, stat_nin_050655 ;100.0000

limit_stat_ten_050655 = FLOAT((N_ELEMENTS(limit_ten_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, limit_stat_ten_050655 ;0

limit_stat_elev_050655 = FLOAT((N_ELEMENTS(limit_elev_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, limit_stat_elev_050655 ;0

limit_stat_twel_050655 = FLOAT((N_ELEMENTS(limit_twel_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, limit_stat_twel_050655 ;0

limit_stat_thirt_050655 = FLOAT((N_ELEMENTS(limit_thirt_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, limit_stat_thirt_050655 ;0

limit_stat_four_050655 = FLOAT((N_ELEMENTS(limit_four_050655))/FLOAT(N_ELEMENTS(limit_num2_three)))*100
PRINT, limit_stat_four_050655 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
stat_70_80_nin_050655 = FLOAT((N_ELEMENTS(limit_70_80_nin_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, stat_70_80_nin_050655 ;0

limit_70_80_stat_ten_050655 = FLOAT((N_ELEMENTS(limit_70_80_ten_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, limit_70_80_stat_ten_050655 ;0

limit_70_80_stat_elev_050655 = FLOAT((N_ELEMENTS(limit_70_80_elev_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, limit_70_80_stat_elev_050655 ;100.000

limit_70_80_stat_twel_050655 = FLOAT((N_ELEMENTS(limit_70_80_twel_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, limit_70_80_stat_twel_050655 ;0

limit_70_80_stat_thirt_050655 = FLOAT((N_ELEMENTS(limit_70_80_thirt_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, limit_70_80_stat_thirt_050655 ;0

limit_70_80_stat_four_050655 = FLOAT((N_ELEMENTS(limit_70_80_four_050655))/FLOAT(N_ELEMENTS(limit_70_80_num2_three)))*100
PRINT, limit_70_80_stat_four_050655 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
stat_60_70_nin_050655 = FLOAT((N_ELEMENTS(limit_60_70_nin_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, stat_60_70_nin_050655 ;100.000

limit_60_70_stat_ten_050655 = FLOAT((N_ELEMENTS(limit_60_70_ten_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, limit_60_70_stat_ten_050655 ;0

limit_60_70_stat_elev_050655 = FLOAT((N_ELEMENTS(limit_60_70_elev_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, limit_60_70_stat_elev_050655 ;0

limit_60_70_stat_twel_050655 = FLOAT((N_ELEMENTS(limit_60_70_twel_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, limit_60_70_stat_twel_050655 ;0

limit_60_70_stat_thirt_050655 = FLOAT((N_ELEMENTS(limit_60_70_thirt_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, limit_60_70_stat_thirt_050655 ;0

limit_60_70_stat_four_050655 = FLOAT((N_ELEMENTS(limit_60_70_four_050655))/FLOAT(N_ELEMENTS(limit_60_70_num2_three)))*100
PRINT, limit_60_70_stat_four_050655 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
stat_50_60_nin_050655 = FLOAT((N_ELEMENTS(limit_50_60_nin_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, stat_50_60_nin_050655 ;14.2857

limit_50_60_stat_ten_050655 = FLOAT((N_ELEMENTS(limit_50_60_ten_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, limit_50_60_stat_ten_050655 ;14.2857

limit_50_60_stat_elev_050655 = FLOAT((N_ELEMENTS(limit_50_60_elev_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, limit_50_60_stat_elev_050655 ;42.8571

limit_50_60_stat_twel_050655 = FLOAT((N_ELEMENTS(limit_50_60_twel_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, limit_50_60_stat_twel_050655 ;28.5714

limit_50_60_stat_thirt_050655 = FLOAT((N_ELEMENTS(limit_50_60_thirt_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, limit_50_60_stat_thirt_050655 ;0

limit_50_60_stat_four_050655 = FLOAT((N_ELEMENTS(limit_50_60_four_050655))/FLOAT(N_ELEMENTS(limit_50_60_num2_three)))*100
PRINT, limit_50_60_stat_four_050655 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
stat_40_50_nin_050655 = FLOAT((N_ELEMENTS(limit_40_50_nin_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, stat_40_50_nin_050655 ;33.3333

limit_40_50_stat_ten_050655 = FLOAT((N_ELEMENTS(limit_40_50_ten_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, limit_40_50_stat_ten_050655 ;33.3333

limit_40_50_stat_elev_050655 = FLOAT((N_ELEMENTS(limit_40_50_elev_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, limit_40_50_stat_elev_050655 ;33.3333

limit_40_50_stat_twel_050655 = FLOAT((N_ELEMENTS(limit_40_50_twel_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, limit_40_50_stat_twel_050655 ;0

limit_40_50_stat_thirt_050655 = FLOAT((N_ELEMENTS(limit_40_50_thirt_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, limit_40_50_stat_thirt_050655 ;0

limit_40_50_stat_four_050655 = FLOAT((N_ELEMENTS(limit_40_50_four_050655))/FLOAT(N_ELEMENTS(limit_40_50_num2_three)))*100
PRINT, limit_40_50_stat_four_050655 ;0

limit_e_dens_050655 = e_density[limit_electron_dens_arr_050655]
limit_70_80_e_dens_050655 = e_density[limit_70_80_electron_dens_arr_050655]
limit_60_70_e_dens_050655 = e_density[limit_60_70_electron_dens_arr_050655]
limit_50_60_e_dens_050655 = e_density[limit_50_60_electron_dens_arr_050655]
limit_40_50_e_dens_050655 = e_density[limit_40_50_electron_dens_arr_050655]

;===============================================================================

PRINT, '050655_1'

;80-1000 km/s velocity
limit_electron_dens_arr_050655_1 = DBLARR(limit_TII_050655_1_s)

FOR i = 0, limit_TII_050655_1_s-1 DO BEGIN
   limit_difference_arr_050655_1 = ABS(si_o_ratio-limit_ratio_050655_1[i])
   limit_electron_dens_050655_1 = WHERE(limit_difference_arr_050655_1 EQ MIN(limit_difference_arr_050655_1), /NULL)
   limit_electron_dens_arr_050655_1[i] = limit_electron_dens_050655_1[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_050655_1"

;PRINT, limit_electron_dens_arr_050655_1 

PRINT, "ZEROS"

limit_zeros_050655_1 = WHERE((limit_electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_050655_1) ;1

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_050655_1]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_050655_1 = DBLARR(limit_70_80_TII_050655_1_s)

FOR i = 0, limit_70_80_TII_050655_1_s-1 DO BEGIN
   limit_70_80_difference_arr_050655_1 = ABS(si_o_ratio-limit_70_80_ratio_050655_1[i])
   limit_70_80_electron_dens_050655_1 = WHERE(limit_70_80_difference_arr_050655_1 EQ MIN(limit_70_80_difference_arr_050655_1), /NULL)
   limit_70_80_electron_dens_arr_050655_1[i] = limit_70_80_electron_dens_050655_1[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_050655_1 = WHERE((limit_70_80_electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_050655_1) ;1

;60-70 km/s velocity
limit_60_70_electron_dens_arr_050655_1 = DBLARR(limit_60_70_TII_050655_1_s)

FOR i = 0, limit_60_70_TII_050655_1_s-1 DO BEGIN
   limit_60_70_difference_arr_050655_1 = ABS(si_o_ratio-limit_60_70_ratio_050655_1[i])
   limit_60_70_electron_dens_050655_1 = WHERE(limit_60_70_difference_arr_050655_1 EQ MIN(limit_60_70_difference_arr_050655_1), /NULL)
   limit_60_70_electron_dens_arr_050655_1[i] = limit_60_70_electron_dens_050655_1[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_050655_1 = WHERE((limit_60_70_electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_050655_1) ;1

;50-60 km/s velocity
limit_50_60_electron_dens_arr_050655_1 = DBLARR(limit_50_60_TII_050655_1_s)

FOR i = 0, limit_50_60_TII_050655_1_s-1 DO BEGIN
   limit_50_60_difference_arr_050655_1 = ABS(si_o_ratio-limit_50_60_ratio_050655_1[i])
   limit_50_60_electron_dens_050655_1 = WHERE(limit_50_60_difference_arr_050655_1 EQ MIN(limit_50_60_difference_arr_050655_1), /NULL)
   limit_50_60_electron_dens_arr_050655_1[i] = limit_50_60_electron_dens_050655_1[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_050655_1 = WHERE((limit_50_60_electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_050655_1) ;2

;40-50 km/s velocity
limit_40_50_electron_dens_arr_050655_1 = DBLARR(limit_40_50_TII_050655_1_s)

FOR i = 0, limit_40_50_TII_050655_1_s-1 DO BEGIN
   limit_40_50_difference_arr_050655_1 = ABS(si_o_ratio-limit_40_50_ratio_050655_1[i])
   limit_40_50_electron_dens_050655_1 = WHERE(limit_40_50_difference_arr_050655_1 EQ MIN(limit_40_50_difference_arr_050655_1), /NULL)
   limit_40_50_electron_dens_arr_050655_1[i] = limit_40_50_electron_dens_050655_1[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_050655_1 = WHERE((limit_40_50_electron_dens_arr_050655_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_050655_1) ;12

;-------------------------------------------------------------------------------

PRINT, "050655_1"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_050655_1) ;1

limit_ten_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_050655_1) ;0

limit_elev_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_050655_1) ;0

limit_twel_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_050655_1) ;0

limit_thirt_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_050655_1) ;0

limit_four_050655_1 = WHERE((e_density[limit_electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_050655_1) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_050655_1) ;1

limit_70_80_ten_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_050655_1) ;0

limit_70_80_elev_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_050655_1) ;0

limit_70_80_twel_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_050655_1) ;0

limit_70_80_thirt_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_050655_1) ;0

limit_70_80_four_050655_1 = WHERE((e_density[limit_70_80_electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_050655_1) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_050655_1) ;1

limit_60_70_ten_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_050655_1) ;0

limit_60_70_elev_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_050655_1) ;0

limit_60_70_twel_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_050655_1) ;0

limit_60_70_thirt_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_050655_1) ;0

limit_60_70_four_050655_1 = WHERE((e_density[limit_60_70_electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_050655_1) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_050655_1) ;2

limit_50_60_ten_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_050655_1) ;1

limit_50_60_elev_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_050655_1) ;1

limit_50_60_twel_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_050655_1) ;0

limit_50_60_thirt_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_050655_1) ;0

limit_50_60_four_050655_1 = WHERE((e_density[limit_50_60_electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_050655_1) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_050655_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_050655_1) ;12

limit_40_50_ten_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_050655_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_050655_1) ;6

limit_40_50_elev_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_050655_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_050655_1) ;4

limit_40_50_twel_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_050655_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_050655_1) ;0

limit_40_50_thirt_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_050655_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_050655_1) ;0

limit_40_50_four_050655_1 = WHERE((e_density[limit_40_50_electron_dens_arr_050655_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_050655_1) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_050655_1 = FLOAT((N_ELEMENTS(limit_nin_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_nin_050655_1 ;100.0000

limit_stat_ten_050655_1 = FLOAT((N_ELEMENTS(limit_ten_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_ten_050655_1 ;0

limit_stat_elev_050655_1 = FLOAT((N_ELEMENTS(limit_elev_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_elev_050655_1 ;0

limit_stat_twel_050655_1 = FLOAT((N_ELEMENTS(limit_twel_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_twel_050655_1 ;0

limit_stat_thirt_050655_1 = FLOAT((N_ELEMENTS(limit_thirt_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_thirt_050655_1 ;0

limit_stat_four_050655_1 = FLOAT((N_ELEMENTS(limit_four_050655_1))/FLOAT(N_ELEMENTS(limit_num3_three)))*100
PRINT, limit_stat_four_050655_1 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_nin_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_nin_050655_1 ;100.000

limit_70_80_stat_ten_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_ten_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_ten_050655_1 ;0

limit_70_80_stat_elev_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_elev_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_elev_050655_1 ;0

limit_70_80_stat_twel_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_twel_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_twel_050655_1 ;0

limit_70_80_stat_thirt_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_thirt_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_thirt_050655_1 ;0

limit_70_80_stat_four_050655_1 = FLOAT((N_ELEMENTS(limit_70_80_four_050655_1))/FLOAT(N_ELEMENTS(limit_70_80_num3_three)))*100
PRINT, limit_70_80_stat_four_050655_1 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_nin_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_nin_050655_1 ;100.000

limit_60_70_stat_ten_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_ten_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_ten_050655_1 ;0

limit_60_70_stat_elev_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_elev_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_elev_050655_1 ;0

limit_60_70_stat_twel_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_twel_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_twel_050655_1 ;0

limit_60_70_stat_thirt_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_thirt_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_thirt_050655_1 ;0

limit_60_70_stat_four_050655_1 = FLOAT((N_ELEMENTS(limit_60_70_four_050655_1))/FLOAT(N_ELEMENTS(limit_60_70_num3_three)))*100
PRINT, limit_60_70_stat_four_050655_1 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_nin_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_nin_050655_1 ;50.0000

limit_50_60_stat_ten_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_ten_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_ten_050655_1 ;25.0000

limit_50_60_stat_elev_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_elev_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_elev_050655_1 ;25.0000

limit_50_60_stat_twel_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_twel_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_twel_050655_1 ;0

limit_50_60_stat_thirt_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_thirt_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_thirt_050655_1 ;0

limit_50_60_stat_four_050655_1 = FLOAT((N_ELEMENTS(limit_50_60_four_050655_1))/FLOAT(N_ELEMENTS(limit_50_60_num3_three)))*100
PRINT, limit_50_60_stat_four_050655_1 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_nin_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_nin_050655_1 ;54.5455

limit_40_50_stat_ten_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_ten_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_ten_050655_1 ;27.2727

limit_40_50_stat_elev_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_elev_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_elev_050655_1 ;18.1818

limit_40_50_stat_twel_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_twel_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_twel_050655_1 ;0

limit_40_50_stat_thirt_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_thirt_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_thirt_050655_1 ;0

limit_40_50_stat_four_050655_1 = FLOAT((N_ELEMENTS(limit_40_50_four_050655_1))/FLOAT(N_ELEMENTS(limit_40_50_num3_three)))*100
PRINT, limit_40_50_stat_four_050655_1 ;0

limit_e_dens_050655_1 = e_density[limit_electron_dens_arr_050655_1]
limit_70_80_e_dens_050655_1 = e_density[limit_70_80_electron_dens_arr_050655_1]
limit_60_70_e_dens_050655_1 = e_density[limit_60_70_electron_dens_arr_050655_1]
limit_50_60_e_dens_050655_1 = e_density[limit_50_60_electron_dens_arr_050655_1]
limit_40_50_e_dens_050655_1 = e_density[limit_40_50_electron_dens_arr_050655_1]

;===============================================================================

PRINT, '052046'

;80-1000 km/s velocity
limit_electron_dens_arr_052046 = DBLARR(limit_TII_052046_s)

FOR i = 0, limit_TII_052046_s-1 DO BEGIN
   limit_difference_arr_052046 = ABS(si_o_ratio-limit_ratio_052046[i])
   limit_electron_dens_052046 = WHERE(limit_difference_arr_052046 EQ MIN(limit_difference_arr_052046), /NULL)
   limit_electron_dens_arr_052046[i] = limit_electron_dens_052046[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_052046"

;PRINT, limit_electron_dens_arr_052046

PRINT, "ZEROS"

limit_zeros_052046 = WHERE((limit_electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_052046) ;9

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_052046]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_052046 = DBLARR(limit_70_80_TII_052046_s)

FOR i = 0, limit_70_80_TII_052046_s-1 DO BEGIN
   limit_70_80_difference_arr_052046 = ABS(si_o_ratio-limit_70_80_ratio_052046[i])
   limit_70_80_electron_dens_052046 = WHERE(limit_70_80_difference_arr_052046 EQ MIN(limit_70_80_difference_arr_052046), /NULL)
   limit_70_80_electron_dens_arr_052046[i] = limit_70_80_electron_dens_052046[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_052046 = WHERE((limit_70_80_electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_052046) ;14

;60-70 km/s velocity
limit_60_70_electron_dens_arr_052046 = DBLARR(limit_60_70_TII_052046_s)

FOR i = 0, limit_60_70_TII_052046_s-1 DO BEGIN
   limit_60_70_difference_arr_052046 = ABS(si_o_ratio-limit_60_70_ratio_052046[i])
   limit_60_70_electron_dens_052046 = WHERE(limit_60_70_difference_arr_052046 EQ MIN(limit_60_70_difference_arr_052046), /NULL)
   limit_60_70_electron_dens_arr_052046[i] = limit_60_70_electron_dens_052046[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_052046 = WHERE((limit_60_70_electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_052046) ;62

;50-60 km/s velocity
limit_50_60_electron_dens_arr_052046 = DBLARR(limit_50_60_TII_052046_s)

FOR i = 0, limit_50_60_TII_052046_s-1 DO BEGIN
   limit_50_60_difference_arr_052046 = ABS(si_o_ratio-limit_50_60_ratio_052046[i])
   limit_50_60_electron_dens_052046 = WHERE(limit_50_60_difference_arr_052046 EQ MIN(limit_50_60_difference_arr_052046), /NULL)
   limit_50_60_electron_dens_arr_052046[i] = limit_50_60_electron_dens_052046[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_052046 = WHERE((limit_50_60_electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_052046) ;73

;40-50 km/s velocity
limit_40_50_electron_dens_arr_052046 = DBLARR(limit_40_50_TII_052046_s)

FOR i = 0, limit_40_50_TII_052046_s-1 DO BEGIN
   limit_40_50_difference_arr_052046 = ABS(si_o_ratio-limit_40_50_ratio_052046[i])
   limit_40_50_electron_dens_052046 = WHERE(limit_40_50_difference_arr_052046 EQ MIN(limit_40_50_difference_arr_052046), /NULL)
   limit_40_50_electron_dens_arr_052046[i] = limit_40_50_electron_dens_052046[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_052046 = WHERE((limit_40_50_electron_dens_arr_052046 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_052046) ;179

;-------------------------------------------------------------------------------

PRINT, "052046"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_052046) ;9

limit_ten_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_052046) ;1

limit_elev_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_052046) ;0

limit_twel_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_052046) ;0

limit_thirt_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_052046) ;0

limit_four_052046 = WHERE((e_density[limit_electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_052046) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_052046) ;14

limit_70_80_ten_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_052046) ;0

limit_70_80_elev_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_052046) ;5

limit_70_80_twel_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_052046) ;0

limit_70_80_thirt_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_052046) ;0

limit_70_80_four_052046 = WHERE((e_density[limit_70_80_electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_052046) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_052046) ;62

limit_60_70_ten_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_052046) ;3

limit_60_70_elev_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_052046) ;2

limit_60_70_twel_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_052046) ;0

limit_60_70_thirt_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_052046) ;0

limit_60_70_four_052046 = WHERE((e_density[limit_60_70_electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_052046) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_052046) ;74

limit_50_60_ten_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_052046) ;10

limit_50_60_elev_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_052046) ;10

limit_50_60_twel_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_052046) ;5

limit_50_60_thirt_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_052046) ;1

limit_50_60_four_052046 = WHERE((e_density[limit_50_60_electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_052046) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_nin_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_052046] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_052046) ;0

limit_40_50_ten_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_052046] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_052046) ;17

limit_40_50_elev_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_052046] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_052046) ;28

limit_40_50_twel_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_052046] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_052046) ;8

limit_40_50_thirt_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_052046] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_052046) ;0

limit_40_50_four_052046 = WHERE((e_density[limit_40_50_electron_dens_arr_052046] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_052046) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_052046 = FLOAT((N_ELEMENTS(limit_nin_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, N_ELEMENTS(limit_nin_052046)
PRINT, N_ELEMENTS(limit_num4_three) ;10
PRINT, limit_stat_nin_052046 ;90.0000

limit_stat_ten_052046 = FLOAT((N_ELEMENTS(limit_ten_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, limit_stat_ten_052046 ;10.0000

limit_stat_elev_052046 = FLOAT((N_ELEMENTS(limit_elev_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, limit_stat_elev_052046 ;0

limit_stat_twel_052046 = FLOAT((N_ELEMENTS(limit_twel_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, limit_stat_twel_052046 ;0

limit_stat_thirt_052046 = FLOAT((N_ELEMENTS(limit_thirt_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, limit_stat_thirt_052046 ;0

limit_stat_four_052046 = FLOAT((N_ELEMENTS(limit_four_052046))/FLOAT(N_ELEMENTS(limit_num4_three)))*100
PRINT, limit_stat_four_052046 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_052046 = FLOAT((N_ELEMENTS(limit_70_80_nin_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_nin_052046 ;73.6842

limit_70_80_stat_ten_052046 = FLOAT((N_ELEMENTS(limit_70_80_ten_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_ten_052046 ;0

limit_70_80_stat_elev_052046 = FLOAT((N_ELEMENTS(limit_70_80_elev_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_elev_052046 ;26.3158

limit_70_80_stat_twel_052046 = FLOAT((N_ELEMENTS(limit_70_80_twel_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_twel_052046 ;0

limit_70_80_stat_thirt_052046 = FLOAT((N_ELEMENTS(limit_70_80_thirt_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_thirt_052046 ;0

limit_70_80_stat_four_052046 = FLOAT((N_ELEMENTS(limit_70_80_four_052046))/FLOAT(N_ELEMENTS(limit_70_80_num4_three)))*100
PRINT, limit_70_80_stat_four_052046 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_052046 = FLOAT((N_ELEMENTS(limit_60_70_nin_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_nin_052046 ;92.5373

limit_60_70_stat_ten_052046 = FLOAT((N_ELEMENTS(limit_60_70_ten_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_ten_052046 ;4.47761

limit_60_70_stat_elev_052046 = FLOAT((N_ELEMENTS(limit_60_70_elev_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_elev_052046 ;2.98507

limit_60_70_stat_twel_052046 = FLOAT((N_ELEMENTS(limit_60_70_twel_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_twel_052046 ;0

limit_60_70_stat_thirt_052046 = FLOAT((N_ELEMENTS(limit_60_70_thirt_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_thirt_052046 ;0

limit_60_70_stat_four_052046 = FLOAT((N_ELEMENTS(limit_60_70_four_052046))/FLOAT(N_ELEMENTS(limit_60_70_num4_three)))*100
PRINT, limit_60_70_stat_four_052046 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_052046 = FLOAT((N_ELEMENTS(limit_50_60_nin_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_nin_052046 ;74.0000

limit_50_60_stat_ten_052046 = FLOAT((N_ELEMENTS(limit_50_60_ten_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_ten_052046 ;10.0000

limit_50_60_stat_elev_052046 = FLOAT((N_ELEMENTS(limit_50_60_elev_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_elev_052046 ;10.0000

limit_50_60_stat_twel_052046 = FLOAT((N_ELEMENTS(limit_50_60_twel_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_twel_052046 ;5.00000

limit_50_60_stat_thirt_052046 = FLOAT((N_ELEMENTS(limit_50_60_thirt_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_thirt_052046 ;1.00000

limit_50_60_stat_four_052046 = FLOAT((N_ELEMENTS(limit_50_60_four_052046))/FLOAT(N_ELEMENTS(limit_50_60_num4_three)))*100
PRINT, limit_50_60_stat_four_052046 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_052046 = FLOAT((N_ELEMENTS(limit_40_50_nin_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_nin_052046 ;0

limit_40_50_stat_ten_052046 = FLOAT((N_ELEMENTS(limit_40_50_ten_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_ten_052046 ;7.26496

limit_40_50_stat_elev_052046 = FLOAT((N_ELEMENTS(limit_40_50_elev_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_elev_052046 ;11.9658

limit_40_50_stat_twel_052046 = FLOAT((N_ELEMENTS(limit_40_50_twel_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_twel_052046 ;3.41880

limit_40_50_stat_thirt_052046 = FLOAT((N_ELEMENTS(limit_40_50_thirt_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_thirt_052046 ;0

limit_40_50_stat_four_052046 = FLOAT((N_ELEMENTS(limit_40_50_four_052046))/FLOAT(N_ELEMENTS(limit_40_50_num4_three)))*100
PRINT, limit_40_50_stat_four_052046 ;0

limit_e_dens_052046 = e_density[limit_electron_dens_arr_052046]
limit_70_80_e_dens_052046 = e_density[limit_70_80_electron_dens_arr_052046]
limit_60_70_e_dens_052046 = e_density[limit_60_70_electron_dens_arr_052046]
limit_50_60_e_dens_052046 = e_density[limit_50_60_electron_dens_arr_052046]
limit_40_50_e_dens_052046 = e_density[limit_40_50_electron_dens_arr_052046]

;===============================================================================

PRINT, '061606'

;80-1000 km/s velocity
limit_electron_dens_arr_061606 = DBLARR(limit_TII_061606_s)

FOR i = 0, limit_TII_061606_s-1 DO BEGIN
   limit_difference_arr_061606 = ABS(si_o_ratio-limit_ratio_061606[i])
   limit_electron_dens_061606 = WHERE(limit_difference_arr_061606 EQ MIN(limit_difference_arr_061606))
   limit_electron_dens_arr_061606[i] = limit_electron_dens_061606[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_061606"

;PRINT, limit_electron_dens_arr_061606 

PRINT, "ZEROS"

limit_zeros_061606 = WHERE((limit_electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_061606) ;1

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_061606]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_061606 = DBLARR(limit_70_80_TII_061606_s)

FOR i = 0, limit_70_80_TII_061606_s-1 DO BEGIN
   limit_70_80_difference_arr_061606 = ABS(si_o_ratio-limit_70_80_ratio_061606[i])
   limit_70_80_electron_dens_061606 = WHERE(limit_70_80_difference_arr_061606 EQ MIN(limit_70_80_difference_arr_061606), /NULL)
   limit_70_80_electron_dens_arr_061606[i] = limit_70_80_electron_dens_061606[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_061606 = WHERE((limit_70_80_electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_061606) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_061606 = DBLARR(limit_60_70_TII_061606_s)

FOR i = 0, limit_60_70_TII_061606_s-1 DO BEGIN
   limit_60_70_difference_arr_061606 = ABS(si_o_ratio-limit_60_70_ratio_061606[i])
   limit_60_70_electron_dens_061606 = WHERE(limit_60_70_difference_arr_061606 EQ MIN(limit_60_70_difference_arr_061606), /NULL)
   limit_60_70_electron_dens_arr_061606[i] = limit_60_70_electron_dens_061606[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_061606 = WHERE((limit_60_70_electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_061606) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_061606 = DBLARR(limit_50_60_TII_061606_s)

FOR i = 0, limit_50_60_TII_061606_s-1 DO BEGIN
   limit_50_60_difference_arr_061606 = ABS(si_o_ratio-limit_50_60_ratio_061606[i])
   limit_50_60_electron_dens_061606 = WHERE(limit_50_60_difference_arr_061606 EQ MIN(limit_50_60_difference_arr_061606), /NULL)
   limit_50_60_electron_dens_arr_061606[i] = limit_50_60_electron_dens_061606[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_061606 = WHERE((limit_50_60_electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_061606) ;7

;40-50 km/s velocity
limit_40_50_electron_dens_arr_061606 = DBLARR(limit_40_50_TII_061606_s)

FOR i = 0, limit_40_50_TII_061606_s-1 DO BEGIN
   limit_40_50_difference_arr_061606 = ABS(si_o_ratio-limit_40_50_ratio_061606[i])
   limit_40_50_electron_dens_061606 = WHERE(limit_40_50_difference_arr_061606 EQ MIN(limit_40_50_difference_arr_061606), /NULL)
   limit_40_50_electron_dens_arr_061606[i] = limit_40_50_electron_dens_061606[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_061606 = WHERE((limit_40_50_electron_dens_arr_061606 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_061606) ;10

;-------------------------------------------------------------------------------

PRINT, "061606"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_061606) ;2

limit_ten_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_061606) ;0

limit_elev_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_061606) ;0

limit_twel_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_061606) ;0

limit_thirt_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_061606) ;0

limit_four_061606 = WHERE((e_density[limit_electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_061606) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_061606) ;0

limit_70_80_ten_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_061606) ;0

limit_70_80_elev_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_061606) ;1

limit_70_80_twel_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_061606) ;0

limit_70_80_thirt_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_061606) ;0

limit_70_80_four_061606 = WHERE((e_density[limit_70_80_electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_061606) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_061606) ;0

limit_60_70_ten_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_061606) ;1

limit_60_70_elev_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_061606) ;0

limit_60_70_twel_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_061606) ;0

limit_60_70_thirt_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_061606) ;0

limit_60_70_four_061606 = WHERE((e_density[limit_60_70_electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_061606) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_061606) ;7

limit_50_60_ten_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_061606) ;1

limit_50_60_elev_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_061606) ;0

limit_50_60_twel_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_061606) ;0

limit_50_60_thirt_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_061606) ;0

limit_50_60_four_061606 = WHERE((e_density[limit_50_60_electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_061606) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_061606] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_061606) ;10

limit_40_50_ten_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_061606] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_061606) ;0

limit_40_50_elev_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_061606] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_061606) ;1

limit_40_50_twel_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_061606] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_061606) ;0

limit_40_50_thirt_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_061606] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_061606) ;0

limit_40_50_four_061606 = WHERE((e_density[limit_40_50_electron_dens_arr_061606] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_061606) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_061606 = FLOAT((N_ELEMENTS(limit_nin_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_nin_061606 ;100.0000

limit_stat_ten_061606 = FLOAT((N_ELEMENTS(limit_ten_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_ten_061606 ;0

limit_stat_elev_061606 = FLOAT((N_ELEMENTS(limit_elev_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_elev_061606 ;0

limit_stat_twel_061606 = FLOAT((N_ELEMENTS(limit_twel_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_twel_061606 ;0

limit_stat_thirt_061606 = FLOAT((N_ELEMENTS(limit_thirt_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_thirt_061606 ;0

limit_stat_four_061606 = FLOAT((N_ELEMENTS(limit_four_061606))/FLOAT(N_ELEMENTS(limit_num5_three)))*100
PRINT, limit_stat_four_061606 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_061606 = FLOAT((N_ELEMENTS(limit_70_80_nin_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_nin_061606 ;0

limit_70_80_stat_ten_061606 = FLOAT((N_ELEMENTS(limit_70_80_ten_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_ten_061606 ;0

limit_70_80_stat_elev_061606 = FLOAT((N_ELEMENTS(limit_70_80_elev_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_elev_061606 ;100.000

limit_70_80_stat_twel_061606 = FLOAT((N_ELEMENTS(limit_70_80_twel_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_twel_061606 ;0

limit_70_80_stat_thirt_061606 = FLOAT((N_ELEMENTS(limit_70_80_thirt_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_thirt_061606 ;0

limit_70_80_stat_four_061606 = FLOAT((N_ELEMENTS(limit_70_80_four_061606))/FLOAT(N_ELEMENTS(limit_70_80_num5_three)))*100
PRINT, limit_70_80_stat_four_061606 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_061606 = FLOAT((N_ELEMENTS(limit_60_70_nin_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_nin_061606 ;0

limit_60_70_stat_ten_061606 = FLOAT((N_ELEMENTS(limit_60_70_ten_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_ten_061606 ;100.000

limit_60_70_stat_elev_061606 = FLOAT((N_ELEMENTS(limit_60_70_elev_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_elev_061606 ;0

limit_60_70_stat_twel_061606 = FLOAT((N_ELEMENTS(limit_60_70_twel_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_twel_061606 ;0

limit_60_70_stat_thirt_061606 = FLOAT((N_ELEMENTS(limit_60_70_thirt_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_thirt_061606 ;0

limit_60_70_stat_four_061606 = FLOAT((N_ELEMENTS(limit_60_70_four_061606))/FLOAT(N_ELEMENTS(limit_60_70_num5_three)))*100
PRINT, limit_60_70_stat_four_061606 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_061606 = FLOAT((N_ELEMENTS(limit_50_60_nin_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_nin_061606 ;87.5000

limit_50_60_stat_ten_061606 = FLOAT((N_ELEMENTS(limit_50_60_ten_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_ten_061606 ;12.5000

limit_50_60_stat_elev_061606 = FLOAT((N_ELEMENTS(limit_50_60_elev_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_elev_061606 ;0

limit_50_60_stat_twel_061606 = FLOAT((N_ELEMENTS(limit_50_60_twel_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_twel_061606 ;0

limit_50_60_stat_thirt_061606 = FLOAT((N_ELEMENTS(limit_50_60_thirt_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_thirt_061606 ;0

limit_50_60_stat_four_061606 = FLOAT((N_ELEMENTS(limit_50_60_four_061606))/FLOAT(N_ELEMENTS(limit_50_60_num5_three)))*100
PRINT, limit_50_60_stat_four_061606 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_061606 = FLOAT((N_ELEMENTS(limit_40_50_nin_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_nin_061606 ;90.9091

limit_40_50_stat_ten_061606 = FLOAT((N_ELEMENTS(limit_40_50_ten_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_ten_061606 ;0

limit_40_50_stat_elev_061606 = FLOAT((N_ELEMENTS(limit_40_50_elev_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_elev_061606 ;9.09091

limit_40_50_stat_twel_061606 = FLOAT((N_ELEMENTS(limit_40_50_twel_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_twel_061606 ;0

limit_40_50_stat_thirt_061606 = FLOAT((N_ELEMENTS(limit_40_50_thirt_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_thirt_061606 ;0

limit_40_50_stat_four_061606 = FLOAT((N_ELEMENTS(limit_40_50_four_061606))/FLOAT(N_ELEMENTS(limit_40_50_num5_three)))*100
PRINT, limit_40_50_stat_four_061606 ;0

limit_e_dens_061606 = e_density[limit_electron_dens_arr_061606]
limit_70_80_e_dens_061606 = e_density[limit_70_80_electron_dens_arr_061606]
limit_60_70_e_dens_061606 = e_density[limit_60_70_electron_dens_arr_061606]
limit_50_60_e_dens_061606 = e_density[limit_50_60_electron_dens_arr_061606]
limit_40_50_e_dens_061606 = e_density[limit_40_50_electron_dens_arr_061606]

;===============================================================================

PRINT, '114951'

;80-1000 km/s velocity
limit_electron_dens_arr_114951 = DBLARR(limit_TII_114951_s)

FOR i = 0, limit_TII_114951_s-1 DO BEGIN
   limit_difference_arr_114951 = ABS(si_o_ratio-limit_ratio_114951[i])
   limit_electron_dens_114951 = WHERE(limit_difference_arr_114951 EQ MIN(limit_difference_arr_114951), /NULL) ;remove -1
   limit_electron_dens_arr_114951[i] = limit_electron_dens_114951[0] ;0 to choose the first min value if more than one
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_114951"

;PRINT, limit_electron_dens_arr_114951 

PRINT, "ZEROS"

limit_zeros_114951 = WHERE((limit_electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_114951) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_114951]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_114951 = DBLARR(limit_70_80_TII_114951_s)

FOR i = 0, limit_70_80_TII_114951_s-1 DO BEGIN
   limit_70_80_difference_arr_114951 = ABS(si_o_ratio-limit_70_80_ratio_114951[i])
   limit_70_80_electron_dens_114951 = WHERE(limit_70_80_difference_arr_114951 EQ MIN(limit_70_80_difference_arr_114951), /NULL)
   limit_70_80_electron_dens_arr_114951[i] = limit_70_80_electron_dens_114951[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_114951 = WHERE((limit_70_80_electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_114951) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_114951 = DBLARR(limit_60_70_TII_114951_s)

FOR i = 0, limit_60_70_TII_114951_s-1 DO BEGIN
   limit_60_70_difference_arr_114951 = ABS(si_o_ratio-limit_60_70_ratio_114951[i])
   limit_60_70_electron_dens_114951 = WHERE(limit_60_70_difference_arr_114951 EQ MIN(limit_60_70_difference_arr_114951), /NULL)
   limit_60_70_electron_dens_arr_114951[i] = limit_60_70_electron_dens_114951[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_114951 = WHERE((limit_60_70_electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_114951) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_114951 = DBLARR(limit_50_60_TII_114951_s)

FOR i = 0, limit_50_60_TII_114951_s-1 DO BEGIN
   limit_50_60_difference_arr_114951 = ABS(si_o_ratio-limit_50_60_ratio_114951[i])
   limit_50_60_electron_dens_114951 = WHERE(limit_50_60_difference_arr_114951 EQ MIN(limit_50_60_difference_arr_114951), /NULL)
   limit_50_60_electron_dens_arr_114951[i] = limit_50_60_electron_dens_114951[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_114951 = WHERE((limit_50_60_electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_114951) ;2

;40-50 km/s velocity
limit_40_50_electron_dens_arr_114951 = DBLARR(limit_40_50_TII_114951_s)

FOR i = 0, limit_40_50_TII_114951_s-1 DO BEGIN
   limit_40_50_difference_arr_114951 = ABS(si_o_ratio-limit_40_50_ratio_114951[i])
   limit_40_50_electron_dens_114951 = WHERE(limit_40_50_difference_arr_114951 EQ MIN(limit_40_50_difference_arr_114951), /NULL)
   limit_40_50_electron_dens_arr_114951[i] = limit_40_50_electron_dens_114951[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_114951 = WHERE((limit_40_50_electron_dens_arr_114951 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_114951) ;4

;-------------------------------------------------------------------------------

PRINT, "114951"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_114951) ;0

limit_ten_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_114951) ;0

limit_elev_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_114951) ;0

limit_twel_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_114951) ;1

limit_thirt_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_114951) ;0

limit_four_114951 = WHERE((e_density[limit_electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_114951) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_114951) ;0

limit_70_80_ten_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_114951) ;0

limit_70_80_elev_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_114951) ;0

limit_70_80_twel_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_114951) ;0

limit_70_80_thirt_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_114951) ;1

limit_70_80_four_114951 = WHERE((e_density[limit_70_80_electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_114951) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_114951) ;0

limit_60_70_ten_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_114951) ;0

limit_60_70_elev_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_114951) ;3

limit_60_70_twel_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_114951) ;0

limit_60_70_thirt_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_114951) ;0

limit_60_70_four_114951 = WHERE((e_density[limit_60_70_electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_114951) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_114951) ;2

limit_50_60_ten_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_114951) ;3

limit_50_60_elev_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_114951) ;7

limit_50_60_twel_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_114951) ;0

limit_50_60_thirt_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_114951) ;0

limit_50_60_four_114951 = WHERE((e_density[limit_50_60_electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_114951) ;0

PRINT, '50-60 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_114951] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_114951) ;6

limit_40_50_ten_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_114951] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_114951) ;6

limit_40_50_elev_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_114951] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_114951) ;3

limit_40_50_twel_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_114951] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_114951) ;0

limit_40_50_thirt_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_114951] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_114951) ;0

limit_40_50_four_114951 = WHERE((e_density[limit_40_50_electron_dens_arr_114951] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_114951) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_114951 = FLOAT((N_ELEMENTS(limit_nin_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_nin_114951 ;0

limit_stat_ten_114951 = FLOAT((N_ELEMENTS(limit_ten_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_ten_114951 ;0

limit_stat_elev_114951 = FLOAT((N_ELEMENTS(limit_elev_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_elev_114951 ;0

limit_stat_twel_114951 = FLOAT((N_ELEMENTS(limit_twel_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_twel_114951 ;100.0000

limit_stat_thirt_114951 = FLOAT((N_ELEMENTS(limit_thirt_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_thirt_114951 ;0

limit_stat_four_114951 = FLOAT((N_ELEMENTS(limit_four_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_four_114951 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_114951 = FLOAT((N_ELEMENTS(limit_70_80_nin_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_nin_114951 ;0

limit_70_80_stat_ten_114951 = FLOAT((N_ELEMENTS(limit_70_80_ten_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_ten_114951 ;0

limit_70_80_stat_elev_114951 = FLOAT((N_ELEMENTS(limit_70_80_elev_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_elev_114951 ;0

limit_70_80_stat_twel_114951 = FLOAT((N_ELEMENTS(limit_70_80_twel_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_twel_114951 ;0

limit_70_80_stat_thirt_114951 = FLOAT((N_ELEMENTS(limit_70_80_thirt_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_thirt_114951 ;100.000

limit_70_80_stat_four_114951 = FLOAT((N_ELEMENTS(limit_70_80_four_114951))/FLOAT(N_ELEMENTS(limit_70_80_num6_three)))*100
PRINT, limit_70_80_stat_four_114951 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_114951 = FLOAT((N_ELEMENTS(limit_60_70_nin_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_nin_114951 ;0

limit_60_70_stat_ten_114951 = FLOAT((N_ELEMENTS(limit_60_70_ten_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_ten_114951 ;0

limit_60_70_stat_elev_114951 = FLOAT((N_ELEMENTS(limit_60_70_elev_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_elev_114951 ;100.000

limit_60_70_stat_twel_114951 = FLOAT((N_ELEMENTS(limit_60_70_twel_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_twel_114951 ;0

limit_60_70_stat_thirt_114951 = FLOAT((N_ELEMENTS(limit_60_70_thirt_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_thirt_114951 ;0

limit_60_70_stat_four_114951 = FLOAT((N_ELEMENTS(limit_60_70_four_114951))/FLOAT(N_ELEMENTS(limit_60_70_num6_three)))*100
PRINT, limit_60_70_stat_four_114951 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_114951 = FLOAT((N_ELEMENTS(limit_50_60_nin_114951))/FLOAT(N_ELEMENTS(limit_50_60_num6_three)))*100
PRINT, limit_50_60_stat_nin_114951 ;16.6667

limit_50_60_stat_ten_114951 = FLOAT((N_ELEMENTS(limit_50_60_ten_114951))/FLOAT(N_ELEMENTS(limit_50_60_num6_three)))*100
PRINT, limit_50_60_stat_ten_114951 ;25.0000

limit_50_60_stat_elev_114951 = FLOAT((N_ELEMENTS(limit_50_60_elev_114951))/FLOAT(N_ELEMENTS(limit_50_60_num6_three)))*100
PRINT, limit_50_60_stat_elev_114951 ;58.3333

limit_50_60_stat_twel_114951 = FLOAT((N_ELEMENTS(limit_50_60_twel_114951))/FLOAT(N_ELEMENTS(limit_50_60_num6_three)))*100
PRINT, limit_50_60_stat_twel_114951 ;0

limit_50_60_stat_thirt_114951 = FLOAT((N_ELEMENTS(limit_50_60_thirt_114951))/FLOAT(N_ELEMENTS(limit_50_60_num6_three)))*100
PRINT, limit_50_60_stat_thirt_114951 ;0

limit_stat_four_114951 = FLOAT((N_ELEMENTS(limit_four_114951))/FLOAT(N_ELEMENTS(limit_num6_three)))*100
PRINT, limit_stat_four_114951 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_114951 = FLOAT((N_ELEMENTS(limit_40_50_nin_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_nin_114951 ;40.0000

limit_40_50_stat_ten_114951 = FLOAT((N_ELEMENTS(limit_40_50_ten_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_ten_114951 ;40.0000

limit_40_50_stat_elev_114951 = FLOAT((N_ELEMENTS(limit_40_50_elev_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_elev_114951 ;20.0000

limit_40_50_stat_twel_114951 = FLOAT((N_ELEMENTS(limit_40_50_twel_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_twel_114951 ;0

limit_40_50_stat_thirt_114951 = FLOAT((N_ELEMENTS(limit_40_50_thirt_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_thirt_114951 ;0

limit_40_50_stat_four_114951 = FLOAT((N_ELEMENTS(limit_40_50_four_114951))/FLOAT(N_ELEMENTS(limit_40_50_num6_three)))*100
PRINT, limit_40_50_stat_four_114951 ;0

limit_e_dens_114951 = e_density[limit_electron_dens_arr_114951]
limit_70_80_e_dens_114951 = e_density[limit_70_80_electron_dens_arr_114951]
limit_60_70_e_dens_114951 = e_density[limit_60_70_electron_dens_arr_114951]
limit_50_60_e_dens_114951 = e_density[limit_50_60_electron_dens_arr_114951]
limit_40_50_e_dens_114951 = e_density[limit_40_50_electron_dens_arr_114951]

;===============================================================================

PRINT, '122033'

;80-1000 km/s velocity
limit_electron_dens_arr_122033 = DBLARR(limit_TII_122033_s)

FOR i = 0, limit_TII_122033_s-1 DO BEGIN
   limit_difference_arr_122033 = ABS(si_o_ratio-limit_ratio_122033[i])
   limit_electron_dens_122033 = WHERE(limit_difference_arr_122033 EQ MIN(limit_difference_arr_122033), /NULL)
   limit_electron_dens_arr_122033[i] = limit_electron_dens_122033[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_122033"

;PRINT, limit_electron_dens_arr_122033 

PRINT, "ZEROS"

limit_zeros_122033 = WHERE((limit_electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_122033) ;7

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_122033]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_122033 = DBLARR(limit_70_80_TII_122033_s)

FOR i = 0, limit_70_80_TII_122033_s-1 DO BEGIN
   limit_70_80_difference_arr_122033 = ABS(si_o_ratio-limit_70_80_ratio_122033[i])
   limit_70_80_electron_dens_122033 = WHERE(limit_70_80_difference_arr_122033 EQ MIN(limit_70_80_difference_arr_122033), /NULL)
   limit_70_80_electron_dens_arr_122033[i] = limit_70_80_electron_dens_122033[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_122033 = WHERE((limit_70_80_electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_122033) ;7

;60-70 km/s velocity
limit_60_70_electron_dens_arr_122033 = DBLARR(limit_60_70_TII_122033_s)

FOR i = 0, limit_60_70_TII_122033_s-1 DO BEGIN
   limit_60_70_difference_arr_122033 = ABS(si_o_ratio-limit_60_70_ratio_122033[i])
   limit_60_70_electron_dens_122033 = WHERE(limit_60_70_difference_arr_122033 EQ MIN(limit_60_70_difference_arr_122033), /NULL)
   limit_60_70_electron_dens_arr_122033[i] = limit_60_70_electron_dens_122033[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_122033 = WHERE((limit_60_70_electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_122033) ;10

;50-60 km/s velocity
limit_50_60_electron_dens_arr_122033 = DBLARR(limit_50_60_TII_122033_s)

FOR i = 0, limit_50_60_TII_122033_s-1 DO BEGIN
   limit_50_60_difference_arr_122033 = ABS(si_o_ratio-limit_50_60_ratio_122033[i])
   limit_50_60_electron_dens_122033 = WHERE(limit_50_60_difference_arr_122033 EQ MIN(limit_50_60_difference_arr_122033), /NULL)
   limit_50_60_electron_dens_arr_122033[i] = limit_50_60_electron_dens_122033[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_122033 = WHERE((limit_50_60_electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_122033) ;33

;40-50 km/s velocity
limit_40_50_electron_dens_arr_122033 = DBLARR(limit_40_50_TII_122033_s)

FOR i = 0, limit_40_50_TII_122033_s-1 DO BEGIN
   limit_40_50_difference_arr_122033 = ABS(si_o_ratio-limit_40_50_ratio_122033[i])
   limit_40_50_electron_dens_122033 = WHERE(limit_40_50_difference_arr_122033 EQ MIN(limit_40_50_difference_arr_122033), /NULL)
   limit_40_50_electron_dens_arr_122033[i] = limit_40_50_electron_dens_122033[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_122033 = WHERE((limit_40_50_electron_dens_arr_122033 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_122033) ;42

;-------------------------------------------------------------------------------

PRINT, "122033"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_122033) ;7

limit_ten_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_122033) ;2

limit_elev_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_122033) ;5

limit_twel_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_122033) ;1

limit_thirt_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_122033) ;0

limit_four_122033 = WHERE((e_density[limit_electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_122033) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_122033) ;7

limit_70_80_ten_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_122033) ;0

limit_70_80_elev_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_122033) ;2

limit_70_80_twel_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_122033) ;0

limit_70_80_thirt_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_122033) ;0

limit_70_80_four_122033 = WHERE((e_density[limit_70_80_electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_122033) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_122033) ;11

limit_60_70_ten_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_122033) ;1

limit_60_70_elev_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_122033) ;5

limit_60_70_twel_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_122033) ;3

limit_60_70_thirt_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_122033) ;0

limit_60_70_four_122033 = WHERE((e_density[limit_60_70_electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_122033) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_122033) ;33

limit_50_60_ten_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_122033) ;4

limit_50_60_elev_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_122033) ;9

limit_50_60_twel_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_122033) ;0

limit_50_60_thirt_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_122033) ;0

limit_50_60_four_122033 = WHERE((e_density[limit_50_60_electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_122033) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_122033] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_122033) ;49

limit_40_50_ten_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_122033] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_122033) ;57

limit_40_50_elev_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_122033] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_122033) ;12

limit_40_50_twel_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_122033] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_122033) ;0

limit_40_50_thirt_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_122033] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_122033) ;0

limit_40_50_four_122033 = WHERE((e_density[limit_40_50_electron_dens_arr_122033] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_122033) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_122033 = FLOAT((N_ELEMENTS(limit_nin_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_nin_122033 ;46.6667

limit_stat_ten_122033 = FLOAT((N_ELEMENTS(limit_ten_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_ten_122033 ;13.3333

limit_stat_elev_122033 = FLOAT((N_ELEMENTS(limit_elev_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_elev_122033 ;33.3333

limit_stat_twel_122033 = FLOAT((N_ELEMENTS(limit_twel_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_twel_122033 ;6.66667

limit_stat_thirt_122033 = FLOAT((N_ELEMENTS(limit_thirt_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_thirt_122033 ;0

limit_stat_four_122033 = FLOAT((N_ELEMENTS(limit_four_122033))/FLOAT(N_ELEMENTS(limit_num7_three)))*100
PRINT, limit_stat_four_122033 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_122033 = FLOAT((N_ELEMENTS(limit_70_80_nin_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_nin_122033 ;77.7778

limit_70_80_stat_ten_122033 = FLOAT((N_ELEMENTS(limit_70_80_ten_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_ten_122033 ;0

limit_70_80_stat_elev_122033 = FLOAT((N_ELEMENTS(limit_70_80_elev_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_elev_122033 ;22.2222

limit_70_80_stat_twel_122033 = FLOAT((N_ELEMENTS(limit_70_80_twel_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_twel_122033 ;0

limit_70_80_stat_thirt_122033 = FLOAT((N_ELEMENTS(limit_70_80_thirt_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_thirt_122033 ;0

limit_70_80_stat_four_122033 = FLOAT((N_ELEMENTS(limit_70_80_four_122033))/FLOAT(N_ELEMENTS(limit_70_80_num7_three)))*100
PRINT, limit_70_80_stat_four_122033 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_122033 = FLOAT((N_ELEMENTS(limit_60_70_nin_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_nin_122033 ;55.0000

limit_60_70_stat_ten_122033 = FLOAT((N_ELEMENTS(limit_60_70_ten_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_ten_122033 ;5.00000

limit_60_70_stat_elev_122033 = FLOAT((N_ELEMENTS(limit_60_70_elev_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_elev_122033 ;25.0000

limit_60_70_stat_twel_122033 = FLOAT((N_ELEMENTS(limit_60_70_twel_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_twel_122033 ;15.0000

limit_60_70_stat_thirt_122033 = FLOAT((N_ELEMENTS(limit_60_70_thirt_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_thirt_122033 ;0

limit_60_70_stat_four_122033 = FLOAT((N_ELEMENTS(limit_60_70_four_122033))/FLOAT(N_ELEMENTS(limit_60_70_num7_three)))*100
PRINT, limit_60_70_stat_four_122033 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_122033 = FLOAT((N_ELEMENTS(limit_50_60_nin_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_nin_122033 ;71.7391

limit_50_60_stat_ten_122033 = FLOAT((N_ELEMENTS(limit_50_60_ten_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_ten_122033 ;8.69565

limit_50_60_stat_elev_122033 = FLOAT((N_ELEMENTS(limit_50_60_elev_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_elev_122033 ;19.5652

limit_50_60_stat_twel_122033 = FLOAT((N_ELEMENTS(limit_50_60_twel_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_twel_122033 ;0

limit_50_60_stat_thirt_122033 = FLOAT((N_ELEMENTS(limit_50_60_thirt_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_thirt_122033 ;0

limit_50_60_stat_four_122033 = FLOAT((N_ELEMENTS(limit_50_60_four_122033))/FLOAT(N_ELEMENTS(limit_50_60_num7_three)))*100
PRINT, limit_50_60_stat_four_122033 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_122033 = FLOAT((N_ELEMENTS(limit_40_50_nin_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_nin_122033 ;41.5254

limit_40_50_stat_ten_122033 = FLOAT((N_ELEMENTS(limit_40_50_ten_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_ten_122033 ;48.3051

limit_40_50_stat_elev_122033 = FLOAT((N_ELEMENTS(limit_40_50_elev_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_elev_122033 ;10.1695

limit_40_50_stat_twel_122033 = FLOAT((N_ELEMENTS(limit_40_50_twel_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_twel_122033 ;0

limit_40_50_stat_thirt_122033 = FLOAT((N_ELEMENTS(limit_40_50_thirt_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_thirt_122033 ;0

limit_40_50_stat_four_122033 = FLOAT((N_ELEMENTS(limit_40_50_four_122033))/FLOAT(N_ELEMENTS(limit_40_50_num7_three)))*100
PRINT, limit_40_50_stat_four_122033 ;0

limit_e_dens_122033 = e_density[limit_electron_dens_arr_122033]
limit_70_80_e_dens_122033 = e_density[limit_70_80_electron_dens_arr_122033]
limit_60_70_e_dens_122033 = e_density[limit_60_70_electron_dens_arr_122033]
limit_50_60_e_dens_122033 = e_density[limit_50_60_electron_dens_arr_122033]
limit_40_50_e_dens_122033 = e_density[limit_40_50_electron_dens_arr_122033]

;===============================================================================

PRINT, '160806'

;80-1000 km/s velocity
limit_electron_dens_arr_160806 = DBLARR(limit_TII_160806_s)

FOR i = 0, limit_TII_160806_s-1 DO BEGIN
   limit_difference_arr_160806 = ABS(si_o_ratio-limit_ratio_160806[i])
   limit_electron_dens_160806 = WHERE(limit_difference_arr_160806 EQ MIN(limit_difference_arr_160806), /NULL)
   limit_electron_dens_arr_160806[i] = limit_electron_dens_160806[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_160806"

;PRINT, limit_electron_dens_arr_160806 

PRINT, "ZEROS"

limit_zeros_160806 = WHERE((limit_electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_160806) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_160806]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_160806 = DBLARR(limit_70_80_TII_160806_s)

FOR i = 0, limit_70_80_TII_160806_s-1 DO BEGIN
   limit_70_80_difference_arr_160806 = ABS(si_o_ratio-limit_70_80_ratio_160806[i])
   limit_70_80_electron_dens_160806 = WHERE(limit_70_80_difference_arr_160806 EQ MIN(limit_70_80_difference_arr_160806), /NULL)
   limit_70_80_electron_dens_arr_160806[i] = limit_70_80_electron_dens_160806[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_160806 = WHERE((limit_70_80_electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_160806) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_160806 = DBLARR(limit_60_70_TII_160806_s)

FOR i = 0, limit_60_70_TII_160806_s-1 DO BEGIN
   limit_60_70_difference_arr_160806 = ABS(si_o_ratio-limit_60_70_ratio_160806[i])
   limit_60_70_electron_dens_160806 = WHERE(limit_60_70_difference_arr_160806 EQ MIN(limit_60_70_difference_arr_160806), /NULL)
   limit_60_70_electron_dens_arr_160806[i] = limit_60_70_electron_dens_160806[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_160806 = WHERE((limit_60_70_electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_160806) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_160806 = DBLARR(limit_50_60_TII_160806_s)

FOR i = 0, limit_50_60_TII_160806_s-1 DO BEGIN
   limit_50_60_difference_arr_160806 = ABS(si_o_ratio-limit_50_60_ratio_160806[i])
   limit_50_60_electron_dens_160806 = WHERE(limit_50_60_difference_arr_160806 EQ MIN(limit_50_60_difference_arr_160806), /NULL)
   limit_50_60_electron_dens_arr_160806[i] = limit_50_60_electron_dens_160806[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_160806 = WHERE((limit_50_60_electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_160806) ;1

;40-50 km/s velocity
limit_40_50_electron_dens_arr_160806 = DBLARR(limit_40_50_TII_160806_s)

FOR i = 0, limit_40_50_TII_160806_s-1 DO BEGIN
   limit_40_50_difference_arr_160806 = ABS(si_o_ratio-limit_40_50_ratio_160806[i])
   limit_40_50_electron_dens_160806 = WHERE(limit_40_50_difference_arr_160806 EQ MIN(limit_40_50_difference_arr_160806), /NULL)
   limit_40_50_electron_dens_arr_160806[i] = limit_40_50_electron_dens_160806[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_160806 = WHERE((limit_40_50_electron_dens_arr_160806 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_160806) ;1

;-------------------------------------------------------------------------------

PRINT, "160806"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_160806) ;0

limit_ten_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_160806) ;0

limit_elev_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_160806) ;2

limit_twel_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_160806) ;0

limit_thirt_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_160806) ;0

limit_four_160806 = WHERE((e_density[limit_electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_160806) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_160806) ;0

limit_70_80_ten_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_160806) ;0

limit_70_80_elev_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_160806) ;0

limit_70_80_twel_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_160806) ;1

limit_70_80_thirt_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_160806) ;0

limit_70_80_four_160806 = WHERE((e_density[limit_70_80_electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_160806) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_160806) ;0

limit_60_70_ten_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_160806) ;0

limit_60_70_elev_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_160806) ;1

limit_60_70_twel_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_160806) ;0

limit_60_70_thirt_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_160806) ;0

limit_60_70_four_160806 = WHERE((e_density[limit_60_70_electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_160806) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_160806) ;2

limit_50_60_ten_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_160806) ;0

limit_50_60_elev_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_160806) ;0

limit_50_60_twel_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_160806) ;0

limit_50_60_thirt_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_160806) ;0

limit_50_60_four_160806 = WHERE((e_density[limit_50_60_electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_160806) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_160806] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_160806) ;1

limit_40_50_ten_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_160806] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_160806) ;8

limit_40_50_elev_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_160806] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_160806) ;0

limit_40_50_twel_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_160806] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_160806) ;0

limit_40_50_thirt_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_160806] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_160806) ;0

limit_40_50_four_160806 = WHERE((e_density[limit_40_50_electron_dens_arr_160806] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_160806) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_160806 = FLOAT((N_ELEMENTS(limit_nin_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_nin_160806 ;0

limit_stat_ten_160806 = FLOAT((N_ELEMENTS(limit_ten_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_ten_160806 ;0

limit_stat_elev_160806 = FLOAT((N_ELEMENTS(limit_elev_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_elev_160806 ;100.0000

limit_stat_twel_160806 = FLOAT((N_ELEMENTS(limit_twel_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_twel_160806 ;0

limit_stat_thirt_160806 = FLOAT((N_ELEMENTS(limit_thirt_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_thirt_160806 ;0

limit_stat_four_160806 = FLOAT((N_ELEMENTS(limit_four_160806))/FLOAT(N_ELEMENTS(limit_num8_three)))*100
PRINT, limit_stat_four_160806 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_160806 = FLOAT((N_ELEMENTS(limit_70_80_nin_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_nin_160806 ;0

limit_70_80_stat_ten_160806 = FLOAT((N_ELEMENTS(limit_70_80_ten_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_ten_160806 ;0

limit_70_80_stat_elev_160806 = FLOAT((N_ELEMENTS(limit_70_80_elev_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_elev_160806 ;0

limit_70_80_stat_twel_160806 = FLOAT((N_ELEMENTS(limit_70_80_twel_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_twel_160806 ;100.000

limit_70_80_stat_thirt_160806 = FLOAT((N_ELEMENTS(limit_70_80_thirt_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_thirt_160806 ;0

limit_70_80_stat_four_160806 = FLOAT((N_ELEMENTS(limit_70_80_four_160806))/FLOAT(N_ELEMENTS(limit_70_80_num8_three)))*100
PRINT, limit_70_80_stat_four_160806 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_160806 = FLOAT((N_ELEMENTS(limit_60_70_nin_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_nin_160806 ;0

limit_60_70_stat_ten_160806 = FLOAT((N_ELEMENTS(limit_60_70_ten_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_ten_160806 ;0

limit_60_70_stat_elev_160806 = FLOAT((N_ELEMENTS(limit_60_70_elev_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_elev_160806 ;100.000

limit_60_70_stat_twel_160806 = FLOAT((N_ELEMENTS(limit_60_70_twel_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_twel_160806 ;0

limit_60_70_stat_thirt_160806 = FLOAT((N_ELEMENTS(limit_60_70_thirt_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_thirt_160806 ;0

limit_60_70_stat_four_160806 = FLOAT((N_ELEMENTS(limit_60_70_four_160806))/FLOAT(N_ELEMENTS(limit_60_70_num8_three)))*100
PRINT, limit_60_70_stat_four_160806 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_160806 = FLOAT((N_ELEMENTS(limit_50_60_nin_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_nin_160806 ;100.000

limit_50_60_stat_ten_160806 = FLOAT((N_ELEMENTS(limit_50_60_ten_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_ten_160806 ;0

limit_50_60_stat_elev_160806 = FLOAT((N_ELEMENTS(limit_50_60_elev_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_elev_160806 ;0

limit_50_60_stat_twel_160806 = FLOAT((N_ELEMENTS(limit_50_60_twel_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_twel_160806 ;0

limit_50_60_stat_thirt_160806 = FLOAT((N_ELEMENTS(limit_50_60_thirt_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_thirt_160806 ;0

limit_50_60_stat_four_160806 = FLOAT((N_ELEMENTS(limit_50_60_four_160806))/FLOAT(N_ELEMENTS(limit_50_60_num8_three)))*100
PRINT, limit_50_60_stat_four_160806 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_160806 = FLOAT((N_ELEMENTS(limit_40_50_nin_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_nin_160806 ;11.1111

limit_40_50_stat_ten_160806 = FLOAT((N_ELEMENTS(limit_40_50_ten_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_ten_160806 ;88.8889

limit_40_50_stat_elev_160806 = FLOAT((N_ELEMENTS(limit_40_50_elev_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_elev_160806 ;0

limit_40_50_stat_twel_160806 = FLOAT((N_ELEMENTS(limit_40_50_twel_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_twel_160806 ;0

limit_40_50_stat_thirt_160806 = FLOAT((N_ELEMENTS(limit_40_50_thirt_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_thirt_160806 ;0

limit_40_50_stat_four_160806 = FLOAT((N_ELEMENTS(limit_40_50_four_160806))/FLOAT(N_ELEMENTS(limit_40_50_num8_three)))*100
PRINT, limit_40_50_stat_four_160806 ;0

limit_e_dens_160806 = e_density[limit_electron_dens_arr_160806]
limit_70_80_e_dens_160806 = e_density[limit_70_80_electron_dens_arr_160806]
limit_60_70_e_dens_160806 = e_density[limit_60_70_electron_dens_arr_160806]
limit_50_60_e_dens_160806 = e_density[limit_50_60_electron_dens_arr_160806]
limit_40_50_e_dens_160806 = e_density[limit_40_50_electron_dens_arr_160806]

;===============================================================================

PRINT, '163205'

;80-1000 km/s velocity
limit_electron_dens_arr_163205 = DBLARR(limit_TII_163205_s)

FOR i = 0, limit_TII_163205_s-1 DO BEGIN
   limit_difference_arr_163205 = ABS(si_o_ratio-limit_ratio_163205[i])
   limit_electron_dens_163205 = WHERE(limit_difference_arr_163205 EQ MIN(limit_difference_arr_163205), /NULL)
   limit_electron_dens_arr_163205[i] = limit_electron_dens_163205[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_163205"

;PRINT, limit_electron_dens_arr_163205 

PRINT, "ZEROS"

limit_zeros_163205 = WHERE((limit_electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_163205) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_163205]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_163205 = DBLARR(limit_70_80_TII_163205_s)

FOR i = 0, limit_70_80_TII_163205_s-1 DO BEGIN
   limit_70_80_difference_arr_163205 = ABS(si_o_ratio-limit_70_80_ratio_163205[i])
   limit_70_80_electron_dens_163205 = WHERE(limit_70_80_difference_arr_163205 EQ MIN(limit_70_80_difference_arr_163205), /NULL)
   limit_70_80_electron_dens_arr_163205[i] = limit_70_80_electron_dens_163205[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_163205 = WHERE((limit_70_80_electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_163205) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_163205 = DBLARR(limit_60_70_TII_163205_s)

FOR i = 0, limit_60_70_TII_163205_s-1 DO BEGIN
   limit_60_70_difference_arr_163205 = ABS(si_o_ratio-limit_60_70_ratio_163205[i])
   limit_60_70_electron_dens_163205 = WHERE(limit_60_70_difference_arr_163205 EQ MIN(limit_60_70_difference_arr_163205), /NULL)
   limit_60_70_electron_dens_arr_163205[i] = limit_60_70_electron_dens_163205[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_163205 = WHERE((limit_60_70_electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_163205) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_163205 = DBLARR(limit_50_60_TII_163205_s)

FOR i = 0, limit_50_60_TII_163205_s-1 DO BEGIN
   limit_50_60_difference_arr_163205 = ABS(si_o_ratio-limit_50_60_ratio_163205[i])
   limit_50_60_electron_dens_163205 = WHERE(limit_50_60_difference_arr_163205 EQ MIN(limit_50_60_difference_arr_163205), /NULL)
   limit_50_60_electron_dens_arr_163205[i] = limit_50_60_electron_dens_163205[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_163205 = WHERE((limit_50_60_electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_163205) ;5

;40-50 km/s velocity
limit_40_50_electron_dens_arr_163205 = DBLARR(limit_40_50_TII_163205_s)

FOR i = 0, limit_40_50_TII_163205_s-1 DO BEGIN
   limit_40_50_difference_arr_163205 = ABS(si_o_ratio-limit_40_50_ratio_163205[i])
   limit_40_50_electron_dens_163205 = WHERE(limit_40_50_difference_arr_163205 EQ MIN(limit_40_50_difference_arr_163205), /NULL)
   limit_40_50_electron_dens_arr_163205[i] = limit_40_50_electron_dens_163205[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_163205 = WHERE((limit_40_50_electron_dens_arr_163205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_163205) ;5

;-------------------------------------------------------------------------------

PRINT, "163205"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_163205) ;0

limit_ten_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_163205) ;0

limit_elev_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_163205) ;0

limit_twel_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_163205) ;1

limit_thirt_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_163205) ;0

limit_four_163205 = WHERE((e_density[limit_electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_163205) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_163205) ;0

limit_70_80_ten_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_163205) ;0

limit_70_80_elev_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_163205) ;0

limit_70_80_twel_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_163205) ;1

limit_70_80_thirt_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_163205) ;0

limit_70_80_four_163205 = WHERE((e_density[limit_70_80_electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_163205) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_163205) ;0

limit_60_70_ten_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_163205) ;0

limit_60_70_elev_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_163205) ;1

limit_60_70_twel_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_163205) ;0

limit_60_70_thirt_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_163205) ;0

limit_60_70_four_163205 = WHERE((e_density[limit_60_70_electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_163205) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_163205) ;5

limit_50_60_ten_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_163205) ;2

limit_50_60_elev_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_163205) ;5

limit_50_60_twel_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_163205) ;0

limit_50_60_thirt_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_163205) ;0

limit_50_60_four_163205 = WHERE((e_density[limit_50_60_electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_163205) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_163205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_163205) ;5

limit_40_50_ten_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_163205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_163205) ;0

limit_40_50_elev_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_163205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_163205) ;0

limit_40_50_twel_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_163205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_163205) ;0

limit_40_50_thirt_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_163205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_163205) ;0

limit_40_50_four_163205 = WHERE((e_density[limit_40_50_electron_dens_arr_163205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_163205) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_163205 = FLOAT((N_ELEMENTS(limit_nin_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_nin_163205 ;0

limit_stat_ten_163205 = FLOAT((N_ELEMENTS(limit_ten_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_ten_163205 ;0

limit_stat_elev_163205 = FLOAT((N_ELEMENTS(limit_elev_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_elev_163205 ;0

limit_stat_twel_163205 = FLOAT((N_ELEMENTS(limit_twel_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_twel_163205 ;100.0000

limit_stat_thirt_163205 = FLOAT((N_ELEMENTS(limit_thirt_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_thirt_163205 ;0

limit_stat_four_163205 = FLOAT((N_ELEMENTS(limit_four_163205))/FLOAT(N_ELEMENTS(limit_num9_three)))*100
PRINT, limit_stat_four_163205 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_163205 = FLOAT((N_ELEMENTS(limit_70_80_nin_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_nin_163205 ;0

limit_70_80_stat_ten_163205 = FLOAT((N_ELEMENTS(limit_70_80_ten_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_ten_163205 ;0

limit_70_80_stat_elev_163205 = FLOAT((N_ELEMENTS(limit_70_80_elev_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_elev_163205 ;0

limit_70_80_stat_twel_163205 = FLOAT((N_ELEMENTS(limit_70_80_twel_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_twel_163205 ;100.000

limit_70_80_stat_thirt_163205 = FLOAT((N_ELEMENTS(limit_70_80_thirt_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_thirt_163205 ;0

limit_70_80_stat_four_163205 = FLOAT((N_ELEMENTS(limit_70_80_four_163205))/FLOAT(N_ELEMENTS(limit_70_80_num9_three)))*100
PRINT, limit_70_80_stat_four_163205 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_163205 = FLOAT((N_ELEMENTS(limit_60_70_nin_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_nin_163205 ;0

limit_60_70_stat_ten_163205 = FLOAT((N_ELEMENTS(limit_60_70_ten_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_ten_163205 ;0

limit_60_70_stat_elev_163205 = FLOAT((N_ELEMENTS(limit_60_70_elev_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_elev_163205 ;100.000

limit_60_70_stat_twel_163205 = FLOAT((N_ELEMENTS(limit_60_70_twel_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_twel_163205 ;0

limit_60_70_stat_thirt_163205 = FLOAT((N_ELEMENTS(limit_60_70_thirt_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_thirt_163205 ;0

limit_60_70_stat_four_163205 = FLOAT((N_ELEMENTS(limit_60_70_four_163205))/FLOAT(N_ELEMENTS(limit_60_70_num9_three)))*100
PRINT, limit_60_70_stat_four_163205 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_163205 = FLOAT((N_ELEMENTS(limit_50_60_nin_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_nin_163205 ;41.6667

limit_50_60_stat_ten_163205 = FLOAT((N_ELEMENTS(limit_50_60_ten_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_ten_163205 ;16.6667

limit_50_60_stat_elev_163205 = FLOAT((N_ELEMENTS(limit_50_60_elev_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_elev_163205 ;41.6667

limit_50_60_stat_twel_163205 = FLOAT((N_ELEMENTS(limit_50_60_twel_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_twel_163205 ;0

limit_50_60_stat_thirt_163205 = FLOAT((N_ELEMENTS(limit_50_60_thirt_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_thirt_163205 ;0

limit_50_60_stat_four_163205 = FLOAT((N_ELEMENTS(limit_50_60_four_163205))/FLOAT(N_ELEMENTS(limit_50_60_num9_three)))*100
PRINT, limit_50_60_stat_four_163205 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_163205 = FLOAT((N_ELEMENTS(limit_40_50_nin_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_nin_163205 ;100.000

limit_40_50_stat_ten_163205 = FLOAT((N_ELEMENTS(limit_40_50_ten_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_ten_163205 ;0

limit_40_50_stat_elev_163205 = FLOAT((N_ELEMENTS(limit_40_50_elev_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_elev_163205 ;0

limit_40_50_stat_twel_163205 = FLOAT((N_ELEMENTS(limit_40_50_twel_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_twel_163205 ;0

limit_40_50_stat_thirt_163205 = FLOAT((N_ELEMENTS(limit_40_50_thirt_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_thirt_163205 ;0

limit_40_50_stat_four_163205 = FLOAT((N_ELEMENTS(limit_40_50_four_163205))/FLOAT(N_ELEMENTS(limit_40_50_num9_three)))*100
PRINT, limit_40_50_stat_four_163205 ;0

limit_e_dens_163205 = e_density[limit_electron_dens_arr_163205]
limit_70_80_e_dens_163205 = e_density[limit_70_80_electron_dens_arr_163205]
limit_60_70_e_dens_163205 = e_density[limit_60_70_electron_dens_arr_163205]
limit_50_60_e_dens_163205 = e_density[limit_50_60_electron_dens_arr_163205]
limit_40_50_e_dens_163205 = e_density[limit_40_50_electron_dens_arr_163205]

;===============================================================================

PRINT, '174905'

;80-1000 km/s velocity
limit_electron_dens_arr_174905 = DBLARR(limit_TII_174905_s)

FOR i = 0, limit_TII_174905_s-1 DO BEGIN
   limit_difference_arr_174905 = ABS(si_o_ratio-limit_ratio_174905[i])
   limit_electron_dens_174905 = WHERE(limit_difference_arr_174905 EQ MIN(limit_difference_arr_174905), /NULL)
   limit_electron_dens_arr_174905[i] = limit_electron_dens_174905[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_174905"

;PRINT, limit_electron_dens_arr_174905 

PRINT, "ZEROS"

limit_zeros_174905 = WHERE((limit_electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_174905) ;2

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_174905]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_174905 = DBLARR(limit_70_80_TII_174905_s)

FOR i = 0, limit_70_80_TII_174905_s-1 DO BEGIN
   limit_70_80_difference_arr_174905 = ABS(si_o_ratio-limit_70_80_ratio_174905[i])
   limit_70_80_electron_dens_174905 = WHERE(limit_70_80_difference_arr_174905 EQ MIN(limit_70_80_difference_arr_174905), /NULL)
   limit_70_80_electron_dens_arr_174905[i] = limit_70_80_electron_dens_174905[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_174905 = WHERE((limit_70_80_electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_174905) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_174905 = DBLARR(limit_60_70_TII_174905_s)

FOR i = 0, limit_60_70_TII_174905_s-1 DO BEGIN
   limit_60_70_difference_arr_174905 = ABS(si_o_ratio-limit_60_70_ratio_174905[i])
   limit_60_70_electron_dens_174905 = WHERE(limit_60_70_difference_arr_174905 EQ MIN(limit_60_70_difference_arr_174905), /NULL)
   limit_60_70_electron_dens_arr_174905[i] = limit_60_70_electron_dens_174905[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_174905 = WHERE((limit_60_70_electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_174905) ;1

;50-60 km/s velocity
limit_50_60_electron_dens_arr_174905 = DBLARR(limit_50_60_TII_174905_s)

FOR i = 0, limit_50_60_TII_174905_s-1 DO BEGIN
   limit_50_60_difference_arr_174905 = ABS(si_o_ratio-limit_50_60_ratio_174905[i])
   limit_50_60_electron_dens_174905 = WHERE(limit_50_60_difference_arr_174905 EQ MIN(limit_50_60_difference_arr_174905), /NULL)
   limit_50_60_electron_dens_arr_174905[i] = limit_50_60_electron_dens_174905[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_174905 = WHERE((limit_50_60_electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_174905) ;9

;40-50 km/s velocity
limit_40_50_electron_dens_arr_174905 = DBLARR(limit_40_50_TII_174905_s)

FOR i = 0, limit_40_50_TII_174905_s-1 DO BEGIN
   limit_40_50_difference_arr_174905 = ABS(si_o_ratio-limit_40_50_ratio_174905[i])
   limit_40_50_electron_dens_174905 = WHERE(limit_40_50_difference_arr_174905 EQ MIN(limit_40_50_difference_arr_174905), /NULL)
   limit_40_50_electron_dens_arr_174905[i] = limit_40_50_electron_dens_174905[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_174905 = WHERE((limit_40_50_electron_dens_arr_174905 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_174905) ;0

;-------------------------------------------------------------------------------

PRINT, "174905"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_174905) ;2

limit_ten_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_174905) ;2

limit_elev_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_174905) ;0

limit_twel_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_174905) ;0

limit_thirt_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_174905) ;0

limit_four_174905 = WHERE((e_density[limit_electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_174905) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_174905) ;0

limit_70_80_ten_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_174905) ;0

limit_70_80_elev_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_174905) ;1

limit_70_80_twel_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_174905) ;0

limit_70_80_thirt_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_174905) ;0

limit_70_80_four_174905 = WHERE((e_density[limit_70_80_electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_174905) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_174905) ;1

limit_60_70_ten_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_174905) ;3

limit_60_70_elev_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_174905) ;3

limit_60_70_twel_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_174905) ;0

limit_60_70_thirt_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_174905) ;0

limit_60_70_four_174905 = WHERE((e_density[limit_60_70_electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_174905) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_174905) ;9

limit_50_60_ten_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_174905) ;0

limit_50_60_elev_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_174905) ;5

limit_50_60_twel_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_174905) ;7

limit_50_60_thirt_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_174905) ;0

limit_50_60_four_174905 = WHERE((e_density[limit_50_60_electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_174905) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_174905] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_174905) ;0

limit_40_50_ten_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_174905] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_174905) ;16

limit_40_50_elev_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_174905] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_174905) ;40

limit_40_50_twel_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_174905] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_174905) ;0

limit_40_50_thirt_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_174905] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_174905) ;0

limit_40_50_four_174905 = WHERE((e_density[limit_40_50_electron_dens_arr_174905] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_174905) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_174905 = FLOAT((N_ELEMENTS(limit_nin_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_nin_174905 ;50.0000

limit_stat_ten_174905 = FLOAT((N_ELEMENTS(limit_ten_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_ten_174905 ;50.0000

limit_stat_elev_174905 = FLOAT((N_ELEMENTS(limit_elev_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_elev_174905 ;0

limit_stat_twel_174905 = FLOAT((N_ELEMENTS(limit_twel_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_twel_174905 ;0

limit_stat_thirt_174905 = FLOAT((N_ELEMENTS(limit_thirt_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_thirt_174905 ;0

limit_stat_four_174905 = FLOAT((N_ELEMENTS(limit_four_174905))/FLOAT(N_ELEMENTS(limit_num10_three)))*100
PRINT, limit_stat_four_174905 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_174905 = FLOAT((N_ELEMENTS(limit_70_80_nin_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_nin_174905 ;0

limit_70_80_stat_ten_174905 = FLOAT((N_ELEMENTS(limit_70_80_ten_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_ten_174905 ;0

limit_70_80_stat_elev_174905 = FLOAT((N_ELEMENTS(limit_70_80_elev_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_elev_174905 ;100.000

limit_70_80_stat_twel_174905 = FLOAT((N_ELEMENTS(limit_70_80_twel_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_twel_174905 ;0

limit_70_80_stat_thirt_174905 = FLOAT((N_ELEMENTS(limit_70_80_thirt_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_thirt_174905 ;0

limit_70_80_stat_four_174905 = FLOAT((N_ELEMENTS(limit_70_80_four_174905))/FLOAT(N_ELEMENTS(limit_70_80_num10_three)))*100
PRINT, limit_70_80_stat_four_174905 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_174905 = FLOAT((N_ELEMENTS(limit_60_70_nin_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_nin_174905 ;14.2857

limit_60_70_stat_ten_174905 = FLOAT((N_ELEMENTS(limit_60_70_ten_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_ten_174905 ;42.8571

limit_60_70_stat_elev_174905 = FLOAT((N_ELEMENTS(limit_60_70_elev_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_elev_174905 ;42.8571

limit_60_70_stat_twel_174905 = FLOAT((N_ELEMENTS(limit_60_70_twel_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_twel_174905 ;0

limit_60_70_stat_thirt_174905 = FLOAT((N_ELEMENTS(limit_60_70_thirt_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_thirt_174905 ;0

limit_60_70_stat_four_174905 = FLOAT((N_ELEMENTS(limit_60_70_four_174905))/FLOAT(N_ELEMENTS(limit_60_70_num10_three)))*100
PRINT, limit_60_70_stat_four_174905 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_174905 = FLOAT((N_ELEMENTS(limit_50_60_nin_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_nin_174905 ;42.8571

limit_50_60_stat_ten_174905 = FLOAT((N_ELEMENTS(limit_50_60_ten_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_ten_174905 ;0

limit_50_60_stat_elev_174905 = FLOAT((N_ELEMENTS(limit_50_60_elev_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_elev_174905 ;23.8095

limit_50_60_stat_twel_174905 = FLOAT((N_ELEMENTS(limit_50_60_twel_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_twel_174905 ;33.3333

limit_50_60_stat_thirt_174905 = FLOAT((N_ELEMENTS(limit_50_60_thirt_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_thirt_174905 ;0

limit_50_60_stat_four_174905 = FLOAT((N_ELEMENTS(limit_50_60_four_174905))/FLOAT(N_ELEMENTS(limit_50_60_num10_three)))*100
PRINT, limit_50_60_stat_four_174905 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_174905 = FLOAT((N_ELEMENTS(limit_40_50_nin_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_nin_174905 ;0

limit_40_50_stat_ten_174905 = FLOAT((N_ELEMENTS(limit_40_50_ten_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_ten_174905 ;28.5714

limit_40_50_stat_elev_174905 = FLOAT((N_ELEMENTS(limit_40_50_elev_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_elev_174905 ;71.4286

limit_40_50_stat_twel_174905 = FLOAT((N_ELEMENTS(limit_40_50_twel_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_twel_174905 ;0

limit_40_50_stat_thirt_174905 = FLOAT((N_ELEMENTS(limit_40_50_thirt_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_thirt_174905 ;0

limit_40_50_stat_four_174905 = FLOAT((N_ELEMENTS(limit_40_50_four_174905))/FLOAT(N_ELEMENTS(limit_40_50_num10_three)))*100
PRINT, limit_40_50_stat_four_174905 ;0

limit_e_dens_174905 = e_density[limit_electron_dens_arr_174905]
limit_70_80_e_dens_174905 = e_density[limit_70_80_electron_dens_arr_174905]
limit_60_70_e_dens_174905 = e_density[limit_60_70_electron_dens_arr_174905]
limit_50_60_e_dens_174905 = e_density[limit_50_60_electron_dens_arr_174905]
limit_40_50_e_dens_174905 = e_density[limit_40_50_electron_dens_arr_174905]

;===============================================================================

PRINT, '181205'

;80-1000 km/s velocity
limit_electron_dens_arr_181205 = DBLARR(limit_TII_181205_s)

FOR i = 0, limit_TII_181205_s-1 DO BEGIN
   limit_difference_arr_181205 = ABS(si_o_ratio-limit_ratio_181205[i])
   limit_electron_dens_181205 = WHERE(limit_difference_arr_181205 EQ MIN(limit_difference_arr_181205), /NULL)
   limit_electron_dens_arr_181205[i] = limit_electron_dens_181205[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_181205"

;PRINT, limit_electron_dens_arr_181205 

PRINT, "ZEROS"

limit_zeros_181205 = WHERE((limit_electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_181205) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_181205]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_181205 = DBLARR(limit_70_80_TII_181205_s)

FOR i = 0, limit_70_80_TII_181205_s-1 DO BEGIN
   limit_70_80_difference_arr_181205 = ABS(si_o_ratio-limit_70_80_ratio_181205[i])
   limit_70_80_electron_dens_181205 = WHERE(limit_70_80_difference_arr_181205 EQ MIN(limit_70_80_difference_arr_181205), /NULL)
   limit_70_80_electron_dens_arr_181205[i] = limit_70_80_electron_dens_181205[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_181205 = WHERE((limit_70_80_electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_181205) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_181205 = DBLARR(limit_60_70_TII_181205_s)

FOR i = 0, limit_60_70_TII_181205_s-1 DO BEGIN
   limit_60_70_difference_arr_181205 = ABS(si_o_ratio-limit_60_70_ratio_181205[i])
   limit_60_70_electron_dens_181205 = WHERE(limit_60_70_difference_arr_181205 EQ MIN(limit_60_70_difference_arr_181205), /NULL)
   limit_60_70_electron_dens_arr_181205[i] = limit_60_70_electron_dens_181205[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_181205 = WHERE((limit_60_70_electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_181205) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_181205 = DBLARR(limit_50_60_TII_181205_s)

FOR i = 0, limit_50_60_TII_181205_s-1 DO BEGIN
   limit_50_60_difference_arr_181205 = ABS(si_o_ratio-limit_50_60_ratio_181205[i])
   limit_50_60_electron_dens_181205 = WHERE(limit_50_60_difference_arr_181205 EQ MIN(limit_50_60_difference_arr_181205), /NULL)
   limit_50_60_electron_dens_arr_181205[i] = limit_50_60_electron_dens_181205[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_181205 = WHERE((limit_50_60_electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_181205) ;0

;40-50 km/s velocity
limit_40_50_electron_dens_arr_181205 = DBLARR(limit_40_50_TII_181205_s)

FOR i = 0, limit_40_50_TII_181205_s-1 DO BEGIN
   limit_40_50_difference_arr_181205 = ABS(si_o_ratio-limit_40_50_ratio_181205[i])
   limit_40_50_electron_dens_181205 = WHERE(limit_40_50_difference_arr_181205 EQ MIN(limit_40_50_difference_arr_181205), /NULL)
   limit_40_50_electron_dens_arr_181205[i] = limit_40_50_electron_dens_181205[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_181205 = WHERE((limit_40_50_electron_dens_arr_181205 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_181205) ;1

;-------------------------------------------------------------------------------

PRINT, "181205"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_181205) ;0

limit_ten_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_181205) ;0

limit_elev_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_181205) ;0

limit_twel_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_181205) ;0

limit_thirt_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_181205) ;1

limit_four_181205 = WHERE((e_density[limit_electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_181205) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_181205) ;0

limit_70_80_ten_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_181205) ;0

limit_70_80_elev_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_181205) ;0

limit_70_80_twel_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_181205) ;0

limit_70_80_thirt_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_181205) ;1

limit_70_80_four_181205 = WHERE((e_density[limit_70_80_electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_181205) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_181205) ;0

limit_60_70_ten_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_181205) ;0

limit_60_70_elev_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_181205) ;0

limit_60_70_twel_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_181205) ;0

limit_60_70_thirt_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_181205) ;1

limit_60_70_four_181205 = WHERE((e_density[limit_60_70_electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_181205) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_181205) ;0

limit_50_60_ten_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_181205) ;1

limit_50_60_elev_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_181205) ;1

limit_50_60_twel_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_181205) ;0

limit_50_60_thirt_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_181205) ;0

limit_50_60_four_181205 = WHERE((e_density[limit_50_60_electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_181205) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_181205] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_181205) ;1

limit_40_50_ten_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_181205] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_181205) ;0

limit_40_50_elev_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_181205] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_181205) ;3

limit_40_50_twel_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_181205] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_181205) ;9

limit_40_50_thirt_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_181205] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_181205) ;0

limit_40_50_four_181205 = WHERE((e_density[limit_40_50_electron_dens_arr_181205] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_181205) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_181205 = FLOAT((N_ELEMENTS(limit_nin_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_nin_181205 ;0

limit_stat_ten_181205 = FLOAT((N_ELEMENTS(limit_ten_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_ten_181205 ;0

limit_stat_elev_181205 = FLOAT((N_ELEMENTS(limit_elev_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_elev_181205 ;0

limit_stat_twel_181205 = FLOAT((N_ELEMENTS(limit_twel_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_twel_181205 ;0

limit_stat_thirt_181205 = FLOAT((N_ELEMENTS(limit_thirt_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_thirt_181205 ;100.0000

limit_stat_four_181205 = FLOAT((N_ELEMENTS(limit_four_181205))/FLOAT(N_ELEMENTS(limit_num11_three)))*100
PRINT, limit_stat_four_181205 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_181205 = FLOAT((N_ELEMENTS(limit_70_80_nin_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_nin_181205 ;0

limit_70_80_stat_ten_181205 = FLOAT((N_ELEMENTS(limit_70_80_ten_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_ten_181205 ;0

limit_70_80_stat_elev_181205 = FLOAT((N_ELEMENTS(limit_70_80_elev_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_elev_181205 ;0

limit_70_80_stat_twel_181205 = FLOAT((N_ELEMENTS(limit_70_80_twel_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_twel_181205 ;0

limit_70_80_stat_thirt_181205 = FLOAT((N_ELEMENTS(limit_70_80_thirt_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_thirt_181205 ;100.000

limit_70_80_stat_four_181205 = FLOAT((N_ELEMENTS(limit_70_80_four_181205))/FLOAT(N_ELEMENTS(limit_70_80_num11_three)))*100
PRINT, limit_70_80_stat_four_181205 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_181205 = FLOAT((N_ELEMENTS(limit_60_70_nin_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_nin_181205 ;0

limit_60_70_stat_ten_181205 = FLOAT((N_ELEMENTS(limit_60_70_ten_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_ten_181205 ;0

limit_60_70_stat_elev_181205 = FLOAT((N_ELEMENTS(limit_60_70_elev_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_elev_181205 ;0

limit_60_70_stat_twel_181205 = FLOAT((N_ELEMENTS(limit_60_70_twel_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_twel_181205 ;0

limit_60_70_stat_thirt_181205 = FLOAT((N_ELEMENTS(limit_60_70_thirt_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_thirt_181205 ;100.000

limit_60_70_stat_four_181205 = FLOAT((N_ELEMENTS(limit_60_70_four_181205))/FLOAT(N_ELEMENTS(limit_60_70_num11_three)))*100
PRINT, limit_60_70_stat_four_181205 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_181205 = FLOAT((N_ELEMENTS(limit_50_60_nin_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_nin_181205 ;0

limit_50_60_stat_ten_181205 = FLOAT((N_ELEMENTS(limit_50_60_ten_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_ten_181205 ;50.0000

limit_50_60_stat_elev_181205 = FLOAT((N_ELEMENTS(limit_50_60_elev_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_elev_181205 ;50.0000

limit_50_60_stat_twel_181205 = FLOAT((N_ELEMENTS(limit_50_60_twel_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_twel_181205 ;0

limit_50_60_stat_thirt_181205 = FLOAT((N_ELEMENTS(limit_50_60_thirt_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_thirt_181205 ;0

limit_50_60_stat_four_181205 = FLOAT((N_ELEMENTS(limit_50_60_four_181205))/FLOAT(N_ELEMENTS(limit_50_60_num11_three)))*100
PRINT, limit_50_60_stat_four_181205 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_181205 = FLOAT((N_ELEMENTS(limit_40_50_nin_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_nin_181205 ;7.69231

limit_40_50_stat_ten_181205 = FLOAT((N_ELEMENTS(limit_40_50_ten_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_ten_181205 ;0

limit_40_50_stat_elev_181205 = FLOAT((N_ELEMENTS(limit_40_50_elev_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_elev_181205 ;23.0769

limit_40_50_stat_twel_181205 = FLOAT((N_ELEMENTS(limit_40_50_twel_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_twel_181205 ;69.2308

limit_40_50_stat_thirt_181205 = FLOAT((N_ELEMENTS(limit_40_50_thirt_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_thirt_181205 ;0

limit_40_50_stat_four_181205 = FLOAT((N_ELEMENTS(limit_40_50_four_181205))/FLOAT(N_ELEMENTS(limit_40_50_num11_three)))*100
PRINT, limit_40_50_stat_four_181205 ;0

limit_e_dens_181205 = e_density[limit_electron_dens_arr_181205]
limit_70_80_e_dens_181205 = e_density[limit_70_80_electron_dens_arr_181205]
limit_60_70_e_dens_181205 = e_density[limit_60_70_electron_dens_arr_181205]
limit_50_60_e_dens_181205 = e_density[limit_50_60_electron_dens_arr_181205]
limit_40_50_e_dens_181205 = e_density[limit_40_50_electron_dens_arr_181205]

;===============================================================================

PRINT, '201925'

;80-1000 km/s velocity
limit_electron_dens_arr_201925 = DBLARR(limit_TII_201925_s)

FOR i = 0, limit_TII_201925_s-1 DO BEGIN
   limit_difference_arr_201925 = ABS(si_o_ratio-limit_ratio_201925[i])
   limit_electron_dens_201925 = WHERE(limit_difference_arr_201925 EQ MIN(limit_difference_arr_201925), /NULL)
   limit_electron_dens_arr_201925[i] = limit_electron_dens_201925[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_201925"

;PRINT, limit_electron_dens_arr_201925 

PRINT, "ZEROS"

limit_zeros_201925 = WHERE((limit_electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_201925) ;1

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_201925]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_201925 = DBLARR(limit_70_80_TII_201925_s)

FOR i = 0, limit_70_80_TII_201925_s-1 DO BEGIN
   limit_70_80_difference_arr_201925 = ABS(si_o_ratio-limit_70_80_ratio_201925[i])
   limit_70_80_electron_dens_201925 = WHERE(limit_70_80_difference_arr_201925 EQ MIN(limit_70_80_difference_arr_201925), /NULL)
   limit_70_80_electron_dens_arr_201925[i] = limit_70_80_electron_dens_201925[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_201925 = WHERE((limit_70_80_electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_201925) ;1

;60-70 km/s velocity
limit_60_70_electron_dens_arr_201925 = DBLARR(limit_60_70_TII_201925_s)

FOR i = 0, limit_60_70_TII_201925_s-1 DO BEGIN
   limit_60_70_difference_arr_201925 = ABS(si_o_ratio-limit_60_70_ratio_201925[i])
   limit_60_70_electron_dens_201925 = WHERE(limit_60_70_difference_arr_201925 EQ MIN(limit_60_70_difference_arr_201925), /NULL)
   limit_60_70_electron_dens_arr_201925[i] = limit_60_70_electron_dens_201925[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_201925 = WHERE((limit_60_70_electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_201925) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_201925 = DBLARR(limit_50_60_TII_201925_s)

FOR i = 0, limit_50_60_TII_201925_s-1 DO BEGIN
   limit_50_60_difference_arr_201925 = ABS(si_o_ratio-limit_50_60_ratio_201925[i])
   limit_50_60_electron_dens_201925 = WHERE(limit_50_60_difference_arr_201925 EQ MIN(limit_50_60_difference_arr_201925), /NULL)
   limit_50_60_electron_dens_arr_201925[i] = limit_50_60_electron_dens_201925[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_201925 = WHERE((limit_50_60_electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_201925) ;1

;40-50 km/s velocity
limit_40_50_electron_dens_arr_201925 = DBLARR(limit_40_50_TII_201925_s)

FOR i = 0, limit_40_50_TII_201925_s-1 DO BEGIN
   limit_40_50_difference_arr_201925 = ABS(si_o_ratio-limit_40_50_ratio_201925[i])
   limit_40_50_electron_dens_201925 = WHERE(limit_40_50_difference_arr_201925 EQ MIN(limit_40_50_difference_arr_201925), /NULL)
   limit_40_50_electron_dens_arr_201925[i] = limit_40_50_electron_dens_201925[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_201925 = WHERE((limit_40_50_electron_dens_arr_201925 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_201925) ;7

;-------------------------------------------------------------------------------

PRINT, "201925"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_201925) ;1

limit_ten_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_201925) ;0

limit_elev_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_201925) ;0

limit_twel_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_201925) ;0

limit_thirt_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_201925) ;0

limit_four_201925 = WHERE((e_density[limit_electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_201925) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_201925) ;1

limit_70_80_ten_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_201925) ;0

limit_70_80_elev_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_201925) ;0

limit_70_80_twel_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_201925) ;0

limit_70_80_thirt_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_201925) ;0

limit_70_80_four_201925 = WHERE((e_density[limit_70_80_electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_201925) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_201925) ;0

limit_60_70_ten_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_201925) ;1

limit_60_70_elev_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_201925) ;0

limit_60_70_twel_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_201925) ;0

limit_60_70_thirt_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_201925) ;0

limit_60_70_four_201925 = WHERE((e_density[limit_60_70_electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_201925) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_201925) ;1

limit_50_60_ten_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_201925) ;1

limit_50_60_elev_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_201925) ;0

limit_50_60_twel_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_201925) ;0

limit_50_60_thirt_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_201925) ;0

limit_50_60_four_201925 = WHERE((e_density[limit_50_60_electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_201925) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_201925] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_201925) ;7

limit_40_50_ten_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_201925] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_201925) ;0

limit_40_50_elev_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_201925] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_201925) ;0

limit_40_50_twel_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_201925] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_201925) ;0

limit_40_50_thirt_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_201925] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_201925) ;0

limit_40_50_four_201925 = WHERE((e_density[limit_40_50_electron_dens_arr_201925] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_201925) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_201925 = FLOAT((N_ELEMENTS(limit_nin_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_nin_201925 ;100.000

limit_stat_ten_201925 = FLOAT((N_ELEMENTS(limit_ten_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_ten_201925 ;0

limit_stat_elev_201925 = FLOAT((N_ELEMENTS(limit_elev_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_elev_201925 ;0

limit_stat_twel_201925 = FLOAT((N_ELEMENTS(limit_twel_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_twel_201925 ;0

limit_stat_thirt_201925 = FLOAT((N_ELEMENTS(limit_thirt_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_thirt_201925 ;0

limit_stat_four_201925 = FLOAT((N_ELEMENTS(limit_four_201925))/FLOAT(N_ELEMENTS(limit_num12_three)))*100
PRINT, limit_stat_four_201925 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_201925 = FLOAT((N_ELEMENTS(limit_70_80_nin_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_nin_201925 ;100.000

limit_70_80_stat_ten_201925 = FLOAT((N_ELEMENTS(limit_70_80_ten_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_ten_201925 ;0

limit_70_80_stat_elev_201925 = FLOAT((N_ELEMENTS(limit_70_80_elev_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_elev_201925 ;0

limit_70_80_stat_twel_201925 = FLOAT((N_ELEMENTS(limit_70_80_twel_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_twel_201925 ;0

limit_70_80_stat_thirt_201925 = FLOAT((N_ELEMENTS(limit_70_80_thirt_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_thirt_201925 ;0

limit_70_80_stat_four_201925 = FLOAT((N_ELEMENTS(limit_70_80_four_201925))/FLOAT(N_ELEMENTS(limit_70_80_num12_three)))*100
PRINT, limit_70_80_stat_four_201925 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_201925 = FLOAT((N_ELEMENTS(limit_60_70_nin_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_nin_201925 ;0

limit_60_70_stat_ten_201925 = FLOAT((N_ELEMENTS(limit_60_70_ten_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_ten_201925 ;100.000

limit_60_70_stat_elev_201925 = FLOAT((N_ELEMENTS(limit_60_70_elev_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_elev_201925 ;0

limit_60_70_stat_twel_201925 = FLOAT((N_ELEMENTS(limit_60_70_twel_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_twel_201925 ;0

limit_60_70_stat_thirt_201925 = FLOAT((N_ELEMENTS(limit_60_70_thirt_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_thirt_201925 ;0

limit_60_70_stat_four_201925 = FLOAT((N_ELEMENTS(limit_60_70_four_201925))/FLOAT(N_ELEMENTS(limit_60_70_num12_three)))*100
PRINT, limit_60_70_stat_four_201925 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_201925 = FLOAT((N_ELEMENTS(limit_50_60_nin_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_nin_201925 ;50.0000

limit_50_60_stat_ten_201925 = FLOAT((N_ELEMENTS(limit_50_60_ten_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_ten_201925 ;50.0000

limit_50_60_stat_elev_201925 = FLOAT((N_ELEMENTS(limit_50_60_elev_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_elev_201925 ;0

limit_50_60_stat_twel_201925 = FLOAT((N_ELEMENTS(limit_50_60_twel_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_twel_201925 ;0

limit_50_60_stat_thirt_201925 = FLOAT((N_ELEMENTS(limit_50_60_thirt_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_thirt_201925 ;0

limit_50_60_stat_four_201925 = FLOAT((N_ELEMENTS(limit_50_60_four_201925))/FLOAT(N_ELEMENTS(limit_50_60_num12_three)))*100
PRINT, limit_50_60_stat_four_201925 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_201925 = FLOAT((N_ELEMENTS(limit_40_50_nin_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_nin_201925 ;100.000

limit_40_50_stat_ten_201925 = FLOAT((N_ELEMENTS(limit_40_50_ten_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_ten_201925 ;0

limit_40_50_stat_elev_201925 = FLOAT((N_ELEMENTS(limit_40_50_elev_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_elev_201925 ;0

limit_40_50_stat_twel_201925 = FLOAT((N_ELEMENTS(limit_40_50_twel_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_twel_201925 ;0

limit_40_50_stat_thirt_201925 = FLOAT((N_ELEMENTS(limit_40_50_thirt_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_thirt_201925 ;0

limit_40_50_stat_four_201925 = FLOAT((N_ELEMENTS(limit_40_50_four_201925))/FLOAT(N_ELEMENTS(limit_40_50_num12_three)))*100
PRINT, limit_40_50_stat_four_201925 ;0

limit_e_dens_201925 = e_density[limit_electron_dens_arr_201925]
limit_70_80_e_dens_201925 = e_density[limit_70_80_electron_dens_arr_201925]
limit_60_70_e_dens_201925 = e_density[limit_60_70_electron_dens_arr_201925]
limit_50_60_e_dens_201925 = e_density[limit_50_60_electron_dens_arr_201925]
limit_40_50_e_dens_201925 = e_density[limit_40_50_electron_dens_arr_201925]

;===============================================================================

PRINT, '201925_1'

;80-1000 km/s velocity
limit_electron_dens_arr_201925_1 = DBLARR(limit_TII_201925_1_s)

FOR i = 0, limit_TII_201925_1_s-1 DO BEGIN
   limit_difference_arr_201925_1 = ABS(si_o_ratio-limit_ratio_201925_1[i])
   limit_electron_dens_201925_1 = WHERE(limit_difference_arr_201925_1 EQ MIN(limit_difference_arr_201925_1), /NULL)
   limit_electron_dens_arr_201925_1[i] = limit_electron_dens_201925_1[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_201925_1"

;PRINT, limit_electron_dens_arr_201925_1 

PRINT, "ZEROS"

limit_zeros_201925_1 = WHERE((limit_electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_201925_1) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_201925_1]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_201925_1 = DBLARR(limit_70_80_TII_201925_1_s)

FOR i = 0, limit_70_80_TII_201925_1_s-1 DO BEGIN
   limit_70_80_difference_arr_201925_1 = ABS(si_o_ratio-limit_70_80_ratio_201925_1[i])
   limit_70_80_electron_dens_201925_1 = WHERE(limit_70_80_difference_arr_201925_1 EQ MIN(limit_70_80_difference_arr_201925_1), /NULL)
   limit_70_80_electron_dens_arr_201925_1[i] = limit_70_80_electron_dens_201925_1[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_201925_1 = WHERE((limit_70_80_electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_201925_1) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_201925_1 = DBLARR(limit_60_70_TII_201925_1_s)

FOR i = 0, limit_60_70_TII_201925_1_s-1 DO BEGIN
   limit_60_70_difference_arr_201925_1 = ABS(si_o_ratio-limit_60_70_ratio_201925_1[i])
   limit_60_70_electron_dens_201925_1 = WHERE(limit_60_70_difference_arr_201925_1 EQ MIN(limit_60_70_difference_arr_201925_1), /NULL)
   limit_60_70_electron_dens_arr_201925_1[i] = limit_60_70_electron_dens_201925_1[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_201925_1 = WHERE((limit_60_70_electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_201925_1) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_201925_1 = DBLARR(limit_50_60_TII_201925_1_s)

FOR i = 0, limit_50_60_TII_201925_1_s-1 DO BEGIN
   limit_50_60_difference_arr_201925_1 = ABS(si_o_ratio-limit_50_60_ratio_201925_1[i])
   limit_50_60_electron_dens_201925_1 = WHERE(limit_50_60_difference_arr_201925_1 EQ MIN(limit_50_60_difference_arr_201925_1), /NULL)
   limit_50_60_electron_dens_arr_201925_1[i] = limit_50_60_electron_dens_201925_1[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_201925_1 = WHERE((limit_50_60_electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_201925_1) ;0

;40-50 km/s velocity
limit_40_50_electron_dens_arr_201925_1 = DBLARR(limit_40_50_TII_201925_1_s)

FOR i = 0, limit_40_50_TII_201925_1_s-1 DO BEGIN
   limit_40_50_difference_arr_201925_1 = ABS(si_o_ratio-limit_40_50_ratio_201925_1[i])
   limit_40_50_electron_dens_201925_1 = WHERE(limit_40_50_difference_arr_201925_1 EQ MIN(limit_40_50_difference_arr_201925_1), /NULL)
   limit_40_50_electron_dens_arr_201925_1[i] = limit_40_50_electron_dens_201925_1[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_201925_1 = WHERE((limit_40_50_electron_dens_arr_201925_1 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_201925_1) ;3

;-------------------------------------------------------------------------------

PRINT, "201925_1"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_201925_1) ;0

limit_ten_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_201925_1) ;0

limit_elev_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_201925_1) ;0

limit_twel_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_201925_1) ;1

limit_thirt_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_201925_1) ;0

limit_four_201925_1 = WHERE((e_density[limit_electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_201925_1) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_201925_1) ;0

limit_70_80_ten_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_201925_1) ;0

limit_70_80_elev_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_201925_1) ;0

limit_70_80_twel_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_201925_1) ;1

limit_70_80_thirt_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_201925_1) ;0

limit_70_80_four_201925_1 = WHERE((e_density[limit_70_80_electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_201925_1) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_201925_1) ;0

limit_60_70_ten_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_201925_1) ;0

limit_60_70_elev_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_201925_1) ;0

limit_60_70_twel_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_201925_1) ;0

limit_60_70_thirt_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_201925_1) ;1

limit_60_70_four_201925_1 = WHERE((e_density[limit_60_70_electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_201925_1) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_201925_1) ;0

limit_50_60_ten_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_201925_1) ;1

limit_50_60_elev_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_201925_1) ;0

limit_50_60_twel_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_201925_1) ;0

limit_50_60_thirt_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_201925_1) ;0

limit_50_60_four_201925_1 = WHERE((e_density[limit_50_60_electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_201925_1) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_201925_1] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_201925_1) ;3

limit_40_50_ten_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_201925_1] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_201925_1) ;1

limit_40_50_elev_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_201925_1] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_201925_1) ;1

limit_40_50_twel_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_201925_1] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_201925_1) ;2

limit_40_50_thirt_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_201925_1] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_201925_1) ;0

limit_40_50_four_201925_1 = WHERE((e_density[limit_40_50_electron_dens_arr_201925_1] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_201925_1) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_201925_1 = FLOAT((N_ELEMENTS(limit_nin_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_nin_201925_1 ;0

limit_stat_ten_201925_1 = FLOAT((N_ELEMENTS(limit_ten_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_ten_201925_1 ;0

limit_stat_elev_201925_1 = FLOAT((N_ELEMENTS(limit_elev_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_elev_201925_1 ;0

limit_stat_twel_201925_1 = FLOAT((N_ELEMENTS(limit_twel_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_twel_201925_1 ;100.0000

limit_stat_thirt_201925_1 = FLOAT((N_ELEMENTS(limit_thirt_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_thirt_201925_1 ;0

limit_stat_four_201925_1 = FLOAT((N_ELEMENTS(limit_four_201925_1))/FLOAT(N_ELEMENTS(limit_num13_three)))*100
PRINT, limit_stat_four_201925_1 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_nin_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_nin_201925_1 ;0

limit_70_80_stat_ten_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_ten_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_ten_201925_1 ;0

limit_70_80_stat_elev_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_elev_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_elev_201925_1 ;0

limit_70_80_stat_twel_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_twel_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_twel_201925_1 ;100.000

limit_70_80_stat_thirt_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_thirt_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_thirt_201925_1 ;0

limit_70_80_stat_four_201925_1 = FLOAT((N_ELEMENTS(limit_70_80_four_201925_1))/FLOAT(N_ELEMENTS(limit_70_80_num13_three)))*100
PRINT, limit_70_80_stat_four_201925_1 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_nin_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_nin_201925_1 ;0

limit_60_70_stat_ten_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_ten_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_ten_201925_1 ;0

limit_60_70_stat_elev_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_elev_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_elev_201925_1 ;0

limit_60_70_stat_twel_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_twel_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_twel_201925_1 ;0

limit_60_70_stat_thirt_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_thirt_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_thirt_201925_1 ;100.000

limit_60_70_stat_four_201925_1 = FLOAT((N_ELEMENTS(limit_60_70_four_201925_1))/FLOAT(N_ELEMENTS(limit_60_70_num13_three)))*100
PRINT, limit_60_70_stat_four_201925_1 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_nin_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_nin_201925_1 ;0

limit_50_60_stat_ten_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_ten_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_ten_201925_1 ;100.000

limit_50_60_stat_elev_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_elev_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_elev_201925_1 ;0

limit_50_60_stat_twel_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_twel_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_twel_201925_1 ;0

limit_50_60_stat_thirt_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_thirt_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_thirt_201925_1 ;0

limit_50_60_stat_four_201925_1 = FLOAT((N_ELEMENTS(limit_50_60_four_201925_1))/FLOAT(N_ELEMENTS(limit_50_60_num13_three)))*100
PRINT, limit_50_60_stat_four_201925_1 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_nin_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_nin_201925_1 ;42.8571

limit_40_50_stat_ten_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_ten_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_ten_201925_1 ;14.2857

limit_40_50_stat_elev_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_elev_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_elev_201925_1 ;14.2857

limit_40_50_stat_twel_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_twel_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_twel_201925_1 ;28.5714

limit_40_50_stat_thirt_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_thirt_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_thirt_201925_1 ;0

limit_40_50_stat_four_201925_1 = FLOAT((N_ELEMENTS(limit_40_50_four_201925_1))/FLOAT(N_ELEMENTS(limit_40_50_num13_three)))*100
PRINT, limit_40_50_stat_four_201925_1 ;0

limit_e_dens_201925_1 = e_density[limit_electron_dens_arr_201925_1]
limit_70_80_e_dens_201925_1 = e_density[limit_70_80_electron_dens_arr_201925_1]
limit_60_70_e_dens_201925_1 = e_density[limit_60_70_electron_dens_arr_201925_1]
limit_50_60_e_dens_201925_1 = e_density[limit_50_60_electron_dens_arr_201925_1]
limit_40_50_e_dens_201925_1 = e_density[limit_40_50_electron_dens_arr_201925_1]

;===============================================================================

PRINT, '203906'

;80-1000 km/s velocity
limit_electron_dens_arr_203906 = DBLARR(limit_TII_203906_s)

FOR i = 0, limit_TII_203906_s-1 DO BEGIN
   limit_difference_arr_203906 = ABS(si_o_ratio-limit_ratio_203906[i])
   limit_electron_dens_203906 = WHERE(limit_difference_arr_203906 EQ MIN(limit_difference_arr_203906), /NULL)
   limit_electron_dens_arr_203906[i] = limit_electron_dens_203906[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_203906"

;PRINT, limit_electron_dens_arr_203906 

PRINT, "ZEROS"

limit_zeros_203906 = WHERE((limit_electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_203906) ;4

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_203906]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_203906 = DBLARR(limit_70_80_TII_203906_s)

FOR i = 0, limit_70_80_TII_203906_s-1 DO BEGIN
   limit_70_80_difference_arr_203906 = ABS(si_o_ratio-limit_70_80_ratio_203906[i])
   limit_70_80_electron_dens_203906 = WHERE(limit_70_80_difference_arr_203906 EQ MIN(limit_70_80_difference_arr_203906), /NULL)
   limit_70_80_electron_dens_arr_203906[i] = limit_70_80_electron_dens_203906[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_203906 = WHERE((limit_70_80_electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_203906) ;3

;60-70 km/s velocity
limit_60_70_electron_dens_arr_203906 = DBLARR(limit_60_70_TII_203906_s)

FOR i = 0, limit_60_70_TII_203906_s-1 DO BEGIN
   limit_60_70_difference_arr_203906 = ABS(si_o_ratio-limit_60_70_ratio_203906[i])
   limit_60_70_electron_dens_203906 = WHERE(limit_60_70_difference_arr_203906 EQ MIN(limit_60_70_difference_arr_203906), /NULL)
   limit_60_70_electron_dens_arr_203906[i] = limit_60_70_electron_dens_203906[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_203906 = WHERE((limit_60_70_electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_203906) ;4

;50-60 km/s velocity
limit_50_60_electron_dens_arr_203906 = DBLARR(limit_50_60_TII_203906_s)

FOR i = 0, limit_50_60_TII_203906_s-1 DO BEGIN
   limit_50_60_difference_arr_203906 = ABS(si_o_ratio-limit_50_60_ratio_203906[i])
   limit_50_60_electron_dens_203906 = WHERE(limit_50_60_difference_arr_203906 EQ MIN(limit_50_60_difference_arr_203906), /NULL)
   limit_50_60_electron_dens_arr_203906[i] = limit_50_60_electron_dens_203906[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_203906 = WHERE((limit_50_60_electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_203906) ;3

;40-50 km/s velocity
limit_40_50_electron_dens_arr_203906 = DBLARR(limit_40_50_TII_203906_s)

FOR i = 0, limit_40_50_TII_203906_s-1 DO BEGIN
   limit_40_50_difference_arr_203906 = ABS(si_o_ratio-limit_40_50_ratio_203906[i])
   limit_40_50_electron_dens_203906 = WHERE(limit_40_50_difference_arr_203906 EQ MIN(limit_40_50_difference_arr_203906), /NULL)
   limit_40_50_electron_dens_arr_203906[i] = limit_40_50_electron_dens_203906[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_203906 = WHERE((limit_40_50_electron_dens_arr_203906 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_203906) ;18

;-------------------------------------------------------------------------------

PRINT, "203906"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_203906) ;4

limit_ten_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_203906) ;2

limit_elev_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_203906) ;1

limit_twel_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_203906) ;0

limit_thirt_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_203906) ;0

limit_four_203906 = WHERE((e_density[limit_electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_203906) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_203906) ;3

limit_70_80_ten_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_203906) ;0

limit_70_80_elev_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_203906) ;0

limit_70_80_twel_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_203906) ;0

limit_70_80_thirt_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_203906) ;0

limit_70_80_four_203906 = WHERE((e_density[limit_70_80_electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_203906) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_203906) ;4

limit_60_70_ten_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_203906) ;0

limit_60_70_elev_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_203906) ;0

limit_60_70_twel_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_203906) ;0

limit_60_70_thirt_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_203906) ;0

limit_60_70_four_203906 = WHERE((e_density[limit_60_70_electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_203906) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_203906) ;3

limit_50_60_ten_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_203906) ;0

limit_50_60_elev_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_203906) ;0

limit_50_60_twel_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_203906) ;0

limit_50_60_thirt_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_203906) ;0

limit_50_60_four_203906 = WHERE((e_density[limit_50_60_electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_203906) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_203906] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_203906) ;18

limit_40_50_ten_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_203906] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_203906) ;0

limit_40_50_elev_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_203906] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_203906) ;0

limit_40_50_twel_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_203906] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_203906) ;0

limit_40_50_thirt_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_203906] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_203906) ;0

limit_40_50_four_203906 = WHERE((e_density[limit_40_50_electron_dens_arr_203906] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_203906) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_203906 = FLOAT((N_ELEMENTS(limit_nin_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_nin_203906 ;57.1429

limit_stat_ten_203906 = FLOAT((N_ELEMENTS(limit_ten_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_ten_203906 ;28.5714

limit_stat_elev_203906 = FLOAT((N_ELEMENTS(limit_elev_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_elev_203906 ;14.2857

limit_stat_twel_203906 = FLOAT((N_ELEMENTS(limit_twel_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_twel_203906 ;0

limit_stat_thirt_203906 = FLOAT((N_ELEMENTS(limit_thirt_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_thirt_203906 ;0

limit_stat_four_203906 = FLOAT((N_ELEMENTS(limit_four_203906))/FLOAT(N_ELEMENTS(limit_num14_three)))*100
PRINT, limit_stat_four_203906 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_203906 = FLOAT((N_ELEMENTS(limit_70_80_nin_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_nin_203906 ;100.000

limit_70_80_stat_ten_203906 = FLOAT((N_ELEMENTS(limit_70_80_ten_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_ten_203906 ;0

limit_70_80_stat_elev_203906 = FLOAT((N_ELEMENTS(limit_70_80_elev_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_elev_203906 ;0

limit_70_80_stat_twel_203906 = FLOAT((N_ELEMENTS(limit_70_80_twel_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_twel_203906 ;0

limit_70_80_stat_thirt_203906 = FLOAT((N_ELEMENTS(limit_70_80_thirt_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_thirt_203906 ;0

limit_70_80_stat_four_203906 = FLOAT((N_ELEMENTS(limit_70_80_four_203906))/FLOAT(N_ELEMENTS(limit_70_80_num14_three)))*100
PRINT, limit_70_80_stat_four_203906 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_203906 = FLOAT((N_ELEMENTS(limit_60_70_nin_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_nin_203906 ;100.000

limit_60_70_stat_ten_203906 = FLOAT((N_ELEMENTS(limit_60_70_ten_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_ten_203906 ;0

limit_60_70_stat_elev_203906 = FLOAT((N_ELEMENTS(limit_60_70_elev_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_elev_203906 ;0

limit_60_70_stat_twel_203906 = FLOAT((N_ELEMENTS(limit_60_70_twel_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_twel_203906 ;0

limit_60_70_stat_thirt_203906 = FLOAT((N_ELEMENTS(limit_60_70_thirt_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_thirt_203906 ;0

limit_60_70_stat_four_203906 = FLOAT((N_ELEMENTS(limit_60_70_four_203906))/FLOAT(N_ELEMENTS(limit_60_70_num14_three)))*100
PRINT, limit_60_70_stat_four_203906 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_203906 = FLOAT((N_ELEMENTS(limit_50_60_nin_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_nin_203906 ;100.000

limit_50_60_stat_ten_203906 = FLOAT((N_ELEMENTS(limit_50_60_ten_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_ten_203906 ;0

limit_50_60_stat_elev_203906 = FLOAT((N_ELEMENTS(limit_50_60_elev_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_elev_203906 ;0

limit_50_60_stat_twel_203906 = FLOAT((N_ELEMENTS(limit_50_60_twel_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_twel_203906 ;0

limit_50_60_stat_thirt_203906 = FLOAT((N_ELEMENTS(limit_50_60_thirt_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_thirt_203906 ;0

limit_50_60_stat_four_203906 = FLOAT((N_ELEMENTS(limit_50_60_four_203906))/FLOAT(N_ELEMENTS(limit_50_60_num14_three)))*100
PRINT, limit_50_60_stat_four_203906 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_203906 = FLOAT((N_ELEMENTS(limit_40_50_nin_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_nin_203906 ;100.000

limit_40_50_stat_ten_203906 = FLOAT((N_ELEMENTS(limit_40_50_ten_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_ten_203906 ;0

limit_40_50_stat_elev_203906 = FLOAT((N_ELEMENTS(limit_40_50_elev_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_elev_203906 ;0

limit_40_50_stat_twel_203906 = FLOAT((N_ELEMENTS(limit_40_50_twel_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_twel_203906 ;0

limit_40_50_stat_thirt_203906 = FLOAT((N_ELEMENTS(limit_40_50_thirt_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_thirt_203906 ;0

limit_40_50_stat_four_203906 = FLOAT((N_ELEMENTS(limit_40_50_four_203906))/FLOAT(N_ELEMENTS(limit_40_50_num14_three)))*100
PRINT, limit_40_50_stat_four_203906 ;0

limit_e_dens_203906 = e_density[limit_electron_dens_arr_203906]
limit_70_80_e_dens_203906 = e_density[limit_70_80_electron_dens_arr_203906]
limit_60_70_e_dens_203906 = e_density[limit_60_70_electron_dens_arr_203906]
limit_50_60_e_dens_203906 = e_density[limit_50_60_electron_dens_arr_203906]
limit_40_50_e_dens_203906 = e_density[limit_40_50_electron_dens_arr_203906]

;===============================================================================

PRINT, '215426'

;80-1000 km/s velocity
limit_electron_dens_arr_215426 = DBLARR(limit_TII_215426_s)

FOR i = 0, limit_TII_215426_s-1 DO BEGIN
   limit_difference_arr_215426 = ABS(si_o_ratio-limit_ratio_215426[i])
   limit_electron_dens_215426 = WHERE(limit_difference_arr_215426 EQ MIN(limit_difference_arr_215426), /NULL)
   limit_electron_dens_arr_215426[i] = limit_electron_dens_215426[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_215426"

;PRINT, limit_electron_dens_arr_215426 

PRINT, "ZEROS"

limit_zeros_215426 = WHERE((limit_electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_215426) ;1

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_215426]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_215426 = DBLARR(limit_70_80_TII_215426_s)

FOR i = 0, limit_70_80_TII_215426_s-1 DO BEGIN
   limit_70_80_difference_arr_215426 = ABS(si_o_ratio-limit_70_80_ratio_215426[i])
   limit_70_80_electron_dens_215426 = WHERE(limit_70_80_difference_arr_215426 EQ MIN(limit_70_80_difference_arr_215426), /NULL)
   limit_70_80_electron_dens_arr_215426[i] = limit_70_80_electron_dens_215426[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_215426 = WHERE((limit_70_80_electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_215426) ;1

;60-70 km/s velocity
limit_60_70_electron_dens_arr_215426 = DBLARR(limit_60_70_TII_215426_s)

FOR i = 0, limit_60_70_TII_215426_s-1 DO BEGIN
   limit_60_70_difference_arr_215426 = ABS(si_o_ratio-limit_60_70_ratio_215426[i])
   limit_60_70_electron_dens_215426 = WHERE(limit_60_70_difference_arr_215426 EQ MIN(limit_60_70_difference_arr_215426), /NULL)
   limit_60_70_electron_dens_arr_215426[i] = limit_60_70_electron_dens_215426[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_215426 = WHERE((limit_60_70_electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_215426) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_215426 = DBLARR(limit_50_60_TII_215426_s)

FOR i = 0, limit_50_60_TII_215426_s-1 DO BEGIN
   limit_50_60_difference_arr_215426 = ABS(si_o_ratio-limit_50_60_ratio_215426[i])
   limit_50_60_electron_dens_215426 = WHERE(limit_50_60_difference_arr_215426 EQ MIN(limit_50_60_difference_arr_215426), /NULL)
   limit_50_60_electron_dens_arr_215426[i] = limit_50_60_electron_dens_215426[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_215426 = WHERE((limit_50_60_electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_215426) ;0

;40-50 km/s velocity
limit_40_50_electron_dens_arr_215426 = DBLARR(limit_40_50_TII_215426_s)

FOR i = 0, limit_40_50_TII_215426_s-1 DO BEGIN
   limit_40_50_difference_arr_215426 = ABS(si_o_ratio-limit_40_50_ratio_215426[i])
   limit_40_50_electron_dens_215426 = WHERE(limit_40_50_difference_arr_215426 EQ MIN(limit_40_50_difference_arr_215426), /NULL)
   limit_40_50_electron_dens_arr_215426[i] = limit_40_50_electron_dens_215426[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_215426 = WHERE((limit_40_50_electron_dens_arr_215426 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_215426) ;3

;-------------------------------------------------------------------------------

PRINT, "215426"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_215426) ;1

limit_ten_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_215426) ;0

limit_elev_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_215426) ;0

limit_twel_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_215426) ;0

limit_thirt_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_215426) ;0

limit_four_215426 = WHERE((e_density[limit_electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_215426) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_215426) ;1

limit_70_80_ten_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_215426) ;0

limit_70_80_elev_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_215426) ;0

limit_70_80_twel_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_215426) ;0

limit_70_80_thirt_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_215426) ;0

limit_70_80_four_215426 = WHERE((e_density[limit_70_80_electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_215426) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_215426) ;0

limit_60_70_ten_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_215426) ;0

limit_60_70_elev_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_215426) ;0

limit_60_70_twel_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_215426) ;1

limit_60_70_thirt_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_215426) ;0

limit_60_70_four_215426 = WHERE((e_density[limit_60_70_electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_215426) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_215426) ;0

limit_50_60_ten_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_215426) ;0

limit_50_60_elev_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_215426) ;0

limit_50_60_twel_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_215426) ;1

limit_50_60_thirt_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_215426) ;0

limit_50_60_four_215426 = WHERE((e_density[limit_50_60_electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_215426) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_215426] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_215426) ;3

limit_40_50_ten_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_215426] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_215426) ;0

limit_40_50_elev_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_215426] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_215426) ;2

limit_40_50_twel_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_215426] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_215426) ;0

limit_40_50_thirt_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_215426] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_215426) ;0

limit_40_50_four_215426 = WHERE((e_density[limit_40_50_electron_dens_arr_215426] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_215426) ;0

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_215426 = FLOAT((N_ELEMENTS(limit_nin_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_nin_215426 ;100.000

limit_stat_ten_215426 = FLOAT((N_ELEMENTS(limit_ten_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_ten_215426 ;0

limit_stat_elev_215426 = FLOAT((N_ELEMENTS(limit_elev_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_elev_215426 ;0

limit_stat_twel_215426 = FLOAT((N_ELEMENTS(limit_twel_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_twel_215426 ;0

limit_stat_thirt_215426 = FLOAT((N_ELEMENTS(limit_thirt_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_thirt_215426 ;0

limit_stat_four_215426 = FLOAT((N_ELEMENTS(limit_four_215426))/FLOAT(N_ELEMENTS(limit_num15_three)))*100
PRINT, limit_stat_four_215426 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_215426 = FLOAT((N_ELEMENTS(limit_70_80_nin_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_nin_215426 ;100.000

limit_70_80_stat_ten_215426 = FLOAT((N_ELEMENTS(limit_70_80_ten_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_ten_215426 ;0

limit_70_80_stat_elev_215426 = FLOAT((N_ELEMENTS(limit_70_80_elev_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_elev_215426 ;0

limit_70_80_stat_twel_215426 = FLOAT((N_ELEMENTS(limit_70_80_twel_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_twel_215426 ;0

limit_70_80_stat_thirt_215426 = FLOAT((N_ELEMENTS(limit_70_80_thirt_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_thirt_215426 ;0

limit_70_80_stat_four_215426 = FLOAT((N_ELEMENTS(limit_70_80_four_215426))/FLOAT(N_ELEMENTS(limit_70_80_num15_three)))*100
PRINT, limit_70_80_stat_four_215426 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_215426 = FLOAT((N_ELEMENTS(limit_60_70_nin_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_nin_215426 ;0

limit_60_70_stat_ten_215426 = FLOAT((N_ELEMENTS(limit_60_70_ten_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_ten_215426 ;0

limit_60_70_stat_elev_215426 = FLOAT((N_ELEMENTS(limit_60_70_elev_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_elev_215426 ;0

limit_60_70_stat_twel_215426 = FLOAT((N_ELEMENTS(limit_60_70_twel_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_twel_215426 ;100.000

limit_60_70_stat_thirt_215426 = FLOAT((N_ELEMENTS(limit_60_70_thirt_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_thirt_215426 ;0

limit_60_70_stat_four_215426 = FLOAT((N_ELEMENTS(limit_60_70_four_215426))/FLOAT(N_ELEMENTS(limit_60_70_num15_three)))*100
PRINT, limit_60_70_stat_four_215426 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_215426 = FLOAT((N_ELEMENTS(limit_50_60_nin_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_nin_215426 ;0

limit_50_60_stat_ten_215426 = FLOAT((N_ELEMENTS(limit_50_60_ten_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_ten_215426 ;0

limit_50_60_stat_elev_215426 = FLOAT((N_ELEMENTS(limit_50_60_elev_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_elev_215426 ;0

limit_50_60_stat_twel_215426 = FLOAT((N_ELEMENTS(limit_50_60_twel_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_twel_215426 ;100.000

limit_50_60_stat_thirt_215426 = FLOAT((N_ELEMENTS(limit_50_60_thirt_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_thirt_215426 ;0

limit_50_60_stat_four_215426 = FLOAT((N_ELEMENTS(limit_50_60_four_215426))/FLOAT(N_ELEMENTS(limit_50_60_num15_three)))*100
PRINT, limit_50_60_stat_four_215426 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_215426 = FLOAT((N_ELEMENTS(limit_40_50_nin_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_nin_215426 ;60.000

limit_40_50_stat_ten_215426 = FLOAT((N_ELEMENTS(limit_40_50_ten_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_ten_215426 ;0

limit_40_50_stat_elev_215426 = FLOAT((N_ELEMENTS(limit_40_50_elev_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_elev_215426 ;40.000

limit_40_50_stat_twel_215426 = FLOAT((N_ELEMENTS(limit_40_50_twel_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_twel_215426 ;0

limit_40_50_stat_thirt_215426 = FLOAT((N_ELEMENTS(limit_40_50_thirt_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_thirt_215426 ;0

limit_40_50_stat_four_215426 = FLOAT((N_ELEMENTS(limit_40_50_four_215426))/FLOAT(N_ELEMENTS(limit_40_50_num15_three)))*100
PRINT, limit_40_50_stat_four_215426 ;0

limit_e_dens_215426 = e_density[limit_electron_dens_arr_215426]
limit_70_80_e_dens_215426 = e_density[limit_70_80_electron_dens_arr_215426]
limit_60_70_e_dens_215426 = e_density[limit_60_70_electron_dens_arr_215426]
limit_50_60_e_dens_215426 = e_density[limit_50_60_electron_dens_arr_215426]
limit_40_50_e_dens_215426 = e_density[limit_40_50_electron_dens_arr_215426]

;===============================================================================

PRINT, '232931'

;80-1000 km/s velocity
limit_electron_dens_arr_232931 = DBLARR(limit_TII_232931_s)

FOR i = 0, limit_TII_232931_s-1 DO BEGIN
   limit_difference_arr_232931 = ABS(si_o_ratio-limit_ratio_232931[i])
   limit_electron_dens_232931 = WHERE(limit_difference_arr_232931 EQ MIN(limit_difference_arr_232931), /NULL)
   limit_electron_dens_arr_232931[i] = limit_electron_dens_232931[0]
ENDFOR

;PRINT, "limit_ELECTRON_DENS_ARR_232931"

;PRINT, limit_electron_dens_arr_232931 

PRINT, "ZEROS"

limit_zeros_232931 = WHERE((limit_electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_zeros_232931) ;0

;PRINT, "limit_E_DENSITY[ABOVE]"

;PRINT, e_density[limit_electron_dens_arr_232931]

;70-80 km/s velocity
limit_70_80_electron_dens_arr_232931 = DBLARR(limit_70_80_TII_232931_s)

FOR i = 0, limit_70_80_TII_232931_s-1 DO BEGIN
   limit_70_80_difference_arr_232931 = ABS(si_o_ratio-limit_70_80_ratio_232931[i])
   limit_70_80_electron_dens_232931 = WHERE(limit_70_80_difference_arr_232931 EQ MIN(limit_70_80_difference_arr_232931), /NULL)
   limit_70_80_electron_dens_arr_232931[i] = limit_70_80_electron_dens_232931[0]
ENDFOR

PRINT, "ZEROS"

limit_70_80_zeros_232931 = WHERE((limit_70_80_electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_70_80_zeros_232931) ;0

;60-70 km/s velocity
limit_60_70_electron_dens_arr_232931 = DBLARR(limit_60_70_TII_232931_s)

FOR i = 0, limit_60_70_TII_232931_s-1 DO BEGIN
   limit_60_70_difference_arr_232931 = ABS(si_o_ratio-limit_60_70_ratio_232931[i])
   limit_60_70_electron_dens_232931 = WHERE(limit_60_70_difference_arr_232931 EQ MIN(limit_60_70_difference_arr_232931), /NULL)
   limit_60_70_electron_dens_arr_232931[i] = limit_60_70_electron_dens_232931[0]
ENDFOR

PRINT, "ZEROS"

limit_60_70_zeros_232931 = WHERE((limit_60_70_electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_60_70_zeros_232931) ;0

;50-60 km/s velocity
limit_50_60_electron_dens_arr_232931 = DBLARR(limit_50_60_TII_232931_s)

FOR i = 0, limit_50_60_TII_232931_s-1 DO BEGIN
   limit_50_60_difference_arr_232931 = ABS(si_o_ratio-limit_50_60_ratio_232931[i])
   limit_50_60_electron_dens_232931 = WHERE(limit_50_60_difference_arr_232931 EQ MIN(limit_50_60_difference_arr_232931), /NULL)
   limit_50_60_electron_dens_arr_232931[i] = limit_50_60_electron_dens_232931[0]
ENDFOR

PRINT, "ZEROS"

limit_50_60_zeros_232931 = WHERE((limit_50_60_electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_50_60_zeros_232931) ;0

;40-50 km/s velocity
limit_40_50_electron_dens_arr_232931 = DBLARR(limit_40_50_TII_232931_s)

FOR i = 0, limit_40_50_TII_232931_s-1 DO BEGIN
   limit_40_50_difference_arr_232931 = ABS(si_o_ratio-limit_40_50_ratio_232931[i])
   limit_40_50_electron_dens_232931 = WHERE(limit_40_50_difference_arr_232931 EQ MIN(limit_40_50_difference_arr_232931), /NULL)
   limit_40_50_electron_dens_arr_232931[i] = limit_40_50_electron_dens_232931[0]
ENDFOR

PRINT, "ZEROS"

limit_40_50_zeros_232931 = WHERE((limit_40_50_electron_dens_arr_232931 EQ 0.0), count, /NULL)
PRINT, SIZE(limit_40_50_zeros_232931) ;0

;-------------------------------------------------------------------------------

PRINT, "232931"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_nin_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[limit_electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_nin_232931) ;0

limit_ten_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[limit_electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_ten_232931) ;0

limit_elev_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[limit_electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_elev_232931) ;0

limit_twel_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[limit_electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_twel_232931) ;0

limit_thirt_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[limit_electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_thirt_232931) ;1

limit_four_232931 = WHERE((e_density[limit_electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_four_232931) ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_nin_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[limit_70_80_electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_70_80_nin_232931) ;0

limit_70_80_ten_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[limit_70_80_electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_70_80_ten_232931) ;0

limit_70_80_elev_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[limit_70_80_electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_70_80_elev_232931) ;1

limit_70_80_twel_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[limit_70_80_electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_70_80_twel_232931) ;0

limit_70_80_thirt_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[limit_70_80_electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_thirt_232931) ;0

limit_70_80_four_232931 = WHERE((e_density[limit_70_80_electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_70_80_four_232931) ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_nin_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[limit_60_70_electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_60_70_nin_232931) ;0

limit_60_70_ten_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[limit_60_70_electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_60_70_ten_232931) ;0

limit_60_70_elev_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[limit_60_70_electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_60_70_elev_232931) ;1

limit_60_70_twel_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[limit_60_70_electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_60_70_twel_232931) ;0

limit_60_70_thirt_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[limit_60_70_electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_thirt_232931) ;0

limit_60_70_four_232931 = WHERE((e_density[limit_60_70_electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_60_70_four_232931) ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_nin_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[limit_50_60_electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_50_60_nin_232931) ;0

limit_50_60_ten_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[limit_50_60_electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_50_60_ten_232931) ;1

limit_50_60_elev_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[limit_50_60_electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_50_60_elev_232931) ;0

limit_50_60_twel_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[limit_50_60_electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_50_60_twel_232931) ;0

limit_50_60_thirt_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[limit_50_60_electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_thirt_232931) ;0

limit_50_60_four_232931 = WHERE((e_density[limit_50_60_electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_50_60_four_232931) ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_nin_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+09) AND (e_density[limit_40_50_electron_dens_arr_232931] LT 1.0000000e+10), count, /NULL)
PRINT, SIZE(limit_40_50_nin_232931) ;0

limit_40_50_ten_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+10) AND (e_density[limit_40_50_electron_dens_arr_232931] LT 1.0000000e+11), count, /NULL)
PRINT, SIZE(limit_40_50_ten_232931) ;0

limit_40_50_elev_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+11) AND (e_density[limit_40_50_electron_dens_arr_232931] LT 1.0000000e+12), count, /NULL)
PRINT, SIZE(limit_40_50_elev_232931) ;1
;PRINT, e_density[limit_40_50_elev_232931]

limit_40_50_twel_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+12) AND (e_density[limit_40_50_electron_dens_arr_232931] LT 1.0000000e+13), count, /NULL)
PRINT, SIZE(limit_40_50_twel_232931) ;0

limit_40_50_thirt_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+13) AND (e_density[limit_40_50_electron_dens_arr_232931] LT 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_thirt_232931) ;0
;PRINT, e_density[limit_40_50_thirt_232931]

limit_40_50_four_232931 = WHERE((e_density[limit_40_50_electron_dens_arr_232931] GE 1.0000000e+14), count, /NULL)
PRINT, SIZE(limit_40_50_four_232931) ;0
;PRINT, e_density[limit_40_50_four_232931]

;-------------------------------------------------------------------------------

PRINT, "STATS"

PRINT, '80-1000 km/s velocity'

;80-1000 km/s velocity
limit_stat_nin_232931 = FLOAT((N_ELEMENTS(limit_nin_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_nin_232931 ;0

limit_stat_ten_232931 = FLOAT((N_ELEMENTS(limit_ten_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_ten_232931 ;0

limit_stat_elev_232931 = FLOAT((N_ELEMENTS(limit_elev_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_elev_232931 ;0

limit_stat_twel_232931 = FLOAT((N_ELEMENTS(limit_twel_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_twel_232931 ;0

limit_stat_thirt_232931 = FLOAT((N_ELEMENTS(limit_thirt_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_thirt_232931 ;100.0000

limit_stat_four_232931 = FLOAT((N_ELEMENTS(limit_four_232931))/FLOAT(N_ELEMENTS(limit_num16_three)))*100
PRINT, limit_stat_four_232931 ;0

PRINT, '70-80 km/s velocity'

;70-80 km/s velocity
limit_70_80_stat_nin_232931 = FLOAT((N_ELEMENTS(limit_70_80_nin_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_nin_232931 ;0

limit_70_80_stat_ten_232931 = FLOAT((N_ELEMENTS(limit_70_80_ten_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_ten_232931 ;0

limit_70_80_stat_elev_232931 = FLOAT((N_ELEMENTS(limit_70_80_elev_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_elev_232931 ;100.000

limit_70_80_stat_twel_232931 = FLOAT((N_ELEMENTS(limit_70_80_twel_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_twel_232931 ;0

limit_70_80_stat_thirt_232931 = FLOAT((N_ELEMENTS(limit_70_80_thirt_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_thirt_232931 ;0

limit_70_80_stat_four_232931 = FLOAT((N_ELEMENTS(limit_70_80_four_232931))/FLOAT(N_ELEMENTS(limit_70_80_num16_three)))*100
PRINT, limit_70_80_stat_four_232931 ;0

PRINT, '60-70 km/s velocity'

;60-70 km/s velocity
limit_60_70_stat_nin_232931 = FLOAT((N_ELEMENTS(limit_60_70_nin_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_nin_232931 ;0

limit_60_70_stat_ten_232931 = FLOAT((N_ELEMENTS(limit_60_70_ten_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_ten_232931 ;0

limit_60_70_stat_elev_232931 = FLOAT((N_ELEMENTS(limit_60_70_elev_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_elev_232931 ;100.000

limit_60_70_stat_twel_232931 = FLOAT((N_ELEMENTS(limit_60_70_twel_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_twel_232931 ;0

limit_60_70_stat_thirt_232931 = FLOAT((N_ELEMENTS(limit_60_70_thirt_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_thirt_232931 ;0

limit_60_70_stat_four_232931 = FLOAT((N_ELEMENTS(limit_60_70_four_232931))/FLOAT(N_ELEMENTS(limit_60_70_num16_three)))*100
PRINT, limit_60_70_stat_four_232931 ;0

PRINT, '50-60 km/s velocity'

;50-60 km/s velocity
limit_50_60_stat_nin_232931 = FLOAT((N_ELEMENTS(limit_50_60_nin_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_nin_232931 ;0

limit_50_60_stat_ten_232931 = FLOAT((N_ELEMENTS(limit_50_60_ten_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_ten_232931 ;100.000

limit_50_60_stat_elev_232931 = FLOAT((N_ELEMENTS(limit_50_60_elev_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_elev_232931 ;0

limit_50_60_stat_twel_232931 = FLOAT((N_ELEMENTS(limit_50_60_twel_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_twel_232931 ;0

limit_50_60_stat_thirt_232931 = FLOAT((N_ELEMENTS(limit_50_60_thirt_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_thirt_232931 ;0

limit_50_60_stat_four_232931 = FLOAT((N_ELEMENTS(limit_50_60_four_232931))/FLOAT(N_ELEMENTS(limit_50_60_num16_three)))*100
PRINT, limit_50_60_stat_four_232931 ;0

PRINT, '40-50 km/s velocity'

;40-50 km/s velocity
limit_40_50_stat_nin_232931 = FLOAT((N_ELEMENTS(limit_40_50_nin_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_nin_232931 ;0

limit_40_50_stat_ten_232931 = FLOAT((N_ELEMENTS(limit_40_50_ten_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_ten_232931 ;0

limit_40_50_stat_elev_232931 = FLOAT((N_ELEMENTS(limit_40_50_elev_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_elev_232931 ;100.000

limit_40_50_stat_twel_232931 = FLOAT((N_ELEMENTS(limit_40_50_twel_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_twel_232931 ;0

limit_40_50_stat_thirt_232931 = FLOAT((N_ELEMENTS(limit_40_50_thirt_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_thirt_232931 ;0

limit_40_50_stat_four_232931 = FLOAT((N_ELEMENTS(limit_40_50_four_232931))/FLOAT(N_ELEMENTS(limit_40_50_num16_three)))*100
PRINT, limit_40_50_stat_four_232931 ;0

limit_e_dens_232931 = e_density[limit_electron_dens_arr_232931]
limit_70_80_e_dens_232931 = e_density[limit_70_80_electron_dens_arr_232931]
limit_60_70_e_dens_232931 = e_density[limit_60_70_electron_dens_arr_232931]
limit_50_60_e_dens_232931 = e_density[limit_50_60_electron_dens_arr_232931]
limit_40_50_e_dens_232931 = e_density[limit_40_50_electron_dens_arr_232931]

;===============================================================================

sfname_e_dens_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_e_dens.sav'
SAVE, limit_electron_dens_arr_004121, limit_electron_dens_arr_050655, limit_electron_dens_arr_050655_1, limit_electron_dens_arr_052046, limit_electron_dens_arr_061606, limit_electron_dens_arr_114951, limit_electron_dens_arr_122033, limit_electron_dens_arr_160806, limit_electron_dens_arr_163205, limit_electron_dens_arr_174905, limit_electron_dens_arr_181205, limit_electron_dens_arr_201925, limit_electron_dens_arr_201925_1, limit_electron_dens_arr_203906, limit_electron_dens_arr_215426, limit_electron_dens_arr_232931, FILENAME = sfname_e_dens_limit

;restore to get aspr info.

rfname_aspr_limit = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/004121/all_vars_004121.sav'
RESTORE, rfname_aspr_limit

;concatenate arrays

;80-1000 km/s velocity
limit_total_D = [limit_e_dens_004121, limit_e_dens_050655, limit_e_dens_050655_1, limit_e_dens_052046, limit_e_dens_061606, limit_e_dens_114951, limit_e_dens_122033, limit_e_dens_160806, limit_e_dens_163205, limit_e_dens_174905, limit_e_dens_181205, limit_e_dens_201925, limit_e_dens_201925_1, limit_e_dens_203906, limit_e_dens_215426, limit_e_dens_232931]

;70-80 km/s velocity
limit_70_80_total_D = [limit_70_80_e_dens_004121, limit_70_80_e_dens_050655, limit_70_80_e_dens_050655_1, limit_70_80_e_dens_052046, limit_70_80_e_dens_061606, limit_70_80_e_dens_114951, limit_70_80_e_dens_122033, limit_70_80_e_dens_160806, limit_70_80_e_dens_163205, limit_70_80_e_dens_174905, limit_70_80_e_dens_181205, limit_70_80_e_dens_201925, limit_70_80_e_dens_201925_1, limit_70_80_e_dens_203906, limit_70_80_e_dens_215426, limit_70_80_e_dens_232931]

;60-70 km/s velocity
limit_60_70_total_D = [limit_60_70_e_dens_004121, limit_60_70_e_dens_050655, limit_60_70_e_dens_050655_1, limit_60_70_e_dens_052046, limit_60_70_e_dens_061606, limit_60_70_e_dens_114951, limit_60_70_e_dens_122033, limit_60_70_e_dens_160806, limit_60_70_e_dens_163205, limit_60_70_e_dens_174905, limit_60_70_e_dens_181205, limit_60_70_e_dens_201925, limit_60_70_e_dens_201925_1, limit_60_70_e_dens_203906, limit_60_70_e_dens_215426, limit_60_70_e_dens_232931]

;50-60 km/s velocity
limit_50_60_total_D = [limit_50_60_e_dens_004121, limit_50_60_e_dens_050655, limit_50_60_e_dens_050655_1, limit_50_60_e_dens_052046, limit_50_60_e_dens_061606, limit_50_60_e_dens_114951, limit_50_60_e_dens_122033, limit_50_60_e_dens_160806, limit_50_60_e_dens_163205, limit_50_60_e_dens_174905, limit_50_60_e_dens_181205, limit_50_60_e_dens_201925, limit_50_60_e_dens_201925_1, limit_50_60_e_dens_203906, limit_50_60_e_dens_215426, limit_50_60_e_dens_232931]

;40-50 km/s velocity
limit_40_50_total_D = [limit_40_50_e_dens_004121, limit_40_50_e_dens_050655, limit_40_50_e_dens_050655_1, limit_40_50_e_dens_052046, limit_40_50_e_dens_061606, limit_40_50_e_dens_114951, limit_40_50_e_dens_122033, limit_40_50_e_dens_160806, limit_40_50_e_dens_163205, limit_40_50_e_dens_174905, limit_40_50_e_dens_181205, limit_40_50_e_dens_201925, limit_40_50_e_dens_201925_1, limit_40_50_e_dens_203906, limit_40_50_e_dens_215426, limit_40_50_e_dens_232931]

;80-1000 km/s velocity
;large data, so take log base 10

limit_total_D = ALOG10(limit_total_D)
PRINT, 'limit_80_1000_total_D'
PRINT, limit_total_D

;make histogram of all densities and frequencies

limit_D_hist = HISTOGRAM(limit_total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, limit_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;70-80 km/s velocity
;large data, so take log base 10

limit_70_80_total_D = ALOG10(limit_70_80_total_D)
PRINT, 'limit_70_80_total_D'
PRINT, limit_70_80_total_D

;make histogram of all densities and frequencies

limit_70_80_D_hist = HISTOGRAM(limit_70_80_total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, limit_70_80_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;60-70 km/s velocity
;large data, so take log base 10

limit_60_70_total_D = ALOG10(limit_60_70_total_D)
PRINT, 'limit_60_70_total_D'
PRINT, limit_60_70_total_D

;make histogram of all densities and frequencies

limit_60_70_D_hist = HISTOGRAM(limit_60_70_total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, limit_60_70_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;50-60 km/s velocity
;large data, so take log base 10

limit_50_60_total_D = ALOG10(limit_50_60_total_D)
PRINT, 'limit_50_60_total_D'
PRINT, limit_50_60_total_D

;make histogram of all densities and frequencies

limit_50_60_D_hist = HISTOGRAM(limit_50_60_total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, limit_50_60_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;40-50 km/s velocity
;large data, so take log base 10

limit_40_50_total_D = ALOG10(limit_40_50_total_D)
PRINT, 'limit_40_50_total_D'
PRINT, limit_40_50_total_D

;make histogram of all densities and frequencies

limit_40_50_D_hist = HISTOGRAM(limit_40_50_total_D, BINSIZE = 0.2, LOCATIONS = x_hist)

PLOT, x_hist, limit_40_50_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency"

;save as ps

!P.FONT = 1

TVLCT, [[0],[0],[0]], 1
SET_PLOT, 'ps'
DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, limit_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_70_80_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, limit_70_80_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_60_70_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, limit_60_70_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_50_60_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, limit_50_60_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

DEVICE, XSIZE = 15, YSIZE = 10, /INCHES, COLOR = 1, BITS_PER_PIXEL = 8, SET_FONT = 'TIMES', /TT_FONT, FILENAME = '/Users/physicsuser/Desktop/amandabacon/REU_CfA/data/detection/density_OIV/limit_40_50_elec_dens_histogram.eps', /ENCAPSULATED

PLOT, x_hist, limit_40_50_D_hist, PSYM = 10, XTITLE = "Electron Density (cm^-3)", YTITLE = "Frequency", POSITION = [x0,y0,x0+dx,y0+dy], COLOR = 1, XCHARSIZE = 1.5, YCHARSIZE = 1.5, CHARSIZE = 1.5, XSTYLE = 1, THICK = 4, XTHICK = 10, YTHICK = 10

DEVICE, /CLOSE

;destroy all evidence

OBJ_DESTROY, dataRast_004121
OBJ_DESTROY, data1400_004121

END
