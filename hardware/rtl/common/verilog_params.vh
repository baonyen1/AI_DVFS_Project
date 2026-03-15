//=============================================================
// AI-DVFS Verilog Parameters - Auto-generated
// Date: 2026-03-07 11:13:29
//
// Model: GradientBoostingClassifier (10 trees, depth=6)
// Fixed-point: Q8.8 (16-bit signed, scale=256)
//
// CV Accuracy: 0.8914 (+/- 0.0115)
// Final Accuracy: 0.8897
//==============================================================

`ifndef VERILOG_PARAMS_VH
`define VERILOG_PARAMS_VH

// ========================================
// Configuration Parameters
// ========================================
`define N_TREES           10
`define TREE_DEPTH        6
`define N_FEATURES        10
`define WINDOW_SIZE       8

// ========================================
// Feature Mapping
// ========================================
`define F_WORKLOAD      0  // f0_workload
`define F_MEAN          1  // f1_mean
`define F_STD           2  // f2_std
`define F_DELTA         3  // f3_delta
`define F_TREND         4  // f4_trend
`define F_EMA           5  // f5_ema
`define F_TEMPERATURE   6  // f6_temperature
`define F_HEADROOM      7  // f7_headroom
`define F_EFFICIENCY    8  // f8_efficiency
`define F_SHORT_LONG    9  // f9_short_long

