
//{{BLOCK(UI)

//======================================================================
//
//	UI, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 16 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 512 + 2048 = 3072
//
//	Time-stamp: 2017-11-24, 17:35:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_UI_H
#define GRIT_UI_H

#define UITilesLen 512
extern const unsigned short UITiles[256];

#define UIMapLen 2048
extern const unsigned short UIMap[1024];

#define UIPalLen 512
extern const unsigned short UIPal[256];

#endif // GRIT_UI_H

//}}BLOCK(UI)
