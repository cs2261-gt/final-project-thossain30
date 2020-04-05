
//{{BLOCK(pauseBackground)

//======================================================================
//
//	pauseBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 104 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 3328 + 2048 = 5888
//
//	Time-stamp: 2020-04-04, 18:30:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBACKGROUND_H
#define GRIT_PAUSEBACKGROUND_H

#define pauseBackgroundTilesLen 3328
extern const unsigned short pauseBackgroundTiles[1664];

#define pauseBackgroundMapLen 2048
extern const unsigned short pauseBackgroundMap[1024];

#define pauseBackgroundPalLen 512
extern const unsigned short pauseBackgroundPal[256];

#endif // GRIT_PAUSEBACKGROUND_H

//}}BLOCK(pauseBackground)
