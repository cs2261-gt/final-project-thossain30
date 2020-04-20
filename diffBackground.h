
//{{BLOCK(diffBackground)

//======================================================================
//
//	diffBackground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 70 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2240 + 2048 = 4800
//
//	Time-stamp: 2020-04-20, 01:59:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_DIFFBACKGROUND_H
#define GRIT_DIFFBACKGROUND_H

#define diffBackgroundTilesLen 2240
extern const unsigned short diffBackgroundTiles[1120];

#define diffBackgroundMapLen 2048
extern const unsigned short diffBackgroundMap[1024];

#define diffBackgroundPalLen 512
extern const unsigned short diffBackgroundPal[256];

#endif // GRIT_DIFFBACKGROUND_H

//}}BLOCK(diffBackground)
