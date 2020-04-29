# 1 "lookUpCode.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lookUpCode.c"
typedef short s16;
typedef int s32;
typedef unsigned int u32;

extern s16 sin_lut[514];

s32 lu_sin(u32 theta){ return sin_lut[(theta)&0x1FF]; }
s32 lu_cos(u32 theta){ return sin_lut[((theta)+128)&0x1FF]; }
