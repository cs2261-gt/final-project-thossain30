
//{{BLOCK(winBackground)

//======================================================================
//
//	winBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 45 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 1440 + 2048 = 4000
//
//	Time-stamp: 2020-04-04, 18:27:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINBACKGROUND_H
#define GRIT_WINBACKGROUND_H

#define winBackgroundTilesLen 1440
extern const unsigned short winBackgroundTiles[720];

#define winBackgroundMapLen 2048
extern const unsigned short winBackgroundMap[1024];

#define winBackgroundPalLen 512
extern const unsigned short winBackgroundPal[256];

#endif // GRIT_WINBACKGROUND_H

//}}BLOCK(winBackground)
