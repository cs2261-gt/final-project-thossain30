
//{{BLOCK(MenuBackground)

//======================================================================
//
//	MenuBackground, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 346 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 22144 + 2048 = 24704
//
//	Time-stamp: 2020-04-06, 22:19:05
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MENUBACKGROUND_H
#define GRIT_MENUBACKGROUND_H

#define MenuBackgroundTilesLen 22144
extern const unsigned short MenuBackgroundTiles[11072];

#define MenuBackgroundMapLen 2048
extern const unsigned short MenuBackgroundMap[1024];

#define MenuBackgroundPalLen 512
extern const unsigned short MenuBackgroundPal[256];

#endif // GRIT_MENUBACKGROUND_H

//}}BLOCK(MenuBackground)