// ========================================
// DVFS State Labels
// ========================================
`define STATE_LOW         2'd0
`define STATE_MEDIUM      2'd1
`define STATE_HIGH        2'd2

// ========================================
// Decision Tree Thresholds (Q8.8)
// Format: THRESH_<TREE>_<NODE> = 16'h<HEX>
// ========================================

// --- Class LOW Trees ---
// Tree 0 (class=0):
`define THRESH_T0_N 0  16'h201C  // f0 t= 32.11 L=1 R=60
`define THRESH_T0_N 1  16'h029E  // f8 t=  2.62 L=2 R=29
`define THRESH_T0_N 2  16'h0296  // f8 t=  2.58 L=3 R=14
`define THRESH_T0_N 3  16'h192A  // f0 t= 25.17 L=4 R=9
`define THRESH_T0_N 4  16'h0730  // f2 t=  7.19 L=5 R=8
`define THRESH_T0_N 5  16'h1960  // f5 t= 25.37 L=6 R=7
`define THRESH_T0_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T0_N10  16'h0292  // f8 t=  2.57 L=11 R=12
`define THRESH_T0_N14  16'h029A  // f8 t=  2.60 L=15 R=22
`define THRESH_T0_N15  16'h00B8  // f2 t=  0.72 L=16 R=19
`define THRESH_T0_N16  16'hFF30  // f9 t= -0.81 L=17 R=18
`define THRESH_T0_N19  16'h1FCA  // f1 t= 31.79 L=20 R=21
`define THRESH_T0_N22  16'h1CB9  // f1 t= 28.72 L=23 R=26
`define THRESH_T0_N23  16'h0086  // f4 t=  0.53 L=24 R=25
`define THRESH_T0_N26  16'h0074  // f2 t=  0.45 L=27 R=28
`define THRESH_T0_N29  16'h1F02  // f5 t= 31.01 L=30 R=45
`define THRESH_T0_N30  16'h02A0  // f8 t=  2.63 L=31 R=38
`define THRESH_T0_N31  16'hFCFF  // f9 t= -3.00 L=32 R=35
`define THRESH_T0_N32  16'hFCD6  // f9 t= -3.16 L=33 R=34
`define THRESH_T0_N35  16'h1D10  // f5 t= 29.06 L=36 R=37
`define THRESH_T0_N38  16'h1A86  // f1 t= 26.52 L=39 R=42
`define THRESH_T0_N39  16'h1749  // f1 t= 23.29 L=40 R=41
`define THRESH_T0_N42  16'h1E9A  // f5 t= 30.60 L=43 R=44
`define THRESH_T0_N45  16'h02A2  // f8 t=  2.63 L=46 R=53
`define THRESH_T0_N46  16'h02A0  // f8 t=  2.63 L=47 R=50
`define THRESH_T0_N47  16'h0096  // f4 t=  0.59 L=48 R=49
`define THRESH_T0_N50  16'h002A  // f9 t=  0.17 L=51 R=52
`define THRESH_T0_N53  16'h0210  // f2 t=  2.06 L=54 R=57
`define THRESH_T0_N54  16'h006C  // f3 t=  0.42 L=55 R=56
`define THRESH_T0_N57  16'h20F8  // f5 t= 32.97 L=58 R=59
`define THRESH_T0_N60  16'h21F8  // f5 t= 33.97 L=61 R=92
`define THRESH_T0_N61  16'h1FD0  // f5 t= 31.81 L=62 R=77
`define THRESH_T0_N62  16'h1BA9  // f5 t= 27.66 L=63 R=70
`define THRESH_T0_N63  16'h03B4  // f2 t=  3.71 L=64 R=67
`define THRESH_T0_N64  16'h05A0  // f3 t=  5.63 L=65 R=66
`define THRESH_T0_N67  16'h063E  // f9 t=  6.24 L=68 R=69
`define THRESH_T0_N70  16'h02AC  // f8 t=  2.67 L=71 R=74
`define THRESH_T0_N71  16'h0386  // f2 t=  3.52 L=72 R=73
`define THRESH_T0_N74  16'h02AE  // f8 t=  2.68 L=75 R=76
`define THRESH_T0_N77  16'h0404  // f2 t=  4.02 L=78 R=85
`define THRESH_T0_N78  16'h02A6  // f8 t=  2.65 L=79 R=82
`define THRESH_T0_N79  16'h20E4  // f0 t= 32.89 L=80 R=81
`define THRESH_T0_N82  16'hFE08  // f3 t= -1.97 L=83 R=84
`define THRESH_T0_N85  16'h014E  // f4 t=  1.31 L=86 R=89
`define THRESH_T0_N86  16'h3128  // f6 t= 49.15 L=87 R=88
`define THRESH_T0_N89  16'h30DD  // f6 t= 48.86 L=90 R=91
`define THRESH_T0_N92  16'h2194  // f0 t= 33.58 L=93 R=108
`define THRESH_T0_N93  16'h0366  // f2 t=  3.40 L=94 R=101
`define THRESH_T0_N94  16'h00D5  // f3 t=  0.83 L=95 R=98
`define THRESH_T0_N95  16'hFFFA  // f4 t= -0.03 L=96 R=97
`define THRESH_T0_N98  16'h02AA  // f8 t=  2.66 L=99 R=100
`define THRESH_T0_N101  16'h240F  // f1 t= 36.06 L=102 R=105
`define THRESH_T0_N102  16'h2104  // f7 t= 33.02 L=103 R=104
`define THRESH_T0_N105  16'hFE62  // f3 t= -1.62 L=106 R=107
`define THRESH_T0_N108  16'h23A4  // f5 t= 35.64 L=109 R=116
`define THRESH_T0_N109  16'h0363  // f2 t=  3.39 L=110 R=113
`define THRESH_T0_N110  16'h0630  // f9 t=  6.19 L=111 R=112
`define THRESH_T0_N113  16'hFE6A  // f3 t= -1.59 L=114 R=115
`define THRESH_T0_N116  16'h256E  // f1 t= 37.43 L=117 R=120
`define THRESH_T0_N117  16'hFC86  // f3 t= -3.48 L=118 R=119
`define THRESH_T0_N120  16'h229D  // f0 t= 34.61 L=121 R=122
// Tree 1 (class=0):
`define THRESH_T1_N 0  16'h2038  // f0 t= 32.22 L=1 R=60
`define THRESH_T1_N 1  16'h029E  // f8 t=  2.62 L=2 R=29
`define THRESH_T1_N 2  16'h0296  // f8 t=  2.58 L=3 R=14
`define THRESH_T1_N 3  16'h192A  // f0 t= 25.17 L=4 R=9
`define THRESH_T1_N 4  16'h0730  // f2 t=  7.19 L=5 R=8
`define THRESH_T1_N 5  16'h1878  // f0 t= 24.47 L=6 R=7
`define THRESH_T1_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T1_N10  16'h0292  // f8 t=  2.57 L=11 R=12
`define THRESH_T1_N14  16'h029A  // f8 t=  2.60 L=15 R=22
`define THRESH_T1_N15  16'h00B8  // f2 t=  0.72 L=16 R=19
`define THRESH_T1_N16  16'h00B4  // f2 t=  0.70 L=17 R=18
`define THRESH_T1_N19  16'h1FCA  // f1 t= 31.79 L=20 R=21
`define THRESH_T1_N22  16'h1CB9  // f1 t= 28.72 L=23 R=26
`define THRESH_T1_N23  16'h0086  // f4 t=  0.53 L=24 R=25
`define THRESH_T1_N26  16'h0074  // f2 t=  0.45 L=27 R=28
`define THRESH_T1_N29  16'h1F02  // f5 t= 31.01 L=30 R=45
`define THRESH_T1_N30  16'h02A0  // f8 t=  2.63 L=31 R=38
`define THRESH_T1_N31  16'hFCFF  // f9 t= -3.00 L=32 R=35
`define THRESH_T1_N32  16'hFF2C  // f4 t= -0.83 L=33 R=34
`define THRESH_T1_N35  16'h01E6  // f2 t=  1.90 L=36 R=37
`define THRESH_T1_N38  16'h1A86  // f1 t= 26.52 L=39 R=42
`define THRESH_T1_N39  16'h2ABE  // f7 t= 42.74 L=40 R=41
`define THRESH_T1_N42  16'h1E9A  // f5 t= 30.60 L=43 R=44
`define THRESH_T1_N45  16'h02A2  // f8 t=  2.63 L=46 R=53
`define THRESH_T1_N46  16'h02A0  // f8 t=  2.63 L=47 R=50
`define THRESH_T1_N47  16'h2298  // f5 t= 34.59 L=48 R=49
`define THRESH_T1_N50  16'h002A  // f9 t=  0.17 L=51 R=52
`define THRESH_T1_N53  16'h006C  // f3 t=  0.42 L=54 R=57
`define THRESH_T1_N54  16'h0066  // f4 t=  0.40 L=55 R=56
`define THRESH_T1_N57  16'h02A4  // f8 t=  2.64 L=58 R=59
`define THRESH_T1_N60  16'h21B0  // f5 t= 33.69 L=61 R=90
`define THRESH_T1_N61  16'h1FD0  // f5 t= 31.81 L=62 R=75
`define THRESH_T1_N62  16'h1BA9  // f5 t= 27.66 L=63 R=68
`define THRESH_T1_N63  16'h17F6  // f1 t= 23.96 L=64 R=65
`define THRESH_T1_N65  16'h03F0  // f2 t=  3.94 L=66 R=67
`define THRESH_T1_N68  16'h02AC  // f8 t=  2.67 L=69 R=72
`define THRESH_T1_N69  16'h0386  // f2 t=  3.52 L=70 R=71
`define THRESH_T1_N72  16'h02AE  // f8 t=  2.68 L=73 R=74
`define THRESH_T1_N75  16'hFE08  // f3 t= -1.97 L=76 R=83
`define THRESH_T1_N76  16'h215E  // f5 t= 33.37 L=77 R=80
`define THRESH_T1_N77  16'h0052  // f4 t=  0.32 L=78 R=79
`define THRESH_T1_N80  16'h2D88  // f6 t= 45.53 L=81 R=82
`define THRESH_T1_N83  16'h02A6  // f8 t=  2.65 L=84 R=87
`define THRESH_T1_N84  16'h2084  // f0 t= 32.52 L=85 R=86
`define THRESH_T1_N87  16'h0446  // f2 t=  4.27 L=88 R=89
`define THRESH_T1_N90  16'h239E  // f5 t= 35.62 L=91 R=106
`define THRESH_T1_N91  16'h0364  // f2 t=  3.39 L=92 R=99
`define THRESH_T1_N92  16'h02A8  // f8 t=  2.66 L=93 R=96
`define THRESH_T1_N93  16'h0198  // f3 t=  1.59 L=94 R=95
`define THRESH_T1_N96  16'h0628  // f9 t=  6.16 L=97 R=98
`define THRESH_T1_N99  16'h02AA  // f8 t=  2.67 L=100 R=103
`define THRESH_T1_N100  16'hFEAD  // f4 t= -1.32 L=101 R=102
`define THRESH_T1_N103  16'h036E  // f2 t=  3.43 L=104 R=105
`define THRESH_T1_N106  16'h2194  // f0 t= 33.58 L=107 R=114
`define THRESH_T1_N107  16'h25FE  // f5 t= 37.99 L=108 R=111
`define THRESH_T1_N108  16'h213C  // f0 t= 33.23 L=109 R=110
`define THRESH_T1_N111  16'h246E  // f7 t= 36.43 L=112 R=113
`define THRESH_T1_N114  16'h24E4  // f0 t= 36.89 L=115 R=118
`define THRESH_T1_N115  16'h011D  // f4 t=  1.11 L=116 R=117
`define THRESH_T1_N118  16'hFAE4  // f3 t= -5.11 L=119 R=120
// Tree 2 (class=0):
`define THRESH_T2_N 0  16'h201C  // f0 t= 32.11 L=1 R=60
`define THRESH_T2_N 1  16'h029E  // f8 t=  2.62 L=2 R=29
`define THRESH_T2_N 2  16'h1B82  // f0 t= 27.51 L=3 R=14
`define THRESH_T2_N 3  16'h19E8  // f0 t= 25.90 L=4 R=9
`define THRESH_T2_N 4  16'hFD1E  // f4 t= -2.88 L=5 R=6
`define THRESH_T2_N 6  16'h1878  // f0 t= 24.47 L=7 R=8
`define THRESH_T2_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T2_N10  16'h1BA2  // f5 t= 27.63 L=11 R=12
`define THRESH_T2_N14  16'h1D20  // f5 t= 29.12 L=15 R=22
`define THRESH_T2_N15  16'h008A  // f2 t=  0.54 L=16 R=19
`define THRESH_T2_N16  16'h2F16  // f6 t= 47.09 L=17 R=18
`define THRESH_T2_N19  16'h029A  // f8 t=  2.60 L=20 R=21
`define THRESH_T2_N22  16'h00E1  // f2 t=  0.88 L=23 R=26
`define THRESH_T2_N23  16'hFEAF  // f3 t= -1.32 L=24 R=25
`define THRESH_T2_N26  16'hFF92  // f3 t= -0.43 L=27 R=28
`define THRESH_T2_N29  16'h1F02  // f5 t= 31.01 L=30 R=45
`define THRESH_T2_N30  16'h02A0  // f8 t=  2.63 L=31 R=38
`define THRESH_T2_N31  16'hFCFF  // f9 t= -3.00 L=32 R=35
`define THRESH_T2_N32  16'hFCD6  // f9 t= -3.16 L=33 R=34
`define THRESH_T2_N35  16'h01E6  // f2 t=  1.90 L=36 R=37
`define THRESH_T2_N38  16'h1A86  // f1 t= 26.52 L=39 R=42
`define THRESH_T2_N39  16'h17C6  // f1 t= 23.78 L=40 R=41
`define THRESH_T2_N42  16'h1AA0  // f1 t= 26.63 L=43 R=44
`define THRESH_T2_N45  16'h1EDC  // f0 t= 30.86 L=46 R=53
`define THRESH_T2_N46  16'h020E  // f2 t=  2.05 L=47 R=50
`define THRESH_T2_N47  16'hFD2F  // f9 t= -2.82 L=48 R=49
`define THRESH_T2_N50  16'hFB08  // f9 t= -4.97 L=51 R=52
`define THRESH_T2_N53  16'h0098  // f4 t=  0.60 L=54 R=57
`define THRESH_T2_N54  16'h006C  // f3 t=  0.42 L=55 R=56
`define THRESH_T2_N57  16'h1F0E  // f5 t= 31.06 L=58 R=59
`define THRESH_T2_N60  16'h21AA  // f5 t= 33.66 L=61 R=92
`define THRESH_T2_N61  16'h1FD0  // f5 t= 31.81 L=62 R=77
`define THRESH_T2_N62  16'h1B25  // f1 t= 27.14 L=63 R=70
`define THRESH_T2_N63  16'h072F  // f9 t=  7.18 L=64 R=67
`define THRESH_T2_N64  16'h02E8  // f9 t=  2.91 L=65 R=66
`define THRESH_T2_N67  16'h0234  // f4 t=  2.20 L=68 R=69
`define THRESH_T2_N70  16'h02AC  // f8 t=  2.67 L=71 R=74
`define THRESH_T2_N71  16'h0386  // f2 t=  3.52 L=72 R=73
`define THRESH_T2_N74  16'h25EF  // f7 t= 37.93 L=75 R=76
`define THRESH_T2_N77  16'h0404  // f2 t=  4.02 L=78 R=85
`define THRESH_T2_N78  16'h02A4  // f8 t=  2.64 L=79 R=82
`define THRESH_T2_N79  16'h0017  // f4 t=  0.09 L=80 R=81
`define THRESH_T2_N82  16'hFE08  // f3 t= -1.97 L=83 R=84
`define THRESH_T2_N85  16'h014E  // f4 t=  1.31 L=86 R=89
`define THRESH_T2_N86  16'hFE45  // f4 t= -1.73 L=87 R=88
`define THRESH_T2_N89  16'h2284  // f0 t= 34.52 L=90 R=91
`define THRESH_T2_N92  16'h239E  // f5 t= 35.62 L=93 R=108
`define THRESH_T2_N93  16'h0364  // f2 t=  3.39 L=94 R=101
`define THRESH_T2_N94  16'h20FE  // f0 t= 32.99 L=95 R=98
`define THRESH_T2_N95  16'h0092  // f3 t=  0.57 L=96 R=97
`define THRESH_T2_N98  16'h0628  // f9 t=  6.16 L=99 R=100
`define THRESH_T2_N101  16'h02AA  // f8 t=  2.67 L=102 R=105
`define THRESH_T2_N102  16'hFEAD  // f4 t= -1.32 L=103 R=104
`define THRESH_T2_N105  16'h036E  // f2 t=  3.43 L=106 R=107
`define THRESH_T2_N108  16'h2194  // f0 t= 33.58 L=109 R=116
`define THRESH_T2_N109  16'h25B6  // f5 t= 37.71 L=110 R=113
`define THRESH_T2_N110  16'h213C  // f0 t= 33.23 L=111 R=112
`define THRESH_T2_N113  16'h3092  // f6 t= 48.57 L=114 R=115
`define THRESH_T2_N116  16'h256E  // f1 t= 37.43 L=117 R=120
`define THRESH_T2_N117  16'hFC86  // f3 t= -3.48 L=118 R=119
`define THRESH_T2_N120  16'h229D  // f0 t= 34.61 L=121 R=122
// Tree 3 (class=0):
`define THRESH_T3_N 0  16'h2038  // f0 t= 32.22 L=1 R=60
`define THRESH_T3_N 1  16'h1D50  // f0 t= 29.31 L=2 R=29
`define THRESH_T3_N 2  16'h1B82  // f0 t= 27.51 L=3 R=14
`define THRESH_T3_N 3  16'h19E8  // f0 t= 25.90 L=4 R=9
`define THRESH_T3_N 4  16'h0730  // f2 t=  7.19 L=5 R=8
`define THRESH_T3_N 5  16'h1878  // f0 t= 24.47 L=6 R=7
`define THRESH_T3_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T3_N10  16'h1BA2  // f5 t= 27.63 L=11 R=12
`define THRESH_T3_N14  16'h029A  // f8 t=  2.60 L=15 R=22
`define THRESH_T3_N15  16'hFBF6  // f9 t= -4.04 L=16 R=19
`define THRESH_T3_N16  16'h0251  // f2 t=  2.32 L=17 R=18
`define THRESH_T3_N19  16'h1CBA  // f0 t= 28.72 L=20 R=21
`define THRESH_T3_N22  16'h0073  // f2 t=  0.45 L=23 R=26
`define THRESH_T3_N23  16'h26B7  // f7 t= 38.71 L=24 R=25
`define THRESH_T3_N26  16'h1CBE  // f1 t= 28.74 L=27 R=28
`define THRESH_T3_N29  16'h1F38  // f5 t= 31.22 L=30 R=45
`define THRESH_T3_N30  16'h02A0  // f8 t=  2.63 L=31 R=38
`define THRESH_T3_N31  16'hFE24  // f9 t= -1.86 L=32 R=35
`define THRESH_T3_N32  16'hFEB9  // f3 t= -1.28 L=33 R=34
`define THRESH_T3_N35  16'h00BC  // f2 t=  0.73 L=36 R=37
`define THRESH_T3_N38  16'h1D9E  // f1 t= 29.62 L=39 R=42
`define THRESH_T3_N39  16'h1A86  // f1 t= 26.52 L=40 R=41
`define THRESH_T3_N42  16'hFFD4  // f4 t= -0.17 L=43 R=44
`define THRESH_T3_N45  16'h02A4  // f8 t=  2.64 L=46 R=53
`define THRESH_T3_N46  16'h02F2  // f2 t=  2.94 L=47 R=50
`define THRESH_T3_N47  16'hFD0E  // f3 t= -2.95 L=48 R=49
`define THRESH_T3_N50  16'h2138  // f1 t= 33.22 L=51 R=52
`define THRESH_T3_N53  16'h03E2  // f2 t=  3.88 L=54 R=57
`define THRESH_T3_N54  16'h1EC7  // f0 t= 30.78 L=55 R=56
`define THRESH_T3_N57  16'h051C  // f2 t=  5.11 L=58 R=59
`define THRESH_T3_N60  16'h21F8  // f5 t= 33.97 L=61 R=90
`define THRESH_T3_N61  16'h1FD0  // f5 t= 31.81 L=62 R=75
`define THRESH_T3_N62  16'h1BA9  // f5 t= 27.66 L=63 R=68
`define THRESH_T3_N63  16'h17F6  // f1 t= 23.96 L=64 R=65
`define THRESH_T3_N65  16'h03F0  // f2 t=  3.94 L=66 R=67
`define THRESH_T3_N68  16'h03A2  // f2 t=  3.63 L=69 R=72
`define THRESH_T3_N69  16'h210C  // f0 t= 33.05 L=70 R=71
`define THRESH_T3_N72  16'h02AC  // f8 t=  2.67 L=73 R=74
`define THRESH_T3_N75  16'h019A  // f2 t=  1.60 L=76 R=83
`define THRESH_T3_N76  16'h2096  // f0 t= 32.59 L=77 R=80
`define THRESH_T3_N77  16'h0040  // f9 t=  0.25 L=78 R=79
`define THRESH_T3_N80  16'h004E  // f4 t=  0.30 L=81 R=82
`define THRESH_T3_N83  16'h2146  // f0 t= 33.27 L=84 R=87
`define THRESH_T3_N84  16'h03AA  // f2 t=  3.67 L=85 R=86
`define THRESH_T3_N87  16'hFDFE  // f3 t= -2.01 L=88 R=89
`define THRESH_T3_N90  16'h22EC  // f0 t= 34.92 L=91 R=106
`define THRESH_T3_N91  16'h00AE  // f4 t=  0.68 L=92 R=99
`define THRESH_T3_N92  16'h2194  // f0 t= 33.58 L=93 R=96
`define THRESH_T3_N93  16'h00D5  // f3 t=  0.83 L=94 R=95
`define THRESH_T3_N96  16'hFBE4  // f3 t= -4.11 L=97 R=98
`define THRESH_T3_N99  16'h23A6  // f5 t= 35.65 L=100 R=103
`define THRESH_T3_N100  16'h324C  // f6 t= 50.30 L=101 R=102
`define THRESH_T3_N103  16'h21A0  // f0 t= 33.62 L=104 R=105
`define THRESH_T3_N106  16'h2298  // f1 t= 34.60 L=107 R=114
`define THRESH_T3_N107  16'h225E  // f1 t= 34.37 L=108 R=111
`define THRESH_T3_N108  16'h0106  // f4 t=  1.03 L=109 R=110
`define THRESH_T3_N111  16'h22F6  // f5 t= 34.96 L=112 R=113
`define THRESH_T3_N114  16'h243A  // f0 t= 36.23 L=115 R=118
`define THRESH_T3_N115  16'h036E  // f2 t=  3.43 L=116 R=117
`define THRESH_T3_N118  16'hFAE4  // f3 t= -5.11 L=119 R=120
// Tree 4 (class=0):
`define THRESH_T4_N 0  16'h2038  // f0 t= 32.22 L=1 R=60
`define THRESH_T4_N 1  16'h029E  // f8 t=  2.62 L=2 R=29
`define THRESH_T4_N 2  16'h1B82  // f0 t= 27.51 L=3 R=14
`define THRESH_T4_N 3  16'h1912  // f0 t= 25.07 L=4 R=9
`define THRESH_T4_N 4  16'hFD1E  // f4 t= -2.88 L=5 R=6
`define THRESH_T4_N 6  16'h1960  // f5 t= 25.37 L=7 R=8
`define THRESH_T4_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T4_N10  16'h1A2E  // f0 t= 26.18 L=11 R=12
`define THRESH_T4_N14  16'h1D20  // f5 t= 29.12 L=15 R=22
`define THRESH_T4_N15  16'h008A  // f2 t=  0.54 L=16 R=19
`define THRESH_T4_N16  16'h0088  // f2 t=  0.53 L=17 R=18
`define THRESH_T4_N19  16'hFF16  // f3 t= -0.91 L=20 R=21
`define THRESH_T4_N22  16'h00E1  // f2 t=  0.88 L=23 R=26
`define THRESH_T4_N23  16'h1D08  // f1 t= 29.03 L=24 R=25
`define THRESH_T4_N26  16'h02CE  // f2 t=  2.80 L=27 R=28
`define THRESH_T4_N29  16'h1EFE  // f5 t= 30.99 L=30 R=45
`define THRESH_T4_N30  16'h1E50  // f0 t= 30.31 L=31 R=38
`define THRESH_T4_N31  16'h1D0A  // f5 t= 29.04 L=32 R=35
`define THRESH_T4_N32  16'hFD9C  // f3 t= -2.39 L=33 R=34
`define THRESH_T4_N35  16'hFEF4  // f3 t= -1.04 L=36 R=37
`define THRESH_T4_N38  16'h0154  // f2 t=  1.33 L=39 R=42
`define THRESH_T4_N39  16'h0074  // f4 t=  0.45 L=40 R=41
`define THRESH_T4_N42  16'h1E5A  // f0 t= 30.35 L=43 R=44
`define THRESH_T4_N45  16'h1EDE  // f0 t= 30.87 L=46 R=53
`define THRESH_T4_N46  16'hFED4  // f3 t= -1.17 L=47 R=50
`define THRESH_T4_N47  16'h2DBD  // f6 t= 45.74 L=48 R=49
`define THRESH_T4_N50  16'h020E  // f2 t=  2.05 L=51 R=52
`define THRESH_T4_N53  16'h03E0  // f2 t=  3.87 L=54 R=57
`define THRESH_T4_N54  16'h22F4  // f7 t= 34.95 L=55 R=56
`define THRESH_T4_N57  16'h22C2  // f5 t= 34.76 L=58 R=59
`define THRESH_T4_N60  16'h21B0  // f5 t= 33.69 L=61 R=90
`define THRESH_T4_N61  16'h1F14  // f1 t= 31.08 L=62 R=75
`define THRESH_T4_N62  16'h1BA9  // f5 t= 27.66 L=63 R=68
`define THRESH_T4_N63  16'h17F6  // f1 t= 23.96 L=64 R=65
`define THRESH_T4_N65  16'h199C  // f1 t= 25.61 L=66 R=67
`define THRESH_T4_N68  16'h20F6  // f0 t= 32.96 L=69 R=72
`define THRESH_T4_N69  16'h1C2A  // f1 t= 28.16 L=70 R=71
`define THRESH_T4_N72  16'h1E21  // f5 t= 30.13 L=73 R=74
`define THRESH_T4_N75  16'h02AC  // f8 t=  2.67 L=76 R=83
`define THRESH_T4_N76  16'h01B2  // f2 t=  1.70 L=77 R=80
`define THRESH_T4_N77  16'h0520  // f3 t=  5.12 L=78 R=79
`define THRESH_T4_N80  16'h2146  // f0 t= 33.27 L=81 R=82
`define THRESH_T4_N83  16'h21AD  // f7 t= 33.68 L=84 R=87
`define THRESH_T4_N84  16'h338A  // f6 t= 51.54 L=85 R=86
`define THRESH_T4_N87  16'h27B0  // f7 t= 39.69 L=88 R=89
`define THRESH_T4_N90  16'h239E  // f5 t= 35.62 L=91 R=106
`define THRESH_T4_N91  16'h0364  // f2 t=  3.39 L=92 R=99
`define THRESH_T4_N92  16'h02A8  // f8 t=  2.66 L=93 R=96
`define THRESH_T4_N93  16'h0198  // f3 t=  1.59 L=94 R=95
`define THRESH_T4_N96  16'h2104  // f0 t= 33.01 L=97 R=98
`define THRESH_T4_N99  16'hFE6A  // f3 t= -1.59 L=100 R=103
`define THRESH_T4_N100  16'h0995  // f9 t=  9.58 L=101 R=102
`define THRESH_T4_N103  16'h02AA  // f8 t=  2.66 L=104 R=105
`define THRESH_T4_N106  16'h2194  // f0 t= 33.58 L=107 R=112
`define THRESH_T4_N107  16'h2192  // f0 t= 33.57 L=108 R=111
`define THRESH_T4_N108  16'hFB78  // f3 t= -4.53 L=109 R=110
`define THRESH_T4_N112  16'h256E  // f1 t= 37.43 L=113 R=116
`define THRESH_T4_N113  16'hFC86  // f3 t= -3.48 L=114 R=115
`define THRESH_T4_N116  16'h229D  // f0 t= 34.61 L=117 R=118
// Tree 5 (class=0):
`define THRESH_T5_N 0  16'h2038  // f0 t= 32.22 L=1 R=60
`define THRESH_T5_N 1  16'h1D50  // f0 t= 29.31 L=2 R=29
`define THRESH_T5_N 2  16'h1B82  // f0 t= 27.51 L=3 R=14
`define THRESH_T5_N 3  16'h028A  // f8 t=  2.54 L=4 R=9
`define THRESH_T5_N 4  16'h0730  // f2 t=  7.19 L=5 R=8
`define THRESH_T5_N 5  16'h00A0  // f2 t=  0.62 L=6 R=7
`define THRESH_T5_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T5_N10  16'h0292  // f8 t=  2.57 L=11 R=12
`define THRESH_T5_N14  16'h1BD6  // f5 t= 27.83 L=15 R=22
`define THRESH_T5_N15  16'h1D4C  // f0 t= 29.30 L=16 R=19
`define THRESH_T5_N16  16'h008E  // f4 t=  0.56 L=17 R=18
`define THRESH_T5_N19  16'h1AEE  // f5 t= 26.93 L=20 R=21
`define THRESH_T5_N22  16'hFF9A  // f3 t= -0.40 L=23 R=26
`define THRESH_T5_N23  16'h31E8  // f6 t= 49.90 L=24 R=25
`define THRESH_T5_N26  16'h0156  // f3 t=  1.34 L=27 R=28
`define THRESH_T5_N29  16'h1F38  // f5 t= 31.22 L=30 R=45
`define THRESH_T5_N30  16'h02A0  // f8 t=  2.63 L=31 R=38
`define THRESH_T5_N31  16'hFE24  // f9 t= -1.86 L=32 R=35
`define THRESH_T5_N32  16'hFEB9  // f3 t= -1.28 L=33 R=34
`define THRESH_T5_N35  16'hFFA6  // f4 t= -0.35 L=36 R=37
`define THRESH_T5_N38  16'h1A86  // f1 t= 26.52 L=39 R=42
`define THRESH_T5_N39  16'h2ABE  // f7 t= 42.74 L=40 R=41
`define THRESH_T5_N42  16'hFEC4  // f4 t= -1.23 L=43 R=44
`define THRESH_T5_N45  16'h02A4  // f8 t=  2.64 L=46 R=53
`define THRESH_T5_N46  16'h012E  // f2 t=  1.18 L=47 R=50
`define THRESH_T5_N47  16'hFE8E  // f9 t= -1.44 L=48 R=49
`define THRESH_T5_N50  16'h1F93  // f1 t= 31.57 L=51 R=52
`define THRESH_T5_N53  16'h020A  // f2 t=  2.04 L=54 R=57
`define THRESH_T5_N54  16'h000A  // f4 t=  0.04 L=55 R=56
`define THRESH_T5_N57  16'h301C  // f6 t= 48.11 L=58 R=59
`define THRESH_T5_N60  16'h2304  // f5 t= 35.02 L=61 R=92
`define THRESH_T5_N61  16'h1F1E  // f1 t= 31.12 L=62 R=77
`define THRESH_T5_N62  16'h02AA  // f8 t=  2.67 L=63 R=70
`define THRESH_T5_N63  16'h0622  // f3 t=  6.13 L=64 R=67
`define THRESH_T5_N64  16'h3359  // f6 t= 51.35 L=65 R=66
`define THRESH_T5_N67  16'h255E  // f7 t= 37.37 L=68 R=69
`define THRESH_T5_N70  16'h3138  // f6 t= 49.22 L=71 R=74
`define THRESH_T5_N71  16'h2CD2  // f6 t= 44.82 L=72 R=73
`define THRESH_T5_N74  16'h21D6  // f7 t= 33.84 L=75 R=76
`define THRESH_T5_N77  16'h21AA  // f0 t= 33.67 L=78 R=85
`define THRESH_T5_N78  16'h01B2  // f2 t=  1.70 L=79 R=82
`define THRESH_T5_N79  16'h28E2  // f7 t= 40.88 L=80 R=81
`define THRESH_T5_N82  16'hFF7A  // f4 t= -0.52 L=83 R=84
`define THRESH_T5_N85  16'h019A  // f2 t=  1.60 L=86 R=89
`define THRESH_T5_N86  16'h35D8  // f6 t= 53.84 L=87 R=88
`define THRESH_T5_N89  16'h02AC  // f8 t=  2.67 L=90 R=91
`define THRESH_T5_N92  16'h2194  // f0 t= 33.58 L=93 R=106
`define THRESH_T5_N93  16'hFB6C  // f3 t= -4.58 L=94 R=99
`define THRESH_T5_N94  16'hFDFA  // f9 t= -2.03 L=95 R=96
`define THRESH_T5_N96  16'h23B2  // f5 t= 35.70 L=97 R=98
`define THRESH_T5_N99  16'h2192  // f0 t= 33.57 L=100 R=103
`define THRESH_T5_N100  16'hFFFC  // f3 t= -0.01 L=101 R=102
`define THRESH_T5_N103  16'hFC70  // f3 t= -3.56 L=104 R=105
`define THRESH_T5_N106  16'h22A2  // f1 t= 34.63 L=107 R=112
`define THRESH_T5_N107  16'h02A8  // f8 t=  2.65 L=108 R=109
`define THRESH_T5_N109  16'hFF5C  // f3 t= -0.64 L=110 R=111
`define THRESH_T5_N112  16'h243A  // f0 t= 36.23 L=113 R=116
`define THRESH_T5_N113  16'h0645  // f9 t=  6.27 L=114 R=115
`define THRESH_T5_N116  16'hFAE4  // f3 t= -5.11 L=117 R=118
// Tree 6 (class=0):
`define THRESH_T6_N 0  16'h2038  // f0 t= 32.22 L=1 R=62
`define THRESH_T6_N 1  16'h1D50  // f0 t= 29.31 L=2 R=31
`define THRESH_T6_N 2  16'h1B82  // f0 t= 27.51 L=3 R=16
`define THRESH_T6_N 3  16'h196C  // f5 t= 25.42 L=4 R=11
`define THRESH_T6_N 4  16'h05EA  // f3 t=  5.92 L=5 R=8
`define THRESH_T6_N 5  16'h04C0  // f2 t=  4.75 L=6 R=7
`define THRESH_T6_N 8  16'h025D  // f2 t=  2.36 L=9 R=10
`define THRESH_T6_N11  16'h1842  // f1 t= 24.26 L=12 R=13
`define THRESH_T6_N13  16'h2AA0  // f6 t= 42.63 L=14 R=15
`define THRESH_T6_N16  16'h029A  // f8 t=  2.60 L=17 R=24
`define THRESH_T6_N17  16'hFBF6  // f9 t= -4.04 L=18 R=21
`define THRESH_T6_N18  16'h0251  // f2 t=  2.32 L=19 R=20
`define THRESH_T6_N21  16'h3288  // f6 t= 50.53 L=22 R=23
`define THRESH_T6_N24  16'h0073  // f2 t=  0.45 L=25 R=28
`define THRESH_T6_N25  16'h26B7  // f7 t= 38.71 L=26 R=27
`define THRESH_T6_N28  16'h34C7  // f6 t= 52.78 L=29 R=30
`define THRESH_T6_N31  16'h1F38  // f5 t= 31.22 L=32 R=47
`define THRESH_T6_N32  16'h1D0A  // f5 t= 29.04 L=33 R=40
`define THRESH_T6_N33  16'h1CF8  // f5 t= 28.97 L=34 R=37
`define THRESH_T6_N34  16'hFD0A  // f9 t= -2.96 L=35 R=36
`define THRESH_T6_N37  16'hFE4C  // f3 t= -1.71 L=38 R=39
`define THRESH_T6_N40  16'hFEF2  // f3 t= -1.05 L=41 R=44
`define THRESH_T6_N41  16'h1DA6  // f0 t= 29.65 L=42 R=43
`define THRESH_T6_N44  16'h0348  // f2 t=  3.28 L=45 R=46
`define THRESH_T6_N47  16'h02A4  // f8 t=  2.64 L=48 R=55
`define THRESH_T6_N48  16'h02F2  // f2 t=  2.94 L=49 R=52
`define THRESH_T6_N49  16'h00E0  // f3 t=  0.88 L=50 R=51
`define THRESH_T6_N52  16'hF9D0  // f9 t= -6.19 L=53 R=54
`define THRESH_T6_N55  16'h03E2  // f2 t=  3.88 L=56 R=59
`define THRESH_T6_N56  16'hFAD2  // f9 t= -5.18 L=57 R=58
`define THRESH_T6_N59  16'h051C  // f2 t=  5.11 L=60 R=61
`define THRESH_T6_N62  16'h21B0  // f5 t= 33.69 L=63 R=94
`define THRESH_T6_N63  16'h1F1E  // f1 t= 31.12 L=64 R=79
`define THRESH_T6_N64  16'h02AA  // f8 t=  2.67 L=65 R=72
`define THRESH_T6_N65  16'h0622  // f3 t=  6.13 L=66 R=69
`define THRESH_T6_N66  16'h3359  // f6 t= 51.35 L=67 R=68
`define THRESH_T6_N69  16'h255E  // f7 t= 37.37 L=70 R=71
`define THRESH_T6_N72  16'h3138  // f6 t= 49.22 L=73 R=76
`define THRESH_T6_N73  16'h2CD2  // f6 t= 44.82 L=74 R=75
`define THRESH_T6_N76  16'h0292  // f9 t=  2.57 L=77 R=78
`define THRESH_T6_N79  16'h02A6  // f8 t=  2.65 L=80 R=87
`define THRESH_T6_N80  16'h00F6  // f2 t=  0.96 L=81 R=84
`define THRESH_T6_N81  16'h2084  // f0 t= 32.52 L=82 R=83
`define THRESH_T6_N84  16'h20E4  // f0 t= 32.89 L=85 R=86
`define THRESH_T6_N87  16'h02AC  // f8 t=  2.67 L=88 R=91
`define THRESH_T6_N88  16'h0548  // f3 t=  5.28 L=89 R=90
`define THRESH_T6_N91  16'h21AE  // f7 t= 33.68 L=92 R=93
`define THRESH_T6_N94  16'h22EC  // f0 t= 34.92 L=95 R=108
`define THRESH_T6_N95  16'h2092  // f1 t= 32.57 L=96 R=101
`define THRESH_T6_N96  16'h32CE  // f6 t= 50.80 L=97 R=100
`define THRESH_T6_N97  16'h0368  // f2 t=  3.40 L=98 R=99
`define THRESH_T6_N101  16'h0146  // f2 t=  1.28 L=102 R=105
`define THRESH_T6_N102  16'h0024  // f9 t=  0.14 L=103 R=104
`define THRESH_T6_N105  16'h2312  // f1 t= 35.07 L=106 R=107
`define THRESH_T6_N108  16'h24D0  // f5 t= 36.81 L=109 R=116
`define THRESH_T6_N109  16'h0339  // f2 t=  3.22 L=110 R=113
`define THRESH_T6_N110  16'h2E2E  // f6 t= 46.18 L=111 R=112
`define THRESH_T6_N113  16'h02AC  // f8 t=  2.67 L=114 R=115
`define THRESH_T6_N116  16'hFAE4  // f3 t= -5.11 L=117 R=120
`define THRESH_T6_N117  16'hFAE2  // f3 t= -5.12 L=118 R=119
`define THRESH_T6_N120  16'hFA50  // f9 t= -5.69 L=121 R=122
// Tree 7 (class=0):
`define THRESH_T7_N 0  16'h2090  // f0 t= 32.56 L=1 R=62
`define THRESH_T7_N 1  16'h02A0  // f8 t=  2.63 L=2 R=31
`define THRESH_T7_N 2  16'h029A  // f8 t=  2.60 L=3 R=18
`define THRESH_T7_N 3  16'h1A2E  // f0 t= 26.18 L=4 R=11
`define THRESH_T7_N 4  16'h1952  // f5 t= 25.32 L=5 R=8
`define THRESH_T7_N 5  16'h00A0  // f2 t=  0.62 L=6 R=7
`define THRESH_T7_N 8  16'h0730  // f2 t=  7.19 L=9 R=10
`define THRESH_T7_N11  16'h1CA8  // f0 t= 28.66 L=12 R=15
`define THRESH_T7_N12  16'hFD52  // f9 t= -2.68 L=13 R=14
`define THRESH_T7_N15  16'hFE3F  // f9 t= -1.75 L=16 R=17
`define THRESH_T7_N18  16'h1D09  // f5 t= 29.04 L=19 R=24
`define THRESH_T7_N19  16'h019C  // f4 t=  1.61 L=20 R=23
`define THRESH_T7_N20  16'h1EC4  // f0 t= 30.76 L=21 R=22
`define THRESH_T7_N24  16'h02CE  // f2 t=  2.80 L=25 R=28
`define THRESH_T7_N25  16'hFC4E  // f9 t= -3.69 L=26 R=27
`define THRESH_T7_N28  16'hFCF2  // f9 t= -3.06 L=29 R=30
`define THRESH_T7_N31  16'h1F26  // f1 t= 31.15 L=32 R=47
`define THRESH_T7_N32  16'hFFCE  // f4 t= -0.20 L=33 R=40
`define THRESH_T7_N33  16'h02AF  // f2 t=  2.68 L=34 R=37
`define THRESH_T7_N34  16'h02A6  // f8 t=  2.65 L=35 R=36
`define THRESH_T7_N37  16'hFC5E  // f9 t= -3.63 L=38 R=39
`define THRESH_T7_N40  16'h1D9C  // f1 t= 29.61 L=41 R=44
`define THRESH_T7_N41  16'h1E4A  // f5 t= 30.29 L=42 R=43
`define THRESH_T7_N44  16'h0248  // f2 t=  2.28 L=45 R=46
`define THRESH_T7_N47  16'h02A4  // f8 t=  2.64 L=48 R=55
`define THRESH_T7_N48  16'h0079  // f3 t=  0.47 L=49 R=52
`define THRESH_T7_N49  16'hFED6  // f3 t= -1.17 L=50 R=51
`define THRESH_T7_N52  16'hFF2C  // f9 t= -0.83 L=53 R=54
`define THRESH_T7_N55  16'h0048  // f4 t=  0.28 L=56 R=59
`define THRESH_T7_N56  16'h0034  // f4 t=  0.21 L=57 R=58
`define THRESH_T7_N59  16'h2259  // f7 t= 34.35 L=60 R=61
`define THRESH_T7_N62  16'h22F6  // f5 t= 34.96 L=63 R=94
`define THRESH_T7_N63  16'h1F2E  // f1 t= 31.18 L=64 R=79
`define THRESH_T7_N64  16'h2414  // f7 t= 36.08 L=65 R=72
`define THRESH_T7_N65  16'h01B6  // f2 t=  1.71 L=66 R=69
`define THRESH_T7_N66  16'h1E91  // f1 t= 30.57 L=67 R=68
`define THRESH_T7_N69  16'h21C4  // f0 t= 33.77 L=70 R=71
`define THRESH_T7_N72  16'h02AC  // f8 t=  2.67 L=73 R=76
`define THRESH_T7_N73  16'h03C6  // f3 t=  3.78 L=74 R=75
`define THRESH_T7_N76  16'h2549  // f0 t= 37.29 L=77 R=78
`define THRESH_T7_N79  16'hFE77  // f3 t= -1.54 L=80 R=87
`define THRESH_T7_N80  16'h0053  // f4 t=  0.32 L=81 R=84
`define THRESH_T7_N81  16'h227E  // f5 t= 34.49 L=82 R=83
`define THRESH_T7_N84  16'h22DF  // f5 t= 34.87 L=85 R=86
`define THRESH_T7_N87  16'h02AC  // f8 t=  2.67 L=88 R=91
`define THRESH_T7_N88  16'h0198  // f2 t=  1.60 L=89 R=90
`define THRESH_T7_N91  16'h21D0  // f7 t= 33.81 L=92 R=93
`define THRESH_T7_N94  16'h235C  // f0 t= 35.36 L=95 R=110
`define THRESH_T7_N95  16'hFCAC  // f3 t= -3.33 L=96 R=103
`define THRESH_T7_N96  16'h2353  // f1 t= 35.32 L=97 R=100
`define THRESH_T7_N97  16'h21CE  // f7 t= 33.80 L=98 R=99
`define THRESH_T7_N100  16'hFF20  // f4 t= -0.87 L=101 R=102
`define THRESH_T7_N103  16'h2268  // f1 t= 34.41 L=104 R=107
`define THRESH_T7_N104  16'h2124  // f7 t= 33.14 L=105 R=106
`define THRESH_T7_N107  16'h00B3  // f3 t=  0.70 L=108 R=109
`define THRESH_T7_N110  16'h256E  // f1 t= 37.43 L=111 R=116
`define THRESH_T7_N111  16'hFEE6  // f4 t= -1.10 L=112 R=113
`define THRESH_T7_N113  16'h02A2  // f2 t=  2.63 L=114 R=115
`define THRESH_T7_N116  16'hFAE4  // f3 t= -5.11 L=117 R=120
`define THRESH_T7_N117  16'hFAE2  // f3 t= -5.12 L=118 R=119
`define THRESH_T7_N120  16'hFA50  // f9 t= -5.69 L=121 R=122
// Tree 8 (class=0):
`define THRESH_T8_N 0  16'h2090  // f0 t= 32.56 L=1 R=58
`define THRESH_T8_N 1  16'h1E12  // f0 t= 30.07 L=2 R=27
`define THRESH_T8_N 2  16'h1B82  // f0 t= 27.51 L=3 R=14
`define THRESH_T8_N 3  16'h028A  // f8 t=  2.54 L=4 R=9
`define THRESH_T8_N 4  16'hFD1E  // f4 t= -2.88 L=5 R=6
`define THRESH_T8_N 6  16'h153C  // f1 t= 21.24 L=7 R=8
`define THRESH_T8_N 9  16'h0164  // f4 t=  1.39 L=10 R=13
`define THRESH_T8_N10  16'h007B  // f2 t=  0.48 L=11 R=12
`define THRESH_T8_N14  16'h1D0A  // f5 t= 29.04 L=15 R=20
`define THRESH_T8_N15  16'h019C  // f4 t=  1.61 L=16 R=19
`define THRESH_T8_N16  16'h00C6  // f2 t=  0.77 L=17 R=18
`define THRESH_T8_N20  16'hFF58  // f3 t= -0.66 L=21 R=24
`define THRESH_T8_N21  16'h35F0  // f6 t= 53.94 L=22 R=23
`define THRESH_T8_N24  16'h1E34  // f5 t= 30.21 L=25 R=26
`define THRESH_T8_N27  16'h1F94  // f1 t= 31.58 L=28 R=43
`define THRESH_T8_N28  16'h0150  // f2 t=  1.31 L=29 R=36
`define THRESH_T8_N29  16'h0077  // f4 t=  0.46 L=30 R=33
`define THRESH_T8_N30  16'h1D96  // f5 t= 29.58 L=31 R=32
`define THRESH_T8_N33  16'h014E  // f2 t=  1.30 L=34 R=35
`define THRESH_T8_N36  16'h26EC  // f7 t= 38.92 L=37 R=40
`define THRESH_T8_N37  16'h20A0  // f5 t= 32.63 L=38 R=39
`define THRESH_T8_N40  16'h0159  // f4 t=  1.35 L=41 R=42
`define THRESH_T8_N43  16'h006C  // f3 t=  0.42 L=44 R=51
`define THRESH_T8_N44  16'h1EE0  // f0 t= 30.88 L=45 R=48
`define THRESH_T8_N45  16'hFE68  // f3 t= -1.59 L=46 R=47
`define THRESH_T8_N48  16'h0328  // f2 t=  3.16 L=49 R=50
`define THRESH_T8_N51  16'h03A7  // f2 t=  3.65 L=52 R=55
`define THRESH_T8_N52  16'h1FC8  // f1 t= 31.78 L=53 R=54
`define THRESH_T8_N55  16'hFE24  // f4 t= -1.86 L=56 R=57
`define THRESH_T8_N58  16'h22F6  // f5 t= 34.96 L=59 R=90
`define THRESH_T8_N59  16'h1F2E  // f1 t= 31.18 L=60 R=75
`define THRESH_T8_N60  16'h30EC  // f6 t= 48.92 L=61 R=68
`define THRESH_T8_N61  16'h02AC  // f8 t=  2.67 L=62 R=65
`define THRESH_T8_N62  16'h2454  // f7 t= 36.33 L=63 R=64
`define THRESH_T8_N65  16'h2549  // f0 t= 37.29 L=66 R=67
`define THRESH_T8_N68  16'h01B6  // f2 t=  1.71 L=69 R=72
`define THRESH_T8_N69  16'h310A  // f6 t= 49.04 L=70 R=71
`define THRESH_T8_N72  16'h21A7  // f7 t= 33.65 L=73 R=74
`define THRESH_T8_N75  16'hFE77  // f3 t= -1.54 L=76 R=83
`define THRESH_T8_N76  16'h0053  // f4 t=  0.32 L=77 R=80
`define THRESH_T8_N77  16'h02A6  // f8 t=  2.65 L=78 R=79
`define THRESH_T8_N80  16'h22DF  // f5 t= 34.87 L=81 R=82
`define THRESH_T8_N83  16'h02AC  // f8 t=  2.67 L=84 R=87
`define THRESH_T8_N84  16'h0548  // f3 t=  5.28 L=85 R=86
`define THRESH_T8_N87  16'h1ECA  // f7 t= 30.79 L=88 R=89
`define THRESH_T8_N90  16'h232C  // f0 t= 35.17 L=91 R=106
`define THRESH_T8_N91  16'hFCAC  // f3 t= -3.33 L=92 R=99
`define THRESH_T8_N92  16'h2353  // f1 t= 35.32 L=93 R=96
`define THRESH_T8_N93  16'h21CE  // f7 t= 33.80 L=94 R=95
`define THRESH_T8_N96  16'h2728  // f1 t= 39.15 L=97 R=98
`define THRESH_T8_N99  16'h232A  // f0 t= 35.16 L=100 R=103
`define THRESH_T8_N100  16'h008C  // f4 t=  0.54 L=101 R=102
`define THRESH_T8_N103  16'h0076  // f3 t=  0.46 L=104 R=105
`define THRESH_T8_N106  16'h256E  // f1 t= 37.43 L=107 R=114
`define THRESH_T8_N107  16'hFEF6  // f4 t= -1.04 L=108 R=111
`define THRESH_T8_N108  16'h0180  // f3 t=  1.50 L=109 R=110
`define THRESH_T8_N111  16'h0364  // f2 t=  3.39 L=112 R=113
`define THRESH_T8_N114  16'hFAE4  // f3 t= -5.11 L=115 R=118
`define THRESH_T8_N115  16'hFAE2  // f3 t= -5.12 L=116 R=117
`define THRESH_T8_N118  16'hFA50  // f9 t= -5.69 L=119 R=120
// Tree 9 (class=0):
`define THRESH_T9_N 0  16'h2090  // f0 t= 32.56 L=1 R=64
`define THRESH_T9_N 1  16'h1E12  // f0 t= 30.07 L=2 R=33
`define THRESH_T9_N 2  16'h1C56  // f0 t= 28.33 L=3 R=18
`define THRESH_T9_N 3  16'h0292  // f8 t=  2.57 L=4 R=11
`define THRESH_T9_N 4  16'h1870  // f0 t= 24.44 L=5 R=8
`define THRESH_T9_N 5  16'h1E26  // f1 t= 30.15 L=6 R=7
`define THRESH_T9_N 8  16'h1B84  // f1 t= 27.51 L=9 R=10
`define THRESH_T9_N11  16'h0084  // f2 t=  0.52 L=12 R=15
`define THRESH_T9_N12  16'h23AC  // f7 t= 35.67 L=13 R=14
`define THRESH_T9_N15  16'h1C4E  // f0 t= 28.30 L=16 R=17
`define THRESH_T9_N18  16'h1D0E  // f5 t= 29.05 L=19 R=26
`define THRESH_T9_N19  16'h1C56  // f0 t= 28.34 L=20 R=23
`define THRESH_T9_N20  16'h2E84  // f6 t= 46.52 L=21 R=22
`define THRESH_T9_N23  16'h0108  // f4 t=  1.03 L=24 R=25
`define THRESH_T9_N26  16'hFF56  // f3 t= -0.66 L=27 R=30
`define THRESH_T9_N27  16'h035E  // f2 t=  3.37 L=28 R=29
`define THRESH_T9_N30  16'h34A5  // f6 t= 52.64 L=31 R=32
`define THRESH_T9_N33  16'h1F94  // f1 t= 31.58 L=34 R=49
`define THRESH_T9_N34  16'h281E  // f7 t= 40.12 L=35 R=42
`define THRESH_T9_N35  16'h1D9E  // f1 t= 29.62 L=36 R=39
`define THRESH_T9_N36  16'h1E4A  // f5 t= 30.29 L=37 R=38
`define THRESH_T9_N39  16'h1DA2  // f1 t= 29.63 L=40 R=41
`define THRESH_T9_N42  16'h1E20  // f0 t= 30.13 L=43 R=46
`define THRESH_T9_N43  16'h02A0  // f8 t=  2.63 L=44 R=45
`define THRESH_T9_N46  16'h02A4  // f8 t=  2.64 L=47 R=48
`define THRESH_T9_N49  16'h006C  // f3 t=  0.42 L=50 R=57
`define THRESH_T9_N50  16'h1FC4  // f0 t= 31.76 L=51 R=54
`define THRESH_T9_N51  16'h22D0  // f7 t= 34.81 L=52 R=53
`define THRESH_T9_N54  16'h033E  // f2 t=  3.24 L=55 R=56
`define THRESH_T9_N57  16'h02A6  // f8 t=  2.65 L=58 R=61
`define THRESH_T9_N58  16'hFECE  // f9 t= -1.19 L=59 R=60
`define THRESH_T9_N61  16'h20E8  // f5 t= 32.90 L=62 R=63
`define THRESH_T9_N64  16'h22AA  // f1 t= 34.66 L=65 R=96
`define THRESH_T9_N65  16'h1F2E  // f1 t= 31.18 L=66 R=81
`define THRESH_T9_N66  16'hFF9B  // f9 t= -0.39 L=67 R=74
`define THRESH_T9_N67  16'h2EFC  // f6 t= 46.99 L=68 R=71
`define THRESH_T9_N68  16'h01F0  // f2 t=  1.94 L=69 R=70
`define THRESH_T9_N71  16'h2542  // f7 t= 37.26 L=72 R=73
`define THRESH_T9_N74  16'h0084  // f9 t=  0.52 L=75 R=78
`define THRESH_T9_N75  16'h3058  // f6 t= 48.34 L=76 R=77
`define THRESH_T9_N78  16'h241E  // f7 t= 36.12 L=79 R=80
`define THRESH_T9_N81  16'hFE77  // f3 t= -1.54 L=82 R=89
`define THRESH_T9_N82  16'h241E  // f7 t= 36.12 L=83 R=86
`define THRESH_T9_N83  16'h3342  // f6 t= 51.26 L=84 R=85
`define THRESH_T9_N86  16'h0001  // f4 t=  0.00 L=87 R=88
`define THRESH_T9_N89  16'h02AC  // f8 t=  2.67 L=90 R=93
`define THRESH_T9_N90  16'h01B8  // f2 t=  1.72 L=91 R=92
`define THRESH_T9_N93  16'h332F  // f6 t= 51.18 L=94 R=95
`define THRESH_T9_N96  16'h2104  // f0 t= 33.01 L=97 R=112
`define THRESH_T9_N97  16'h31B1  // f6 t= 49.69 L=98 R=105
`define THRESH_T9_N98  16'h22F7  // f1 t= 34.96 L=99 R=102
`define THRESH_T9_N99  16'h2220  // f5 t= 34.12 L=100 R=101
`define THRESH_T9_N102  16'h0152  // f3 t=  1.32 L=103 R=104
`define THRESH_T9_N105  16'hFFD6  // f3 t= -0.17 L=106 R=109
`define THRESH_T9_N106  16'h20CE  // f0 t= 32.81 L=107 R=108
`define THRESH_T9_N109  16'h02B2  // f2 t=  2.70 L=110 R=111
`define THRESH_T9_N112  16'h23AA  // f0 t= 35.66 L=113 R=118
`define THRESH_T9_N113  16'h0430  // f3 t=  4.19 L=114 R=117
`define THRESH_T9_N114  16'h27F6  // f5 t= 39.96 L=115 R=116
`define THRESH_T9_N118  16'h24E4  // f0 t= 36.89 L=119 R=122
`define THRESH_T9_N119  16'h016F  // f4 t=  1.43 L=120 R=121
`define THRESH_T9_N122  16'hFAE4  // f3 t= -5.11 L=123 R=124

// --- Class MEDIUM Trees ---
// Tree 0 (class=1):
`define THRESH_T0_N 0  16'h02A2  // f8 t=  2.63 L=1 R=54
`define THRESH_T0_N 1  16'h029A  // f8 t=  2.60 L=2 R=29
`define THRESH_T0_N 2  16'h0290  // f8 t=  2.56 L=3 R=14
`define THRESH_T0_N 3  16'h466C  // f0 t= 70.42 L=4 R=9
`define THRESH_T0_N 4  16'h4616  // f1 t= 70.08 L=5 R=8
`define THRESH_T0_N 5  16'h0730  // f2 t=  7.19 L=6 R=7
`define THRESH_T0_N 9  16'hFDEE  // f9 t= -2.07 L=10 R=11
`define THRESH_T0_N11  16'h4784  // f0 t= 71.51 L=12 R=13
`define THRESH_T0_N14  16'h39A8  // f6 t= 57.66 L=15 R=22
`define THRESH_T0_N15  16'h0296  // f8 t=  2.58 L=16 R=19
`define THRESH_T0_N16  16'h4130  // f0 t= 65.19 L=17 R=18
`define THRESH_T0_N19  16'h1CD2  // f0 t= 28.82 L=20 R=21
`define THRESH_T0_N22  16'h01EC  // f3 t=  1.92 L=23 R=26
`define THRESH_T0_N23  16'h1A13  // f7 t= 26.07 L=24 R=25
`define THRESH_T0_N26  16'h3DDF  // f6 t= 61.87 L=27 R=28
`define THRESH_T0_N29  16'h380E  // f0 t= 56.05 L=30 R=45
`define THRESH_T0_N30  16'h1D10  // f5 t= 29.06 L=31 R=38
`define THRESH_T0_N31  16'h029C  // f8 t=  2.61 L=32 R=35
`define THRESH_T0_N32  16'h1D16  // f0 t= 29.09 L=33 R=34
`define THRESH_T0_N35  16'h1F06  // f0 t= 31.02 L=36 R=37
`define THRESH_T0_N38  16'h1D86  // f0 t= 29.52 L=39 R=42
`define THRESH_T0_N39  16'h001C  // f3 t=  0.11 L=40 R=41
`define THRESH_T0_N42  16'h3808  // f0 t= 56.03 L=43 R=44
`define THRESH_T0_N45  16'h029E  // f8 t=  2.62 L=46 R=53
`define THRESH_T0_N46  16'h00E2  // f9 t=  0.88 L=47 R=50
`define THRESH_T0_N47  16'h00D0  // f3 t=  0.81 L=48 R=49
`define THRESH_T0_N50  16'h0032  // f4 t=  0.20 L=51 R=52
`define THRESH_T0_N54  16'h2158  // f5 t= 33.35 L=55 R=86
`define THRESH_T0_N55  16'h1F4E  // f5 t= 31.30 L=56 R=71
`define THRESH_T0_N56  16'h20EC  // f0 t= 32.92 L=57 R=64
`define THRESH_T0_N57  16'h1BC2  // f5 t= 27.76 L=58 R=61
`define THRESH_T0_N58  16'h1914  // f5 t= 25.08 L=59 R=60
`define THRESH_T0_N61  16'h1E9C  // f5 t= 30.61 L=62 R=63
`define THRESH_T0_N64  16'h1E21  // f5 t= 30.13 L=65 R=68
`define THRESH_T0_N65  16'h1AD8  // f1 t= 26.85 L=66 R=67
`define THRESH_T0_N68  16'hFFFE  // f3 t= -0.01 L=69 R=70
`define THRESH_T0_N71  16'h02A4  // f8 t=  2.64 L=72 R=79
`define THRESH_T0_N72  16'h0180  // f2 t=  1.50 L=73 R=76
`define THRESH_T0_N73  16'h0090  // f3 t=  0.56 L=74 R=75
`define THRESH_T0_N76  16'hFED4  // f3 t= -1.17 L=77 R=78
`define THRESH_T0_N79  16'h022A  // f2 t=  2.16 L=80 R=83
`define THRESH_T0_N80  16'h2084  // f0 t= 32.52 L=81 R=82
`define THRESH_T0_N83  16'h20FB  // f0 t= 32.98 L=84 R=85
`define THRESH_T0_N86  16'h09F6  // f3 t=  9.96 L=87 R=102
`define THRESH_T0_N87  16'h2194  // f0 t= 33.58 L=88 R=95
`define THRESH_T0_N88  16'h0365  // f2 t=  3.39 L=89 R=92
`define THRESH_T0_N89  16'h1FFE  // f0 t= 31.99 L=90 R=91
`define THRESH_T0_N92  16'h240C  // f1 t= 36.05 L=93 R=94
`define THRESH_T0_N95  16'h22AA  // f1 t= 34.66 L=96 R=99
`define THRESH_T0_N96  16'hFE77  // f3 t= -1.54 L=97 R=98
`define THRESH_T0_N99  16'h1F98  // f7 t= 31.60 L=100 R=101
`define THRESH_T0_N102  16'h0394  // f2 t=  3.58 L=103 R=104
// Tree 1 (class=1):
`define THRESH_T1_N 0  16'h02A2  // f8 t=  2.63 L=1 R=58
`define THRESH_T1_N 1  16'h029A  // f8 t=  2.60 L=2 R=27
`define THRESH_T1_N 2  16'h0292  // f8 t=  2.57 L=3 R=16
`define THRESH_T1_N 3  16'h466C  // f0 t= 70.42 L=4 R=11
`define THRESH_T1_N 4  16'h4616  // f1 t= 70.08 L=5 R=8
`define THRESH_T1_N 5  16'h085A  // f2 t=  8.35 L=6 R=7
`define THRESH_T1_N 8  16'hFDE9  // f9 t= -2.09 L=9 R=10
`define THRESH_T1_N11  16'hFDEE  // f9 t= -2.07 L=12 R=13
`define THRESH_T1_N13  16'h028A  // f8 t=  2.54 L=14 R=15
`define THRESH_T1_N16  16'h3987  // f6 t= 57.53 L=17 R=24
`define THRESH_T1_N17  16'h017A  // f4 t=  1.48 L=18 R=21
`define THRESH_T1_N18  16'h3F58  // f1 t= 63.34 L=19 R=20
`define THRESH_T1_N21  16'hFBAE  // f3 t= -4.32 L=22 R=23
`define THRESH_T1_N24  16'h3905  // f1 t= 57.02 L=25 R=26
`define THRESH_T1_N27  16'h380E  // f0 t= 56.05 L=28 R=43
`define THRESH_T1_N28  16'h1D09  // f5 t= 29.04 L=29 R=36
`define THRESH_T1_N29  16'h029C  // f8 t=  2.61 L=30 R=33
`define THRESH_T1_N30  16'h0086  // f4 t=  0.53 L=31 R=32
`define THRESH_T1_N33  16'h1F06  // f0 t= 31.02 L=34 R=35
`define THRESH_T1_N36  16'h1D86  // f0 t= 29.52 L=37 R=40
`define THRESH_T1_N37  16'h001C  // f3 t=  0.11 L=38 R=39
`define THRESH_T1_N40  16'h3808  // f0 t= 56.03 L=41 R=42
`define THRESH_T1_N43  16'h029E  // f8 t=  2.62 L=44 R=51
`define THRESH_T1_N44  16'h01F2  // f3 t=  1.95 L=45 R=48
`define THRESH_T1_N45  16'h3AC7  // f0 t= 58.78 L=46 R=47
`define THRESH_T1_N48  16'h029C  // f8 t=  2.61 L=49 R=50
`define THRESH_T1_N51  16'h1740  // f7 t= 23.25 L=52 R=55
`define THRESH_T1_N52  16'h014A  // f9 t=  1.29 L=53 R=54
`define THRESH_T1_N55  16'hFD84  // f3 t= -2.48 L=56 R=57
`define THRESH_T1_N58  16'h2158  // f5 t= 33.35 L=59 R=90
`define THRESH_T1_N59  16'h1F4E  // f5 t= 31.30 L=60 R=75
`define THRESH_T1_N60  16'h20EC  // f0 t= 32.92 L=61 R=68
`define THRESH_T1_N61  16'h1BC2  // f5 t= 27.76 L=62 R=65
`define THRESH_T1_N62  16'h1914  // f5 t= 25.08 L=63 R=64
`define THRESH_T1_N65  16'h1EFD  // f1 t= 30.99 L=66 R=67
`define THRESH_T1_N68  16'h1E21  // f5 t= 30.13 L=69 R=72
`define THRESH_T1_N69  16'h2168  // f0 t= 33.41 L=70 R=71
`define THRESH_T1_N72  16'hFFFE  // f3 t= -0.01 L=73 R=74
`define THRESH_T1_N75  16'h02A4  // f8 t=  2.64 L=76 R=83
`define THRESH_T1_N76  16'h0180  // f2 t=  1.50 L=77 R=80
`define THRESH_T1_N77  16'h0090  // f3 t=  0.56 L=78 R=79
`define THRESH_T1_N80  16'hFED4  // f3 t= -1.17 L=81 R=82
`define THRESH_T1_N83  16'h022A  // f2 t=  2.16 L=84 R=87
`define THRESH_T1_N84  16'h2084  // f0 t= 32.52 L=85 R=86
`define THRESH_T1_N87  16'h02A8  // f8 t=  2.65 L=88 R=89
`define THRESH_T1_N90  16'h09F6  // f3 t=  9.96 L=91 R=106
`define THRESH_T1_N91  16'h2194  // f0 t= 33.58 L=92 R=99
`define THRESH_T1_N92  16'h0365  // f2 t=  3.39 L=93 R=96
`define THRESH_T1_N93  16'h1FFE  // f0 t= 31.99 L=94 R=95
`define THRESH_T1_N96  16'h240C  // f1 t= 36.05 L=97 R=98
`define THRESH_T1_N99  16'h22AA  // f1 t= 34.66 L=100 R=103
`define THRESH_T1_N100  16'hFE6A  // f3 t= -1.59 L=101 R=102
`define THRESH_T1_N103  16'h02B0  // f8 t=  2.69 L=104 R=105
`define THRESH_T1_N106  16'h2DB2  // f5 t= 45.70 L=107 R=112
`define THRESH_T1_N107  16'h0293  // f9 t=  2.57 L=108 R=109
`define THRESH_T1_N109  16'h2570  // f1 t= 37.44 L=110 R=111
// Tree 2 (class=1):
`define THRESH_T2_N 0  16'h02A2  // f8 t=  2.63 L=1 R=60
`define THRESH_T2_N 1  16'h029A  // f8 t=  2.60 L=2 R=31
`define THRESH_T2_N 2  16'h028E  // f8 t=  2.56 L=3 R=16
`define THRESH_T2_N 3  16'h37FB  // f6 t= 55.98 L=4 R=11
`define THRESH_T2_N 4  16'h1952  // f5 t= 25.32 L=5 R=8
`define THRESH_T2_N 5  16'h00A0  // f2 t=  0.62 L=6 R=7
`define THRESH_T2_N 8  16'h375B  // f6 t= 55.36 L=9 R=10
`define THRESH_T2_N11  16'hFDEE  // f9 t= -2.07 L=12 R=13
`define THRESH_T2_N13  16'h028A  // f8 t=  2.54 L=14 R=15
`define THRESH_T2_N16  16'h3A64  // f6 t= 58.39 L=17 R=24
`define THRESH_T2_N17  16'h0296  // f8 t=  2.58 L=18 R=21
`define THRESH_T2_N18  16'h4130  // f0 t= 65.19 L=19 R=20
`define THRESH_T2_N21  16'h1CD2  // f0 t= 28.82 L=22 R=23
`define THRESH_T2_N24  16'h4580  // f5 t= 69.50 L=25 R=28
`define THRESH_T2_N25  16'h430A  // f0 t= 67.04 L=26 R=27
`define THRESH_T2_N28  16'hFF8B  // f4 t= -0.46 L=29 R=30
`define THRESH_T2_N31  16'h380E  // f0 t= 56.05 L=32 R=47
`define THRESH_T2_N32  16'h1E3A  // f5 t= 30.23 L=33 R=40
`define THRESH_T2_N33  16'h1D09  // f5 t= 29.04 L=34 R=37
`define THRESH_T2_N34  16'h01A0  // f4 t=  1.63 L=35 R=36
`define THRESH_T2_N37  16'h2054  // f7 t= 32.33 L=38 R=39
`define THRESH_T2_N40  16'hFF54  // f3 t= -0.67 L=41 R=44
`define THRESH_T2_N41  16'h1DA6  // f0 t= 29.65 L=42 R=43
`define THRESH_T2_N44  16'h1F38  // f0 t= 31.22 L=45 R=46
`define THRESH_T2_N47  16'h029E  // f8 t=  2.62 L=48 R=55
`define THRESH_T2_N48  16'h01F2  // f3 t=  1.95 L=49 R=52
`define THRESH_T2_N49  16'h3AC7  // f0 t= 58.78 L=50 R=51
`define THRESH_T2_N52  16'h029C  // f8 t=  2.61 L=53 R=54
`define THRESH_T2_N55  16'h0814  // f3 t=  8.08 L=56 R=59
`define THRESH_T2_N56  16'hFFF4  // f4 t= -0.04 L=57 R=58
`define THRESH_T2_N60  16'h2158  // f5 t= 33.35 L=61 R=92
`define THRESH_T2_N61  16'h1F4E  // f5 t= 31.30 L=62 R=77
`define THRESH_T2_N62  16'h20EC  // f0 t= 32.92 L=63 R=70
`define THRESH_T2_N63  16'h1BC2  // f5 t= 27.76 L=64 R=67
`define THRESH_T2_N64  16'h17C6  // f1 t= 23.78 L=65 R=66
`define THRESH_T2_N67  16'h1F4A  // f5 t= 31.29 L=68 R=69
`define THRESH_T2_N70  16'h1E21  // f5 t= 30.13 L=71 R=74
`define THRESH_T2_N71  16'h2108  // f0 t= 33.03 L=72 R=73
`define THRESH_T2_N74  16'hFFFE  // f3 t= -0.01 L=75 R=76
`define THRESH_T2_N77  16'h02A4  // f8 t=  2.64 L=78 R=85
`define THRESH_T2_N78  16'h0180  // f2 t=  1.50 L=79 R=82
`define THRESH_T2_N79  16'h0090  // f3 t=  0.56 L=80 R=81
`define THRESH_T2_N82  16'hFED4  // f3 t= -1.17 L=83 R=84
`define THRESH_T2_N85  16'hFE3A  // f3 t= -1.78 L=86 R=89
`define THRESH_T2_N86  16'hFFEA  // f4 t= -0.08 L=87 R=88
`define THRESH_T2_N89  16'h01D8  // f2 t=  1.84 L=90 R=91
`define THRESH_T2_N92  16'h09F6  // f3 t=  9.96 L=93 R=108
`define THRESH_T2_N93  16'h2194  // f0 t= 33.58 L=94 R=101
`define THRESH_T2_N94  16'h0365  // f2 t=  3.39 L=95 R=98
`define THRESH_T2_N95  16'h1FFE  // f0 t= 31.99 L=96 R=97
`define THRESH_T2_N98  16'h240C  // f1 t= 36.05 L=99 R=100
`define THRESH_T2_N101  16'h22AA  // f1 t= 34.66 L=102 R=105
`define THRESH_T2_N102  16'hFE77  // f3 t= -1.54 L=103 R=104
`define THRESH_T2_N105  16'h1F98  // f7 t= 31.60 L=106 R=107
`define THRESH_T2_N108  16'h3612  // f6 t= 54.07 L=109 R=114
`define THRESH_T2_N109  16'h2D4E  // f0 t= 45.30 L=110 R=111
`define THRESH_T2_N111  16'h2570  // f1 t= 37.44 L=112 R=113
// Tree 3 (class=1):
`define THRESH_T3_N 0  16'h02A2  // f8 t=  2.63 L=1 R=62
`define THRESH_T3_N 1  16'h029A  // f8 t=  2.60 L=2 R=31
`define THRESH_T3_N 2  16'h0292  // f8 t=  2.57 L=3 R=16
`define THRESH_T3_N 3  16'h028C  // f8 t=  2.54 L=4 R=9
`define THRESH_T3_N 4  16'hFD1E  // f4 t= -2.88 L=5 R=6
`define THRESH_T3_N 6  16'h4784  // f0 t= 71.51 L=7 R=8
`define THRESH_T3_N 9  16'h4616  // f1 t= 70.08 L=10 R=13
`define THRESH_T3_N10  16'h085A  // f2 t=  8.35 L=11 R=12
`define THRESH_T3_N13  16'hFDE9  // f9 t= -2.09 L=14 R=15
`define THRESH_T3_N16  16'h1B79  // f7 t= 27.47 L=17 R=24
`define THRESH_T3_N17  16'h1AF4  // f7 t= 26.95 L=18 R=21
`define THRESH_T3_N18  16'h1A9C  // f7 t= 26.61 L=19 R=20
`define THRESH_T3_N21  16'h0296  // f8 t=  2.59 L=22 R=23
`define THRESH_T3_N24  16'h017A  // f4 t=  1.48 L=25 R=28
`define THRESH_T3_N25  16'h3F58  // f1 t= 63.34 L=26 R=27
`define THRESH_T3_N28  16'hFBAE  // f3 t= -4.32 L=29 R=30
`define THRESH_T3_N31  16'h380E  // f0 t= 56.05 L=32 R=47
`define THRESH_T3_N32  16'h029E  // f8 t=  2.62 L=33 R=40
`define THRESH_T3_N33  16'h1CB9  // f1 t= 28.72 L=34 R=37
`define THRESH_T3_N34  16'h1C78  // f5 t= 28.47 L=35 R=36
`define THRESH_T3_N37  16'h0074  // f2 t=  0.45 L=38 R=39
`define THRESH_T3_N40  16'h1E38  // f5 t= 30.22 L=41 R=44
`define THRESH_T3_N41  16'h3526  // f6 t= 53.15 L=42 R=43
`define THRESH_T3_N44  16'hFEF2  // f3 t= -1.06 L=45 R=46
`define THRESH_T3_N47  16'h029E  // f8 t=  2.62 L=48 R=55
`define THRESH_T3_N48  16'h01F2  // f3 t=  1.95 L=49 R=52
`define THRESH_T3_N49  16'h3AC7  // f0 t= 58.78 L=50 R=51
`define THRESH_T3_N52  16'h029C  // f8 t=  2.61 L=53 R=54
`define THRESH_T3_N55  16'hFFF4  // f4 t= -0.04 L=56 R=59
`define THRESH_T3_N56  16'h3924  // f1 t= 57.14 L=57 R=58
`define THRESH_T3_N59  16'hFFF6  // f4 t= -0.04 L=60 R=61
`define THRESH_T3_N62  16'h2158  // f5 t= 33.35 L=63 R=94
`define THRESH_T3_N63  16'h1F4E  // f5 t= 31.30 L=64 R=79
`define THRESH_T3_N64  16'h20EC  // f0 t= 32.92 L=65 R=72
`define THRESH_T3_N65  16'h1BE2  // f5 t= 27.88 L=66 R=69
`define THRESH_T3_N66  16'h2DF1  // f6 t= 45.94 L=67 R=68
`define THRESH_T3_N69  16'h1EFD  // f1 t= 30.99 L=70 R=71
`define THRESH_T3_N72  16'h1DA2  // f1 t= 29.63 L=73 R=76
`define THRESH_T3_N73  16'h1D9A  // f1 t= 29.60 L=74 R=75
`define THRESH_T3_N76  16'h02AA  // f8 t=  2.67 L=77 R=78
`define THRESH_T3_N79  16'h02A4  // f8 t=  2.64 L=80 R=87
`define THRESH_T3_N80  16'h0180  // f2 t=  1.50 L=81 R=84
`define THRESH_T3_N81  16'h0090  // f3 t=  0.56 L=82 R=83
`define THRESH_T3_N84  16'hFED4  // f3 t= -1.17 L=85 R=86
`define THRESH_T3_N87  16'hFE3A  // f3 t= -1.78 L=88 R=91
`define THRESH_T3_N88  16'hFFEA  // f4 t= -0.08 L=89 R=90
`define THRESH_T3_N91  16'h01D8  // f2 t=  1.84 L=92 R=93
`define THRESH_T3_N94  16'h09F6  // f3 t=  9.96 L=95 R=110
`define THRESH_T3_N95  16'h217E  // f0 t= 33.49 L=96 R=103
`define THRESH_T3_N96  16'h0365  // f2 t=  3.39 L=97 R=100
`define THRESH_T3_N97  16'h1FFE  // f0 t= 31.99 L=98 R=99
`define THRESH_T3_N100  16'h231E  // f5 t= 35.12 L=101 R=102
`define THRESH_T3_N103  16'h2304  // f5 t= 35.02 L=104 R=107
`define THRESH_T3_N104  16'h032E  // f2 t=  3.18 L=105 R=106
`define THRESH_T3_N107  16'h01C6  // f2 t=  1.77 L=108 R=109
`define THRESH_T3_N110  16'h3612  // f6 t= 54.07 L=111 R=116
`define THRESH_T3_N111  16'h0086  // f4 t=  0.52 L=112 R=113
`define THRESH_T3_N113  16'h2570  // f1 t= 37.44 L=114 R=115
// Tree 4 (class=1):
`define THRESH_T4_N 0  16'h02A2  // f8 t=  2.63 L=1 R=60
`define THRESH_T4_N 1  16'h0298  // f8 t=  2.60 L=2 R=31
`define THRESH_T4_N 2  16'h028E  // f8 t=  2.56 L=3 R=16
`define THRESH_T4_N 3  16'h365A  // f1 t= 54.35 L=4 R=9
`define THRESH_T4_N 4  16'h33A2  // f1 t= 51.63 L=5 R=8
`define THRESH_T4_N 5  16'h1952  // f5 t= 25.32 L=6 R=7
`define THRESH_T4_N 9  16'hFDEE  // f9 t= -2.07 L=10 R=13
`define THRESH_T4_N10  16'h467C  // f0 t= 70.48 L=11 R=12
`define THRESH_T4_N13  16'hFECA  // f3 t= -1.21 L=14 R=15
`define THRESH_T4_N16  16'h3A64  // f6 t= 58.39 L=17 R=24
`define THRESH_T4_N17  16'h0296  // f8 t=  2.58 L=18 R=21
`define THRESH_T4_N18  16'h4130  // f0 t= 65.19 L=19 R=20
`define THRESH_T4_N21  16'h202A  // f5 t= 32.16 L=22 R=23
`define THRESH_T4_N24  16'h3F95  // f6 t= 63.58 L=25 R=28
`define THRESH_T4_N25  16'h430A  // f0 t= 67.04 L=26 R=27
`define THRESH_T4_N28  16'h0290  // f8 t=  2.56 L=29 R=30
`define THRESH_T4_N31  16'h380E  // f0 t= 56.05 L=32 R=47
`define THRESH_T4_N32  16'h029E  // f8 t=  2.62 L=33 R=40
`define THRESH_T4_N33  16'h1CBA  // f1 t= 28.72 L=34 R=37
`define THRESH_T4_N34  16'h008A  // f2 t=  0.54 L=35 R=36
`define THRESH_T4_N37  16'h0074  // f2 t=  0.45 L=38 R=39
`define THRESH_T4_N40  16'h1E0C  // f5 t= 30.04 L=41 R=44
`define THRESH_T4_N41  16'hFEFF  // f4 t= -1.00 L=42 R=43
`define THRESH_T4_N44  16'hFF54  // f3 t= -0.67 L=45 R=46
`define THRESH_T4_N47  16'h029E  // f8 t=  2.62 L=48 R=55
`define THRESH_T4_N48  16'h3B71  // f5 t= 59.44 L=49 R=52
`define THRESH_T4_N49  16'h0030  // f4 t=  0.19 L=50 R=51
`define THRESH_T4_N52  16'h01EE  // f3 t=  1.93 L=53 R=54
`define THRESH_T4_N55  16'h0814  // f3 t=  8.08 L=56 R=59
`define THRESH_T4_N56  16'h1748  // f7 t= 23.28 L=57 R=58
`define THRESH_T4_N60  16'h2158  // f5 t= 33.35 L=61 R=92
`define THRESH_T4_N61  16'h1EF6  // f5 t= 30.96 L=62 R=77
`define THRESH_T4_N62  16'h2050  // f0 t= 32.31 L=63 R=70
`define THRESH_T4_N63  16'h0092  // f3 t=  0.57 L=64 R=67
`define THRESH_T4_N64  16'h019E  // f9 t=  1.62 L=65 R=66
`define THRESH_T4_N67  16'h3330  // f6 t= 51.19 L=68 R=69
`define THRESH_T4_N70  16'h1A64  // f1 t= 26.39 L=71 R=74
`define THRESH_T4_N71  16'h19E1  // f1 t= 25.88 L=72 R=73
`define THRESH_T4_N74  16'h206A  // f0 t= 32.41 L=75 R=76
`define THRESH_T4_N77  16'h2096  // f0 t= 32.58 L=78 R=85
`define THRESH_T4_N78  16'h0222  // f2 t=  2.13 L=79 R=82
`define THRESH_T4_N79  16'h1DCE  // f0 t= 29.81 L=80 R=81
`define THRESH_T4_N82  16'h1FE4  // f5 t= 31.89 L=83 R=84
`define THRESH_T4_N85  16'hFE38  // f3 t= -1.78 L=86 R=89
`define THRESH_T4_N86  16'h213F  // f5 t= 33.25 L=87 R=88
`define THRESH_T4_N89  16'h1FD0  // f5 t= 31.81 L=90 R=91
`define THRESH_T4_N92  16'h09F6  // f3 t=  9.96 L=93 R=108
`define THRESH_T4_N93  16'h217E  // f0 t= 33.49 L=94 R=101
`define THRESH_T4_N94  16'h0365  // f2 t=  3.39 L=95 R=98
`define THRESH_T4_N95  16'h0194  // f3 t=  1.58 L=96 R=97
`define THRESH_T4_N98  16'h02A8  // f8 t=  2.65 L=99 R=100
`define THRESH_T4_N101  16'h239E  // f5 t= 35.62 L=102 R=105
`define THRESH_T4_N102  16'h032E  // f2 t=  3.18 L=103 R=104
`define THRESH_T4_N105  16'h1F98  // f7 t= 31.60 L=106 R=107
`define THRESH_T4_N108  16'h3612  // f6 t= 54.07 L=109 R=114
`define THRESH_T4_N109  16'h2244  // f1 t= 34.26 L=110 R=111
`define THRESH_T4_N111  16'h2570  // f1 t= 37.44 L=112 R=113
// Tree 5 (class=1):
`define THRESH_T5_N 0  16'h02A2  // f8 t=  2.63 L=1 R=62
`define THRESH_T5_N 1  16'h0298  // f8 t=  2.60 L=2 R=31
`define THRESH_T5_N 2  16'h028E  // f8 t=  2.56 L=3 R=16
`define THRESH_T5_N 3  16'h1D05  // f7 t= 29.02 L=4 R=11
`define THRESH_T5_N 4  16'hFDEE  // f9 t= -2.07 L=5 R=8
`define THRESH_T5_N 5  16'h467C  // f0 t= 70.48 L=6 R=7
`define THRESH_T5_N 8  16'h028A  // f8 t=  2.54 L=9 R=10
`define THRESH_T5_N11  16'h1DA5  // f7 t= 29.64 L=12 R=13
`define THRESH_T5_N13  16'h1952  // f5 t= 25.32 L=14 R=15
`define THRESH_T5_N16  16'h1A9C  // f7 t= 26.61 L=17 R=24
`define THRESH_T5_N17  16'h3F95  // f6 t= 63.58 L=18 R=21
`define THRESH_T5_N18  16'h430A  // f0 t= 67.04 L=19 R=20
`define THRESH_T5_N21  16'hFFAE  // f4 t= -0.32 L=22 R=23
`define THRESH_T5_N24  16'h0296  // f8 t=  2.58 L=25 R=28
`define THRESH_T5_N25  16'h445F  // f0 t= 68.37 L=26 R=27
`define THRESH_T5_N28  16'h202A  // f5 t= 32.16 L=29 R=30
`define THRESH_T5_N31  16'h380E  // f0 t= 56.05 L=32 R=47
`define THRESH_T5_N32  16'h029E  // f8 t=  2.62 L=33 R=40
`define THRESH_T5_N33  16'h1CBA  // f1 t= 28.72 L=34 R=37
`define THRESH_T5_N34  16'hFF22  // f3 t= -0.87 L=35 R=36
`define THRESH_T5_N37  16'h1CBA  // f1 t= 28.73 L=38 R=39
`define THRESH_T5_N40  16'h1E42  // f5 t= 30.26 L=41 R=44
`define THRESH_T5_N41  16'h3526  // f6 t= 53.15 L=42 R=43
`define THRESH_T5_N44  16'h3808  // f0 t= 56.03 L=45 R=46
`define THRESH_T5_N47  16'h01F2  // f3 t=  1.95 L=48 R=55
`define THRESH_T5_N48  16'hFE8C  // f3 t= -1.46 L=49 R=52
`define THRESH_T5_N49  16'hFE8A  // f3 t= -1.46 L=50 R=51
`define THRESH_T5_N52  16'h029E  // f8 t=  2.62 L=53 R=54
`define THRESH_T5_N55  16'h029C  // f8 t=  2.61 L=56 R=59
`define THRESH_T5_N56  16'h00D4  // f9 t=  0.83 L=57 R=58
`define THRESH_T5_N59  16'h029E  // f8 t=  2.62 L=60 R=61
`define THRESH_T5_N62  16'h2158  // f5 t= 33.35 L=63 R=94
`define THRESH_T5_N63  16'h1F4E  // f5 t= 31.30 L=64 R=79
`define THRESH_T5_N64  16'h20EC  // f0 t= 32.92 L=65 R=72
`define THRESH_T5_N65  16'h1BC2  // f5 t= 27.76 L=66 R=69
`define THRESH_T5_N66  16'h2DF1  // f6 t= 45.94 L=67 R=68
`define THRESH_T5_N69  16'h1F4A  // f5 t= 31.29 L=70 R=71
`define THRESH_T5_N72  16'h1E21  // f5 t= 30.13 L=73 R=76
`define THRESH_T5_N73  16'h2168  // f0 t= 33.41 L=74 R=75
`define THRESH_T5_N76  16'h2330  // f7 t= 35.19 L=77 R=78
`define THRESH_T5_N79  16'h02A4  // f8 t=  2.64 L=80 R=87
`define THRESH_T5_N80  16'h0180  // f2 t=  1.50 L=81 R=84
`define THRESH_T5_N81  16'h006C  // f3 t=  0.42 L=82 R=83
`define THRESH_T5_N84  16'h229D  // f1 t= 34.61 L=85 R=86
`define THRESH_T5_N87  16'h022A  // f2 t=  2.16 L=88 R=91
`define THRESH_T5_N88  16'h1FC4  // f0 t= 31.77 L=89 R=90
`define THRESH_T5_N91  16'h02A8  // f8 t=  2.65 L=92 R=93
`define THRESH_T5_N94  16'h09F6  // f3 t=  9.96 L=95 R=110
`define THRESH_T5_N95  16'h2194  // f0 t= 33.58 L=96 R=103
`define THRESH_T5_N96  16'h1F9C  // f0 t= 31.61 L=97 R=100
`define THRESH_T5_N97  16'h1F5A  // f0 t= 31.35 L=98 R=99
`define THRESH_T5_N100  16'h0194  // f3 t=  1.58 L=101 R=102
`define THRESH_T5_N103  16'h2352  // f5 t= 35.32 L=104 R=107
`define THRESH_T5_N104  16'h047C  // f9 t=  4.48 L=105 R=106
`define THRESH_T5_N107  16'h1F98  // f7 t= 31.60 L=108 R=109
`define THRESH_T5_N110  16'h3612  // f6 t= 54.07 L=111 R=116
`define THRESH_T5_N111  16'h2244  // f1 t= 34.26 L=112 R=113
`define THRESH_T5_N113  16'h2570  // f1 t= 37.44 L=114 R=115
// Tree 6 (class=1):
`define THRESH_T6_N 0  16'h02A0  // f8 t=  2.63 L=1 R=58
`define THRESH_T6_N 1  16'h0298  // f8 t=  2.60 L=2 R=33
`define THRESH_T6_N 2  16'h028E  // f8 t=  2.56 L=3 R=18
`define THRESH_T6_N 3  16'h1A08  // f0 t= 26.03 L=4 R=11
`define THRESH_T6_N 4  16'h1952  // f5 t= 25.32 L=5 R=8
`define THRESH_T6_N 5  16'h00A0  // f2 t=  0.62 L=6 R=7
`define THRESH_T6_N 8  16'hFD1E  // f4 t= -2.88 L=9 R=10
`define THRESH_T6_N11  16'hFDEE  // f9 t= -2.07 L=12 R=15
`define THRESH_T6_N12  16'h1D6B  // f7 t= 29.42 L=13 R=14
`define THRESH_T6_N15  16'hFECA  // f3 t= -1.21 L=16 R=17
`define THRESH_T6_N18  16'h3A64  // f6 t= 58.39 L=19 R=26
`define THRESH_T6_N19  16'h0296  // f8 t=  2.58 L=20 R=23
`define THRESH_T6_N20  16'h4130  // f0 t= 65.19 L=21 R=22
`define THRESH_T6_N23  16'h202A  // f5 t= 32.16 L=24 R=25
`define THRESH_T6_N26  16'h156B  // f7 t= 21.42 L=27 R=30
`define THRESH_T6_N27  16'h1560  // f7 t= 21.37 L=28 R=29
`define THRESH_T6_N30  16'h449C  // f0 t= 68.61 L=31 R=32
`define THRESH_T6_N33  16'h356A  // f6 t= 53.42 L=34 R=49
`define THRESH_T6_N34  16'h029C  // f8 t=  2.61 L=35 R=42
`define THRESH_T6_N35  16'h01DE  // f3 t=  1.87 L=36 R=39
`define THRESH_T6_N36  16'h17FA  // f1 t= 23.98 L=37 R=38
`define THRESH_T6_N39  16'h010C  // f4 t=  1.05 L=40 R=41
`define THRESH_T6_N42  16'h226A  // f5 t= 34.41 L=43 R=46
`define THRESH_T6_N43  16'hFD1C  // f9 t= -2.89 L=44 R=45
`define THRESH_T6_N46  16'h1EB3  // f0 t= 30.70 L=47 R=48
`define THRESH_T6_N49  16'h07DD  // f3 t=  7.86 L=50 R=57
`define THRESH_T6_N50  16'h3ADC  // f5 t= 58.86 L=51 R=54
`define THRESH_T6_N51  16'h1D50  // f0 t= 29.31 L=52 R=53
`define THRESH_T6_N54  16'h3B26  // f1 t= 59.15 L=55 R=56
`define THRESH_T6_N58  16'h20FC  // f5 t= 32.99 L=59 R=90
`define THRESH_T6_N59  16'h1EE0  // f5 t= 30.87 L=60 R=75
`define THRESH_T6_N60  16'h2034  // f0 t= 32.21 L=61 R=68
`define THRESH_T6_N61  16'h1A86  // f1 t= 26.52 L=62 R=65
`define THRESH_T6_N62  16'h2ABE  // f7 t= 42.74 L=63 R=64
`define THRESH_T6_N65  16'h1AA0  // f1 t= 26.63 L=66 R=67
`define THRESH_T6_N68  16'h1BA9  // f5 t= 27.66 L=69 R=72
`define THRESH_T6_N69  16'h17F6  // f1 t= 23.96 L=70 R=71
`define THRESH_T6_N72  16'h2FC9  // f6 t= 47.79 L=73 R=74
`define THRESH_T6_N75  16'h2096  // f0 t= 32.58 L=76 R=83
`define THRESH_T6_N76  16'h021C  // f2 t=  2.11 L=77 R=80
`define THRESH_T6_N77  16'h1DCE  // f0 t= 29.81 L=78 R=79
`define THRESH_T6_N80  16'h1F90  // f5 t= 31.56 L=81 R=82
`define THRESH_T6_N83  16'hFE38  // f3 t= -1.78 L=84 R=87
`define THRESH_T6_N84  16'h02A8  // f8 t=  2.65 L=85 R=86
`define THRESH_T6_N87  16'h0398  // f2 t=  3.59 L=88 R=89
`define THRESH_T6_N90  16'h09F6  // f3 t=  9.96 L=91 R=106
`define THRESH_T6_N91  16'h20FE  // f0 t= 32.99 L=92 R=99
`define THRESH_T6_N92  16'h1F99  // f0 t= 31.60 L=93 R=96
`define THRESH_T6_N93  16'hFE24  // f4 t= -1.86 L=94 R=95
`define THRESH_T6_N96  16'h03A8  // f2 t=  3.66 L=97 R=98
`define THRESH_T6_N99  16'h22AA  // f1 t= 34.66 L=100 R=103
`define THRESH_T6_N100  16'hFE6A  // f3 t= -1.59 L=101 R=102
`define THRESH_T6_N103  16'h3939  // f1 t= 57.22 L=104 R=105
`define THRESH_T6_N106  16'h0394  // f2 t=  3.58 L=107 R=108
`define THRESH_T6_N108  16'h2554  // f5 t= 37.33 L=109 R=112
`define THRESH_T6_N109  16'h231D  // f7 t= 35.11 L=110 R=111
`define THRESH_T6_N112  16'h2570  // f1 t= 37.44 L=113 R=114
// Tree 7 (class=1):
`define THRESH_T7_N 0  16'h02A0  // f8 t=  2.63 L=1 R=56
`define THRESH_T7_N 1  16'h0296  // f8 t=  2.59 L=2 R=29
`define THRESH_T7_N 2  16'h028E  // f8 t=  2.56 L=3 R=16
`define THRESH_T7_N 3  16'h4784  // f0 t= 71.51 L=4 R=11
`define THRESH_T7_N 4  16'h475D  // f0 t= 71.36 L=5 R=8
`define THRESH_T7_N 5  16'h4822  // f5 t= 72.13 L=6 R=7
`define THRESH_T7_N 8  16'hFF6D  // f3 t= -0.57 L=9 R=10
`define THRESH_T7_N11  16'h3F14  // f5 t= 63.08 L=12 R=13
`define THRESH_T7_N13  16'hFF86  // f4 t= -0.47 L=14 R=15
`define THRESH_T7_N16  16'h1A9C  // f7 t= 26.61 L=17 R=24
`define THRESH_T7_N17  16'h3F95  // f6 t= 63.58 L=18 R=21
`define THRESH_T7_N18  16'h449C  // f0 t= 68.61 L=19 R=20
`define THRESH_T7_N21  16'h3FA0  // f6 t= 63.63 L=22 R=23
`define THRESH_T7_N24  16'h0CBC  // f9 t= 12.73 L=25 R=28
`define THRESH_T7_N25  16'h4130  // f0 t= 65.19 L=26 R=27
`define THRESH_T7_N29  16'h1F96  // f7 t= 31.58 L=30 R=41
`define THRESH_T7_N30  16'h07DD  // f3 t=  7.86 L=31 R=38
`define THRESH_T7_N31  16'h017C  // f2 t=  1.48 L=32 R=35
`define THRESH_T7_N32  16'h0164  // f2 t=  1.39 L=33 R=34
`define THRESH_T7_N35  16'h1E2C  // f5 t= 30.17 L=36 R=37
`define THRESH_T7_N38  16'h0140  // f4 t=  1.25 L=39 R=40
`define THRESH_T7_N41  16'h029C  // f8 t=  2.61 L=42 R=49
`define THRESH_T7_N42  16'h0118  // f3 t=  1.09 L=43 R=46
`define THRESH_T7_N43  16'h00D4  // f2 t=  0.83 L=44 R=45
`define THRESH_T7_N46  16'h04FE  // f9 t=  4.99 L=47 R=48
`define THRESH_T7_N49  16'h226A  // f5 t= 34.41 L=50 R=53
`define THRESH_T7_N50  16'hFD1C  // f9 t= -2.89 L=51 R=52
`define THRESH_T7_N53  16'h1EB3  // f0 t= 30.70 L=54 R=55
`define THRESH_T7_N56  16'h20FC  // f5 t= 32.99 L=57 R=88
`define THRESH_T7_N57  16'h1EE0  // f5 t= 30.87 L=58 R=73
`define THRESH_T7_N58  16'h02AA  // f8 t=  2.67 L=59 R=66
`define THRESH_T7_N59  16'h1A86  // f1 t= 26.52 L=60 R=63
`define THRESH_T7_N60  16'h171A  // f1 t= 23.10 L=61 R=62
`define THRESH_T7_N63  16'h0034  // f9 t=  0.20 L=64 R=65
`define THRESH_T7_N66  16'h23A2  // f7 t= 35.63 L=67 R=70
`define THRESH_T7_N67  16'h02CE  // f9 t=  2.81 L=68 R=69
`define THRESH_T7_N70  16'h2886  // f7 t= 40.52 L=71 R=72
`define THRESH_T7_N73  16'h02A4  // f8 t=  2.64 L=74 R=81
`define THRESH_T7_N74  16'h007A  // f3 t=  0.47 L=75 R=78
`define THRESH_T7_N75  16'hFF26  // f3 t= -0.85 L=76 R=77
`define THRESH_T7_N78  16'h345A  // f6 t= 52.35 L=79 R=80
`define THRESH_T7_N81  16'h022A  // f2 t=  2.16 L=82 R=85
`define THRESH_T7_N82  16'h1F58  // f5 t= 31.35 L=83 R=84
`define THRESH_T7_N85  16'h20B8  // f0 t= 32.72 L=86 R=87
`define THRESH_T7_N88  16'h09F6  // f3 t=  9.96 L=89 R=104
`define THRESH_T7_N89  16'h217E  // f0 t= 33.49 L=90 R=97
`define THRESH_T7_N90  16'h02A6  // f8 t=  2.65 L=91 R=94
`define THRESH_T7_N91  16'h252A  // f7 t= 37.16 L=92 R=93
`define THRESH_T7_N94  16'h0195  // f3 t=  1.58 L=95 R=96
`define THRESH_T7_N97  16'h38C6  // f5 t= 56.77 L=98 R=101
`define THRESH_T7_N98  16'h22AA  // f1 t= 34.66 L=99 R=100
`define THRESH_T7_N101  16'h38CC  // f5 t= 56.80 L=102 R=103
`define THRESH_T7_N104  16'h2BC9  // f1 t= 43.79 L=105 R=110
`define THRESH_T7_N105  16'h2490  // f5 t= 36.56 L=106 R=107
`define THRESH_T7_N107  16'h2500  // f1 t= 37.00 L=108 R=109
// Tree 8 (class=1):
`define THRESH_T8_N 0  16'h02A0  // f8 t=  2.63 L=1 R=60
`define THRESH_T8_N 1  16'h0296  // f8 t=  2.59 L=2 R=33
`define THRESH_T8_N 2  16'h028E  // f8 t=  2.56 L=3 R=18
`define THRESH_T8_N 3  16'h1A08  // f0 t= 26.03 L=4 R=11
`define THRESH_T8_N 4  16'h1878  // f0 t= 24.47 L=5 R=8
`define THRESH_T8_N 5  16'hFD1E  // f4 t= -2.88 L=6 R=7
`define THRESH_T8_N 8  16'h19AB  // f1 t= 25.67 L=9 R=10
`define THRESH_T8_N11  16'hFDEE  // f9 t= -2.07 L=12 R=15
`define THRESH_T8_N12  16'h1D6B  // f7 t= 29.42 L=13 R=14
`define THRESH_T8_N15  16'hFEE3  // f3 t= -1.11 L=16 R=17
`define THRESH_T8_N18  16'h1A9C  // f7 t= 26.61 L=19 R=26
`define THRESH_T8_N19  16'h3F95  // f6 t= 63.58 L=20 R=23
`define THRESH_T8_N20  16'h449C  // f0 t= 68.61 L=21 R=22
`define THRESH_T8_N23  16'h0136  // f2 t=  1.21 L=24 R=25
`define THRESH_T8_N26  16'h4130  // f0 t= 65.19 L=27 R=30
`define THRESH_T8_N27  16'h1C0E  // f0 t= 28.05 L=28 R=29
`define THRESH_T8_N30  16'hFF26  // f3 t= -0.85 L=31 R=32
`define THRESH_T8_N33  16'h356A  // f6 t= 53.42 L=34 R=49
`define THRESH_T8_N34  16'h029C  // f8 t=  2.61 L=35 R=42
`define THRESH_T8_N35  16'h0118  // f3 t=  1.09 L=36 R=39
`define THRESH_T8_N36  16'h00D0  // f2 t=  0.81 L=37 R=38
`define THRESH_T8_N39  16'h1D16  // f0 t= 29.09 L=40 R=41
`define THRESH_T8_N42  16'h226A  // f5 t= 34.41 L=43 R=46
`define THRESH_T8_N43  16'h34EE  // f6 t= 52.93 L=44 R=45
`define THRESH_T8_N46  16'h1EB3  // f0 t= 30.70 L=47 R=48
`define THRESH_T8_N49  16'h07DD  // f3 t=  7.86 L=50 R=57
`define THRESH_T8_N50  16'h017C  // f2 t=  1.48 L=51 R=54
`define THRESH_T8_N51  16'h0164  // f2 t=  1.39 L=52 R=53
`define THRESH_T8_N54  16'h1E2C  // f5 t= 30.17 L=55 R=56
`define THRESH_T8_N57  16'h0442  // f2 t=  4.26 L=58 R=59
`define THRESH_T8_N60  16'h2158  // f5 t= 33.35 L=61 R=92
`define THRESH_T8_N61  16'h1EE0  // f5 t= 30.87 L=62 R=77
`define THRESH_T8_N62  16'h1A86  // f1 t= 26.52 L=63 R=70
`define THRESH_T8_N63  16'h037C  // f9 t=  3.49 L=64 R=67
`define THRESH_T8_N64  16'h01F0  // f2 t=  1.94 L=65 R=66
`define THRESH_T8_N67  16'h0476  // f9 t=  4.46 L=68 R=69
`define THRESH_T8_N70  16'h2034  // f0 t= 32.21 L=71 R=74
`define THRESH_T8_N71  16'h1AA0  // f1 t= 26.63 L=72 R=73
`define THRESH_T8_N74  16'h1D66  // f5 t= 29.40 L=75 R=76
`define THRESH_T8_N77  16'h2084  // f0 t= 32.52 L=78 R=85
`define THRESH_T8_N78  16'h0210  // f2 t=  2.06 L=79 R=82
`define THRESH_T8_N79  16'h0008  // f4 t=  0.03 L=80 R=81
`define THRESH_T8_N82  16'h02A6  // f8 t=  2.65 L=83 R=84
`define THRESH_T8_N85  16'hFE38  // f3 t= -1.78 L=86 R=89
`define THRESH_T8_N86  16'h023E  // f2 t=  2.24 L=87 R=88
`define THRESH_T8_N89  16'h1E76  // f1 t= 30.46 L=90 R=91
`define THRESH_T8_N92  16'h09F6  // f3 t=  9.96 L=93 R=108
`define THRESH_T8_N93  16'h20FE  // f0 t= 32.99 L=94 R=101
`define THRESH_T8_N94  16'h2D9A  // f6 t= 45.60 L=95 R=98
`define THRESH_T8_N95  16'h23C4  // f1 t= 35.77 L=96 R=97
`define THRESH_T8_N98  16'h00D6  // f3 t=  0.84 L=99 R=100
`define THRESH_T8_N101  16'h38C6  // f5 t= 56.77 L=102 R=105
`define THRESH_T8_N102  16'h2368  // f0 t= 35.40 L=103 R=104
`define THRESH_T8_N105  16'h38CC  // f5 t= 56.80 L=106 R=107
`define THRESH_T8_N108  16'h0394  // f2 t=  3.58 L=109 R=110
`define THRESH_T8_N110  16'h2490  // f5 t= 36.56 L=111 R=112
`define THRESH_T8_N112  16'h2570  // f1 t= 37.44 L=113 R=114
// Tree 9 (class=1):
`define THRESH_T9_N 0  16'h02A0  // f8 t=  2.63 L=1 R=52
`define THRESH_T9_N 1  16'h0298  // f8 t=  2.60 L=2 R=29
`define THRESH_T9_N 2  16'h0292  // f8 t=  2.57 L=3 R=14
`define THRESH_T9_N 3  16'h028A  // f8 t=  2.54 L=4 R=9
`define THRESH_T9_N 4  16'hFD1E  // f4 t= -2.88 L=5 R=6
`define THRESH_T9_N 6  16'h1AEC  // f1 t= 26.92 L=7 R=8
`define THRESH_T9_N 9  16'h48BA  // f5 t= 72.73 L=10 R=13
`define THRESH_T9_N10  16'h0C9D  // f9 t= 12.61 L=11 R=12
`define THRESH_T9_N14  16'h1B79  // f7 t= 27.47 L=15 R=22
`define THRESH_T9_N15  16'h1AF4  // f7 t= 26.95 L=16 R=19
`define THRESH_T9_N16  16'h3F98  // f6 t= 63.59 L=17 R=18
`define THRESH_T9_N19  16'h3FEE  // f0 t= 63.93 L=20 R=21
`define THRESH_T9_N22  16'h0178  // f4 t=  1.47 L=23 R=26
`define THRESH_T9_N23  16'h3F5A  // f1 t= 63.35 L=24 R=25
`define THRESH_T9_N26  16'h0296  // f8 t=  2.58 L=27 R=28
`define THRESH_T9_N29  16'h1F96  // f7 t= 31.58 L=30 R=39
`define THRESH_T9_N30  16'h07DD  // f3 t=  7.86 L=31 R=38
`define THRESH_T9_N31  16'h3AA0  // f1 t= 58.63 L=32 R=35
`define THRESH_T9_N32  16'h1D50  // f0 t= 29.31 L=33 R=34
`define THRESH_T9_N35  16'h011A  // f9 t=  1.10 L=36 R=37
`define THRESH_T9_N39  16'h1D09  // f5 t= 29.04 L=40 R=45
`define THRESH_T9_N40  16'h019C  // f4 t=  1.61 L=41 R=44
`define THRESH_T9_N41  16'h1EC4  // f0 t= 30.76 L=42 R=43
`define THRESH_T9_N45  16'h02CE  // f2 t=  2.80 L=46 R=49
`define THRESH_T9_N46  16'hFADC  // f9 t= -5.14 L=47 R=48
`define THRESH_T9_N49  16'h216E  // f5 t= 33.43 L=50 R=51
`define THRESH_T9_N52  16'h20FC  // f5 t= 32.99 L=53 R=84
`define THRESH_T9_N53  16'h1E9A  // f5 t= 30.60 L=54 R=69
`define THRESH_T9_N54  16'hFFEC  // f9 t= -0.08 L=55 R=62
`define THRESH_T9_N55  16'h001C  // f4 t=  0.11 L=56 R=59
`define THRESH_T9_N56  16'hFEEA  // f9 t= -1.09 L=57 R=58
`define THRESH_T9_N59  16'h1BD8  // f1 t= 27.85 L=60 R=61
`define THRESH_T9_N62  16'h1CAB  // f5 t= 28.67 L=63 R=66
`define THRESH_T9_N63  16'h25FC  // f7 t= 37.98 L=64 R=65
`define THRESH_T9_N66  16'h1CB0  // f5 t= 28.69 L=67 R=68
`define THRESH_T9_N69  16'h02A8  // f8 t=  2.65 L=70 R=77
`define THRESH_T9_N70  16'h0212  // f2 t=  2.07 L=71 R=74
`define THRESH_T9_N71  16'h2B8F  // f6 t= 43.56 L=72 R=73
`define THRESH_T9_N74  16'h039B  // f3 t=  3.61 L=75 R=76
`define THRESH_T9_N77  16'h1FD0  // f5 t= 31.81 L=78 R=81
`define THRESH_T9_N78  16'h0018  // f4 t=  0.10 L=79 R=80
`define THRESH_T9_N81  16'h2117  // f0 t= 33.09 L=82 R=83
`define THRESH_T9_N84  16'h09F6  // f3 t=  9.96 L=85 R=100
`define THRESH_T9_N85  16'h21B4  // f0 t= 33.70 L=86 R=93
`define THRESH_T9_N86  16'h1F99  // f0 t= 31.60 L=87 R=90
`define THRESH_T9_N87  16'hFE24  // f4 t= -1.86 L=88 R=89
`define THRESH_T9_N90  16'hFFD4  // f4 t= -0.17 L=91 R=92
`define THRESH_T9_N93  16'h38C6  // f5 t= 56.77 L=94 R=97
`define THRESH_T9_N94  16'h01C4  // f2 t=  1.77 L=95 R=96
`define THRESH_T9_N97  16'h38CC  // f5 t= 56.80 L=98 R=99
`define THRESH_T9_N100  16'h3612  // f6 t= 54.07 L=101 R=108
`define THRESH_T9_N101  16'h2554  // f5 t= 37.33 L=102 R=105
`define THRESH_T9_N102  16'h231D  // f7 t= 35.11 L=103 R=104
`define THRESH_T9_N105  16'h2570  // f1 t= 37.44 L=106 R=107

