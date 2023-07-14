`ifdef ST_WIDTH_INF_16        
golden_yjp0   = golden_column[`MATRIX_WIDTH*32-0  *32-1:`MATRIX_WIDTH*32-0  *32-32];    
golden_yjp1   = golden_column[`MATRIX_WIDTH*32-1  *32-1:`MATRIX_WIDTH*32-1  *32-32];    
golden_yjp2   = golden_column[`MATRIX_WIDTH*32-2  *32-1:`MATRIX_WIDTH*32-2  *32-32];    
golden_yjp3   = golden_column[`MATRIX_WIDTH*32-3  *32-1:`MATRIX_WIDTH*32-3  *32-32];    
golden_yjp4   = golden_column[`MATRIX_WIDTH*32-4  *32-1:`MATRIX_WIDTH*32-4  *32-32];    
golden_yjp5   = golden_column[`MATRIX_WIDTH*32-5  *32-1:`MATRIX_WIDTH*32-5  *32-32];    
golden_yjp6   = golden_column[`MATRIX_WIDTH*32-6  *32-1:`MATRIX_WIDTH*32-6  *32-32];    
golden_yjp7   = golden_column[`MATRIX_WIDTH*32-7  *32-1:`MATRIX_WIDTH*32-7  *32-32];    
`endif // ST_WIDTH_INF_16        
`ifdef ST_WIDTH_INF_32        
golden_yjp8   = golden_column[`MATRIX_WIDTH*32-8  *32-1:`MATRIX_WIDTH*32-8  *32-32];    
golden_yjp9   = golden_column[`MATRIX_WIDTH*32-9  *32-1:`MATRIX_WIDTH*32-9  *32-32];    
golden_yjp10  = golden_column[`MATRIX_WIDTH*32-10 *32-1:`MATRIX_WIDTH*32-10 *32-32];    
golden_yjp11  = golden_column[`MATRIX_WIDTH*32-11 *32-1:`MATRIX_WIDTH*32-11 *32-32];    
golden_yjp12  = golden_column[`MATRIX_WIDTH*32-12 *32-1:`MATRIX_WIDTH*32-12 *32-32];    
golden_yjp13  = golden_column[`MATRIX_WIDTH*32-13 *32-1:`MATRIX_WIDTH*32-13 *32-32];    
golden_yjp14  = golden_column[`MATRIX_WIDTH*32-14 *32-1:`MATRIX_WIDTH*32-14 *32-32];    
golden_yjp15  = golden_column[`MATRIX_WIDTH*32-15 *32-1:`MATRIX_WIDTH*32-15 *32-32];    
`endif // ST_WIDTH_INF_32        
`ifdef ST_WIDTH_INF_64        
golden_yjp16  = golden_column[`MATRIX_WIDTH*32-16 *32-1:`MATRIX_WIDTH*32-16 *32-32];    
golden_yjp17  = golden_column[`MATRIX_WIDTH*32-17 *32-1:`MATRIX_WIDTH*32-17 *32-32];    
golden_yjp18  = golden_column[`MATRIX_WIDTH*32-18 *32-1:`MATRIX_WIDTH*32-18 *32-32];    
golden_yjp19  = golden_column[`MATRIX_WIDTH*32-19 *32-1:`MATRIX_WIDTH*32-19 *32-32];    
golden_yjp20  = golden_column[`MATRIX_WIDTH*32-20 *32-1:`MATRIX_WIDTH*32-20 *32-32];    
golden_yjp21  = golden_column[`MATRIX_WIDTH*32-21 *32-1:`MATRIX_WIDTH*32-21 *32-32];    
golden_yjp22  = golden_column[`MATRIX_WIDTH*32-22 *32-1:`MATRIX_WIDTH*32-22 *32-32];    
golden_yjp23  = golden_column[`MATRIX_WIDTH*32-23 *32-1:`MATRIX_WIDTH*32-23 *32-32];    
golden_yjp24  = golden_column[`MATRIX_WIDTH*32-24 *32-1:`MATRIX_WIDTH*32-24 *32-32];    
golden_yjp25  = golden_column[`MATRIX_WIDTH*32-25 *32-1:`MATRIX_WIDTH*32-25 *32-32];    
golden_yjp26  = golden_column[`MATRIX_WIDTH*32-26 *32-1:`MATRIX_WIDTH*32-26 *32-32];    
golden_yjp27  = golden_column[`MATRIX_WIDTH*32-27 *32-1:`MATRIX_WIDTH*32-27 *32-32];    
golden_yjp28  = golden_column[`MATRIX_WIDTH*32-28 *32-1:`MATRIX_WIDTH*32-28 *32-32];    
golden_yjp29  = golden_column[`MATRIX_WIDTH*32-29 *32-1:`MATRIX_WIDTH*32-29 *32-32];    
golden_yjp30  = golden_column[`MATRIX_WIDTH*32-30 *32-1:`MATRIX_WIDTH*32-30 *32-32];    
golden_yjp31  = golden_column[`MATRIX_WIDTH*32-31 *32-1:`MATRIX_WIDTH*32-31 *32-32];    
`endif // ST_WIDTH_INF_64        
`ifdef ST_WIDTH_INF_128        
golden_yjp32  = golden_column[`MATRIX_WIDTH*32-32 *32-1:`MATRIX_WIDTH*32-32 *32-32];    
golden_yjp33  = golden_column[`MATRIX_WIDTH*32-33 *32-1:`MATRIX_WIDTH*32-33 *32-32];    
golden_yjp34  = golden_column[`MATRIX_WIDTH*32-34 *32-1:`MATRIX_WIDTH*32-34 *32-32];    
golden_yjp35  = golden_column[`MATRIX_WIDTH*32-35 *32-1:`MATRIX_WIDTH*32-35 *32-32];    
golden_yjp36  = golden_column[`MATRIX_WIDTH*32-36 *32-1:`MATRIX_WIDTH*32-36 *32-32];    
golden_yjp37  = golden_column[`MATRIX_WIDTH*32-37 *32-1:`MATRIX_WIDTH*32-37 *32-32];    
golden_yjp38  = golden_column[`MATRIX_WIDTH*32-38 *32-1:`MATRIX_WIDTH*32-38 *32-32];    
golden_yjp39  = golden_column[`MATRIX_WIDTH*32-39 *32-1:`MATRIX_WIDTH*32-39 *32-32];    
golden_yjp40  = golden_column[`MATRIX_WIDTH*32-40 *32-1:`MATRIX_WIDTH*32-40 *32-32];    
golden_yjp41  = golden_column[`MATRIX_WIDTH*32-41 *32-1:`MATRIX_WIDTH*32-41 *32-32];    
golden_yjp42  = golden_column[`MATRIX_WIDTH*32-42 *32-1:`MATRIX_WIDTH*32-42 *32-32];    
golden_yjp43  = golden_column[`MATRIX_WIDTH*32-43 *32-1:`MATRIX_WIDTH*32-43 *32-32];    
golden_yjp44  = golden_column[`MATRIX_WIDTH*32-44 *32-1:`MATRIX_WIDTH*32-44 *32-32];    
golden_yjp45  = golden_column[`MATRIX_WIDTH*32-45 *32-1:`MATRIX_WIDTH*32-45 *32-32];    
golden_yjp46  = golden_column[`MATRIX_WIDTH*32-46 *32-1:`MATRIX_WIDTH*32-46 *32-32];    
golden_yjp47  = golden_column[`MATRIX_WIDTH*32-47 *32-1:`MATRIX_WIDTH*32-47 *32-32];    
golden_yjp48  = golden_column[`MATRIX_WIDTH*32-48 *32-1:`MATRIX_WIDTH*32-48 *32-32];    
golden_yjp49  = golden_column[`MATRIX_WIDTH*32-49 *32-1:`MATRIX_WIDTH*32-49 *32-32];    
golden_yjp50  = golden_column[`MATRIX_WIDTH*32-50 *32-1:`MATRIX_WIDTH*32-50 *32-32];    
golden_yjp51  = golden_column[`MATRIX_WIDTH*32-51 *32-1:`MATRIX_WIDTH*32-51 *32-32];    
golden_yjp52  = golden_column[`MATRIX_WIDTH*32-52 *32-1:`MATRIX_WIDTH*32-52 *32-32];    
golden_yjp53  = golden_column[`MATRIX_WIDTH*32-53 *32-1:`MATRIX_WIDTH*32-53 *32-32];    
golden_yjp54  = golden_column[`MATRIX_WIDTH*32-54 *32-1:`MATRIX_WIDTH*32-54 *32-32];    
golden_yjp55  = golden_column[`MATRIX_WIDTH*32-55 *32-1:`MATRIX_WIDTH*32-55 *32-32];    
golden_yjp56  = golden_column[`MATRIX_WIDTH*32-56 *32-1:`MATRIX_WIDTH*32-56 *32-32];    
golden_yjp57  = golden_column[`MATRIX_WIDTH*32-57 *32-1:`MATRIX_WIDTH*32-57 *32-32];    
golden_yjp58  = golden_column[`MATRIX_WIDTH*32-58 *32-1:`MATRIX_WIDTH*32-58 *32-32];    
golden_yjp59  = golden_column[`MATRIX_WIDTH*32-59 *32-1:`MATRIX_WIDTH*32-59 *32-32];    
golden_yjp60  = golden_column[`MATRIX_WIDTH*32-60 *32-1:`MATRIX_WIDTH*32-60 *32-32];    
golden_yjp61  = golden_column[`MATRIX_WIDTH*32-61 *32-1:`MATRIX_WIDTH*32-61 *32-32];    
golden_yjp62  = golden_column[`MATRIX_WIDTH*32-62 *32-1:`MATRIX_WIDTH*32-62 *32-32];    
golden_yjp63  = golden_column[`MATRIX_WIDTH*32-63 *32-1:`MATRIX_WIDTH*32-63 *32-32];    
`endif // ST_WIDTH_INF_128        
`ifdef ST_WIDTH_INF_256        
golden_yjp64  = golden_column[`MATRIX_WIDTH*32-64 *32-1:`MATRIX_WIDTH*32-64 *32-32];    
golden_yjp65  = golden_column[`MATRIX_WIDTH*32-65 *32-1:`MATRIX_WIDTH*32-65 *32-32];    
golden_yjp66  = golden_column[`MATRIX_WIDTH*32-66 *32-1:`MATRIX_WIDTH*32-66 *32-32];    
golden_yjp67  = golden_column[`MATRIX_WIDTH*32-67 *32-1:`MATRIX_WIDTH*32-67 *32-32];    
golden_yjp68  = golden_column[`MATRIX_WIDTH*32-68 *32-1:`MATRIX_WIDTH*32-68 *32-32];    
golden_yjp69  = golden_column[`MATRIX_WIDTH*32-69 *32-1:`MATRIX_WIDTH*32-69 *32-32];    
golden_yjp70  = golden_column[`MATRIX_WIDTH*32-70 *32-1:`MATRIX_WIDTH*32-70 *32-32];    
golden_yjp71  = golden_column[`MATRIX_WIDTH*32-71 *32-1:`MATRIX_WIDTH*32-71 *32-32];    
golden_yjp72  = golden_column[`MATRIX_WIDTH*32-72 *32-1:`MATRIX_WIDTH*32-72 *32-32];    
golden_yjp73  = golden_column[`MATRIX_WIDTH*32-73 *32-1:`MATRIX_WIDTH*32-73 *32-32];    
golden_yjp74  = golden_column[`MATRIX_WIDTH*32-74 *32-1:`MATRIX_WIDTH*32-74 *32-32];    
golden_yjp75  = golden_column[`MATRIX_WIDTH*32-75 *32-1:`MATRIX_WIDTH*32-75 *32-32];    
golden_yjp76  = golden_column[`MATRIX_WIDTH*32-76 *32-1:`MATRIX_WIDTH*32-76 *32-32];    
golden_yjp77  = golden_column[`MATRIX_WIDTH*32-77 *32-1:`MATRIX_WIDTH*32-77 *32-32];    
golden_yjp78  = golden_column[`MATRIX_WIDTH*32-78 *32-1:`MATRIX_WIDTH*32-78 *32-32];    
golden_yjp79  = golden_column[`MATRIX_WIDTH*32-79 *32-1:`MATRIX_WIDTH*32-79 *32-32];    
golden_yjp80  = golden_column[`MATRIX_WIDTH*32-80 *32-1:`MATRIX_WIDTH*32-80 *32-32];    
golden_yjp81  = golden_column[`MATRIX_WIDTH*32-81 *32-1:`MATRIX_WIDTH*32-81 *32-32];    
golden_yjp82  = golden_column[`MATRIX_WIDTH*32-82 *32-1:`MATRIX_WIDTH*32-82 *32-32];    
golden_yjp83  = golden_column[`MATRIX_WIDTH*32-83 *32-1:`MATRIX_WIDTH*32-83 *32-32];    
golden_yjp84  = golden_column[`MATRIX_WIDTH*32-84 *32-1:`MATRIX_WIDTH*32-84 *32-32];    
golden_yjp85  = golden_column[`MATRIX_WIDTH*32-85 *32-1:`MATRIX_WIDTH*32-85 *32-32];    
golden_yjp86  = golden_column[`MATRIX_WIDTH*32-86 *32-1:`MATRIX_WIDTH*32-86 *32-32];    
golden_yjp87  = golden_column[`MATRIX_WIDTH*32-87 *32-1:`MATRIX_WIDTH*32-87 *32-32];    
golden_yjp88  = golden_column[`MATRIX_WIDTH*32-88 *32-1:`MATRIX_WIDTH*32-88 *32-32];    
golden_yjp89  = golden_column[`MATRIX_WIDTH*32-89 *32-1:`MATRIX_WIDTH*32-89 *32-32];    
golden_yjp90  = golden_column[`MATRIX_WIDTH*32-90 *32-1:`MATRIX_WIDTH*32-90 *32-32];    
golden_yjp91  = golden_column[`MATRIX_WIDTH*32-91 *32-1:`MATRIX_WIDTH*32-91 *32-32];    
golden_yjp92  = golden_column[`MATRIX_WIDTH*32-92 *32-1:`MATRIX_WIDTH*32-92 *32-32];    
golden_yjp93  = golden_column[`MATRIX_WIDTH*32-93 *32-1:`MATRIX_WIDTH*32-93 *32-32];    
golden_yjp94  = golden_column[`MATRIX_WIDTH*32-94 *32-1:`MATRIX_WIDTH*32-94 *32-32];    
golden_yjp95  = golden_column[`MATRIX_WIDTH*32-95 *32-1:`MATRIX_WIDTH*32-95 *32-32];    
golden_yjp96  = golden_column[`MATRIX_WIDTH*32-96 *32-1:`MATRIX_WIDTH*32-96 *32-32];    
golden_yjp97  = golden_column[`MATRIX_WIDTH*32-97 *32-1:`MATRIX_WIDTH*32-97 *32-32];    
golden_yjp98  = golden_column[`MATRIX_WIDTH*32-98 *32-1:`MATRIX_WIDTH*32-98 *32-32];    
golden_yjp99  = golden_column[`MATRIX_WIDTH*32-99 *32-1:`MATRIX_WIDTH*32-99 *32-32];    
golden_yjp100 = golden_column[`MATRIX_WIDTH*32-100*32-1:`MATRIX_WIDTH*32-100*32-32];    
golden_yjp101 = golden_column[`MATRIX_WIDTH*32-101*32-1:`MATRIX_WIDTH*32-101*32-32];    
golden_yjp102 = golden_column[`MATRIX_WIDTH*32-102*32-1:`MATRIX_WIDTH*32-102*32-32];    
golden_yjp103 = golden_column[`MATRIX_WIDTH*32-103*32-1:`MATRIX_WIDTH*32-103*32-32];    
golden_yjp104 = golden_column[`MATRIX_WIDTH*32-104*32-1:`MATRIX_WIDTH*32-104*32-32];    
golden_yjp105 = golden_column[`MATRIX_WIDTH*32-105*32-1:`MATRIX_WIDTH*32-105*32-32];    
golden_yjp106 = golden_column[`MATRIX_WIDTH*32-106*32-1:`MATRIX_WIDTH*32-106*32-32];    
golden_yjp107 = golden_column[`MATRIX_WIDTH*32-107*32-1:`MATRIX_WIDTH*32-107*32-32];    
golden_yjp108 = golden_column[`MATRIX_WIDTH*32-108*32-1:`MATRIX_WIDTH*32-108*32-32];    
golden_yjp109 = golden_column[`MATRIX_WIDTH*32-109*32-1:`MATRIX_WIDTH*32-109*32-32];    
golden_yjp110 = golden_column[`MATRIX_WIDTH*32-110*32-1:`MATRIX_WIDTH*32-110*32-32];    
golden_yjp111 = golden_column[`MATRIX_WIDTH*32-111*32-1:`MATRIX_WIDTH*32-111*32-32];    
golden_yjp112 = golden_column[`MATRIX_WIDTH*32-112*32-1:`MATRIX_WIDTH*32-112*32-32];    
golden_yjp113 = golden_column[`MATRIX_WIDTH*32-113*32-1:`MATRIX_WIDTH*32-113*32-32];    
golden_yjp114 = golden_column[`MATRIX_WIDTH*32-114*32-1:`MATRIX_WIDTH*32-114*32-32];    
golden_yjp115 = golden_column[`MATRIX_WIDTH*32-115*32-1:`MATRIX_WIDTH*32-115*32-32];    
golden_yjp116 = golden_column[`MATRIX_WIDTH*32-116*32-1:`MATRIX_WIDTH*32-116*32-32];    
golden_yjp117 = golden_column[`MATRIX_WIDTH*32-117*32-1:`MATRIX_WIDTH*32-117*32-32];    
golden_yjp118 = golden_column[`MATRIX_WIDTH*32-118*32-1:`MATRIX_WIDTH*32-118*32-32];    
golden_yjp119 = golden_column[`MATRIX_WIDTH*32-119*32-1:`MATRIX_WIDTH*32-119*32-32];    
golden_yjp120 = golden_column[`MATRIX_WIDTH*32-120*32-1:`MATRIX_WIDTH*32-120*32-32];    
golden_yjp121 = golden_column[`MATRIX_WIDTH*32-121*32-1:`MATRIX_WIDTH*32-121*32-32];    
golden_yjp122 = golden_column[`MATRIX_WIDTH*32-122*32-1:`MATRIX_WIDTH*32-122*32-32];    
golden_yjp123 = golden_column[`MATRIX_WIDTH*32-123*32-1:`MATRIX_WIDTH*32-123*32-32];    
golden_yjp124 = golden_column[`MATRIX_WIDTH*32-124*32-1:`MATRIX_WIDTH*32-124*32-32];    
golden_yjp125 = golden_column[`MATRIX_WIDTH*32-125*32-1:`MATRIX_WIDTH*32-125*32-32];    
golden_yjp126 = golden_column[`MATRIX_WIDTH*32-126*32-1:`MATRIX_WIDTH*32-126*32-32];    
golden_yjp127 = golden_column[`MATRIX_WIDTH*32-127*32-1:`MATRIX_WIDTH*32-127*32-32];    
`endif // ST_WIDTH_INF_256        
`ifdef ST_WIDTH_INF_16        
dut_yjp0      =    dut_column[`MATRIX_WIDTH*32-0  *32-1:`MATRIX_WIDTH*32-0  *32-32];    
dut_yjp1      =    dut_column[`MATRIX_WIDTH*32-1  *32-1:`MATRIX_WIDTH*32-1  *32-32];    
dut_yjp2      =    dut_column[`MATRIX_WIDTH*32-2  *32-1:`MATRIX_WIDTH*32-2  *32-32];    
dut_yjp3      =    dut_column[`MATRIX_WIDTH*32-3  *32-1:`MATRIX_WIDTH*32-3  *32-32];    
dut_yjp4      =    dut_column[`MATRIX_WIDTH*32-4  *32-1:`MATRIX_WIDTH*32-4  *32-32];    
dut_yjp5      =    dut_column[`MATRIX_WIDTH*32-5  *32-1:`MATRIX_WIDTH*32-5  *32-32];    
dut_yjp6      =    dut_column[`MATRIX_WIDTH*32-6  *32-1:`MATRIX_WIDTH*32-6  *32-32];    
dut_yjp7      =    dut_column[`MATRIX_WIDTH*32-7  *32-1:`MATRIX_WIDTH*32-7  *32-32];    
`endif // ST_WIDTH_INF_16        
`ifdef ST_WIDTH_INF_32        
dut_yjp8      =    dut_column[`MATRIX_WIDTH*32-8  *32-1:`MATRIX_WIDTH*32-8  *32-32];    
dut_yjp9      =    dut_column[`MATRIX_WIDTH*32-9  *32-1:`MATRIX_WIDTH*32-9  *32-32];    
dut_yjp10     =    dut_column[`MATRIX_WIDTH*32-10 *32-1:`MATRIX_WIDTH*32-10 *32-32];    
dut_yjp11     =    dut_column[`MATRIX_WIDTH*32-11 *32-1:`MATRIX_WIDTH*32-11 *32-32];    
dut_yjp12     =    dut_column[`MATRIX_WIDTH*32-12 *32-1:`MATRIX_WIDTH*32-12 *32-32];    
dut_yjp13     =    dut_column[`MATRIX_WIDTH*32-13 *32-1:`MATRIX_WIDTH*32-13 *32-32];    
dut_yjp14     =    dut_column[`MATRIX_WIDTH*32-14 *32-1:`MATRIX_WIDTH*32-14 *32-32];    
dut_yjp15     =    dut_column[`MATRIX_WIDTH*32-15 *32-1:`MATRIX_WIDTH*32-15 *32-32];    
`endif // ST_WIDTH_INF_32        
`ifdef ST_WIDTH_INF_64        
dut_yjp16     =    dut_column[`MATRIX_WIDTH*32-16 *32-1:`MATRIX_WIDTH*32-16 *32-32];    
dut_yjp17     =    dut_column[`MATRIX_WIDTH*32-17 *32-1:`MATRIX_WIDTH*32-17 *32-32];    
dut_yjp18     =    dut_column[`MATRIX_WIDTH*32-18 *32-1:`MATRIX_WIDTH*32-18 *32-32];    
dut_yjp19     =    dut_column[`MATRIX_WIDTH*32-19 *32-1:`MATRIX_WIDTH*32-19 *32-32];    
dut_yjp20     =    dut_column[`MATRIX_WIDTH*32-20 *32-1:`MATRIX_WIDTH*32-20 *32-32];    
dut_yjp21     =    dut_column[`MATRIX_WIDTH*32-21 *32-1:`MATRIX_WIDTH*32-21 *32-32];    
dut_yjp22     =    dut_column[`MATRIX_WIDTH*32-22 *32-1:`MATRIX_WIDTH*32-22 *32-32];    
dut_yjp23     =    dut_column[`MATRIX_WIDTH*32-23 *32-1:`MATRIX_WIDTH*32-23 *32-32];    
dut_yjp24     =    dut_column[`MATRIX_WIDTH*32-24 *32-1:`MATRIX_WIDTH*32-24 *32-32];    
dut_yjp25     =    dut_column[`MATRIX_WIDTH*32-25 *32-1:`MATRIX_WIDTH*32-25 *32-32];    
dut_yjp26     =    dut_column[`MATRIX_WIDTH*32-26 *32-1:`MATRIX_WIDTH*32-26 *32-32];    
dut_yjp27     =    dut_column[`MATRIX_WIDTH*32-27 *32-1:`MATRIX_WIDTH*32-27 *32-32];    
dut_yjp28     =    dut_column[`MATRIX_WIDTH*32-28 *32-1:`MATRIX_WIDTH*32-28 *32-32];    
dut_yjp29     =    dut_column[`MATRIX_WIDTH*32-29 *32-1:`MATRIX_WIDTH*32-29 *32-32];    
dut_yjp30     =    dut_column[`MATRIX_WIDTH*32-30 *32-1:`MATRIX_WIDTH*32-30 *32-32];    
dut_yjp31     =    dut_column[`MATRIX_WIDTH*32-31 *32-1:`MATRIX_WIDTH*32-31 *32-32];    
`endif // ST_WIDTH_INF_64        
`ifdef ST_WIDTH_INF_128        
dut_yjp32     =    dut_column[`MATRIX_WIDTH*32-32 *32-1:`MATRIX_WIDTH*32-32 *32-32];    
dut_yjp33     =    dut_column[`MATRIX_WIDTH*32-33 *32-1:`MATRIX_WIDTH*32-33 *32-32];    
dut_yjp34     =    dut_column[`MATRIX_WIDTH*32-34 *32-1:`MATRIX_WIDTH*32-34 *32-32];    
dut_yjp35     =    dut_column[`MATRIX_WIDTH*32-35 *32-1:`MATRIX_WIDTH*32-35 *32-32];    
dut_yjp36     =    dut_column[`MATRIX_WIDTH*32-36 *32-1:`MATRIX_WIDTH*32-36 *32-32];    
dut_yjp37     =    dut_column[`MATRIX_WIDTH*32-37 *32-1:`MATRIX_WIDTH*32-37 *32-32];    
dut_yjp38     =    dut_column[`MATRIX_WIDTH*32-38 *32-1:`MATRIX_WIDTH*32-38 *32-32];    
dut_yjp39     =    dut_column[`MATRIX_WIDTH*32-39 *32-1:`MATRIX_WIDTH*32-39 *32-32];    
dut_yjp40     =    dut_column[`MATRIX_WIDTH*32-40 *32-1:`MATRIX_WIDTH*32-40 *32-32];    
dut_yjp41     =    dut_column[`MATRIX_WIDTH*32-41 *32-1:`MATRIX_WIDTH*32-41 *32-32];    
dut_yjp42     =    dut_column[`MATRIX_WIDTH*32-42 *32-1:`MATRIX_WIDTH*32-42 *32-32];    
dut_yjp43     =    dut_column[`MATRIX_WIDTH*32-43 *32-1:`MATRIX_WIDTH*32-43 *32-32];    
dut_yjp44     =    dut_column[`MATRIX_WIDTH*32-44 *32-1:`MATRIX_WIDTH*32-44 *32-32];    
dut_yjp45     =    dut_column[`MATRIX_WIDTH*32-45 *32-1:`MATRIX_WIDTH*32-45 *32-32];    
dut_yjp46     =    dut_column[`MATRIX_WIDTH*32-46 *32-1:`MATRIX_WIDTH*32-46 *32-32];    
dut_yjp47     =    dut_column[`MATRIX_WIDTH*32-47 *32-1:`MATRIX_WIDTH*32-47 *32-32];    
dut_yjp48     =    dut_column[`MATRIX_WIDTH*32-48 *32-1:`MATRIX_WIDTH*32-48 *32-32];    
dut_yjp49     =    dut_column[`MATRIX_WIDTH*32-49 *32-1:`MATRIX_WIDTH*32-49 *32-32];    
dut_yjp50     =    dut_column[`MATRIX_WIDTH*32-50 *32-1:`MATRIX_WIDTH*32-50 *32-32];    
dut_yjp51     =    dut_column[`MATRIX_WIDTH*32-51 *32-1:`MATRIX_WIDTH*32-51 *32-32];    
dut_yjp52     =    dut_column[`MATRIX_WIDTH*32-52 *32-1:`MATRIX_WIDTH*32-52 *32-32];    
dut_yjp53     =    dut_column[`MATRIX_WIDTH*32-53 *32-1:`MATRIX_WIDTH*32-53 *32-32];    
dut_yjp54     =    dut_column[`MATRIX_WIDTH*32-54 *32-1:`MATRIX_WIDTH*32-54 *32-32];    
dut_yjp55     =    dut_column[`MATRIX_WIDTH*32-55 *32-1:`MATRIX_WIDTH*32-55 *32-32];    
dut_yjp56     =    dut_column[`MATRIX_WIDTH*32-56 *32-1:`MATRIX_WIDTH*32-56 *32-32];    
dut_yjp57     =    dut_column[`MATRIX_WIDTH*32-57 *32-1:`MATRIX_WIDTH*32-57 *32-32];    
dut_yjp58     =    dut_column[`MATRIX_WIDTH*32-58 *32-1:`MATRIX_WIDTH*32-58 *32-32];    
dut_yjp59     =    dut_column[`MATRIX_WIDTH*32-59 *32-1:`MATRIX_WIDTH*32-59 *32-32];    
dut_yjp60     =    dut_column[`MATRIX_WIDTH*32-60 *32-1:`MATRIX_WIDTH*32-60 *32-32];    
dut_yjp61     =    dut_column[`MATRIX_WIDTH*32-61 *32-1:`MATRIX_WIDTH*32-61 *32-32];    
dut_yjp62     =    dut_column[`MATRIX_WIDTH*32-62 *32-1:`MATRIX_WIDTH*32-62 *32-32];    
dut_yjp63     =    dut_column[`MATRIX_WIDTH*32-63 *32-1:`MATRIX_WIDTH*32-63 *32-32];    
`endif // ST_WIDTH_INF_128        
`ifdef ST_WIDTH_INF_256        
dut_yjp64     =    dut_column[`MATRIX_WIDTH*32-64 *32-1:`MATRIX_WIDTH*32-64 *32-32];    
dut_yjp65     =    dut_column[`MATRIX_WIDTH*32-65 *32-1:`MATRIX_WIDTH*32-65 *32-32];    
dut_yjp66     =    dut_column[`MATRIX_WIDTH*32-66 *32-1:`MATRIX_WIDTH*32-66 *32-32];    
dut_yjp67     =    dut_column[`MATRIX_WIDTH*32-67 *32-1:`MATRIX_WIDTH*32-67 *32-32];    
dut_yjp68     =    dut_column[`MATRIX_WIDTH*32-68 *32-1:`MATRIX_WIDTH*32-68 *32-32];    
dut_yjp69     =    dut_column[`MATRIX_WIDTH*32-69 *32-1:`MATRIX_WIDTH*32-69 *32-32];    
dut_yjp70     =    dut_column[`MATRIX_WIDTH*32-70 *32-1:`MATRIX_WIDTH*32-70 *32-32];    
dut_yjp71     =    dut_column[`MATRIX_WIDTH*32-71 *32-1:`MATRIX_WIDTH*32-71 *32-32];    
dut_yjp72     =    dut_column[`MATRIX_WIDTH*32-72 *32-1:`MATRIX_WIDTH*32-72 *32-32];    
dut_yjp73     =    dut_column[`MATRIX_WIDTH*32-73 *32-1:`MATRIX_WIDTH*32-73 *32-32];    
dut_yjp74     =    dut_column[`MATRIX_WIDTH*32-74 *32-1:`MATRIX_WIDTH*32-74 *32-32];    
dut_yjp75     =    dut_column[`MATRIX_WIDTH*32-75 *32-1:`MATRIX_WIDTH*32-75 *32-32];    
dut_yjp76     =    dut_column[`MATRIX_WIDTH*32-76 *32-1:`MATRIX_WIDTH*32-76 *32-32];    
dut_yjp77     =    dut_column[`MATRIX_WIDTH*32-77 *32-1:`MATRIX_WIDTH*32-77 *32-32];    
dut_yjp78     =    dut_column[`MATRIX_WIDTH*32-78 *32-1:`MATRIX_WIDTH*32-78 *32-32];    
dut_yjp79     =    dut_column[`MATRIX_WIDTH*32-79 *32-1:`MATRIX_WIDTH*32-79 *32-32];    
dut_yjp80     =    dut_column[`MATRIX_WIDTH*32-80 *32-1:`MATRIX_WIDTH*32-80 *32-32];    
dut_yjp81     =    dut_column[`MATRIX_WIDTH*32-81 *32-1:`MATRIX_WIDTH*32-81 *32-32];    
dut_yjp82     =    dut_column[`MATRIX_WIDTH*32-82 *32-1:`MATRIX_WIDTH*32-82 *32-32];    
dut_yjp83     =    dut_column[`MATRIX_WIDTH*32-83 *32-1:`MATRIX_WIDTH*32-83 *32-32];    
dut_yjp84     =    dut_column[`MATRIX_WIDTH*32-84 *32-1:`MATRIX_WIDTH*32-84 *32-32];    
dut_yjp85     =    dut_column[`MATRIX_WIDTH*32-85 *32-1:`MATRIX_WIDTH*32-85 *32-32];    
dut_yjp86     =    dut_column[`MATRIX_WIDTH*32-86 *32-1:`MATRIX_WIDTH*32-86 *32-32];    
dut_yjp87     =    dut_column[`MATRIX_WIDTH*32-87 *32-1:`MATRIX_WIDTH*32-87 *32-32];    
dut_yjp88     =    dut_column[`MATRIX_WIDTH*32-88 *32-1:`MATRIX_WIDTH*32-88 *32-32];    
dut_yjp89     =    dut_column[`MATRIX_WIDTH*32-89 *32-1:`MATRIX_WIDTH*32-89 *32-32];    
dut_yjp90     =    dut_column[`MATRIX_WIDTH*32-90 *32-1:`MATRIX_WIDTH*32-90 *32-32];    
dut_yjp91     =    dut_column[`MATRIX_WIDTH*32-91 *32-1:`MATRIX_WIDTH*32-91 *32-32];    
dut_yjp92     =    dut_column[`MATRIX_WIDTH*32-92 *32-1:`MATRIX_WIDTH*32-92 *32-32];    
dut_yjp93     =    dut_column[`MATRIX_WIDTH*32-93 *32-1:`MATRIX_WIDTH*32-93 *32-32];    
dut_yjp94     =    dut_column[`MATRIX_WIDTH*32-94 *32-1:`MATRIX_WIDTH*32-94 *32-32];    
dut_yjp95     =    dut_column[`MATRIX_WIDTH*32-95 *32-1:`MATRIX_WIDTH*32-95 *32-32];    
dut_yjp96     =    dut_column[`MATRIX_WIDTH*32-96 *32-1:`MATRIX_WIDTH*32-96 *32-32];    
dut_yjp97     =    dut_column[`MATRIX_WIDTH*32-97 *32-1:`MATRIX_WIDTH*32-97 *32-32];    
dut_yjp98     =    dut_column[`MATRIX_WIDTH*32-98 *32-1:`MATRIX_WIDTH*32-98 *32-32];    
dut_yjp99     =    dut_column[`MATRIX_WIDTH*32-99 *32-1:`MATRIX_WIDTH*32-99 *32-32];    
dut_yjp100    =    dut_column[`MATRIX_WIDTH*32-100*32-1:`MATRIX_WIDTH*32-100*32-32];    
dut_yjp101    =    dut_column[`MATRIX_WIDTH*32-101*32-1:`MATRIX_WIDTH*32-101*32-32];    
dut_yjp102    =    dut_column[`MATRIX_WIDTH*32-102*32-1:`MATRIX_WIDTH*32-102*32-32];    
dut_yjp103    =    dut_column[`MATRIX_WIDTH*32-103*32-1:`MATRIX_WIDTH*32-103*32-32];    
dut_yjp104    =    dut_column[`MATRIX_WIDTH*32-104*32-1:`MATRIX_WIDTH*32-104*32-32];    
dut_yjp105    =    dut_column[`MATRIX_WIDTH*32-105*32-1:`MATRIX_WIDTH*32-105*32-32];    
dut_yjp106    =    dut_column[`MATRIX_WIDTH*32-106*32-1:`MATRIX_WIDTH*32-106*32-32];    
dut_yjp107    =    dut_column[`MATRIX_WIDTH*32-107*32-1:`MATRIX_WIDTH*32-107*32-32];    
dut_yjp108    =    dut_column[`MATRIX_WIDTH*32-108*32-1:`MATRIX_WIDTH*32-108*32-32];    
dut_yjp109    =    dut_column[`MATRIX_WIDTH*32-109*32-1:`MATRIX_WIDTH*32-109*32-32];    
dut_yjp110    =    dut_column[`MATRIX_WIDTH*32-110*32-1:`MATRIX_WIDTH*32-110*32-32];    
dut_yjp111    =    dut_column[`MATRIX_WIDTH*32-111*32-1:`MATRIX_WIDTH*32-111*32-32];    
dut_yjp112    =    dut_column[`MATRIX_WIDTH*32-112*32-1:`MATRIX_WIDTH*32-112*32-32];    
dut_yjp113    =    dut_column[`MATRIX_WIDTH*32-113*32-1:`MATRIX_WIDTH*32-113*32-32];    
dut_yjp114    =    dut_column[`MATRIX_WIDTH*32-114*32-1:`MATRIX_WIDTH*32-114*32-32];    
dut_yjp115    =    dut_column[`MATRIX_WIDTH*32-115*32-1:`MATRIX_WIDTH*32-115*32-32];    
dut_yjp116    =    dut_column[`MATRIX_WIDTH*32-116*32-1:`MATRIX_WIDTH*32-116*32-32];    
dut_yjp117    =    dut_column[`MATRIX_WIDTH*32-117*32-1:`MATRIX_WIDTH*32-117*32-32];    
dut_yjp118    =    dut_column[`MATRIX_WIDTH*32-118*32-1:`MATRIX_WIDTH*32-118*32-32];    
dut_yjp119    =    dut_column[`MATRIX_WIDTH*32-119*32-1:`MATRIX_WIDTH*32-119*32-32];    
dut_yjp120    =    dut_column[`MATRIX_WIDTH*32-120*32-1:`MATRIX_WIDTH*32-120*32-32];    
dut_yjp121    =    dut_column[`MATRIX_WIDTH*32-121*32-1:`MATRIX_WIDTH*32-121*32-32];    
dut_yjp122    =    dut_column[`MATRIX_WIDTH*32-122*32-1:`MATRIX_WIDTH*32-122*32-32];    
dut_yjp123    =    dut_column[`MATRIX_WIDTH*32-123*32-1:`MATRIX_WIDTH*32-123*32-32];    
dut_yjp124    =    dut_column[`MATRIX_WIDTH*32-124*32-1:`MATRIX_WIDTH*32-124*32-32];    
dut_yjp125    =    dut_column[`MATRIX_WIDTH*32-125*32-1:`MATRIX_WIDTH*32-125*32-32];    
dut_yjp126    =    dut_column[`MATRIX_WIDTH*32-126*32-1:`MATRIX_WIDTH*32-126*32-32];    
dut_yjp127    =    dut_column[`MATRIX_WIDTH*32-127*32-1:`MATRIX_WIDTH*32-127*32-32];    
`endif // ST_WIDTH_INF_256        
`ifdef ST_WIDTH_INF_16        
if(ieee754_to_fp(golden_yjp0  )<0) begin golden_real_yjp0  =-ieee754_to_fp(golden_yjp0   ); end else begin golden_real_yjp0   =ieee754_to_fp(golden_yjp0   ); end     
if(ieee754_to_fp(golden_yjp1  )<0) begin golden_real_yjp1  =-ieee754_to_fp(golden_yjp1   ); end else begin golden_real_yjp1   =ieee754_to_fp(golden_yjp1   ); end     
if(ieee754_to_fp(golden_yjp2  )<0) begin golden_real_yjp2  =-ieee754_to_fp(golden_yjp2   ); end else begin golden_real_yjp2   =ieee754_to_fp(golden_yjp2   ); end     
if(ieee754_to_fp(golden_yjp3  )<0) begin golden_real_yjp3  =-ieee754_to_fp(golden_yjp3   ); end else begin golden_real_yjp3   =ieee754_to_fp(golden_yjp3   ); end     
if(ieee754_to_fp(golden_yjp4  )<0) begin golden_real_yjp4  =-ieee754_to_fp(golden_yjp4   ); end else begin golden_real_yjp4   =ieee754_to_fp(golden_yjp4   ); end     
if(ieee754_to_fp(golden_yjp5  )<0) begin golden_real_yjp5  =-ieee754_to_fp(golden_yjp5   ); end else begin golden_real_yjp5   =ieee754_to_fp(golden_yjp5   ); end     
if(ieee754_to_fp(golden_yjp6  )<0) begin golden_real_yjp6  =-ieee754_to_fp(golden_yjp6   ); end else begin golden_real_yjp6   =ieee754_to_fp(golden_yjp6   ); end     
if(ieee754_to_fp(golden_yjp7  )<0) begin golden_real_yjp7  =-ieee754_to_fp(golden_yjp7   ); end else begin golden_real_yjp7   =ieee754_to_fp(golden_yjp7   ); end     
`endif // ST_WIDTH_INF_16                                                                                                                                             
`ifdef ST_WIDTH_INF_32                                                                                                                                                
if(ieee754_to_fp(golden_yjp8  )<0) begin golden_real_yjp8  =-ieee754_to_fp(golden_yjp8   ); end else begin golden_real_yjp8   =ieee754_to_fp(golden_yjp8   ); end     
if(ieee754_to_fp(golden_yjp9  )<0) begin golden_real_yjp9  =-ieee754_to_fp(golden_yjp9   ); end else begin golden_real_yjp9   =ieee754_to_fp(golden_yjp9   ); end     
if(ieee754_to_fp(golden_yjp10 )<0) begin golden_real_yjp10 =-ieee754_to_fp(golden_yjp10  ); end else begin golden_real_yjp10  =ieee754_to_fp(golden_yjp10  ); end     
if(ieee754_to_fp(golden_yjp11 )<0) begin golden_real_yjp11 =-ieee754_to_fp(golden_yjp11  ); end else begin golden_real_yjp11  =ieee754_to_fp(golden_yjp11  ); end     
if(ieee754_to_fp(golden_yjp12 )<0) begin golden_real_yjp12 =-ieee754_to_fp(golden_yjp12  ); end else begin golden_real_yjp12  =ieee754_to_fp(golden_yjp12  ); end     
if(ieee754_to_fp(golden_yjp13 )<0) begin golden_real_yjp13 =-ieee754_to_fp(golden_yjp13  ); end else begin golden_real_yjp13  =ieee754_to_fp(golden_yjp13  ); end     
if(ieee754_to_fp(golden_yjp14 )<0) begin golden_real_yjp14 =-ieee754_to_fp(golden_yjp14  ); end else begin golden_real_yjp14  =ieee754_to_fp(golden_yjp14  ); end     
if(ieee754_to_fp(golden_yjp15 )<0) begin golden_real_yjp15 =-ieee754_to_fp(golden_yjp15  ); end else begin golden_real_yjp15  =ieee754_to_fp(golden_yjp15  ); end     
`endif // ST_WIDTH_INF_32                                                                                                                                          
`ifdef ST_WIDTH_INF_64                                                                                                                                             
if(ieee754_to_fp(golden_yjp16 )<0) begin golden_real_yjp16 =-ieee754_to_fp(golden_yjp16  ); end else begin golden_real_yjp16  =ieee754_to_fp(golden_yjp16  ); end     
if(ieee754_to_fp(golden_yjp17 )<0) begin golden_real_yjp17 =-ieee754_to_fp(golden_yjp17  ); end else begin golden_real_yjp17  =ieee754_to_fp(golden_yjp17  ); end     
if(ieee754_to_fp(golden_yjp18 )<0) begin golden_real_yjp18 =-ieee754_to_fp(golden_yjp18  ); end else begin golden_real_yjp18  =ieee754_to_fp(golden_yjp18  ); end     
if(ieee754_to_fp(golden_yjp19 )<0) begin golden_real_yjp19 =-ieee754_to_fp(golden_yjp19  ); end else begin golden_real_yjp19  =ieee754_to_fp(golden_yjp19  ); end     
if(ieee754_to_fp(golden_yjp20 )<0) begin golden_real_yjp20 =-ieee754_to_fp(golden_yjp20  ); end else begin golden_real_yjp20  =ieee754_to_fp(golden_yjp20  ); end     
if(ieee754_to_fp(golden_yjp21 )<0) begin golden_real_yjp21 =-ieee754_to_fp(golden_yjp21  ); end else begin golden_real_yjp21  =ieee754_to_fp(golden_yjp21  ); end     
if(ieee754_to_fp(golden_yjp22 )<0) begin golden_real_yjp22 =-ieee754_to_fp(golden_yjp22  ); end else begin golden_real_yjp22  =ieee754_to_fp(golden_yjp22  ); end     
if(ieee754_to_fp(golden_yjp23 )<0) begin golden_real_yjp23 =-ieee754_to_fp(golden_yjp23  ); end else begin golden_real_yjp23  =ieee754_to_fp(golden_yjp23  ); end     
if(ieee754_to_fp(golden_yjp24 )<0) begin golden_real_yjp24 =-ieee754_to_fp(golden_yjp24  ); end else begin golden_real_yjp24  =ieee754_to_fp(golden_yjp24  ); end     
if(ieee754_to_fp(golden_yjp25 )<0) begin golden_real_yjp25 =-ieee754_to_fp(golden_yjp25  ); end else begin golden_real_yjp25  =ieee754_to_fp(golden_yjp25  ); end     
if(ieee754_to_fp(golden_yjp26 )<0) begin golden_real_yjp26 =-ieee754_to_fp(golden_yjp26  ); end else begin golden_real_yjp26  =ieee754_to_fp(golden_yjp26  ); end     
if(ieee754_to_fp(golden_yjp27 )<0) begin golden_real_yjp27 =-ieee754_to_fp(golden_yjp27  ); end else begin golden_real_yjp27  =ieee754_to_fp(golden_yjp27  ); end     
if(ieee754_to_fp(golden_yjp28 )<0) begin golden_real_yjp28 =-ieee754_to_fp(golden_yjp28  ); end else begin golden_real_yjp28  =ieee754_to_fp(golden_yjp28  ); end     
if(ieee754_to_fp(golden_yjp29 )<0) begin golden_real_yjp29 =-ieee754_to_fp(golden_yjp29  ); end else begin golden_real_yjp29  =ieee754_to_fp(golden_yjp29  ); end     
if(ieee754_to_fp(golden_yjp30 )<0) begin golden_real_yjp30 =-ieee754_to_fp(golden_yjp30  ); end else begin golden_real_yjp30  =ieee754_to_fp(golden_yjp30  ); end     
if(ieee754_to_fp(golden_yjp31 )<0) begin golden_real_yjp31 =-ieee754_to_fp(golden_yjp31  ); end else begin golden_real_yjp31  =ieee754_to_fp(golden_yjp31  ); end     
`endif // ST_WIDTH_INF_64                                                                                                                                          
`ifdef ST_WIDTH_INF_128                                                                                                                                            
if(ieee754_to_fp(golden_yjp32 )<0) begin golden_real_yjp32 =-ieee754_to_fp(golden_yjp32  ); end else begin golden_real_yjp32  =ieee754_to_fp(golden_yjp32  ); end     
if(ieee754_to_fp(golden_yjp33 )<0) begin golden_real_yjp33 =-ieee754_to_fp(golden_yjp33  ); end else begin golden_real_yjp33  =ieee754_to_fp(golden_yjp33  ); end     
if(ieee754_to_fp(golden_yjp34 )<0) begin golden_real_yjp34 =-ieee754_to_fp(golden_yjp34  ); end else begin golden_real_yjp34  =ieee754_to_fp(golden_yjp34  ); end     
if(ieee754_to_fp(golden_yjp35 )<0) begin golden_real_yjp35 =-ieee754_to_fp(golden_yjp35  ); end else begin golden_real_yjp35  =ieee754_to_fp(golden_yjp35  ); end     
if(ieee754_to_fp(golden_yjp36 )<0) begin golden_real_yjp36 =-ieee754_to_fp(golden_yjp36  ); end else begin golden_real_yjp36  =ieee754_to_fp(golden_yjp36  ); end     
if(ieee754_to_fp(golden_yjp37 )<0) begin golden_real_yjp37 =-ieee754_to_fp(golden_yjp37  ); end else begin golden_real_yjp37  =ieee754_to_fp(golden_yjp37  ); end     
if(ieee754_to_fp(golden_yjp38 )<0) begin golden_real_yjp38 =-ieee754_to_fp(golden_yjp38  ); end else begin golden_real_yjp38  =ieee754_to_fp(golden_yjp38  ); end     
if(ieee754_to_fp(golden_yjp39 )<0) begin golden_real_yjp39 =-ieee754_to_fp(golden_yjp39  ); end else begin golden_real_yjp39  =ieee754_to_fp(golden_yjp39  ); end     
if(ieee754_to_fp(golden_yjp40 )<0) begin golden_real_yjp40 =-ieee754_to_fp(golden_yjp40  ); end else begin golden_real_yjp40  =ieee754_to_fp(golden_yjp40  ); end     
if(ieee754_to_fp(golden_yjp41 )<0) begin golden_real_yjp41 =-ieee754_to_fp(golden_yjp41  ); end else begin golden_real_yjp41  =ieee754_to_fp(golden_yjp41  ); end     
if(ieee754_to_fp(golden_yjp42 )<0) begin golden_real_yjp42 =-ieee754_to_fp(golden_yjp42  ); end else begin golden_real_yjp42  =ieee754_to_fp(golden_yjp42  ); end     
if(ieee754_to_fp(golden_yjp43 )<0) begin golden_real_yjp43 =-ieee754_to_fp(golden_yjp43  ); end else begin golden_real_yjp43  =ieee754_to_fp(golden_yjp43  ); end     
if(ieee754_to_fp(golden_yjp44 )<0) begin golden_real_yjp44 =-ieee754_to_fp(golden_yjp44  ); end else begin golden_real_yjp44  =ieee754_to_fp(golden_yjp44  ); end     
if(ieee754_to_fp(golden_yjp45 )<0) begin golden_real_yjp45 =-ieee754_to_fp(golden_yjp45  ); end else begin golden_real_yjp45  =ieee754_to_fp(golden_yjp45  ); end     
if(ieee754_to_fp(golden_yjp46 )<0) begin golden_real_yjp46 =-ieee754_to_fp(golden_yjp46  ); end else begin golden_real_yjp46  =ieee754_to_fp(golden_yjp46  ); end     
if(ieee754_to_fp(golden_yjp47 )<0) begin golden_real_yjp47 =-ieee754_to_fp(golden_yjp47  ); end else begin golden_real_yjp47  =ieee754_to_fp(golden_yjp47  ); end     
if(ieee754_to_fp(golden_yjp48 )<0) begin golden_real_yjp48 =-ieee754_to_fp(golden_yjp48  ); end else begin golden_real_yjp48  =ieee754_to_fp(golden_yjp48  ); end     
if(ieee754_to_fp(golden_yjp49 )<0) begin golden_real_yjp49 =-ieee754_to_fp(golden_yjp49  ); end else begin golden_real_yjp49  =ieee754_to_fp(golden_yjp49  ); end     
if(ieee754_to_fp(golden_yjp50 )<0) begin golden_real_yjp50 =-ieee754_to_fp(golden_yjp50  ); end else begin golden_real_yjp50  =ieee754_to_fp(golden_yjp50  ); end     
if(ieee754_to_fp(golden_yjp51 )<0) begin golden_real_yjp51 =-ieee754_to_fp(golden_yjp51  ); end else begin golden_real_yjp51  =ieee754_to_fp(golden_yjp51  ); end     
if(ieee754_to_fp(golden_yjp52 )<0) begin golden_real_yjp52 =-ieee754_to_fp(golden_yjp52  ); end else begin golden_real_yjp52  =ieee754_to_fp(golden_yjp52  ); end     
if(ieee754_to_fp(golden_yjp53 )<0) begin golden_real_yjp53 =-ieee754_to_fp(golden_yjp53  ); end else begin golden_real_yjp53  =ieee754_to_fp(golden_yjp53  ); end     
if(ieee754_to_fp(golden_yjp54 )<0) begin golden_real_yjp54 =-ieee754_to_fp(golden_yjp54  ); end else begin golden_real_yjp54  =ieee754_to_fp(golden_yjp54  ); end     
if(ieee754_to_fp(golden_yjp55 )<0) begin golden_real_yjp55 =-ieee754_to_fp(golden_yjp55  ); end else begin golden_real_yjp55  =ieee754_to_fp(golden_yjp55  ); end     
if(ieee754_to_fp(golden_yjp56 )<0) begin golden_real_yjp56 =-ieee754_to_fp(golden_yjp56  ); end else begin golden_real_yjp56  =ieee754_to_fp(golden_yjp56  ); end     
if(ieee754_to_fp(golden_yjp57 )<0) begin golden_real_yjp57 =-ieee754_to_fp(golden_yjp57  ); end else begin golden_real_yjp57  =ieee754_to_fp(golden_yjp57  ); end     
if(ieee754_to_fp(golden_yjp58 )<0) begin golden_real_yjp58 =-ieee754_to_fp(golden_yjp58  ); end else begin golden_real_yjp58  =ieee754_to_fp(golden_yjp58  ); end     
if(ieee754_to_fp(golden_yjp59 )<0) begin golden_real_yjp59 =-ieee754_to_fp(golden_yjp59  ); end else begin golden_real_yjp59  =ieee754_to_fp(golden_yjp59  ); end     
if(ieee754_to_fp(golden_yjp60 )<0) begin golden_real_yjp60 =-ieee754_to_fp(golden_yjp60  ); end else begin golden_real_yjp60  =ieee754_to_fp(golden_yjp60  ); end     
if(ieee754_to_fp(golden_yjp61 )<0) begin golden_real_yjp61 =-ieee754_to_fp(golden_yjp61  ); end else begin golden_real_yjp61  =ieee754_to_fp(golden_yjp61  ); end     
if(ieee754_to_fp(golden_yjp62 )<0) begin golden_real_yjp62 =-ieee754_to_fp(golden_yjp62  ); end else begin golden_real_yjp62  =ieee754_to_fp(golden_yjp62  ); end     
if(ieee754_to_fp(golden_yjp63 )<0) begin golden_real_yjp63 =-ieee754_to_fp(golden_yjp63  ); end else begin golden_real_yjp63  =ieee754_to_fp(golden_yjp63  ); end     
`endif // ST_WIDTH_INF_128                                                                                                                                         
`ifdef ST_WIDTH_INF_256                                                                                                                                            
if(ieee754_to_fp(golden_yjp64 )<0) begin golden_real_yjp64 =-ieee754_to_fp(golden_yjp64  ); end else begin golden_real_yjp64  =ieee754_to_fp(golden_yjp64  ); end     
if(ieee754_to_fp(golden_yjp65 )<0) begin golden_real_yjp65 =-ieee754_to_fp(golden_yjp65  ); end else begin golden_real_yjp65  =ieee754_to_fp(golden_yjp65  ); end     
if(ieee754_to_fp(golden_yjp66 )<0) begin golden_real_yjp66 =-ieee754_to_fp(golden_yjp66  ); end else begin golden_real_yjp66  =ieee754_to_fp(golden_yjp66  ); end     
if(ieee754_to_fp(golden_yjp67 )<0) begin golden_real_yjp67 =-ieee754_to_fp(golden_yjp67  ); end else begin golden_real_yjp67  =ieee754_to_fp(golden_yjp67  ); end     
if(ieee754_to_fp(golden_yjp68 )<0) begin golden_real_yjp68 =-ieee754_to_fp(golden_yjp68  ); end else begin golden_real_yjp68  =ieee754_to_fp(golden_yjp68  ); end     
if(ieee754_to_fp(golden_yjp69 )<0) begin golden_real_yjp69 =-ieee754_to_fp(golden_yjp69  ); end else begin golden_real_yjp69  =ieee754_to_fp(golden_yjp69  ); end     
if(ieee754_to_fp(golden_yjp70 )<0) begin golden_real_yjp70 =-ieee754_to_fp(golden_yjp70  ); end else begin golden_real_yjp70  =ieee754_to_fp(golden_yjp70  ); end     
if(ieee754_to_fp(golden_yjp71 )<0) begin golden_real_yjp71 =-ieee754_to_fp(golden_yjp71  ); end else begin golden_real_yjp71  =ieee754_to_fp(golden_yjp71  ); end     
if(ieee754_to_fp(golden_yjp72 )<0) begin golden_real_yjp72 =-ieee754_to_fp(golden_yjp72  ); end else begin golden_real_yjp72  =ieee754_to_fp(golden_yjp72  ); end     
if(ieee754_to_fp(golden_yjp73 )<0) begin golden_real_yjp73 =-ieee754_to_fp(golden_yjp73  ); end else begin golden_real_yjp73  =ieee754_to_fp(golden_yjp73  ); end     
if(ieee754_to_fp(golden_yjp74 )<0) begin golden_real_yjp74 =-ieee754_to_fp(golden_yjp74  ); end else begin golden_real_yjp74  =ieee754_to_fp(golden_yjp74  ); end     
if(ieee754_to_fp(golden_yjp75 )<0) begin golden_real_yjp75 =-ieee754_to_fp(golden_yjp75  ); end else begin golden_real_yjp75  =ieee754_to_fp(golden_yjp75  ); end     
if(ieee754_to_fp(golden_yjp76 )<0) begin golden_real_yjp76 =-ieee754_to_fp(golden_yjp76  ); end else begin golden_real_yjp76  =ieee754_to_fp(golden_yjp76  ); end     
if(ieee754_to_fp(golden_yjp77 )<0) begin golden_real_yjp77 =-ieee754_to_fp(golden_yjp77  ); end else begin golden_real_yjp77  =ieee754_to_fp(golden_yjp77  ); end     
if(ieee754_to_fp(golden_yjp78 )<0) begin golden_real_yjp78 =-ieee754_to_fp(golden_yjp78  ); end else begin golden_real_yjp78  =ieee754_to_fp(golden_yjp78  ); end     
if(ieee754_to_fp(golden_yjp79 )<0) begin golden_real_yjp79 =-ieee754_to_fp(golden_yjp79  ); end else begin golden_real_yjp79  =ieee754_to_fp(golden_yjp79  ); end     
if(ieee754_to_fp(golden_yjp80 )<0) begin golden_real_yjp80 =-ieee754_to_fp(golden_yjp80  ); end else begin golden_real_yjp80  =ieee754_to_fp(golden_yjp80  ); end     
if(ieee754_to_fp(golden_yjp81 )<0) begin golden_real_yjp81 =-ieee754_to_fp(golden_yjp81  ); end else begin golden_real_yjp81  =ieee754_to_fp(golden_yjp81  ); end     
if(ieee754_to_fp(golden_yjp82 )<0) begin golden_real_yjp82 =-ieee754_to_fp(golden_yjp82  ); end else begin golden_real_yjp82  =ieee754_to_fp(golden_yjp82  ); end     
if(ieee754_to_fp(golden_yjp83 )<0) begin golden_real_yjp83 =-ieee754_to_fp(golden_yjp83  ); end else begin golden_real_yjp83  =ieee754_to_fp(golden_yjp83  ); end     
if(ieee754_to_fp(golden_yjp84 )<0) begin golden_real_yjp84 =-ieee754_to_fp(golden_yjp84  ); end else begin golden_real_yjp84  =ieee754_to_fp(golden_yjp84  ); end     
if(ieee754_to_fp(golden_yjp85 )<0) begin golden_real_yjp85 =-ieee754_to_fp(golden_yjp85  ); end else begin golden_real_yjp85  =ieee754_to_fp(golden_yjp85  ); end     
if(ieee754_to_fp(golden_yjp86 )<0) begin golden_real_yjp86 =-ieee754_to_fp(golden_yjp86  ); end else begin golden_real_yjp86  =ieee754_to_fp(golden_yjp86  ); end     
if(ieee754_to_fp(golden_yjp87 )<0) begin golden_real_yjp87 =-ieee754_to_fp(golden_yjp87  ); end else begin golden_real_yjp87  =ieee754_to_fp(golden_yjp87  ); end     
if(ieee754_to_fp(golden_yjp88 )<0) begin golden_real_yjp88 =-ieee754_to_fp(golden_yjp88  ); end else begin golden_real_yjp88  =ieee754_to_fp(golden_yjp88  ); end     
if(ieee754_to_fp(golden_yjp89 )<0) begin golden_real_yjp89 =-ieee754_to_fp(golden_yjp89  ); end else begin golden_real_yjp89  =ieee754_to_fp(golden_yjp89  ); end     
if(ieee754_to_fp(golden_yjp90 )<0) begin golden_real_yjp90 =-ieee754_to_fp(golden_yjp90  ); end else begin golden_real_yjp90  =ieee754_to_fp(golden_yjp90  ); end     
if(ieee754_to_fp(golden_yjp91 )<0) begin golden_real_yjp91 =-ieee754_to_fp(golden_yjp91  ); end else begin golden_real_yjp91  =ieee754_to_fp(golden_yjp91  ); end     
if(ieee754_to_fp(golden_yjp92 )<0) begin golden_real_yjp92 =-ieee754_to_fp(golden_yjp92  ); end else begin golden_real_yjp92  =ieee754_to_fp(golden_yjp92  ); end     
if(ieee754_to_fp(golden_yjp93 )<0) begin golden_real_yjp93 =-ieee754_to_fp(golden_yjp93  ); end else begin golden_real_yjp93  =ieee754_to_fp(golden_yjp93  ); end     
if(ieee754_to_fp(golden_yjp94 )<0) begin golden_real_yjp94 =-ieee754_to_fp(golden_yjp94  ); end else begin golden_real_yjp94  =ieee754_to_fp(golden_yjp94  ); end     
if(ieee754_to_fp(golden_yjp95 )<0) begin golden_real_yjp95 =-ieee754_to_fp(golden_yjp95  ); end else begin golden_real_yjp95  =ieee754_to_fp(golden_yjp95  ); end     
if(ieee754_to_fp(golden_yjp96 )<0) begin golden_real_yjp96 =-ieee754_to_fp(golden_yjp96  ); end else begin golden_real_yjp96  =ieee754_to_fp(golden_yjp96  ); end     
if(ieee754_to_fp(golden_yjp97 )<0) begin golden_real_yjp97 =-ieee754_to_fp(golden_yjp97  ); end else begin golden_real_yjp97  =ieee754_to_fp(golden_yjp97  ); end     
if(ieee754_to_fp(golden_yjp98 )<0) begin golden_real_yjp98 =-ieee754_to_fp(golden_yjp98  ); end else begin golden_real_yjp98  =ieee754_to_fp(golden_yjp98  ); end     
if(ieee754_to_fp(golden_yjp99 )<0) begin golden_real_yjp99 =-ieee754_to_fp(golden_yjp99  ); end else begin golden_real_yjp99  =ieee754_to_fp(golden_yjp99  ); end     
if(ieee754_to_fp(golden_yjp100)<0) begin golden_real_yjp100=-ieee754_to_fp(golden_yjp100 ); end else begin golden_real_yjp100 =ieee754_to_fp(golden_yjp100 ); end     
if(ieee754_to_fp(golden_yjp101)<0) begin golden_real_yjp101=-ieee754_to_fp(golden_yjp101 ); end else begin golden_real_yjp101 =ieee754_to_fp(golden_yjp101 ); end     
if(ieee754_to_fp(golden_yjp102)<0) begin golden_real_yjp102=-ieee754_to_fp(golden_yjp102 ); end else begin golden_real_yjp102 =ieee754_to_fp(golden_yjp102 ); end     
if(ieee754_to_fp(golden_yjp103)<0) begin golden_real_yjp103=-ieee754_to_fp(golden_yjp103 ); end else begin golden_real_yjp103 =ieee754_to_fp(golden_yjp103 ); end     
if(ieee754_to_fp(golden_yjp104)<0) begin golden_real_yjp104=-ieee754_to_fp(golden_yjp104 ); end else begin golden_real_yjp104 =ieee754_to_fp(golden_yjp104 ); end     
if(ieee754_to_fp(golden_yjp105)<0) begin golden_real_yjp105=-ieee754_to_fp(golden_yjp105 ); end else begin golden_real_yjp105 =ieee754_to_fp(golden_yjp105 ); end     
if(ieee754_to_fp(golden_yjp106)<0) begin golden_real_yjp106=-ieee754_to_fp(golden_yjp106 ); end else begin golden_real_yjp106 =ieee754_to_fp(golden_yjp106 ); end     
if(ieee754_to_fp(golden_yjp107)<0) begin golden_real_yjp107=-ieee754_to_fp(golden_yjp107 ); end else begin golden_real_yjp107 =ieee754_to_fp(golden_yjp107 ); end     
if(ieee754_to_fp(golden_yjp108)<0) begin golden_real_yjp108=-ieee754_to_fp(golden_yjp108 ); end else begin golden_real_yjp108 =ieee754_to_fp(golden_yjp108 ); end     
if(ieee754_to_fp(golden_yjp109)<0) begin golden_real_yjp109=-ieee754_to_fp(golden_yjp109 ); end else begin golden_real_yjp109 =ieee754_to_fp(golden_yjp109 ); end     
if(ieee754_to_fp(golden_yjp110)<0) begin golden_real_yjp110=-ieee754_to_fp(golden_yjp110 ); end else begin golden_real_yjp110 =ieee754_to_fp(golden_yjp110 ); end     
if(ieee754_to_fp(golden_yjp111)<0) begin golden_real_yjp111=-ieee754_to_fp(golden_yjp111 ); end else begin golden_real_yjp111 =ieee754_to_fp(golden_yjp111 ); end     
if(ieee754_to_fp(golden_yjp112)<0) begin golden_real_yjp112=-ieee754_to_fp(golden_yjp112 ); end else begin golden_real_yjp112 =ieee754_to_fp(golden_yjp112 ); end     
if(ieee754_to_fp(golden_yjp113)<0) begin golden_real_yjp113=-ieee754_to_fp(golden_yjp113 ); end else begin golden_real_yjp113 =ieee754_to_fp(golden_yjp113 ); end     
if(ieee754_to_fp(golden_yjp114)<0) begin golden_real_yjp114=-ieee754_to_fp(golden_yjp114 ); end else begin golden_real_yjp114 =ieee754_to_fp(golden_yjp114 ); end     
if(ieee754_to_fp(golden_yjp115)<0) begin golden_real_yjp115=-ieee754_to_fp(golden_yjp115 ); end else begin golden_real_yjp115 =ieee754_to_fp(golden_yjp115 ); end     
if(ieee754_to_fp(golden_yjp116)<0) begin golden_real_yjp116=-ieee754_to_fp(golden_yjp116 ); end else begin golden_real_yjp116 =ieee754_to_fp(golden_yjp116 ); end     
if(ieee754_to_fp(golden_yjp117)<0) begin golden_real_yjp117=-ieee754_to_fp(golden_yjp117 ); end else begin golden_real_yjp117 =ieee754_to_fp(golden_yjp117 ); end     
if(ieee754_to_fp(golden_yjp118)<0) begin golden_real_yjp118=-ieee754_to_fp(golden_yjp118 ); end else begin golden_real_yjp118 =ieee754_to_fp(golden_yjp118 ); end     
if(ieee754_to_fp(golden_yjp119)<0) begin golden_real_yjp119=-ieee754_to_fp(golden_yjp119 ); end else begin golden_real_yjp119 =ieee754_to_fp(golden_yjp119 ); end     
if(ieee754_to_fp(golden_yjp120)<0) begin golden_real_yjp120=-ieee754_to_fp(golden_yjp120 ); end else begin golden_real_yjp120 =ieee754_to_fp(golden_yjp120 ); end     
if(ieee754_to_fp(golden_yjp121)<0) begin golden_real_yjp121=-ieee754_to_fp(golden_yjp121 ); end else begin golden_real_yjp121 =ieee754_to_fp(golden_yjp121 ); end     
if(ieee754_to_fp(golden_yjp122)<0) begin golden_real_yjp122=-ieee754_to_fp(golden_yjp122 ); end else begin golden_real_yjp122 =ieee754_to_fp(golden_yjp122 ); end     
if(ieee754_to_fp(golden_yjp123)<0) begin golden_real_yjp123=-ieee754_to_fp(golden_yjp123 ); end else begin golden_real_yjp123 =ieee754_to_fp(golden_yjp123 ); end     
if(ieee754_to_fp(golden_yjp124)<0) begin golden_real_yjp124=-ieee754_to_fp(golden_yjp124 ); end else begin golden_real_yjp124 =ieee754_to_fp(golden_yjp124 ); end     
if(ieee754_to_fp(golden_yjp125)<0) begin golden_real_yjp125=-ieee754_to_fp(golden_yjp125 ); end else begin golden_real_yjp125 =ieee754_to_fp(golden_yjp125 ); end     
if(ieee754_to_fp(golden_yjp126)<0) begin golden_real_yjp126=-ieee754_to_fp(golden_yjp126 ); end else begin golden_real_yjp126 =ieee754_to_fp(golden_yjp126 ); end     
if(ieee754_to_fp(golden_yjp127)<0) begin golden_real_yjp127=-ieee754_to_fp(golden_yjp127 ); end else begin golden_real_yjp127 =ieee754_to_fp(golden_yjp127 ); end     
`endif // ST_WIDTH_INF_256        
`ifdef ST_WIDTH_INF_16        
if(ieee754_to_fp(dut_yjp0  )<0) begin dut_real_yjp0  =-ieee754_to_fp(dut_yjp0   ); end else begin dut_real_yjp0   =ieee754_to_fp(dut_yjp0   ); end     
if(ieee754_to_fp(dut_yjp1  )<0) begin dut_real_yjp1  =-ieee754_to_fp(dut_yjp1   ); end else begin dut_real_yjp1   =ieee754_to_fp(dut_yjp1   ); end     
if(ieee754_to_fp(dut_yjp2  )<0) begin dut_real_yjp2  =-ieee754_to_fp(dut_yjp2   ); end else begin dut_real_yjp2   =ieee754_to_fp(dut_yjp2   ); end     
if(ieee754_to_fp(dut_yjp3  )<0) begin dut_real_yjp3  =-ieee754_to_fp(dut_yjp3   ); end else begin dut_real_yjp3   =ieee754_to_fp(dut_yjp3   ); end     
if(ieee754_to_fp(dut_yjp4  )<0) begin dut_real_yjp4  =-ieee754_to_fp(dut_yjp4   ); end else begin dut_real_yjp4   =ieee754_to_fp(dut_yjp4   ); end     
if(ieee754_to_fp(dut_yjp5  )<0) begin dut_real_yjp5  =-ieee754_to_fp(dut_yjp5   ); end else begin dut_real_yjp5   =ieee754_to_fp(dut_yjp5   ); end     
if(ieee754_to_fp(dut_yjp6  )<0) begin dut_real_yjp6  =-ieee754_to_fp(dut_yjp6   ); end else begin dut_real_yjp6   =ieee754_to_fp(dut_yjp6   ); end     
if(ieee754_to_fp(dut_yjp7  )<0) begin dut_real_yjp7  =-ieee754_to_fp(dut_yjp7   ); end else begin dut_real_yjp7   =ieee754_to_fp(dut_yjp7   ); end     
`endif // ST_WIDTH_INF_16                                                                                                                                             
`ifdef ST_WIDTH_INF_32                                                                                                                                                
if(ieee754_to_fp(dut_yjp8  )<0) begin dut_real_yjp8  =-ieee754_to_fp(dut_yjp8   ); end else begin dut_real_yjp8   =ieee754_to_fp(dut_yjp8   ); end     
if(ieee754_to_fp(dut_yjp9  )<0) begin dut_real_yjp9  =-ieee754_to_fp(dut_yjp9   ); end else begin dut_real_yjp9   =ieee754_to_fp(dut_yjp9   ); end     
if(ieee754_to_fp(dut_yjp10 )<0) begin dut_real_yjp10 =-ieee754_to_fp(dut_yjp10  ); end else begin dut_real_yjp10  =ieee754_to_fp(dut_yjp10  ); end     
if(ieee754_to_fp(dut_yjp11 )<0) begin dut_real_yjp11 =-ieee754_to_fp(dut_yjp11  ); end else begin dut_real_yjp11  =ieee754_to_fp(dut_yjp11  ); end     
if(ieee754_to_fp(dut_yjp12 )<0) begin dut_real_yjp12 =-ieee754_to_fp(dut_yjp12  ); end else begin dut_real_yjp12  =ieee754_to_fp(dut_yjp12  ); end     
if(ieee754_to_fp(dut_yjp13 )<0) begin dut_real_yjp13 =-ieee754_to_fp(dut_yjp13  ); end else begin dut_real_yjp13  =ieee754_to_fp(dut_yjp13  ); end     
if(ieee754_to_fp(dut_yjp14 )<0) begin dut_real_yjp14 =-ieee754_to_fp(dut_yjp14  ); end else begin dut_real_yjp14  =ieee754_to_fp(dut_yjp14  ); end     
if(ieee754_to_fp(dut_yjp15 )<0) begin dut_real_yjp15 =-ieee754_to_fp(dut_yjp15  ); end else begin dut_real_yjp15  =ieee754_to_fp(dut_yjp15  ); end     
`endif // ST_WIDTH_INF_32                                                                                                                                          
`ifdef ST_WIDTH_INF_64                                                                                                                                             
if(ieee754_to_fp(dut_yjp16 )<0) begin dut_real_yjp16 =-ieee754_to_fp(dut_yjp16  ); end else begin dut_real_yjp16  =ieee754_to_fp(dut_yjp16  ); end     
if(ieee754_to_fp(dut_yjp17 )<0) begin dut_real_yjp17 =-ieee754_to_fp(dut_yjp17  ); end else begin dut_real_yjp17  =ieee754_to_fp(dut_yjp17  ); end     
if(ieee754_to_fp(dut_yjp18 )<0) begin dut_real_yjp18 =-ieee754_to_fp(dut_yjp18  ); end else begin dut_real_yjp18  =ieee754_to_fp(dut_yjp18  ); end     
if(ieee754_to_fp(dut_yjp19 )<0) begin dut_real_yjp19 =-ieee754_to_fp(dut_yjp19  ); end else begin dut_real_yjp19  =ieee754_to_fp(dut_yjp19  ); end     
if(ieee754_to_fp(dut_yjp20 )<0) begin dut_real_yjp20 =-ieee754_to_fp(dut_yjp20  ); end else begin dut_real_yjp20  =ieee754_to_fp(dut_yjp20  ); end     
if(ieee754_to_fp(dut_yjp21 )<0) begin dut_real_yjp21 =-ieee754_to_fp(dut_yjp21  ); end else begin dut_real_yjp21  =ieee754_to_fp(dut_yjp21  ); end     
if(ieee754_to_fp(dut_yjp22 )<0) begin dut_real_yjp22 =-ieee754_to_fp(dut_yjp22  ); end else begin dut_real_yjp22  =ieee754_to_fp(dut_yjp22  ); end     
if(ieee754_to_fp(dut_yjp23 )<0) begin dut_real_yjp23 =-ieee754_to_fp(dut_yjp23  ); end else begin dut_real_yjp23  =ieee754_to_fp(dut_yjp23  ); end     
if(ieee754_to_fp(dut_yjp24 )<0) begin dut_real_yjp24 =-ieee754_to_fp(dut_yjp24  ); end else begin dut_real_yjp24  =ieee754_to_fp(dut_yjp24  ); end     
if(ieee754_to_fp(dut_yjp25 )<0) begin dut_real_yjp25 =-ieee754_to_fp(dut_yjp25  ); end else begin dut_real_yjp25  =ieee754_to_fp(dut_yjp25  ); end     
if(ieee754_to_fp(dut_yjp26 )<0) begin dut_real_yjp26 =-ieee754_to_fp(dut_yjp26  ); end else begin dut_real_yjp26  =ieee754_to_fp(dut_yjp26  ); end     
if(ieee754_to_fp(dut_yjp27 )<0) begin dut_real_yjp27 =-ieee754_to_fp(dut_yjp27  ); end else begin dut_real_yjp27  =ieee754_to_fp(dut_yjp27  ); end     
if(ieee754_to_fp(dut_yjp28 )<0) begin dut_real_yjp28 =-ieee754_to_fp(dut_yjp28  ); end else begin dut_real_yjp28  =ieee754_to_fp(dut_yjp28  ); end     
if(ieee754_to_fp(dut_yjp29 )<0) begin dut_real_yjp29 =-ieee754_to_fp(dut_yjp29  ); end else begin dut_real_yjp29  =ieee754_to_fp(dut_yjp29  ); end     
if(ieee754_to_fp(dut_yjp30 )<0) begin dut_real_yjp30 =-ieee754_to_fp(dut_yjp30  ); end else begin dut_real_yjp30  =ieee754_to_fp(dut_yjp30  ); end     
if(ieee754_to_fp(dut_yjp31 )<0) begin dut_real_yjp31 =-ieee754_to_fp(dut_yjp31  ); end else begin dut_real_yjp31  =ieee754_to_fp(dut_yjp31  ); end     
`endif // ST_WIDTH_INF_64                                                                                                                                          
`ifdef ST_WIDTH_INF_128                                                                                                                                            
if(ieee754_to_fp(dut_yjp32 )<0) begin dut_real_yjp32 =-ieee754_to_fp(dut_yjp32  ); end else begin dut_real_yjp32  =ieee754_to_fp(dut_yjp32  ); end     
if(ieee754_to_fp(dut_yjp33 )<0) begin dut_real_yjp33 =-ieee754_to_fp(dut_yjp33  ); end else begin dut_real_yjp33  =ieee754_to_fp(dut_yjp33  ); end     
if(ieee754_to_fp(dut_yjp34 )<0) begin dut_real_yjp34 =-ieee754_to_fp(dut_yjp34  ); end else begin dut_real_yjp34  =ieee754_to_fp(dut_yjp34  ); end     
if(ieee754_to_fp(dut_yjp35 )<0) begin dut_real_yjp35 =-ieee754_to_fp(dut_yjp35  ); end else begin dut_real_yjp35  =ieee754_to_fp(dut_yjp35  ); end     
if(ieee754_to_fp(dut_yjp36 )<0) begin dut_real_yjp36 =-ieee754_to_fp(dut_yjp36  ); end else begin dut_real_yjp36  =ieee754_to_fp(dut_yjp36  ); end     
if(ieee754_to_fp(dut_yjp37 )<0) begin dut_real_yjp37 =-ieee754_to_fp(dut_yjp37  ); end else begin dut_real_yjp37  =ieee754_to_fp(dut_yjp37  ); end     
if(ieee754_to_fp(dut_yjp38 )<0) begin dut_real_yjp38 =-ieee754_to_fp(dut_yjp38  ); end else begin dut_real_yjp38  =ieee754_to_fp(dut_yjp38  ); end     
if(ieee754_to_fp(dut_yjp39 )<0) begin dut_real_yjp39 =-ieee754_to_fp(dut_yjp39  ); end else begin dut_real_yjp39  =ieee754_to_fp(dut_yjp39  ); end     
if(ieee754_to_fp(dut_yjp40 )<0) begin dut_real_yjp40 =-ieee754_to_fp(dut_yjp40  ); end else begin dut_real_yjp40  =ieee754_to_fp(dut_yjp40  ); end     
if(ieee754_to_fp(dut_yjp41 )<0) begin dut_real_yjp41 =-ieee754_to_fp(dut_yjp41  ); end else begin dut_real_yjp41  =ieee754_to_fp(dut_yjp41  ); end     
if(ieee754_to_fp(dut_yjp42 )<0) begin dut_real_yjp42 =-ieee754_to_fp(dut_yjp42  ); end else begin dut_real_yjp42  =ieee754_to_fp(dut_yjp42  ); end     
if(ieee754_to_fp(dut_yjp43 )<0) begin dut_real_yjp43 =-ieee754_to_fp(dut_yjp43  ); end else begin dut_real_yjp43  =ieee754_to_fp(dut_yjp43  ); end     
if(ieee754_to_fp(dut_yjp44 )<0) begin dut_real_yjp44 =-ieee754_to_fp(dut_yjp44  ); end else begin dut_real_yjp44  =ieee754_to_fp(dut_yjp44  ); end     
if(ieee754_to_fp(dut_yjp45 )<0) begin dut_real_yjp45 =-ieee754_to_fp(dut_yjp45  ); end else begin dut_real_yjp45  =ieee754_to_fp(dut_yjp45  ); end     
if(ieee754_to_fp(dut_yjp46 )<0) begin dut_real_yjp46 =-ieee754_to_fp(dut_yjp46  ); end else begin dut_real_yjp46  =ieee754_to_fp(dut_yjp46  ); end     
if(ieee754_to_fp(dut_yjp47 )<0) begin dut_real_yjp47 =-ieee754_to_fp(dut_yjp47  ); end else begin dut_real_yjp47  =ieee754_to_fp(dut_yjp47  ); end     
if(ieee754_to_fp(dut_yjp48 )<0) begin dut_real_yjp48 =-ieee754_to_fp(dut_yjp48  ); end else begin dut_real_yjp48  =ieee754_to_fp(dut_yjp48  ); end     
if(ieee754_to_fp(dut_yjp49 )<0) begin dut_real_yjp49 =-ieee754_to_fp(dut_yjp49  ); end else begin dut_real_yjp49  =ieee754_to_fp(dut_yjp49  ); end     
if(ieee754_to_fp(dut_yjp50 )<0) begin dut_real_yjp50 =-ieee754_to_fp(dut_yjp50  ); end else begin dut_real_yjp50  =ieee754_to_fp(dut_yjp50  ); end     
if(ieee754_to_fp(dut_yjp51 )<0) begin dut_real_yjp51 =-ieee754_to_fp(dut_yjp51  ); end else begin dut_real_yjp51  =ieee754_to_fp(dut_yjp51  ); end     
if(ieee754_to_fp(dut_yjp52 )<0) begin dut_real_yjp52 =-ieee754_to_fp(dut_yjp52  ); end else begin dut_real_yjp52  =ieee754_to_fp(dut_yjp52  ); end     
if(ieee754_to_fp(dut_yjp53 )<0) begin dut_real_yjp53 =-ieee754_to_fp(dut_yjp53  ); end else begin dut_real_yjp53  =ieee754_to_fp(dut_yjp53  ); end     
if(ieee754_to_fp(dut_yjp54 )<0) begin dut_real_yjp54 =-ieee754_to_fp(dut_yjp54  ); end else begin dut_real_yjp54  =ieee754_to_fp(dut_yjp54  ); end     
if(ieee754_to_fp(dut_yjp55 )<0) begin dut_real_yjp55 =-ieee754_to_fp(dut_yjp55  ); end else begin dut_real_yjp55  =ieee754_to_fp(dut_yjp55  ); end     
if(ieee754_to_fp(dut_yjp56 )<0) begin dut_real_yjp56 =-ieee754_to_fp(dut_yjp56  ); end else begin dut_real_yjp56  =ieee754_to_fp(dut_yjp56  ); end     
if(ieee754_to_fp(dut_yjp57 )<0) begin dut_real_yjp57 =-ieee754_to_fp(dut_yjp57  ); end else begin dut_real_yjp57  =ieee754_to_fp(dut_yjp57  ); end     
if(ieee754_to_fp(dut_yjp58 )<0) begin dut_real_yjp58 =-ieee754_to_fp(dut_yjp58  ); end else begin dut_real_yjp58  =ieee754_to_fp(dut_yjp58  ); end     
if(ieee754_to_fp(dut_yjp59 )<0) begin dut_real_yjp59 =-ieee754_to_fp(dut_yjp59  ); end else begin dut_real_yjp59  =ieee754_to_fp(dut_yjp59  ); end     
if(ieee754_to_fp(dut_yjp60 )<0) begin dut_real_yjp60 =-ieee754_to_fp(dut_yjp60  ); end else begin dut_real_yjp60  =ieee754_to_fp(dut_yjp60  ); end     
if(ieee754_to_fp(dut_yjp61 )<0) begin dut_real_yjp61 =-ieee754_to_fp(dut_yjp61  ); end else begin dut_real_yjp61  =ieee754_to_fp(dut_yjp61  ); end     
if(ieee754_to_fp(dut_yjp62 )<0) begin dut_real_yjp62 =-ieee754_to_fp(dut_yjp62  ); end else begin dut_real_yjp62  =ieee754_to_fp(dut_yjp62  ); end     
if(ieee754_to_fp(dut_yjp63 )<0) begin dut_real_yjp63 =-ieee754_to_fp(dut_yjp63  ); end else begin dut_real_yjp63  =ieee754_to_fp(dut_yjp63  ); end     
`endif // ST_WIDTH_INF_128                                                                                                                                         
`ifdef ST_WIDTH_INF_256                                                                                                                                            
if(ieee754_to_fp(dut_yjp64 )<0) begin dut_real_yjp64 =-ieee754_to_fp(dut_yjp64  ); end else begin dut_real_yjp64  =ieee754_to_fp(dut_yjp64  ); end     
if(ieee754_to_fp(dut_yjp65 )<0) begin dut_real_yjp65 =-ieee754_to_fp(dut_yjp65  ); end else begin dut_real_yjp65  =ieee754_to_fp(dut_yjp65  ); end     
if(ieee754_to_fp(dut_yjp66 )<0) begin dut_real_yjp66 =-ieee754_to_fp(dut_yjp66  ); end else begin dut_real_yjp66  =ieee754_to_fp(dut_yjp66  ); end     
if(ieee754_to_fp(dut_yjp67 )<0) begin dut_real_yjp67 =-ieee754_to_fp(dut_yjp67  ); end else begin dut_real_yjp67  =ieee754_to_fp(dut_yjp67  ); end     
if(ieee754_to_fp(dut_yjp68 )<0) begin dut_real_yjp68 =-ieee754_to_fp(dut_yjp68  ); end else begin dut_real_yjp68  =ieee754_to_fp(dut_yjp68  ); end     
if(ieee754_to_fp(dut_yjp69 )<0) begin dut_real_yjp69 =-ieee754_to_fp(dut_yjp69  ); end else begin dut_real_yjp69  =ieee754_to_fp(dut_yjp69  ); end     
if(ieee754_to_fp(dut_yjp70 )<0) begin dut_real_yjp70 =-ieee754_to_fp(dut_yjp70  ); end else begin dut_real_yjp70  =ieee754_to_fp(dut_yjp70  ); end     
if(ieee754_to_fp(dut_yjp71 )<0) begin dut_real_yjp71 =-ieee754_to_fp(dut_yjp71  ); end else begin dut_real_yjp71  =ieee754_to_fp(dut_yjp71  ); end     
if(ieee754_to_fp(dut_yjp72 )<0) begin dut_real_yjp72 =-ieee754_to_fp(dut_yjp72  ); end else begin dut_real_yjp72  =ieee754_to_fp(dut_yjp72  ); end     
if(ieee754_to_fp(dut_yjp73 )<0) begin dut_real_yjp73 =-ieee754_to_fp(dut_yjp73  ); end else begin dut_real_yjp73  =ieee754_to_fp(dut_yjp73  ); end     
if(ieee754_to_fp(dut_yjp74 )<0) begin dut_real_yjp74 =-ieee754_to_fp(dut_yjp74  ); end else begin dut_real_yjp74  =ieee754_to_fp(dut_yjp74  ); end     
if(ieee754_to_fp(dut_yjp75 )<0) begin dut_real_yjp75 =-ieee754_to_fp(dut_yjp75  ); end else begin dut_real_yjp75  =ieee754_to_fp(dut_yjp75  ); end     
if(ieee754_to_fp(dut_yjp76 )<0) begin dut_real_yjp76 =-ieee754_to_fp(dut_yjp76  ); end else begin dut_real_yjp76  =ieee754_to_fp(dut_yjp76  ); end     
if(ieee754_to_fp(dut_yjp77 )<0) begin dut_real_yjp77 =-ieee754_to_fp(dut_yjp77  ); end else begin dut_real_yjp77  =ieee754_to_fp(dut_yjp77  ); end     
if(ieee754_to_fp(dut_yjp78 )<0) begin dut_real_yjp78 =-ieee754_to_fp(dut_yjp78  ); end else begin dut_real_yjp78  =ieee754_to_fp(dut_yjp78  ); end     
if(ieee754_to_fp(dut_yjp79 )<0) begin dut_real_yjp79 =-ieee754_to_fp(dut_yjp79  ); end else begin dut_real_yjp79  =ieee754_to_fp(dut_yjp79  ); end     
if(ieee754_to_fp(dut_yjp80 )<0) begin dut_real_yjp80 =-ieee754_to_fp(dut_yjp80  ); end else begin dut_real_yjp80  =ieee754_to_fp(dut_yjp80  ); end     
if(ieee754_to_fp(dut_yjp81 )<0) begin dut_real_yjp81 =-ieee754_to_fp(dut_yjp81  ); end else begin dut_real_yjp81  =ieee754_to_fp(dut_yjp81  ); end     
if(ieee754_to_fp(dut_yjp82 )<0) begin dut_real_yjp82 =-ieee754_to_fp(dut_yjp82  ); end else begin dut_real_yjp82  =ieee754_to_fp(dut_yjp82  ); end     
if(ieee754_to_fp(dut_yjp83 )<0) begin dut_real_yjp83 =-ieee754_to_fp(dut_yjp83  ); end else begin dut_real_yjp83  =ieee754_to_fp(dut_yjp83  ); end     
if(ieee754_to_fp(dut_yjp84 )<0) begin dut_real_yjp84 =-ieee754_to_fp(dut_yjp84  ); end else begin dut_real_yjp84  =ieee754_to_fp(dut_yjp84  ); end     
if(ieee754_to_fp(dut_yjp85 )<0) begin dut_real_yjp85 =-ieee754_to_fp(dut_yjp85  ); end else begin dut_real_yjp85  =ieee754_to_fp(dut_yjp85  ); end     
if(ieee754_to_fp(dut_yjp86 )<0) begin dut_real_yjp86 =-ieee754_to_fp(dut_yjp86  ); end else begin dut_real_yjp86  =ieee754_to_fp(dut_yjp86  ); end     
if(ieee754_to_fp(dut_yjp87 )<0) begin dut_real_yjp87 =-ieee754_to_fp(dut_yjp87  ); end else begin dut_real_yjp87  =ieee754_to_fp(dut_yjp87  ); end     
if(ieee754_to_fp(dut_yjp88 )<0) begin dut_real_yjp88 =-ieee754_to_fp(dut_yjp88  ); end else begin dut_real_yjp88  =ieee754_to_fp(dut_yjp88  ); end     
if(ieee754_to_fp(dut_yjp89 )<0) begin dut_real_yjp89 =-ieee754_to_fp(dut_yjp89  ); end else begin dut_real_yjp89  =ieee754_to_fp(dut_yjp89  ); end     
if(ieee754_to_fp(dut_yjp90 )<0) begin dut_real_yjp90 =-ieee754_to_fp(dut_yjp90  ); end else begin dut_real_yjp90  =ieee754_to_fp(dut_yjp90  ); end     
if(ieee754_to_fp(dut_yjp91 )<0) begin dut_real_yjp91 =-ieee754_to_fp(dut_yjp91  ); end else begin dut_real_yjp91  =ieee754_to_fp(dut_yjp91  ); end     
if(ieee754_to_fp(dut_yjp92 )<0) begin dut_real_yjp92 =-ieee754_to_fp(dut_yjp92  ); end else begin dut_real_yjp92  =ieee754_to_fp(dut_yjp92  ); end     
if(ieee754_to_fp(dut_yjp93 )<0) begin dut_real_yjp93 =-ieee754_to_fp(dut_yjp93  ); end else begin dut_real_yjp93  =ieee754_to_fp(dut_yjp93  ); end     
if(ieee754_to_fp(dut_yjp94 )<0) begin dut_real_yjp94 =-ieee754_to_fp(dut_yjp94  ); end else begin dut_real_yjp94  =ieee754_to_fp(dut_yjp94  ); end     
if(ieee754_to_fp(dut_yjp95 )<0) begin dut_real_yjp95 =-ieee754_to_fp(dut_yjp95  ); end else begin dut_real_yjp95  =ieee754_to_fp(dut_yjp95  ); end     
if(ieee754_to_fp(dut_yjp96 )<0) begin dut_real_yjp96 =-ieee754_to_fp(dut_yjp96  ); end else begin dut_real_yjp96  =ieee754_to_fp(dut_yjp96  ); end     
if(ieee754_to_fp(dut_yjp97 )<0) begin dut_real_yjp97 =-ieee754_to_fp(dut_yjp97  ); end else begin dut_real_yjp97  =ieee754_to_fp(dut_yjp97  ); end     
if(ieee754_to_fp(dut_yjp98 )<0) begin dut_real_yjp98 =-ieee754_to_fp(dut_yjp98  ); end else begin dut_real_yjp98  =ieee754_to_fp(dut_yjp98  ); end     
if(ieee754_to_fp(dut_yjp99 )<0) begin dut_real_yjp99 =-ieee754_to_fp(dut_yjp99  ); end else begin dut_real_yjp99  =ieee754_to_fp(dut_yjp99  ); end     
if(ieee754_to_fp(dut_yjp100)<0) begin dut_real_yjp100=-ieee754_to_fp(dut_yjp100 ); end else begin dut_real_yjp100 =ieee754_to_fp(dut_yjp100 ); end     
if(ieee754_to_fp(dut_yjp101)<0) begin dut_real_yjp101=-ieee754_to_fp(dut_yjp101 ); end else begin dut_real_yjp101 =ieee754_to_fp(dut_yjp101 ); end     
if(ieee754_to_fp(dut_yjp102)<0) begin dut_real_yjp102=-ieee754_to_fp(dut_yjp102 ); end else begin dut_real_yjp102 =ieee754_to_fp(dut_yjp102 ); end     
if(ieee754_to_fp(dut_yjp103)<0) begin dut_real_yjp103=-ieee754_to_fp(dut_yjp103 ); end else begin dut_real_yjp103 =ieee754_to_fp(dut_yjp103 ); end     
if(ieee754_to_fp(dut_yjp104)<0) begin dut_real_yjp104=-ieee754_to_fp(dut_yjp104 ); end else begin dut_real_yjp104 =ieee754_to_fp(dut_yjp104 ); end     
if(ieee754_to_fp(dut_yjp105)<0) begin dut_real_yjp105=-ieee754_to_fp(dut_yjp105 ); end else begin dut_real_yjp105 =ieee754_to_fp(dut_yjp105 ); end     
if(ieee754_to_fp(dut_yjp106)<0) begin dut_real_yjp106=-ieee754_to_fp(dut_yjp106 ); end else begin dut_real_yjp106 =ieee754_to_fp(dut_yjp106 ); end     
if(ieee754_to_fp(dut_yjp107)<0) begin dut_real_yjp107=-ieee754_to_fp(dut_yjp107 ); end else begin dut_real_yjp107 =ieee754_to_fp(dut_yjp107 ); end     
if(ieee754_to_fp(dut_yjp108)<0) begin dut_real_yjp108=-ieee754_to_fp(dut_yjp108 ); end else begin dut_real_yjp108 =ieee754_to_fp(dut_yjp108 ); end     
if(ieee754_to_fp(dut_yjp109)<0) begin dut_real_yjp109=-ieee754_to_fp(dut_yjp109 ); end else begin dut_real_yjp109 =ieee754_to_fp(dut_yjp109 ); end     
if(ieee754_to_fp(dut_yjp110)<0) begin dut_real_yjp110=-ieee754_to_fp(dut_yjp110 ); end else begin dut_real_yjp110 =ieee754_to_fp(dut_yjp110 ); end     
if(ieee754_to_fp(dut_yjp111)<0) begin dut_real_yjp111=-ieee754_to_fp(dut_yjp111 ); end else begin dut_real_yjp111 =ieee754_to_fp(dut_yjp111 ); end     
if(ieee754_to_fp(dut_yjp112)<0) begin dut_real_yjp112=-ieee754_to_fp(dut_yjp112 ); end else begin dut_real_yjp112 =ieee754_to_fp(dut_yjp112 ); end     
if(ieee754_to_fp(dut_yjp113)<0) begin dut_real_yjp113=-ieee754_to_fp(dut_yjp113 ); end else begin dut_real_yjp113 =ieee754_to_fp(dut_yjp113 ); end     
if(ieee754_to_fp(dut_yjp114)<0) begin dut_real_yjp114=-ieee754_to_fp(dut_yjp114 ); end else begin dut_real_yjp114 =ieee754_to_fp(dut_yjp114 ); end     
if(ieee754_to_fp(dut_yjp115)<0) begin dut_real_yjp115=-ieee754_to_fp(dut_yjp115 ); end else begin dut_real_yjp115 =ieee754_to_fp(dut_yjp115 ); end     
if(ieee754_to_fp(dut_yjp116)<0) begin dut_real_yjp116=-ieee754_to_fp(dut_yjp116 ); end else begin dut_real_yjp116 =ieee754_to_fp(dut_yjp116 ); end     
if(ieee754_to_fp(dut_yjp117)<0) begin dut_real_yjp117=-ieee754_to_fp(dut_yjp117 ); end else begin dut_real_yjp117 =ieee754_to_fp(dut_yjp117 ); end     
if(ieee754_to_fp(dut_yjp118)<0) begin dut_real_yjp118=-ieee754_to_fp(dut_yjp118 ); end else begin dut_real_yjp118 =ieee754_to_fp(dut_yjp118 ); end     
if(ieee754_to_fp(dut_yjp119)<0) begin dut_real_yjp119=-ieee754_to_fp(dut_yjp119 ); end else begin dut_real_yjp119 =ieee754_to_fp(dut_yjp119 ); end     
if(ieee754_to_fp(dut_yjp120)<0) begin dut_real_yjp120=-ieee754_to_fp(dut_yjp120 ); end else begin dut_real_yjp120 =ieee754_to_fp(dut_yjp120 ); end     
if(ieee754_to_fp(dut_yjp121)<0) begin dut_real_yjp121=-ieee754_to_fp(dut_yjp121 ); end else begin dut_real_yjp121 =ieee754_to_fp(dut_yjp121 ); end     
if(ieee754_to_fp(dut_yjp122)<0) begin dut_real_yjp122=-ieee754_to_fp(dut_yjp122 ); end else begin dut_real_yjp122 =ieee754_to_fp(dut_yjp122 ); end     
if(ieee754_to_fp(dut_yjp123)<0) begin dut_real_yjp123=-ieee754_to_fp(dut_yjp123 ); end else begin dut_real_yjp123 =ieee754_to_fp(dut_yjp123 ); end     
if(ieee754_to_fp(dut_yjp124)<0) begin dut_real_yjp124=-ieee754_to_fp(dut_yjp124 ); end else begin dut_real_yjp124 =ieee754_to_fp(dut_yjp124 ); end     
if(ieee754_to_fp(dut_yjp125)<0) begin dut_real_yjp125=-ieee754_to_fp(dut_yjp125 ); end else begin dut_real_yjp125 =ieee754_to_fp(dut_yjp125 ); end     
if(ieee754_to_fp(dut_yjp126)<0) begin dut_real_yjp126=-ieee754_to_fp(dut_yjp126 ); end else begin dut_real_yjp126 =ieee754_to_fp(dut_yjp126 ); end     
if(ieee754_to_fp(dut_yjp127)<0) begin dut_real_yjp127=-ieee754_to_fp(dut_yjp127 ); end else begin dut_real_yjp127 =ieee754_to_fp(dut_yjp127 ); end     
`endif // ST_WIDTH_INF_256        
`ifdef ST_WIDTH_INF_16        
error_percent0   = ((dut_real_yjp0  -golden_real_yjp0  )/golden_real_yjp0  )*100;
error_percent1   = ((dut_real_yjp1  -golden_real_yjp1  )/golden_real_yjp1  )*100;
error_percent2   = ((dut_real_yjp2  -golden_real_yjp2  )/golden_real_yjp2  )*100;
error_percent3   = ((dut_real_yjp3  -golden_real_yjp3  )/golden_real_yjp3  )*100;
error_percent4   = ((dut_real_yjp4  -golden_real_yjp4  )/golden_real_yjp4  )*100;
error_percent5   = ((dut_real_yjp5  -golden_real_yjp5  )/golden_real_yjp5  )*100;
error_percent6   = ((dut_real_yjp6  -golden_real_yjp6  )/golden_real_yjp6  )*100;
error_percent7   = ((dut_real_yjp7  -golden_real_yjp7  )/golden_real_yjp7  )*100;
`endif // ST_WIDTH_INF_16        
`ifdef ST_WIDTH_INF_32        
error_percent8   = ((dut_real_yjp8  -golden_real_yjp8  )/golden_real_yjp8  )*100;
error_percent9   = ((dut_real_yjp9  -golden_real_yjp9  )/golden_real_yjp9  )*100;
error_percent10  = ((dut_real_yjp10 -golden_real_yjp10 )/golden_real_yjp10 )*100;
error_percent11  = ((dut_real_yjp11 -golden_real_yjp11 )/golden_real_yjp11 )*100;
error_percent12  = ((dut_real_yjp12 -golden_real_yjp12 )/golden_real_yjp12 )*100;
error_percent13  = ((dut_real_yjp13 -golden_real_yjp13 )/golden_real_yjp13 )*100;
error_percent14  = ((dut_real_yjp14 -golden_real_yjp14 )/golden_real_yjp14 )*100;
error_percent15  = ((dut_real_yjp15 -golden_real_yjp15 )/golden_real_yjp15 )*100;
`endif // ST_WIDTH_INF_32        
`ifdef ST_WIDTH_INF_64        
error_percent16  = ((dut_real_yjp16 -golden_real_yjp16 )/golden_real_yjp16 )*100;
error_percent17  = ((dut_real_yjp17 -golden_real_yjp17 )/golden_real_yjp17 )*100;
error_percent18  = ((dut_real_yjp18 -golden_real_yjp18 )/golden_real_yjp18 )*100;
error_percent19  = ((dut_real_yjp19 -golden_real_yjp19 )/golden_real_yjp19 )*100;
error_percent20  = ((dut_real_yjp20 -golden_real_yjp20 )/golden_real_yjp20 )*100;
error_percent21  = ((dut_real_yjp21 -golden_real_yjp21 )/golden_real_yjp21 )*100;
error_percent22  = ((dut_real_yjp22 -golden_real_yjp22 )/golden_real_yjp22 )*100;
error_percent23  = ((dut_real_yjp23 -golden_real_yjp23 )/golden_real_yjp23 )*100;
error_percent24  = ((dut_real_yjp24 -golden_real_yjp24 )/golden_real_yjp24 )*100;
error_percent25  = ((dut_real_yjp25 -golden_real_yjp25 )/golden_real_yjp25 )*100;
error_percent26  = ((dut_real_yjp26 -golden_real_yjp26 )/golden_real_yjp26 )*100;
error_percent27  = ((dut_real_yjp27 -golden_real_yjp27 )/golden_real_yjp27 )*100;
error_percent28  = ((dut_real_yjp28 -golden_real_yjp28 )/golden_real_yjp28 )*100;
error_percent29  = ((dut_real_yjp29 -golden_real_yjp29 )/golden_real_yjp29 )*100;
error_percent30  = ((dut_real_yjp30 -golden_real_yjp30 )/golden_real_yjp30 )*100;
error_percent31  = ((dut_real_yjp31 -golden_real_yjp31 )/golden_real_yjp31 )*100;
`endif // ST_WIDTH_INF_64        
`ifdef ST_WIDTH_INF_128        
error_percent32  = ((dut_real_yjp32 -golden_real_yjp32 )/golden_real_yjp32 )*100;
error_percent33  = ((dut_real_yjp33 -golden_real_yjp33 )/golden_real_yjp33 )*100;
error_percent34  = ((dut_real_yjp34 -golden_real_yjp34 )/golden_real_yjp34 )*100;
error_percent35  = ((dut_real_yjp35 -golden_real_yjp35 )/golden_real_yjp35 )*100;
error_percent36  = ((dut_real_yjp36 -golden_real_yjp36 )/golden_real_yjp36 )*100;
error_percent37  = ((dut_real_yjp37 -golden_real_yjp37 )/golden_real_yjp37 )*100;
error_percent38  = ((dut_real_yjp38 -golden_real_yjp38 )/golden_real_yjp38 )*100;
error_percent39  = ((dut_real_yjp39 -golden_real_yjp39 )/golden_real_yjp39 )*100;
error_percent40  = ((dut_real_yjp40 -golden_real_yjp40 )/golden_real_yjp40 )*100;
error_percent41  = ((dut_real_yjp41 -golden_real_yjp41 )/golden_real_yjp41 )*100;
error_percent42  = ((dut_real_yjp42 -golden_real_yjp42 )/golden_real_yjp42 )*100;
error_percent43  = ((dut_real_yjp43 -golden_real_yjp43 )/golden_real_yjp43 )*100;
error_percent44  = ((dut_real_yjp44 -golden_real_yjp44 )/golden_real_yjp44 )*100;
error_percent45  = ((dut_real_yjp45 -golden_real_yjp45 )/golden_real_yjp45 )*100;
error_percent46  = ((dut_real_yjp46 -golden_real_yjp46 )/golden_real_yjp46 )*100;
error_percent47  = ((dut_real_yjp47 -golden_real_yjp47 )/golden_real_yjp47 )*100;
error_percent48  = ((dut_real_yjp48 -golden_real_yjp48 )/golden_real_yjp48 )*100;
error_percent49  = ((dut_real_yjp49 -golden_real_yjp49 )/golden_real_yjp49 )*100;
error_percent50  = ((dut_real_yjp50 -golden_real_yjp50 )/golden_real_yjp50 )*100;
error_percent51  = ((dut_real_yjp51 -golden_real_yjp51 )/golden_real_yjp51 )*100;
error_percent52  = ((dut_real_yjp52 -golden_real_yjp52 )/golden_real_yjp52 )*100;
error_percent53  = ((dut_real_yjp53 -golden_real_yjp53 )/golden_real_yjp53 )*100;
error_percent54  = ((dut_real_yjp54 -golden_real_yjp54 )/golden_real_yjp54 )*100;
error_percent55  = ((dut_real_yjp55 -golden_real_yjp55 )/golden_real_yjp55 )*100;
error_percent56  = ((dut_real_yjp56 -golden_real_yjp56 )/golden_real_yjp56 )*100;
error_percent57  = ((dut_real_yjp57 -golden_real_yjp57 )/golden_real_yjp57 )*100;
error_percent58  = ((dut_real_yjp58 -golden_real_yjp58 )/golden_real_yjp58 )*100;
error_percent59  = ((dut_real_yjp59 -golden_real_yjp59 )/golden_real_yjp59 )*100;
error_percent60  = ((dut_real_yjp60 -golden_real_yjp60 )/golden_real_yjp60 )*100;
error_percent61  = ((dut_real_yjp61 -golden_real_yjp61 )/golden_real_yjp61 )*100;
error_percent62  = ((dut_real_yjp62 -golden_real_yjp62 )/golden_real_yjp62 )*100;
error_percent63  = ((dut_real_yjp63 -golden_real_yjp63 )/golden_real_yjp63 )*100;
`endif // ST_WIDTH_INF_128        
`ifdef ST_WIDTH_INF_256        
error_percent64  = ((dut_real_yjp64 -golden_real_yjp64 )/golden_real_yjp64 )*100;
error_percent65  = ((dut_real_yjp65 -golden_real_yjp65 )/golden_real_yjp65 )*100;
error_percent66  = ((dut_real_yjp66 -golden_real_yjp66 )/golden_real_yjp66 )*100;
error_percent67  = ((dut_real_yjp67 -golden_real_yjp67 )/golden_real_yjp67 )*100;
error_percent68  = ((dut_real_yjp68 -golden_real_yjp68 )/golden_real_yjp68 )*100;
error_percent69  = ((dut_real_yjp69 -golden_real_yjp69 )/golden_real_yjp69 )*100;
error_percent70  = ((dut_real_yjp70 -golden_real_yjp70 )/golden_real_yjp70 )*100;
error_percent71  = ((dut_real_yjp71 -golden_real_yjp71 )/golden_real_yjp71 )*100;
error_percent72  = ((dut_real_yjp72 -golden_real_yjp72 )/golden_real_yjp72 )*100;
error_percent73  = ((dut_real_yjp73 -golden_real_yjp73 )/golden_real_yjp73 )*100;
error_percent74  = ((dut_real_yjp74 -golden_real_yjp74 )/golden_real_yjp74 )*100;
error_percent75  = ((dut_real_yjp75 -golden_real_yjp75 )/golden_real_yjp75 )*100;
error_percent76  = ((dut_real_yjp76 -golden_real_yjp76 )/golden_real_yjp76 )*100;
error_percent77  = ((dut_real_yjp77 -golden_real_yjp77 )/golden_real_yjp77 )*100;
error_percent78  = ((dut_real_yjp78 -golden_real_yjp78 )/golden_real_yjp78 )*100;
error_percent79  = ((dut_real_yjp79 -golden_real_yjp79 )/golden_real_yjp79 )*100;
error_percent80  = ((dut_real_yjp80 -golden_real_yjp80 )/golden_real_yjp80 )*100;
error_percent81  = ((dut_real_yjp81 -golden_real_yjp81 )/golden_real_yjp81 )*100;
error_percent82  = ((dut_real_yjp82 -golden_real_yjp82 )/golden_real_yjp82 )*100;
error_percent83  = ((dut_real_yjp83 -golden_real_yjp83 )/golden_real_yjp83 )*100;
error_percent84  = ((dut_real_yjp84 -golden_real_yjp84 )/golden_real_yjp84 )*100;
error_percent85  = ((dut_real_yjp85 -golden_real_yjp85 )/golden_real_yjp85 )*100;
error_percent86  = ((dut_real_yjp86 -golden_real_yjp86 )/golden_real_yjp86 )*100;
error_percent87  = ((dut_real_yjp87 -golden_real_yjp87 )/golden_real_yjp87 )*100;
error_percent88  = ((dut_real_yjp88 -golden_real_yjp88 )/golden_real_yjp88 )*100;
error_percent89  = ((dut_real_yjp89 -golden_real_yjp89 )/golden_real_yjp89 )*100;
error_percent90  = ((dut_real_yjp90 -golden_real_yjp90 )/golden_real_yjp90 )*100;
error_percent91  = ((dut_real_yjp91 -golden_real_yjp91 )/golden_real_yjp91 )*100;
error_percent92  = ((dut_real_yjp92 -golden_real_yjp92 )/golden_real_yjp92 )*100;
error_percent93  = ((dut_real_yjp93 -golden_real_yjp93 )/golden_real_yjp93 )*100;
error_percent94  = ((dut_real_yjp94 -golden_real_yjp94 )/golden_real_yjp94 )*100;
error_percent95  = ((dut_real_yjp95 -golden_real_yjp95 )/golden_real_yjp95 )*100;
error_percent96  = ((dut_real_yjp96 -golden_real_yjp96 )/golden_real_yjp96 )*100;
error_percent97  = ((dut_real_yjp97 -golden_real_yjp97 )/golden_real_yjp97 )*100;
error_percent98  = ((dut_real_yjp98 -golden_real_yjp98 )/golden_real_yjp98 )*100;
error_percent99  = ((dut_real_yjp99 -golden_real_yjp99 )/golden_real_yjp99 )*100;
error_percent100 = ((dut_real_yjp100-golden_real_yjp100)/golden_real_yjp100)*100;
error_percent101 = ((dut_real_yjp101-golden_real_yjp101)/golden_real_yjp101)*100;
error_percent102 = ((dut_real_yjp102-golden_real_yjp102)/golden_real_yjp102)*100;
error_percent103 = ((dut_real_yjp103-golden_real_yjp103)/golden_real_yjp103)*100;
error_percent104 = ((dut_real_yjp104-golden_real_yjp104)/golden_real_yjp104)*100;
error_percent105 = ((dut_real_yjp105-golden_real_yjp105)/golden_real_yjp105)*100;
error_percent106 = ((dut_real_yjp106-golden_real_yjp106)/golden_real_yjp106)*100;
error_percent107 = ((dut_real_yjp107-golden_real_yjp107)/golden_real_yjp107)*100;
error_percent108 = ((dut_real_yjp108-golden_real_yjp108)/golden_real_yjp108)*100;
error_percent109 = ((dut_real_yjp109-golden_real_yjp109)/golden_real_yjp109)*100;
error_percent110 = ((dut_real_yjp110-golden_real_yjp110)/golden_real_yjp110)*100;
error_percent111 = ((dut_real_yjp111-golden_real_yjp111)/golden_real_yjp111)*100;
error_percent112 = ((dut_real_yjp112-golden_real_yjp112)/golden_real_yjp112)*100;
error_percent113 = ((dut_real_yjp113-golden_real_yjp113)/golden_real_yjp113)*100;
error_percent114 = ((dut_real_yjp114-golden_real_yjp114)/golden_real_yjp114)*100;
error_percent115 = ((dut_real_yjp115-golden_real_yjp115)/golden_real_yjp115)*100;
error_percent116 = ((dut_real_yjp116-golden_real_yjp116)/golden_real_yjp116)*100;
error_percent117 = ((dut_real_yjp117-golden_real_yjp117)/golden_real_yjp117)*100;
error_percent118 = ((dut_real_yjp118-golden_real_yjp118)/golden_real_yjp118)*100;
error_percent119 = ((dut_real_yjp119-golden_real_yjp119)/golden_real_yjp119)*100;
error_percent120 = ((dut_real_yjp120-golden_real_yjp120)/golden_real_yjp120)*100;
error_percent121 = ((dut_real_yjp121-golden_real_yjp121)/golden_real_yjp121)*100;
error_percent122 = ((dut_real_yjp122-golden_real_yjp122)/golden_real_yjp122)*100;
error_percent123 = ((dut_real_yjp123-golden_real_yjp123)/golden_real_yjp123)*100;
error_percent124 = ((dut_real_yjp124-golden_real_yjp124)/golden_real_yjp124)*100;
error_percent125 = ((dut_real_yjp125-golden_real_yjp125)/golden_real_yjp125)*100;
error_percent126 = ((dut_real_yjp126-golden_real_yjp126)/golden_real_yjp126)*100;
error_percent127 = ((dut_real_yjp127-golden_real_yjp127)/golden_real_yjp127)*100;
`endif // ST_WIDTH_INF_256        

