
//{{BLOCK(PauseScreen)

//======================================================================
//
//	PauseScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 539 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17248 + 2048 = 19808
//
//	Time-stamp: 2017-11-24, 19:31:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN_H
#define GRIT_PAUSESCREEN_H

#define PauseScreenTilesLen 17248
extern const unsigned short PauseScreenTiles[8624];

#define PauseScreenMapLen 2048
extern const unsigned short PauseScreenMap[1024];

#define PauseScreenPalLen 512
extern const unsigned short PauseScreenPal[256];

#endif // GRIT_PAUSESCREEN_H

//}}BLOCK(PauseScreen)
