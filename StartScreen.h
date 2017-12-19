
//{{BLOCK(StartScreen)

//======================================================================
//
//	StartScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 560 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17920 + 2048 = 20480
//
//	Time-stamp: 2017-11-24, 20:01:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define StartScreenTilesLen 17920
extern const unsigned short StartScreenTiles[8960];

#define StartScreenMapLen 2048
extern const unsigned short StartScreenMap[1024];

#define StartScreenPalLen 512
extern const unsigned short StartScreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(StartScreen)