`ifdef ST_WIDTH_INF_16        
if(error_percent0  <0) error_percent0   = -error_percent0  ; else error_percent0   = error_percent0  ;
if(error_percent1  <0) error_percent1   = -error_percent1  ; else error_percent1   = error_percent1  ;
if(error_percent2  <0) error_percent2   = -error_percent2  ; else error_percent2   = error_percent2  ;
if(error_percent3  <0) error_percent3   = -error_percent3  ; else error_percent3   = error_percent3  ;
if(error_percent4  <0) error_percent4   = -error_percent4  ; else error_percent4   = error_percent4  ;
if(error_percent5  <0) error_percent5   = -error_percent5  ; else error_percent5   = error_percent5  ;
if(error_percent6  <0) error_percent6   = -error_percent6  ; else error_percent6   = error_percent6  ;
if(error_percent7  <0) error_percent7   = -error_percent7  ; else error_percent7   = error_percent7  ;
`endif // ST_WIDTH_INF_16        
`ifdef ST_WIDTH_INF_32        
if(error_percent8  <0) error_percent8   = -error_percent8  ; else error_percent8   = error_percent8  ;
if(error_percent9  <0) error_percent9   = -error_percent9  ; else error_percent9   = error_percent9  ;
if(error_percent10 <0) error_percent10  = -error_percent10 ; else error_percent10  = error_percent10 ;
if(error_percent11 <0) error_percent11  = -error_percent11 ; else error_percent11  = error_percent11 ;
if(error_percent12 <0) error_percent12  = -error_percent12 ; else error_percent12  = error_percent12 ;
if(error_percent13 <0) error_percent13  = -error_percent13 ; else error_percent13  = error_percent13 ;
if(error_percent14 <0) error_percent14  = -error_percent14 ; else error_percent14  = error_percent14 ;
if(error_percent15 <0) error_percent15  = -error_percent15 ; else error_percent15  = error_percent15 ;
`endif // ST_WIDTH_INF_32        
`ifdef ST_WIDTH_INF_64        
if(error_percent16 <0) error_percent16  = -error_percent16 ; else error_percent16  = error_percent16 ;
if(error_percent17 <0) error_percent17  = -error_percent17 ; else error_percent17  = error_percent17 ;
if(error_percent18 <0) error_percent18  = -error_percent18 ; else error_percent18  = error_percent18 ;
if(error_percent19 <0) error_percent19  = -error_percent19 ; else error_percent19  = error_percent19 ;
if(error_percent20 <0) error_percent20  = -error_percent20 ; else error_percent20  = error_percent20 ;
if(error_percent21 <0) error_percent21  = -error_percent21 ; else error_percent21  = error_percent21 ;
if(error_percent22 <0) error_percent22  = -error_percent22 ; else error_percent22  = error_percent22 ;
if(error_percent23 <0) error_percent23  = -error_percent23 ; else error_percent23  = error_percent23 ;
if(error_percent24 <0) error_percent24  = -error_percent24 ; else error_percent24  = error_percent24 ;
if(error_percent25 <0) error_percent25  = -error_percent25 ; else error_percent25  = error_percent25 ;
if(error_percent26 <0) error_percent26  = -error_percent26 ; else error_percent26  = error_percent26 ;
if(error_percent27 <0) error_percent27  = -error_percent27 ; else error_percent27  = error_percent27 ;
if(error_percent28 <0) error_percent28  = -error_percent28 ; else error_percent28  = error_percent28 ;
if(error_percent29 <0) error_percent29  = -error_percent29 ; else error_percent29  = error_percent29 ;
if(error_percent30 <0) error_percent30  = -error_percent30 ; else error_percent30  = error_percent30 ;
if(error_percent31 <0) error_percent31  = -error_percent31 ; else error_percent31  = error_percent31 ;
`endif // ST_WIDTH_INF_64        
`ifdef ST_WIDTH_INF_128        
if(error_percent32 <0) error_percent32  = -error_percent32 ; else error_percent32  = error_percent32 ;
if(error_percent33 <0) error_percent33  = -error_percent33 ; else error_percent33  = error_percent33 ;
if(error_percent34 <0) error_percent34  = -error_percent34 ; else error_percent34  = error_percent34 ;
if(error_percent35 <0) error_percent35  = -error_percent35 ; else error_percent35  = error_percent35 ;
if(error_percent36 <0) error_percent36  = -error_percent36 ; else error_percent36  = error_percent36 ;
if(error_percent37 <0) error_percent37  = -error_percent37 ; else error_percent37  = error_percent37 ;
if(error_percent38 <0) error_percent38  = -error_percent38 ; else error_percent38  = error_percent38 ;
if(error_percent39 <0) error_percent39  = -error_percent39 ; else error_percent39  = error_percent39 ;
if(error_percent40 <0) error_percent40  = -error_percent40 ; else error_percent40  = error_percent40 ;
if(error_percent41 <0) error_percent41  = -error_percent41 ; else error_percent41  = error_percent41 ;
if(error_percent42 <0) error_percent42  = -error_percent42 ; else error_percent42  = error_percent42 ;
if(error_percent43 <0) error_percent43  = -error_percent43 ; else error_percent43  = error_percent43 ;
if(error_percent44 <0) error_percent44  = -error_percent44 ; else error_percent44  = error_percent44 ;
if(error_percent45 <0) error_percent45  = -error_percent45 ; else error_percent45  = error_percent45 ;
if(error_percent46 <0) error_percent46  = -error_percent46 ; else error_percent46  = error_percent46 ;
if(error_percent47 <0) error_percent47  = -error_percent47 ; else error_percent47  = error_percent47 ;
if(error_percent48 <0) error_percent48  = -error_percent48 ; else error_percent48  = error_percent48 ;
if(error_percent49 <0) error_percent49  = -error_percent49 ; else error_percent49  = error_percent49 ;
if(error_percent50 <0) error_percent50  = -error_percent50 ; else error_percent50  = error_percent50 ;
if(error_percent51 <0) error_percent51  = -error_percent51 ; else error_percent51  = error_percent51 ;
if(error_percent52 <0) error_percent52  = -error_percent52 ; else error_percent52  = error_percent52 ;
if(error_percent53 <0) error_percent53  = -error_percent53 ; else error_percent53  = error_percent53 ;
if(error_percent54 <0) error_percent54  = -error_percent54 ; else error_percent54  = error_percent54 ;
if(error_percent55 <0) error_percent55  = -error_percent55 ; else error_percent55  = error_percent55 ;
if(error_percent56 <0) error_percent56  = -error_percent56 ; else error_percent56  = error_percent56 ;
if(error_percent57 <0) error_percent57  = -error_percent57 ; else error_percent57  = error_percent57 ;
if(error_percent58 <0) error_percent58  = -error_percent58 ; else error_percent58  = error_percent58 ;
if(error_percent59 <0) error_percent59  = -error_percent59 ; else error_percent59  = error_percent59 ;
if(error_percent60 <0) error_percent60  = -error_percent60 ; else error_percent60  = error_percent60 ;
if(error_percent61 <0) error_percent61  = -error_percent61 ; else error_percent61  = error_percent61 ;
if(error_percent62 <0) error_percent62  = -error_percent62 ; else error_percent62  = error_percent62 ;
if(error_percent63 <0) error_percent63  = -error_percent63 ; else error_percent63  = error_percent63 ;
`endif // ST_WIDTH_INF_128        
`ifdef ST_WIDTH_INF_256        
if(error_percent64 <0) error_percent64  = -error_percent64 ; else error_percent64  = error_percent64 ;
if(error_percent65 <0) error_percent65  = -error_percent65 ; else error_percent65  = error_percent65 ;
if(error_percent66 <0) error_percent66  = -error_percent66 ; else error_percent66  = error_percent66 ;
if(error_percent67 <0) error_percent67  = -error_percent67 ; else error_percent67  = error_percent67 ;
if(error_percent68 <0) error_percent68  = -error_percent68 ; else error_percent68  = error_percent68 ;
if(error_percent69 <0) error_percent69  = -error_percent69 ; else error_percent69  = error_percent69 ;
if(error_percent70 <0) error_percent70  = -error_percent70 ; else error_percent70  = error_percent70 ;
if(error_percent71 <0) error_percent71  = -error_percent71 ; else error_percent71  = error_percent71 ;
if(error_percent72 <0) error_percent72  = -error_percent72 ; else error_percent72  = error_percent72 ;
if(error_percent73 <0) error_percent73  = -error_percent73 ; else error_percent73  = error_percent73 ;
if(error_percent74 <0) error_percent74  = -error_percent74 ; else error_percent74  = error_percent74 ;
if(error_percent75 <0) error_percent75  = -error_percent75 ; else error_percent75  = error_percent75 ;
if(error_percent76 <0) error_percent76  = -error_percent76 ; else error_percent76  = error_percent76 ;
if(error_percent77 <0) error_percent77  = -error_percent77 ; else error_percent77  = error_percent77 ;
if(error_percent78 <0) error_percent78  = -error_percent78 ; else error_percent78  = error_percent78 ;
if(error_percent79 <0) error_percent79  = -error_percent79 ; else error_percent79  = error_percent79 ;
if(error_percent80 <0) error_percent80  = -error_percent80 ; else error_percent80  = error_percent80 ;
if(error_percent81 <0) error_percent81  = -error_percent81 ; else error_percent81  = error_percent81 ;
if(error_percent82 <0) error_percent82  = -error_percent82 ; else error_percent82  = error_percent82 ;
if(error_percent83 <0) error_percent83  = -error_percent83 ; else error_percent83  = error_percent83 ;
if(error_percent84 <0) error_percent84  = -error_percent84 ; else error_percent84  = error_percent84 ;
if(error_percent85 <0) error_percent85  = -error_percent85 ; else error_percent85  = error_percent85 ;
if(error_percent86 <0) error_percent86  = -error_percent86 ; else error_percent86  = error_percent86 ;
if(error_percent87 <0) error_percent87  = -error_percent87 ; else error_percent87  = error_percent87 ;
if(error_percent88 <0) error_percent88  = -error_percent88 ; else error_percent88  = error_percent88 ;
if(error_percent89 <0) error_percent89  = -error_percent89 ; else error_percent89  = error_percent89 ;
if(error_percent90 <0) error_percent90  = -error_percent90 ; else error_percent90  = error_percent90 ;
if(error_percent91 <0) error_percent91  = -error_percent91 ; else error_percent91  = error_percent91 ;
if(error_percent92 <0) error_percent92  = -error_percent92 ; else error_percent92  = error_percent92 ;
if(error_percent93 <0) error_percent93  = -error_percent93 ; else error_percent93  = error_percent93 ;
if(error_percent94 <0) error_percent94  = -error_percent94 ; else error_percent94  = error_percent94 ;
if(error_percent95 <0) error_percent95  = -error_percent95 ; else error_percent95  = error_percent95 ;
if(error_percent96 <0) error_percent96  = -error_percent96 ; else error_percent96  = error_percent96 ;
if(error_percent97 <0) error_percent97  = -error_percent97 ; else error_percent97  = error_percent97 ;
if(error_percent98 <0) error_percent98  = -error_percent98 ; else error_percent98  = error_percent98 ;
if(error_percent99 <0) error_percent99  = -error_percent99 ; else error_percent99  = error_percent99 ;
if(error_percent100<0) error_percent100 = -error_percent100; else error_percent100 = error_percent100;
if(error_percent101<0) error_percent101 = -error_percent101; else error_percent101 = error_percent101;
if(error_percent102<0) error_percent102 = -error_percent102; else error_percent102 = error_percent102;
if(error_percent103<0) error_percent103 = -error_percent103; else error_percent103 = error_percent103;
if(error_percent104<0) error_percent104 = -error_percent104; else error_percent104 = error_percent104;
if(error_percent105<0) error_percent105 = -error_percent105; else error_percent105 = error_percent105;
if(error_percent106<0) error_percent106 = -error_percent106; else error_percent106 = error_percent106;
if(error_percent107<0) error_percent107 = -error_percent107; else error_percent107 = error_percent107;
if(error_percent108<0) error_percent108 = -error_percent108; else error_percent108 = error_percent108;
if(error_percent109<0) error_percent109 = -error_percent109; else error_percent109 = error_percent109;
if(error_percent110<0) error_percent110 = -error_percent110; else error_percent110 = error_percent110;
if(error_percent111<0) error_percent111 = -error_percent111; else error_percent111 = error_percent111;
if(error_percent112<0) error_percent112 = -error_percent112; else error_percent112 = error_percent112;
if(error_percent113<0) error_percent113 = -error_percent113; else error_percent113 = error_percent113;
if(error_percent114<0) error_percent114 = -error_percent114; else error_percent114 = error_percent114;
if(error_percent115<0) error_percent115 = -error_percent115; else error_percent115 = error_percent115;
if(error_percent116<0) error_percent116 = -error_percent116; else error_percent116 = error_percent116;
if(error_percent117<0) error_percent117 = -error_percent117; else error_percent117 = error_percent117;
if(error_percent118<0) error_percent118 = -error_percent118; else error_percent118 = error_percent118;
if(error_percent119<0) error_percent119 = -error_percent119; else error_percent119 = error_percent119;
if(error_percent120<0) error_percent120 = -error_percent120; else error_percent120 = error_percent120;
if(error_percent121<0) error_percent121 = -error_percent121; else error_percent121 = error_percent121;
if(error_percent122<0) error_percent122 = -error_percent122; else error_percent122 = error_percent122;
if(error_percent123<0) error_percent123 = -error_percent123; else error_percent123 = error_percent123;
if(error_percent124<0) error_percent124 = -error_percent124; else error_percent124 = error_percent124;
if(error_percent125<0) error_percent125 = -error_percent125; else error_percent125 = error_percent125;
if(error_percent126<0) error_percent126 = -error_percent126; else error_percent126 = error_percent126;
if(error_percent127<0) error_percent127 = -error_percent127; else error_percent127 = error_percent127;
`endif // ST_WIDTH_INF_256        
