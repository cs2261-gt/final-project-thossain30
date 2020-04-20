
//{{BLOCK(winBackground)

//======================================================================
//
//	winBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 339 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10848 + 2048 = 13408
//
//	Time-stamp: 2020-04-19, 04:32:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINBACKGROUND_H
#define GRIT_WINBACKGROUND_H

#define winBackgroundTilesLen 10848
extern const unsigned short winBackgroundTiles[5424];

#define winBackgroundMapLen 2048
extern const unsigned short winBackgroundMap[1024];

#define winBackgroundPalLen 512
extern const unsigned short winBackgroundPal[256];

#endif // GRIT_WINBACKGROUND_H

//}}BLOCK(winBackground)