// --- Class HIGH Trees ---
// Tree 0 (class=2):
`define THRESH_T0_N 0  16'h413C  // f0 t= 65.23 L=1 R=38
`define THRESH_T0_N 1  16'h07F8  // f3 t=  7.97 L=2 R=29
`define THRESH_T0_N 2  16'h3926  // f1 t= 57.15 L=3 R=16
`define THRESH_T0_N 3  16'h1F98  // f7 t= 31.60 L=4 R=11
`define THRESH_T0_N 4  16'h3568  // f6 t= 53.41 L=5 R=8
`define THRESH_T0_N 5  16'h3488  // f0 t= 52.53 L=6 R=7
`define THRESH_T0_N 8  16'h02B0  // f8 t=  2.69 L=9 R=10
`define THRESH_T0_N11  16'h3E0C  // f0 t= 62.05 L=12 R=15
`define THRESH_T0_N12  16'h3BE3  // f0 t= 59.89 L=13 R=14
`define THRESH_T0_N16  16'h393A  // f1 t= 57.23 L=17 R=22
`define THRESH_T0_N17  16'h0140  // f2 t=  1.25 L=18 R=21
`define THRESH_T0_N18  16'h010A  // f2 t=  1.04 L=19 R=20
`define THRESH_T0_N22  16'h011A  // f9 t=  1.10 L=23 R=26
`define THRESH_T0_N23  16'h3AF8  // f0 t= 58.97 L=24 R=25
`define THRESH_T0_N26  16'h0030  // f4 t=  0.19 L=27 R=28
`define THRESH_T0_N29  16'h2C1A  // f1 t= 44.10 L=30 R=31
`define THRESH_T0_N31  16'h1EF3  // f7 t= 30.95 L=32 R=37
`define THRESH_T0_N32  16'h0052  // f4 t=  0.32 L=33 R=34
`define THRESH_T0_N34  16'h1C8C  // f7 t= 28.55 L=35 R=36
`define THRESH_T0_N38  16'hFDEE  // f9 t= -2.07 L=39 R=44
`define THRESH_T0_N39  16'h44F6  // f5 t= 68.96 L=40 R=41
`define THRESH_T0_N41  16'h4641  // f0 t= 70.25 L=42 R=43
`define THRESH_T0_N44  16'hFD7C  // f3 t= -2.52 L=45 R=46
`define THRESH_T0_N46  16'h4414  // f0 t= 68.08 L=47 R=52
`define THRESH_T0_N47  16'h39DA  // f6 t= 57.85 L=48 R=51
`define THRESH_T0_N48  16'h049C  // f9 t=  4.61 L=49 R=50
`define THRESH_T0_N52  16'h3A6A  // f5 t= 58.41 L=53 R=54
`define THRESH_T0_N54  16'h4784  // f0 t= 71.51 L=55 R=56
// Tree 1 (class=2):
`define THRESH_T1_N 0  16'h413C  // f0 t= 65.23 L=1 R=54
`define THRESH_T1_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T1_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T1_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T1_N 4  16'h192A  // f0 t= 25.17 L=5 R=8
`define THRESH_T1_N 5  16'h1960  // f5 t= 25.37 L=6 R=7
`define THRESH_T1_N 8  16'h2158  // f5 t= 33.35 L=9 R=10
`define THRESH_T1_N11  16'h3568  // f6 t= 53.41 L=12 R=15
`define THRESH_T1_N12  16'h3488  // f0 t= 52.53 L=13 R=14
`define THRESH_T1_N15  16'h02B0  // f8 t=  2.69 L=16 R=17
`define THRESH_T1_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T1_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T1_N20  16'h010A  // f2 t=  1.04 L=21 R=22
`define THRESH_T1_N23  16'h39EB  // f5 t= 57.92 L=24 R=25
`define THRESH_T1_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T1_N27  16'h00EA  // f9 t=  0.91 L=28 R=29
`define THRESH_T1_N30  16'h0030  // f4 t=  0.19 L=31 R=32
`define THRESH_T1_N33  16'h2C1A  // f1 t= 44.10 L=34 R=47
`define THRESH_T1_N34  16'h02A8  // f8 t=  2.66 L=35 R=40
`define THRESH_T1_N35  16'h0866  // f3 t=  8.40 L=36 R=37
`define THRESH_T1_N37  16'h0A84  // f3 t= 10.52 L=38 R=39
`define THRESH_T1_N40  16'h213C  // f5 t= 33.23 L=41 R=44
`define THRESH_T1_N41  16'h02AC  // f8 t=  2.67 L=42 R=43
`define THRESH_T1_N44  16'h2336  // f5 t= 35.21 L=45 R=46
`define THRESH_T1_N47  16'h1EF3  // f7 t= 30.95 L=48 R=53
`define THRESH_T1_N48  16'h029A  // f8 t=  2.60 L=49 R=50
`define THRESH_T1_N50  16'h026B  // f9 t=  2.42 L=51 R=52
`define THRESH_T1_N54  16'hFDEE  // f9 t= -2.07 L=55 R=58
`define THRESH_T1_N55  16'h00D3  // f3 t=  0.82 L=56 R=57
`define THRESH_T1_N58  16'hFD7C  // f3 t= -2.52 L=59 R=60
`define THRESH_T1_N60  16'h4414  // f0 t= 68.08 L=61 R=68
`define THRESH_T1_N61  16'h1B26  // f7 t= 27.15 L=62 R=65
`define THRESH_T1_N62  16'h0290  // f8 t=  2.56 L=63 R=64
`define THRESH_T1_N65  16'h0116  // f4 t=  1.09 L=66 R=67
`define THRESH_T1_N68  16'h3A6A  // f5 t= 58.41 L=69 R=70
`define THRESH_T1_N70  16'h4784  // f0 t= 71.51 L=71 R=72
// Tree 2 (class=2):
`define THRESH_T2_N 0  16'h413C  // f0 t= 65.23 L=1 R=56
`define THRESH_T2_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T2_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T2_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T2_N 4  16'h0296  // f8 t=  2.58 L=5 R=8
`define THRESH_T2_N 5  16'h1876  // f0 t= 24.46 L=6 R=7
`define THRESH_T2_N 8  16'h2192  // f0 t= 33.57 L=9 R=10
`define THRESH_T2_N11  16'h3568  // f6 t= 53.41 L=12 R=15
`define THRESH_T2_N12  16'h3488  // f0 t= 52.53 L=13 R=14
`define THRESH_T2_N15  16'h02B0  // f8 t=  2.69 L=16 R=17
`define THRESH_T2_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T2_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T2_N20  16'h010A  // f2 t=  1.04 L=21 R=22
`define THRESH_T2_N23  16'h029E  // f8 t=  2.62 L=24 R=25
`define THRESH_T2_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T2_N27  16'h01FC  // f3 t=  1.99 L=28 R=29
`define THRESH_T2_N30  16'h0138  // f9 t=  1.22 L=31 R=32
`define THRESH_T2_N33  16'h2C1A  // f1 t= 44.10 L=34 R=49
`define THRESH_T2_N34  16'h213C  // f5 t= 33.23 L=35 R=42
`define THRESH_T2_N35  16'h1AB0  // f5 t= 26.69 L=36 R=39
`define THRESH_T2_N36  16'h0098  // f4 t=  0.59 L=37 R=38
`define THRESH_T2_N39  16'h02AC  // f8 t=  2.67 L=40 R=41
`define THRESH_T2_N42  16'h08CC  // f3 t=  8.79 L=43 R=46
`define THRESH_T2_N43  16'h06B3  // f2 t=  6.70 L=44 R=45
`define THRESH_T2_N46  16'h23A2  // f5 t= 35.63 L=47 R=48
`define THRESH_T2_N49  16'h015B  // f9 t=  1.36 L=50 R=51
`define THRESH_T2_N51  16'h04A0  // f9 t=  4.63 L=52 R=55
`define THRESH_T2_N52  16'h037A  // f2 t=  3.47 L=53 R=54
`define THRESH_T2_N56  16'hFDEE  // f9 t= -2.07 L=57 R=66
`define THRESH_T2_N57  16'h00D3  // f3 t=  0.82 L=58 R=65
`define THRESH_T2_N58  16'hFDE7  // f9 t= -2.10 L=59 R=64
`define THRESH_T2_N59  16'h44E8  // f1 t= 68.91 L=60 R=63
`define THRESH_T2_N60  16'hFD21  // f9 t= -2.87 L=61 R=62
`define THRESH_T2_N66  16'hFD7C  // f3 t= -2.52 L=67 R=68
`define THRESH_T2_N68  16'h4414  // f0 t= 68.08 L=69 R=76
`define THRESH_T2_N69  16'h39DA  // f6 t= 57.85 L=70 R=73
`define THRESH_T2_N70  16'h049C  // f9 t=  4.61 L=71 R=72
`define THRESH_T2_N73  16'h430A  // f0 t= 67.04 L=74 R=75
`define THRESH_T2_N76  16'h3A6A  // f5 t= 58.41 L=77 R=78
`define THRESH_T2_N78  16'h028A  // f8 t=  2.54 L=79 R=80
// Tree 3 (class=2):
`define THRESH_T3_N 0  16'h413C  // f0 t= 65.23 L=1 R=56
`define THRESH_T3_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T3_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T3_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T3_N 4  16'h1B72  // f0 t= 27.45 L=5 R=8
`define THRESH_T3_N 5  16'h1876  // f0 t= 24.46 L=6 R=7
`define THRESH_T3_N 8  16'h22AA  // f1 t= 34.66 L=9 R=10
`define THRESH_T3_N11  16'h1F98  // f7 t= 31.59 L=12 R=15
`define THRESH_T3_N12  16'h02B0  // f8 t=  2.69 L=13 R=14
`define THRESH_T3_N15  16'h3488  // f0 t= 52.53 L=16 R=17
`define THRESH_T3_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T3_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T3_N20  16'h010A  // f2 t=  1.04 L=21 R=22
`define THRESH_T3_N23  16'h39EB  // f5 t= 57.92 L=24 R=25
`define THRESH_T3_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T3_N27  16'h01EE  // f3 t=  1.93 L=28 R=29
`define THRESH_T3_N30  16'h0030  // f4 t=  0.19 L=31 R=32
`define THRESH_T3_N33  16'h2C1A  // f1 t= 44.10 L=34 R=49
`define THRESH_T3_N34  16'h213C  // f5 t= 33.23 L=35 R=42
`define THRESH_T3_N35  16'h02AC  // f8 t=  2.67 L=36 R=39
`define THRESH_T3_N36  16'h1AB0  // f5 t= 26.69 L=37 R=38
`define THRESH_T3_N39  16'h1D1E  // f5 t= 29.12 L=40 R=41
`define THRESH_T3_N42  16'h097C  // f3 t=  9.49 L=43 R=46
`define THRESH_T3_N43  16'h06B3  // f2 t=  6.70 L=44 R=45
`define THRESH_T3_N46  16'h0086  // f4 t=  0.52 L=47 R=48
`define THRESH_T3_N49  16'h1EF3  // f7 t= 30.95 L=50 R=55
`define THRESH_T3_N50  16'h3E1F  // f0 t= 62.12 L=51 R=54
`define THRESH_T3_N51  16'h383C  // f6 t= 56.23 L=52 R=53
`define THRESH_T3_N56  16'hFDEE  // f9 t= -2.07 L=57 R=66
`define THRESH_T3_N57  16'h00D3  // f3 t=  0.82 L=58 R=65
`define THRESH_T3_N58  16'h1A10  // f7 t= 26.06 L=59 R=64
`define THRESH_T3_N59  16'hFDE7  // f9 t= -2.10 L=60 R=63
`define THRESH_T3_N60  16'h44E8  // f1 t= 68.91 L=61 R=62
`define THRESH_T3_N66  16'hFD7C  // f3 t= -2.52 L=67 R=68
`define THRESH_T3_N68  16'h4414  // f0 t= 68.08 L=69 R=76
`define THRESH_T3_N69  16'h1B26  // f7 t= 27.15 L=70 R=73
`define THRESH_T3_N70  16'h430A  // f0 t= 67.04 L=71 R=72
`define THRESH_T3_N73  16'h02A4  // f2 t=  2.64 L=74 R=75
`define THRESH_T3_N76  16'h3A6A  // f5 t= 58.41 L=77 R=78
`define THRESH_T3_N78  16'hFECA  // f3 t= -1.21 L=79 R=80
// Tree 4 (class=2):
`define THRESH_T4_N 0  16'h413C  // f0 t= 65.23 L=1 R=54
`define THRESH_T4_N 1  16'h07F8  // f3 t=  7.97 L=2 R=31
`define THRESH_T4_N 2  16'h3926  // f1 t= 57.15 L=3 R=16
`define THRESH_T4_N 3  16'h2B54  // f1 t= 43.33 L=4 R=11
`define THRESH_T4_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T4_N 5  16'h1878  // f0 t= 24.47 L=6 R=7
`define THRESH_T4_N 8  16'h215A  // f5 t= 33.35 L=9 R=10
`define THRESH_T4_N11  16'h2B56  // f1 t= 43.33 L=12 R=13
`define THRESH_T4_N13  16'h1F24  // f7 t= 31.14 L=14 R=15
`define THRESH_T4_N16  16'h393A  // f1 t= 57.23 L=17 R=24
`define THRESH_T4_N17  16'h0140  // f2 t=  1.25 L=18 R=21
`define THRESH_T4_N18  16'h010A  // f2 t=  1.04 L=19 R=20
`define THRESH_T4_N21  16'h0274  // f9 t=  2.45 L=22 R=23
`define THRESH_T4_N24  16'h011A  // f9 t=  1.10 L=25 R=28
`define THRESH_T4_N25  16'h01EE  // f3 t=  1.93 L=26 R=27
`define THRESH_T4_N28  16'h0138  // f9 t=  1.22 L=29 R=30
`define THRESH_T4_N31  16'h2C1A  // f1 t= 44.10 L=32 R=47
`define THRESH_T4_N32  16'h213C  // f5 t= 33.23 L=33 R=40
`define THRESH_T4_N33  16'h02AC  // f8 t=  2.67 L=34 R=37
`define THRESH_T4_N34  16'h26DA  // f7 t= 38.85 L=35 R=36
`define THRESH_T4_N37  16'h1E22  // f5 t= 30.13 L=38 R=39
`define THRESH_T4_N40  16'h09F8  // f3 t=  9.97 L=41 R=44
`define THRESH_T4_N41  16'h22A9  // f1 t= 34.66 L=42 R=43
`define THRESH_T4_N44  16'h2554  // f5 t= 37.33 L=45 R=46
`define THRESH_T4_N47  16'h015B  // f9 t=  1.36 L=48 R=49
`define THRESH_T4_N49  16'h04A0  // f9 t=  4.63 L=50 R=53
`define THRESH_T4_N50  16'h2FFD  // f5 t= 47.99 L=51 R=52
`define THRESH_T4_N54  16'hFDEE  // f9 t= -2.07 L=55 R=64
`define THRESH_T4_N55  16'h00D3  // f3 t=  0.82 L=56 R=63
`define THRESH_T4_N56  16'hFDE7  // f9 t= -2.10 L=57 R=62
`define THRESH_T4_N57  16'h028C  // f8 t=  2.54 L=58 R=59
`define THRESH_T4_N59  16'h44E8  // f1 t= 68.91 L=60 R=61
`define THRESH_T4_N64  16'hFD7C  // f3 t= -2.52 L=65 R=66
`define THRESH_T4_N66  16'h4414  // f0 t= 68.08 L=67 R=74
`define THRESH_T4_N67  16'h1B26  // f7 t= 27.15 L=68 R=71
`define THRESH_T4_N68  16'h430A  // f0 t= 67.04 L=69 R=70
`define THRESH_T4_N71  16'h049C  // f9 t=  4.61 L=72 R=73
`define THRESH_T4_N74  16'h3A6A  // f5 t= 58.41 L=75 R=76
`define THRESH_T4_N76  16'hFECA  // f3 t= -1.21 L=77 R=78
// Tree 5 (class=2):
`define THRESH_T5_N 0  16'h413C  // f0 t= 65.23 L=1 R=56
`define THRESH_T5_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T5_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T5_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T5_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T5_N 5  16'h1912  // f0 t= 25.07 L=6 R=7
`define THRESH_T5_N 8  16'h22A2  // f5 t= 34.63 L=9 R=10
`define THRESH_T5_N11  16'h3568  // f6 t= 53.41 L=12 R=15
`define THRESH_T5_N12  16'h3488  // f0 t= 52.53 L=13 R=14
`define THRESH_T5_N15  16'h02AE  // f8 t=  2.68 L=16 R=17
`define THRESH_T5_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T5_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T5_N20  16'h010A  // f2 t=  1.04 L=21 R=22
`define THRESH_T5_N23  16'h39EB  // f5 t= 57.92 L=24 R=25
`define THRESH_T5_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T5_N27  16'h01EE  // f3 t=  1.93 L=28 R=29
`define THRESH_T5_N30  16'h0030  // f4 t=  0.19 L=31 R=32
`define THRESH_T5_N33  16'h2C1A  // f1 t= 44.10 L=34 R=49
`define THRESH_T5_N34  16'h22F8  // f5 t= 34.97 L=35 R=42
`define THRESH_T5_N35  16'h1AB0  // f5 t= 26.69 L=36 R=39
`define THRESH_T5_N36  16'h1907  // f5 t= 25.03 L=37 R=38
`define THRESH_T5_N39  16'h213C  // f5 t= 33.23 L=40 R=41
`define THRESH_T5_N42  16'h09D1  // f3 t=  9.82 L=43 R=46
`define THRESH_T5_N43  16'h22A9  // f1 t= 34.66 L=44 R=45
`define THRESH_T5_N46  16'h2244  // f1 t= 34.26 L=47 R=48
`define THRESH_T5_N49  16'h1EF3  // f7 t= 30.95 L=50 R=55
`define THRESH_T5_N50  16'h3E1F  // f0 t= 62.12 L=51 R=54
`define THRESH_T5_N51  16'h02A3  // f8 t=  2.64 L=52 R=53
`define THRESH_T5_N56  16'hFDEE  // f9 t= -2.07 L=57 R=72
`define THRESH_T5_N57  16'h1A8A  // f7 t= 26.54 L=58 R=71
`define THRESH_T5_N58  16'h019E  // f2 t=  1.62 L=59 R=64
`define THRESH_T5_N59  16'h450A  // f1 t= 69.04 L=60 R=61
`define THRESH_T5_N61  16'hFDE7  // f9 t= -2.10 L=62 R=63
`define THRESH_T5_N64  16'h4326  // f0 t= 67.15 L=65 R=68
`define THRESH_T5_N65  16'h004D  // f3 t=  0.30 L=66 R=67
`define THRESH_T5_N68  16'h471A  // f5 t= 71.10 L=69 R=70
`define THRESH_T5_N72  16'hFD7C  // f3 t= -2.52 L=73 R=74
`define THRESH_T5_N74  16'h4414  // f0 t= 68.08 L=75 R=82
`define THRESH_T5_N75  16'h1B26  // f7 t= 27.15 L=76 R=79
`define THRESH_T5_N76  16'h430A  // f0 t= 67.04 L=77 R=78
`define THRESH_T5_N79  16'h02A4  // f2 t=  2.64 L=80 R=81
`define THRESH_T5_N82  16'h3A6A  // f5 t= 58.41 L=83 R=84
`define THRESH_T5_N84  16'hFF84  // f4 t= -0.49 L=85 R=86
// Tree 6 (class=2):
`define THRESH_T6_N 0  16'h413C  // f0 t= 65.23 L=1 R=54
`define THRESH_T6_N 1  16'h07F8  // f3 t=  7.97 L=2 R=31
`define THRESH_T6_N 2  16'h3926  // f1 t= 57.15 L=3 R=16
`define THRESH_T6_N 3  16'h2B54  // f1 t= 43.33 L=4 R=11
`define THRESH_T6_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T6_N 5  16'h1918  // f0 t= 25.09 L=6 R=7
`define THRESH_T6_N 8  16'h22A2  // f5 t= 34.63 L=9 R=10
`define THRESH_T6_N11  16'h2B56  // f1 t= 43.33 L=12 R=13
`define THRESH_T6_N13  16'h1F24  // f7 t= 31.14 L=14 R=15
`define THRESH_T6_N16  16'h393A  // f1 t= 57.23 L=17 R=24
`define THRESH_T6_N17  16'h0140  // f2 t=  1.25 L=18 R=21
`define THRESH_T6_N18  16'h010A  // f2 t=  1.04 L=19 R=20
`define THRESH_T6_N21  16'h3ADA  // f0 t= 58.85 L=22 R=23
`define THRESH_T6_N24  16'h011A  // f9 t=  1.10 L=25 R=28
`define THRESH_T6_N25  16'h01EE  // f3 t=  1.93 L=26 R=27
`define THRESH_T6_N28  16'h0138  // f9 t=  1.22 L=29 R=30
`define THRESH_T6_N31  16'h2C1A  // f1 t= 44.10 L=32 R=47
`define THRESH_T6_N32  16'h22F8  // f5 t= 34.97 L=33 R=40
`define THRESH_T6_N33  16'h1BD6  // f5 t= 27.84 L=34 R=37
`define THRESH_T6_N34  16'h03A4  // f2 t=  3.64 L=35 R=36
`define THRESH_T6_N37  16'h2F58  // f6 t= 47.34 L=38 R=39
`define THRESH_T6_N40  16'h09D1  // f3 t=  9.82 L=41 R=44
`define THRESH_T6_N41  16'h22A9  // f1 t= 34.66 L=42 R=43
`define THRESH_T6_N44  16'h2244  // f1 t= 34.26 L=45 R=46
`define THRESH_T6_N47  16'h360D  // f6 t= 54.05 L=48 R=49
`define THRESH_T6_N49  16'h029A  // f8 t=  2.60 L=50 R=51
`define THRESH_T6_N51  16'h3744  // f0 t= 55.27 L=52 R=53
`define THRESH_T6_N54  16'hFDEE  // f9 t= -2.07 L=55 R=70
`define THRESH_T6_N55  16'h3A76  // f6 t= 58.46 L=56 R=57
`define THRESH_T6_N57  16'h019E  // f2 t=  1.62 L=58 R=63
`define THRESH_T6_N58  16'h441C  // f5 t= 68.11 L=59 R=60
`define THRESH_T6_N60  16'hFDE7  // f9 t= -2.10 L=61 R=62
`define THRESH_T6_N63  16'h46A9  // f1 t= 70.66 L=64 R=67
`define THRESH_T6_N64  16'h004D  // f3 t=  0.30 L=65 R=66
`define THRESH_T6_N67  16'hFC6A  // f9 t= -3.58 L=68 R=69
`define THRESH_T6_N70  16'hFD7C  // f3 t= -2.52 L=71 R=72
`define THRESH_T6_N72  16'h4414  // f0 t= 68.08 L=73 R=80
`define THRESH_T6_N73  16'h1B26  // f7 t= 27.15 L=74 R=77
`define THRESH_T6_N74  16'h0292  // f8 t=  2.57 L=75 R=76
`define THRESH_T6_N77  16'h049C  // f9 t=  4.61 L=78 R=79
`define THRESH_T6_N80  16'h3A6A  // f5 t= 58.41 L=81 R=82
`define THRESH_T6_N82  16'hFECA  // f3 t= -1.21 L=83 R=84
// Tree 7 (class=2):
`define THRESH_T7_N 0  16'h413C  // f0 t= 65.23 L=1 R=56
`define THRESH_T7_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T7_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T7_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T7_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T7_N 5  16'h191C  // f0 t= 25.11 L=6 R=7
`define THRESH_T7_N 8  16'h22A2  // f5 t= 34.63 L=9 R=10
`define THRESH_T7_N11  16'h3568  // f6 t= 53.41 L=12 R=15
`define THRESH_T7_N12  16'h3488  // f0 t= 52.53 L=13 R=14
`define THRESH_T7_N15  16'h02AE  // f8 t=  2.68 L=16 R=17
`define THRESH_T7_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T7_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T7_N20  16'h010A  // f2 t=  1.04 L=21 R=22
`define THRESH_T7_N23  16'h0274  // f9 t=  2.45 L=24 R=25
`define THRESH_T7_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T7_N27  16'h01FC  // f3 t=  1.99 L=28 R=29
`define THRESH_T7_N30  16'h0138  // f9 t=  1.22 L=31 R=32
`define THRESH_T7_N33  16'h2C1A  // f1 t= 44.10 L=34 R=49
`define THRESH_T7_N34  16'h22F8  // f5 t= 34.97 L=35 R=42
`define THRESH_T7_N35  16'h02AA  // f8 t=  2.67 L=36 R=39
`define THRESH_T7_N36  16'h2713  // f7 t= 39.07 L=37 R=38
`define THRESH_T7_N39  16'h25A8  // f7 t= 37.66 L=40 R=41
`define THRESH_T7_N42  16'h0A0A  // f3 t= 10.04 L=43 R=46
`define THRESH_T7_N43  16'h06B3  // f2 t=  6.70 L=44 R=45
`define THRESH_T7_N46  16'h2490  // f5 t= 36.56 L=47 R=48
`define THRESH_T7_N49  16'h360D  // f6 t= 54.05 L=50 R=51
`define THRESH_T7_N51  16'h029A  // f8 t=  2.60 L=52 R=53
`define THRESH_T7_N53  16'h1CC4  // f7 t= 28.77 L=54 R=55
`define THRESH_T7_N56  16'hFDEE  // f9 t= -2.07 L=57 R=72
`define THRESH_T7_N57  16'h1A8A  // f7 t= 26.54 L=58 R=71
`define THRESH_T7_N58  16'h019E  // f2 t=  1.62 L=59 R=64
`define THRESH_T7_N59  16'h441C  // f5 t= 68.11 L=60 R=61
`define THRESH_T7_N61  16'hFDE7  // f9 t= -2.10 L=62 R=63
`define THRESH_T7_N64  16'h4326  // f0 t= 67.15 L=65 R=68
`define THRESH_T7_N65  16'h004D  // f3 t=  0.30 L=66 R=67
`define THRESH_T7_N68  16'h3D52  // f6 t= 61.32 L=69 R=70
`define THRESH_T7_N72  16'hFD7C  // f3 t= -2.52 L=73 R=74
`define THRESH_T7_N74  16'h4414  // f0 t= 68.08 L=75 R=82
`define THRESH_T7_N75  16'h1B26  // f7 t= 27.15 L=76 R=79
`define THRESH_T7_N76  16'h0292  // f8 t=  2.57 L=77 R=78
`define THRESH_T7_N79  16'h401E  // f5 t= 64.12 L=80 R=81
`define THRESH_T7_N82  16'h3A6A  // f5 t= 58.41 L=83 R=84
`define THRESH_T7_N84  16'hFF84  // f4 t= -0.49 L=85 R=86
// Tree 8 (class=2):
`define THRESH_T8_N 0  16'h413C  // f0 t= 65.23 L=1 R=52
`define THRESH_T8_N 1  16'h07F8  // f3 t=  7.97 L=2 R=31
`define THRESH_T8_N 2  16'h3926  // f1 t= 57.15 L=3 R=16
`define THRESH_T8_N 3  16'h2B54  // f1 t= 43.33 L=4 R=11
`define THRESH_T8_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T8_N 5  16'h1928  // f0 t= 25.15 L=6 R=7
`define THRESH_T8_N 8  16'h22A2  // f5 t= 34.63 L=9 R=10
`define THRESH_T8_N11  16'h2B56  // f1 t= 43.33 L=12 R=13
`define THRESH_T8_N13  16'h1F24  // f7 t= 31.14 L=14 R=15
`define THRESH_T8_N16  16'h393A  // f1 t= 57.23 L=17 R=24
`define THRESH_T8_N17  16'h0140  // f2 t=  1.25 L=18 R=21
`define THRESH_T8_N18  16'h010A  // f2 t=  1.04 L=19 R=20
`define THRESH_T8_N21  16'h396E  // f0 t= 57.43 L=22 R=23
`define THRESH_T8_N24  16'h011A  // f9 t=  1.10 L=25 R=28
`define THRESH_T8_N25  16'h01FC  // f3 t=  1.98 L=26 R=27
`define THRESH_T8_N28  16'h0030  // f4 t=  0.19 L=29 R=30
`define THRESH_T8_N31  16'h2C1A  // f1 t= 44.10 L=32 R=45
`define THRESH_T8_N32  16'h22BE  // f5 t= 34.74 L=33 R=40
`define THRESH_T8_N33  16'h02AA  // f8 t=  2.67 L=34 R=37
`define THRESH_T8_N34  16'h03EE  // f2 t=  3.93 L=35 R=36
`define THRESH_T8_N37  16'h213C  // f5 t= 33.23 L=38 R=39
`define THRESH_T8_N40  16'h06EE  // f2 t=  6.93 L=41 R=44
`define THRESH_T8_N41  16'h097C  // f3 t=  9.49 L=42 R=43
`define THRESH_T8_N45  16'h015B  // f9 t=  1.36 L=46 R=47
`define THRESH_T8_N47  16'h0442  // f2 t=  4.26 L=48 R=51
`define THRESH_T8_N48  16'h02A4  // f8 t=  2.64 L=49 R=50
`define THRESH_T8_N52  16'hFDEE  // f9 t= -2.07 L=53 R=68
`define THRESH_T8_N53  16'h1A8A  // f7 t= 26.54 L=54 R=67
`define THRESH_T8_N54  16'h019E  // f2 t=  1.62 L=55 R=60
`define THRESH_T8_N55  16'h450A  // f1 t= 69.04 L=56 R=57
`define THRESH_T8_N57  16'hFF70  // f4 t= -0.56 L=58 R=59
`define THRESH_T8_N60  16'h4326  // f0 t= 67.15 L=61 R=64
`define THRESH_T8_N61  16'h004D  // f3 t=  0.30 L=62 R=63
`define THRESH_T8_N64  16'h023D  // f2 t=  2.24 L=65 R=66
`define THRESH_T8_N68  16'hFD7C  // f3 t= -2.52 L=69 R=70
`define THRESH_T8_N70  16'h4414  // f0 t= 68.08 L=71 R=78
`define THRESH_T8_N71  16'h39DA  // f6 t= 57.85 L=72 R=75
`define THRESH_T8_N72  16'h0116  // f4 t=  1.09 L=73 R=74
`define THRESH_T8_N75  16'h3A60  // f6 t= 58.38 L=76 R=77
`define THRESH_T8_N78  16'h3A6A  // f5 t= 58.41 L=79 R=80
`define THRESH_T8_N80  16'hFECA  // f3 t= -1.21 L=81 R=82
// Tree 9 (class=2):
`define THRESH_T9_N 0  16'h413C  // f0 t= 65.23 L=1 R=56
`define THRESH_T9_N 1  16'h07F8  // f3 t=  7.97 L=2 R=33
`define THRESH_T9_N 2  16'h3926  // f1 t= 57.15 L=3 R=18
`define THRESH_T9_N 3  16'h3568  // f6 t= 53.40 L=4 R=11
`define THRESH_T9_N 4  16'h1B7E  // f0 t= 27.49 L=5 R=8
`define THRESH_T9_N 5  16'h028A  // f8 t=  2.54 L=6 R=7
`define THRESH_T9_N 8  16'h22A2  // f5 t= 34.63 L=9 R=10
`define THRESH_T9_N11  16'h3568  // f6 t= 53.41 L=12 R=15
`define THRESH_T9_N12  16'h3488  // f0 t= 52.53 L=13 R=14
`define THRESH_T9_N15  16'h02B0  // f8 t=  2.69 L=16 R=17
`define THRESH_T9_N18  16'h393A  // f1 t= 57.23 L=19 R=26
`define THRESH_T9_N19  16'h0140  // f2 t=  1.25 L=20 R=23
`define THRESH_T9_N20  16'h0024  // f4 t=  0.14 L=21 R=22
`define THRESH_T9_N23  16'h396E  // f0 t= 57.43 L=24 R=25
`define THRESH_T9_N26  16'h011A  // f9 t=  1.10 L=27 R=30
`define THRESH_T9_N27  16'h01FC  // f3 t=  1.98 L=28 R=29
`define THRESH_T9_N30  16'h0138  // f9 t=  1.22 L=31 R=32
`define THRESH_T9_N33  16'h2C1A  // f1 t= 44.10 L=34 R=49
`define THRESH_T9_N34  16'h21BA  // f5 t= 33.72 L=35 R=42
`define THRESH_T9_N35  16'h02AC  // f8 t=  2.67 L=36 R=39
`define THRESH_T9_N36  16'h02AA  // f8 t=  2.66 L=37 R=38
`define THRESH_T9_N39  16'h1E22  // f5 t= 30.13 L=40 R=41
`define THRESH_T9_N42  16'h22F8  // f5 t= 34.97 L=43 R=46
`define THRESH_T9_N43  16'h309B  // f6 t= 48.61 L=44 R=45
`define THRESH_T9_N46  16'h0AC6  // f9 t= 10.77 L=47 R=48
`define THRESH_T9_N49  16'h015B  // f9 t=  1.36 L=50 R=51
`define THRESH_T9_N51  16'h0442  // f2 t=  4.26 L=52 R=55
`define THRESH_T9_N52  16'h094A  // f3 t=  9.29 L=53 R=54
`define THRESH_T9_N56  16'hFDEE  // f9 t= -2.07 L=57 R=72
`define THRESH_T9_N57  16'h1A8A  // f7 t= 26.54 L=58 R=71
`define THRESH_T9_N58  16'h019E  // f2 t=  1.62 L=59 R=64
`define THRESH_T9_N59  16'h441C  // f5 t= 68.11 L=60 R=61
`define THRESH_T9_N61  16'hFF70  // f4 t= -0.56 L=62 R=63
`define THRESH_T9_N64  16'h4326  // f0 t= 67.15 L=65 R=68
`define THRESH_T9_N65  16'h004D  // f3 t=  0.30 L=66 R=67
`define THRESH_T9_N68  16'hFF12  // f4 t= -0.93 L=69 R=70
`define THRESH_T9_N72  16'hFD7C  // f3 t= -2.52 L=73 R=74
`define THRESH_T9_N74  16'h4414  // f0 t= 68.08 L=75 R=82
`define THRESH_T9_N75  16'h39DA  // f6 t= 57.85 L=76 R=79
`define THRESH_T9_N76  16'h011E  // f3 t=  1.12 L=77 R=78
`define THRESH_T9_N79  16'h3A60  // f6 t= 58.38 L=80 R=81
`define THRESH_T9_N82  16'h3A6A  // f5 t= 58.41 L=83 R=84
`define THRESH_T9_N84  16'h0288  // f8 t=  2.53 L=85 R=86

