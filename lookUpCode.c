typedef short s16;
typedef int s32;
typedef unsigned int u32;

extern s16 sin_lut[514];	// .12f format. This tells c to get data from sin_lut.s and store it in an array(of 512 16bit numbers) called sin_lut

s32 lu_sin(u32 theta){	return sin_lut[(theta)&0x1FF];	}
s32 lu_cos(u32 theta){	return sin_lut[((theta)+128)&0x1FF];	}

// theta = 0, 32, 64, 96, 128, 160, 192, 224, 256, 288, 320, 352, 384, 416, 448, 480
// This shows all values for theta in 22.5 degree increments(just as an example. you can use any value from 0 - 512)
// 512 = 360 degrees = 0 degrees

// conversion from degrees to theta
// theta = (degrees / 360 ) * 512
// For example 87 degrees = (87 / 360 ) * 512 = 124 theta