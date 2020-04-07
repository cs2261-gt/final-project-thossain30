
//{{BLOCK(gameBackground)

//======================================================================
//
//	gameBackground, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 86 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 5504 + 4096 = 10112
//
//	Time-stamp: 2020-04-06, 22:43:33
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBACKGROUND_H
#define GRIT_GAMEBACKGROUND_H

#define gameBackgroundTilesLen 5504
extern const unsigned short gameBackgroundTiles[2752];

#define gameBackgroundMapLen 4096
extern const unsigned short gameBackgroundMap[2048];

#define gameBackgroundPalLen 512
extern const unsigned short gameBackgroundPal[256];

#endif // GRIT_GAMEBACKGROUND_H

//}}BLOCK(gameBackground)