// ========================================
// Leaf Values (Q8.8)
// Format: LEAF_<TREE>_<NODE> = 16'h<HEX>
// ========================================
// Class LOW:
`define LEAF_T0_N 6_C0  16'h01F7  // v=  1.964
`define LEAF_T0_N 7_C0  16'h01E9  // v=  1.909
`define LEAF_T0_N 8_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N11_C0  16'h01DF  // v=  1.871
`define LEAF_T0_N12_C0  16'h01CA  // v=  1.790
`define LEAF_T0_N13_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N17_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N18_C0  16'h0163  // v=  1.388
`define LEAF_T0_N20_C0  16'h01B8  // v=  1.717
`define LEAF_T0_N21_C0  16'h0160  // v=  1.374
`define LEAF_T0_N24_C0  16'h01A7  // v=  1.653
`define LEAF_T0_N25_C0  16'h017F  // v=  1.496
`define LEAF_T0_N27_C0  16'hFFBA  // v= -0.272
`define LEAF_T0_N28_C0  16'h016F  // v=  1.433
`define LEAF_T0_N33_C0  16'h00F8  // v=  0.967
`define LEAF_T0_N34_C0  16'hFFCE  // v= -0.196
`define LEAF_T0_N36_C0  16'h0179  // v=  1.474
`define LEAF_T0_N37_C0  16'h0148  // v=  1.280
`define LEAF_T0_N40_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N41_C0  16'h01A2  // v=  1.633
`define LEAF_T0_N43_C0  16'h0110  // v=  1.063
`define LEAF_T0_N44_C0  16'h00D8  // v=  0.843
`define LEAF_T0_N48_C0  16'h0114  // v=  1.078
`define LEAF_T0_N49_C0  16'h01A8  // v=  1.655
`define LEAF_T0_N51_C0  16'h00A7  // v=  0.653
`define LEAF_T0_N52_C0  16'h0122  // v=  1.131
`define LEAF_T0_N55_C0  16'h002A  // v=  0.163
`define LEAF_T0_N56_C0  16'h009D  // v=  0.612
`define LEAF_T0_N58_C0  16'h00DD  // v=  0.863
`define LEAF_T0_N59_C0  16'h004D  // v=  0.299
`define LEAF_T0_N65_C0  16'h0152  // v=  1.321
`define LEAF_T0_N66_C0  16'h01EE  // v=  1.929
`define LEAF_T0_N68_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N69_C0  16'h01A8  // v=  1.655
`define LEAF_T0_N72_C0  16'h0064  // v=  0.391
`define LEAF_T0_N73_C0  16'h010F  // v=  1.057
`define LEAF_T0_N75_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N76_C0  16'h0004  // v=  0.016
`define LEAF_T0_N80_C0  16'h0060  // v=  0.376
`define LEAF_T0_N81_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N83_C0  16'h0025  // v=  0.145
`define LEAF_T0_N84_C0  16'hFFA0  // v= -0.376
`define LEAF_T0_N87_C0  16'h0183  // v=  1.510
`define LEAF_T0_N88_C0  16'h0200  // v=  2.000
`define LEAF_T0_N90_C0  16'hFF91  // v= -0.433
`define LEAF_T0_N91_C0  16'h00A7  // v=  0.652
`define LEAF_T0_N96_C0  16'hFF70  // v= -0.561
`define LEAF_T0_N97_C0  16'hFFF1  // v= -0.058
`define LEAF_T0_N99_C0  16'h0116  // v=  1.085
`define LEAF_T0_N100_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N103_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N104_C0  16'h0147  // v=  1.278
`define LEAF_T0_N106_C0  16'h0062  // v=  0.382
`define LEAF_T0_N107_C0  16'hFF00  // v= -1.000
`define LEAF_T0_N111_C0  16'hFF36  // v= -0.791
`define LEAF_T0_N112_C0  16'h00AF  // v=  0.685
`define LEAF_T0_N114_C0  16'h00CB  // v=  0.792
`define LEAF_T0_N115_C0  16'hFF8D  // v= -0.450
`define LEAF_T0_N118_C0  16'hFF66  // v= -0.600
`define LEAF_T0_N119_C0  16'hFF0E  // v= -0.944
`define LEAF_T0_N121_C0  16'hFF2F  // v= -0.818
`define LEAF_T0_N122_C0  16'hFF00  // v= -0.999
`define LEAF_T1_N 6_C0  16'h01A1  // v=  1.629
`define LEAF_T1_N 7_C0  16'h0195  // v=  1.584
`define LEAF_T1_N 8_C0  16'hFF0D  // v= -0.950
`define LEAF_T1_N11_C0  16'h018E  // v=  1.553
`define LEAF_T1_N12_C0  16'h017E  // v=  1.490
`define LEAF_T1_N13_C0  16'hFF01  // v= -0.997
`define LEAF_T1_N17_C0  16'h0129  // v=  1.162
`define LEAF_T1_N18_C0  16'hFEEB  // v= -1.083
`define LEAF_T1_N20_C0  16'h016F  // v=  1.435
`define LEAF_T1_N21_C0  16'h0126  // v=  1.147
`define LEAF_T1_N24_C0  16'h0163  // v=  1.386
`define LEAF_T1_N25_C0  16'h0142  // v=  1.256
`define LEAF_T1_N27_C0  16'hFFB4  // v= -0.297
`define LEAF_T1_N28_C0  16'h0136  // v=  1.210
`define LEAF_T1_N33_C0  16'h0102  // v=  1.007
`define LEAF_T1_N34_C0  16'h003E  // v=  0.242
`define LEAF_T1_N36_C0  16'h011C  // v=  1.109
`define LEAF_T1_N37_C0  16'h014F  // v=  1.309
`define LEAF_T1_N40_C0  16'h0161  // v=  1.378
`define LEAF_T1_N41_C0  16'hFEE9  // v= -1.090
`define LEAF_T1_N43_C0  16'h00EA  // v=  0.913
`define LEAF_T1_N44_C0  16'h00B8  // v=  0.718
`define LEAF_T1_N48_C0  16'h00F4  // v=  0.954
`define LEAF_T1_N49_C0  16'hFEF1  // v= -1.058
`define LEAF_T1_N51_C0  16'h0091  // v=  0.565
`define LEAF_T1_N52_C0  16'h00FB  // v=  0.980
`define LEAF_T1_N55_C0  16'h0028  // v=  0.157
`define LEAF_T1_N56_C0  16'h00AB  // v=  0.670
`define LEAF_T1_N58_C0  16'h00F6  // v=  0.962
`define LEAF_T1_N59_C0  16'h0078  // v=  0.470
`define LEAF_T1_N64_C0  16'hFEFA  // v= -1.022
`define LEAF_T1_N66_C0  16'h017E  // v=  1.492
`define LEAF_T1_N67_C0  16'h00C6  // v=  0.774
`define LEAF_T1_N70_C0  16'h0050  // v=  0.311
`define LEAF_T1_N71_C0  16'h00F0  // v=  0.936
`define LEAF_T1_N73_C0  16'hFF08  // v= -0.968
`define LEAF_T1_N74_C0  16'h0002  // v=  0.009
`define LEAF_T1_N78_C0  16'hFFD6  // v= -0.164
`define LEAF_T1_N79_C0  16'h00FA  // v=  0.975
`define LEAF_T1_N81_C0  16'h012C  // v=  1.170
`define LEAF_T1_N82_C0  16'hFF36  // v= -0.788
`define LEAF_T1_N85_C0  16'h00AC  // v=  0.671
`define LEAF_T1_N86_C0  16'hFFAC  // v= -0.328
`define LEAF_T1_N88_C0  16'hFFB0  // v= -0.313
`define LEAF_T1_N89_C0  16'h0083  // v=  0.510
`define LEAF_T1_N94_C0  16'hFF91  // v= -0.435
`define LEAF_T1_N95_C0  16'h0149  // v=  1.285
`define LEAF_T1_N97_C0  16'hFF45  // v= -0.729
`define LEAF_T1_N98_C0  16'h00F2  // v=  0.946
`define LEAF_T1_N101_C0  16'hFF6A  // v= -0.584
`define LEAF_T1_N102_C0  16'h0101  // v=  1.004
`define LEAF_T1_N104_C0  16'h0163  // v=  1.389
`define LEAF_T1_N105_C0  16'hFF7E  // v= -0.507
`define LEAF_T1_N109_C0  16'hFF23  // v= -0.865
`define LEAF_T1_N110_C0  16'hFFDC  // v= -0.140
`define LEAF_T1_N112_C0  16'h0210  // v=  2.062
`define LEAF_T1_N113_C0  16'hFEFD  // v= -1.010
`define LEAF_T1_N116_C0  16'hFF1E  // v= -0.883
`define LEAF_T1_N117_C0  16'hFFD6  // v= -0.165
`define LEAF_T1_N119_C0  16'hFF4B  // v= -0.707
`define LEAF_T1_N120_C0  16'hFF0D  // v= -0.949
`define LEAF_T2_N 5_C0  16'hFF0D  // v= -0.949
`define LEAF_T2_N 7_C0  16'h0168  // v=  1.407
`define LEAF_T2_N 8_C0  16'h015B  // v=  1.356
`define LEAF_T2_N11_C0  16'h0150  // v=  1.312
`define LEAF_T2_N12_C0  16'h0142  // v=  1.256
`define LEAF_T2_N13_C0  16'hFF09  // v= -0.964
`define LEAF_T2_N17_C0  16'h0142  // v=  1.257
`define LEAF_T2_N18_C0  16'h0014  // v=  0.078
`define LEAF_T2_N20_C0  16'h013A  // v=  1.227
`define LEAF_T2_N21_C0  16'h0128  // v=  1.155
`define LEAF_T2_N24_C0  16'h0144  // v=  1.264
`define LEAF_T2_N25_C0  16'h007C  // v=  0.485
`define LEAF_T2_N27_C0  16'h0120  // v=  1.126
`define LEAF_T2_N28_C0  16'h00F7  // v=  0.966
`define LEAF_T2_N33_C0  16'h00B7  // v=  0.715
`define LEAF_T2_N34_C0  16'hFFBA  // v= -0.273
`define LEAF_T2_N36_C0  16'h00F6  // v=  0.961
`define LEAF_T2_N37_C0  16'h0123  // v=  1.136
`define LEAF_T2_N40_C0  16'hFFDC  // v= -0.142
`define LEAF_T2_N41_C0  16'h0137  // v=  1.214
`define LEAF_T2_N43_C0  16'hFFB4  // v= -0.297
`define LEAF_T2_N44_C0  16'h00C4  // v=  0.766
`define LEAF_T2_N48_C0  16'hFFDE  // v= -0.134
`define LEAF_T2_N49_C0  16'h00A7  // v=  0.652
`define LEAF_T2_N51_C0  16'h007D  // v=  0.489
`define LEAF_T2_N52_C0  16'h00F1  // v=  0.942
`define LEAF_T2_N55_C0  16'h002B  // v=  0.169
`define LEAF_T2_N56_C0  16'h0087  // v=  0.527
`define LEAF_T2_N58_C0  16'hFEEB  // v= -1.084
`define LEAF_T2_N59_C0  16'h00D6  // v=  0.837
`define LEAF_T2_N65_C0  16'h017B  // v=  1.482
`define LEAF_T2_N66_C0  16'h00F2  // v=  0.947
`define LEAF_T2_N68_C0  16'hFEE7  // v= -1.099
`define LEAF_T2_N69_C0  16'h0152  // v=  1.322
`define LEAF_T2_N72_C0  16'h004E  // v=  0.304
`define LEAF_T2_N73_C0  16'h00D6  // v=  0.836
`define LEAF_T2_N75_C0  16'hFF09  // v= -0.966
`define LEAF_T2_N76_C0  16'hFFFA  // v= -0.025
`define LEAF_T2_N80_C0  16'hFFDB  // v= -0.146
`define LEAF_T2_N81_C0  16'h012E  // v=  1.178
`define LEAF_T2_N83_C0  16'h003F  // v=  0.246
`define LEAF_T2_N84_C0  16'hFFBE  // v= -0.259
`define LEAF_T2_N87_C0  16'h00E4  // v=  0.892
`define LEAF_T2_N88_C0  16'h0198  // v=  1.594
`define LEAF_T2_N90_C0  16'h00DD  // v=  0.863
`define LEAF_T2_N91_C0  16'hFFBF  // v= -0.253
`define LEAF_T2_N96_C0  16'hFFBE  // v= -0.256
`define LEAF_T2_N97_C0  16'h00C2  // v=  0.757
`define LEAF_T2_N99_C0  16'hFF59  // v= -0.652
`define LEAF_T2_N100_C0  16'h00E3  // v=  0.886
`define LEAF_T2_N103_C0  16'hFF6D  // v= -0.573
`define LEAF_T2_N104_C0  16'h00E4  // v=  0.889
`define LEAF_T2_N106_C0  16'h0148  // v=  1.280
`define LEAF_T2_N107_C0  16'hFF94  // v= -0.421
`define LEAF_T2_N111_C0  16'hFF2B  // v= -0.834
`define LEAF_T2_N112_C0  16'hFFE6  // v= -0.101
`define LEAF_T2_N114_C0  16'hFF0A  // v= -0.963
`define LEAF_T2_N115_C0  16'h0169  // v=  1.412
`define LEAF_T2_N118_C0  16'hFF93  // v= -0.427
`define LEAF_T2_N119_C0  16'hFF26  // v= -0.850
`define LEAF_T2_N121_C0  16'hFF4A  // v= -0.712
`define LEAF_T2_N122_C0  16'hFF18  // v= -0.908
`define LEAF_T3_N 6_C0  16'h0140  // v=  1.249
`define LEAF_T3_N 7_C0  16'h0133  // v=  1.201
`define LEAF_T3_N 8_C0  16'hFF0E  // v= -0.946
`define LEAF_T3_N11_C0  16'h0129  // v=  1.160
`define LEAF_T3_N12_C0  16'h011C  // v=  1.108
`define LEAF_T3_N13_C0  16'hFF0A  // v= -0.959
`define LEAF_T3_N17_C0  16'hFEB1  // v= -1.310
`define LEAF_T3_N18_C0  16'h00D3  // v=  0.826
`define LEAF_T3_N20_C0  16'h0116  // v=  1.085
`define LEAF_T3_N21_C0  16'h0050  // v=  0.311
`define LEAF_T3_N24_C0  16'hFEEA  // v= -1.088
`define LEAF_T3_N25_C0  16'h0124  // v=  1.141
`define LEAF_T3_N27_C0  16'h0105  // v=  1.018
`define LEAF_T3_N28_C0  16'h00EA  // v=  0.914
`define LEAF_T3_N33_C0  16'h0163  // v=  1.387
`define LEAF_T3_N34_C0  16'h0080  // v=  0.501
`define LEAF_T3_N36_C0  16'h00A4  // v=  0.641
`define LEAF_T3_N37_C0  16'h00EA  // v=  0.916
`define LEAF_T3_N40_C0  16'h010A  // v=  1.040
`define LEAF_T3_N41_C0  16'h00BB  // v=  0.731
`define LEAF_T3_N43_C0  16'h00BE  // v=  0.743
`define LEAF_T3_N44_C0  16'h0076  // v=  0.459
`define LEAF_T3_N48_C0  16'h00C5  // v=  0.771
`define LEAF_T3_N49_C0  16'h006F  // v=  0.434
`define LEAF_T3_N51_C0  16'h010D  // v=  1.052
`define LEAF_T3_N52_C0  16'h0095  // v=  0.583
`define LEAF_T3_N55_C0  16'h00C5  // v=  0.768
`define LEAF_T3_N56_C0  16'h001E  // v=  0.117
`define LEAF_T3_N58_C0  16'h0112  // v=  1.068
`define LEAF_T3_N59_C0  16'hFEF1  // v= -1.060
`define LEAF_T3_N64_C0  16'hFF05  // v= -0.981
`define LEAF_T3_N66_C0  16'h012D  // v=  1.177
`define LEAF_T3_N67_C0  16'h008F  // v=  0.559
`define LEAF_T3_N70_C0  16'h0062  // v=  0.382
`define LEAF_T3_N71_C0  16'h0012  // v=  0.071
`define LEAF_T3_N73_C0  16'h00C9  // v=  0.784
`define LEAF_T3_N74_C0  16'hFFA4  // v= -0.357
`define LEAF_T3_N78_C0  16'hFFB6  // v= -0.289
`define LEAF_T3_N79_C0  16'h0080  // v=  0.500
`define LEAF_T3_N81_C0  16'hFFA0  // v= -0.375
`define LEAF_T3_N82_C0  16'hFF45  // v= -0.732
`define LEAF_T3_N85_C0  16'h0028  // v=  0.157
`define LEAF_T3_N86_C0  16'h0124  // v=  1.143
`define LEAF_T3_N88_C0  16'h0091  // v=  0.565
`define LEAF_T3_N89_C0  16'hFFC2  // v= -0.242
`define LEAF_T3_N94_C0  16'hFFB1  // v= -0.310
`define LEAF_T3_N95_C0  16'h00AE  // v=  0.678
`define LEAF_T3_N97_C0  16'h001E  // v=  0.116
`define LEAF_T3_N98_C0  16'hFF55  // v= -0.667
`define LEAF_T3_N101_C0  16'h0007  // v=  0.026
`define LEAF_T3_N102_C0  16'h00EC  // v=  0.923
`define LEAF_T3_N104_C0  16'hFF09  // v= -0.966
`define LEAF_T3_N105_C0  16'hFF1A  // v= -0.897
`define LEAF_T3_N109_C0  16'hFF27  // v= -0.849
`define LEAF_T3_N110_C0  16'hFF8A  // v= -0.462
`define LEAF_T3_N112_C0  16'h002F  // v=  0.185
`define LEAF_T3_N113_C0  16'hFF6C  // v= -0.578
`define LEAF_T3_N116_C0  16'hFF35  // v= -0.792
`define LEAF_T3_N117_C0  16'hFFE4  // v= -0.110
`define LEAF_T3_N119_C0  16'hFF63  // v= -0.614
`define LEAF_T3_N120_C0  16'hFF21  // v= -0.872
`define LEAF_T4_N 5_C0  16'hFF18  // v= -0.905
`define LEAF_T4_N 7_C0  16'h0122  // v=  1.132
`define LEAF_T4_N 8_C0  16'h0118  // v=  1.093
`define LEAF_T4_N11_C0  16'h0113  // v=  1.073
`define LEAF_T4_N12_C0  16'h0105  // v=  1.018
`define LEAF_T4_N13_C0  16'hFF11  // v= -0.933
`define LEAF_T4_N17_C0  16'h00AD  // v=  0.676
`define LEAF_T4_N18_C0  16'hFEA8  // v= -1.342
`define LEAF_T4_N20_C0  16'h0103  // v=  1.013
`define LEAF_T4_N21_C0  16'h00EC  // v=  0.920
`define LEAF_T4_N24_C0  16'hFEA4  // v= -1.359
`define LEAF_T4_N25_C0  16'h0092  // v=  0.570
`define LEAF_T4_N27_C0  16'h00D2  // v=  0.819
`define LEAF_T4_N28_C0  16'h00FB  // v=  0.980
`define LEAF_T4_N33_C0  16'hFFE1  // v= -0.121
`define LEAF_T4_N34_C0  16'h00D8  // v=  0.845
`define LEAF_T4_N36_C0  16'h00DF  // v=  0.871
`define LEAF_T4_N37_C0  16'h00A5  // v=  0.644
`define LEAF_T4_N40_C0  16'h0072  // v=  0.446
`define LEAF_T4_N41_C0  16'hFEC7  // v= -1.224
`define LEAF_T4_N43_C0  16'h0024  // v=  0.141
`define LEAF_T4_N44_C0  16'h00AF  // v=  0.683
`define LEAF_T4_N48_C0  16'h0005  // v=  0.021
`define LEAF_T4_N49_C0  16'h00B0  // v=  0.686
`define LEAF_T4_N51_C0  16'h0045  // v=  0.268
`define LEAF_T4_N52_C0  16'h009C  // v=  0.608
`define LEAF_T4_N55_C0  16'hFFF8  // v= -0.032
`define LEAF_T4_N56_C0  16'h0044  // v=  0.267
`define LEAF_T4_N58_C0  16'h010A  // v=  1.039
`define LEAF_T4_N59_C0  16'h0042  // v=  0.258
`define LEAF_T4_N64_C0  16'hFF0A  // v= -0.962
`define LEAF_T4_N66_C0  16'h00CA  // v=  0.791
`define LEAF_T4_N67_C0  16'h012F  // v=  1.184
`define LEAF_T4_N70_C0  16'hFFC4  // v= -0.234
`define LEAF_T4_N71_C0  16'h0084  // v=  0.515
`define LEAF_T4_N73_C0  16'h007A  // v=  0.477
`define LEAF_T4_N74_C0  16'h0013  // v=  0.075
`define LEAF_T4_N78_C0  16'hFFBE  // v= -0.258
`define LEAF_T4_N79_C0  16'h01CC  // v=  1.796
`define LEAF_T4_N81_C0  16'h004F  // v=  0.308
`define LEAF_T4_N82_C0  16'hFFEE  // v= -0.070
`define LEAF_T4_N85_C0  16'h01B6  // v=  1.711
`define LEAF_T4_N86_C0  16'hFF11  // v= -0.934
`define LEAF_T4_N88_C0  16'hFF11  // v= -0.934
`define LEAF_T4_N89_C0  16'h0010  // v=  0.061
`define LEAF_T4_N94_C0  16'hFFAF  // v= -0.318
`define LEAF_T4_N95_C0  16'h0154  // v=  1.329
`define LEAF_T4_N97_C0  16'h001E  // v=  0.117
`define LEAF_T4_N98_C0  16'hFF63  // v= -0.614
`define LEAF_T4_N101_C0  16'h0102  // v=  1.008
`define LEAF_T4_N102_C0  16'hFF06  // v= -0.975
`define LEAF_T4_N104_C0  16'h0085  // v=  0.518
`define LEAF_T4_N105_C0  16'hFF86  // v= -0.476
`define LEAF_T4_N109_C0  16'h00D1  // v=  0.815
`define LEAF_T4_N110_C0  16'hFF7E  // v= -0.508
`define LEAF_T4_N111_C0  16'h0201  // v=  2.005
`define LEAF_T4_N114_C0  16'hFFAD  // v= -0.323
`define LEAF_T4_N115_C0  16'hFF39  // v= -0.778
`define LEAF_T4_N117_C0  16'hFF5F  // v= -0.628
`define LEAF_T4_N118_C0  16'hFF28  // v= -0.844
`define LEAF_T5_N 6_C0  16'h00FC  // v=  0.983
`define LEAF_T5_N 7_C0  16'h010A  // v=  1.040
`define LEAF_T5_N 8_C0  16'hFF19  // v= -0.901
`define LEAF_T5_N11_C0  16'h00FB  // v=  0.980
`define LEAF_T5_N12_C0  16'h00EC  // v=  0.922
`define LEAF_T5_N13_C0  16'hFF13  // v= -0.927
`define LEAF_T5_N17_C0  16'h00E7  // v=  0.902
`define LEAF_T5_N18_C0  16'h00BC  // v=  0.735
`define LEAF_T5_N20_C0  16'hFE81  // v= -1.496
`define LEAF_T5_N21_C0  16'h007B  // v=  0.481
`define LEAF_T5_N24_C0  16'h00D6  // v=  0.835
`define LEAF_T5_N25_C0  16'h00AE  // v=  0.678
`define LEAF_T5_N27_C0  16'h00AB  // v=  0.668
`define LEAF_T5_N28_C0  16'h00E4  // v=  0.892
`define LEAF_T5_N33_C0  16'h012C  // v=  1.171
`define LEAF_T5_N34_C0  16'h005E  // v=  0.367
`define LEAF_T5_N36_C0  16'h00F1  // v=  0.941
`define LEAF_T5_N37_C0  16'h00B4  // v=  0.701
`define LEAF_T5_N40_C0  16'h00E3  // v=  0.885
`define LEAF_T5_N41_C0  16'hFEB2  // v= -1.305
`define LEAF_T5_N43_C0  16'h016D  // v=  1.427
`define LEAF_T5_N44_C0  16'h007F  // v=  0.497
`define LEAF_T5_N48_C0  16'hFF20  // v= -0.876
`define LEAF_T5_N49_C0  16'h0049  // v=  0.283
`define LEAF_T5_N51_C0  16'h00B3  // v=  0.700
`define LEAF_T5_N52_C0  16'h006D  // v=  0.426
`define LEAF_T5_N55_C0  16'hFFF7  // v= -0.035
`define LEAF_T5_N56_C0  16'h0049  // v=  0.285
`define LEAF_T5_N58_C0  16'h00A0  // v=  0.624
`define LEAF_T5_N59_C0  16'h002B  // v=  0.170
`define LEAF_T5_N65_C0  16'h0053  // v=  0.324
`define LEAF_T5_N66_C0  16'hFF92  // v= -0.430
`define LEAF_T5_N68_C0  16'h014F  // v=  1.308
`define LEAF_T5_N69_C0  16'h0094  // v=  0.578
`define LEAF_T5_N72_C0  16'h00D3  // v=  0.824
`define LEAF_T5_N73_C0  16'hFFA2  // v= -0.369
`define LEAF_T5_N75_C0  16'hFF51  // v= -0.684
`define LEAF_T5_N76_C0  16'h00B9  // v=  0.722
`define LEAF_T5_N80_C0  16'hFFC8  // v= -0.219
`define LEAF_T5_N81_C0  16'h0143  // v=  1.264
`define LEAF_T5_N83_C0  16'hFFDC  // v= -0.141
`define LEAF_T5_N84_C0  16'h004B  // v=  0.293
`define LEAF_T5_N87_C0  16'hFF6E  // v= -0.570
`define LEAF_T5_N88_C0  16'h00FE  // v=  0.992
`define LEAF_T5_N90_C0  16'hFFDF  // v= -0.130
`define LEAF_T5_N91_C0  16'hFF64  // v= -0.609
`define LEAF_T5_N95_C0  16'h01EA  // v=  1.913
`define LEAF_T5_N97_C0  16'h00F0  // v=  0.936
`define LEAF_T5_N98_C0  16'hFF15  // v= -0.916
`define LEAF_T5_N101_C0  16'hFF8C  // v= -0.455
`define LEAF_T5_N102_C0  16'h006A  // v=  0.415
`define LEAF_T5_N104_C0  16'h01D5  // v=  1.832
`define LEAF_T5_N105_C0  16'hFF20  // v= -0.874
`define LEAF_T5_N108_C0  16'h027D  // v=  2.489
`define LEAF_T5_N110_C0  16'hFFE8  // v= -0.093
`define LEAF_T5_N111_C0  16'hFF4B  // v= -0.708
`define LEAF_T5_N114_C0  16'hFF4D  // v= -0.699
`define LEAF_T5_N115_C0  16'h01CD  // v=  1.800
`define LEAF_T5_N117_C0  16'hFF7B  // v= -0.521
`define LEAF_T5_N118_C0  16'hFF2F  // v= -0.818
`define LEAF_T6_N 6_C0  16'h00F7  // v=  0.965
`define LEAF_T6_N 7_C0  16'h002E  // v=  0.179
`define LEAF_T6_N 9_C0  16'hFE2E  // v= -1.818
`define LEAF_T6_N10_C0  16'h00B5  // v=  0.709
`define LEAF_T6_N12_C0  16'hFE99  // v= -1.403
`define LEAF_T6_N14_C0  16'h00A8  // v=  0.655
`define LEAF_T6_N15_C0  16'h00E2  // v=  0.881
`define LEAF_T6_N19_C0  16'hFE88  // v= -1.468
`define LEAF_T6_N20_C0  16'h008D  // v=  0.550
`define LEAF_T6_N22_C0  16'h00D2  // v=  0.820
`define LEAF_T6_N23_C0  16'h0095  // v=  0.583
`define LEAF_T6_N26_C0  16'hFEE5  // v= -1.104
`define LEAF_T6_N27_C0  16'h00ED  // v=  0.928
`define LEAF_T6_N29_C0  16'h00B1  // v=  0.691
`define LEAF_T6_N30_C0  16'hFFD9  // v= -0.151
`define LEAF_T6_N35_C0  16'hFEB5  // v= -1.291
`define LEAF_T6_N36_C0  16'h00A3  // v=  0.638
`define LEAF_T6_N38_C0  16'hFE8B  // v= -1.458
`define LEAF_T6_N39_C0  16'h00FC  // v=  0.986
`define LEAF_T6_N42_C0  16'h00E4  // v=  0.892
`define LEAF_T6_N43_C0  16'h008C  // v=  0.548
`define LEAF_T6_N45_C0  16'h006E  // v=  0.431
`define LEAF_T6_N46_C0  16'h00EE  // v=  0.929
`define LEAF_T6_N50_C0  16'h0050  // v=  0.311
`define LEAF_T6_N51_C0  16'h00C7  // v=  0.779
`define LEAF_T6_N53_C0  16'h0001  // v=  0.004
`define LEAF_T6_N54_C0  16'h00AA  // v=  0.665
`define LEAF_T6_N57_C0  16'hFF2C  // v= -0.827
`define LEAF_T6_N58_C0  16'h0023  // v=  0.135
`define LEAF_T6_N60_C0  16'h00DB  // v=  0.854
`define LEAF_T6_N61_C0  16'hFEF4  // v= -1.048
`define LEAF_T6_N67_C0  16'h004C  // v=  0.296
`define LEAF_T6_N68_C0  16'hFF96  // v= -0.413
`define LEAF_T6_N70_C0  16'h0131  // v=  1.193
`define LEAF_T6_N71_C0  16'h0085  // v=  0.520
`define LEAF_T6_N74_C0  16'h00C2  // v=  0.758
`define LEAF_T6_N75_C0  16'hFFAA  // v= -0.335
`define LEAF_T6_N77_C0  16'hFEFC  // v= -1.016
`define LEAF_T6_N78_C0  16'h0098  // v=  0.594
`define LEAF_T6_N82_C0  16'hFF04  // v= -0.983
`define LEAF_T6_N83_C0  16'hFF17  // v= -0.912
`define LEAF_T6_N85_C0  16'h008B  // v=  0.543
`define LEAF_T6_N86_C0  16'hFF17  // v= -0.910
`define LEAF_T6_N89_C0  16'hFFE1  // v= -0.120
`define LEAF_T6_N90_C0  16'h00DC  // v=  0.859
`define LEAF_T6_N92_C0  16'h0061  // v=  0.381
`define LEAF_T6_N93_C0  16'hFF31  // v= -0.809
`define LEAF_T6_N98_C0  16'h0228  // v=  2.157
`define LEAF_T6_N99_C0  16'h01AA  // v=  1.664
`define LEAF_T6_N100_C0  16'h0112  // v=  1.071
`define LEAF_T6_N103_C0  16'hFF41  // v= -0.747
`define LEAF_T6_N104_C0  16'hFF96  // v= -0.412
`define LEAF_T6_N106_C0  16'h0003  // v=  0.011
`define LEAF_T6_N107_C0  16'hFF94  // v= -0.423
`define LEAF_T6_N111_C0  16'hFFD2  // v= -0.180
`define LEAF_T6_N112_C0  16'hFF50  // v= -0.688
`define LEAF_T6_N114_C0  16'h0050  // v=  0.312
`define LEAF_T6_N115_C0  16'hFF83  // v= -0.488
`define LEAF_T6_N118_C0  16'hFF55  // v= -0.668
`define LEAF_T6_N119_C0  16'h0273  // v=  2.448
`define LEAF_T6_N121_C0  16'hFF51  // v= -0.685
`define LEAF_T6_N122_C0  16'hFF34  // v= -0.798
`define LEAF_T7_N 6_C0  16'h00D8  // v=  0.843
`define LEAF_T7_N 7_C0  16'h00EA  // v=  0.916
`define LEAF_T7_N 9_C0  16'h00DA  // v=  0.853
`define LEAF_T7_N10_C0  16'hFF19  // v= -0.902
`define LEAF_T7_N13_C0  16'h00B1  // v=  0.692
`define LEAF_T7_N14_C0  16'h00C7  // v=  0.778
`define LEAF_T7_N16_C0  16'hFE40  // v= -1.751
`define LEAF_T7_N17_C0  16'h0062  // v=  0.384
`define LEAF_T7_N21_C0  16'h00AB  // v=  0.668
`define LEAF_T7_N22_C0  16'hFF6D  // v= -0.576
`define LEAF_T7_N23_C0  16'hFE84  // v= -1.486
`define LEAF_T7_N26_C0  16'h002B  // v=  0.168
`define LEAF_T7_N27_C0  16'h0087  // v=  0.527
`define LEAF_T7_N29_C0  16'h0097  // v=  0.592
`define LEAF_T7_N30_C0  16'h00E8  // v=  0.906
`define LEAF_T7_N35_C0  16'h00AE  // v=  0.682
`define LEAF_T7_N36_C0  16'hFF53  // v= -0.678
`define LEAF_T7_N38_C0  16'h0135  // v=  1.207
`define LEAF_T7_N39_C0  16'hFEA1  // v= -1.372
`define LEAF_T7_N42_C0  16'h0073  // v=  0.448
`define LEAF_T7_N43_C0  16'h00CE  // v=  0.803
`define LEAF_T7_N45_C0  16'h003E  // v=  0.241
`define LEAF_T7_N46_C0  16'h00A3  // v=  0.635
`define LEAF_T7_N50_C0  16'h005A  // v=  0.352
`define LEAF_T7_N51_C0  16'h0011  // v=  0.066
`define LEAF_T7_N53_C0  16'h0061  // v=  0.378
`define LEAF_T7_N54_C0  16'h00FD  // v=  0.990
`define LEAF_T7_N57_C0  16'h000A  // v=  0.040
`define LEAF_T7_N58_C0  16'hFF3D  // v= -0.761
`define LEAF_T7_N60_C0  16'h0116  // v=  1.086
`define LEAF_T7_N61_C0  16'h003B  // v=  0.232
`define LEAF_T7_N67_C0  16'hFEEE  // v= -1.069
`define LEAF_T7_N68_C0  16'hFFF0  // v= -0.063
`define LEAF_T7_N70_C0  16'h00AD  // v=  0.676
`define LEAF_T7_N71_C0  16'h0043  // v=  0.263
`define LEAF_T7_N74_C0  16'h0013  // v=  0.072
`define LEAF_T7_N75_C0  16'h0076  // v=  0.462
`define LEAF_T7_N77_C0  16'hFF22  // v= -0.868
`define LEAF_T7_N78_C0  16'h0006  // v=  0.025
`define LEAF_T7_N82_C0  16'h0011  // v=  0.067
`define LEAF_T7_N83_C0  16'hFF24  // v= -0.858
`define LEAF_T7_N85_C0  16'h0047  // v=  0.278
`define LEAF_T7_N86_C0  16'h01ED  // v=  1.926
`define LEAF_T7_N89_C0  16'hFFA6  // v= -0.352
`define LEAF_T7_N90_C0  16'hFFF3  // v= -0.051
`define LEAF_T7_N92_C0  16'hFFE2  // v= -0.118
`define LEAF_T7_N93_C0  16'hFF45  // v= -0.729
`define LEAF_T7_N98_C0  16'hFF1E  // v= -0.884
`define LEAF_T7_N99_C0  16'h0122  // v=  1.133
`define LEAF_T7_N101_C0  16'h014E  // v=  1.303
`define LEAF_T7_N102_C0  16'hFFB1  // v= -0.308
`define LEAF_T7_N105_C0  16'h018A  // v=  1.538
`define LEAF_T7_N106_C0  16'hFFDD  // v= -0.136
`define LEAF_T7_N108_C0  16'hFF5E  // v= -0.633
`define LEAF_T7_N109_C0  16'hFFEB  // v= -0.081
`define LEAF_T7_N112_C0  16'h0236  // v=  2.210
`define LEAF_T7_N114_C0  16'hFF46  // v= -0.725
`define LEAF_T7_N115_C0  16'hFF80  // v= -0.502
`define LEAF_T7_N118_C0  16'hFF67  // v= -0.598
`define LEAF_T7_N119_C0  16'h0213  // v=  2.073
`define LEAF_T7_N121_C0  16'hFF59  // v= -0.651
`define LEAF_T7_N122_C0  16'hFF38  // v= -0.781
`define LEAF_T8_N 5_C0  16'hFF1A  // v= -0.898
`define LEAF_T8_N 7_C0  16'h00E7  // v=  0.902
`define LEAF_T8_N 8_C0  16'h00DC  // v=  0.859
`define LEAF_T8_N11_C0  16'h004A  // v=  0.289
`define LEAF_T8_N12_C0  16'h00C3  // v=  0.763
`define LEAF_T8_N13_C0  16'hFF03  // v= -0.990
`define LEAF_T8_N17_C0  16'h0078  // v=  0.467
`define LEAF_T8_N18_C0  16'h00A5  // v=  0.643
`define LEAF_T8_N19_C0  16'hFE9D  // v= -1.388
`define LEAF_T8_N22_C0  16'h0093  // v=  0.574
`define LEAF_T8_N23_C0  16'hFE93  // v= -1.425
`define LEAF_T8_N25_C0  16'h0079  // v=  0.471
`define LEAF_T8_N26_C0  16'h0045  // v=  0.268
`define LEAF_T8_N31_C0  16'h008D  // v=  0.553
`define LEAF_T8_N32_C0  16'h003B  // v=  0.229
`define LEAF_T8_N34_C0  16'hFEBE  // v= -1.259
`define LEAF_T8_N35_C0  16'hFE82  // v= -1.492
`define LEAF_T8_N38_C0  16'h0076  // v=  0.461
`define LEAF_T8_N39_C0  16'hFEA3  // v= -1.365
`define LEAF_T8_N41_C0  16'h0037  // v=  0.214
`define LEAF_T8_N42_C0  16'h00E0  // v=  0.875
`define LEAF_T8_N46_C0  16'h0080  // v=  0.499
`define LEAF_T8_N47_C0  16'h0017  // v=  0.090
`define LEAF_T8_N49_C0  16'hFFFB  // v= -0.019
`define LEAF_T8_N50_C0  16'h0070  // v=  0.436
`define LEAF_T8_N53_C0  16'h00AA  // v=  0.665
`define LEAF_T8_N54_C0  16'h003D  // v=  0.239
`define LEAF_T8_N56_C0  16'hFFA6  // v= -0.353
`define LEAF_T8_N57_C0  16'h0116  // v=  1.085
`define LEAF_T8_N63_C0  16'hFF65  // v= -0.604
`define LEAF_T8_N64_C0  16'h0038  // v=  0.218
`define LEAF_T8_N66_C0  16'hFF2B  // v= -0.832
`define LEAF_T8_N67_C0  16'h0009  // v=  0.037
`define LEAF_T8_N70_C0  16'h00CC  // v=  0.797
`define LEAF_T8_N71_C0  16'hFF72  // v= -0.556
`define LEAF_T8_N73_C0  16'hFFED  // v= -0.074
`define LEAF_T8_N74_C0  16'h0080  // v=  0.500
`define LEAF_T8_N78_C0  16'h01A3  // v=  1.635
`define LEAF_T8_N79_C0  16'hFFC7  // v= -0.224
`define LEAF_T8_N81_C0  16'h0047  // v=  0.279
`define LEAF_T8_N82_C0  16'h01B1  // v=  1.693
`define LEAF_T8_N85_C0  16'hFFCD  // v= -0.199
`define LEAF_T8_N86_C0  16'h00E8  // v=  0.906
`define LEAF_T8_N88_C0  16'h0218  // v=  2.092
`define LEAF_T8_N89_C0  16'hFF64  // v= -0.610
`define LEAF_T8_N94_C0  16'hFF24  // v= -0.860
`define LEAF_T8_N95_C0  16'h0133  // v=  1.200
`define LEAF_T8_N97_C0  16'hFFC2  // v= -0.244
`define LEAF_T8_N98_C0  16'h0148  // v=  1.283
`define LEAF_T8_N101_C0  16'hFF6C  // v= -0.576
`define LEAF_T8_N102_C0  16'h0030  // v=  0.188
`define LEAF_T8_N104_C0  16'hFF3A  // v= -0.774
`define LEAF_T8_N105_C0  16'h0430  // v=  4.188
`define LEAF_T8_N109_C0  16'h0362  // v=  3.382
`define LEAF_T8_N110_C0  16'hFF33  // v= -0.799
`define LEAF_T8_N112_C0  16'hFF50  // v= -0.687
`define LEAF_T8_N113_C0  16'hFFA6  // v= -0.350
`define LEAF_T8_N116_C0  16'hFF6E  // v= -0.572
`define LEAF_T8_N117_C0  16'h01D2  // v=  1.819
`define LEAF_T8_N119_C0  16'hFF5F  // v= -0.628
`define LEAF_T8_N120_C0  16'hFF3C  // v= -0.766
`define LEAF_T9_N 6_C0  16'h00D5  // v=  0.832
`define LEAF_T9_N 7_C0  16'h0035  // v=  0.209
`define LEAF_T9_N 9_C0  16'h00C0  // v=  0.750
`define LEAF_T9_N10_C0  16'h00CA  // v=  0.790
`define LEAF_T9_N13_C0  16'hFDE4  // v= -2.108
`define LEAF_T9_N14_C0  16'h0040  // v=  0.249
`define LEAF_T9_N16_C0  16'h00A4  // v=  0.643
`define LEAF_T9_N17_C0  16'h00E3  // v=  0.885
`define LEAF_T9_N21_C0  16'hFDE0  // v= -2.125
`define LEAF_T9_N22_C0  16'hFE00  // v= -1.999
`define LEAF_T9_N24_C0  16'h0091  // v=  0.565
`define LEAF_T9_N25_C0  16'h002F  // v=  0.184
`define LEAF_T9_N28_C0  16'h007A  // v=  0.478
`define LEAF_T9_N29_C0  16'h00C5  // v=  0.768
`define LEAF_T9_N31_C0  16'h005A  // v=  0.351
`define LEAF_T9_N32_C0  16'hFF54  // v= -0.672
`define LEAF_T9_N37_C0  16'h0068  // v=  0.405
`define LEAF_T9_N38_C0  16'h00B9  // v=  0.724
`define LEAF_T9_N40_C0  16'hFE9B  // v= -1.394
`define LEAF_T9_N41_C0  16'h004B  // v=  0.295
`define LEAF_T9_N44_C0  16'hFE4B  // v= -1.707
`define LEAF_T9_N45_C0  16'hFE9A  // v= -1.399
`define LEAF_T9_N47_C0  16'h0036  // v=  0.210
`define LEAF_T9_N48_C0  16'hFFB2  // v= -0.306
`define LEAF_T9_N52_C0  16'hFFF6  // v= -0.039
`define LEAF_T9_N53_C0  16'h003A  // v=  0.225
`define LEAF_T9_N55_C0  16'hFFE3  // v= -0.113
`define LEAF_T9_N56_C0  16'h0072  // v=  0.447
`define LEAF_T9_N59_C0  16'h004C  // v=  0.298
`define LEAF_T9_N60_C0  16'h00C1  // v=  0.753
`define LEAF_T9_N62_C0  16'h0025  // v=  0.144
`define LEAF_T9_N63_C0  16'hFF0B  // v= -0.956
`define LEAF_T9_N69_C0  16'h016F  // v=  1.432
`define LEAF_T9_N70_C0  16'h01A4  // v=  1.642
`define LEAF_T9_N72_C0  16'h00D4  // v=  0.827
`define LEAF_T9_N73_C0  16'hFEDF  // v= -1.128
`define LEAF_T9_N76_C0  16'hFFF6  // v= -0.040
`define LEAF_T9_N77_C0  16'hFEEF  // v= -1.065
`define LEAF_T9_N79_C0  16'h0057  // v=  0.341
`define LEAF_T9_N80_C0  16'h0012  // v=  0.070
`define LEAF_T9_N84_C0  16'hFFD3  // v= -0.176
`define LEAF_T9_N85_C0  16'h0082  // v=  0.509
`define LEAF_T9_N87_C0  16'hFF23  // v= -0.865
`define LEAF_T9_N88_C0  16'h008B  // v=  0.543
`define LEAF_T9_N91_C0  16'hFFBA  // v= -0.273
`define LEAF_T9_N92_C0  16'h0011  // v=  0.067
`define LEAF_T9_N94_C0  16'hFF5A  // v= -0.648
`define LEAF_T9_N95_C0  16'hFFC4  // v= -0.236
`define LEAF_T9_N100_C0  16'hFF0C  // v= -0.954
`define LEAF_T9_N101_C0  16'h00FA  // v=  0.975
`define LEAF_T9_N103_C0  16'hFF20  // v= -0.875
`define LEAF_T9_N104_C0  16'h00C2  // v=  0.757
`define LEAF_T9_N107_C0  16'hFF22  // v= -0.867
`define LEAF_T9_N108_C0  16'h008B  // v=  0.544
`define LEAF_T9_N110_C0  16'h002C  // v=  0.170
`define LEAF_T9_N111_C0  16'h01A4  // v=  1.641
`define LEAF_T9_N115_C0  16'hFF82  // v= -0.491
`define LEAF_T9_N116_C0  16'h0173  // v=  1.448
`define LEAF_T9_N117_C0  16'h0272  // v=  2.444
`define LEAF_T9_N120_C0  16'hFF58  // v= -0.657
`define LEAF_T9_N121_C0  16'h0318  // v=  3.094
`define LEAF_T9_N123_C0  16'hFFAB  // v= -0.332
`define LEAF_T9_N124_C0  16'hFF40  // v= -0.751
// Class MEDIUM:
`define LEAF_T0_N 6_C1  16'hFF0F  // v= -0.942
`define LEAF_T0_N 7_C1  16'h0200  // v=  2.000
`define LEAF_T0_N 8_C1  16'h0200  // v=  2.000
`define LEAF_T0_N10_C1  16'h0200  // v=  2.000
`define LEAF_T0_N12_C1  16'hFF05  // v= -0.979
`define LEAF_T0_N13_C1  16'hFF00  // v= -0.999
`define LEAF_T0_N17_C1  16'hFF32  // v= -0.804
`define LEAF_T0_N18_C1  16'hFF05  // v= -0.982
`define LEAF_T0_N20_C1  16'hFF4E  // v= -0.696
`define LEAF_T0_N21_C1  16'h0200  // v=  2.000
`define LEAF_T0_N24_C1  16'h0200  // v=  2.000
`define LEAF_T0_N25_C1  16'h0200  // v=  2.000
`define LEAF_T0_N27_C1  16'h0200  // v=  2.000
`define LEAF_T0_N28_C1  16'h0200  // v=  2.000
`define LEAF_T0_N33_C1  16'hFF68  // v= -0.592
`define LEAF_T0_N34_C1  16'hFF2A  // v= -0.835
`define LEAF_T0_N36_C1  16'hFF8A  // v= -0.462
`define LEAF_T0_N37_C1  16'h00FC  // v=  0.984
`define LEAF_T0_N40_C1  16'hFF8F  // v= -0.441
`define LEAF_T0_N41_C1  16'hFFE6  // v= -0.102
`define LEAF_T0_N43_C1  16'hFFEF  // v= -0.068
`define LEAF_T0_N44_C1  16'hFF07  // v= -0.971
`define LEAF_T0_N48_C1  16'h0200  // v=  2.000
`define LEAF_T0_N49_C1  16'h0200  // v=  2.000
`define LEAF_T0_N51_C1  16'hFF1B  // v= -0.896
`define LEAF_T0_N52_C1  16'h010B  // v=  1.043
`define LEAF_T0_N53_C1  16'h0200  // v=  2.000
`define LEAF_T0_N59_C1  16'h0200  // v=  2.000
`define LEAF_T0_N60_C1  16'hFF6C  // v= -0.579
`define LEAF_T0_N62_C1  16'h0005  // v=  0.019
`define LEAF_T0_N63_C1  16'h0043  // v=  0.263
`define LEAF_T0_N66_C1  16'hFFBE  // v= -0.258
`define LEAF_T0_N67_C1  16'h0064  // v=  0.390
`define LEAF_T0_N69_C1  16'hFFC4  // v= -0.236
`define LEAF_T0_N70_C1  16'h00FD  // v=  0.990
`define LEAF_T0_N74_C1  16'h00D5  // v=  0.831
`define LEAF_T0_N75_C1  16'hFFEB  // v= -0.081
`define LEAF_T0_N77_C1  16'hFFFB  // v= -0.021
`define LEAF_T0_N78_C1  16'h005C  // v=  0.358
`define LEAF_T0_N81_C1  16'h00F3  // v=  0.948
`define LEAF_T0_N82_C1  16'h0151  // v=  1.317
`define LEAF_T0_N84_C1  16'h005B  // v=  0.357
`define LEAF_T0_N85_C1  16'h00F6  // v=  0.961
`define LEAF_T0_N90_C1  16'h00C8  // v=  0.782
`define LEAF_T0_N91_C1  16'h0163  // v=  1.386
`define LEAF_T0_N93_C1  16'hFFFD  // v= -0.012
`define LEAF_T0_N94_C1  16'h010F  // v=  1.060
`define LEAF_T0_N97_C1  16'h012B  // v=  1.169
`define LEAF_T0_N98_C1  16'h01B7  // v=  1.717
`define LEAF_T0_N100_C1  16'h01E3  // v=  1.885
`define LEAF_T0_N101_C1  16'h01F8  // v=  1.967
`define LEAF_T0_N103_C1  16'hFF00  // v= -1.000
`define LEAF_T0_N104_C1  16'h0200  // v=  2.000
`define LEAF_T1_N 6_C1  16'hFF1E  // v= -0.882
`define LEAF_T1_N 7_C1  16'h01AF  // v=  1.682
`define LEAF_T1_N 9_C1  16'h01A8  // v=  1.654
`define LEAF_T1_N10_C1  16'h01CF  // v=  1.809
`define LEAF_T1_N12_C1  16'h01A8  // v=  1.654
`define LEAF_T1_N14_C1  16'hFF0D  // v= -0.949
`define LEAF_T1_N15_C1  16'hFF11  // v= -0.932
`define LEAF_T1_N19_C1  16'hFF50  // v= -0.687
`define LEAF_T1_N20_C1  16'h01C6  // v=  1.774
`define LEAF_T1_N22_C1  16'hFF09  // v= -0.964
`define LEAF_T1_N23_C1  16'h01CA  // v=  1.789
`define LEAF_T1_N25_C1  16'h01A8  // v=  1.656
`define LEAF_T1_N26_C1  16'h01A8  // v=  1.654
`define LEAF_T1_N31_C1  16'hFF66  // v= -0.603
`define LEAF_T1_N32_C1  16'hFFA4  // v= -0.361
`define LEAF_T1_N34_C1  16'hFF93  // v= -0.426
`define LEAF_T1_N35_C1  16'h00E7  // v=  0.901
`define LEAF_T1_N38_C1  16'hFF99  // v= -0.402
`define LEAF_T1_N39_C1  16'hFFE5  // v= -0.107
`define LEAF_T1_N41_C1  16'hFFF1  // v= -0.059
`define LEAF_T1_N42_C1  16'hFF14  // v= -0.922
`define LEAF_T1_N46_C1  16'hFF3D  // v= -0.763
`define LEAF_T1_N47_C1  16'h01B5  // v=  1.709
`define LEAF_T1_N49_C1  16'hFF73  // v= -0.549
`define LEAF_T1_N50_C1  16'h01BA  // v=  1.728
`define LEAF_T1_N53_C1  16'h01A8  // v=  1.655
`define LEAF_T1_N54_C1  16'h01BC  // v=  1.736
`define LEAF_T1_N56_C1  16'h01AA  // v=  1.663
`define LEAF_T1_N57_C1  16'h01A8  // v=  1.656
`define LEAF_T1_N63_C1  16'h01B1  // v=  1.691
`define LEAF_T1_N64_C1  16'hFF77  // v= -0.536
`define LEAF_T1_N66_C1  16'h000D  // v=  0.053
`define LEAF_T1_N67_C1  16'h005A  // v=  0.351
`define LEAF_T1_N70_C1  16'h009E  // v=  0.618
`define LEAF_T1_N71_C1  16'hFFFC  // v= -0.016
`define LEAF_T1_N73_C1  16'hFFC7  // v= -0.224
`define LEAF_T1_N74_C1  16'h00DF  // v=  0.869
`define LEAF_T1_N78_C1  16'h00BA  // v=  0.728
`define LEAF_T1_N79_C1  16'hFFEA  // v= -0.087
`define LEAF_T1_N81_C1  16'hFFF8  // v= -0.032
`define LEAF_T1_N82_C1  16'h0051  // v=  0.316
`define LEAF_T1_N85_C1  16'h00D2  // v=  0.821
`define LEAF_T1_N86_C1  16'h011F  // v=  1.120
`define LEAF_T1_N88_C1  16'h0050  // v=  0.311
`define LEAF_T1_N89_C1  16'h00D4  // v=  0.829
`define LEAF_T1_N94_C1  16'h00AF  // v=  0.683
`define LEAF_T1_N95_C1  16'h012D  // v=  1.176
`define LEAF_T1_N97_C1  16'hFFFC  // v= -0.016
`define LEAF_T1_N98_C1  16'h00E9  // v=  0.910
`define LEAF_T1_N101_C1  16'h00FA  // v=  0.975
`define LEAF_T1_N102_C1  16'h0170  // v=  1.436
`define LEAF_T1_N104_C1  16'h019E  // v=  1.616
`define LEAF_T1_N105_C1  16'h017D  // v=  1.487
`define LEAF_T1_N108_C1  16'h01AB  // v=  1.670
`define LEAF_T1_N110_C1  16'h01A8  // v=  1.657
`define LEAF_T1_N111_C1  16'h01A8  // v=  1.654
`define LEAF_T1_N112_C1  16'hFF0D  // v= -0.950
`define LEAF_T2_N 6_C1  16'hFF36  // v= -0.789
`define LEAF_T2_N 7_C1  16'hFF20  // v= -0.874
`define LEAF_T2_N 9_C1  16'hFF36  // v= -0.791
`define LEAF_T2_N10_C1  16'h01E6  // v=  1.898
`define LEAF_T2_N12_C1  16'h016E  // v=  1.428
`define LEAF_T2_N14_C1  16'hFF17  // v= -0.908
`define LEAF_T2_N15_C1  16'hFF1D  // v= -0.887
`define LEAF_T2_N19_C1  16'hFF49  // v= -0.714
`define LEAF_T2_N20_C1  16'hFF1F  // v= -0.879
`define LEAF_T2_N22_C1  16'hFF66  // v= -0.601
`define LEAF_T2_N23_C1  16'h0188  // v=  1.530
`define LEAF_T2_N26_C1  16'h016E  // v=  1.430
`define LEAF_T2_N27_C1  16'h01C8  // v=  1.780
`define LEAF_T2_N29_C1  16'h0177  // v=  1.465
`define LEAF_T2_N30_C1  16'hFF1E  // v= -0.884
`define LEAF_T2_N35_C1  16'hFF8A  // v= -0.460
`define LEAF_T2_N36_C1  16'h023B  // v=  2.231
`define LEAF_T2_N38_C1  16'h0144  // v=  1.265
`define LEAF_T2_N39_C1  16'hFFB6  // v= -0.290
`define LEAF_T2_N42_C1  16'hFF9D  // v= -0.387
`define LEAF_T2_N43_C1  16'hFFE7  // v= -0.098
`define LEAF_T2_N45_C1  16'h0019  // v=  0.100
`define LEAF_T2_N46_C1  16'h01AA  // v=  1.664
`define LEAF_T2_N50_C1  16'hFF48  // v= -0.720
`define LEAF_T2_N51_C1  16'h0178  // v=  1.468
`define LEAF_T2_N53_C1  16'hFF7E  // v= -0.508
`define LEAF_T2_N54_C1  16'h017B  // v=  1.480
`define LEAF_T2_N57_C1  16'h016E  // v=  1.428
`define LEAF_T2_N58_C1  16'h016F  // v=  1.433
`define LEAF_T2_N59_C1  16'h017C  // v=  1.484
`define LEAF_T2_N65_C1  16'h0101  // v=  1.002
`define LEAF_T2_N66_C1  16'hFF7C  // v= -0.517
`define LEAF_T2_N68_C1  16'h001A  // v=  0.102
`define LEAF_T2_N69_C1  16'hFF13  // v= -0.926
`define LEAF_T2_N72_C1  16'h0145  // v=  1.271
`define LEAF_T2_N73_C1  16'h0017  // v=  0.088
`define LEAF_T2_N75_C1  16'hFFCA  // v= -0.210
`define LEAF_T2_N76_C1  16'h00C5  // v=  0.771
`define LEAF_T2_N80_C1  16'h00A5  // v=  0.646
`define LEAF_T2_N81_C1  16'hFFEA  // v= -0.084
`define LEAF_T2_N83_C1  16'hFFF6  // v= -0.040
`define LEAF_T2_N84_C1  16'h0048  // v=  0.279
`define LEAF_T2_N87_C1  16'h0128  // v=  1.157
`define LEAF_T2_N88_C1  16'h002A  // v=  0.164
`define LEAF_T2_N90_C1  16'h00EF  // v=  0.932
`define LEAF_T2_N91_C1  16'h00AC  // v=  0.672
`define LEAF_T2_N96_C1  16'h009A  // v=  0.600
`define LEAF_T2_N97_C1  16'h0104  // v=  1.015
`define LEAF_T2_N99_C1  16'hFFFB  // v= -0.019
`define LEAF_T2_N100_C1  16'h00CA  // v=  0.790
`define LEAF_T2_N103_C1  16'h00D8  // v=  0.843
`define LEAF_T2_N104_C1  16'h013E  // v=  1.242
`define LEAF_T2_N106_C1  16'h0159  // v=  1.347
`define LEAF_T2_N107_C1  16'h0168  // v=  1.408
`define LEAF_T2_N110_C1  16'h0173  // v=  1.448
`define LEAF_T2_N112_C1  16'h016E  // v=  1.430
`define LEAF_T2_N113_C1  16'h016E  // v=  1.428
`define LEAF_T2_N114_C1  16'hFF17  // v= -0.909
`define LEAF_T3_N 5_C1  16'h01A2  // v=  1.634
`define LEAF_T3_N 7_C1  16'hFF2D  // v= -0.824
`define LEAF_T3_N 8_C1  16'hFF21  // v= -0.873
`define LEAF_T3_N11_C1  16'hFF3C  // v= -0.766
`define LEAF_T3_N12_C1  16'h0169  // v=  1.410
`define LEAF_T3_N14_C1  16'h0146  // v=  1.275
`define LEAF_T3_N15_C1  16'h01CC  // v=  1.796
`define LEAF_T3_N19_C1  16'h0145  // v=  1.269
`define LEAF_T3_N20_C1  16'h0143  // v=  1.263
`define LEAF_T3_N22_C1  16'h016A  // v=  1.413
`define LEAF_T3_N23_C1  16'h0145  // v=  1.269
`define LEAF_T3_N26_C1  16'hFF67  // v= -0.598
`define LEAF_T3_N27_C1  16'h0171  // v=  1.440
`define LEAF_T3_N29_C1  16'hFF1A  // v= -0.899
`define LEAF_T3_N30_C1  16'h016B  // v=  1.418
`define LEAF_T3_N35_C1  16'hFF88  // v= -0.470
`define LEAF_T3_N36_C1  16'hFF5F  // v= -0.627
`define LEAF_T3_N38_C1  16'h013D  // v=  1.239
`define LEAF_T3_N39_C1  16'hFFAD  // v= -0.325
`define LEAF_T3_N42_C1  16'hFFBD  // v= -0.262
`define LEAF_T3_N43_C1  16'h01F7  // v=  1.963
`define LEAF_T3_N45_C1  16'hFFD1  // v= -0.183
`define LEAF_T3_N46_C1  16'h0026  // v=  0.149
`define LEAF_T3_N50_C1  16'hFF52  // v= -0.681
`define LEAF_T3_N51_C1  16'h014D  // v=  1.301
`define LEAF_T3_N53_C1  16'hFF88  // v= -0.469
`define LEAF_T3_N54_C1  16'h014F  // v=  1.308
`define LEAF_T3_N57_C1  16'h0146  // v=  1.272
`define LEAF_T3_N58_C1  16'h0145  // v=  1.269
`define LEAF_T3_N60_C1  16'h015B  // v=  1.357
`define LEAF_T3_N61_C1  16'h0146  // v=  1.274
`define LEAF_T3_N67_C1  16'h003F  // v=  0.245
`define LEAF_T3_N68_C1  16'hFF76  // v= -0.537
`define LEAF_T3_N70_C1  16'h000D  // v=  0.049
`define LEAF_T3_N71_C1  16'h004F  // v=  0.310
`define LEAF_T3_N74_C1  16'h004F  // v=  0.309
`define LEAF_T3_N75_C1  16'hFEE3  // v= -1.115
`define LEAF_T3_N77_C1  16'h00AA  // v=  0.663
`define LEAF_T3_N78_C1  16'h019B  // v=  1.606
`define LEAF_T3_N82_C1  16'h0094  // v=  0.578
`define LEAF_T3_N83_C1  16'hFFEB  // v= -0.082
`define LEAF_T3_N85_C1  16'hFFF5  // v= -0.043
`define LEAF_T3_N86_C1  16'h0040  // v=  0.251
`define LEAF_T3_N89_C1  16'h0108  // v=  1.032
`define LEAF_T3_N90_C1  16'h0023  // v=  0.138
`define LEAF_T3_N92_C1  16'h00D3  // v=  0.823
`define LEAF_T3_N93_C1  16'h0097  // v=  0.590
`define LEAF_T3_N98_C1  16'h0088  // v=  0.532
`define LEAF_T3_N99_C1  16'h00E1  // v=  0.881
`define LEAF_T3_N101_C1  16'hFFFE  // v= -0.008
`define LEAF_T3_N102_C1  16'h00C0  // v=  0.750
`define LEAF_T3_N105_C1  16'h0115  // v=  1.083
`define LEAF_T3_N106_C1  16'h00B2  // v=  0.697
`define LEAF_T3_N108_C1  16'h0141  // v=  1.255
`define LEAF_T3_N109_C1  16'h0133  // v=  1.199
`define LEAF_T3_N112_C1  16'h014B  // v=  1.294
`define LEAF_T3_N114_C1  16'h0146  // v=  1.272
`define LEAF_T3_N115_C1  16'h0145  // v=  1.269
`define LEAF_T3_N116_C1  16'hFF20  // v= -0.874
`define LEAF_T4_N 6_C1  16'hFF33  // v= -0.801
`define LEAF_T4_N 7_C1  16'hFF4A  // v= -0.712
`define LEAF_T4_N 8_C1  16'h01E1  // v=  1.880
`define LEAF_T4_N11_C1  16'h0127  // v=  1.153
`define LEAF_T4_N12_C1  16'h0144  // v=  1.266
`define LEAF_T4_N14_C1  16'hFF34  // v= -0.795
`define LEAF_T4_N15_C1  16'hFF29  // v= -0.842
`define LEAF_T4_N19_C1  16'hFF5E  // v= -0.632
`define LEAF_T4_N20_C1  16'hFF30  // v= -0.814
`define LEAF_T4_N22_C1  16'hFF79  // v= -0.527
`define LEAF_T4_N23_C1  16'h014A  // v=  1.290
`define LEAF_T4_N26_C1  16'h0128  // v=  1.156
`define LEAF_T4_N27_C1  16'h017A  // v=  1.476
`define LEAF_T4_N29_C1  16'hFF2D  // v= -0.822
`define LEAF_T4_N30_C1  16'h012A  // v=  1.165
`define LEAF_T4_N35_C1  16'h0033  // v=  0.201
`define LEAF_T4_N36_C1  16'hFF86  // v= -0.476
`define LEAF_T4_N38_C1  16'h0110  // v=  1.063
`define LEAF_T4_N39_C1  16'hFFB1  // v= -0.310
`define LEAF_T4_N42_C1  16'h0237  // v=  2.214
`define LEAF_T4_N43_C1  16'hFFC2  // v= -0.243
`define LEAF_T4_N45_C1  16'hFFDC  // v= -0.139
`define LEAF_T4_N46_C1  16'h002B  // v=  0.167
`define LEAF_T4_N50_C1  16'hFF95  // v= -0.420
`define LEAF_T4_N51_C1  16'h009F  // v=  0.619
`define LEAF_T4_N53_C1  16'h012D  // v=  1.177
`define LEAF_T4_N54_C1  16'h0178  // v=  1.467
`define LEAF_T4_N57_C1  16'h012F  // v=  1.183
`define LEAF_T4_N58_C1  16'h0128  // v=  1.157
`define LEAF_T4_N59_C1  16'h013A  // v=  1.225
`define LEAF_T4_N65_C1  16'h005B  // v=  0.356
`define LEAF_T4_N66_C1  16'hFFF9  // v= -0.029
`define LEAF_T4_N68_C1  16'hFFE7  // v= -0.098
`define LEAF_T4_N69_C1  16'h0094  // v=  0.578
`define LEAF_T4_N72_C1  16'hFFF8  // v= -0.030
`define LEAF_T4_N73_C1  16'hFF3C  // v= -0.767
`define LEAF_T4_N75_C1  16'h012D  // v=  1.175
`define LEAF_T4_N76_C1  16'h004B  // v=  0.293
`define LEAF_T4_N80_C1  16'hFEF6  // v= -1.041
`define LEAF_T4_N81_C1  16'h0072  // v=  0.445
`define LEAF_T4_N83_C1  16'hFFCC  // v= -0.203
`define LEAF_T4_N84_C1  16'h0036  // v=  0.211
`define LEAF_T4_N87_C1  16'h0033  // v=  0.201
`define LEAF_T4_N88_C1  16'hFF26  // v= -0.850
`define LEAF_T4_N90_C1  16'h007B  // v=  0.480
`define LEAF_T4_N91_C1  16'h00C9  // v=  0.785
`define LEAF_T4_N96_C1  16'h00BC  // v=  0.734
`define LEAF_T4_N97_C1  16'hFF6A  // v= -0.586
`define LEAF_T4_N99_C1  16'h0022  // v=  0.131
`define LEAF_T4_N100_C1  16'h011B  // v=  1.107
`define LEAF_T4_N103_C1  16'h0100  // v=  1.001
`define LEAF_T4_N104_C1  16'h009D  // v=  0.614
`define LEAF_T4_N106_C1  16'h0114  // v=  1.077
`define LEAF_T4_N107_C1  16'h0124  // v=  1.141
`define LEAF_T4_N110_C1  16'h012C  // v=  1.174
`define LEAF_T4_N112_C1  16'h0128  // v=  1.157
`define LEAF_T4_N113_C1  16'h0127  // v=  1.153
`define LEAF_T4_N114_C1  16'hFF28  // v= -0.845
`define LEAF_T5_N 6_C1  16'h0111  // v=  1.065
`define LEAF_T5_N 7_C1  16'h0127  // v=  1.151
`define LEAF_T5_N 9_C1  16'hFF2E  // v= -0.819
`define LEAF_T5_N10_C1  16'hFF35  // v= -0.792
`define LEAF_T5_N12_C1  16'h01D9  // v=  1.849
`define LEAF_T5_N14_C1  16'hFF3A  // v= -0.772
`define LEAF_T5_N15_C1  16'hFF53  // v= -0.677
`define LEAF_T5_N19_C1  16'h0111  // v=  1.067
`define LEAF_T5_N20_C1  16'h0157  // v=  1.339
`define LEAF_T5_N22_C1  16'h0116  // v=  1.087
`define LEAF_T5_N23_C1  16'hFF34  // v= -0.798
`define LEAF_T5_N26_C1  16'hFF63  // v= -0.612
`define LEAF_T5_N27_C1  16'h0145  // v=  1.271
`define LEAF_T5_N29_C1  16'hFF83  // v= -0.487
`define LEAF_T5_N30_C1  16'h012E  // v=  1.178
`define LEAF_T5_N35_C1  16'hFF70  // v= -0.563
`define LEAF_T5_N36_C1  16'hFF98  // v= -0.405
`define LEAF_T5_N38_C1  16'h02AC  // v=  2.672
`define LEAF_T5_N39_C1  16'hFFBB  // v= -0.271
`define LEAF_T5_N42_C1  16'hFFCC  // v= -0.202
`define LEAF_T5_N43_C1  16'h01CE  // v=  1.803
`define LEAF_T5_N45_C1  16'h0009  // v=  0.035
`define LEAF_T5_N46_C1  16'hFF2C  // v= -0.829
`define LEAF_T5_N50_C1  16'h0114  // v=  1.079
`define LEAF_T5_N51_C1  16'hFF30  // v= -0.812
`define LEAF_T5_N53_C1  16'h011D  // v=  1.113
`define LEAF_T5_N54_C1  16'h0112  // v=  1.069
`define LEAF_T5_N57_C1  16'h0168  // v=  1.407
`define LEAF_T5_N58_C1  16'hFF81  // v= -0.495
`define LEAF_T5_N60_C1  16'h0120  // v=  1.126
`define LEAF_T5_N61_C1  16'h0112  // v=  1.070
`define LEAF_T5_N67_C1  16'h003F  // v=  0.247
`define LEAF_T5_N68_C1  16'hFF7A  // v= -0.524
`define LEAF_T5_N70_C1  16'h0018  // v=  0.095
`define LEAF_T5_N71_C1  16'hFF15  // v= -0.919
`define LEAF_T5_N74_C1  16'h0081  // v=  0.505
`define LEAF_T5_N75_C1  16'hFFED  // v= -0.075
`define LEAF_T5_N77_C1  16'h002C  // v=  0.173
`define LEAF_T5_N78_C1  16'h00AA  // v=  0.663
`define LEAF_T5_N82_C1  16'h007E  // v=  0.493
`define LEAF_T5_N83_C1  16'hFFF1  // v= -0.057
`define LEAF_T5_N85_C1  16'h001D  // v=  0.112
`define LEAF_T5_N86_C1  16'hFF6E  // v= -0.572
`define LEAF_T5_N89_C1  16'h0062  // v=  0.383
`define LEAF_T5_N90_C1  16'h00A8  // v=  0.658
`define LEAF_T5_N92_C1  16'h0024  // v=  0.140
`define LEAF_T5_N93_C1  16'h0080  // v=  0.501
`define LEAF_T5_N98_C1  16'h0078  // v=  0.470
`define LEAF_T5_N99_C1  16'hFFEF  // v= -0.067
`define LEAF_T5_N101_C1  16'h00AD  // v=  0.674
`define LEAF_T5_N102_C1  16'hFFBA  // v= -0.275
`define LEAF_T5_N105_C1  16'h00E6  // v=  0.898
`define LEAF_T5_N106_C1  16'h008C  // v=  0.548
`define LEAF_T5_N108_C1  16'h00FC  // v=  0.986
`define LEAF_T5_N109_C1  16'h010D  // v=  1.050
`define LEAF_T5_N112_C1  16'h0116  // v=  1.085
`define LEAF_T5_N114_C1  16'h0112  // v=  1.069
`define LEAF_T5_N115_C1  16'h0111  // v=  1.065
`define LEAF_T5_N116_C1  16'hFF2E  // v= -0.820
`define LEAF_T6_N 6_C1  16'hFF5D  // v= -0.636
`define LEAF_T6_N 7_C1  16'hFF40  // v= -0.751
`define LEAF_T6_N 9_C1  16'h0164  // v=  1.391
`define LEAF_T6_N10_C1  16'hFF5C  // v= -0.641
`define LEAF_T6_N13_C1  16'h0106  // v=  1.022
`define LEAF_T6_N14_C1  16'hFF2F  // v= -0.816
`define LEAF_T6_N16_C1  16'hFF42  // v= -0.742
`define LEAF_T6_N17_C1  16'hFF35  // v= -0.795
`define LEAF_T6_N21_C1  16'hFF71  // v= -0.557
`define LEAF_T6_N22_C1  16'hFF3C  // v= -0.764
`define LEAF_T6_N24_C1  16'hFF8D  // v= -0.449
`define LEAF_T6_N25_C1  16'h0118  // v=  1.092
`define LEAF_T6_N28_C1  16'h0106  // v=  1.024
`define LEAF_T6_N29_C1  16'hFF39  // v= -0.776
`define LEAF_T6_N31_C1  16'h010A  // v=  1.039
`define LEAF_T6_N32_C1  16'h0243  // v=  2.262
`define LEAF_T6_N37_C1  16'h029E  // v=  2.619
`define LEAF_T6_N38_C1  16'hFFB3  // v= -0.301
`define LEAF_T6_N40_C1  16'hFF73  // v= -0.550
`define LEAF_T6_N41_C1  16'h0210  // v=  2.063
`define LEAF_T6_N44_C1  16'h0019  // v=  0.098
`define LEAF_T6_N45_C1  16'hFFD0  // v= -0.189
`define LEAF_T6_N47_C1  16'h0214  // v=  2.078
`define LEAF_T6_N48_C1  16'h00DF  // v=  0.871
`define LEAF_T6_N52_C1  16'hFFB1  // v= -0.309
`define LEAF_T6_N53_C1  16'h010A  // v=  1.041
`define LEAF_T6_N55_C1  16'hFFFE  // v= -0.008
`define LEAF_T6_N56_C1  16'h0105  // v=  1.018
`define LEAF_T6_N57_C1  16'hFF2C  // v= -0.828
`define LEAF_T6_N63_C1  16'hFF8F  // v= -0.441
`define LEAF_T6_N64_C1  16'h0218  // v=  2.095
`define LEAF_T6_N66_C1  16'h013B  // v=  1.229
`define LEAF_T6_N67_C1  16'h0002  // v=  0.008
`define LEAF_T6_N70_C1  16'h0176  // v=  1.460
`define LEAF_T6_N71_C1  16'hFF7F  // v= -0.503
`define LEAF_T6_N73_C1  16'h0075  // v=  0.456
`define LEAF_T6_N74_C1  16'h0024  // v=  0.142
`define LEAF_T6_N78_C1  16'hFF6F  // v= -0.565
`define LEAF_T6_N79_C1  16'h005B  // v=  0.354
`define LEAF_T6_N81_C1  16'hFFC9  // v= -0.216
`define LEAF_T6_N82_C1  16'h001D  // v=  0.115
`define LEAF_T6_N85_C1  16'hFF8A  // v= -0.462
`define LEAF_T6_N86_C1  16'h0056  // v=  0.334
`define LEAF_T6_N88_C1  16'h008E  // v=  0.553
`define LEAF_T6_N89_C1  16'h0020  // v=  0.125
`define LEAF_T6_N94_C1  16'h0198  // v=  1.594
`define LEAF_T6_N95_C1  16'h002B  // v=  0.168
`define LEAF_T6_N97_C1  16'h008F  // v=  0.557
`define LEAF_T6_N98_C1  16'hFFF8  // v= -0.031
`define LEAF_T6_N101_C1  16'h006D  // v=  0.425
`define LEAF_T6_N102_C1  16'h00C8  // v=  0.782
`define LEAF_T6_N104_C1  16'h00F4  // v=  0.952
`define LEAF_T6_N105_C1  16'h0097  // v=  0.591
`define LEAF_T6_N107_C1  16'hFF34  // v= -0.799
`define LEAF_T6_N110_C1  16'h0105  // v=  1.018
`define LEAF_T6_N111_C1  16'h0102  // v=  1.006
`define LEAF_T6_N113_C1  16'h0100  // v=  0.999
`define LEAF_T6_N114_C1  16'h00FF  // v=  0.997
`define LEAF_T7_N 6_C1  16'hFF4D  // v= -0.699
`define LEAF_T7_N 7_C1  16'h016C  // v=  1.423
`define LEAF_T7_N 9_C1  16'h0469  // v=  4.411
`define LEAF_T7_N10_C1  16'h047B  // v=  4.482
`define LEAF_T7_N12_C1  16'hFF50  // v= -0.689
`define LEAF_T7_N14_C1  16'hFF41  // v= -0.747
`define LEAF_T7_N15_C1  16'hFF38  // v= -0.780
`define LEAF_T7_N19_C1  16'h00FF  // v=  0.995
`define LEAF_T7_N20_C1  16'h0207  // v=  2.026
`define LEAF_T7_N22_C1  16'hFF3F  // v= -0.756
`define LEAF_T7_N23_C1  16'h00F9  // v=  0.974
`define LEAF_T7_N26_C1  16'hFF7F  // v= -0.505
`define LEAF_T7_N27_C1  16'hFF3F  // v= -0.753
`define LEAF_T7_N28_C1  16'h011F  // v=  1.122
`define LEAF_T7_N33_C1  16'h00F3  // v=  0.948
`define LEAF_T7_N34_C1  16'hFFA5  // v= -0.354
`define LEAF_T7_N36_C1  16'hFF24  // v= -0.859
`define LEAF_T7_N37_C1  16'h00FD  // v=  0.989
`define LEAF_T7_N39_C1  16'h0144  // v=  1.265
`define LEAF_T7_N40_C1  16'hFF2D  // v= -0.825
`define LEAF_T7_N44_C1  16'hFFFB  // v= -0.019
`define LEAF_T7_N45_C1  16'hFFB1  // v= -0.310
`define LEAF_T7_N47_C1  16'hFF8C  // v= -0.454
`define LEAF_T7_N48_C1  16'h01A2  // v=  1.632
`define LEAF_T7_N51_C1  16'h001B  // v=  0.104
`define LEAF_T7_N52_C1  16'hFFD6  // v= -0.163
`define LEAF_T7_N54_C1  16'h01D2  // v=  1.821
`define LEAF_T7_N55_C1  16'h00CF  // v=  0.808
`define LEAF_T7_N61_C1  16'h01A8  // v=  1.656
`define LEAF_T7_N62_C1  16'hFFA1  // v= -0.373
`define LEAF_T7_N64_C1  16'hFFED  // v= -0.073
`define LEAF_T7_N65_C1  16'h0020  // v=  0.124
`define LEAF_T7_N68_C1  16'h0173  // v=  1.450
`define LEAF_T7_N69_C1  16'hFFA0  // v= -0.375
`define LEAF_T7_N71_C1  16'h011B  // v=  1.107
`define LEAF_T7_N72_C1  16'hFF74  // v= -0.545
`define LEAF_T7_N76_C1  16'h001D  // v=  0.113
`define LEAF_T7_N77_C1  16'h0072  // v=  0.447
`define LEAF_T7_N79_C1  16'hFFE4  // v= -0.108
`define LEAF_T7_N80_C1  16'h01C3  // v=  1.761
`define LEAF_T7_N83_C1  16'h003F  // v=  0.246
`define LEAF_T7_N84_C1  16'h007F  // v=  0.496
`define LEAF_T7_N86_C1  16'hFFEE  // v= -0.070
`define LEAF_T7_N87_C1  16'h005A  // v=  0.352
`define LEAF_T7_N92_C1  16'h0059  // v=  0.349
`define LEAF_T7_N93_C1  16'h0005  // v=  0.018
`define LEAF_T7_N95_C1  16'h008F  // v=  0.559
`define LEAF_T7_N96_C1  16'hFFAB  // v= -0.332
`define LEAF_T7_N99_C1  16'h00B2  // v=  0.694
`define LEAF_T7_N100_C1  16'h00E5  // v=  0.896
`define LEAF_T7_N102_C1  16'hFF37  // v= -0.787
`define LEAF_T7_N103_C1  16'h00F8  // v=  0.970
`define LEAF_T7_N106_C1  16'h00F7  // v=  0.966
`define LEAF_T7_N108_C1  16'h00F3  // v=  0.947
`define LEAF_T7_N109_C1  16'h00F1  // v=  0.943
`define LEAF_T7_N110_C1  16'hFF38  // v= -0.781
`define LEAF_T8_N 6_C1  16'h014B  // v=  1.292
`define LEAF_T8_N 7_C1  16'hFF4B  // v= -0.707
`define LEAF_T8_N 9_C1  16'hFF59  // v= -0.652
`define LEAF_T8_N10_C1  16'hFF76  // v= -0.539
`define LEAF_T8_N13_C1  16'h00F1  // v=  0.940
`define LEAF_T8_N14_C1  16'hFF38  // v= -0.781
`define LEAF_T8_N16_C1  16'hFF4B  // v= -0.706
`define LEAF_T8_N17_C1  16'hFF3D  // v= -0.760
`define LEAF_T8_N21_C1  16'h00F3  // v=  0.947
`define LEAF_T8_N22_C1  16'h01DA  // v=  1.853
`define LEAF_T8_N24_C1  16'hFF43  // v= -0.740
`define LEAF_T8_N25_C1  16'h00F0  // v=  0.936
`define LEAF_T8_N28_C1  16'hFF86  // v= -0.478
`define LEAF_T8_N29_C1  16'h0150  // v=  1.314
`define LEAF_T8_N31_C1  16'h01A6  // v=  1.650
`define LEAF_T8_N32_C1  16'hFF42  // v= -0.742
`define LEAF_T8_N37_C1  16'h0006  // v=  0.022
`define LEAF_T8_N38_C1  16'hFFBA  // v= -0.275
`define LEAF_T8_N40_C1  16'hFFA4  // v= -0.361
`define LEAF_T8_N41_C1  16'hFF4D  // v= -0.700
`define LEAF_T8_N44_C1  16'hFFE4  // v= -0.108
`define LEAF_T8_N45_C1  16'h0226  // v=  2.147
`define LEAF_T8_N47_C1  16'h01A8  // v=  1.658
`define LEAF_T8_N48_C1  16'h00C1  // v=  0.755
`define LEAF_T8_N52_C1  16'h00E7  // v=  0.901
`define LEAF_T8_N53_C1  16'hFFAB  // v= -0.331
`define LEAF_T8_N55_C1  16'hFF2A  // v= -0.837
`define LEAF_T8_N56_C1  16'h00F0  // v=  0.939
`define LEAF_T8_N58_C1  16'hFF34  // v= -0.798
`define LEAF_T8_N59_C1  16'h0129  // v=  1.162
`define LEAF_T8_N65_C1  16'h000C  // v=  0.047
`define LEAF_T8_N66_C1  16'hFF4F  // v= -0.692
`define LEAF_T8_N68_C1  16'h009E  // v=  0.616
`define LEAF_T8_N69_C1  16'hFFC8  // v= -0.220
`define LEAF_T8_N72_C1  16'h0120  // v=  1.124
`define LEAF_T8_N73_C1  16'h0006  // v=  0.024
`define LEAF_T8_N75_C1  16'h009D  // v=  0.613
`define LEAF_T8_N76_C1  16'h002E  // v=  0.180
`define LEAF_T8_N80_C1  16'h005C  // v=  0.357
`define LEAF_T8_N81_C1  16'h0021  // v=  0.127
`define LEAF_T8_N83_C1  16'h0005  // v=  0.018
`define LEAF_T8_N84_C1  16'h008C  // v=  0.549
`define LEAF_T8_N87_C1  16'h0053  // v=  0.323
`define LEAF_T8_N88_C1  16'hFFAC  // v= -0.328
`define LEAF_T8_N90_C1  16'h0033  // v=  0.199
`define LEAF_T8_N91_C1  16'h0082  // v=  0.509
`define LEAF_T8_N96_C1  16'hFF72  // v= -0.556
`define LEAF_T8_N97_C1  16'h012E  // v=  1.181
`define LEAF_T8_N99_C1  16'h006C  // v=  0.421
`define LEAF_T8_N100_C1  16'hFFC4  // v= -0.233
`define LEAF_T8_N103_C1  16'h00AB  // v=  0.669
`define LEAF_T8_N104_C1  16'h00D9  // v=  0.849
`define LEAF_T8_N106_C1  16'hFF3D  // v= -0.761
`define LEAF_T8_N107_C1  16'h00EC  // v=  0.922
`define LEAF_T8_N109_C1  16'hFF3C  // v= -0.765
`define LEAF_T8_N111_C1  16'h00EC  // v=  0.922
`define LEAF_T8_N113_C1  16'h00E8  // v=  0.905
`define LEAF_T8_N114_C1  16'h00E6  // v=  0.899
`define LEAF_T9_N 5_C1  16'h012C  // v=  1.172
`define LEAF_T9_N 7_C1  16'hFF54  // v= -0.672
`define LEAF_T9_N 8_C1  16'hFF40  // v= -0.749
`define LEAF_T9_N11_C1  16'hFF66  // v= -0.601
`define LEAF_T9_N12_C1  16'h0146  // v=  1.274
`define LEAF_T9_N13_C1  16'h047E  // v=  4.492
`define LEAF_T9_N17_C1  16'h00DC  // v=  0.859
`define LEAF_T9_N18_C1  16'h00E7  // v=  0.900
`define LEAF_T9_N20_C1  16'h00E1  // v=  0.877
`define LEAF_T9_N21_C1  16'h011B  // v=  1.104
`define LEAF_T9_N24_C1  16'hFF9C  // v= -0.389
`define LEAF_T9_N25_C1  16'h0167  // v=  1.401
`define LEAF_T9_N27_C1  16'h0148  // v=  1.283
`define LEAF_T9_N28_C1  16'h009A  // v=  0.600
`define LEAF_T9_N33_C1  16'hFFAF  // v= -0.315
`define LEAF_T9_N34_C1  16'h00E6  // v=  0.900
`define LEAF_T9_N36_C1  16'h00E1  // v=  0.880
`define LEAF_T9_N37_C1  16'hFFCC  // v= -0.203
`define LEAF_T9_N38_C1  16'hFF42  // v= -0.743
`define LEAF_T9_N42_C1  16'hFFC2  // v= -0.244
`define LEAF_T9_N43_C1  16'h0152  // v=  1.319
`define LEAF_T9_N44_C1  16'h01F4  // v=  1.955
`define LEAF_T9_N47_C1  16'h0286  // v=  2.525
`define LEAF_T9_N48_C1  16'hFFF2  // v= -0.053
`define LEAF_T9_N50_C1  16'hFFA9  // v= -0.341
`define LEAF_T9_N51_C1  16'h0077  // v=  0.465
`define LEAF_T9_N57_C1  16'h0004  // v=  0.017
`define LEAF_T9_N58_C1  16'hFFB8  // v= -0.283
`define LEAF_T9_N60_C1  16'hFFEC  // v= -0.078
`define LEAF_T9_N61_C1  16'h020F  // v=  2.059
`define LEAF_T9_N64_C1  16'hFFBA  // v= -0.274
`define LEAF_T9_N65_C1  16'h001B  // v=  0.107
`define LEAF_T9_N67_C1  16'h0219  // v=  2.097
`define LEAF_T9_N68_C1  16'h0024  // v=  0.140
`define LEAF_T9_N72_C1  16'h01A3  // v=  1.637
`define LEAF_T9_N73_C1  16'h0040  // v=  0.251
`define LEAF_T9_N75_C1  16'hFFFE  // v= -0.009
`define LEAF_T9_N76_C1  16'h0159  // v=  1.348
`define LEAF_T9_N79_C1  16'hFFE0  // v= -0.124
`define LEAF_T9_N80_C1  16'h0054  // v=  0.327
`define LEAF_T9_N82_C1  16'h00B9  // v=  0.721
`define LEAF_T9_N83_C1  16'h0068  // v=  0.405
`define LEAF_T9_N88_C1  16'h0164  // v=  1.389
`define LEAF_T9_N89_C1  16'h001A  // v=  0.103
`define LEAF_T9_N91_C1  16'h0088  // v=  0.531
`define LEAF_T9_N92_C1  16'h0046  // v=  0.274
`define LEAF_T9_N95_C1  16'h00D3  // v=  0.826
`define LEAF_T9_N96_C1  16'h00BD  // v=  0.738
`define LEAF_T9_N98_C1  16'hFF43  // v= -0.737
`define LEAF_T9_N99_C1  16'h00E2  // v=  0.883
`define LEAF_T9_N103_C1  16'h00E4  // v=  0.891
`define LEAF_T9_N104_C1  16'h00E1  // v=  0.877
`define LEAF_T9_N106_C1  16'h00DF  // v=  0.871
`define LEAF_T9_N107_C1  16'h00DD  // v=  0.863
`define LEAF_T9_N108_C1  16'hFF3F  // v= -0.752
// Class HIGH:
`define LEAF_T0_N 6_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N 7_C2  16'h01F9  // v=  1.971
`define LEAF_T0_N 9_C2  16'hFF09  // v= -0.963
`define LEAF_T0_N10_C2  16'hFFCD  // v= -0.198
`define LEAF_T0_N13_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N14_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N15_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N19_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N20_C2  16'h01F1  // v=  1.942
`define LEAF_T0_N21_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N24_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N25_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N27_C2  16'h01DF  // v=  1.873
`define LEAF_T0_N28_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N30_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N33_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N35_C2  16'h01F9  // v=  1.971
`define LEAF_T0_N36_C2  16'h0200  // v=  2.000
`define LEAF_T0_N37_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N40_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N42_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N43_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N45_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N49_C2  16'h0200  // v=  2.000
`define LEAF_T0_N50_C2  16'h01F1  // v=  1.942
`define LEAF_T0_N51_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N53_C2  16'hFF00  // v= -1.000
`define LEAF_T0_N55_C2  16'h01F9  // v=  1.975
`define LEAF_T0_N56_C2  16'h0200  // v=  1.999
`define LEAF_T1_N 6_C2  16'hFF0D  // v= -0.950
`define LEAF_T1_N 7_C2  16'hFF0D  // v= -0.951
`define LEAF_T1_N 9_C2  16'hFF0C  // v= -0.952
`define LEAF_T1_N10_C2  16'hFF0D  // v= -0.951
`define LEAF_T1_N13_C2  16'hFF0C  // v= -0.952
`define LEAF_T1_N14_C2  16'h01CC  // v=  1.795
`define LEAF_T1_N16_C2  16'hFF16  // v= -0.914
`define LEAF_T1_N17_C2  16'hFFD9  // v= -0.153
`define LEAF_T1_N21_C2  16'hFF0D  // v= -0.951
`define LEAF_T1_N22_C2  16'h019D  // v=  1.613
`define LEAF_T1_N24_C2  16'hFF0C  // v= -0.952
`define LEAF_T1_N25_C2  16'hFF09  // v= -0.966
`define LEAF_T1_N28_C2  16'hFF0D  // v= -0.951
`define LEAF_T1_N29_C2  16'hFF09  // v= -0.964
`define LEAF_T1_N31_C2  16'h018F  // v=  1.558
`define LEAF_T1_N32_C2  16'hFF0B  // v= -0.958
`define LEAF_T1_N36_C2  16'hFF10  // v= -0.936
`define LEAF_T1_N38_C2  16'hFF0D  // v= -0.950
`define LEAF_T1_N39_C2  16'hFF0E  // v= -0.947
`define LEAF_T1_N42_C2  16'hFF0B  // v= -0.956
`define LEAF_T1_N43_C2  16'hFF09  // v= -0.965
`define LEAF_T1_N45_C2  16'hFF0D  // v= -0.949
`define LEAF_T1_N46_C2  16'hFF0D  // v= -0.951
`define LEAF_T1_N49_C2  16'hFEF7  // v= -1.036
`define LEAF_T1_N51_C2  16'h01A2  // v=  1.632
`define LEAF_T1_N52_C2  16'h01B6  // v=  1.711
`define LEAF_T1_N53_C2  16'hFF0B  // v= -0.956
`define LEAF_T1_N56_C2  16'hFF0D  // v= -0.950
`define LEAF_T1_N57_C2  16'hFF04  // v= -0.984
`define LEAF_T1_N59_C2  16'hFF0D  // v= -0.950
`define LEAF_T1_N63_C2  16'hFF00  // v= -0.999
`define LEAF_T1_N64_C2  16'hFF0D  // v= -0.950
`define LEAF_T1_N66_C2  16'h01A8  // v=  1.655
`define LEAF_T1_N67_C2  16'h019C  // v=  1.608
`define LEAF_T1_N69_C2  16'hFF06  // v= -0.976
`define LEAF_T1_N71_C2  16'h01A3  // v=  1.636
`define LEAF_T1_N72_C2  16'h01A7  // v=  1.654
`define LEAF_T2_N 6_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N 7_C2  16'hFF17  // v= -0.911
`define LEAF_T2_N 9_C2  16'hFF16  // v= -0.914
`define LEAF_T2_N10_C2  16'hFF17  // v= -0.910
`define LEAF_T2_N13_C2  16'hFF17  // v= -0.911
`define LEAF_T2_N14_C2  16'h01AA  // v=  1.665
`define LEAF_T2_N16_C2  16'hFF21  // v= -0.872
`define LEAF_T2_N17_C2  16'hFFE3  // v= -0.112
`define LEAF_T2_N21_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N22_C2  16'h0166  // v=  1.400
`define LEAF_T2_N24_C2  16'hFF14  // v= -0.923
`define LEAF_T2_N25_C2  16'hFF17  // v= -0.911
`define LEAF_T2_N28_C2  16'hFF17  // v= -0.910
`define LEAF_T2_N29_C2  16'hFF13  // v= -0.926
`define LEAF_T2_N31_C2  16'h015C  // v=  1.359
`define LEAF_T2_N32_C2  16'hFF12  // v= -0.930
`define LEAF_T2_N37_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N38_C2  16'hFF1B  // v= -0.893
`define LEAF_T2_N40_C2  16'hFF15  // v= -0.920
`define LEAF_T2_N41_C2  16'hFF11  // v= -0.934
`define LEAF_T2_N44_C2  16'hFF17  // v= -0.911
`define LEAF_T2_N45_C2  16'hFF15  // v= -0.916
`define LEAF_T2_N47_C2  16'hFF18  // v= -0.906
`define LEAF_T2_N48_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N50_C2  16'hFF0E  // v= -0.946
`define LEAF_T2_N53_C2  16'h016D  // v=  1.427
`define LEAF_T2_N54_C2  16'h0183  // v=  1.512
`define LEAF_T2_N55_C2  16'hFEFF  // v= -1.005
`define LEAF_T2_N61_C2  16'hFF12  // v= -0.930
`define LEAF_T2_N62_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N63_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N64_C2  16'hFF12  // v= -0.930
`define LEAF_T2_N65_C2  16'hFF0C  // v= -0.955
`define LEAF_T2_N67_C2  16'hFF18  // v= -0.908
`define LEAF_T2_N71_C2  16'h0170  // v=  1.437
`define LEAF_T2_N72_C2  16'h0164  // v=  1.389
`define LEAF_T2_N74_C2  16'hFF17  // v= -0.909
`define LEAF_T2_N75_C2  16'hFF0B  // v= -0.958
`define LEAF_T2_N77_C2  16'hFF0B  // v= -0.956
`define LEAF_T2_N79_C2  16'h016D  // v=  1.428
`define LEAF_T2_N80_C2  16'h016A  // v=  1.413
`define LEAF_T3_N 6_C2  16'hFF20  // v= -0.874
`define LEAF_T3_N 7_C2  16'hFF20  // v= -0.877
`define LEAF_T3_N 9_C2  16'hFF1E  // v= -0.882
`define LEAF_T3_N10_C2  16'hFF20  // v= -0.876
`define LEAF_T3_N13_C2  16'hFF2A  // v= -0.836
`define LEAF_T3_N14_C2  16'hFFEE  // v= -0.069
`define LEAF_T3_N16_C2  16'hFF1F  // v= -0.878
`define LEAF_T3_N17_C2  16'h018F  // v=  1.560
`define LEAF_T3_N21_C2  16'hFF20  // v= -0.875
`define LEAF_T3_N22_C2  16'h0143  // v=  1.260
`define LEAF_T3_N24_C2  16'hFF20  // v= -0.877
`define LEAF_T3_N25_C2  16'hFF1D  // v= -0.886
`define LEAF_T3_N28_C2  16'hFF20  // v= -0.876
`define LEAF_T3_N29_C2  16'hFF19  // v= -0.901
`define LEAF_T3_N31_C2  16'h0137  // v=  1.216
`define LEAF_T3_N32_C2  16'hFF1C  // v= -0.890
`define LEAF_T3_N37_C2  16'hFF21  // v= -0.871
`define LEAF_T3_N38_C2  16'hFF1D  // v= -0.886
`define LEAF_T3_N40_C2  16'hFF11  // v= -0.932
`define LEAF_T3_N41_C2  16'hFF19  // v= -0.902
`define LEAF_T3_N44_C2  16'hFF20  // v= -0.876
`define LEAF_T3_N45_C2  16'hFF1E  // v= -0.883
`define LEAF_T3_N47_C2  16'hFF22  // v= -0.869
`define LEAF_T3_N48_C2  16'hFF20  // v= -0.874
`define LEAF_T3_N52_C2  16'h0145  // v=  1.268
`define LEAF_T3_N53_C2  16'h0158  // v=  1.342
`define LEAF_T3_N54_C2  16'hFF06  // v= -0.977
`define LEAF_T3_N55_C2  16'hFF14  // v= -0.922
`define LEAF_T3_N61_C2  16'hFF1D  // v= -0.887
`define LEAF_T3_N62_C2  16'hFF20  // v= -0.874
`define LEAF_T3_N63_C2  16'hFF1C  // v= -0.890
`define LEAF_T3_N64_C2  16'hFF1C  // v= -0.892
`define LEAF_T3_N65_C2  16'hFF13  // v= -0.928
`define LEAF_T3_N67_C2  16'hFF1A  // v= -0.897
`define LEAF_T3_N71_C2  16'hFF20  // v= -0.876
`define LEAF_T3_N72_C2  16'hFF15  // v= -0.917
`define LEAF_T3_N74_C2  16'h0147  // v=  1.277
`define LEAF_T3_N75_C2  16'h013B  // v=  1.231
`define LEAF_T3_N77_C2  16'hFF10  // v= -0.938
`define LEAF_T3_N79_C2  16'h013B  // v=  1.232
`define LEAF_T3_N80_C2  16'h0145  // v=  1.268
`define LEAF_T4_N 6_C2  16'hFF28  // v= -0.845
`define LEAF_T4_N 7_C2  16'hFF27  // v= -0.848
`define LEAF_T4_N 9_C2  16'hFF25  // v= -0.856
`define LEAF_T4_N10_C2  16'hFF27  // v= -0.849
`define LEAF_T4_N12_C2  16'h0260  // v=  2.375
`define LEAF_T4_N14_C2  16'hFF26  // v= -0.853
`define LEAF_T4_N15_C2  16'hFF51  // v= -0.684
`define LEAF_T4_N19_C2  16'hFF28  // v= -0.845
`define LEAF_T4_N20_C2  16'h0127  // v=  1.153
`define LEAF_T4_N22_C2  16'hFF27  // v= -0.848
`define LEAF_T4_N23_C2  16'hFF25  // v= -0.855
`define LEAF_T4_N26_C2  16'hFF27  // v= -0.847
`define LEAF_T4_N27_C2  16'hFF1E  // v= -0.884
`define LEAF_T4_N29_C2  16'h011C  // v=  1.109
`define LEAF_T4_N30_C2  16'hFF21  // v= -0.872
`define LEAF_T4_N35_C2  16'hFF24  // v= -0.860
`define LEAF_T4_N36_C2  16'hFF28  // v= -0.845
`define LEAF_T4_N38_C2  16'hFF1B  // v= -0.895
`define LEAF_T4_N39_C2  16'hFF21  // v= -0.872
`define LEAF_T4_N42_C2  16'hFF26  // v= -0.851
`define LEAF_T4_N43_C2  16'hFF27  // v= -0.847
`define LEAF_T4_N45_C2  16'hFF29  // v= -0.841
`define LEAF_T4_N46_C2  16'hFF28  // v= -0.845
`define LEAF_T4_N48_C2  16'hFF19  // v= -0.903
`define LEAF_T4_N51_C2  16'h0127  // v=  1.152
`define LEAF_T4_N52_C2  16'h0138  // v=  1.220
`define LEAF_T4_N53_C2  16'hFF09  // v= -0.965
`define LEAF_T4_N58_C2  16'hFF20  // v= -0.873
`define LEAF_T4_N60_C2  16'hFF23  // v= -0.863
`define LEAF_T4_N61_C2  16'hFF28  // v= -0.846
`define LEAF_T4_N62_C2  16'hFF1C  // v= -0.889
`define LEAF_T4_N63_C2  16'hFF18  // v= -0.906
`define LEAF_T4_N65_C2  16'hFF24  // v= -0.861
`define LEAF_T4_N69_C2  16'hFF27  // v= -0.846
`define LEAF_T4_N70_C2  16'hFF16  // v= -0.914
`define LEAF_T4_N72_C2  16'h012A  // v=  1.165
`define LEAF_T4_N73_C2  16'h011E  // v=  1.117
`define LEAF_T4_N75_C2  16'hFF13  // v= -0.926
`define LEAF_T4_N77_C2  16'h011E  // v=  1.117
`define LEAF_T4_N78_C2  16'h0127  // v=  1.152
`define LEAF_T5_N 6_C2  16'hFF2E  // v= -0.821
`define LEAF_T5_N 7_C2  16'hFF2D  // v= -0.824
`define LEAF_T5_N 9_C2  16'hFF2B  // v= -0.833
`define LEAF_T5_N10_C2  16'hFF2D  // v= -0.823
`define LEAF_T5_N13_C2  16'hFF2D  // v= -0.825
`define LEAF_T5_N14_C2  16'h0197  // v=  1.588
`define LEAF_T5_N16_C2  16'hFF2C  // v= -0.828
`define LEAF_T5_N17_C2  16'hFF96  // v= -0.415
`define LEAF_T5_N21_C2  16'hFF2E  // v= -0.820
`define LEAF_T5_N22_C2  16'h0112  // v=  1.070
`define LEAF_T5_N24_C2  16'hFF2D  // v= -0.823
`define LEAF_T5_N25_C2  16'hFF2A  // v= -0.836
`define LEAF_T5_N28_C2  16'hFF2D  // v= -0.823
`define LEAF_T5_N29_C2  16'hFF23  // v= -0.864
`define LEAF_T5_N31_C2  16'h0106  // v=  1.024
`define LEAF_T5_N32_C2  16'hFF28  // v= -0.842
`define LEAF_T5_N37_C2  16'hFF2B  // v= -0.831
`define LEAF_T5_N38_C2  16'hFF2F  // v= -0.815
`define LEAF_T5_N40_C2  16'hFF27  // v= -0.847
`define LEAF_T5_N41_C2  16'hFF2B  // v= -0.831
`define LEAF_T5_N44_C2  16'hFF2C  // v= -0.828
`define LEAF_T5_N45_C2  16'hFF2D  // v= -0.822
`define LEAF_T5_N47_C2  16'hFF2F  // v= -0.816
`define LEAF_T5_N48_C2  16'hFF2E  // v= -0.820
`define LEAF_T5_N52_C2  16'h0128  // v=  1.156
`define LEAF_T5_N53_C2  16'h0111  // v=  1.064
`define LEAF_T5_N54_C2  16'hFF12  // v= -0.928
`define LEAF_T5_N55_C2  16'hFF1D  // v= -0.887
`define LEAF_T5_N60_C2  16'hFF1B  // v= -0.895
`define LEAF_T5_N62_C2  16'hFF2C  // v= -0.827
`define LEAF_T5_N63_C2  16'hFF25  // v= -0.857
`define LEAF_T5_N66_C2  16'hFF2E  // v= -0.820
`define LEAF_T5_N67_C2  16'hFF2F  // v= -0.818
`define LEAF_T5_N69_C2  16'hFF2F  // v= -0.815
`define LEAF_T5_N70_C2  16'hFF2F  // v= -0.818
`define LEAF_T5_N71_C2  16'hFF1B  // v= -0.894
`define LEAF_T5_N73_C2  16'hFF28  // v= -0.845
`define LEAF_T5_N77_C2  16'hFF2D  // v= -0.823
`define LEAF_T5_N78_C2  16'hFF1E  // v= -0.881
`define LEAF_T5_N80_C2  16'h0113  // v=  1.075
`define LEAF_T5_N81_C2  16'h0107  // v=  1.026
`define LEAF_T5_N83_C2  16'hFF1A  // v= -0.897
`define LEAF_T5_N85_C2  16'h0101  // v=  1.005
`define LEAF_T5_N86_C2  16'h0110  // v=  1.063
`define LEAF_T6_N 6_C2  16'hFF33  // v= -0.800
`define LEAF_T6_N 7_C2  16'hFF32  // v= -0.804
`define LEAF_T6_N 9_C2  16'hFF2F  // v= -0.814
`define LEAF_T6_N10_C2  16'hFF32  // v= -0.803
`define LEAF_T6_N12_C2  16'h023F  // v=  2.244
`define LEAF_T6_N14_C2  16'hFF31  // v= -0.808
`define LEAF_T6_N15_C2  16'hFF63  // v= -0.613
`define LEAF_T6_N19_C2  16'hFF33  // v= -0.799
`define LEAF_T6_N20_C2  16'h00FF  // v=  0.995
`define LEAF_T6_N22_C2  16'hFF33  // v= -0.802
`define LEAF_T6_N23_C2  16'hFF30  // v= -0.813
`define LEAF_T6_N26_C2  16'hFF33  // v= -0.802
`define LEAF_T6_N27_C2  16'hFF2A  // v= -0.837
`define LEAF_T6_N29_C2  16'h00F5  // v=  0.957
`define LEAF_T6_N30_C2  16'hFF2B  // v= -0.830
`define LEAF_T6_N35_C2  16'hFF32  // v= -0.803
`define LEAF_T6_N36_C2  16'hFF2E  // v= -0.820
`define LEAF_T6_N38_C2  16'hFF29  // v= -0.838
`define LEAF_T6_N39_C2  16'hFF2E  // v= -0.821
`define LEAF_T6_N42_C2  16'hFF32  // v= -0.806
`define LEAF_T6_N43_C2  16'hFF33  // v= -0.801
`define LEAF_T6_N45_C2  16'hFF34  // v= -0.795
`define LEAF_T6_N46_C2  16'hFF34  // v= -0.798
`define LEAF_T6_N48_C2  16'hFF22  // v= -0.868
`define LEAF_T6_N50_C2  16'hFF16  // v= -0.914
`define LEAF_T6_N52_C2  16'h00FF  // v=  0.996
`define LEAF_T6_N53_C2  16'h0113  // v=  1.073
`define LEAF_T6_N56_C2  16'hFF1F  // v= -0.878
`define LEAF_T6_N59_C2  16'hFF23  // v= -0.864
`define LEAF_T6_N61_C2  16'hFF32  // v= -0.804
`define LEAF_T6_N62_C2  16'hFF2C  // v= -0.829
`define LEAF_T6_N65_C2  16'hFF34  // v= -0.799
`define LEAF_T6_N66_C2  16'hFF34  // v= -0.797
`define LEAF_T6_N68_C2  16'hFF35  // v= -0.791
`define LEAF_T6_N69_C2  16'hFF34  // v= -0.796
`define LEAF_T6_N71_C2  16'hFF2E  // v= -0.820
`define LEAF_T6_N75_C2  16'hFF26  // v= -0.851
`define LEAF_T6_N76_C2  16'hFF33  // v= -0.800
`define LEAF_T6_N78_C2  16'h0102  // v=  1.008
`define LEAF_T6_N79_C2  16'h00F5  // v=  0.957
`define LEAF_T6_N81_C2  16'hFF1D  // v= -0.885
`define LEAF_T6_N83_C2  16'h00F5  // v=  0.959
`define LEAF_T6_N84_C2  16'h00FF  // v=  0.995
`define LEAF_T7_N 6_C2  16'hFF38  // v= -0.782
`define LEAF_T7_N 7_C2  16'hFF37  // v= -0.786
`define LEAF_T7_N 9_C2  16'hFF34  // v= -0.798
`define LEAF_T7_N10_C2  16'hFF37  // v= -0.784
`define LEAF_T7_N13_C2  16'hFF36  // v= -0.788
`define LEAF_T7_N14_C2  16'h019C  // v=  1.610
`define LEAF_T7_N16_C2  16'hFF36  // v= -0.789
`define LEAF_T7_N17_C2  16'hFFAE  // v= -0.321
`define LEAF_T7_N21_C2  16'hFF38  // v= -0.781
`define LEAF_T7_N22_C2  16'h00F3  // v=  0.948
`define LEAF_T7_N24_C2  16'hFF37  // v= -0.785
`define LEAF_T7_N25_C2  16'hFF35  // v= -0.792
`define LEAF_T7_N28_C2  16'hFF37  // v= -0.786
`define LEAF_T7_N29_C2  16'hFF2E  // v= -0.819
`define LEAF_T7_N31_C2  16'h00E8  // v=  0.908
`define LEAF_T7_N32_C2  16'hFF30  // v= -0.813
`define LEAF_T7_N37_C2  16'hFF34  // v= -0.795
`define LEAF_T7_N38_C2  16'hFF36  // v= -0.788
`define LEAF_T7_N40_C2  16'hFF32  // v= -0.805
`define LEAF_T7_N41_C2  16'hFF2C  // v= -0.827
`define LEAF_T7_N44_C2  16'hFF37  // v= -0.784
`define LEAF_T7_N45_C2  16'hFF35  // v= -0.792
`define LEAF_T7_N47_C2  16'hFF39  // v= -0.777
`define LEAF_T7_N48_C2  16'hFF38  // v= -0.781
`define LEAF_T7_N50_C2  16'hFF25  // v= -0.854
`define LEAF_T7_N52_C2  16'hFF19  // v= -0.902
`define LEAF_T7_N54_C2  16'h0100  // v=  1.000
`define LEAF_T7_N55_C2  16'h00F1  // v=  0.942
`define LEAF_T7_N60_C2  16'hFF29  // v= -0.839
`define LEAF_T7_N62_C2  16'hFF37  // v= -0.786
`define LEAF_T7_N63_C2  16'hFF31  // v= -0.808
`define LEAF_T7_N66_C2  16'hFF38  // v= -0.780
`define LEAF_T7_N67_C2  16'hFF39  // v= -0.779
`define LEAF_T7_N69_C2  16'hFF39  // v= -0.778
`define LEAF_T7_N70_C2  16'hFF3A  // v= -0.774
`define LEAF_T7_N71_C2  16'hFF20  // v= -0.876
`define LEAF_T7_N73_C2  16'hFF31  // v= -0.809
`define LEAF_T7_N77_C2  16'hFF2B  // v= -0.832
`define LEAF_T7_N78_C2  16'hFF38  // v= -0.783
`define LEAF_T7_N80_C2  16'h00F4  // v=  0.955
`define LEAF_T7_N81_C2  16'h00EC  // v=  0.920
`define LEAF_T7_N83_C2  16'hFF1E  // v= -0.883
`define LEAF_T7_N85_C2  16'h00E0  // v=  0.875
`define LEAF_T7_N86_C2  16'h00F1  // v=  0.940
`define LEAF_T8_N 6_C2  16'hFF3C  // v= -0.767
`define LEAF_T8_N 7_C2  16'hFF3B  // v= -0.771
`define LEAF_T8_N 9_C2  16'hFF37  // v= -0.784
`define LEAF_T8_N10_C2  16'hFF3B  // v= -0.770
`define LEAF_T8_N12_C2  16'h0223  // v=  2.137
`define LEAF_T8_N14_C2  16'hFF3A  // v= -0.774
`define LEAF_T8_N15_C2  16'hFF74  // v= -0.546
`define LEAF_T8_N19_C2  16'hFF3C  // v= -0.766
`define LEAF_T8_N20_C2  16'h00E5  // v=  0.895
`define LEAF_T8_N22_C2  16'hFF3B  // v= -0.769
`define LEAF_T8_N23_C2  16'hFF39  // v= -0.776
`define LEAF_T8_N26_C2  16'hFF3B  // v= -0.770
`define LEAF_T8_N27_C2  16'hFF33  // v= -0.801
`define LEAF_T8_N29_C2  16'h00DD  // v=  0.865
`define LEAF_T8_N30_C2  16'hFF35  // v= -0.793
`define LEAF_T8_N35_C2  16'hFF39  // v= -0.777
`define LEAF_T8_N36_C2  16'hFF37  // v= -0.787
`define LEAF_T8_N38_C2  16'hFF33  // v= -0.800
`define LEAF_T8_N39_C2  16'hFF38  // v= -0.781
`define LEAF_T8_N42_C2  16'hFF3B  // v= -0.770
`define LEAF_T8_N43_C2  16'hFF3C  // v= -0.765
`define LEAF_T8_N44_C2  16'hFF37  // v= -0.787
`define LEAF_T8_N46_C2  16'hFF25  // v= -0.854
`define LEAF_T8_N49_C2  16'h00F2  // v=  0.947
`define LEAF_T8_N50_C2  16'h00E6  // v=  0.898
`define LEAF_T8_N51_C2  16'hFF15  // v= -0.919
`define LEAF_T8_N56_C2  16'hFF2F  // v= -0.817
`define LEAF_T8_N58_C2  16'hFF3D  // v= -0.762
`define LEAF_T8_N59_C2  16'hFF38  // v= -0.783
`define LEAF_T8_N62_C2  16'hFF3C  // v= -0.765
`define LEAF_T8_N63_C2  16'hFF3D  // v= -0.764
`define LEAF_T8_N65_C2  16'hFF3D  // v= -0.760
`define LEAF_T8_N66_C2  16'hFF3E  // v= -0.758
`define LEAF_T8_N67_C2  16'hFF20  // v= -0.874
`define LEAF_T8_N69_C2  16'hFF36  // v= -0.790
`define LEAF_T8_N73_C2  16'h00E8  // v=  0.907
`define LEAF_T8_N74_C2  16'h00D9  // v=  0.847
`define LEAF_T8_N76_C2  16'hFF1C  // v= -0.893
`define LEAF_T8_N77_C2  16'hFF37  // v= -0.786
`define LEAF_T8_N79_C2  16'hFF1F  // v= -0.880
`define LEAF_T8_N81_C2  16'h00DB  // v=  0.855
`define LEAF_T8_N82_C2  16'h00E5  // v=  0.896
`define LEAF_T9_N 6_C2  16'hFF3F  // v= -0.754
`define LEAF_T9_N 7_C2  16'hFF3E  // v= -0.758
`define LEAF_T9_N 9_C2  16'hFF3A  // v= -0.772
`define LEAF_T9_N10_C2  16'hFF3E  // v= -0.757
`define LEAF_T9_N13_C2  16'hFF3D  // v= -0.760
`define LEAF_T9_N14_C2  16'h01A0  // v=  1.626
`define LEAF_T9_N16_C2  16'hFF51  // v= -0.685
`define LEAF_T9_N17_C2  16'h0036  // v=  0.212
`define LEAF_T9_N21_C2  16'h00DA  // v=  0.852
`define LEAF_T9_N22_C2  16'hFEE7  // v= -1.097
`define LEAF_T9_N24_C2  16'hFF3E  // v= -0.756
`define LEAF_T9_N25_C2  16'hFF3C  // v= -0.764
`define LEAF_T9_N28_C2  16'hFF3E  // v= -0.757
`define LEAF_T9_N29_C2  16'hFF37  // v= -0.787
`define LEAF_T9_N31_C2  16'h00D4  // v=  0.827
`define LEAF_T9_N32_C2  16'hFF37  // v= -0.784
`define LEAF_T9_N37_C2  16'hFF3C  // v= -0.767
`define LEAF_T9_N38_C2  16'hFF39  // v= -0.777
`define LEAF_T9_N40_C2  16'hFF32  // v= -0.804
`define LEAF_T9_N41_C2  16'hFF37  // v= -0.784
`define LEAF_T9_N44_C2  16'hFF3B  // v= -0.768
`define LEAF_T9_N45_C2  16'hFF3D  // v= -0.764
`define LEAF_T9_N47_C2  16'hFF3F  // v= -0.754
`define LEAF_T9_N48_C2  16'hFF3B  // v= -0.770
`define LEAF_T9_N50_C2  16'hFF2B  // v= -0.833
`define LEAF_T9_N53_C2  16'h00E6  // v=  0.899
`define LEAF_T9_N54_C2  16'h00DD  // v=  0.863
`define LEAF_T9_N55_C2  16'hFF1E  // v= -0.883
`define LEAF_T9_N60_C2  16'hFF34  // v= -0.797
`define LEAF_T9_N62_C2  16'hFF40  // v= -0.749
`define LEAF_T9_N63_C2  16'hFF3C  // v= -0.767
`define LEAF_T9_N66_C2  16'hFF40  // v= -0.751
`define LEAF_T9_N67_C2  16'hFF40  // v= -0.750
`define LEAF_T9_N69_C2  16'hFF41  // v= -0.746
`define LEAF_T9_N70_C2  16'hFF41  // v= -0.747
`define LEAF_T9_N71_C2  16'hFF24  // v= -0.861
`define LEAF_T9_N73_C2  16'hFF3B  // v= -0.770
`define LEAF_T9_N77_C2  16'h00D6  // v=  0.834
`define LEAF_T9_N78_C2  16'h00DF  // v=  0.873
`define LEAF_T9_N80_C2  16'hFF1C  // v= -0.889
`define LEAF_T9_N81_C2  16'hFF3B  // v= -0.770
`define LEAF_T9_N83_C2  16'hFF1F  // v= -0.878
`define LEAF_T9_N85_C2  16'h00DD  // v=  0.863
`define LEAF_T9_N86_C2  16'h00D8  // v=  0.844

`endif // VERILOG_PARAMS_VH

// End of auto-generated parameters