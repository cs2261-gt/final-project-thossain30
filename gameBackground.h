
//{{BLOCK(gameBackground)

//======================================================================
//
//	gameBackground, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 449 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 14368 + 8192 = 23072
//
//	Time-stamp: 2020-04-17, 14:00:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACKGROUND_H
#define GRIT_GAMEBACKGROUND_H

#define gameBackgroundTilesLen 14368
extern const unsigned short gameBackgroundTiles[7184];

#define gameBackgroundMapLen 8192
extern const unsigned short gameBackgroundMap[4096];

#define gameBackgroundPalLen 512
extern const unsigned short gameBackgroundPal[256];

#endif // GRIT_GAMEBACKGROUND_H

//}}BLOCK(gameBackground)
