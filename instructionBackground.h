
//{{BLOCK(instructionBackground)

//======================================================================
//
//	instructionBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 290 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9280 + 2048 = 11840
//
//	Time-stamp: 2020-04-04, 20:26:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONBACKGROUND_H
#define GRIT_INSTRUCTIONBACKGROUND_H

#define instructionBackgroundTilesLen 9280
extern const unsigned short instructionBackgroundTiles[4640];

#define instructionBackgroundMapLen 2048
extern const unsigned short instructionBackgroundMap[1024];

#define instructionBackgroundPalLen 512
extern const unsigned short instructionBackgroundPal[256];

#endif // GRIT_INSTRUCTIONBACKGROUND_H

//}}BLOCK(instructionBackground)
