
//{{BLOCK(EndScreen)

//======================================================================
//
//	EndScreen, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 952 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 30464 + 4096 = 35072
//
//	Time-stamp: 2017-11-27, 15:40:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ENDSCREEN_H
#define GRIT_ENDSCREEN_H

#define EndScreenTilesLen 30464
extern const unsigned short EndScreenTiles[15232];

#define EndScreenMapLen 4096
extern const unsigned short EndScreenMap[2048];

#define EndScreenPalLen 512
extern const unsigned short EndScreenPal[256];

#endif // GRIT_ENDSCREEN_H

//}}BLOCK(EndScreen)
